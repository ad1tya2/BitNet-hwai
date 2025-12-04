// simple_bitnet_x86_tl2_repl.c
// Simple, unoptimized replacement for GGML_BITNET_X86_TL2 variant.
//
// Assumptions:
// - bitnet_float_type is float (adjust typedef if needed).
// - Weight storage expected by this replacement:
//     For ggml_preprocessor: B points to bs * (three_k + two_k) floats where each batch's weights
//     are contiguous and laid out row-major with m rows and k cols (k = three_k + two_k).
// - A passed to ggml_qgemm_lut is float array length bs * k (activations per batch).
// - C passed to ggml_qgemm_lut is float array length bs * m (outputs per batch).
// - This file preserves function signatures so it can be linked as a drop-in replacement.
// - It intentionally ignores SIMD, LUT packing, sign arrays, and BK micro-kernel variants.

#include <stdlib.h>
#include <string.h>
#include <stdint.h>

#ifndef bitnet_float_type
typedef float bitnet_float_type;
#endif

// Keep layout similar to original so tensor->extra usage stays compatible.
typedef struct {
    int lut_scales_size;
    int BK;            // kept for compatibility; unused in simple impl
    int n_tile_num;
    void* qweights;    // will point to plain float weights here
    bitnet_float_type* scales;
} bitnet_tensor_extra;

// Minimal defaults
#ifndef GGML_BITNET_MAX_NODES
#define GGML_BITNET_MAX_NODES 8192
#endif

static bitnet_tensor_extra * bitnet_tensor_extras = NULL;
static size_t bitnet_tensor_extras_index = 0;
static int bitnet_inited = 0;

// aligned malloc / free (simple)
static void * aligned_malloc(size_t size) {
#if defined(_WIN32)
    return _aligned_malloc(size, 64);
#else
    void * ptr = NULL;
    if (posix_memalign(&ptr, 64, size) != 0) return NULL;
    return ptr;
#endif
}
static void aligned_free(void * ptr) {
#if defined(_WIN32)
    _aligned_free(ptr);
#else
    free(ptr);
#endif
}

// Simple stub functions to keep API compatibility (they no-op or set trivial values)
int32_t per_tensor_quant(int k, void* lut_scales_, void* b_) {
    // trivial: set lut scale to 1.0 for each call (user should provide dequantized floats)
    if (lut_scales_) {
        bitnet_float_type* ls = (bitnet_float_type*)lut_scales_;
        *ls = (bitnet_float_type)1.0f;
    }
    (void)k; (void)b_;
    return 0;
}
int32_t partial_max_reset(int32_t bs, void* lut_scales_) {
    if (!lut_scales_) return 0;
    bitnet_float_type* ls = (bitnet_float_type*)lut_scales_;
    for (int i = 0; i < bs; ++i) ls[i] = 0.0f;
    return 0;
}

// ---------------------------
// Simple preprocessor
// ---------------------------
// Copies float weights per-batch into Three_QLUT and Two_QLUT (if provided) and
// writes simple LUT_Scales values (1.0) into LUT_Scales[bs].
// B layout expected: for each batch b (0..bs-1) B[b * (three_k + two_k) + 0 .. (three_k + two_k)-1]
// contains the float weights concatenated (first three_k floats then two_k floats).
// Three_QLUT and Two_QLUT must have enough space allocated by the caller.
// This keeps the same call signature as original.
void ggml_preprocessor(int bs, int m, int three_k, int two_k, void* B, void* LUT_Scales, void* Three_QLUT, void* Two_QLUT) {
    if (bs <= 0 || !B || !LUT_Scales) return;

    // initialize pool lazily
    if (!bitnet_inited) {
        bitnet_tensor_extras = (bitnet_tensor_extra*) malloc(sizeof(bitnet_tensor_extra) * GGML_BITNET_MAX_NODES);
        if (!bitnet_tensor_extras) return;
        memset(bitnet_tensor_extras, 0, sizeof(bitnet_tensor_extra) * GGML_BITNET_MAX_NODES);
        bitnet_inited = 1;
        bitnet_tensor_extras_index = 0;
    }

    float* b_f = (float*)B;
    float* lut_scales_f = (float*)LUT_Scales;

    int k_total = three_k + two_k;
    // For each batch entry, copy weights into provided QLUT buffers and set lut_scales to 1.0f
    for (int b = 0; b < bs; ++b) {
        float* B_batch = b_f + (size_t)b * (size_t)k_total;
        lut_scales_f[b] = 1.0f; // trivial scale

        if (Three_QLUT) {
            // copy three_k floats for this batch if present
            if (three_k > 0) {
                float* dest = ((float*)Three_QLUT) + (size_t)b * (size_t)three_k;
                memcpy(dest, B_batch, (size_t)three_k * sizeof(float));
            }
        }
        if (Two_QLUT) {
            // copy two_k floats for this batch (after three_k) if present
            if (two_k > 0) {
                float* dest2 = ((float*)Two_QLUT) + (size_t)b * (size_t)two_k;
                memcpy(dest2, B_batch + three_k, (size_t)two_k * sizeof(float));
            }
        }
    }
}

