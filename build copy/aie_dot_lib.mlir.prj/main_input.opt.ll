; ModuleID = '/notebooks/aditya.shankar/hwai-proj-mlir-aie/programming_examples/basic/dot_product/build/aie_dot_lib.mlir.prj/main_input.llpeanohack.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2"

@in1_0_cons_buff_1 = external global [1728 x i8]
@in1_0_cons_buff_0 = external global [1728 x i8]
@in1_1_cons_buff_1 = external global [1728 x i8]
@in1_1_cons_buff_0 = external global [1728 x i8]
@in1_2_cons_buff_1 = external global [1728 x i8]
@in1_2_cons_buff_0 = external global [1728 x i8]
@in1_3_cons_buff_1 = external global [1728 x i8]
@in1_3_cons_buff_0 = external global [1728 x i8]
@in2_0_cons_buff_1 = external global [6912 x i8]
@in2_0_cons_buff_0 = external global [6912 x i8]
@in2_1_cons_buff_1 = external global [6912 x i8]
@in2_1_cons_buff_0 = external global [6912 x i8]
@in2_2_cons_buff_1 = external global [6912 x i8]
@in2_2_cons_buff_0 = external global [6912 x i8]
@in2_3_cons_buff_1 = external global [6912 x i8]
@in2_3_cons_buff_0 = external global [6912 x i8]
@out_0_buff_1 = external global [1 x float]
@out_0_buff_0 = external global [1 x float]
@out_1_buff_1 = external global [1 x float]
@out_1_buff_0 = external global [1 x float]
@out_2_buff_1 = external global [1 x float]
@out_2_buff_0 = external global [1 x float]
@out_3_buff_1 = external global [1 x float]
@out_3_buff_0 = external global [1 x float]

; Function Attrs: nounwind
declare void @llvm.aie2.acquire(i32, i32) #0

; Function Attrs: nounwind
declare void @llvm.aie2.release(i32, i32) #0

declare void @dot_product_i2_i8_6912(ptr, ptr, ptr) local_unnamed_addr

define void @core_0_5() local_unnamed_addr {
  br label %1

1:                                                ; preds = %0, %1
  %2 = phi i64 [ 0, %0 ], [ %3, %1 ]
  tail call void @llvm.aie2.acquire(i32 49, i32 -1)
  tail call void @llvm.aie2.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2.acquire(i32 52, i32 -1)
  tail call void @dot_product_i2_i8_6912(ptr nonnull @in1_3_cons_buff_0, ptr nonnull @in2_3_cons_buff_0, ptr nonnull @out_3_buff_0)
  tail call void @llvm.aie2.release(i32 48, i32 1)
  tail call void @llvm.aie2.release(i32 50, i32 1)
  tail call void @llvm.aie2.release(i32 53, i32 1)
  tail call void @llvm.aie2.acquire(i32 49, i32 -1)
  tail call void @llvm.aie2.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2.acquire(i32 52, i32 -1)
  tail call void @dot_product_i2_i8_6912(ptr nonnull @in1_3_cons_buff_1, ptr nonnull @in2_3_cons_buff_1, ptr nonnull @out_3_buff_1)
  tail call void @llvm.aie2.release(i32 48, i32 1)
  tail call void @llvm.aie2.release(i32 50, i32 1)
  tail call void @llvm.aie2.release(i32 53, i32 1)
  %3 = add nuw nsw i64 %2, 2
  %.not = icmp eq i64 %3, 9223372036854775806
  br i1 %.not, label %4, label %1

4:                                                ; preds = %1
  tail call void @llvm.aie2.acquire(i32 49, i32 -1)
  tail call void @llvm.aie2.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2.acquire(i32 52, i32 -1)
  tail call void @dot_product_i2_i8_6912(ptr nonnull @in1_3_cons_buff_0, ptr nonnull @in2_3_cons_buff_0, ptr nonnull @out_3_buff_0)
  tail call void @llvm.aie2.release(i32 48, i32 1)
  tail call void @llvm.aie2.release(i32 50, i32 1)
  tail call void @llvm.aie2.release(i32 53, i32 1)
  ret void
}

define void @core_0_4() local_unnamed_addr {
  br label %1

1:                                                ; preds = %0, %1
  %2 = phi i64 [ 0, %0 ], [ %3, %1 ]
  tail call void @llvm.aie2.acquire(i32 49, i32 -1)
  tail call void @llvm.aie2.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2.acquire(i32 52, i32 -1)
  tail call void @dot_product_i2_i8_6912(ptr nonnull @in1_2_cons_buff_0, ptr nonnull @in2_2_cons_buff_0, ptr nonnull @out_2_buff_0)
  tail call void @llvm.aie2.release(i32 48, i32 1)
  tail call void @llvm.aie2.release(i32 50, i32 1)
  tail call void @llvm.aie2.release(i32 53, i32 1)
  tail call void @llvm.aie2.acquire(i32 49, i32 -1)
  tail call void @llvm.aie2.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2.acquire(i32 52, i32 -1)
  tail call void @dot_product_i2_i8_6912(ptr nonnull @in1_2_cons_buff_1, ptr nonnull @in2_2_cons_buff_1, ptr nonnull @out_2_buff_1)
  tail call void @llvm.aie2.release(i32 48, i32 1)
  tail call void @llvm.aie2.release(i32 50, i32 1)
  tail call void @llvm.aie2.release(i32 53, i32 1)
  %3 = add nuw nsw i64 %2, 2
  %.not = icmp eq i64 %3, 9223372036854775806
  br i1 %.not, label %4, label %1

4:                                                ; preds = %1
  tail call void @llvm.aie2.acquire(i32 49, i32 -1)
  tail call void @llvm.aie2.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2.acquire(i32 52, i32 -1)
  tail call void @dot_product_i2_i8_6912(ptr nonnull @in1_2_cons_buff_0, ptr nonnull @in2_2_cons_buff_0, ptr nonnull @out_2_buff_0)
  tail call void @llvm.aie2.release(i32 48, i32 1)
  tail call void @llvm.aie2.release(i32 50, i32 1)
  tail call void @llvm.aie2.release(i32 53, i32 1)
  ret void
}

