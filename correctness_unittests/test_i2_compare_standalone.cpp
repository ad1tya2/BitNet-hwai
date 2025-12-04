#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <vector>
#include <random>
#include <cstdint>
#include <cstring>
#include <iostream>
using namespace std;

#define QK_I2_S 128
#define QK_I2   128

// --- Simple scalar version (copied from your current ggml-bitnet-mad.cpp) ---

size_t quantize_i2_s_simple(const float * src, void * dst,
                            int64_t nrow, int64_t n_per_row,
                            const float * /*quant_weights*/) {
    const int64_t n = nrow * n_per_row;

    double max_abs = 0.0;
    for (int64_t i = 0; i < n; ++i) {
        double v = std::fabs((double) src[i]);
        if (v > max_abs) max_abs = v;
    }
    double i2_scale = max_abs;

    uint8_t * q8 = (uint8_t *) std::malloc((size_t) n * sizeof(uint8_t));
    if (!q8) return 0;
    for (int64_t i = 0; i < n; ++i) {
        if (std::fabs((double) src[i]) < 1e-6) {
            q8[i] = 1;
            continue;
        }
        q8[i] = (double) src[i] * i2_scale > 0 ? 2 : 0;
    }

    const size_t total_packed_bytes = (size_t) (n / 4);
    std::memset(dst, 0, total_packed_bytes);

    uint8_t * i2_weight = (uint8_t *) dst;

    const int64_t n_blocks = n / QK_I2;
    for (int64_t block = 0; block < n_blocks; ++block) {
        const int64_t base = block * QK_I2;
        for (int j = 0; j < QK_I2; ++j) {
            int group_idx = j / 32;
            int group_pos = j % 32;
            uint8_t temp = (uint8_t) (q8[base + j] << (6 - 2 * group_idx));
            i2_weight[block * 32 + group_pos] |= temp;
        }
    }

    float * scale_ptr = (float *) ((char *) i2_weight + total_packed_bytes);
    scale_ptr[0] = (float) i2_scale;

    std::free(q8);

    // row_size not important here; just return bytes used
    return total_packed_bytes + sizeof(float);
}

void ggml_vec_dot_i2_i8_s_simple(int n, float * s,
                                 const void * vx, const void * vy) {
    const uint8_t * x = (const uint8_t *) vx;
    const int8_t  * y = (const int8_t  *) vy;

    long long acc = 0;

    for (int idx = 0; idx < n; ++idx) {
        const int block = idx / QK_I2;
        const int j = idx % QK_I2;
        const int group_idx = j / 32;
        const int group_pos = j % 32;
        const size_t byte_index = (size_t) block * 32 + (size_t) group_pos;
        const uint8_t packed = x[byte_index];
        const uint8_t q8 = (packed >> (6 - 2 * group_idx)) & 0x3u;

        // simple version currently uses raw 0/1/2 codes (after our change)
        acc += (long long) q8 * (long long) y[idx];
    }

    if (s) *s = (float) acc;
}

// --- Complex/original reference version (logic from ggml-bitnet-mad copy.cpp) ---

