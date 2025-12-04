module attributes {llvm.target_triple = "aie2"} {
  llvm.mlir.global external @in1_0_cons_buff_1() {addr_space = 0 : i32} : !llvm.array<1728 x i8>
  llvm.mlir.global external @in1_0_cons_buff_0() {addr_space = 0 : i32} : !llvm.array<1728 x i8>
  llvm.mlir.global external @in1_1_cons_buff_1() {addr_space = 0 : i32} : !llvm.array<1728 x i8>
  llvm.mlir.global external @in1_1_cons_buff_0() {addr_space = 0 : i32} : !llvm.array<1728 x i8>
  llvm.mlir.global external @in1_2_cons_buff_1() {addr_space = 0 : i32} : !llvm.array<1728 x i8>
  llvm.mlir.global external @in1_2_cons_buff_0() {addr_space = 0 : i32} : !llvm.array<1728 x i8>
  llvm.mlir.global external @in1_3_cons_buff_1() {addr_space = 0 : i32} : !llvm.array<1728 x i8>
  llvm.mlir.global external @in1_3_cons_buff_0() {addr_space = 0 : i32} : !llvm.array<1728 x i8>
  llvm.mlir.global external @in2_0_cons_buff_1() {addr_space = 0 : i32} : !llvm.array<6912 x i8>
  llvm.mlir.global external @in2_0_cons_buff_0() {addr_space = 0 : i32} : !llvm.array<6912 x i8>
  llvm.mlir.global external @in2_1_cons_buff_1() {addr_space = 0 : i32} : !llvm.array<6912 x i8>
  llvm.mlir.global external @in2_1_cons_buff_0() {addr_space = 0 : i32} : !llvm.array<6912 x i8>
  llvm.mlir.global external @in2_2_cons_buff_1() {addr_space = 0 : i32} : !llvm.array<6912 x i8>
  llvm.mlir.global external @in2_2_cons_buff_0() {addr_space = 0 : i32} : !llvm.array<6912 x i8>
  llvm.mlir.global external @in2_3_cons_buff_1() {addr_space = 0 : i32} : !llvm.array<6912 x i8>
  llvm.mlir.global external @in2_3_cons_buff_0() {addr_space = 0 : i32} : !llvm.array<6912 x i8>
  llvm.mlir.global external @out_0_buff_1() {addr_space = 0 : i32} : !llvm.array<1 x f32>
  llvm.mlir.global external @out_0_buff_0() {addr_space = 0 : i32} : !llvm.array<1 x f32>
  llvm.mlir.global external @out_1_buff_1() {addr_space = 0 : i32} : !llvm.array<1 x f32>
  llvm.mlir.global external @out_1_buff_0() {addr_space = 0 : i32} : !llvm.array<1 x f32>
  llvm.mlir.global external @out_2_buff_1() {addr_space = 0 : i32} : !llvm.array<1 x f32>
  llvm.mlir.global external @out_2_buff_0() {addr_space = 0 : i32} : !llvm.array<1 x f32>
  llvm.mlir.global external @out_3_buff_1() {addr_space = 0 : i32} : !llvm.array<1 x f32>
  llvm.mlir.global external @out_3_buff_0() {addr_space = 0 : i32} : !llvm.array<1 x f32>
  llvm.func @debug_i32(i32) attributes {sym_visibility = "private"}
  llvm.func @llvm.aie2.event(i32) attributes {sym_visibility = "private"}
  llvm.func @llvm.aie2.put.ms(i32, i32) attributes {sym_visibility = "private"}
  llvm.func @llvm.aie2.get.ss() -> !llvm.struct<(i32, i32)> attributes {sym_visibility = "private"}
  llvm.func @llvm.aie2.mcd.write.vec(vector<16xi32>, i32) attributes {sym_visibility = "private"}
  llvm.func @llvm.aie2.scd.read.vec(i32) -> vector<16xi32> attributes {sym_visibility = "private"}
  llvm.func @llvm.aie2.acquire(i32, i32) attributes {sym_visibility = "private"}
  llvm.func @llvm.aie2.release(i32, i32) attributes {sym_visibility = "private"}
  llvm.func @dot_product_i2_i8_6912(!llvm.ptr, !llvm.ptr, !llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func @core_0_5() {
    %0 = llvm.mlir.addressof @in1_3_cons_buff_1 : !llvm.ptr
    %1 = llvm.mlir.addressof @in2_3_cons_buff_1 : !llvm.ptr
    %2 = llvm.mlir.addressof @out_3_buff_1 : !llvm.ptr
    %3 = llvm.mlir.addressof @in1_3_cons_buff_0 : !llvm.ptr
    %4 = llvm.mlir.addressof @in2_3_cons_buff_0 : !llvm.ptr
    %5 = llvm.mlir.addressof @out_3_buff_0 : !llvm.ptr
    %6 = llvm.mlir.constant(2 : index) : i64
    %7 = llvm.mlir.constant(9223372036854775806 : index) : i64
    %8 = llvm.mlir.constant(53 : i32) : i32
    %9 = llvm.mlir.constant(50 : i32) : i32
    %10 = llvm.mlir.constant(48 : i32) : i32
    %11 = llvm.mlir.constant(52 : i32) : i32
    %12 = llvm.mlir.constant(51 : i32) : i32
    %13 = llvm.mlir.constant(49 : i32) : i32
    %14 = llvm.mlir.constant(1 : i32) : i32
    %15 = llvm.mlir.constant(-1 : i32) : i32
    %16 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1(%16 : i64)
  ^bb1(%17: i64):  // 2 preds: ^bb0, ^bb2
    %18 = llvm.icmp "slt" %17, %7 : i64
    llvm.cond_br %18, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    llvm.call @llvm.aie2.acquire(%13, %15) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%12, %15) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%11, %15) : (i32, i32) -> ()
    %19 = llvm.getelementptr %5[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<1 x f32>
    %20 = llvm.getelementptr %4[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<6912 x i8>
    %21 = llvm.getelementptr %3[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<1728 x i8>
    llvm.call @dot_product_i2_i8_6912(%21, %20, %19) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.call @llvm.aie2.release(%10, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.release(%9, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.release(%8, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%13, %15) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%12, %15) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%11, %15) : (i32, i32) -> ()
    %22 = llvm.getelementptr %2[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<1 x f32>
    %23 = llvm.getelementptr %1[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<6912 x i8>
    %24 = llvm.getelementptr %0[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<1728 x i8>
    llvm.call @dot_product_i2_i8_6912(%24, %23, %22) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.call @llvm.aie2.release(%10, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.release(%9, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.release(%8, %14) : (i32, i32) -> ()
    %25 = llvm.add %17, %6 : i64
    llvm.br ^bb1(%25 : i64)
  ^bb3:  // pred: ^bb1
    llvm.call @llvm.aie2.acquire(%13, %15) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%12, %15) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%11, %15) : (i32, i32) -> ()
    %26 = llvm.getelementptr %5[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<1 x f32>
    %27 = llvm.getelementptr %4[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<6912 x i8>
    %28 = llvm.getelementptr %3[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<1728 x i8>
    llvm.call @dot_product_i2_i8_6912(%28, %27, %26) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.call @llvm.aie2.release(%10, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.release(%9, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.release(%8, %14) : (i32, i32) -> ()
    llvm.return
  }
  llvm.func @core_0_4() {
    %0 = llvm.mlir.addressof @in1_2_cons_buff_1 : !llvm.ptr
    %1 = llvm.mlir.addressof @in2_2_cons_buff_1 : !llvm.ptr
    %2 = llvm.mlir.addressof @out_2_buff_1 : !llvm.ptr
    %3 = llvm.mlir.addressof @in1_2_cons_buff_0 : !llvm.ptr
    %4 = llvm.mlir.addressof @in2_2_cons_buff_0 : !llvm.ptr
    %5 = llvm.mlir.addressof @out_2_buff_0 : !llvm.ptr
    %6 = llvm.mlir.constant(2 : index) : i64
    %7 = llvm.mlir.constant(9223372036854775806 : index) : i64
    %8 = llvm.mlir.constant(53 : i32) : i32
    %9 = llvm.mlir.constant(50 : i32) : i32
    %10 = llvm.mlir.constant(48 : i32) : i32
    %11 = llvm.mlir.constant(52 : i32) : i32
    %12 = llvm.mlir.constant(51 : i32) : i32
    %13 = llvm.mlir.constant(49 : i32) : i32
    %14 = llvm.mlir.constant(1 : i32) : i32
    %15 = llvm.mlir.constant(-1 : i32) : i32
    %16 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1(%16 : i64)
  ^bb1(%17: i64):  // 2 preds: ^bb0, ^bb2
    %18 = llvm.icmp "slt" %17, %7 : i64
    llvm.cond_br %18, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    llvm.call @llvm.aie2.acquire(%13, %15) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%12, %15) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%11, %15) : (i32, i32) -> ()
    %19 = llvm.getelementptr %5[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<1 x f32>
    %20 = llvm.getelementptr %4[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<6912 x i8>
    %21 = llvm.getelementptr %3[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<1728 x i8>
    llvm.call @dot_product_i2_i8_6912(%21, %20, %19) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.call @llvm.aie2.release(%10, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.release(%9, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.release(%8, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%13, %15) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%12, %15) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%11, %15) : (i32, i32) -> ()
    %22 = llvm.getelementptr %2[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<1 x f32>
    %23 = llvm.getelementptr %1[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<6912 x i8>
    %24 = llvm.getelementptr %0[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<1728 x i8>
    llvm.call @dot_product_i2_i8_6912(%24, %23, %22) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.call @llvm.aie2.release(%10, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.release(%9, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.release(%8, %14) : (i32, i32) -> ()
    %25 = llvm.add %17, %6 : i64
    llvm.br ^bb1(%25 : i64)
  ^bb3:  // pred: ^bb1
    llvm.call @llvm.aie2.acquire(%13, %15) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%12, %15) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%11, %15) : (i32, i32) -> ()
    %26 = llvm.getelementptr %5[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<1 x f32>
    %27 = llvm.getelementptr %4[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<6912 x i8>
    %28 = llvm.getelementptr %3[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<1728 x i8>
    llvm.call @dot_product_i2_i8_6912(%28, %27, %26) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.call @llvm.aie2.release(%10, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.release(%9, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.release(%8, %14) : (i32, i32) -> ()
    llvm.return
  }
  llvm.func @core_0_3() {
    %0 = llvm.mlir.addressof @in1_1_cons_buff_1 : !llvm.ptr
    %1 = llvm.mlir.addressof @in2_1_cons_buff_1 : !llvm.ptr
    %2 = llvm.mlir.addressof @out_1_buff_1 : !llvm.ptr
    %3 = llvm.mlir.addressof @in1_1_cons_buff_0 : !llvm.ptr
    %4 = llvm.mlir.addressof @in2_1_cons_buff_0 : !llvm.ptr
    %5 = llvm.mlir.addressof @out_1_buff_0 : !llvm.ptr
    %6 = llvm.mlir.constant(2 : index) : i64
    %7 = llvm.mlir.constant(9223372036854775806 : index) : i64
    %8 = llvm.mlir.constant(53 : i32) : i32
    %9 = llvm.mlir.constant(50 : i32) : i32
    %10 = llvm.mlir.constant(48 : i32) : i32
    %11 = llvm.mlir.constant(52 : i32) : i32
    %12 = llvm.mlir.constant(51 : i32) : i32
    %13 = llvm.mlir.constant(49 : i32) : i32
    %14 = llvm.mlir.constant(1 : i32) : i32
    %15 = llvm.mlir.constant(-1 : i32) : i32
    %16 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1(%16 : i64)
  ^bb1(%17: i64):  // 2 preds: ^bb0, ^bb2
    %18 = llvm.icmp "slt" %17, %7 : i64
    llvm.cond_br %18, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    llvm.call @llvm.aie2.acquire(%13, %15) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%12, %15) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%11, %15) : (i32, i32) -> ()
    %19 = llvm.getelementptr %5[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<1 x f32>
    %20 = llvm.getelementptr %4[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<6912 x i8>
    %21 = llvm.getelementptr %3[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<1728 x i8>
    llvm.call @dot_product_i2_i8_6912(%21, %20, %19) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.call @llvm.aie2.release(%10, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.release(%9, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.release(%8, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%13, %15) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%12, %15) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%11, %15) : (i32, i32) -> ()
    %22 = llvm.getelementptr %2[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<1 x f32>
    %23 = llvm.getelementptr %1[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<6912 x i8>
    %24 = llvm.getelementptr %0[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<1728 x i8>
    llvm.call @dot_product_i2_i8_6912(%24, %23, %22) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.call @llvm.aie2.release(%10, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.release(%9, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.release(%8, %14) : (i32, i32) -> ()
    %25 = llvm.add %17, %6 : i64
    llvm.br ^bb1(%25 : i64)
  ^bb3:  // pred: ^bb1
    llvm.call @llvm.aie2.acquire(%13, %15) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%12, %15) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%11, %15) : (i32, i32) -> ()
    %26 = llvm.getelementptr %5[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<1 x f32>
    %27 = llvm.getelementptr %4[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<6912 x i8>
    %28 = llvm.getelementptr %3[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<1728 x i8>
    llvm.call @dot_product_i2_i8_6912(%28, %27, %26) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.call @llvm.aie2.release(%10, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.release(%9, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.release(%8, %14) : (i32, i32) -> ()
    llvm.return
  }
  llvm.func @core_0_2() {
    %0 = llvm.mlir.addressof @in1_0_cons_buff_1 : !llvm.ptr
    %1 = llvm.mlir.addressof @in2_0_cons_buff_1 : !llvm.ptr
    %2 = llvm.mlir.addressof @out_0_buff_1 : !llvm.ptr
    %3 = llvm.mlir.addressof @in1_0_cons_buff_0 : !llvm.ptr
    %4 = llvm.mlir.addressof @in2_0_cons_buff_0 : !llvm.ptr
    %5 = llvm.mlir.addressof @out_0_buff_0 : !llvm.ptr
    %6 = llvm.mlir.constant(2 : index) : i64
    %7 = llvm.mlir.constant(9223372036854775806 : index) : i64
    %8 = llvm.mlir.constant(53 : i32) : i32
    %9 = llvm.mlir.constant(50 : i32) : i32
    %10 = llvm.mlir.constant(48 : i32) : i32
    %11 = llvm.mlir.constant(52 : i32) : i32
    %12 = llvm.mlir.constant(51 : i32) : i32
    %13 = llvm.mlir.constant(49 : i32) : i32
    %14 = llvm.mlir.constant(1 : i32) : i32
    %15 = llvm.mlir.constant(-1 : i32) : i32
    %16 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1(%16 : i64)
  ^bb1(%17: i64):  // 2 preds: ^bb0, ^bb2
    %18 = llvm.icmp "slt" %17, %7 : i64
    llvm.cond_br %18, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    llvm.call @llvm.aie2.acquire(%13, %15) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%12, %15) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%11, %15) : (i32, i32) -> ()
    %19 = llvm.getelementptr %5[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<1 x f32>
    %20 = llvm.getelementptr %4[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<6912 x i8>
    %21 = llvm.getelementptr %3[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<1728 x i8>
    llvm.call @dot_product_i2_i8_6912(%21, %20, %19) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.call @llvm.aie2.release(%10, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.release(%9, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.release(%8, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%13, %15) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%12, %15) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%11, %15) : (i32, i32) -> ()
    %22 = llvm.getelementptr %2[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<1 x f32>
    %23 = llvm.getelementptr %1[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<6912 x i8>
    %24 = llvm.getelementptr %0[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<1728 x i8>
    llvm.call @dot_product_i2_i8_6912(%24, %23, %22) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.call @llvm.aie2.release(%10, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.release(%9, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.release(%8, %14) : (i32, i32) -> ()
    %25 = llvm.add %17, %6 : i64
    llvm.br ^bb1(%25 : i64)
  ^bb3:  // pred: ^bb1
    llvm.call @llvm.aie2.acquire(%13, %15) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%12, %15) : (i32, i32) -> ()
    llvm.call @llvm.aie2.acquire(%11, %15) : (i32, i32) -> ()
    %26 = llvm.getelementptr %5[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<1 x f32>
    %27 = llvm.getelementptr %4[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<6912 x i8>
    %28 = llvm.getelementptr %3[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<1728 x i8>
    llvm.call @dot_product_i2_i8_6912(%28, %27, %26) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.call @llvm.aie2.release(%10, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.release(%9, %14) : (i32, i32) -> ()
    llvm.call @llvm.aie2.release(%8, %14) : (i32, i32) -> ()
    llvm.return
  }
}

