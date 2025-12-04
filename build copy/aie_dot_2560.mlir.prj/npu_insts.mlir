module {
  aie.device(npu1) {
    %tile_0_2 = aie.tile(0, 2) {controller_id = #aie.packet_info<pkt_type = 0, pkt_id = 27>}
    %tile_0_3 = aie.tile(0, 3) {controller_id = #aie.packet_info<pkt_type = 0, pkt_id = 29>}
    %tile_0_4 = aie.tile(0, 4) {controller_id = #aie.packet_info<pkt_type = 0, pkt_id = 30>}
    %tile_0_5 = aie.tile(0, 5) {controller_id = #aie.packet_info<pkt_type = 0, pkt_id = 31>}
    %shim_noc_tile_0_0 = aie.tile(0, 0) {controller_id = #aie.packet_info<pkt_type = 0, pkt_id = 15>}
    %shim_noc_tile_1_0 = aie.tile(1, 0) {controller_id = #aie.packet_info<pkt_type = 0, pkt_id = 15>}
    %shim_noc_tile_2_0 = aie.tile(2, 0) {controller_id = #aie.packet_info<pkt_type = 0, pkt_id = 15>}
    %shim_noc_tile_3_0 = aie.tile(3, 0) {controller_id = #aie.packet_info<pkt_type = 0, pkt_id = 15>}
    %out_3_cons_prod_lock_0 = aie.lock(%shim_noc_tile_1_0, 6) {init = 0 : i32, sym_name = "out_3_cons_prod_lock_0"}
    %out_3_cons_cons_lock_0 = aie.lock(%shim_noc_tile_1_0, 7) {init = 0 : i32, sym_name = "out_3_cons_cons_lock_0"}
    %out_3_buff_0 = aie.buffer(%tile_0_5) {address = 3584 : i32, mem_bank = 0 : i32, sym_name = "out_3_buff_0"} : memref<1xf32> 
    %out_3_buff_1 = aie.buffer(%tile_0_5) {address = 18944 : i32, mem_bank = 1 : i32, sym_name = "out_3_buff_1"} : memref<1xf32> 
    %out_3_prod_lock_0 = aie.lock(%tile_0_5, 4) {init = 2 : i32, sym_name = "out_3_prod_lock_0"}
    %out_3_cons_lock_0 = aie.lock(%tile_0_5, 5) {init = 0 : i32, sym_name = "out_3_cons_lock_0"}
    %out_2_cons_prod_lock_0 = aie.lock(%shim_noc_tile_1_0, 4) {init = 0 : i32, sym_name = "out_2_cons_prod_lock_0"}
    %out_2_cons_cons_lock_0 = aie.lock(%shim_noc_tile_1_0, 5) {init = 0 : i32, sym_name = "out_2_cons_cons_lock_0"}
    %out_2_buff_0 = aie.buffer(%tile_0_4) {address = 3584 : i32, mem_bank = 0 : i32, sym_name = "out_2_buff_0"} : memref<1xf32> 
    %out_2_buff_1 = aie.buffer(%tile_0_4) {address = 18944 : i32, mem_bank = 1 : i32, sym_name = "out_2_buff_1"} : memref<1xf32> 
    %out_2_prod_lock_0 = aie.lock(%tile_0_4, 4) {init = 2 : i32, sym_name = "out_2_prod_lock_0"}
    %out_2_cons_lock_0 = aie.lock(%tile_0_4, 5) {init = 0 : i32, sym_name = "out_2_cons_lock_0"}
    %out_1_cons_prod_lock_0 = aie.lock(%shim_noc_tile_0_0, 6) {init = 0 : i32, sym_name = "out_1_cons_prod_lock_0"}
    %out_1_cons_cons_lock_0 = aie.lock(%shim_noc_tile_0_0, 7) {init = 0 : i32, sym_name = "out_1_cons_cons_lock_0"}
    %out_1_buff_0 = aie.buffer(%tile_0_3) {address = 3584 : i32, mem_bank = 0 : i32, sym_name = "out_1_buff_0"} : memref<1xf32> 
    %out_1_buff_1 = aie.buffer(%tile_0_3) {address = 18944 : i32, mem_bank = 1 : i32, sym_name = "out_1_buff_1"} : memref<1xf32> 
    %out_1_prod_lock_0 = aie.lock(%tile_0_3, 4) {init = 2 : i32, sym_name = "out_1_prod_lock_0"}
    %out_1_cons_lock_0 = aie.lock(%tile_0_3, 5) {init = 0 : i32, sym_name = "out_1_cons_lock_0"}
    %out_0_cons_prod_lock_0 = aie.lock(%shim_noc_tile_0_0, 4) {init = 0 : i32, sym_name = "out_0_cons_prod_lock_0"}
    %out_0_cons_cons_lock_0 = aie.lock(%shim_noc_tile_0_0, 5) {init = 0 : i32, sym_name = "out_0_cons_cons_lock_0"}
    %out_0_buff_0 = aie.buffer(%tile_0_2) {address = 3584 : i32, mem_bank = 0 : i32, sym_name = "out_0_buff_0"} : memref<1xf32> 
    %out_0_buff_1 = aie.buffer(%tile_0_2) {address = 18944 : i32, mem_bank = 1 : i32, sym_name = "out_0_buff_1"} : memref<1xf32> 
    %out_0_prod_lock_0 = aie.lock(%tile_0_2, 4) {init = 2 : i32, sym_name = "out_0_prod_lock_0"}
    %out_0_cons_lock_0 = aie.lock(%tile_0_2, 5) {init = 0 : i32, sym_name = "out_0_cons_lock_0"}
    %in2_3_cons_buff_0 = aie.buffer(%tile_0_5) {address = 1024 : i32, mem_bank = 0 : i32, sym_name = "in2_3_cons_buff_0"} : memref<2560xi8> 
    %in2_3_cons_buff_1 = aie.buffer(%tile_0_5) {address = 16384 : i32, mem_bank = 1 : i32, sym_name = "in2_3_cons_buff_1"} : memref<2560xi8> 
    %in2_3_cons_prod_lock_0 = aie.lock(%tile_0_5, 2) {init = 2 : i32, sym_name = "in2_3_cons_prod_lock_0"}
    %in2_3_cons_cons_lock_0 = aie.lock(%tile_0_5, 3) {init = 0 : i32, sym_name = "in2_3_cons_cons_lock_0"}
    %in2_3_prod_lock_0 = aie.lock(%shim_noc_tile_3_0, 2) {init = 0 : i32, sym_name = "in2_3_prod_lock_0"}
    %in2_3_cons_lock_0 = aie.lock(%shim_noc_tile_3_0, 3) {init = 0 : i32, sym_name = "in2_3_cons_lock_0"}
    %in2_2_cons_buff_0 = aie.buffer(%tile_0_4) {address = 1024 : i32, mem_bank = 0 : i32, sym_name = "in2_2_cons_buff_0"} : memref<2560xi8> 
    %in2_2_cons_buff_1 = aie.buffer(%tile_0_4) {address = 16384 : i32, mem_bank = 1 : i32, sym_name = "in2_2_cons_buff_1"} : memref<2560xi8> 
    %in2_2_cons_prod_lock_0 = aie.lock(%tile_0_4, 2) {init = 2 : i32, sym_name = "in2_2_cons_prod_lock_0"}
    %in2_2_cons_cons_lock_0 = aie.lock(%tile_0_4, 3) {init = 0 : i32, sym_name = "in2_2_cons_cons_lock_0"}
    %in2_2_prod_lock_0 = aie.lock(%shim_noc_tile_3_0, 0) {init = 0 : i32, sym_name = "in2_2_prod_lock_0"}
    %in2_2_cons_lock_0 = aie.lock(%shim_noc_tile_3_0, 1) {init = 0 : i32, sym_name = "in2_2_cons_lock_0"}
    %in2_1_cons_buff_0 = aie.buffer(%tile_0_3) {address = 1024 : i32, mem_bank = 0 : i32, sym_name = "in2_1_cons_buff_0"} : memref<2560xi8> 
    %in2_1_cons_buff_1 = aie.buffer(%tile_0_3) {address = 16384 : i32, mem_bank = 1 : i32, sym_name = "in2_1_cons_buff_1"} : memref<2560xi8> 
    %in2_1_cons_prod_lock_0 = aie.lock(%tile_0_3, 2) {init = 2 : i32, sym_name = "in2_1_cons_prod_lock_0"}
    %in2_1_cons_cons_lock_0 = aie.lock(%tile_0_3, 3) {init = 0 : i32, sym_name = "in2_1_cons_cons_lock_0"}
    %in2_1_prod_lock_0 = aie.lock(%shim_noc_tile_2_0, 2) {init = 0 : i32, sym_name = "in2_1_prod_lock_0"}
    %in2_1_cons_lock_0 = aie.lock(%shim_noc_tile_2_0, 3) {init = 0 : i32, sym_name = "in2_1_cons_lock_0"}
    %in2_0_cons_buff_0 = aie.buffer(%tile_0_2) {address = 1024 : i32, mem_bank = 0 : i32, sym_name = "in2_0_cons_buff_0"} : memref<2560xi8> 
    %in2_0_cons_buff_1 = aie.buffer(%tile_0_2) {address = 16384 : i32, mem_bank = 1 : i32, sym_name = "in2_0_cons_buff_1"} : memref<2560xi8> 
    %in2_0_cons_prod_lock_0 = aie.lock(%tile_0_2, 2) {init = 2 : i32, sym_name = "in2_0_cons_prod_lock_0"}
    %in2_0_cons_cons_lock_0 = aie.lock(%tile_0_2, 3) {init = 0 : i32, sym_name = "in2_0_cons_cons_lock_0"}
    %in2_0_prod_lock_0 = aie.lock(%shim_noc_tile_2_0, 0) {init = 0 : i32, sym_name = "in2_0_prod_lock_0"}
    %in2_0_cons_lock_0 = aie.lock(%shim_noc_tile_2_0, 1) {init = 0 : i32, sym_name = "in2_0_cons_lock_0"}
    %in1_3_cons_buff_0 = aie.buffer(%tile_0_5) {address = 32768 : i32, mem_bank = 2 : i32, sym_name = "in1_3_cons_buff_0"} : memref<640xui8> 
    %in1_3_cons_buff_1 = aie.buffer(%tile_0_5) {address = 49152 : i32, mem_bank = 3 : i32, sym_name = "in1_3_cons_buff_1"} : memref<640xui8> 
    %in1_3_cons_prod_lock_0 = aie.lock(%tile_0_5, 0) {init = 2 : i32, sym_name = "in1_3_cons_prod_lock_0"}
    %in1_3_cons_cons_lock_0 = aie.lock(%tile_0_5, 1) {init = 0 : i32, sym_name = "in1_3_cons_cons_lock_0"}
    %in1_3_prod_lock_0 = aie.lock(%shim_noc_tile_1_0, 2) {init = 0 : i32, sym_name = "in1_3_prod_lock_0"}
    %in1_3_cons_lock_0 = aie.lock(%shim_noc_tile_1_0, 3) {init = 0 : i32, sym_name = "in1_3_cons_lock_0"}
    %in1_2_cons_buff_0 = aie.buffer(%tile_0_4) {address = 32768 : i32, mem_bank = 2 : i32, sym_name = "in1_2_cons_buff_0"} : memref<640xui8> 
    %in1_2_cons_buff_1 = aie.buffer(%tile_0_4) {address = 49152 : i32, mem_bank = 3 : i32, sym_name = "in1_2_cons_buff_1"} : memref<640xui8> 
    %in1_2_cons_prod_lock_0 = aie.lock(%tile_0_4, 0) {init = 2 : i32, sym_name = "in1_2_cons_prod_lock_0"}
    %in1_2_cons_cons_lock_0 = aie.lock(%tile_0_4, 1) {init = 0 : i32, sym_name = "in1_2_cons_cons_lock_0"}
    %in1_2_prod_lock_0 = aie.lock(%shim_noc_tile_1_0, 0) {init = 0 : i32, sym_name = "in1_2_prod_lock_0"}
    %in1_2_cons_lock_0 = aie.lock(%shim_noc_tile_1_0, 1) {init = 0 : i32, sym_name = "in1_2_cons_lock_0"}
    %in1_1_cons_buff_0 = aie.buffer(%tile_0_3) {address = 32768 : i32, mem_bank = 2 : i32, sym_name = "in1_1_cons_buff_0"} : memref<640xui8> 
    %in1_1_cons_buff_1 = aie.buffer(%tile_0_3) {address = 49152 : i32, mem_bank = 3 : i32, sym_name = "in1_1_cons_buff_1"} : memref<640xui8> 
    %in1_1_cons_prod_lock_0 = aie.lock(%tile_0_3, 0) {init = 2 : i32, sym_name = "in1_1_cons_prod_lock_0"}
    %in1_1_cons_cons_lock_0 = aie.lock(%tile_0_3, 1) {init = 0 : i32, sym_name = "in1_1_cons_cons_lock_0"}
    %in1_1_prod_lock_0 = aie.lock(%shim_noc_tile_0_0, 2) {init = 0 : i32, sym_name = "in1_1_prod_lock_0"}
    %in1_1_cons_lock_0 = aie.lock(%shim_noc_tile_0_0, 3) {init = 0 : i32, sym_name = "in1_1_cons_lock_0"}
    %in1_0_cons_buff_0 = aie.buffer(%tile_0_2) {address = 32768 : i32, mem_bank = 2 : i32, sym_name = "in1_0_cons_buff_0"} : memref<640xui8> 
    %in1_0_cons_buff_1 = aie.buffer(%tile_0_2) {address = 49152 : i32, mem_bank = 3 : i32, sym_name = "in1_0_cons_buff_1"} : memref<640xui8> 
    %in1_0_cons_prod_lock_0 = aie.lock(%tile_0_2, 0) {init = 2 : i32, sym_name = "in1_0_cons_prod_lock_0"}
    %in1_0_cons_cons_lock_0 = aie.lock(%tile_0_2, 1) {init = 0 : i32, sym_name = "in1_0_cons_cons_lock_0"}
    %in1_0_prod_lock_0 = aie.lock(%shim_noc_tile_0_0, 0) {init = 0 : i32, sym_name = "in1_0_prod_lock_0"}
    %in1_0_cons_lock_0 = aie.lock(%shim_noc_tile_0_0, 1) {init = 0 : i32, sym_name = "in1_0_cons_lock_0"}
    func.func private @dot_product_i2_i8_2560(memref<640xui8>, memref<2560xi8>, memref<1xf32>)
    %core_0_2 = aie.core(%tile_0_2) {
      aie.end
    } {elf_file = "/notebooks/aditya.shankar/hwai-proj-mlir-aie/programming_examples/basic/dot_product/build/aie_dot_2560.mlir.prj/main_core_0_2.elf", link_with = "dot.o"}
    %core_0_3 = aie.core(%tile_0_3) {
      aie.end
    } {elf_file = "/notebooks/aditya.shankar/hwai-proj-mlir-aie/programming_examples/basic/dot_product/build/aie_dot_2560.mlir.prj/main_core_0_3.elf", link_with = "dot.o"}
    %core_0_4 = aie.core(%tile_0_4) {
      aie.end
    } {elf_file = "/notebooks/aditya.shankar/hwai-proj-mlir-aie/programming_examples/basic/dot_product/build/aie_dot_2560.mlir.prj/main_core_0_4.elf", link_with = "dot.o"}
    %core_0_5 = aie.core(%tile_0_5) {
      aie.end
    } {elf_file = "/notebooks/aditya.shankar/hwai-proj-mlir-aie/programming_examples/basic/dot_product/build/aie_dot_2560.mlir.prj/main_core_0_5.elf", link_with = "dot.o"}
    memref.global "private" constant @blockwrite_data_0 : memref<8xi32> = dense<[160, 0, 0, 0, -2147483648, 33554432, 0, 33554432]>
    memref.global "private" constant @blockwrite_data_1 : memref<8xi32> = dense<[640, 0, 0, 0, -2147483648, 33554432, 0, 33554432]>
    memref.global "private" constant @blockwrite_data_2 : memref<8xi32> = dense<[160, 640, 0, 0, -2147483648, 33554432, 0, 33554432]>
    memref.global "private" constant @blockwrite_data_3 : memref<8xi32> = dense<[640, 2560, 0, 0, -2147483648, 33554432, 0, 33554432]>
    memref.global "private" constant @blockwrite_data_4 : memref<8xi32> = dense<[160, 1280, 0, 0, -2147483648, 33554432, 0, 33554432]>
    memref.global "private" constant @blockwrite_data_5 : memref<8xi32> = dense<[640, 5120, 0, 0, -2147483648, 33554432, 0, 33554432]>
    memref.global "private" constant @blockwrite_data_6 : memref<8xi32> = dense<[160, 1920, 0, 0, -2147483648, 33554432, 0, 33554432]>
    memref.global "private" constant @blockwrite_data_7 : memref<8xi32> = dense<[640, 7680, 0, 0, -2147483648, 33554432, 0, 33554432]>
    memref.global "private" constant @blockwrite_data_8 : memref<8xi32> = dense<[1, 0, 0, 0, -2147483648, 33554432, 0, 33554432]>
    memref.global "private" constant @blockwrite_data_9 : memref<8xi32> = dense<[1, 4, 0, 0, -2147483648, 33554432, 0, 33554432]>
    memref.global "private" constant @blockwrite_data_10 : memref<8xi32> = dense<[1, 8, 0, 0, -2147483648, 33554432, 0, 33554432]>
    memref.global "private" constant @blockwrite_data_11 : memref<8xi32> = dense<[1, 12, 0, 0, -2147483648, 33554432, 0, 33554432]>
    aiex.runtime_sequence(%arg0: memref<2560xui8>, %arg1: memref<10240xi8>, %arg2: memref<4xf32>) {
      %0 = memref.get_global @blockwrite_data_0 : memref<8xi32>
      aiex.npu.blockwrite(%0) {address = 118784 : ui32} : memref<8xi32>
      aiex.npu.address_patch {addr = 118788 : ui32, arg_idx = 0 : i32, arg_plus = 0 : i32}
      aiex.npu.write32 {address = 119316 : ui32, value = 0 : ui32}
      %1 = memref.get_global @blockwrite_data_1 : memref<8xi32>
      aiex.npu.blockwrite(%1) {address = 67227648 : ui32} : memref<8xi32>
      aiex.npu.address_patch {addr = 67227652 : ui32, arg_idx = 1 : i32, arg_plus = 0 : i32}
      aiex.npu.write32 {address = 67228180 : ui32, value = 0 : ui32}
      %2 = memref.get_global @blockwrite_data_2 : memref<8xi32>
      aiex.npu.blockwrite(%2) {address = 118816 : ui32} : memref<8xi32>
      aiex.npu.address_patch {addr = 118820 : ui32, arg_idx = 0 : i32, arg_plus = 640 : i32}
      aiex.npu.write32 {address = 119324 : ui32, value = 1 : ui32}
      %3 = memref.get_global @blockwrite_data_3 : memref<8xi32>
      aiex.npu.blockwrite(%3) {address = 67227680 : ui32} : memref<8xi32>
      aiex.npu.address_patch {addr = 67227684 : ui32, arg_idx = 1 : i32, arg_plus = 2560 : i32}
      aiex.npu.write32 {address = 67228188 : ui32, value = 1 : ui32}
      %4 = memref.get_global @blockwrite_data_4 : memref<8xi32>
      aiex.npu.blockwrite(%4) {address = 33673216 : ui32} : memref<8xi32>
      aiex.npu.address_patch {addr = 33673220 : ui32, arg_idx = 0 : i32, arg_plus = 1280 : i32}
      aiex.npu.write32 {address = 33673748 : ui32, value = 0 : ui32}
      %5 = memref.get_global @blockwrite_data_5 : memref<8xi32>
      aiex.npu.blockwrite(%5) {address = 100782080 : ui32} : memref<8xi32>
      aiex.npu.address_patch {addr = 100782084 : ui32, arg_idx = 1 : i32, arg_plus = 5120 : i32}
      aiex.npu.write32 {address = 100782612 : ui32, value = 0 : ui32}
      %6 = memref.get_global @blockwrite_data_6 : memref<8xi32>
      aiex.npu.blockwrite(%6) {address = 33673248 : ui32} : memref<8xi32>
      aiex.npu.address_patch {addr = 33673252 : ui32, arg_idx = 0 : i32, arg_plus = 1920 : i32}
      aiex.npu.write32 {address = 33673756 : ui32, value = 1 : ui32}
      %7 = memref.get_global @blockwrite_data_7 : memref<8xi32>
      aiex.npu.blockwrite(%7) {address = 100782112 : ui32} : memref<8xi32>
      aiex.npu.address_patch {addr = 100782116 : ui32, arg_idx = 1 : i32, arg_plus = 7680 : i32}
      aiex.npu.write32 {address = 100782620 : ui32, value = 1 : ui32}
      %8 = memref.get_global @blockwrite_data_8 : memref<8xi32>
      aiex.npu.blockwrite(%8) {address = 118848 : ui32} : memref<8xi32>
      aiex.npu.address_patch {addr = 118852 : ui32, arg_idx = 2 : i32, arg_plus = 0 : i32}
      aiex.npu.maskwrite32 {address = 119296 : ui32, mask = 7936 : ui32, value = 3840 : ui32}
      aiex.npu.write32 {address = 119300 : ui32, value = 2147483650 : ui32}
      %9 = memref.get_global @blockwrite_data_9 : memref<8xi32>
      aiex.npu.blockwrite(%9) {address = 118880 : ui32} : memref<8xi32>
      aiex.npu.address_patch {addr = 118884 : ui32, arg_idx = 2 : i32, arg_plus = 4 : i32}
      aiex.npu.maskwrite32 {address = 119304 : ui32, mask = 7936 : ui32, value = 3840 : ui32}
      aiex.npu.write32 {address = 119308 : ui32, value = 2147483651 : ui32}
      %10 = memref.get_global @blockwrite_data_10 : memref<8xi32>
      aiex.npu.blockwrite(%10) {address = 33673280 : ui32} : memref<8xi32>
      aiex.npu.address_patch {addr = 33673284 : ui32, arg_idx = 2 : i32, arg_plus = 8 : i32}
      aiex.npu.maskwrite32 {address = 33673728 : ui32, mask = 7936 : ui32, value = 3840 : ui32}
      aiex.npu.write32 {address = 33673732 : ui32, value = 2147483650 : ui32}
      %11 = memref.get_global @blockwrite_data_11 : memref<8xi32>
      aiex.npu.blockwrite(%11) {address = 33673312 : ui32} : memref<8xi32>
      aiex.npu.address_patch {addr = 33673316 : ui32, arg_idx = 2 : i32, arg_plus = 12 : i32}
      aiex.npu.maskwrite32 {address = 33673736 : ui32, mask = 7936 : ui32, value = 3840 : ui32}
      aiex.npu.write32 {address = 33673740 : ui32, value = 2147483651 : ui32}
      aiex.npu.sync {channel = 0 : i32, column = 0 : i32, column_num = 1 : i32, direction = 0 : i32, row = 0 : i32, row_num = 1 : i32}
      aiex.npu.sync {channel = 1 : i32, column = 0 : i32, column_num = 1 : i32, direction = 0 : i32, row = 0 : i32, row_num = 1 : i32}
      aiex.npu.sync {channel = 0 : i32, column = 1 : i32, column_num = 1 : i32, direction = 0 : i32, row = 0 : i32, row_num = 1 : i32}
      aiex.npu.sync {channel = 1 : i32, column = 1 : i32, column_num = 1 : i32, direction = 0 : i32, row = 0 : i32, row_num = 1 : i32}
    }
    aie.shim_dma_allocation @in1_0_shim_alloc(MM2S, 0, 0)
    %mem_0_2 = aie.mem(%tile_0_2) {
      %0 = aie.dma_start(S2MM, 0, ^bb1, ^bb3)
    ^bb1:  // 2 preds: ^bb0, ^bb2
      aie.use_lock(%in1_0_cons_prod_lock_0, AcquireGreaterEqual, 1)
      aie.dma_bd(%in1_0_cons_buff_0 : memref<640xui8>, 0, 640) {bd_id = 0 : i32, next_bd_id = 1 : i32}
      aie.use_lock(%in1_0_cons_cons_lock_0, Release, 1)
      aie.next_bd ^bb2
    ^bb2:  // pred: ^bb1
      aie.use_lock(%in1_0_cons_prod_lock_0, AcquireGreaterEqual, 1)
      aie.dma_bd(%in1_0_cons_buff_1 : memref<640xui8>, 0, 640) {bd_id = 1 : i32, next_bd_id = 0 : i32}
      aie.use_lock(%in1_0_cons_cons_lock_0, Release, 1)
      aie.next_bd ^bb1
    ^bb3:  // pred: ^bb0
      %1 = aie.dma_start(S2MM, 1, ^bb4, ^bb6)
    ^bb4:  // 2 preds: ^bb3, ^bb5
      aie.use_lock(%in2_0_cons_prod_lock_0, AcquireGreaterEqual, 1)
      aie.dma_bd(%in2_0_cons_buff_0 : memref<2560xi8>, 0, 2560) {bd_id = 2 : i32, next_bd_id = 3 : i32}
      aie.use_lock(%in2_0_cons_cons_lock_0, Release, 1)
      aie.next_bd ^bb5
    ^bb5:  // pred: ^bb4
      aie.use_lock(%in2_0_cons_prod_lock_0, AcquireGreaterEqual, 1)
      aie.dma_bd(%in2_0_cons_buff_1 : memref<2560xi8>, 0, 2560) {bd_id = 3 : i32, next_bd_id = 2 : i32}
      aie.use_lock(%in2_0_cons_cons_lock_0, Release, 1)
      aie.next_bd ^bb4
    ^bb6:  // pred: ^bb3
      %2 = aie.dma_start(MM2S, 0, ^bb7, ^bb9)
    ^bb7:  // 2 preds: ^bb6, ^bb8
      aie.use_lock(%out_0_cons_lock_0, AcquireGreaterEqual, 1)
      aie.dma_bd(%out_0_buff_0 : memref<1xf32>, 0, 1) {bd_id = 4 : i32, next_bd_id = 5 : i32}
      aie.use_lock(%out_0_prod_lock_0, Release, 1)
      aie.next_bd ^bb8
    ^bb8:  // pred: ^bb7
      aie.use_lock(%out_0_cons_lock_0, AcquireGreaterEqual, 1)
      aie.dma_bd(%out_0_buff_1 : memref<1xf32>, 0, 1) {bd_id = 5 : i32, next_bd_id = 4 : i32}
      aie.use_lock(%out_0_prod_lock_0, Release, 1)
      aie.next_bd ^bb7
    ^bb9:  // pred: ^bb6
      aie.end
    }
    aie.shim_dma_allocation @in1_1_shim_alloc(MM2S, 1, 0)
    %mem_0_3 = aie.mem(%tile_0_3) {
      %0 = aie.dma_start(S2MM, 0, ^bb1, ^bb3)
    ^bb1:  // 2 preds: ^bb0, ^bb2
      aie.use_lock(%in1_1_cons_prod_lock_0, AcquireGreaterEqual, 1)
      aie.dma_bd(%in1_1_cons_buff_0 : memref<640xui8>, 0, 640) {bd_id = 0 : i32, next_bd_id = 1 : i32}
      aie.use_lock(%in1_1_cons_cons_lock_0, Release, 1)
      aie.next_bd ^bb2
    ^bb2:  // pred: ^bb1
      aie.use_lock(%in1_1_cons_prod_lock_0, AcquireGreaterEqual, 1)
      aie.dma_bd(%in1_1_cons_buff_1 : memref<640xui8>, 0, 640) {bd_id = 1 : i32, next_bd_id = 0 : i32}
      aie.use_lock(%in1_1_cons_cons_lock_0, Release, 1)
      aie.next_bd ^bb1
    ^bb3:  // pred: ^bb0
      %1 = aie.dma_start(S2MM, 1, ^bb4, ^bb6)
    ^bb4:  // 2 preds: ^bb3, ^bb5
      aie.use_lock(%in2_1_cons_prod_lock_0, AcquireGreaterEqual, 1)
      aie.dma_bd(%in2_1_cons_buff_0 : memref<2560xi8>, 0, 2560) {bd_id = 2 : i32, next_bd_id = 3 : i32}
      aie.use_lock(%in2_1_cons_cons_lock_0, Release, 1)
      aie.next_bd ^bb5
    ^bb5:  // pred: ^bb4
      aie.use_lock(%in2_1_cons_prod_lock_0, AcquireGreaterEqual, 1)
      aie.dma_bd(%in2_1_cons_buff_1 : memref<2560xi8>, 0, 2560) {bd_id = 3 : i32, next_bd_id = 2 : i32}
      aie.use_lock(%in2_1_cons_cons_lock_0, Release, 1)
      aie.next_bd ^bb4
    ^bb6:  // pred: ^bb3
      %2 = aie.dma_start(MM2S, 0, ^bb7, ^bb9)
    ^bb7:  // 2 preds: ^bb6, ^bb8
      aie.use_lock(%out_1_cons_lock_0, AcquireGreaterEqual, 1)
      aie.dma_bd(%out_1_buff_0 : memref<1xf32>, 0, 1) {bd_id = 4 : i32, next_bd_id = 5 : i32}
      aie.use_lock(%out_1_prod_lock_0, Release, 1)
      aie.next_bd ^bb8
    ^bb8:  // pred: ^bb7
      aie.use_lock(%out_1_cons_lock_0, AcquireGreaterEqual, 1)
      aie.dma_bd(%out_1_buff_1 : memref<1xf32>, 0, 1) {bd_id = 5 : i32, next_bd_id = 4 : i32}
      aie.use_lock(%out_1_prod_lock_0, Release, 1)
      aie.next_bd ^bb7
    ^bb9:  // pred: ^bb6
      aie.end
    }
    aie.shim_dma_allocation @in1_2_shim_alloc(MM2S, 0, 1)
    %mem_0_4 = aie.mem(%tile_0_4) {
      %0 = aie.dma_start(S2MM, 0, ^bb1, ^bb3)
    ^bb1:  // 2 preds: ^bb0, ^bb2
      aie.use_lock(%in1_2_cons_prod_lock_0, AcquireGreaterEqual, 1)
      aie.dma_bd(%in1_2_cons_buff_0 : memref<640xui8>, 0, 640) {bd_id = 0 : i32, next_bd_id = 1 : i32}
      aie.use_lock(%in1_2_cons_cons_lock_0, Release, 1)
      aie.next_bd ^bb2
    ^bb2:  // pred: ^bb1
      aie.use_lock(%in1_2_cons_prod_lock_0, AcquireGreaterEqual, 1)
      aie.dma_bd(%in1_2_cons_buff_1 : memref<640xui8>, 0, 640) {bd_id = 1 : i32, next_bd_id = 0 : i32}
      aie.use_lock(%in1_2_cons_cons_lock_0, Release, 1)
      aie.next_bd ^bb1
    ^bb3:  // pred: ^bb0
      %1 = aie.dma_start(S2MM, 1, ^bb4, ^bb6)
    ^bb4:  // 2 preds: ^bb3, ^bb5
      aie.use_lock(%in2_2_cons_prod_lock_0, AcquireGreaterEqual, 1)
      aie.dma_bd(%in2_2_cons_buff_0 : memref<2560xi8>, 0, 2560) {bd_id = 2 : i32, next_bd_id = 3 : i32}
      aie.use_lock(%in2_2_cons_cons_lock_0, Release, 1)
      aie.next_bd ^bb5
    ^bb5:  // pred: ^bb4
      aie.use_lock(%in2_2_cons_prod_lock_0, AcquireGreaterEqual, 1)
      aie.dma_bd(%in2_2_cons_buff_1 : memref<2560xi8>, 0, 2560) {bd_id = 3 : i32, next_bd_id = 2 : i32}
      aie.use_lock(%in2_2_cons_cons_lock_0, Release, 1)
      aie.next_bd ^bb4
    ^bb6:  // pred: ^bb3
      %2 = aie.dma_start(MM2S, 0, ^bb7, ^bb9)
    ^bb7:  // 2 preds: ^bb6, ^bb8
      aie.use_lock(%out_2_cons_lock_0, AcquireGreaterEqual, 1)
      aie.dma_bd(%out_2_buff_0 : memref<1xf32>, 0, 1) {bd_id = 4 : i32, next_bd_id = 5 : i32}
      aie.use_lock(%out_2_prod_lock_0, Release, 1)
      aie.next_bd ^bb8
    ^bb8:  // pred: ^bb7
      aie.use_lock(%out_2_cons_lock_0, AcquireGreaterEqual, 1)
      aie.dma_bd(%out_2_buff_1 : memref<1xf32>, 0, 1) {bd_id = 5 : i32, next_bd_id = 4 : i32}
      aie.use_lock(%out_2_prod_lock_0, Release, 1)
      aie.next_bd ^bb7
    ^bb9:  // pred: ^bb6
      aie.end
    }
    aie.shim_dma_allocation @in1_3_shim_alloc(MM2S, 1, 1)
    %mem_0_5 = aie.mem(%tile_0_5) {
      %0 = aie.dma_start(S2MM, 0, ^bb1, ^bb3)
    ^bb1:  // 2 preds: ^bb0, ^bb2
      aie.use_lock(%in1_3_cons_prod_lock_0, AcquireGreaterEqual, 1)
      aie.dma_bd(%in1_3_cons_buff_0 : memref<640xui8>, 0, 640) {bd_id = 0 : i32, next_bd_id = 1 : i32}
      aie.use_lock(%in1_3_cons_cons_lock_0, Release, 1)
      aie.next_bd ^bb2
    ^bb2:  // pred: ^bb1
      aie.use_lock(%in1_3_cons_prod_lock_0, AcquireGreaterEqual, 1)
      aie.dma_bd(%in1_3_cons_buff_1 : memref<640xui8>, 0, 640) {bd_id = 1 : i32, next_bd_id = 0 : i32}
      aie.use_lock(%in1_3_cons_cons_lock_0, Release, 1)
      aie.next_bd ^bb1
    ^bb3:  // pred: ^bb0
      %1 = aie.dma_start(S2MM, 1, ^bb4, ^bb6)
    ^bb4:  // 2 preds: ^bb3, ^bb5
      aie.use_lock(%in2_3_cons_prod_lock_0, AcquireGreaterEqual, 1)
      aie.dma_bd(%in2_3_cons_buff_0 : memref<2560xi8>, 0, 2560) {bd_id = 2 : i32, next_bd_id = 3 : i32}
      aie.use_lock(%in2_3_cons_cons_lock_0, Release, 1)
      aie.next_bd ^bb5
    ^bb5:  // pred: ^bb4
      aie.use_lock(%in2_3_cons_prod_lock_0, AcquireGreaterEqual, 1)
      aie.dma_bd(%in2_3_cons_buff_1 : memref<2560xi8>, 0, 2560) {bd_id = 3 : i32, next_bd_id = 2 : i32}
      aie.use_lock(%in2_3_cons_cons_lock_0, Release, 1)
      aie.next_bd ^bb4
    ^bb6:  // pred: ^bb3
      %2 = aie.dma_start(MM2S, 0, ^bb7, ^bb9)
    ^bb7:  // 2 preds: ^bb6, ^bb8
      aie.use_lock(%out_3_cons_lock_0, AcquireGreaterEqual, 1)
      aie.dma_bd(%out_3_buff_0 : memref<1xf32>, 0, 1) {bd_id = 4 : i32, next_bd_id = 5 : i32}
      aie.use_lock(%out_3_prod_lock_0, Release, 1)
      aie.next_bd ^bb8
    ^bb8:  // pred: ^bb7
      aie.use_lock(%out_3_cons_lock_0, AcquireGreaterEqual, 1)
      aie.dma_bd(%out_3_buff_1 : memref<1xf32>, 0, 1) {bd_id = 5 : i32, next_bd_id = 4 : i32}
      aie.use_lock(%out_3_prod_lock_0, Release, 1)
      aie.next_bd ^bb7
    ^bb9:  // pred: ^bb6
      aie.end
    }
    aie.shim_dma_allocation @in2_0_shim_alloc(MM2S, 0, 2)
    aie.shim_dma_allocation @in2_1_shim_alloc(MM2S, 1, 2)
    aie.shim_dma_allocation @in2_2_shim_alloc(MM2S, 0, 3)
    aie.shim_dma_allocation @in2_3_shim_alloc(MM2S, 1, 3)
    aie.shim_dma_allocation @out_0_shim_alloc(S2MM, 0, 0)
    aie.shim_dma_allocation @out_1_shim_alloc(S2MM, 1, 0)
    aie.shim_dma_allocation @out_2_shim_alloc(S2MM, 0, 1)
    aie.shim_dma_allocation @out_3_shim_alloc(S2MM, 1, 1)
    aie.packet_flow(15) {
      aie.packet_source<%shim_noc_tile_0_0, TileControl : 0>
      aie.packet_dest<%shim_noc_tile_0_0, South : 0>
    } {keep_pkt_header = true, priority_route = true}
    aie.packet_flow(15) {
      aie.packet_source<%shim_noc_tile_1_0, TileControl : 0>
      aie.packet_dest<%shim_noc_tile_1_0, South : 0>
    } {keep_pkt_header = true, priority_route = true}
    aie.packet_flow(15) {
      aie.packet_source<%shim_noc_tile_2_0, TileControl : 0>
      aie.packet_dest<%shim_noc_tile_2_0, South : 0>
    } {keep_pkt_header = true, priority_route = true}
    aie.packet_flow(15) {
      aie.packet_source<%shim_noc_tile_3_0, TileControl : 0>
      aie.packet_dest<%shim_noc_tile_3_0, South : 0>
    } {keep_pkt_header = true, priority_route = true}
    %switchbox_0_0 = aie.switchbox(%shim_noc_tile_0_0) {
      aie.connect<South : 3, North : 1>
      aie.connect<South : 7, North : 2>
      aie.connect<East : 2, North : 4>
      aie.connect<East : 1, North : 5>
      aie.connect<East : 0, North : 3>
      aie.connect<North : 1, South : 2>
      aie.connect<North : 2, South : 3>
      aie.connect<North : 3, East : 3>
      %0 = aie.amsel<5> (3)
      %1 = aie.masterset(South : 0, %0) {keep_pkt_header = true}
      aie.packet_rules(TileControl : 0) {
        aie.rule(31, 15, %0)
      }
    }
    %shim_mux_0_0 = aie.shim_mux(%shim_noc_tile_0_0) {
      aie.connect<DMA : 0, North : 3>
      aie.connect<DMA : 1, North : 7>
      aie.connect<North : 2, DMA : 0>
      aie.connect<North : 3, DMA : 1>
    }
    %mem_tile_0_1 = aie.tile(0, 1)
    %switchbox_0_1 = aie.switchbox(%mem_tile_0_1) {
      aie.connect<South : 1, North : 1>
      aie.connect<South : 2, North : 2>
      aie.connect<South : 4, North : 4>
      aie.connect<South : 5, North : 5>
      aie.connect<South : 3, North : 3>
      aie.connect<North : 1, South : 1>
      aie.connect<North : 2, South : 2>
      aie.connect<North : 3, South : 3>
    }
    %switchbox_0_2 = aie.switchbox(%tile_0_2) {
      aie.connect<South : 1, DMA : 0>
      aie.connect<South : 2, North : 0>
      aie.connect<South : 4, DMA : 1>
      aie.connect<South : 5, North : 1>
      aie.connect<South : 3, North : 3>
      aie.connect<DMA : 0, South : 1>
      aie.connect<North : 1, South : 2>
      aie.connect<North : 0, South : 3>
    }
    %switchbox_0_3 = aie.switchbox(%tile_0_3) {
      aie.connect<South : 0, DMA : 0>
      aie.connect<East : 0, North : 3>
      aie.connect<South : 1, DMA : 1>
      aie.connect<South : 3, North : 2>
      aie.connect<DMA : 0, South : 1>
      aie.connect<North : 1, South : 0>
    }
    %switchbox_0_4 = aie.switchbox(%tile_0_4) {
      aie.connect<East : 3, DMA : 0>
      aie.connect<South : 3, North : 3>
      aie.connect<South : 2, DMA : 1>
      aie.connect<East : 2, North : 0>
      aie.connect<DMA : 0, South : 1>
      aie.connect<North : 0, East : 0>
    }
    %switchbox_1_0 = aie.switchbox(%shim_noc_tile_1_0) {
      aie.connect<South : 3, North : 1>
      aie.connect<South : 7, North : 5>
      aie.connect<East : 2, West : 2>
      aie.connect<East : 1, West : 1>
      aie.connect<East : 3, West : 0>
      aie.connect<East : 0, North : 4>
      aie.connect<West : 3, South : 2>
      aie.connect<North : 2, South : 3>
      %0 = aie.amsel<5> (3)
      %1 = aie.masterset(South : 0, %0) {keep_pkt_header = true}
      aie.packet_rules(TileControl : 0) {
        aie.rule(31, 15, %0)
      }
    }
    %shim_mux_1_0 = aie.shim_mux(%shim_noc_tile_1_0) {
      aie.connect<DMA : 0, North : 3>
      aie.connect<DMA : 1, North : 7>
      aie.connect<North : 2, DMA : 0>
      aie.connect<North : 3, DMA : 1>
    }
    %mem_tile_1_1 = aie.tile(1, 1)
    %switchbox_1_1 = aie.switchbox(%mem_tile_1_1) {
      aie.connect<South : 1, North : 1>
      aie.connect<South : 5, North : 5>
      aie.connect<South : 4, North : 4>
      aie.connect<North : 2, South : 2>
    }
    %tile_1_2 = aie.tile(1, 2)
    %switchbox_1_2 = aie.switchbox(%tile_1_2) {
      aie.connect<South : 1, North : 5>
      aie.connect<South : 5, North : 1>
      aie.connect<South : 4, North : 4>
      aie.connect<North : 1, South : 2>
    }
    %tile_1_3 = aie.tile(1, 3)
    %switchbox_1_3 = aie.switchbox(%tile_1_3) {
      aie.connect<South : 5, North : 4>
      aie.connect<South : 1, West : 0>
      aie.connect<South : 4, North : 2>
      aie.connect<North : 3, South : 1>
    }
    %tile_1_4 = aie.tile(1, 4)
    %switchbox_1_4 = aie.switchbox(%tile_1_4) {
      aie.connect<South : 4, West : 3>
      aie.connect<South : 2, West : 2>
      aie.connect<West : 0, South : 3>
    }
    %switchbox_0_5 = aie.switchbox(%tile_0_5) {
      aie.connect<South : 3, DMA : 0>
      aie.connect<South : 0, DMA : 1>
      aie.connect<DMA : 0, South : 0>
    }
    %switchbox_2_0 = aie.switchbox(%shim_noc_tile_2_0) {
      aie.connect<South : 3, West : 2>
      aie.connect<South : 7, West : 1>
      aie.connect<East : 3, West : 3>
      aie.connect<East : 2, West : 0>
      %0 = aie.amsel<5> (3)
      %1 = aie.masterset(South : 0, %0) {keep_pkt_header = true}
      aie.packet_rules(TileControl : 0) {
        aie.rule(31, 15, %0)
      }
    }
    %shim_mux_2_0 = aie.shim_mux(%shim_noc_tile_2_0) {
      aie.connect<DMA : 0, North : 3>
      aie.connect<DMA : 1, North : 7>
    }
    %switchbox_3_0 = aie.switchbox(%shim_noc_tile_3_0) {
      aie.connect<South : 3, West : 3>
      aie.connect<South : 7, West : 2>
      %0 = aie.amsel<5> (3)
      %1 = aie.masterset(South : 0, %0) {keep_pkt_header = true}
      aie.packet_rules(TileControl : 0) {
        aie.rule(31, 15, %0)
      }
    }
    %shim_mux_3_0 = aie.shim_mux(%shim_noc_tile_3_0) {
      aie.connect<DMA : 0, North : 3>
      aie.connect<DMA : 1, North : 7>
    }
    aie.wire(%shim_mux_0_0 : North, %switchbox_0_0 : South)
    aie.wire(%shim_noc_tile_0_0 : DMA, %shim_mux_0_0 : DMA)
    aie.wire(%mem_tile_0_1 : Core, %switchbox_0_1 : Core)
    aie.wire(%mem_tile_0_1 : DMA, %switchbox_0_1 : DMA)
    aie.wire(%switchbox_0_0 : North, %switchbox_0_1 : South)
    aie.wire(%tile_0_2 : Core, %switchbox_0_2 : Core)
    aie.wire(%tile_0_2 : DMA, %switchbox_0_2 : DMA)
    aie.wire(%switchbox_0_1 : North, %switchbox_0_2 : South)
    aie.wire(%tile_0_3 : Core, %switchbox_0_3 : Core)
    aie.wire(%tile_0_3 : DMA, %switchbox_0_3 : DMA)
    aie.wire(%switchbox_0_2 : North, %switchbox_0_3 : South)
    aie.wire(%tile_0_4 : Core, %switchbox_0_4 : Core)
    aie.wire(%tile_0_4 : DMA, %switchbox_0_4 : DMA)
    aie.wire(%switchbox_0_3 : North, %switchbox_0_4 : South)
    aie.wire(%tile_0_5 : Core, %switchbox_0_5 : Core)
    aie.wire(%tile_0_5 : DMA, %switchbox_0_5 : DMA)
    aie.wire(%switchbox_0_4 : North, %switchbox_0_5 : South)
    aie.wire(%switchbox_0_0 : East, %switchbox_1_0 : West)
    aie.wire(%shim_mux_1_0 : North, %switchbox_1_0 : South)
    aie.wire(%shim_noc_tile_1_0 : DMA, %shim_mux_1_0 : DMA)
    aie.wire(%switchbox_0_1 : East, %switchbox_1_1 : West)
    aie.wire(%mem_tile_1_1 : Core, %switchbox_1_1 : Core)
    aie.wire(%mem_tile_1_1 : DMA, %switchbox_1_1 : DMA)
    aie.wire(%switchbox_1_0 : North, %switchbox_1_1 : South)
    aie.wire(%switchbox_0_2 : East, %switchbox_1_2 : West)
    aie.wire(%tile_1_2 : Core, %switchbox_1_2 : Core)
    aie.wire(%tile_1_2 : DMA, %switchbox_1_2 : DMA)
    aie.wire(%switchbox_1_1 : North, %switchbox_1_2 : South)
    aie.wire(%switchbox_0_3 : East, %switchbox_1_3 : West)
    aie.wire(%tile_1_3 : Core, %switchbox_1_3 : Core)
    aie.wire(%tile_1_3 : DMA, %switchbox_1_3 : DMA)
    aie.wire(%switchbox_1_2 : North, %switchbox_1_3 : South)
    aie.wire(%switchbox_0_4 : East, %switchbox_1_4 : West)
    aie.wire(%tile_1_4 : Core, %switchbox_1_4 : Core)
    aie.wire(%tile_1_4 : DMA, %switchbox_1_4 : DMA)
    aie.wire(%switchbox_1_3 : North, %switchbox_1_4 : South)
    aie.wire(%switchbox_1_0 : East, %switchbox_2_0 : West)
    aie.wire(%shim_mux_2_0 : North, %switchbox_2_0 : South)
    aie.wire(%shim_noc_tile_2_0 : DMA, %shim_mux_2_0 : DMA)
    aie.wire(%switchbox_2_0 : East, %switchbox_3_0 : West)
    aie.wire(%shim_mux_3_0 : North, %switchbox_3_0 : South)
    aie.wire(%shim_noc_tile_3_0 : DMA, %shim_mux_3_0 : DMA)
  }
}
