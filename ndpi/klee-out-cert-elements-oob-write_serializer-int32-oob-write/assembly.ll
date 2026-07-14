; ModuleID = 'linked_cert-elements-oob-write_serializer-int32-oob-write.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ce_module = type { %struct.ce_packet }
%struct.ce_packet = type { i8*, i16 }
%struct.ce_flow = type { %struct.ce_module }
%struct.ser_private = type { %struct.ser_status, %struct.ser_buffer, i32, [2 x i8] }
%struct.ser_status = type { i32, %struct.ser_buf_status }
%struct.ser_buf_status = type { i32 }
%struct.ser_buffer = type { i32, i8* }
%struct.ser_serializer = type { [32 x i8] }

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@main.existing_names = internal global [1 x i8] zeroinitializer, align 1, !dbg !0
@.str.1 = private unnamed_addr constant [8 x i8] c"srv_len\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"p_offset\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"size_used\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"value\00", align 1
@.str.6 = private unnamed_addr constant [71 x i8] c"0 && \22REACHED_BOTH_cert-elements-oob-write_serializer-int32-oob-write\22\00", align 1
@.str.7 = private unnamed_addr constant [60 x i8] c"driver_cert-elements-oob-write_serializer-int32-oob-write.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [15 x i8] c"int main(void)\00", align 1

; Function Attrs: noinline noreturn nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !2 {
  %1 = alloca [256 x i8], align 16
  %2 = alloca %struct.ce_module, align 8
  %3 = alloca %struct.ce_flow, align 8
  %4 = alloca i16, align 2
  %5 = alloca i16, align 2
  %6 = alloca %struct.ser_private, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [256 x i8]* %1, metadata !93, metadata !DIExpression()), !dbg !97
  %9 = getelementptr inbounds [256 x i8], [256 x i8]* %1, i64 0, i64 0, !dbg !98
  call void @klee_make_symbolic(i8* nonnull %9, i64 256, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)) #8, !dbg !99
  call void @llvm.dbg.declare(metadata %struct.ce_module* %2, metadata !100, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata %struct.ce_flow* %3, metadata !111, metadata !DIExpression()), !dbg !122
  %10 = getelementptr inbounds %struct.ce_module, %struct.ce_module* %2, i64 0, i32 0, i32 1, !dbg !123
  %11 = bitcast i16* %10 to i64*, !dbg !123
  store i64 256, i64* %11, align 8, !dbg !123
  %12 = getelementptr inbounds %struct.ce_flow, %struct.ce_flow* %3, i64 0, i32 0, i32 0, i32 1, !dbg !124
  %13 = bitcast i16* %12 to i64*, !dbg !124
  store i64 0, i64* %13, align 8, !dbg !124
  %14 = getelementptr inbounds %struct.ce_module, %struct.ce_module* %2, i64 0, i32 0, i32 0, !dbg !125
  store i8* %9, i8** %14, align 8, !dbg !126
  %15 = getelementptr inbounds %struct.ce_flow, %struct.ce_flow* %3, i64 0, i32 0, i32 0, i32 0, !dbg !127
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @main.existing_names, i64 0, i64 0), i8** %15, align 8, !dbg !128
  %16 = bitcast i16* %4 to i8*, !dbg !129
  call void @llvm.dbg.value(metadata i16* %4, metadata !130, metadata !DIExpression(DW_OP_deref)), !dbg !131
  call void @klee_make_symbolic(i8* nonnull %16, i64 2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0)) #8, !dbg !132
  %17 = load i16, i16* %4, align 2, !dbg !133
  call void @llvm.dbg.value(metadata i16 %17, metadata !130, metadata !DIExpression()), !dbg !131
  %18 = icmp ugt i16 %17, -3, !dbg !134
  %19 = zext i1 %18 to i64, !dbg !133
  call void @klee_assume(i64 %19) #8, !dbg !135
  %20 = load i16, i16* %4, align 2, !dbg !136
  call void @llvm.dbg.value(metadata i16 %20, metadata !130, metadata !DIExpression()), !dbg !131
  store i16 %20, i16* %12, align 8, !dbg !137
  %21 = bitcast i16* %5 to i8*, !dbg !138
  call void @llvm.dbg.value(metadata i16* %5, metadata !139, metadata !DIExpression(DW_OP_deref)), !dbg !131
  call void @klee_make_symbolic(i8* nonnull %21, i64 2, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0)) #8, !dbg !140
  %22 = load i16, i16* %5, align 2, !dbg !141
  call void @llvm.dbg.value(metadata i16 %22, metadata !139, metadata !DIExpression()), !dbg !131
  %23 = icmp ult i16 %22, 256, !dbg !142
  %24 = zext i1 %23 to i64, !dbg !141
  call void @klee_assume(i64 %24) #8, !dbg !143
  call void @llvm.dbg.declare(metadata %struct.ser_private* %6, metadata !144, metadata !DIExpression()), !dbg !168
  %25 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %6, i64 0, i32 1, !dbg !169
  %26 = bitcast %struct.ser_buffer* %25 to i8*, !dbg !169
  %27 = call i8* @memset(i8* %26, i32 0, i64 24), !dbg !169
  %28 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %6, i64 0, i32 2, !dbg !170
  store i32 3, i32* %28, align 8, !dbg !171
  %29 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %6, i64 0, i32 1, i32 1, !dbg !172
  store i8* %9, i8** %29, align 8, !dbg !173
  %30 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %6, i64 0, i32 3, i64 0, !dbg !174
  store i8 44, i8* %30, align 4, !dbg !175
  %31 = bitcast i32* %7 to i8*, !dbg !176
  call void @llvm.dbg.value(metadata i32* %7, metadata !177, metadata !DIExpression(DW_OP_deref)), !dbg !131
  call void @klee_make_symbolic(i8* nonnull %31, i64 4, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0)) #8, !dbg !178
  %32 = load i32, i32* %7, align 4, !dbg !179
  call void @llvm.dbg.value(metadata i32 %32, metadata !177, metadata !DIExpression()), !dbg !131
  %33 = icmp ne i32 %32, 0, !dbg !180
  %34 = zext i1 %33 to i64, !dbg !179
  call void @klee_assume(i64 %34) #8, !dbg !181
  %35 = load i32, i32* %7, align 4, !dbg !182
  call void @llvm.dbg.value(metadata i32 %35, metadata !177, metadata !DIExpression()), !dbg !131
  %36 = add i32 %35, 11, !dbg !183
  %37 = icmp ult i32 %36, 257, !dbg !184
  %38 = zext i1 %37 to i64, !dbg !182
  call void @klee_assume(i64 %38) #8, !dbg !185
  %39 = load i32, i32* %7, align 4, !dbg !186
  call void @llvm.dbg.value(metadata i32 %39, metadata !177, metadata !DIExpression()), !dbg !131
  %40 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %6, i64 0, i32 0, i32 1, i32 0, !dbg !187
  store i32 %39, i32* %40, align 4, !dbg !188
  %41 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %6, i64 0, i32 1, i32 0, !dbg !189
  store i32 256, i32* %41, align 8, !dbg !190
  %42 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %6, i64 0, i32 0, i32 0, !dbg !191
  store i32 0, i32* %42, align 8, !dbg !192
  %43 = bitcast i32* %8 to i8*, !dbg !193
  call void @llvm.dbg.value(metadata i32* %8, metadata !194, metadata !DIExpression(DW_OP_deref)), !dbg !131
  call void @klee_make_symbolic(i8* nonnull %43, i64 4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i64 0, i64 0)) #8, !dbg !198
  %44 = load i32, i32* %8, align 4, !dbg !199
  call void @llvm.dbg.value(metadata i32 %44, metadata !194, metadata !DIExpression()), !dbg !131
  %45 = icmp ugt i32 %44, 999999999, !dbg !200
  %46 = zext i1 %45 to i64, !dbg !201
  call void @klee_assume(i64 %46) #8, !dbg !202
  %47 = bitcast %struct.ser_private* %6 to %struct.ser_serializer*, !dbg !203
  call void @llvm.dbg.value(metadata %struct.ser_serializer* %47, metadata !204, metadata !DIExpression()), !dbg !131
  %48 = load i16, i16* %5, align 2, !dbg !205
  call void @llvm.dbg.value(metadata i16 %48, metadata !139, metadata !DIExpression()), !dbg !131
  %49 = call fastcc i32 @predicate_cert_elements_oob_write(%struct.ce_module* nonnull %2, %struct.ce_flow* nonnull %3, i16 zeroext %48), !dbg !206
  call void @llvm.dbg.value(metadata i32 %49, metadata !207, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.value(metadata i32 undef, metadata !194, metadata !DIExpression()), !dbg !131
  %50 = call fastcc i32 @predicate_serializer_int32_oob_write(%struct.ser_serializer* nonnull %47), !dbg !208
  call void @llvm.dbg.value(metadata i32 %50, metadata !209, metadata !DIExpression()), !dbg !131
  %51 = icmp eq i32 %49, 1, !dbg !210
  %52 = icmp eq i32 %50, 1, !dbg !211
  %53 = select i1 %51, i1 %52, i1 false, !dbg !211
  %54 = zext i1 %53 to i64, !dbg !212
  call void @klee_assume(i64 %54) #8, !dbg !213
  call void @__assert_fail(i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.7, i64 0, i64 0), i32 101, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #9, !dbg !214
  unreachable, !dbg !214
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) local_unnamed_addr #2

