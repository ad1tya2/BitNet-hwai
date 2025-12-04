// ggml-bitnet-mad-scalar.cpp
// Scalar implementation that preserves the original packing / decoding logic.

#include <vector>
#include <type_traits>

#include "ggml-bitnet.h"
#include "ggml-quants.h"
#include <cmath>
#include <cstring>
#include <cstdint>
#include <cstdlib>
// for size_t and malloc/memset when compiled as C++
#include <cstddef>
#include<iostream>
#include <set>
using namespace std;
#define QK_I2_S 128
#define QK_I2 128

std::set<int> seen;

size_t quantize_i2_s(const float * src, void * dst, int64_t nrow, int64_t n_per_row, const float * quant_weights) {
    (void) quant_weights; // unused in this routine, kept for API compatibility

    // total number of elements
    const int64_t n = nrow * n_per_row;

    // compute global max abs (same as original)
    double max_abs = 0.0;
    for (int64_t i = 0; i < n; ++i) {
        double v = fabs((double) src[i]);
        if (v > max_abs) max_abs = v;
    }
    double i2_scale = max_abs;

    // build q8 array (values 0,1,2 as in original)
    uint8_t * q8 = (uint8_t *) malloc((size_t) n * sizeof(uint8_t));
    if (!q8) return 0;
    for (int64_t i = 0; i < n; ++i) {
        if (fabs((double) src[i]) < 1e-6) {
            q8[i] = 1;
            continue;
        }
        // original: q8[i] = (double)src[i] * i2_scale > 0 ? 2 : 0;
        q8[i] = (double) src[i] * i2_scale > 0 ? 2 : 0;
    }

    // zero output buffer for packed bytes: total packed bytes = n / 4
    // (since 4 values per byte overall when packing 2 bits each)
    const size_t total_packed_bytes = (size_t) (n / 4); // original used this
    std::memset(dst, 0, total_packed_bytes);

    uint8_t * i2_weight = (uint8_t *) dst;

    // Pack following original loops
    const int64_t n_blocks = n / QK_I2; // number of 128-element blocks
    for (int64_t block = 0; block < n_blocks; ++block) {
        const int64_t base = block * QK_I2;
        for (int j = 0; j < QK_I2; ++j) {
            int group_idx = j / 32;       // 0..3
            int group_pos = j % 32;       // 0..31
            uint8_t temp = (uint8_t) (q8[base + j] << (6 - 2 * group_idx));
            i2_weight[block * 32 + group_pos] |= temp;
        }
    }

    // write the global scale float at offset (char*)i2_weight + n/4 (same as original)
    float * scale_ptr = (float *) ((char *) i2_weight + total_packed_bytes);
    scale_ptr[0] = (float) i2_scale;

    free(q8);

    // match original return: nrow * row_size / 4 + 32 (32B for alignment)
    size_t row_size = ggml_row_size(GGML_TYPE_I2_S, n_per_row);
    return nrow * row_size / 4 + 32;
}

// Scalar decoder/dot product that follows the packing above.
// Decodes q8 for element index idx from x layout and multiplies with y[idx].
void ggml_vec_dot_i2_i8_s(int n, float * s, size_t bs, const void * vx, size_t bx, const void * vy, size_t by, int nrc) {
    (void) bs;
    (void) bx;
    (void) by;
    (void) nrc;

     if (seen.insert(n).second) {  // true if n was not already in the set
            std::cout << "New n: " << n << '\n';
        }
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
    }

    if (s) *s = (float) acc;
}