define void @core_0_3() local_unnamed_addr {
  br label %1

1:                                                ; preds = %0, %1
  %2 = phi i64 [ 0, %0 ], [ %3, %1 ]
  tail call void @llvm.aie2.acquire(i32 49, i32 -1)
  tail call void @llvm.aie2.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2.acquire(i32 52, i32 -1)
  tail call void @dot_product_i2_i8_6912(ptr nonnull @in1_1_cons_buff_0, ptr nonnull @in2_1_cons_buff_0, ptr nonnull @out_1_buff_0)
  tail call void @llvm.aie2.release(i32 48, i32 1)
  tail call void @llvm.aie2.release(i32 50, i32 1)
  tail call void @llvm.aie2.release(i32 53, i32 1)
  tail call void @llvm.aie2.acquire(i32 49, i32 -1)
  tail call void @llvm.aie2.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2.acquire(i32 52, i32 -1)
  tail call void @dot_product_i2_i8_6912(ptr nonnull @in1_1_cons_buff_1, ptr nonnull @in2_1_cons_buff_1, ptr nonnull @out_1_buff_1)
  tail call void @llvm.aie2.release(i32 48, i32 1)
  tail call void @llvm.aie2.release(i32 50, i32 1)
  tail call void @llvm.aie2.release(i32 53, i32 1)
  %3 = add nuw nsw i64 %2, 2
  %.not = icmp eq i64 %3, 9223372036854775806
  br i1 %.not, label %4, label %1

4:                                                ; preds = %1
  tail call void @llvm.aie2.acquire(i32 49, i32 -1)
  tail call void @llvm.aie2.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2.acquire(i32 52, i32 -1)
  tail call void @dot_product_i2_i8_6912(ptr nonnull @in1_1_cons_buff_0, ptr nonnull @in2_1_cons_buff_0, ptr nonnull @out_1_buff_0)
  tail call void @llvm.aie2.release(i32 48, i32 1)
  tail call void @llvm.aie2.release(i32 50, i32 1)
  tail call void @llvm.aie2.release(i32 53, i32 1)
  ret void
}

define void @core_0_2() local_unnamed_addr {
  br label %1

1:                                                ; preds = %0, %1
  %2 = phi i64 [ 0, %0 ], [ %3, %1 ]
  tail call void @llvm.aie2.acquire(i32 49, i32 -1)
  tail call void @llvm.aie2.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2.acquire(i32 52, i32 -1)
  tail call void @dot_product_i2_i8_6912(ptr nonnull @in1_0_cons_buff_0, ptr nonnull @in2_0_cons_buff_0, ptr nonnull @out_0_buff_0)
  tail call void @llvm.aie2.release(i32 48, i32 1)
  tail call void @llvm.aie2.release(i32 50, i32 1)
  tail call void @llvm.aie2.release(i32 53, i32 1)
  tail call void @llvm.aie2.acquire(i32 49, i32 -1)
  tail call void @llvm.aie2.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2.acquire(i32 52, i32 -1)
  tail call void @dot_product_i2_i8_6912(ptr nonnull @in1_0_cons_buff_1, ptr nonnull @in2_0_cons_buff_1, ptr nonnull @out_0_buff_1)
  tail call void @llvm.aie2.release(i32 48, i32 1)
  tail call void @llvm.aie2.release(i32 50, i32 1)
  tail call void @llvm.aie2.release(i32 53, i32 1)
  %3 = add nuw nsw i64 %2, 2
  %.not = icmp eq i64 %3, 9223372036854775806
  br i1 %.not, label %4, label %1

4:                                                ; preds = %1
  tail call void @llvm.aie2.acquire(i32 49, i32 -1)
  tail call void @llvm.aie2.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2.acquire(i32 52, i32 -1)
  tail call void @dot_product_i2_i8_6912(ptr nonnull @in1_0_cons_buff_0, ptr nonnull @in2_0_cons_buff_0, ptr nonnull @out_0_buff_0)
  tail call void @llvm.aie2.release(i32 48, i32 1)
  tail call void @llvm.aie2.release(i32 50, i32 1)
  tail call void @llvm.aie2.release(i32 53, i32 1)
  ret void
}

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