declare dso_local void @klee_assume(i64) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #3

; Function Attrs: nofree noinline norecurse nosync nounwind uwtable
define internal fastcc i32 @predicate_cert_elements_oob_write(%struct.ce_module* nocapture readonly %0, %struct.ce_flow* nocapture %1, i16 zeroext %2) unnamed_addr #4 !dbg !215 {
  call void @llvm.dbg.value(metadata %struct.ce_module* %0, metadata !240, metadata !DIExpression()), !dbg !241
  call void @llvm.dbg.value(metadata %struct.ce_flow* %1, metadata !242, metadata !DIExpression()), !dbg !241
  call void @llvm.dbg.value(metadata i16 %2, metadata !243, metadata !DIExpression()), !dbg !241
  call void @llvm.dbg.value(metadata i16 256, metadata !244, metadata !DIExpression()), !dbg !241
  call void @llvm.dbg.value(metadata %struct.ce_module* %0, metadata !245, metadata !DIExpression()), !dbg !241
  call void @llvm.dbg.value(metadata i16 %2, metadata !247, metadata !DIExpression()), !dbg !241
  %4 = icmp ult i16 %2, 256, !dbg !248
  br i1 %4, label %.lr.ph17, label %.loopexit10, !dbg !251

.lr.ph17:                                         ; preds = %3
  %5 = getelementptr inbounds %struct.ce_module, %struct.ce_module* %0, i64 0, i32 0, i32 1
  %6 = getelementptr inbounds %struct.ce_module, %struct.ce_module* %0, i64 0, i32 0, i32 0
  %7 = getelementptr inbounds %struct.ce_flow, %struct.ce_flow* %1, i64 0, i32 0, i32 0, i32 0
  %8 = getelementptr inbounds %struct.ce_flow, %struct.ce_flow* %1, i64 0, i32 0, i32 0, i32 1
  %.pre = load i16, i16* %5, align 8, !dbg !252
  br label %9, !dbg !251

9:                                                ; preds = %.lr.ph17, %.loopexit
  %10 = phi i16 [ %.pre, %.lr.ph17 ], [ %100, %.loopexit ]
  %11 = phi i16 [ %.pre, %.lr.ph17 ], [ %101, %.loopexit ], !dbg !252
  %.0116 = phi i16 [ %2, %.lr.ph17 ], [ %102, %.loopexit ]
  call void @llvm.dbg.value(metadata i16 %.0116, metadata !247, metadata !DIExpression()), !dbg !241
  %12 = zext i16 %.0116 to i32, !dbg !255
  %13 = add nuw nsw i32 %12, 2, !dbg !256
  %14 = zext i16 %11 to i32, !dbg !257
  %.not = icmp ult i32 %13, %14, !dbg !258
  br i1 %.not, label %15, label %.loopexit10, !dbg !259

15:                                               ; preds = %9
  %16 = load i8*, i8** %6, align 8, !dbg !260
  %17 = zext i16 %.0116 to i64, !dbg !262
  %18 = getelementptr inbounds i8, i8* %16, i64 %17, !dbg !262
  %19 = load i8, i8* %18, align 1, !dbg !262
  %20 = icmp eq i8 %19, 85, !dbg !263
  br i1 %20, label %21, label %.loopexit, !dbg !264

21:                                               ; preds = %15
  %22 = add nuw nsw i64 %17, 1, !dbg !265
  %23 = getelementptr inbounds i8, i8* %16, i64 %22, !dbg !266
  %24 = load i8, i8* %23, align 1, !dbg !266
  %25 = icmp eq i8 %24, 29, !dbg !267
  br i1 %25, label %26, label %.loopexit, !dbg !268

26:                                               ; preds = %21
  %27 = add nuw nsw i64 %17, 2, !dbg !269
  %28 = getelementptr inbounds i8, i8* %16, i64 %27, !dbg !270
  %29 = load i8, i8* %28, align 1, !dbg !270
  %30 = icmp eq i8 %29, 17, !dbg !271
  br i1 %30, label %31, label %.loopexit, !dbg !272

31:                                               ; preds = %26
  %32 = add i16 %.0116, 3, !dbg !273
  call void @llvm.dbg.value(metadata i16 %32, metadata !247, metadata !DIExpression()), !dbg !241
  %.not2 = icmp ult i16 %32, %11, !dbg !275
  br i1 %.not2, label %33, label %.loopexit10, !dbg !277

33:                                               ; preds = %31
  %34 = zext i16 %32 to i64, !dbg !278
  %35 = getelementptr inbounds i8, i8* %16, i64 %34, !dbg !278
  %36 = load i8, i8* %35, align 1, !dbg !278
  %37 = icmp eq i8 %36, 4, !dbg !280
  %.1.v = select i1 %37, i16 4, i16 7, !dbg !281
  %.1 = add i16 %.1.v, %.0116, !dbg !281
  call void @llvm.dbg.value(metadata i16 %.1, metadata !247, metadata !DIExpression()), !dbg !241
  %.not3 = icmp ult i16 %.1, %11, !dbg !282
  br i1 %.not3, label %38, label %.loopexit10, !dbg !284

38:                                               ; preds = %33
  %39 = zext i16 %.1 to i64, !dbg !285
  %40 = getelementptr inbounds i8, i8* %16, i64 %39, !dbg !285
  %41 = load i8, i8* %40, align 1, !dbg !285
  %42 = and i8 %41, 127, !dbg !286
  %.not4.inv = icmp slt i8 %41, 0, !dbg !286
  %narrow = select i1 %.not4.inv, i8 %42, i8 0, !dbg !286
  %43 = zext i8 %narrow to i16, !dbg !286
  %44 = add i16 %.1, %43, !dbg !287
  call void @llvm.dbg.value(metadata i16 %44, metadata !247, metadata !DIExpression()), !dbg !241
  %.not5 = icmp ult i16 %44, %11, !dbg !288
  br i1 %.not5, label %45, label %.loopexit10, !dbg !290

