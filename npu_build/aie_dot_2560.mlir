module {
  aie.device(npu1) {
    %tile_0_2 = aie.tile(0, 2)
    %tile_0_3 = aie.tile(0, 3)
    %tile_0_4 = aie.tile(0, 4)
    %tile_0_5 = aie.tile(0, 5)
    %shim_noc_tile_0_0 = aie.tile(0, 0)
    %shim_noc_tile_1_0 = aie.tile(1, 0)
    %shim_noc_tile_2_0 = aie.tile(2, 0)
    %shim_noc_tile_3_0 = aie.tile(3, 0)
    aie.objectfifo @in1_0(%shim_noc_tile_0_0, {%tile_0_2}, 2 : i32) : !aie.objectfifo<memref<640xui8>> 
    aie.objectfifo @in1_1(%shim_noc_tile_0_0, {%tile_0_3}, 2 : i32) : !aie.objectfifo<memref<640xui8>> 
    aie.objectfifo @in1_2(%shim_noc_tile_1_0, {%tile_0_4}, 2 : i32) : !aie.objectfifo<memref<640xui8>> 
    aie.objectfifo @in1_3(%shim_noc_tile_1_0, {%tile_0_5}, 2 : i32) : !aie.objectfifo<memref<640xui8>> 
    aie.objectfifo @in2_0(%shim_noc_tile_2_0, {%tile_0_2}, 2 : i32) : !aie.objectfifo<memref<2560xi8>> 
    aie.objectfifo @in2_1(%shim_noc_tile_2_0, {%tile_0_3}, 2 : i32) : !aie.objectfifo<memref<2560xi8>> 
    aie.objectfifo @in2_2(%shim_noc_tile_3_0, {%tile_0_4}, 2 : i32) : !aie.objectfifo<memref<2560xi8>> 
    aie.objectfifo @in2_3(%shim_noc_tile_3_0, {%tile_0_5}, 2 : i32) : !aie.objectfifo<memref<2560xi8>> 
    aie.objectfifo @out_0(%tile_0_2, {%shim_noc_tile_0_0}, 2 : i32) : !aie.objectfifo<memref<1xf32>> 
    aie.objectfifo @out_1(%tile_0_3, {%shim_noc_tile_0_0}, 2 : i32) : !aie.objectfifo<memref<1xf32>> 
    aie.objectfifo @out_2(%tile_0_4, {%shim_noc_tile_1_0}, 2 : i32) : !aie.objectfifo<memref<1xf32>> 
    aie.objectfifo @out_3(%tile_0_5, {%shim_noc_tile_1_0}, 2 : i32) : !aie.objectfifo<memref<1xf32>> 
    func.func private @dot_product_i2_i8_2560(memref<640xui8>, memref<2560xi8>, memref<1xf32>)
    %core_0_2 = aie.core(%tile_0_2) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c1_2 = arith.constant 1 : index
        scf.for %arg1 = %c0_0 to %c1_1 step %c1_2 {
          %0 = aie.objectfifo.acquire @in1_0(Consume, 1) : !aie.objectfifosubview<memref<640xui8>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<640xui8>> -> memref<640xui8>
          %2 = aie.objectfifo.acquire @in2_0(Consume, 1) : !aie.objectfifosubview<memref<2560xi8>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<2560xi8>> -> memref<2560xi8>
          %4 = aie.objectfifo.acquire @out_0(Produce, 1) : !aie.objectfifosubview<memref<1xf32>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<1xf32>> -> memref<1xf32>
          func.call @dot_product_i2_i8_2560(%1, %3, %5) : (memref<640xui8>, memref<2560xi8>, memref<1xf32>) -> ()
          aie.objectfifo.release @in1_0(Consume, 1)
          aie.objectfifo.release @in2_0(Consume, 1)
          aie.objectfifo.release @out_0(Produce, 1)
        }
      }
      aie.end
    } {link_with = "dot.o"}
    %core_0_3 = aie.core(%tile_0_3) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c1_2 = arith.constant 1 : index
        scf.for %arg1 = %c0_0 to %c1_1 step %c1_2 {
          %0 = aie.objectfifo.acquire @in1_1(Consume, 1) : !aie.objectfifosubview<memref<640xui8>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<640xui8>> -> memref<640xui8>
          %2 = aie.objectfifo.acquire @in2_1(Consume, 1) : !aie.objectfifosubview<memref<2560xi8>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<2560xi8>> -> memref<2560xi8>
          %4 = aie.objectfifo.acquire @out_1(Produce, 1) : !aie.objectfifosubview<memref<1xf32>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<1xf32>> -> memref<1xf32>
          func.call @dot_product_i2_i8_2560(%1, %3, %5) : (memref<640xui8>, memref<2560xi8>, memref<1xf32>) -> ()
          aie.objectfifo.release @in1_1(Consume, 1)
          aie.objectfifo.release @in2_1(Consume, 1)
          aie.objectfifo.release @out_1(Produce, 1)
        }
      }
      aie.end
    } {link_with = "dot.o"}
    %core_0_4 = aie.core(%tile_0_4) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c1_2 = arith.constant 1 : index
        scf.for %arg1 = %c0_0 to %c1_1 step %c1_2 {
          %0 = aie.objectfifo.acquire @in1_2(Consume, 1) : !aie.objectfifosubview<memref<640xui8>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<640xui8>> -> memref<640xui8>
          %2 = aie.objectfifo.acquire @in2_2(Consume, 1) : !aie.objectfifosubview<memref<2560xi8>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<2560xi8>> -> memref<2560xi8>
          %4 = aie.objectfifo.acquire @out_2(Produce, 1) : !aie.objectfifosubview<memref<1xf32>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<1xf32>> -> memref<1xf32>
          func.call @dot_product_i2_i8_2560(%1, %3, %5) : (memref<640xui8>, memref<2560xi8>, memref<1xf32>) -> ()
          aie.objectfifo.release @in1_2(Consume, 1)
          aie.objectfifo.release @in2_2(Consume, 1)
          aie.objectfifo.release @out_2(Produce, 1)
        }
      }
      aie.end
    } {link_with = "dot.o"}
    %core_0_5 = aie.core(%tile_0_5) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c1_2 = arith.constant 1 : index
        scf.for %arg1 = %c0_0 to %c1_1 step %c1_2 {
          %0 = aie.objectfifo.acquire @in1_3(Consume, 1) : !aie.objectfifosubview<memref<640xui8>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<640xui8>> -> memref<640xui8>
          %2 = aie.objectfifo.acquire @in2_3(Consume, 1) : !aie.objectfifosubview<memref<2560xi8>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<2560xi8>> -> memref<2560xi8>
          %4 = aie.objectfifo.acquire @out_3(Produce, 1) : !aie.objectfifosubview<memref<1xf32>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<1xf32>> -> memref<1xf32>
          func.call @dot_product_i2_i8_2560(%1, %3, %5) : (memref<640xui8>, memref<2560xi8>, memref<1xf32>) -> ()
          aie.objectfifo.release @in1_3(Consume, 1)
          aie.objectfifo.release @in2_3(Consume, 1)
          aie.objectfifo.release @out_3(Produce, 1)
        }
      }
      aie.end
    } {link_with = "dot.o"}
    aiex.runtime_sequence(%arg0: memref<2560xui8>, %arg1: memref<10240xi8>, %arg2: memref<4xf32>) {
      %0 = aiex.dma_configure_task_for @in1_0 {
        aie.dma_bd(%arg0 : memref<2560xui8>, 0, 640, [<size = 1, stride = 0>, <size = 640, stride = 1>]) {burst_length = 0 : i32}
        aie.end
      }
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @in2_0 {
        aie.dma_bd(%arg1 : memref<10240xi8>, 0, 2560, [<size = 1, stride = 0>, <size = 2560, stride = 1>]) {burst_length = 0 : i32}
        aie.end
      }
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @in1_1 {
        aie.dma_bd(%arg0 : memref<2560xui8>, 640, 640, [<size = 1, stride = 0>, <size = 640, stride = 1>]) {burst_length = 0 : i32}
        aie.end
      }
      aiex.dma_start_task(%2)
      %3 = aiex.dma_configure_task_for @in2_1 {
        aie.dma_bd(%arg1 : memref<10240xi8>, 2560, 2560, [<size = 1, stride = 0>, <size = 2560, stride = 1>]) {burst_length = 0 : i32}
        aie.end
      }
      aiex.dma_start_task(%3)
      %4 = aiex.dma_configure_task_for @in1_2 {
        aie.dma_bd(%arg0 : memref<2560xui8>, 1280, 640, [<size = 1, stride = 0>, <size = 640, stride = 1>]) {burst_length = 0 : i32}
        aie.end
      }
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @in2_2 {
        aie.dma_bd(%arg1 : memref<10240xi8>, 5120, 2560, [<size = 1, stride = 0>, <size = 2560, stride = 1>]) {burst_length = 0 : i32}
        aie.end
      }
      aiex.dma_start_task(%5)
      %6 = aiex.dma_configure_task_for @in1_3 {
        aie.dma_bd(%arg0 : memref<2560xui8>, 1920, 640, [<size = 1, stride = 0>, <size = 640, stride = 1>]) {burst_length = 0 : i32}
        aie.end
      }
      aiex.dma_start_task(%6)
      %7 = aiex.dma_configure_task_for @in2_3 {
        aie.dma_bd(%arg1 : memref<10240xi8>, 7680, 2560, [<size = 1, stride = 0>, <size = 2560, stride = 1>]) {burst_length = 0 : i32}
        aie.end
      }
      aiex.dma_start_task(%7)
      %8 = aiex.dma_configure_task_for @out_0 {
        aie.dma_bd(%arg2 : memref<4xf32>, 0, 1, [<size = 1, stride = 0>, <size = 1, stride = 1>]) {burst_length = 0 : i32}
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%8)
      %9 = aiex.dma_configure_task_for @out_1 {
        aie.dma_bd(%arg2 : memref<4xf32>, 1, 1, [<size = 1, stride = 0>, <size = 1, stride = 1>]) {burst_length = 0 : i32}
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%9)
      %10 = aiex.dma_configure_task_for @out_2 {
        aie.dma_bd(%arg2 : memref<4xf32>, 2, 1, [<size = 1, stride = 0>, <size = 1, stride = 1>]) {burst_length = 0 : i32}
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%10)
      %11 = aiex.dma_configure_task_for @out_3 {
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
  }
}

