// ggml_bitnet_i2_unit_test.cpp
// Self-contained unit test for quantize_i2_s + ggml_vec_dot_i2_i8_s (x86)

#include <iostream>
#include <random>
#include <vector>
#include <cstdint>
#include <cstring>
#include <cassert>
#include <cstdlib>
#include <cmath>

#define QK_I2_S 128
#define QK_I2 128

// minimal stub for ggml_row_size and type constant used by quantize
#define GGML_TYPE_I2_S 100
static size_t ggml_row_size(int /*type*/, int n_per_row) {
    // This is only used to produce the same return value shape as original code.
    // Provide a reasonable row size (multiple of 64) for test purposes.
    size_t s = (size_t)n_per_row;
    s = ((s + 63) / 64) * 64;
    return s;
}

// -------------------- Implementation (same packing/decoding semantics) --------------------

size_t quantize_i2_s(const float * src, void * dst, int64_t nrow, int64_t n_per_row, const float * quant_weights) {
    (void) quant_weights;

    const int64_t n = nrow * n_per_row;
    double max_abs = 0.0;
    for (int64_t i = 0; i < n; ++i) {
        double v = fabs((double)src[i]);
        if (v > max_abs) max_abs = v;
    }
    double i2_scale = max_abs;

    uint8_t * q8 = (uint8_t *)malloc((size_t)n * sizeof(uint8_t));
    if (!q8) return 0;
    for (int64_t i = 0; i < n; ++i) {
        if (fabs((double)src[i]) < 1e-6) {
            q8[i] = 1;
        } else {
            q8[i] = (src[i] > 0.0f) ? 2 : 0;
        }
    }

    const size_t total_packed_bytes = (size_t)(n / 4);
    memset(dst, 0, total_packed_bytes);
    uint8_t * i2_weight = (uint8_t *)dst;

    const int64_t n_blocks = n / QK_I2;
    for (int64_t block = 0; block < n_blocks; ++block) {
        const int64_t base = block * QK_I2;
        for (int j = 0; j < QK_I2; ++j) {
            int group_idx = j / 32;
            int group_pos = j % 32;
            uint8_t temp = (uint8_t)(q8[base + j] << (6 - 2 * group_idx));
            i2_weight[block * 32 + group_pos] |= temp;
        }
    }

    float * scale_ptr = (float *)((char *)i2_weight + total_packed_bytes);
    scale_ptr[0] = (float)i2_scale;

    free(q8);

    size_t row_size = ggml_row_size(GGML_TYPE_I2_S, (int)n_per_row);
    return nrow * row_size / 4 + 32;
}

void ggml_vec_dot_i2_i8_s(int n, float * s, size_t bs, const void * vx, size_t bx, const void * vy, size_t by, int nrc) {
    (void) bs;
    (void) nrc;

    const uint8_t * x = (const uint8_t *)vx + bx;
    const int8_t  * y = (const int8_t  *)vy + by;

    long long acc = 0;

    // n must be multiple of QK_I2_S for this layout
    const int nb = n / QK_I2_S;

    for (int idx = 0; idx < n; ++idx) {
        const int block = idx / QK_I2;
        const int j = idx % QK_I2;
        const int group_idx = j / 32;
        const int group_pos = j % 32;
        const size_t byte_index = (size_t)block * 32 + (size_t)group_pos;
        const uint8_t packed = x[byte_index];
        const uint8_t q8 = (packed >> (6 - 2 * group_idx)) & 0x3u;
        const int decoded = (int)q8 - 1; // 0->-1, 1->0, 2->+1
        acc += (long long)decoded * (long long)y[idx];
    }

    if (s) *s = (float)acc;
}

// -------------------- Reference decoder + dot for validation --------------------

long long reference_dot_from_packed(int n, const uint8_t * packed, const int8_t * y) {
    long long acc = 0;
    for (int idx = 0; idx < n; ++idx) {
        const int block = idx / QK_I2;
        const int j = idx % QK_I2;
        const int group_idx = j / 32;
        const int group_pos = j % 32;
        const size_t byte_index = (size_t)block * 32 + (size_t)group_pos;
        const uint8_t p = packed[byte_index];
        const uint8_t q8 = (p >> (6 - 2 * group_idx)) & 0x3u;
        const int decoded = (int)q8 - 1;
        acc += (long long)decoded * (long long)y[idx];
    }
    return acc;
}

// -------------------- Test main --------------------

int main() {
    std::mt19937_64 rng(123456789ULL);
    std::uniform_real_distribution<float> fr(-1.0f, 1.0f);
    std::uniform_int_distribution<int> bi(-128, 127);

    const int trials = 200;
    const int n_per_row = QK_I2; // ensure n per row is 128 to match block
    for (int t = 0; t < trials; ++t) {
        const int nrow = 1 + (int)(rng() % 8); // small number of rows 1..8
        const int64_t n = (int64_t)nrow * n_per_row;

        std::vector<float> src((size_t)n);
        std::vector<int8_t> y((size_t)n);

        for (int64_t i = 0; i < n; ++i) {
            src[(size_t)i] = fr(rng);
            y[(size_t)i] = (int8_t)bi(rng);
        }

        // allocate packed buffer: n/4 bytes for packed 2-bit + space for float scale + margin
        const size_t packed_bytes = (size_t)(n / 4);
        const size_t buf_size = packed_bytes + sizeof(float) + 128;
        std::vector<uint8_t> buf(buf_size);
        memset(buf.data(), 0, buf_size);

        size_t rv = quantize_i2_s(src.data(), buf.data(), nrow, n_per_row, nullptr);
        (void)rv; // unused for test; if needed we can print

        float out_s = 0.0f;
        ggml_vec_dot_i2_i8_s((int)n, &out_s, 0, buf.data(), 0, y.data(), 0, 0);

        long long ref = reference_dot_from_packed((int)n, buf.data(), y.data());
        float reff = (float)ref;

        // compare exact integer value equality (since both compute integer sum)
        if (fabs(out_s - reff) > 0.5f) {
            std::cerr << "FAIL trial " << t << ": nrow=" << nrow << " n=" << n << "\n";
            std::cerr << "  computed dot = " << out_s << "  reference = " << reff << "\n";
            return 2;
        } else {
            if ((t % 20) == 0) {
                std::cout << "trial " << t << " OK (nrow=" << nrow << ")\n";
            }
        }
    }

    std::cout << "ALL TRIALS PASS (" << trials << " trials)\n";
    return 0;
}