45:                                               ; preds = %38
  %46 = add i16 %44, 2, !dbg !291
  call void @llvm.dbg.value(metadata i16 %46, metadata !247, metadata !DIExpression()), !dbg !241
  %.not6 = icmp ult i16 %46, %11, !dbg !292
  br i1 %.not6, label %47, label %.loopexit10, !dbg !294

47:                                               ; preds = %45
  %48 = zext i16 %46 to i64, !dbg !295
  %49 = getelementptr inbounds i8, i8* %16, i64 %48, !dbg !295
  %50 = load i8, i8* %49, align 1, !dbg !295
  %51 = and i8 %50, 127, !dbg !296
  %.not7.inv = icmp slt i8 %50, 0, !dbg !296
  %narrow1 = select i1 %.not7.inv, i8 %51, i8 0, !dbg !296
  %52 = zext i8 %narrow1 to i16, !dbg !296
  call void @llvm.dbg.value(metadata i16 undef, metadata !247, metadata !DIExpression()), !dbg !241
  %53 = add i16 %44, 3, !dbg !297
  %54 = add i16 %53, %52, !dbg !298
  call void @llvm.dbg.value(metadata i16 %54, metadata !247, metadata !DIExpression()), !dbg !241
  %55 = icmp ult i16 %54, %10, !dbg !299
  br i1 %55, label %.lr.ph, label %.loopexit, !dbg !300

.lr.ph:                                           ; preds = %47, %._crit_edge
  %56 = phi i8* [ %.pre25, %._crit_edge ], [ %16, %47 ], !dbg !301
  %57 = phi i16 [ %98, %._crit_edge ], [ %10, %47 ]
  %.213 = phi i16 [ %97, %._crit_edge ], [ %54, %47 ]
  call void @llvm.dbg.value(metadata i16 %.213, metadata !247, metadata !DIExpression()), !dbg !241
  %58 = zext i16 %.213 to i64, !dbg !303
  %59 = getelementptr inbounds i8, i8* %56, i64 %58, !dbg !303
  %60 = load i8, i8* %59, align 1, !dbg !303
  call void @llvm.dbg.value(metadata i8 %60, metadata !304, metadata !DIExpression()), !dbg !305
  switch i8 %60, label %.loopexit [
    i8 -127, label %61
    i8 -126, label %61
    i8 -121, label %61
  ], !dbg !306

61:                                               ; preds = %.lr.ph, %.lr.ph, %.lr.ph
  %62 = zext i16 %.213 to i32, !dbg !308
  %63 = add nuw nsw i32 %62, 1, !dbg !311
  %64 = zext i16 %57 to i32, !dbg !312
  %.not8 = icmp ult i32 %63, %64, !dbg !313
  br i1 %.not8, label %65, label %.loopexit10, !dbg !314

65:                                               ; preds = %61
  %66 = add nuw nsw i64 %58, 1, !dbg !315
  %67 = getelementptr inbounds i8, i8* %56, i64 %66, !dbg !316
  %68 = load i8, i8* %67, align 1, !dbg !316
  call void @llvm.dbg.value(metadata i8 %68, metadata !317, metadata !DIExpression()), !dbg !318
  %69 = add nsw i32 %64, -1, !dbg !319
  %70 = icmp sgt i32 %69, %62, !dbg !321
  br i1 %70, label %71, label %.loopexit10, !dbg !322

71:                                               ; preds = %65
  %72 = zext i8 %68 to i32, !dbg !323
  %73 = add nuw nsw i32 %62, 2, !dbg !324
  %74 = add nuw nsw i32 %73, %72, !dbg !325
  %75 = icmp ult i32 %74, %64, !dbg !326
  br i1 %75, label %76, label %.loopexit10, !dbg !327

76:                                               ; preds = %71
  %77 = add i16 %.213, 2, !dbg !328
  call void @llvm.dbg.value(metadata i16 %77, metadata !247, metadata !DIExpression()), !dbg !241
  %78 = icmp eq i8 %68, 0, !dbg !329
  br i1 %78, label %.loopexit10, label %79, !dbg !331

79:                                               ; preds = %76
  %80 = zext i16 %77 to i32, !dbg !332
  %81 = add nuw nsw i32 %72, %80, !dbg !334
  %82 = icmp ugt i32 %81, %64, !dbg !335
  br i1 %82, label %.loopexit10, label %83, !dbg !336