// ---------------------------
// Simple ggml_qgemm_lut
// ---------------------------
// Very simple batched mat-vector multiply.
// Signature kept: ggml_qgemm_lut(int bs, int m, int k, int BK, void* A, void* sign, void* LUT, void* Scales, void* LUT_Scales, void* C)
// - A: float[bs * k] (activations per batch, contiguous per batch: A[b*k + col])
// - LUT: float[m * k] OR (if Three/Two QLUT were used) the caller should pass the concatenated weights.
// - Scales: float[1] (global scale), LUT_Scales: float[bs] (per-batch lut scale).
// - C: float[bs * m] output (C[b*m + row])
// BK and sign are ignored (kept for compatibility).
void ggml_qgemm_lut(int bs, int m, int k, int BK, void* A, void* sign, void* LUT, void* Scales, void* LUT_Scales, void* C) {
    (void)BK;
    (void)sign;

    if (bs <= 0 || m <= 0 || k <= 0 || !A || !LUT || !C || !LUT_Scales) return;

    float* a_f = (float*)A;
    float* w_f = (float*)LUT;
    float* c_f = (float*)C;
    float scale = 1.0f;
    if (Scales) scale = ((float*)Scales)[0];
    float* lut_scales = (float*)LUT_Scales;

    // assume LUT is laid out as: for each row r in 0..m-1, w_row has k floats: index = r*k + col
    // and A is laid out per-batch: A[b*k + col]
    for (int b = 0; b < bs; ++b) {
        float* a_batch = a_f + (size_t)b * (size_t)k;
        float ls = lut_scales[b];
        if (ls == 0.0f) ls = 1.0f; // avoid div zero
        float recip = 1.0f / ls;
        for (int row = 0; row < m; ++row) {
            size_t base = (size_t)row * (size_t)k;
            double sum = 0.0; // use double accumulator for a tiny bit more accuracy
            for (int col = 0; col < k; ++col) {
                sum += (double)w_f[base + col] * (double)a_batch[col];
            }
            float out = (float)( (sum * (double)recip) * (double)scale );
            c_f[(size_t)b * (size_t)m + (size_t)row] = out;
        }
    }
}

// ---------------------------
// Simple ggml_bitnet_transform_tensor
// ---------------------------
// This copies dequantized float weights out of tensor->data into an allocated float buffer
// and stores pointer+scale in tensor->extra (keeps layout used earlier: lut_scales_size, BK, n_tile_num, qweights, scales).
// This function expects tensor->data points to contiguous float array of size k*m.
struct ggml_tensor_min {
    int ne[2];      // ne[0] = k, ne[1] = m
    void* data;
    int type;
    int backend;
    void* extra;
};
void ggml_bitnet_transform_tensor(struct ggml_tensor * tensor) {
    if (!tensor) return;
    // If the real project declares ggml_tensor differently, this will still access the same fields.
    // Keep the same guard logic as original by checking extra == nullptr (we assume compatible layout).
    // We'll be conservative: if tensor->extra already set, skip.
    if (tensor->extra != NULL) return;

    // lazy pool init
    if (!bitnet_inited) {
        bitnet_tensor_extras = (bitnet_tensor_extra*) malloc(sizeof(bitnet_tensor_extra) * GGML_BITNET_MAX_NODES);
        if (!bitnet_tensor_extras) return;
        memset(bitnet_tensor_extras, 0, sizeof(bitnet_tensor_extra) * GGML_BITNET_MAX_NODES);
        bitnet_inited = 1;
        bitnet_tensor_extras_index = 0;
    }

    int k = tensor->ne[0];
    int m = tensor->ne[1];
    if (k <= 0 || m <= 0) return;

    // allocate scales and copy weights into float buffer
    bitnet_float_type* scales = (bitnet_float_type*) aligned_malloc(sizeof(bitnet_float_type));
    if (!scales) return;
    scales[0] = 1.0f;

    size_t n_elems = (size_t)m * (size_t)k;
    bitnet_float_type* weights_copy = (bitnet_float_type*) aligned_malloc(n_elems * sizeof(bitnet_float_type));
    if (!weights_copy) {
        aligned_free(scales);
        return;
    }

    // assume tensor->data points to float array of length m*k
    memcpy(weights_copy, tensor->data, n_elems * sizeof(bitnet_float_type));

    if (bitnet_tensor_extras_index >= GGML_BITNET_MAX_NODES) {
        aligned_free(weights_copy);
        aligned_free(scales);
        return;
    }

    // register in extras pool (fill minimal compatible fields)
    bitnet_tensor_extras[bitnet_tensor_extras_index].lut_scales_size = 1;
    bitnet_tensor_extras[bitnet_tensor_extras_index].BK = 0;
    bitnet_tensor_extras[bitnet_tensor_extras_index].n_tile_num = 1;
    bitnet_tensor_extras[bitnet_tensor_extras_index].qweights = (void*)weights_copy;
    bitnet_tensor_extras[bitnet_tensor_extras_index].scales = scales;

    // set tensor->extra to point to our registered entry
    tensor->extra = &bitnet_tensor_extras[bitnet_tensor_extras_index];
    bitnet_tensor_extras_index++;
}

// End of simple replacement file.
