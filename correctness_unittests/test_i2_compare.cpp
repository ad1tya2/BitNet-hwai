#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <vector>
#include <random>
#include <cstdint>

#include "ggml-bitnet.h"
#include "ggml-quants.h"

// Declarations for the two implementations we want to compare.
// Simple scalar version (current main file)
extern "C" size_t quantize_i2_s(const float * src, void * dst, int64_t nrow, int64_t n_per_row, const float * quant_weights);
extern "C" void ggml_vec_dot_i2_i8_s(int n, float * s, size_t bs, const void * vx, size_t bx, const void * vy, size_t by, int nrc);

// Original complex version in the copy file, renamed symbols (assumed added there)
extern "C" size_t quantize_i2_s_ref(const float * src, void * dst, int64_t nrow, int64_t n_per_row, const float * quant_weights);
extern "C" void ggml_vec_dot_i2_i8_s_ref(int n, float * s, size_t bs, const void * vx, size_t bx, const void * vy, size_t by, int nrc);

int main() {
    const int64_t nrow = 1;
    const int64_t n_per_row = 128 * 4; // a few blocks
    const int n = (int)(nrow * n_per_row);

    std::mt19937 rng(1234);
    std::normal_distribution<float> dist(0.0f, 1.0f);

    std::vector<float> src(n);
    for (int i = 0; i < n; ++i) src[i] = dist(rng);

    // allocate enough space for quantized data (over-allocate a bit)
    std::vector<uint8_t> buf_simple(4 * n);
    std::vector<uint8_t> buf_ref(4 * n);

    size_t used_simple = quantize_i2_s(src.data(), buf_simple.data(), nrow, n_per_row, nullptr);
    size_t used_ref    = quantize_i2_s_ref(src.data(), buf_ref.data(), nrow, n_per_row, nullptr);

    if (used_simple != used_ref) {
        std::printf("row_size mismatch: simple=%zu ref=%zu\n", used_simple, used_ref);
    }

    // Build a random int8 vector for dot products
    std::vector<int8_t> y(n);
    std::uniform_int_distribution<int> dist_i8(-10, 10);
    for (int i = 0; i < n; ++i) y[i] = (int8_t)dist_i8(rng);

    float s_simple = 0.0f;
    float s_ref    = 0.0f;

    ggml_vec_dot_i2_i8_s(n, &s_simple, 0, buf_simple.data(), 0, y.data(), 0, 0);
    ggml_vec_dot_i2_i8_s_ref(n, &s_ref, 0, buf_ref.data(), 0, y.data(), 0, 0);

    std::printf("dot_simple = %f\n", s_simple);
    std::printf("dot_ref    = %f\n", s_ref);

    const float diff = std::fabs(s_simple - s_ref);
    std::printf("abs diff   = %f\n", diff);

    // Treat small integer mismatches as failure indicator 0/1
    if (diff > 1e-3f) {
        std::printf("MISMATCH larger than tolerance!\n");
        return 1;
    }

    std::printf("OK: simple and ref match within tolerance.\n");
    return 0;
}