size_t quantize_i2_s_ref(const float * src, void * dst,
                         int64_t nrow, int64_t n_per_row,
                         const float * /*quant_weights*/) {
    const int n = (int) (nrow * n_per_row);

    double max = 0;
    for (int i = 0; i < n; ++i) {
        max = fmax(max, (double) std::fabs((double) src[i]));
    }
    double i2_scale = max;

    uint8_t * q8 = (uint8_t *) std::malloc(n * sizeof(uint8_t));
    if (!q8) return 0;
    for (int i = 0; i < n; ++i) {
        if (std::fabs((double) src[i]) < 1e-6) {
            q8[i] = 1;
            continue;
        }
        q8[i] = (double) src[i] * i2_scale > 0 ? 2 : 0;
    }

    std::memset(dst, 0, n * sizeof(uint8_t) / 4);

    uint8_t * i2_weight = (uint8_t *) dst;
    for (int i = 0; i < n / QK_I2; i++) {
        for (int j = 0; j < QK_I2; j++) {
            int group_idx = j / 32;
            int group_pos = j % 32;
            uint8_t temp = (uint8_t) (q8[i * QK_I2 + j] << (6 - 2 * group_idx));
            i2_weight[i * 32 + group_pos] |= temp;
        }
    }

    float * scale_ptr = (float *) ((char *) i2_weight + n / 4);
    scale_ptr[0] = (float) i2_scale;

    std::free(q8);

    return (size_t) (n / 4 + sizeof(float));
}

   void ggml_vec_dot_i2_i8_s(int n, float * s, const void * vx,  const void * vy) {


    // original SIMD kernels ignore offsets and treat pointers as already
    // pointing to the start of the relevant block
    const uint8_t * x = (const uint8_t *) vx;
    const int8_t  * y = (const int8_t  *) vy;

    long long acc = 0;

    // total number of 128-element blocks
    const int nb = n / QK_I2_S; // same as original: nb = n / 128
    (void) nb;

    for (int idx = 0; idx < n; ++idx) {
        // decode the 2-bit q8 for element idx using the same layout as quantize
        const int block = idx / QK_I2;         // which 128-element block
        const int j = idx % QK_I2;             // position inside 128 block (0..127)
        const int group_idx = j / 32;          // 0..3
        const int group_pos = j % 32;          // 0..31
        const size_t byte_index = (size_t) block * 32 + (size_t) group_pos;
        const uint8_t packed = x[byte_index];
        const uint8_t q8 = (packed >> (6 - 2 * group_idx)) & 0x3u; // 2-bit value 0,1,2

        // original SIMD kernels operate directly on 0,1,2 codes without
        // mapping them to -1,0,1 here
        acc += (long long) q8 * (long long) y[idx];
        //normally and without long long see 
        if(q8 == 0){
        cout<<"q8: " << (uint8_t) q8 << ", y: " <<(int8_t)  y[idx] << "\n";
        cout << "q8: " << ((long long) q8) << ", y: " << (long long) y[idx] << "\n";
        exit(0);
        }
    }

    if (s) *s = (float) acc;
}

// --- Test harness comparing both ---

int main() {
    const int64_t nrow = 1;
    const int64_t n_per_row = 128 * 4; // a few blocks
    const int n = (int) (nrow * n_per_row);

    std::mt19937 rng(42);
    std::normal_distribution<float> dist(0.0f, 1.0f);

    std::vector<float> src(n);
    for (int i = 0; i < n; ++i) src[i] = dist(rng);

    std::vector<uint8_t> buf_simple(n / 4 + sizeof(float) + 64);
    std::vector<uint8_t> buf_ref   (n / 4 + sizeof(float) + 64);

    size_t used_simple = quantize_i2_s_simple(src.data(), buf_simple.data(),
                                              nrow, n_per_row, nullptr);
    size_t used_ref    = quantize_i2_s_ref   (src.data(), buf_ref.data(),
                                              nrow, n_per_row, nullptr);

    std::printf("bytes simple = %zu\n", used_simple);
    std::printf("bytes ref    = %zu\n", used_ref);

    std::vector<int8_t> y(n);
    std::uniform_int_distribution<int> dist_i8(-10, 10);
    for (int i = 0; i < n; ++i) y[i] = (int8_t) dist_i8(rng);

    float s_simple = 0.0f;
    float s_ref    = 0.0f;

    ggml_vec_dot_i2_i8_s_simple(n, &s_simple, buf_simple.data(), y.data());
    ggml_vec_dot_i2_i8_s  (n, &s_ref,    buf_ref.data(),    y.data());

    std::printf("dot_simple = %f\n", s_simple);
    std::printf("dot_ref    = %f\n", s_ref);

    const float diff = std::fabs(s_simple - s_ref);
    std::printf("abs diff   = %f\n", diff);

    if (diff > 1e-3f || used_simple != used_ref) {
        std::printf("MISMATCH larger than tolerance or size mismatch!\n");
        return 1;
    }

    std::printf("OK: simple and ref match within tolerance.\n");
    return 0;
}