83:                                               ; preds = %79
  call void @llvm.dbg.value(metadata i8 %68, metadata !337, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !318
  %84 = load i8*, i8** %7, align 8, !dbg !338
  %.not9 = icmp eq i8* %84, null, !dbg !340
  br i1 %.not9, label %94, label %85, !dbg !341

85:                                               ; preds = %83
  %86 = load i16, i16* %8, align 8, !dbg !342
  %87 = zext i16 %86 to i32, !dbg !345
  %88 = add nuw nsw i32 %87, %72, !dbg !346
  %89 = icmp ugt i32 %88, 65534, !dbg !347
  br i1 %89, label %.loopexit10, label %90, !dbg !348

90:                                               ; preds = %85
  %91 = zext i8 %68 to i16, !dbg !349
  %92 = add nuw nsw i16 %91, 1, !dbg !350
  %93 = add i16 %92, %86, !dbg !351
  br label %96, !dbg !352

94:                                               ; preds = %83
  %95 = zext i8 %68 to i16, !dbg !353
  call void @llvm.dbg.value(metadata i16 %95, metadata !337, metadata !DIExpression()), !dbg !318
  store i8* inttoptr (i64 1 to i8*), i8** %7, align 8, !dbg !354
  br label %96

96:                                               ; preds = %94, %90
  %storemerge = phi i16 [ %93, %90 ], [ %95, %94 ], !dbg !356
  %.pre-phi = phi i16 [ %91, %90 ], [ %95, %94 ], !dbg !357
  store i16 %storemerge, i16* %8, align 8, !dbg !356
  %97 = add i16 %77, %.pre-phi, !dbg !358
  call void @llvm.dbg.value(metadata i16 %97, metadata !247, metadata !DIExpression()), !dbg !241
  %98 = load i16, i16* %5, align 8, !dbg !359
  %99 = icmp ult i16 %97, %98, !dbg !299
  br i1 %99, label %._crit_edge, label %.loopexit, !dbg !300, !llvm.loop !360

._crit_edge:                                      ; preds = %96
  %.pre25 = load i8*, i8** %6, align 8, !dbg !301
  br label %.lr.ph, !dbg !300

.loopexit:                                        ; preds = %96, %.lr.ph, %47, %15, %21, %26
  %100 = phi i16 [ %10, %26 ], [ %10, %21 ], [ %10, %15 ], [ %10, %47 ], [ %57, %.lr.ph ], [ %98, %96 ]
  %101 = phi i16 [ %11, %26 ], [ %11, %21 ], [ %11, %15 ], [ %10, %47 ], [ %57, %.lr.ph ], [ %98, %96 ]
  %.3 = phi i16 [ %.0116, %26 ], [ %.0116, %21 ], [ %.0116, %15 ], [ %54, %47 ], [ %.213, %.lr.ph ], [ %97, %96 ], !dbg !363
  call void @llvm.dbg.value(metadata i16 %.3, metadata !247, metadata !DIExpression()), !dbg !241
  %102 = add i16 %.3, 1, !dbg !364
  call void @llvm.dbg.value(metadata i16 %102, metadata !247, metadata !DIExpression()), !dbg !241
  %103 = icmp ult i16 %102, 256, !dbg !248
  br i1 %103, label %9, label %.loopexit10, !dbg !251, !llvm.loop !365

.loopexit10:                                      ; preds = %9, %31, %33, %38, %45, %.loopexit, %85, %79, %76, %65, %71, %61, %3
  %.0 = phi i32 [ 0, %3 ], [ 0, %61 ], [ 0, %71 ], [ 0, %65 ], [ 0, %76 ], [ 0, %79 ], [ 1, %85 ], [ 0, %.loopexit ], [ 0, %45 ], [ 0, %38 ], [ 0, %33 ], [ 0, %31 ], [ 0, %9 ], !dbg !241
  ret i32 %.0, !dbg !367
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readonly uwtable willreturn
define internal fastcc i32 @predicate_serializer_int32_oob_write(%struct.ser_serializer* nocapture readonly %0) unnamed_addr #5 !dbg !368 {
  call void @llvm.dbg.value(metadata %struct.ser_serializer* %0, metadata !378, metadata !DIExpression()), !dbg !379
  call void @llvm.dbg.value(metadata i8* undef, metadata !380, metadata !DIExpression()), !dbg !379
  call void @llvm.dbg.value(metadata i32 undef, metadata !381, metadata !DIExpression()), !dbg !379
  call void @llvm.dbg.value(metadata %struct.ser_serializer* %0, metadata !382, metadata !DIExpression()), !dbg !379
  %2 = getelementptr inbounds %struct.ser_serializer, %struct.ser_serializer* %0, i64 0, i32 0, i64 24, !dbg !383
  %3 = bitcast i8* %2 to i32*, !dbg !383
  %4 = load i32, i32* %3, align 8, !dbg !383
  %.not = icmp eq i32 %4, 3, !dbg !385
  br i1 %.not, label %5, label %30, !dbg !386

5:                                                ; preds = %1
  %6 = getelementptr inbounds %struct.ser_serializer, %struct.ser_serializer* %0, i64 0, i32 0, i64 16, !dbg !387
  %7 = bitcast i8* %6 to i8**, !dbg !387
  %8 = load i8*, i8** %7, align 8, !dbg !387
  %9 = icmp eq i8* %8, null, !dbg !389
  br i1 %9, label %30, label %10, !dbg !390

10:                                               ; preds = %5
  %11 = getelementptr inbounds %struct.ser_serializer, %struct.ser_serializer* %0, i64 0, i32 0, i64 4, !dbg !391
  %12 = bitcast i8* %11 to i32*, !dbg !393
  %13 = load i32, i32* %12, align 4, !dbg !393
  %14 = getelementptr inbounds %struct.ser_serializer, %struct.ser_serializer* %0, i64 0, i32 0, i64 8, !dbg !394
  %15 = bitcast i8* %14 to i32*, !dbg !395
  %16 = load i32, i32* %15, align 8, !dbg !395
  %17 = icmp ult i32 %16, %13, !dbg !396
  %18 = sub i32 %16, %13
  %19 = icmp ult i32 %18, 11
  %or.cond6 = or i1 %17, %19, !dbg !397
  call void @llvm.dbg.value(metadata i32 %18, metadata !398, metadata !DIExpression()), !dbg !379
  call void @llvm.dbg.value(metadata i16 11, metadata !399, metadata !DIExpression()), !dbg !379
  br i1 %or.cond6, label %30, label %20, !dbg !397

20:                                               ; preds = %10
  call void @llvm.dbg.value(metadata i32 %13, metadata !401, metadata !DIExpression()), !dbg !379
  %21 = bitcast %struct.ser_serializer* %0 to i32*, !dbg !402
  %22 = load i32, i32* %21, align 8, !dbg !402
  %23 = and i32 %22, 4, !dbg !404
  %24 = icmp eq i32 %23, 0, !dbg !404
  %25 = icmp ne i32 %13, 0
  %or.cond = select i1 %24, i1 %25, i1 false, !dbg !405
  br i1 %or.cond, label %26, label %29, !dbg !405

26:                                               ; preds = %20
  %.not4 = icmp ugt i32 %16, %13, !dbg !406
  br i1 %.not4, label %27, label %30, !dbg !409

27:                                               ; preds = %26
  %28 = add i32 %13, 1, !dbg !410
  call void @llvm.dbg.value(metadata i32 %28, metadata !401, metadata !DIExpression()), !dbg !379
  br label %29, !dbg !411

29:                                               ; preds = %27, %20
  %.02 = phi i32 [ %28, %27 ], [ %13, %20 ], !dbg !379
  call void @llvm.dbg.value(metadata i32 %.02, metadata !401, metadata !DIExpression()), !dbg !379
  call void @llvm.dbg.value(metadata i16 10, metadata !399, metadata !DIExpression()), !dbg !379
  %.not3 = icmp ult i32 %.02, %16, !dbg !412
  %. = zext i1 %.not3 to i32, !dbg !379
  br label %30, !dbg !379

30:                                               ; preds = %29, %26, %10, %5, %1
  %.0 = phi i32 [ 0, %1 ], [ 0, %5 ], [ 0, %10 ], [ 0, %26 ], [ %., %29 ], !dbg !379
  ret i32 %.0, !dbg !414
}

