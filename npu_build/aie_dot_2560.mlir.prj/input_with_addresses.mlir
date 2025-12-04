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
    aie.flow(%shim_noc_tile_0_0, DMA : 0, %tile_0_2, DMA : 0)
    aie.flow(%shim_noc_tile_0_0, DMA : 1, %tile_0_3, DMA : 0)
    aie.flow(%shim_noc_tile_1_0, DMA : 0, %tile_0_4, DMA : 0)
    aie.flow(%shim_noc_tile_1_0, DMA : 1, %tile_0_5, DMA : 0)
    aie.flow(%shim_noc_tile_2_0, DMA : 0, %tile_0_2, DMA : 1)
    aie.flow(%shim_noc_tile_2_0, DMA : 1, %tile_0_3, DMA : 1)
    aie.flow(%shim_noc_tile_3_0, DMA : 0, %tile_0_4, DMA : 1)
    aie.flow(%shim_noc_tile_3_0, DMA : 1, %tile_0_5, DMA : 1)
    aie.flow(%tile_0_2, DMA : 0, %shim_noc_tile_0_0, DMA : 0)
    aie.flow(%tile_0_3, DMA : 0, %shim_noc_tile_0_0, DMA : 1)
    aie.flow(%tile_0_4, DMA : 0, %shim_noc_tile_1_0, DMA : 0)
    aie.flow(%tile_0_5, DMA : 0, %shim_noc_tile_1_0, DMA : 1)
    func.func private @dot_product_i2_i8_2560(memref<640xui8>, memref<2560xi8>, memref<1xf32>)
    %core_0_2 = aie.core(%tile_0_2) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      %c9223372036854775806 = arith.constant 9223372036854775806 : index
      %c2 = arith.constant 2 : index
      cf.br ^bb1(%c0 : index)
    ^bb1(%0: index):  // 2 preds: ^bb0, ^bb2
      %1 = arith.cmpi slt, %0, %c9223372036854775806 : index
      cf.cond_br %1, ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      aie.use_lock(%in1_0_cons_cons_lock_0, AcquireGreaterEqual, 1)
      aie.use_lock(%in2_0_cons_cons_lock_0, AcquireGreaterEqual, 1)
      aie.use_lock(%out_0_prod_lock_0, AcquireGreaterEqual, 1)
      func.call @dot_product_i2_i8_2560(%in1_0_cons_buff_0, %in2_0_cons_buff_0, %out_0_buff_0) : (memref<640xui8>, memref<2560xi8>, memref<1xf32>) -> ()
      aie.use_lock(%in1_0_cons_prod_lock_0, Release, 1)
      aie.use_lock(%in2_0_cons_prod_lock_0, Release, 1)
      aie.use_lock(%out_0_cons_lock_0, Release, 1)
      aie.use_lock(%in1_0_cons_cons_lock_0, AcquireGreaterEqual, 1)
      aie.use_lock(%in2_0_cons_cons_lock_0, AcquireGreaterEqual, 1)
      aie.use_lock(%out_0_prod_lock_0, AcquireGreaterEqual, 1)
      func.call @dot_product_i2_i8_2560(%in1_0_cons_buff_1, %in2_0_cons_buff_1, %out_0_buff_1) : (memref<640xui8>, memref<2560xi8>, memref<1xf32>) -> ()
      aie.use_lock(%in1_0_cons_prod_lock_0, Release, 1)
      aie.use_lock(%in2_0_cons_prod_lock_0, Release, 1)
      aie.use_lock(%out_0_cons_lock_0, Release, 1)
      %2 = arith.addi %0, %c2 : index
      cf.br ^bb1(%2 : index)
    ^bb3:  // pred: ^bb1
      aie.use_lock(%in1_0_cons_cons_lock_0, AcquireGreaterEqual, 1)
      aie.use_lock(%in2_0_cons_cons_lock_0, AcquireGreaterEqual, 1)
      aie.use_lock(%out_0_prod_lock_0, AcquireGreaterEqual, 1)
      func.call @dot_product_i2_i8_2560(%in1_0_cons_buff_0, %in2_0_cons_buff_0, %out_0_buff_0) : (memref<640xui8>, memref<2560xi8>, memref<1xf32>) -> ()
      aie.use_lock(%in1_0_cons_prod_lock_0, Release, 1)
      aie.use_lock(%in2_0_cons_prod_lock_0, Release, 1)
      aie.use_lock(%out_0_cons_lock_0, Release, 1)
      aie.end
    } {link_with = "dot.o"}
    %core_0_3 = aie.core(%tile_0_3) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      %c9223372036854775806 = arith.constant 9223372036854775806 : index
      %c2 = arith.constant 2 : index
      cf.br ^bb1(%c0 : index)
    ^bb1(%0: index):  // 2 preds: ^bb0, ^bb2
      %1 = arith.cmpi slt, %0, %c9223372036854775806 : index
      cf.cond_br %1, ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      aie.use_lock(%in1_1_cons_cons_lock_0, AcquireGreaterEqual, 1)
      aie.use_lock(%in2_1_cons_cons_lock_0, AcquireGreaterEqual, 1)
      aie.use_lock(%out_1_prod_lock_0, AcquireGreaterEqual, 1)
      func.call @dot_product_i2_i8_2560(%in1_1_cons_buff_0, %in2_1_cons_buff_0, %out_1_buff_0) : (memref<640xui8>, memref<2560xi8>, memref<1xf32>) -> ()
      aie.use_lock(%in1_1_cons_prod_lock_0, Release, 1)
      aie.use_lock(%in2_1_cons_prod_lock_0, Release, 1)
      aie.use_lock(%out_1_cons_lock_0, Release, 1)
      aie.use_lock(%in1_1_cons_cons_lock_0, AcquireGreaterEqual, 1)
      aie.use_lock(%in2_1_cons_cons_lock_0, AcquireGreaterEqual, 1)
      aie.use_lock(%out_1_prod_lock_0, AcquireGreaterEqual, 1)
      func.call @dot_product_i2_i8_2560(%in1_1_cons_buff_1, %in2_1_cons_buff_1, %out_1_buff_1) : (memref<640xui8>, memref<2560xi8>, memref<1xf32>) -> ()
      aie.use_lock(%in1_1_cons_prod_lock_0, Release, 1)
      aie.use_lock(%in2_1_cons_prod_lock_0, Release, 1)
      aie.use_lock(%out_1_cons_lock_0, Release, 1)
      %2 = arith.addi %0, %c2 : index
      cf.br ^bb1(%2 : index)
    ^bb3:  // pred: ^bb1
      aie.use_lock(%in1_1_cons_cons_lock_0, AcquireGreaterEqual, 1)
      aie.use_lock(%in2_1_cons_cons_lock_0, AcquireGreaterEqual, 1)
      aie.use_lock(%out_1_prod_lock_0, AcquireGreaterEqual, 1)
      func.call @dot_product_i2_i8_2560(%in1_1_cons_buff_0, %in2_1_cons_buff_0, %out_1_buff_0) : (memref<640xui8>, memref<2560xi8>, memref<1xf32>) -> ()
      aie.use_lock(%in1_1_cons_prod_lock_0, Release, 1)
      aie.use_lock(%in2_1_cons_prod_lock_0, Release, 1)
      aie.use_lock(%out_1_cons_lock_0, Release, 1)
      aie.end
    } {link_with = "dot.o"}
    %core_0_4 = aie.core(%tile_0_4) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      %c9223372036854775806 = arith.constant 9223372036854775806 : index
      %c2 = arith.constant 2 : index
      cf.br ^bb1(%c0 : index)
    ^bb1(%0: index):  // 2 preds: ^bb0, ^bb2
      %1 = arith.cmpi slt, %0, %c9223372036854775806 : index
      cf.cond_br %1, ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      aie.use_lock(%in1_2_cons_cons_lock_0, AcquireGreaterEqual, 1)
      aie.use_lock(%in2_2_cons_cons_lock_0, AcquireGreaterEqual, 1)
      aie.use_lock(%out_2_prod_lock_0, AcquireGreaterEqual, 1)
      func.call @dot_product_i2_i8_2560(%in1_2_cons_buff_0, %in2_2_cons_buff_0, %out_2_buff_0) : (memref<640xui8>, memref<2560xi8>, memref<1xf32>) -> ()
      aie.use_lock(%in1_2_cons_prod_lock_0, Release, 1)
      aie.use_lock(%in2_2_cons_prod_lock_0, Release, 1)
      aie.use_lock(%out_2_cons_lock_0, Release, 1)
      aie.use_lock(%in1_2_cons_cons_lock_0, AcquireGreaterEqual, 1)
      aie.use_lock(%in2_2_cons_cons_lock_0, AcquireGreaterEqual, 1)
      aie.use_lock(%out_2_prod_lock_0, AcquireGreaterEqual, 1)
      func.call @dot_product_i2_i8_2560(%in1_2_cons_buff_1, %in2_2_cons_buff_1, %out_2_buff_1) : (memref<640xui8>, memref<2560xi8>, memref<1xf32>) -> ()
      aie.use_lock(%in1_2_cons_prod_lock_0, Release, 1)
      aie.use_lock(%in2_2_cons_prod_lock_0, Release, 1)
      aie.use_lock(%out_2_cons_lock_0, Release, 1)
      %2 = arith.addi %0, %c2 : index
      cf.br ^bb1(%2 : index)
    ^bb3:  // pred: ^bb1
      aie.use_lock(%in1_2_cons_cons_lock_0, AcquireGreaterEqual, 1)
      aie.use_lock(%in2_2_cons_cons_lock_0, AcquireGreaterEqual, 1)
      aie.use_lock(%out_2_prod_lock_0, AcquireGreaterEqual, 1)
      func.call @dot_product_i2_i8_2560(%in1_2_cons_buff_0, %in2_2_cons_buff_0, %out_2_buff_0) : (memref<640xui8>, memref<2560xi8>, memref<1xf32>) -> ()
      aie.use_lock(%in1_2_cons_prod_lock_0, Release, 1)
      aie.use_lock(%in2_2_cons_prod_lock_0, Release, 1)
      aie.use_lock(%out_2_cons_lock_0, Release, 1)
      aie.end
    } {link_with = "dot.o"}
    %core_0_5 = aie.core(%tile_0_5) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      %c9223372036854775806 = arith.constant 9223372036854775806 : index
      %c2 = arith.constant 2 : index
      cf.br ^bb1(%c0 : index)
    ^bb1(%0: index):  // 2 preds: ^bb0, ^bb2
      %1 = arith.cmpi slt, %0, %c9223372036854775806 : index
      cf.cond_br %1, ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      aie.use_lock(%in1_3_cons_cons_lock_0, AcquireGreaterEqual, 1)
      aie.use_lock(%in2_3_cons_cons_lock_0, AcquireGreaterEqual, 1)
      aie.use_lock(%out_3_prod_lock_0, AcquireGreaterEqual, 1)
      func.call @dot_product_i2_i8_2560(%in1_3_cons_buff_0, %in2_3_cons_buff_0, %out_3_buff_0) : (memref<640xui8>, memref<2560xi8>, memref<1xf32>) -> ()
      aie.use_lock(%in1_3_cons_prod_lock_0, Release, 1)
      aie.use_lock(%in2_3_cons_prod_lock_0, Release, 1)
      aie.use_lock(%out_3_cons_lock_0, Release, 1)
      aie.use_lock(%in1_3_cons_cons_lock_0, AcquireGreaterEqual, 1)
      aie.use_lock(%in2_3_cons_cons_lock_0, AcquireGreaterEqual, 1)
      aie.use_lock(%out_3_prod_lock_0, AcquireGreaterEqual, 1)
      func.call @dot_product_i2_i8_2560(%in1_3_cons_buff_1, %in2_3_cons_buff_1, %out_3_buff_1) : (memref<640xui8>, memref<2560xi8>, memref<1xf32>) -> ()
      aie.use_lock(%in1_3_cons_prod_lock_0, Release, 1)
      aie.use_lock(%in2_3_cons_prod_lock_0, Release, 1)
      aie.use_lock(%out_3_cons_lock_0, Release, 1)
      %2 = arith.addi %0, %c2 : index
      cf.br ^bb1(%2 : index)
    ^bb3:  // pred: ^bb1
      aie.use_lock(%in1_3_cons_cons_lock_0, AcquireGreaterEqual, 1)
      aie.use_lock(%in2_3_cons_cons_lock_0, AcquireGreaterEqual, 1)
      aie.use_lock(%out_3_prod_lock_0, AcquireGreaterEqual, 1)
      func.call @dot_product_i2_i8_2560(%in1_3_cons_buff_0, %in2_3_cons_buff_0, %out_3_buff_0) : (memref<640xui8>, memref<2560xi8>, memref<1xf32>) -> ()
      aie.use_lock(%in1_3_cons_prod_lock_0, Release, 1)
      aie.use_lock(%in2_3_cons_prod_lock_0, Release, 1)
      aie.use_lock(%out_3_cons_lock_0, Release, 1)
      aie.end
    } {link_with = "dot.o"}
    aiex.runtime_sequence(%arg0: memref<2560xui8>, %arg1: memref<10240xi8>, %arg2: memref<4xf32>) {
      %0 = aiex.dma_configure_task_for @in1_0_shim_alloc {
        aie.dma_bd(%arg0 : memref<2560xui8>, 0, 640, [<size = 1, stride = 0>, <size = 640, stride = 1>]) {burst_length = 0 : i32}
        aie.end
      }
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @in2_0_shim_alloc {
        aie.dma_bd(%arg1 : memref<10240xi8>, 0, 2560, [<size = 1, stride = 0>, <size = 2560, stride = 1>]) {burst_length = 0 : i32}
        aie.end
      }
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @in1_1_shim_alloc {
        aie.dma_bd(%arg0 : memref<2560xui8>, 640, 640, [<size = 1, stride = 0>, <size = 640, stride = 1>]) {burst_length = 0 : i32}
        aie.end
      }
      aiex.dma_start_task(%2)
      %3 = aiex.dma_configure_task_for @in2_1_shim_alloc {
        aie.dma_bd(%arg1 : memref<10240xi8>, 2560, 2560, [<size = 1, stride = 0>, <size = 2560, stride = 1>]) {burst_length = 0 : i32}
        aie.end
      }
      aiex.dma_start_task(%3)
      %4 = aiex.dma_configure_task_for @in1_2_shim_alloc {
        aie.dma_bd(%arg0 : memref<2560xui8>, 1280, 640, [<size = 1, stride = 0>, <size = 640, stride = 1>]) {burst_length = 0 : i32}
        aie.end
      }
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @in2_2_shim_alloc {
        aie.dma_bd(%arg1 : memref<10240xi8>, 5120, 2560, [<size = 1, stride = 0>, <size = 2560, stride = 1>]) {burst_length = 0 : i32}
        aie.end
      }
      aiex.dma_start_task(%5)
      %6 = aiex.dma_configure_task_for @in1_3_shim_alloc {
        aie.dma_bd(%arg0 : memref<2560xui8>, 1920, 640, [<size = 1, stride = 0>, <size = 640, stride = 1>]) {burst_length = 0 : i32}
        aie.end
      }
      aiex.dma_start_task(%6)
      %7 = aiex.dma_configure_task_for @in2_3_shim_alloc {
        aie.dma_bd(%arg1 : memref<10240xi8>, 7680, 2560, [<size = 1, stride = 0>, <size = 2560, stride = 1>]) {burst_length = 0 : i32}
        aie.end
      }
      aiex.dma_start_task(%7)
      %8 = aiex.dma_configure_task_for @out_0_shim_alloc {
        aie.dma_bd(%arg2 : memref<4xf32>, 0, 1, [<size = 1, stride = 0>, <size = 1, stride = 1>]) {burst_length = 0 : i32}
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%8)
      %9 = aiex.dma_configure_task_for @out_1_shim_alloc {
        aie.dma_bd(%arg2 : memref<4xf32>, 1, 1, [<size = 1, stride = 0>, <size = 1, stride = 1>]) {burst_length = 0 : i32}
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%9)
      %10 = aiex.dma_configure_task_for @out_2_shim_alloc {
        aie.dma_bd(%arg2 : memref<4xf32>, 2, 1, [<size = 1, stride = 0>, <size = 1, stride = 1>]) {burst_length = 0 : i32}
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%10)
      %11 = aiex.dma_configure_task_for @out_3_shim_alloc {
        aie.dma_bd(%arg2 : memref<4xf32>, 3, 1, [<size = 1, stride = 0>, <size = 1, stride = 1>]) {burst_length = 0 : i32}
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%11)
      aiex.dma_await_task(%8)
      aiex.dma_await_task(%9)
      aiex.dma_await_task(%10)
      aiex.dma_await_task(%11)
      aiex.dma_free_task(%0)
      aiex.dma_free_task(%1)
      aiex.dma_free_task(%2)
      aiex.dma_free_task(%3)
      aiex.dma_free_task(%4)
      aiex.dma_free_task(%5)
      aiex.dma_free_task(%6)
      aiex.dma_free_task(%7)
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
  }
}