; Function Attrs: nofree noinline norecurse nosync nounwind uwtable writeonly
define dso_local i8* @memset(i8* returned %0, i32 %1, i64 %2) local_unnamed_addr #6 !dbg !415 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !421, metadata !DIExpression()), !dbg !422
  call void @llvm.dbg.value(metadata i32 %1, metadata !423, metadata !DIExpression()), !dbg !422
  call void @llvm.dbg.value(metadata i64 %2, metadata !424, metadata !DIExpression()), !dbg !422
  call void @llvm.dbg.value(metadata i8* %0, metadata !425, metadata !DIExpression()), !dbg !422
  call void @llvm.dbg.value(metadata i64 %2, metadata !424, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !422
  %.not2 = icmp eq i64 %2, 0, !dbg !426
  br i1 %.not2, label %._crit_edge, label %.lr.ph, !dbg !427

.lr.ph:                                           ; preds = %3
  %4 = trunc i32 %1 to i8
  br label %5, !dbg !427

5:                                                ; preds = %.lr.ph, %5
  %.04 = phi i8* [ %0, %.lr.ph ], [ %7, %5 ]
  %.013 = phi i64 [ %2, %.lr.ph ], [ %6, %5 ]
  call void @llvm.dbg.value(metadata i8* %.04, metadata !425, metadata !DIExpression()), !dbg !422
  call void @llvm.dbg.value(metadata i64 %.013, metadata !424, metadata !DIExpression()), !dbg !422
  %6 = add i64 %.013, -1, !dbg !428
  call void @llvm.dbg.value(metadata i64 %6, metadata !424, metadata !DIExpression()), !dbg !422
  %7 = getelementptr inbounds i8, i8* %.04, i64 1, !dbg !429
  call void @llvm.dbg.value(metadata i8* %7, metadata !425, metadata !DIExpression()), !dbg !422
  store i8 %4, i8* %.04, align 1, !dbg !430
  call void @llvm.dbg.value(metadata i64 %6, metadata !424, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !422
  %.not = icmp eq i64 %6, 0, !dbg !426
  br i1 %.not, label %._crit_edge, label %5, !dbg !427, !llvm.loop !431

._crit_edge:                                      ; preds = %5, %3
  ret i8* %0, !dbg !433
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #7

attributes #0 = { noinline noreturn nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree noinline norecurse nosync nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree noinline norecurse nosync nounwind readonly uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree noinline norecurse nosync nounwind uwtable writeonly "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!7, !35, !48, !85}
!llvm.ident = !{!87, !87, !87, !87}
!llvm.module.flags = !{!88, !89, !90, !91, !92}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "existing_names", scope: !2, file: !3, line: 59, type: !32, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 46, type: !4, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !31)
!3 = !DIFile(filename: "driver_cert-elements-oob-write_serializer-int32-oob-write.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!4 = !DISubroutineType(types: !5)
!5 = !{!6}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, retainedTypes: !16, globals: !30, splitDebugInlining: false, nameTableKind: None)
!8 = !{!9}
!9 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !3, line: 32, baseType: !10, size: 32, elements: !11)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!12, !13, !14, !15}
!12 = !DIEnumerator(name: "ser_fmt_unknown", value: 0)
!13 = !DIEnumerator(name: "ser_fmt_tlv", value: 1)
!14 = !DIEnumerator(name: "ser_fmt_json", value: 2)
!15 = !DIEnumerator(name: "ser_fmt_csv", value: 3)
!16 = !{!17, !21}
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !18, line: 26, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !20, line: 42, baseType: !10)
!20 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_serializer", file: !3, line: 41, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 41, size: 256, elements: !24)
!24 = !{!25}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "c", scope: !23, file: !3, line: 41, baseType: !26, size: 256)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 256, elements: !28)
!27 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!28 = !{!29}
!29 = !DISubrange(count: 32)
!30 = !{!0}
!31 = !{}
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 8, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 1)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !31, retainedTypes: !37, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "predicate_cert-elements-oob-write.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!37 = !{!38, !39, !40, !44, !45}
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int32_t", file: !36, line: 28, baseType: !17)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int16_t", file: !36, line: 27, baseType: !41)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !18, line: 25, baseType: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !20, line: 40, baseType: !43)
!43 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !46, line: 79, baseType: !47)
!46 = !DIFile(filename: "/usr/include/stdint.h", directory: "")
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = distinct !DICompileUnit(language: DW_LANG_C99, file: !49, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !50, retainedTypes: !52, splitDebugInlining: false, nameTableKind: None)
!49 = !DIFile(filename: "predicate_serializer-int32-oob-write.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!50 = !{!51}
!51 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !49, line: 35, baseType: !10, size: 32, elements: !11)
!52 = !{!53, !39}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_private", file: !49, line: 62, baseType: !55)
!55 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !49, line: 57, size: 256, elements: !56)
!56 = !{!57, !68, !79, !81}
!57 = !DIDerivedType(tag: DW_TAG_member, name: "status", scope: !55, file: !49, line: 58, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_status", file: !49, line: 50, baseType: !59)
!59 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !49, line: 47, size: 64, elements: !60)
!60 = !{!61, !63}
!61 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !59, file: !49, line: 48, baseType: !62, size: 32)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int32_t", file: !49, line: 33, baseType: !17)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !59, file: !49, line: 49, baseType: !64, size: 32, offset: 32)
!64 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_buf_status", file: !49, line: 45, baseType: !65)
!65 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !49, line: 45, size: 32, elements: !66)
!66 = !{!67}
!67 = !DIDerivedType(tag: DW_TAG_member, name: "size_used", scope: !65, file: !49, line: 45, baseType: !62, size: 32)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !55, file: !49, line: 59, baseType: !69, size: 128, offset: 64)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_buffer", file: !49, line: 55, baseType: !70)
!70 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !49, line: 52, size: 128, elements: !71)
!71 = !{!72, !73}
!72 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !70, file: !49, line: 53, baseType: !62, size: 32)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !70, file: !49, line: 54, baseType: !74, size: 64, offset: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int8_t", file: !49, line: 31, baseType: !76)
!76 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !18, line: 24, baseType: !77)
!77 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !20, line: 38, baseType: !78)
!78 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "fmt", scope: !55, file: !49, line: 60, baseType: !80, size: 32, offset: 192)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_format", file: !49, line: 40, baseType: !51)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "csv_separator", scope: !55, file: !49, line: 61, baseType: !82, size: 16, offset: 224)
!82 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 16, elements: !83)
!83 = !{!84}
!84 = !DISubrange(count: 2)
!85 = distinct !DICompileUnit(language: DW_LANG_C99, file: !86, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !31, splitDebugInlining: false, nameTableKind: None)
!86 = !DIFile(filename: "/home/wcontrerasmartinez/klee/runtime/Freestanding/memset.c", directory: "/home/wcontrerasmartinez/klee/build/runtime/Freestanding")
!87 = !{!"Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8"}
!88 = !{i32 7, !"Dwarf Version", i32 4}
!89 = !{i32 2, !"Debug Info Version", i32 3}
!90 = !{i32 1, !"wchar_size", i32 4}
!91 = !{i32 7, !"uwtable", i32 1}
!92 = !{i32 7, !"frame-pointer", i32 2}
!93 = !DILocalVariable(name: "buf", scope: !2, file: !3, line: 47, type: !94)
!94 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 2048, elements: !95)
!95 = !{!96}
!96 = !DISubrange(count: 256)
!97 = !DILocation(line: 47, column: 11, scope: !2)
!98 = !DILocation(line: 48, column: 22, scope: !2)
!99 = !DILocation(line: 48, column: 3, scope: !2)
!100 = !DILocalVariable(name: "ce_mod", scope: !2, file: !3, line: 51, type: !101)
!101 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_module", file: !3, line: 26, size: 128, elements: !102)
!102 = !{!103}
!103 = !DIDerivedType(tag: DW_TAG_member, name: "packet", scope: !101, file: !3, line: 26, baseType: !104, size: 128)
!104 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_packet", file: !3, line: 25, size: 128, elements: !105)
!105 = !{!106, !109}
!106 = !DIDerivedType(tag: DW_TAG_member, name: "payload", scope: !104, file: !3, line: 25, baseType: !107, size: 64)
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !76)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "payload_packet_len", scope: !104, file: !3, line: 25, baseType: !41, size: 16, offset: 64)
!110 = !DILocation(line: 51, column: 20, scope: !2)
!111 = !DILocalVariable(name: "ce_flow", scope: !2, file: !3, line: 52, type: !112)
!112 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_flow", file: !3, line: 24, size: 128, elements: !113)
!113 = !{!114}
!114 = !DIDerivedType(tag: DW_TAG_member, name: "protos", scope: !112, file: !3, line: 24, baseType: !115, size: 128)
!115 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !112, file: !3, line: 24, size: 128, elements: !116)
!116 = !{!117}
!117 = !DIDerivedType(tag: DW_TAG_member, name: "tls_quic", scope: !115, file: !3, line: 24, baseType: !118, size: 128)
!118 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_tls_quic", file: !3, line: 23, size: 128, elements: !119)
!119 = !{!120, !121}
!120 = !DIDerivedType(tag: DW_TAG_member, name: "server_names", scope: !118, file: !3, line: 23, baseType: !44, size: 64)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "server_names_len", scope: !118, file: !3, line: 23, baseType: !41, size: 16, offset: 64)
!122 = !DILocation(line: 52, column: 20, scope: !2)
!123 = !DILocation(line: 53, column: 3, scope: !2)
!124 = !DILocation(line: 54, column: 3, scope: !2)
!125 = !DILocation(line: 56, column: 17, scope: !2)
!126 = !DILocation(line: 56, column: 36, scope: !2)
!127 = !DILocation(line: 60, column: 27, scope: !2)
!128 = !DILocation(line: 60, column: 40, scope: !2)
!129 = !DILocation(line: 63, column: 22, scope: !2)
!130 = !DILocalVariable(name: "srv_len", scope: !2, file: !3, line: 62, type: !41)
!131 = !DILocation(line: 0, scope: !2)
!132 = !DILocation(line: 63, column: 3, scope: !2)
!133 = !DILocation(line: 64, column: 15, scope: !2)
!134 = !DILocation(line: 64, column: 23, scope: !2)
!135 = !DILocation(line: 64, column: 3, scope: !2)
!136 = !DILocation(line: 65, column: 46, scope: !2)
!137 = !DILocation(line: 65, column: 44, scope: !2)
!138 = !DILocation(line: 68, column: 22, scope: !2)
!139 = !DILocalVariable(name: "p_offset", scope: !2, file: !3, line: 67, type: !41)
!140 = !DILocation(line: 68, column: 3, scope: !2)
!141 = !DILocation(line: 69, column: 15, scope: !2)
!142 = !DILocation(line: 69, column: 24, scope: !2)
!143 = !DILocation(line: 69, column: 3, scope: !2)
!144 = !DILocalVariable(name: "ser", scope: !2, file: !3, line: 72, type: !145)
!145 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_private", file: !3, line: 40, baseType: !146)
!146 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 38, size: 256, elements: !147)
!147 = !{!148, !158, !165, !167}
!148 = !DIDerivedType(tag: DW_TAG_member, name: "status", scope: !146, file: !3, line: 39, baseType: !149, size: 64)
!149 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_status", file: !3, line: 36, baseType: !150)
!150 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 36, size: 64, elements: !151)
!151 = !{!152, !153}
!152 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !150, file: !3, line: 36, baseType: !17, size: 32)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !150, file: !3, line: 36, baseType: !154, size: 32, offset: 32)
!154 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_buf_status", file: !3, line: 35, baseType: !155)
!155 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 35, size: 32, elements: !156)
!156 = !{!157}
!157 = !DIDerivedType(tag: DW_TAG_member, name: "size_used", scope: !155, file: !3, line: 35, baseType: !17, size: 32)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !146, file: !3, line: 39, baseType: !159, size: 128, offset: 64)
!159 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_buffer", file: !3, line: 37, baseType: !160)
!160 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 37, size: 128, elements: !161)
!161 = !{!162, !163}
!162 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !160, file: !3, line: 37, baseType: !17, size: 32)
!163 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !160, file: !3, line: 37, baseType: !164, size: 64, offset: 64)
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!165 = !DIDerivedType(tag: DW_TAG_member, name: "fmt", scope: !146, file: !3, line: 39, baseType: !166, size: 32, offset: 192)
!166 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_format", file: !3, line: 33, baseType: !9)
!167 = !DIDerivedType(tag: DW_TAG_member, name: "csv_separator", scope: !146, file: !3, line: 39, baseType: !82, size: 16, offset: 224)
!168 = !DILocation(line: 72, column: 15, scope: !2)
!169 = !DILocation(line: 73, column: 3, scope: !2)
!170 = !DILocation(line: 75, column: 7, scope: !2)
!171 = !DILocation(line: 75, column: 32, scope: !2)
!172 = !DILocation(line: 76, column: 14, scope: !2)
!173 = !DILocation(line: 76, column: 32, scope: !2)
!174 = !DILocation(line: 77, column: 3, scope: !2)
!175 = !DILocation(line: 77, column: 32, scope: !2)
!176 = !DILocation(line: 82, column: 22, scope: !2)
!177 = !DILocalVariable(name: "su", scope: !2, file: !3, line: 81, type: !17)
!178 = !DILocation(line: 82, column: 3, scope: !2)
!179 = !DILocation(line: 83, column: 15, scope: !2)
!180 = !DILocation(line: 83, column: 18, scope: !2)
!181 = !DILocation(line: 83, column: 3, scope: !2)
!182 = !DILocation(line: 84, column: 15, scope: !2)
!183 = !DILocation(line: 84, column: 18, scope: !2)
!184 = !DILocation(line: 84, column: 24, scope: !2)
!185 = !DILocation(line: 84, column: 3, scope: !2)
!186 = !DILocation(line: 85, column: 34, scope: !2)
!187 = !DILocation(line: 85, column: 21, scope: !2)
!188 = !DILocation(line: 85, column: 32, scope: !2)
!189 = !DILocation(line: 86, column: 14, scope: !2)
!190 = !DILocation(line: 86, column: 32, scope: !2)
!191 = !DILocation(line: 87, column: 14, scope: !2)
!192 = !DILocation(line: 87, column: 32, scope: !2)
!193 = !DILocation(line: 90, column: 22, scope: !2)
!194 = !DILocalVariable(name: "value", scope: !2, file: !3, line: 89, type: !195)
!195 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !196, line: 26, baseType: !197)
!196 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!197 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !20, line: 41, baseType: !6)
!198 = !DILocation(line: 90, column: 3, scope: !2)
!199 = !DILocation(line: 92, column: 25, scope: !2)
!200 = !DILocation(line: 92, column: 31, scope: !2)
!201 = !DILocation(line: 92, column: 15, scope: !2)
!202 = !DILocation(line: 92, column: 3, scope: !2)
!203 = !DILocation(line: 94, column: 26, scope: !2)
!204 = !DILocalVariable(name: "sser", scope: !2, file: !3, line: 94, type: !21)
!205 = !DILocation(line: 97, column: 50, scope: !2)
!206 = !DILocation(line: 96, column: 15, scope: !2)
!207 = !DILocalVariable(name: "r_ce", scope: !2, file: !3, line: 96, type: !6)
!208 = !DILocation(line: 98, column: 15, scope: !2)
!209 = !DILocalVariable(name: "r_ser", scope: !2, file: !3, line: 98, type: !6)
!210 = !DILocation(line: 100, column: 20, scope: !2)
!211 = !DILocation(line: 100, column: 25, scope: !2)
!212 = !DILocation(line: 100, column: 15, scope: !2)
!213 = !DILocation(line: 100, column: 3, scope: !2)
!214 = !DILocation(line: 101, column: 3, scope: !2)
!215 = distinct !DISubprogram(name: "predicate_cert_elements_oob_write", scope: !36, file: !36, line: 49, type: !216, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !35, retainedNodes: !31)
!216 = !DISubroutineType(types: !217)
!217 = !{!6, !218, !229, !40, !40}
!218 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !219, size: 64)
!219 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_module", file: !36, line: 45, size: 128, elements: !220)
!220 = !{!221}
!221 = !DIDerivedType(tag: DW_TAG_member, name: "packet", scope: !219, file: !36, line: 46, baseType: !222, size: 128)
!222 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_packet", file: !36, line: 40, size: 128, elements: !223)
!223 = !{!224, !228}
!224 = !DIDerivedType(tag: DW_TAG_member, name: "payload", scope: !222, file: !36, line: 41, baseType: !225, size: 64)
!225 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !226, size: 64)
!226 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !227)
!227 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int8_t", file: !36, line: 26, baseType: !76)
!228 = !DIDerivedType(tag: DW_TAG_member, name: "payload_packet_len", scope: !222, file: !36, line: 42, baseType: !40, size: 16, offset: 64)
!229 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !230, size: 64)
!230 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_flow", file: !36, line: 36, size: 128, elements: !231)
!231 = !{!232}
!232 = !DIDerivedType(tag: DW_TAG_member, name: "protos", scope: !230, file: !36, line: 37, baseType: !233, size: 128)
!233 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !230, file: !36, line: 37, size: 128, elements: !234)
!234 = !{!235}
!235 = !DIDerivedType(tag: DW_TAG_member, name: "tls_quic", scope: !233, file: !36, line: 37, baseType: !236, size: 128)
!236 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_tls_quic", file: !36, line: 31, size: 128, elements: !237)
!237 = !{!238, !239}
!238 = !DIDerivedType(tag: DW_TAG_member, name: "server_names", scope: !236, file: !36, line: 32, baseType: !44, size: 64)
!239 = !DIDerivedType(tag: DW_TAG_member, name: "server_names_len", scope: !236, file: !36, line: 33, baseType: !40, size: 16, offset: 64)
!240 = !DILocalVariable(name: "ndpi_struct", arg: 1, scope: !215, file: !36, line: 50, type: !218)
!241 = !DILocation(line: 0, scope: !215)
!242 = !DILocalVariable(name: "flow", arg: 2, scope: !215, file: !36, line: 51, type: !229)
!243 = !DILocalVariable(name: "p_offset", arg: 3, scope: !215, file: !36, line: 52, type: !40)
!244 = !DILocalVariable(name: "certificate_len", arg: 4, scope: !215, file: !36, line: 53, type: !40)
!245 = !DILocalVariable(name: "packet", scope: !215, file: !36, line: 55, type: !246)
!246 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !222, size: 64)
!247 = !DILocalVariable(name: "i", scope: !215, file: !36, line: 56, type: !40)
!248 = !DILocation(line: 58, column: 24, scope: !249)
!249 = distinct !DILexicalBlock(scope: !250, file: !36, line: 58, column: 3)
!250 = distinct !DILexicalBlock(scope: !215, file: !36, line: 58, column: 3)
!251 = !DILocation(line: 58, column: 3, scope: !250)
!252 = !DILocation(line: 60, column: 37, scope: !253)
!253 = distinct !DILexicalBlock(scope: !254, file: !36, line: 60, column: 9)
!254 = distinct !DILexicalBlock(scope: !249, file: !36, line: 58, column: 48)
!255 = !DILocation(line: 60, column: 9, scope: !253)
!256 = !DILocation(line: 60, column: 22, scope: !253)
!257 = !DILocation(line: 60, column: 29, scope: !253)
!258 = !DILocation(line: 60, column: 26, scope: !253)
!259 = !DILocation(line: 60, column: 9, scope: !254)
!260 = !DILocation(line: 62, column: 18, scope: !261)
!261 = distinct !DILexicalBlock(scope: !254, file: !36, line: 62, column: 9)
!262 = !DILocation(line: 62, column: 10, scope: !261)
!263 = !DILocation(line: 62, column: 31, scope: !261)
!264 = !DILocation(line: 62, column: 40, scope: !261)
!265 = !DILocation(line: 63, column: 27, scope: !261)
!266 = !DILocation(line: 63, column: 10, scope: !261)
!267 = !DILocation(line: 63, column: 31, scope: !261)
!268 = !DILocation(line: 63, column: 40, scope: !261)
!269 = !DILocation(line: 64, column: 27, scope: !261)
!270 = !DILocation(line: 64, column: 10, scope: !261)
!271 = !DILocation(line: 64, column: 31, scope: !261)
!272 = !DILocation(line: 62, column: 9, scope: !254)
!273 = !DILocation(line: 67, column: 9, scope: !274)
!274 = distinct !DILexicalBlock(scope: !261, file: !36, line: 64, column: 41)
!275 = !DILocation(line: 68, column: 13, scope: !276)
!276 = distinct !DILexicalBlock(scope: !274, file: !36, line: 68, column: 11)
!277 = !DILocation(line: 68, column: 11, scope: !274)
!278 = !DILocation(line: 71, column: 11, scope: !279)
!279 = distinct !DILexicalBlock(scope: !274, file: !36, line: 71, column: 11)
!280 = !DILocation(line: 71, column: 30, scope: !279)
!281 = !DILocation(line: 71, column: 11, scope: !274)
!282 = !DILocation(line: 73, column: 13, scope: !283)
!283 = distinct !DILexicalBlock(scope: !274, file: !36, line: 73, column: 11)
!284 = !DILocation(line: 73, column: 11, scope: !274)
!285 = !DILocation(line: 76, column: 13, scope: !274)
!286 = !DILocation(line: 76, column: 12, scope: !274)
!287 = !DILocation(line: 76, column: 9, scope: !274)
!288 = !DILocation(line: 77, column: 13, scope: !289)
!289 = distinct !DILexicalBlock(scope: !274, file: !36, line: 77, column: 11)
!290 = !DILocation(line: 77, column: 11, scope: !274)
!291 = !DILocation(line: 79, column: 9, scope: !274)
!292 = !DILocation(line: 80, column: 13, scope: !293)
!293 = distinct !DILexicalBlock(scope: !274, file: !36, line: 80, column: 11)
!294 = !DILocation(line: 80, column: 11, scope: !274)
!295 = !DILocation(line: 83, column: 13, scope: !274)
!296 = !DILocation(line: 83, column: 12, scope: !274)
!297 = !DILocation(line: 83, column: 9, scope: !274)
!298 = !DILocation(line: 84, column: 8, scope: !274)
!299 = !DILocation(line: 86, column: 16, scope: !274)
!300 = !DILocation(line: 86, column: 7, scope: !274)
!301 = !DILocation(line: 87, column: 36, scope: !302)
!302 = distinct !DILexicalBlock(scope: !274, file: !36, line: 86, column: 46)
!303 = !DILocation(line: 87, column: 28, scope: !302)
!304 = !DILocalVariable(name: "gn_type", scope: !302, file: !36, line: 87, type: !227)
!305 = !DILocation(line: 0, scope: !302)
!306 = !DILocation(line: 89, column: 29, scope: !307)
!307 = distinct !DILexicalBlock(scope: !302, file: !36, line: 89, column: 13)
!308 = !DILocation(line: 91, column: 15, scope: !309)
!309 = distinct !DILexicalBlock(scope: !310, file: !36, line: 91, column: 15)
!310 = distinct !DILexicalBlock(scope: !307, file: !36, line: 89, column: 68)
!311 = !DILocation(line: 91, column: 17, scope: !309)
!312 = !DILocation(line: 91, column: 24, scope: !309)
!313 = !DILocation(line: 91, column: 21, scope: !309)
!314 = !DILocation(line: 91, column: 15, scope: !310)
!315 = !DILocation(line: 93, column: 50, scope: !310)
!316 = !DILocation(line: 93, column: 32, scope: !310)
!317 = !DILocalVariable(name: "len", scope: !310, file: !36, line: 93, type: !227)
!318 = !DILocation(line: 0, scope: !310)
!319 = !DILocation(line: 97, column: 50, scope: !320)
!320 = distinct !DILexicalBlock(scope: !310, file: !36, line: 97, column: 15)
!321 = !DILocation(line: 97, column: 20, scope: !320)
!322 = !DILocation(line: 97, column: 56, scope: !320)
!323 = !DILocation(line: 98, column: 34, scope: !320)
!324 = !DILocation(line: 98, column: 32, scope: !320)
!325 = !DILocation(line: 98, column: 38, scope: !320)
!326 = !DILocation(line: 98, column: 43, scope: !320)
!327 = !DILocation(line: 97, column: 15, scope: !310)
!328 = !DILocation(line: 101, column: 13, scope: !310)
!329 = !DILocation(line: 102, column: 19, scope: !330)
!330 = distinct !DILexicalBlock(scope: !310, file: !36, line: 102, column: 15)
!331 = !DILocation(line: 102, column: 15, scope: !310)
!332 = !DILocation(line: 105, column: 15, scope: !333)
!333 = distinct !DILexicalBlock(scope: !310, file: !36, line: 105, column: 15)
!334 = !DILocation(line: 105, column: 28, scope: !333)
!335 = !DILocation(line: 105, column: 34, scope: !333)
!336 = !DILocation(line: 105, column: 15, scope: !310)
!337 = !DILocalVariable(name: "dNSName_len", scope: !310, file: !36, line: 94, type: !40)
!338 = !DILocation(line: 110, column: 37, scope: !339)
!339 = distinct !DILexicalBlock(scope: !310, file: !36, line: 110, column: 15)
!340 = !DILocation(line: 110, column: 50, scope: !339)
!341 = !DILocation(line: 110, column: 15, scope: !310)
!342 = !DILocation(line: 112, column: 50, scope: !343)
!343 = distinct !DILexicalBlock(scope: !344, file: !36, line: 112, column: 17)
!344 = distinct !DILexicalBlock(scope: !339, file: !36, line: 110, column: 59)
!345 = !DILocation(line: 112, column: 17, scope: !343)
!346 = !DILocation(line: 112, column: 67, scope: !343)
!347 = !DILocation(line: 113, column: 45, scope: !343)
!348 = !DILocation(line: 112, column: 17, scope: !344)
!349 = !DILocation(line: 117, column: 68, scope: !344)
!350 = !DILocation(line: 117, column: 66, scope: !344)
!351 = !DILocation(line: 117, column: 80, scope: !344)
!352 = !DILocation(line: 118, column: 11, scope: !344)
!353 = !DILocation(line: 108, column: 25, scope: !310)
!354 = !DILocation(line: 119, column: 52, scope: !355)
!355 = distinct !DILexicalBlock(scope: !339, file: !36, line: 118, column: 18)
!356 = !DILocation(line: 0, scope: !339)
!357 = !DILocation(line: 123, column: 16, scope: !310)
!358 = !DILocation(line: 123, column: 13, scope: !310)
!359 = !DILocation(line: 86, column: 26, scope: !274)
!360 = distinct !{!360, !300, !361, !362}
!361 = !DILocation(line: 127, column: 7, scope: !274)
!362 = !{!"llvm.loop.mustprogress"}
!363 = !DILocation(line: 0, scope: !250)
!364 = !DILocation(line: 58, column: 44, scope: !249)
!365 = distinct !{!365, !251, !366, !362}
!366 = !DILocation(line: 129, column: 3, scope: !250)
!367 = !DILocation(line: 131, column: 1, scope: !215)
!368 = distinct !DISubprogram(name: "predicate_serializer_int32_oob_write", scope: !49, file: !49, line: 66, type: !369, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !31)
!369 = !DISubroutineType(types: !370)
!370 = !{!6, !371, !376, !195}
!371 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !372, size: 64)
!372 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_serializer", file: !49, line: 64, baseType: !373)
!373 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !49, line: 64, size: 256, elements: !374)
!374 = !{!375}
!375 = !DIDerivedType(tag: DW_TAG_member, name: "c", scope: !373, file: !49, line: 64, baseType: !26, size: 256)
!376 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !377, size: 64)
!377 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !27)
!378 = !DILocalVariable(name: "_serializer", arg: 1, scope: !368, file: !49, line: 66, type: !371)
!379 = !DILocation(line: 0, scope: !368)
!380 = !DILocalVariable(name: "key", arg: 2, scope: !368, file: !49, line: 67, type: !376)
!381 = !DILocalVariable(name: "value", arg: 3, scope: !368, file: !49, line: 68, type: !195)
!382 = !DILocalVariable(name: "serializer", scope: !368, file: !49, line: 70, type: !53)
!383 = !DILocation(line: 72, column: 19, scope: !384)
!384 = distinct !DILexicalBlock(scope: !368, file: !49, line: 72, column: 7)
!385 = !DILocation(line: 72, column: 23, scope: !384)
!386 = !DILocation(line: 72, column: 7, scope: !368)
!387 = !DILocation(line: 75, column: 26, scope: !388)
!388 = distinct !DILexicalBlock(scope: !368, file: !49, line: 75, column: 7)
!389 = !DILocation(line: 75, column: 31, scope: !388)
!390 = !DILocation(line: 75, column: 7, scope: !368)
!391 = !DILocation(line: 78, column: 26, scope: !392)
!392 = distinct !DILexicalBlock(scope: !368, file: !49, line: 78, column: 7)
!393 = !DILocation(line: 78, column: 33, scope: !392)
!394 = !DILocation(line: 78, column: 57, scope: !392)
!395 = !DILocation(line: 78, column: 64, scope: !392)
!396 = !DILocation(line: 78, column: 43, scope: !392)
!397 = !DILocation(line: 78, column: 7, scope: !368)
!398 = !DILocalVariable(name: "buff_diff", scope: !368, file: !49, line: 80, type: !62)
!399 = !DILocalVariable(name: "needed", scope: !368, file: !49, line: 82, type: !400)
!400 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int16_t", file: !49, line: 32, baseType: !41)
!401 = !DILocalVariable(name: "size_used_after", scope: !368, file: !49, line: 94, type: !62)
!402 = !DILocation(line: 95, column: 28, scope: !403)
!403 = distinct !DILexicalBlock(scope: !368, file: !49, line: 95, column: 7)
!404 = !DILocation(line: 95, column: 34, scope: !403)
!405 = !DILocation(line: 95, column: 52, scope: !403)
!406 = !DILocation(line: 97, column: 25, scope: !407)
!407 = distinct !DILexicalBlock(scope: !408, file: !49, line: 97, column: 9)
!408 = distinct !DILexicalBlock(scope: !403, file: !49, line: 95, column: 76)
!409 = !DILocation(line: 97, column: 9, scope: !408)
!410 = !DILocation(line: 98, column: 20, scope: !408)
!411 = !DILocation(line: 99, column: 3, scope: !408)
!412 = !DILocation(line: 104, column: 23, scope: !413)
!413 = distinct !DILexicalBlock(scope: !368, file: !49, line: 104, column: 7)
!414 = !DILocation(line: 114, column: 1, scope: !368)
!415 = distinct !DISubprogram(name: "memset", scope: !416, file: !416, line: 12, type: !417, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !85, retainedNodes: !31)
!416 = !DIFile(filename: "runtime/Freestanding/memset.c", directory: "/home/wcontrerasmartinez/klee")
!417 = !DISubroutineType(types: !418)
!418 = !{!39, !39, !6, !419}
!419 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !420, line: 46, baseType: !47)
!420 = !DIFile(filename: "/usr/lib/llvm-13/lib/clang/13.0.1/include/stddef.h", directory: "")
!421 = !DILocalVariable(name: "dst", arg: 1, scope: !415, file: !416, line: 12, type: !39)
!422 = !DILocation(line: 0, scope: !415)
!423 = !DILocalVariable(name: "s", arg: 2, scope: !415, file: !416, line: 12, type: !6)
!424 = !DILocalVariable(name: "count", arg: 3, scope: !415, file: !416, line: 12, type: !419)
!425 = !DILocalVariable(name: "a", scope: !415, file: !416, line: 13, type: !44)
!426 = !DILocation(line: 14, column: 18, scope: !415)
!427 = !DILocation(line: 14, column: 3, scope: !415)
!428 = !DILocation(line: 14, column: 15, scope: !415)
!429 = !DILocation(line: 15, column: 7, scope: !415)
!430 = !DILocation(line: 15, column: 10, scope: !415)
!431 = distinct !{!431, !427, !432, !362}
!432 = !DILocation(line: 15, column: 12, scope: !415)
!433 = !DILocation(line: 16, column: 3, scope: !415)
