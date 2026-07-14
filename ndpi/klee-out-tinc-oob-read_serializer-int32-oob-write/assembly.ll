; ModuleID = 'linked_tinc-oob-read_serializer-int32-oob-write.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ser_private = type { %struct.ser_status, %struct.ser_buffer, i32, [2 x i8] }
%struct.ser_status = type { i32, %struct.ser_buf_status }
%struct.ser_buf_status = type { i32 }
%struct.ser_buffer = type { i32, i8* }
%struct.ser_serializer = type { [32 x i8] }
%struct.tinc_module = type { %struct.tinc_packet }
%struct.tinc_packet = type { i8*, i16, i32 }
%struct.tinc_flow = type { i8 }

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"size_used\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"value\00", align 1
@.str.4 = private unnamed_addr constant [61 x i8] c"0 && \22REACHED_BOTH_tinc-oob-read_serializer-int32-oob-write\22\00", align 1
@.str.5 = private unnamed_addr constant [50 x i8] c"driver_tinc-oob-read_serializer-int32-oob-write.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [15 x i8] c"int main(void)\00", align 1

; Function Attrs: noinline noreturn nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !73 {
  %1 = alloca [256 x i8], align 16
  %2 = alloca %struct.ser_private, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [256 x i8]* %1, metadata !77, metadata !DIExpression()), !dbg !81
  %5 = getelementptr inbounds [256 x i8], [256 x i8]* %1, i64 0, i64 0, !dbg !82
  call void @klee_make_symbolic(i8* nonnull %5, i64 256, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)) #8, !dbg !83
  call void @llvm.dbg.value(metadata i16 0, metadata !84, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 16)), !dbg !98
  call void @llvm.dbg.value(metadata i16 0, metadata !84, metadata !DIExpression(DW_OP_LLVM_fragment, 80, 16)), !dbg !98
  call void @llvm.dbg.value(metadata i32 0, metadata !84, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 32)), !dbg !98
  call void @llvm.dbg.value(metadata i8* %5, metadata !84, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 64)), !dbg !98
  call void @llvm.dbg.value(metadata i16 256, metadata !84, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 16)), !dbg !98
  call void @llvm.dbg.value(metadata i32 1, metadata !84, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 32)), !dbg !98
  call void @llvm.dbg.value(metadata i8 2, metadata !99, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata %struct.ser_private* %2, metadata !103, metadata !DIExpression()), !dbg !127
  %6 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %2, i64 0, i32 1, !dbg !128
  %7 = bitcast %struct.ser_buffer* %6 to i8*, !dbg !128
  %8 = call i8* @memset(i8* %7, i32 0, i64 24), !dbg !128
  %9 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %2, i64 0, i32 2, !dbg !129
  store i32 3, i32* %9, align 8, !dbg !130
  %10 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %2, i64 0, i32 1, i32 1, !dbg !131
  store i8* %5, i8** %10, align 8, !dbg !132
  %11 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %2, i64 0, i32 3, i64 0, !dbg !133
  store i8 44, i8* %11, align 4, !dbg !134
  %12 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %2, i64 0, i32 1, i32 0, !dbg !135
  store i32 256, i32* %12, align 8, !dbg !136
  %13 = bitcast i32* %3 to i8*, !dbg !137
  call void @llvm.dbg.value(metadata i32* %3, metadata !138, metadata !DIExpression(DW_OP_deref)), !dbg !98
  call void @klee_make_symbolic(i8* nonnull %13, i64 4, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0)) #8, !dbg !139
  %14 = load i32, i32* %3, align 4, !dbg !140
  call void @llvm.dbg.value(metadata i32 %14, metadata !138, metadata !DIExpression()), !dbg !98
  %15 = icmp ne i32 %14, 0, !dbg !141
  %16 = zext i1 %15 to i64, !dbg !140
  call void @klee_assume(i64 %16) #8, !dbg !142
  %17 = load i32, i32* %3, align 4, !dbg !143
  call void @llvm.dbg.value(metadata i32 %17, metadata !138, metadata !DIExpression()), !dbg !98
  %18 = add i32 %17, 11, !dbg !144
  %19 = icmp ult i32 %18, 257, !dbg !145
  %20 = zext i1 %19 to i64, !dbg !143
  call void @klee_assume(i64 %20) #8, !dbg !146
  %21 = load i32, i32* %3, align 4, !dbg !147
  call void @llvm.dbg.value(metadata i32 %21, metadata !138, metadata !DIExpression()), !dbg !98
  %22 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %2, i64 0, i32 0, i32 1, i32 0, !dbg !148
  store i32 %21, i32* %22, align 4, !dbg !149
  %23 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %2, i64 0, i32 0, i32 0, !dbg !150
  store i32 0, i32* %23, align 8, !dbg !151
  %24 = bitcast i32* %4 to i8*, !dbg !152
  call void @llvm.dbg.value(metadata i32* %4, metadata !153, metadata !DIExpression(DW_OP_deref)), !dbg !98
  call void @klee_make_symbolic(i8* nonnull %24, i64 4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0)) #8, !dbg !157
  %25 = load i32, i32* %4, align 4, !dbg !158
  call void @llvm.dbg.value(metadata i32 %25, metadata !153, metadata !DIExpression()), !dbg !98
  %26 = icmp ugt i32 %25, 999999999, !dbg !159
  %27 = zext i1 %26 to i64, !dbg !160
  call void @klee_assume(i64 %27) #8, !dbg !161
  %28 = bitcast %struct.ser_private* %2 to %struct.ser_serializer*, !dbg !162
  call void @llvm.dbg.value(metadata %struct.ser_serializer* %28, metadata !163, metadata !DIExpression()), !dbg !98
  %29 = call fastcc i32 @predicate_tinc_oob_read(i8* nonnull %5, i16 256, i32 1, i8 2), !dbg !164
  call void @llvm.dbg.value(metadata i32 %29, metadata !165, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.value(metadata i32 undef, metadata !153, metadata !DIExpression()), !dbg !98
  %30 = call fastcc i32 @predicate_serializer_int32_oob_write(%struct.ser_serializer* nonnull %28), !dbg !166
  call void @llvm.dbg.value(metadata i32 %30, metadata !167, metadata !DIExpression()), !dbg !98
  %31 = icmp eq i32 %29, 1, !dbg !168
  %32 = icmp eq i32 %30, 1, !dbg !169
  %33 = select i1 %31, i1 %32, i1 false, !dbg !169
  %34 = zext i1 %33 to i64, !dbg !170
  call void @klee_assume(i64 %34) #8, !dbg !171
  call void @__assert_fail(i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.5, i64 0, i64 0), i32 84, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #9, !dbg !172
  unreachable, !dbg !172
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) local_unnamed_addr #2

declare dso_local void @klee_assume(i64) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #3

; Function Attrs: nofree noinline norecurse nosync nounwind readonly uwtable
define internal fastcc i32 @predicate_tinc_oob_read(i8* nocapture readonly %.0.0.0.val, i16 %.0.0.1.val, i32 %.0.0.2.val, i8 %.0.0.val) unnamed_addr #4 !dbg !173 {
  call void @llvm.dbg.value(metadata %struct.tinc_module* undef, metadata !193, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.value(metadata %struct.tinc_flow* undef, metadata !195, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.value(metadata i8* %.0.0.0.val, metadata !196, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.value(metadata i16 %.0.0.1.val, metadata !197, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !194
  %.not = icmp eq i32 %.0.0.2.val, 0, !dbg !199
  %1 = icmp eq i16 %.0.0.1.val, 0
  %or.cond = select i1 %.not, i1 true, i1 %1, !dbg !201
  br i1 %or.cond, label %.critedge, label %2, !dbg !201

2:                                                ; preds = %0
  %.not5 = icmp eq i8 %.0.0.val, 2, !dbg !202
  br i1 %.not5, label %5, label %3, !dbg !204

3:                                                ; preds = %2
  %.not14 = icmp ne i8 %.0.0.val, 3, !dbg !205
  %4 = icmp ult i16 %.0.0.1.val, 12
  %or.cond15 = select i1 %.not14, i1 true, i1 %4, !dbg !206
  br i1 %or.cond15, label %.critedge, label %6, !dbg !206

5:                                                ; preds = %2
  %.old = icmp ult i16 %.0.0.1.val, 12, !dbg !207
  br i1 %.old, label %.critedge, label %6, !dbg !209

6:                                                ; preds = %3, %5
  %7 = load i8, i8* %.0.0.0.val, align 1, !dbg !210
  %.not6 = icmp eq i8 %7, 49, !dbg !212
  br i1 %.not6, label %8, label %.critedge, !dbg !213

8:                                                ; preds = %6
  %9 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 1, !dbg !214
  %10 = load i8, i8* %9, align 1, !dbg !214
  %.not7 = icmp eq i8 %10, 32, !dbg !216
  br i1 %.not7, label %11, label %.critedge, !dbg !217

11:                                               ; preds = %8
  %12 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 2, !dbg !218
  %13 = load i8, i8* %12, align 1, !dbg !218
  %14 = icmp ne i8 %13, 32, !dbg !220
  %.not1226 = icmp ugt i16 %.0.0.1.val, 3
  %or.cond49 = select i1 %14, i1 %.not1226, i1 false, !dbg !221
  call void @llvm.dbg.value(metadata i8 4, metadata !222, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.value(metadata i16 3, metadata !223, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.value(metadata i8 4, metadata !222, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.value(metadata i16 3, metadata !223, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.value(metadata i16 3, metadata !223, metadata !DIExpression()), !dbg !194
  br i1 %or.cond49, label %.lr.ph, label %.critedge, !dbg !221

.lr.ph:                                           ; preds = %11, %19
  %.127 = phi i16 [ %20, %19 ], [ 3, %11 ]
  call void @llvm.dbg.value(metadata i16 %.127, metadata !223, metadata !DIExpression()), !dbg !194
  %15 = zext i16 %.127 to i64, !dbg !224
  %16 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 %15, !dbg !224
  %17 = load i8, i8* %16, align 1, !dbg !224
  %.off = add i8 %17, -48, !dbg !228
  %18 = icmp ult i8 %.off, 10, !dbg !228
  br i1 %18, label %19, label %21, !dbg !228

19:                                               ; preds = %.lr.ph
  %20 = add nuw i16 %.127, 1, !dbg !229
  call void @llvm.dbg.value(metadata i16 %20, metadata !223, metadata !DIExpression()), !dbg !194
  %exitcond31.not = icmp eq i16 %20, %.0.0.1.val, !dbg !230
  br i1 %exitcond31.not, label %.critedge, label %.lr.ph, !dbg !232, !llvm.loop !233

21:                                               ; preds = %.lr.ph
  %.not13 = icmp ult i16 %.127, %.0.0.1.val, !dbg !236
  br i1 %.not13, label %22, label %.critedge, !dbg !238

22:                                               ; preds = %21
  %23 = add i16 %.127, 1, !dbg !239
  call void @llvm.dbg.value(metadata i16 %23, metadata !223, metadata !DIExpression()), !dbg !194
  %24 = icmp eq i8 %17, 32, !dbg !241
  call void @llvm.dbg.value(metadata i8 3, metadata !222, metadata !DIExpression()), !dbg !194
  %.not1226.1 = icmp ult i16 %23, %.0.0.1.val
  %or.cond50 = select i1 %24, i1 %.not1226.1, i1 false, !dbg !242
  call void @llvm.dbg.value(metadata i8 3, metadata !222, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.value(metadata i16 %23, metadata !223, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.value(metadata i8 3, metadata !222, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.value(metadata i16 %23, metadata !223, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.value(metadata i16 %23, metadata !223, metadata !DIExpression()), !dbg !194
  br i1 %or.cond50, label %.lr.ph.1, label %.critedge, !dbg !242

.preheader:                                       ; preds = %.thread
  %25 = zext i16 %57 to i64, !dbg !243
  %wide.trip.count = zext i16 %.0.0.1.val to i64, !dbg !244
  br label %26, !dbg !243

26:                                               ; preds = %.preheader, %.critedge1
  %indvars.iv = phi i64 [ %25, %.preheader ], [ %indvars.iv.next, %.critedge1 ], !dbg !194
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !223, metadata !DIExpression()), !dbg !194
  %27 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 %indvars.iv, !dbg !247
  %28 = load i8, i8* %27, align 1, !dbg !247
  %.off64 = add i8 %28, -48, !dbg !248
  %29 = icmp ult i8 %.off64, 10, !dbg !248
  %.off65 = add i8 %28, -65
  %30 = icmp ult i8 %.off65, 26
  %or.cond17 = or i1 %29, %30, !dbg !248
  br i1 %or.cond17, label %.critedge1, label %.critedge, !dbg !248

.critedge1:                                       ; preds = %26
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !249
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !223, metadata !DIExpression()), !dbg !194
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count, !dbg !244
  br i1 %exitcond.not, label %.critedge, label %26, !dbg !250, !llvm.loop !251

.critedge:                                        ; preds = %26, %19, %39, %49, %59, %.critedge1, %22, %21, %35, %36, %45, %46, %55, %56, %.thread, %11, %8, %6, %5, %3, %0
  %.0 = phi i32 [ 0, %0 ], [ 0, %3 ], [ 0, %5 ], [ 0, %6 ], [ 0, %8 ], [ 0, %11 ], [ 1, %.thread ], [ 0, %56 ], [ 0, %55 ], [ 0, %46 ], [ 0, %45 ], [ 0, %36 ], [ 0, %35 ], [ 0, %21 ], [ 0, %22 ], [ 1, %.critedge1 ], [ 0, %59 ], [ 0, %49 ], [ 0, %39 ], [ 0, %19 ], [ 0, %26 ], !dbg !194
  ret i32 %.0, !dbg !254

.lr.ph.1:                                         ; preds = %22, %39
  %.127.1 = phi i16 [ %40, %39 ], [ %23, %22 ]
  call void @llvm.dbg.value(metadata i16 %.127.1, metadata !223, metadata !DIExpression()), !dbg !194
  %31 = zext i16 %.127.1 to i64, !dbg !224
  %32 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 %31, !dbg !224
  %33 = load i8, i8* %32, align 1, !dbg !224
  %.off61 = add i8 %33, -48, !dbg !228
  %34 = icmp ult i8 %.off61, 10, !dbg !228
  br i1 %34, label %39, label %35, !dbg !228

35:                                               ; preds = %.lr.ph.1
  %.not13.1 = icmp ult i16 %.127.1, %.0.0.1.val, !dbg !236
  br i1 %.not13.1, label %36, label %.critedge, !dbg !238

36:                                               ; preds = %35
  %37 = add i16 %.127.1, 1, !dbg !239
  call void @llvm.dbg.value(metadata i16 %37, metadata !223, metadata !DIExpression()), !dbg !194
  %38 = icmp eq i8 %33, 32, !dbg !241
  call void @llvm.dbg.value(metadata i8 2, metadata !222, metadata !DIExpression()), !dbg !194
  %.not1226.2 = icmp ult i16 %37, %.0.0.1.val
  %or.cond43 = select i1 %38, i1 %.not1226.2, i1 false, !dbg !242
  br i1 %or.cond43, label %.lr.ph.2, label %.critedge, !dbg !242

39:                                               ; preds = %.lr.ph.1
  %40 = add nuw i16 %.127.1, 1, !dbg !229
  call void @llvm.dbg.value(metadata i16 %40, metadata !223, metadata !DIExpression()), !dbg !194
  %exitcond31.1.not = icmp eq i16 %40, %.0.0.1.val, !dbg !230
  br i1 %exitcond31.1.not, label %.critedge, label %.lr.ph.1, !dbg !232, !llvm.loop !233

.lr.ph.2:                                         ; preds = %36, %49
  %.127.2 = phi i16 [ %50, %49 ], [ %37, %36 ]
  call void @llvm.dbg.value(metadata i16 %.127.2, metadata !223, metadata !DIExpression()), !dbg !194
  %41 = zext i16 %.127.2 to i64, !dbg !224
  %42 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 %41, !dbg !224
  %43 = load i8, i8* %42, align 1, !dbg !224
  %.off62 = add i8 %43, -48, !dbg !228
  %44 = icmp ult i8 %.off62, 10, !dbg !228
  br i1 %44, label %49, label %45, !dbg !228

45:                                               ; preds = %.lr.ph.2
  %.not13.2 = icmp ult i16 %.127.2, %.0.0.1.val, !dbg !236
  br i1 %.not13.2, label %46, label %.critedge, !dbg !238

46:                                               ; preds = %45
  %47 = add i16 %.127.2, 1, !dbg !239
  call void @llvm.dbg.value(metadata i16 %47, metadata !223, metadata !DIExpression()), !dbg !194
  %48 = icmp eq i8 %43, 32, !dbg !241
  call void @llvm.dbg.value(metadata i8 1, metadata !222, metadata !DIExpression()), !dbg !194
  %.not1226.3 = icmp ult i16 %47, %.0.0.1.val
  %or.cond46 = select i1 %48, i1 %.not1226.3, i1 false, !dbg !242
  br i1 %or.cond46, label %.lr.ph.3, label %.critedge, !dbg !242

49:                                               ; preds = %.lr.ph.2
  %50 = add nuw i16 %.127.2, 1, !dbg !229
  call void @llvm.dbg.value(metadata i16 %50, metadata !223, metadata !DIExpression()), !dbg !194
  %exitcond31.2.not = icmp eq i16 %50, %.0.0.1.val, !dbg !230
  br i1 %exitcond31.2.not, label %.critedge, label %.lr.ph.2, !dbg !232, !llvm.loop !233

.lr.ph.3:                                         ; preds = %46, %59
  %.127.3 = phi i16 [ %60, %59 ], [ %47, %46 ]
  call void @llvm.dbg.value(metadata i16 %.127.3, metadata !223, metadata !DIExpression()), !dbg !194
  %51 = zext i16 %.127.3 to i64, !dbg !224
  %52 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 %51, !dbg !224
  %53 = load i8, i8* %52, align 1, !dbg !224
  %.off63 = add i8 %53, -48, !dbg !228
  %54 = icmp ult i8 %.off63, 10, !dbg !228
  br i1 %54, label %59, label %55, !dbg !228

55:                                               ; preds = %.lr.ph.3
  %.not13.3 = icmp ult i16 %.127.3, %.0.0.1.val, !dbg !236
  br i1 %.not13.3, label %56, label %.critedge, !dbg !238

56:                                               ; preds = %55
  %57 = add i16 %.127.3, 1, !dbg !239
  call void @llvm.dbg.value(metadata i16 %57, metadata !223, metadata !DIExpression()), !dbg !194
  %58 = icmp eq i8 %53, 32, !dbg !241
  call void @llvm.dbg.value(metadata i8 0, metadata !222, metadata !DIExpression()), !dbg !194
  br i1 %58, label %.thread, label %.critedge, !dbg !242

.thread:                                          ; preds = %56
  call void @llvm.dbg.value(metadata i8 0, metadata !222, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.value(metadata i16 %57, metadata !223, metadata !DIExpression()), !dbg !194
  %.not10 = icmp ult i16 %57, %.0.0.1.val, !dbg !255
  br i1 %.not10, label %.preheader, label %.critedge, !dbg !257

59:                                               ; preds = %.lr.ph.3
  %60 = add nuw i16 %.127.3, 1, !dbg !229
  call void @llvm.dbg.value(metadata i16 %60, metadata !223, metadata !DIExpression()), !dbg !194
  %exitcond31.3.not = icmp eq i16 %60, %.0.0.1.val, !dbg !230
  br i1 %exitcond31.3.not, label %.critedge, label %.lr.ph.3, !dbg !232, !llvm.loop !233
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readonly uwtable willreturn
define internal fastcc i32 @predicate_serializer_int32_oob_write(%struct.ser_serializer* nocapture readonly %0) unnamed_addr #5 !dbg !258 {
  call void @llvm.dbg.value(metadata %struct.ser_serializer* %0, metadata !268, metadata !DIExpression()), !dbg !269
  call void @llvm.dbg.value(metadata i8* undef, metadata !270, metadata !DIExpression()), !dbg !269
  call void @llvm.dbg.value(metadata i32 undef, metadata !271, metadata !DIExpression()), !dbg !269
  call void @llvm.dbg.value(metadata %struct.ser_serializer* %0, metadata !272, metadata !DIExpression()), !dbg !269
  %2 = getelementptr inbounds %struct.ser_serializer, %struct.ser_serializer* %0, i64 0, i32 0, i64 24, !dbg !273
  %3 = bitcast i8* %2 to i32*, !dbg !273
  %4 = load i32, i32* %3, align 8, !dbg !273
  %.not = icmp eq i32 %4, 3, !dbg !275
  br i1 %.not, label %5, label %30, !dbg !276

5:                                                ; preds = %1
  %6 = getelementptr inbounds %struct.ser_serializer, %struct.ser_serializer* %0, i64 0, i32 0, i64 16, !dbg !277
  %7 = bitcast i8* %6 to i8**, !dbg !277
  %8 = load i8*, i8** %7, align 8, !dbg !277
  %9 = icmp eq i8* %8, null, !dbg !279
  br i1 %9, label %30, label %10, !dbg !280

10:                                               ; preds = %5
  %11 = getelementptr inbounds %struct.ser_serializer, %struct.ser_serializer* %0, i64 0, i32 0, i64 4, !dbg !281
  %12 = bitcast i8* %11 to i32*, !dbg !283
  %13 = load i32, i32* %12, align 4, !dbg !283
  %14 = getelementptr inbounds %struct.ser_serializer, %struct.ser_serializer* %0, i64 0, i32 0, i64 8, !dbg !284
  %15 = bitcast i8* %14 to i32*, !dbg !285
  %16 = load i32, i32* %15, align 8, !dbg !285
  %17 = icmp ult i32 %16, %13, !dbg !286
  %18 = sub i32 %16, %13
  %19 = icmp ult i32 %18, 11
  %or.cond6 = or i1 %17, %19, !dbg !287
  call void @llvm.dbg.value(metadata i32 %18, metadata !288, metadata !DIExpression()), !dbg !269
  call void @llvm.dbg.value(metadata i16 11, metadata !289, metadata !DIExpression()), !dbg !269
  br i1 %or.cond6, label %30, label %20, !dbg !287

20:                                               ; preds = %10
  call void @llvm.dbg.value(metadata i32 %13, metadata !291, metadata !DIExpression()), !dbg !269
  %21 = bitcast %struct.ser_serializer* %0 to i32*, !dbg !292
  %22 = load i32, i32* %21, align 8, !dbg !292
  %23 = and i32 %22, 4, !dbg !294
  %24 = icmp eq i32 %23, 0, !dbg !294
  %25 = icmp ne i32 %13, 0
  %or.cond = select i1 %24, i1 %25, i1 false, !dbg !295
  br i1 %or.cond, label %26, label %29, !dbg !295

26:                                               ; preds = %20
  %.not4 = icmp ugt i32 %16, %13, !dbg !296
  br i1 %.not4, label %27, label %30, !dbg !299

27:                                               ; preds = %26
  %28 = add i32 %13, 1, !dbg !300
  call void @llvm.dbg.value(metadata i32 %28, metadata !291, metadata !DIExpression()), !dbg !269
  br label %29, !dbg !301

29:                                               ; preds = %27, %20
  %.02 = phi i32 [ %28, %27 ], [ %13, %20 ], !dbg !269
  call void @llvm.dbg.value(metadata i32 %.02, metadata !291, metadata !DIExpression()), !dbg !269
  call void @llvm.dbg.value(metadata i16 10, metadata !289, metadata !DIExpression()), !dbg !269
  %.not3 = icmp ult i32 %.02, %16, !dbg !302
  %. = zext i1 %.not3 to i32, !dbg !269
  br label %30, !dbg !269

30:                                               ; preds = %29, %26, %10, %5, %1
  %.0 = phi i32 [ 0, %1 ], [ 0, %5 ], [ 0, %10 ], [ 0, %26 ], [ %., %29 ], !dbg !269
  ret i32 %.0, !dbg !304
}

; Function Attrs: nofree noinline norecurse nosync nounwind uwtable writeonly
define dso_local i8* @memset(i8* returned %0, i32 %1, i64 %2) local_unnamed_addr #6 !dbg !305 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !312, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata i32 %1, metadata !314, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata i64 %2, metadata !315, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata i8* %0, metadata !316, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata i64 %2, metadata !315, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !313
  %.not2 = icmp eq i64 %2, 0, !dbg !318
  br i1 %.not2, label %._crit_edge, label %.lr.ph, !dbg !319

.lr.ph:                                           ; preds = %3
  %4 = trunc i32 %1 to i8
  br label %5, !dbg !319

5:                                                ; preds = %.lr.ph, %5
  %.04 = phi i8* [ %0, %.lr.ph ], [ %7, %5 ]
  %.013 = phi i64 [ %2, %.lr.ph ], [ %6, %5 ]
  call void @llvm.dbg.value(metadata i8* %.04, metadata !316, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata i64 %.013, metadata !315, metadata !DIExpression()), !dbg !313
  %6 = add i64 %.013, -1, !dbg !320
  call void @llvm.dbg.value(metadata i64 %6, metadata !315, metadata !DIExpression()), !dbg !313
  %7 = getelementptr inbounds i8, i8* %.04, i64 1, !dbg !321
  call void @llvm.dbg.value(metadata i8* %7, metadata !316, metadata !DIExpression()), !dbg !313
  store i8 %4, i8* %.04, align 1, !dbg !322
  call void @llvm.dbg.value(metadata i64 %6, metadata !315, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !313
  %.not = icmp eq i64 %6, 0, !dbg !318
  br i1 %.not, label %._crit_edge, label %5, !dbg !319, !llvm.loop !323

._crit_edge:                                      ; preds = %5, %3
  ret i8* %0, !dbg !325
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #7

attributes #0 = { noinline noreturn nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree noinline norecurse nosync nounwind readonly uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree noinline norecurse nosync nounwind readonly uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree noinline norecurse nosync nounwind uwtable writeonly "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!0, !24, !27, !65}
!llvm.ident = !{!67, !67, !67, !67}
!llvm.module.flags = !{!68, !69, !70, !71, !72}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !10, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "driver_tinc-oob-read_serializer-int32-oob-write.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!2 = !{!3}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !1, line: 29, baseType: !4, size: 32, elements: !5)
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !7, !8, !9}
!6 = !DIEnumerator(name: "ser_fmt_unknown", value: 0)
!7 = !DIEnumerator(name: "ser_fmt_tlv", value: 1)
!8 = !DIEnumerator(name: "ser_fmt_json", value: 2)
!9 = !DIEnumerator(name: "ser_fmt_csv", value: 3)
!10 = !{!11, !15}
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !12, line: 26, baseType: !13)
!12 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !14, line: 42, baseType: !4)
!14 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_serializer", file: !1, line: 38, baseType: !17)
!17 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 38, size: 256, elements: !18)
!18 = !{!19}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "c", scope: !17, file: !1, line: 38, baseType: !20, size: 256)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 256, elements: !22)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !{!23}
!23 = !DISubrange(count: 32)
!24 = distinct !DICompileUnit(language: DW_LANG_C99, file: !25, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !26, splitDebugInlining: false, nameTableKind: None)
!25 = !DIFile(filename: "predicate_tinc-oob-read.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!26 = !{}
!27 = distinct !DICompileUnit(language: DW_LANG_C99, file: !28, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !29, retainedTypes: !31, splitDebugInlining: false, nameTableKind: None)
!28 = !DIFile(filename: "predicate_serializer-int32-oob-write.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!29 = !{!30}
!30 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !28, line: 35, baseType: !4, size: 32, elements: !5)
!31 = !{!32, !64}
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_private", file: !28, line: 62, baseType: !34)
!34 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !28, line: 57, size: 256, elements: !35)
!35 = !{!36, !47, !58, !60}
!36 = !DIDerivedType(tag: DW_TAG_member, name: "status", scope: !34, file: !28, line: 58, baseType: !37, size: 64)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_status", file: !28, line: 50, baseType: !38)
!38 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !28, line: 47, size: 64, elements: !39)
!39 = !{!40, !42}
!40 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !38, file: !28, line: 48, baseType: !41, size: 32)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int32_t", file: !28, line: 33, baseType: !11)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !38, file: !28, line: 49, baseType: !43, size: 32, offset: 32)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_buf_status", file: !28, line: 45, baseType: !44)
!44 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !28, line: 45, size: 32, elements: !45)
!45 = !{!46}
!46 = !DIDerivedType(tag: DW_TAG_member, name: "size_used", scope: !44, file: !28, line: 45, baseType: !41, size: 32)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !34, file: !28, line: 59, baseType: !48, size: 128, offset: 64)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_buffer", file: !28, line: 55, baseType: !49)
!49 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !28, line: 52, size: 128, elements: !50)
!50 = !{!51, !52}
!51 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !49, file: !28, line: 53, baseType: !41, size: 32)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !49, file: !28, line: 54, baseType: !53, size: 64, offset: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int8_t", file: !28, line: 31, baseType: !55)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !12, line: 24, baseType: !56)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !14, line: 38, baseType: !57)
!57 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "fmt", scope: !34, file: !28, line: 60, baseType: !59, size: 32, offset: 192)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_format", file: !28, line: 40, baseType: !30)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "csv_separator", scope: !34, file: !28, line: 61, baseType: !61, size: 16, offset: 224)
!61 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 16, elements: !62)
!62 = !{!63}
!63 = !DISubrange(count: 2)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!65 = distinct !DICompileUnit(language: DW_LANG_C99, file: !66, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !26, splitDebugInlining: false, nameTableKind: None)
!66 = !DIFile(filename: "/home/wcontrerasmartinez/klee/runtime/Freestanding/memset.c", directory: "/home/wcontrerasmartinez/klee/build/runtime/Freestanding")
!67 = !{!"Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8"}
!68 = !{i32 7, !"Dwarf Version", i32 4}
!69 = !{i32 2, !"Debug Info Version", i32 3}
!70 = !{i32 1, !"wchar_size", i32 4}
!71 = !{i32 7, !"uwtable", i32 1}
!72 = !{i32 7, !"frame-pointer", i32 2}
!73 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 43, type: !74, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !26)
!74 = !DISubroutineType(types: !75)
!75 = !{!76}
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocalVariable(name: "buf", scope: !73, file: !1, line: 44, type: !78)
!78 = !DICompositeType(tag: DW_TAG_array_type, baseType: !55, size: 2048, elements: !79)
!79 = !{!80}
!80 = !DISubrange(count: 256)
!81 = !DILocation(line: 44, column: 11, scope: !73)
!82 = !DILocation(line: 45, column: 22, scope: !73)
!83 = !DILocation(line: 45, column: 3, scope: !73)
!84 = !DILocalVariable(name: "tinc_mod", scope: !73, file: !1, line: 48, type: !85)
!85 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tinc_module", file: !1, line: 24, size: 128, elements: !86)
!86 = !{!87}
!87 = !DIDerivedType(tag: DW_TAG_member, name: "packet", scope: !85, file: !1, line: 24, baseType: !88, size: 128)
!88 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tinc_packet", file: !1, line: 21, size: 128, elements: !89)
!89 = !{!90, !93, !97}
!90 = !DIDerivedType(tag: DW_TAG_member, name: "payload", scope: !88, file: !1, line: 21, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !55)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "payload_packet_len", scope: !88, file: !1, line: 21, baseType: !94, size: 16, offset: 64)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !12, line: 25, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !14, line: 40, baseType: !96)
!96 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "tcp_non_null", scope: !88, file: !1, line: 22, baseType: !76, size: 32, offset: 96)
!98 = !DILocation(line: 0, scope: !73)
!99 = !DILocalVariable(name: "tinc_flow", scope: !73, file: !1, line: 49, type: !100)
!100 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tinc_flow", file: !1, line: 23, size: 8, elements: !101)
!101 = !{!102}
!102 = !DIDerivedType(tag: DW_TAG_member, name: "tinc_state", scope: !100, file: !1, line: 23, baseType: !55, size: 8)
!103 = !DILocalVariable(name: "ser", scope: !73, file: !1, line: 59, type: !104)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_private", file: !1, line: 37, baseType: !105)
!105 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 35, size: 256, elements: !106)
!106 = !{!107, !117, !124, !126}
!107 = !DIDerivedType(tag: DW_TAG_member, name: "status", scope: !105, file: !1, line: 36, baseType: !108, size: 64)
!108 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_status", file: !1, line: 33, baseType: !109)
!109 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 33, size: 64, elements: !110)
!110 = !{!111, !112}
!111 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !109, file: !1, line: 33, baseType: !11, size: 32)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !109, file: !1, line: 33, baseType: !113, size: 32, offset: 32)
!113 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_buf_status", file: !1, line: 32, baseType: !114)
!114 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 32, size: 32, elements: !115)
!115 = !{!116}
!116 = !DIDerivedType(tag: DW_TAG_member, name: "size_used", scope: !114, file: !1, line: 32, baseType: !11, size: 32)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !105, file: !1, line: 36, baseType: !118, size: 128, offset: 64)
!118 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_buffer", file: !1, line: 34, baseType: !119)
!119 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 34, size: 128, elements: !120)
!120 = !{!121, !122}
!121 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !119, file: !1, line: 34, baseType: !11, size: 32)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !119, file: !1, line: 34, baseType: !123, size: 64, offset: 64)
!123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "fmt", scope: !105, file: !1, line: 36, baseType: !125, size: 32, offset: 192)
!125 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_format", file: !1, line: 30, baseType: !3)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "csv_separator", scope: !105, file: !1, line: 36, baseType: !61, size: 16, offset: 224)
!127 = !DILocation(line: 59, column: 15, scope: !73)
!128 = !DILocation(line: 60, column: 3, scope: !73)
!129 = !DILocation(line: 62, column: 7, scope: !73)
!130 = !DILocation(line: 62, column: 24, scope: !73)
!131 = !DILocation(line: 63, column: 14, scope: !73)
!132 = !DILocation(line: 63, column: 24, scope: !73)
!133 = !DILocation(line: 64, column: 3, scope: !73)
!134 = !DILocation(line: 64, column: 24, scope: !73)
!135 = !DILocation(line: 65, column: 14, scope: !73)
!136 = !DILocation(line: 65, column: 24, scope: !73)
!137 = !DILocation(line: 68, column: 22, scope: !73)
!138 = !DILocalVariable(name: "su", scope: !73, file: !1, line: 67, type: !11)
!139 = !DILocation(line: 68, column: 3, scope: !73)
!140 = !DILocation(line: 69, column: 15, scope: !73)
!141 = !DILocation(line: 69, column: 18, scope: !73)
!142 = !DILocation(line: 69, column: 3, scope: !73)
!143 = !DILocation(line: 70, column: 15, scope: !73)
!144 = !DILocation(line: 70, column: 18, scope: !73)
!145 = !DILocation(line: 70, column: 24, scope: !73)
!146 = !DILocation(line: 70, column: 3, scope: !73)
!147 = !DILocation(line: 71, column: 33, scope: !73)
!148 = !DILocation(line: 71, column: 21, scope: !73)
!149 = !DILocation(line: 71, column: 31, scope: !73)
!150 = !DILocation(line: 72, column: 14, scope: !73)
!151 = !DILocation(line: 72, column: 31, scope: !73)
!152 = !DILocation(line: 75, column: 22, scope: !73)
!153 = !DILocalVariable(name: "value", scope: !73, file: !1, line: 74, type: !154)
!154 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !155, line: 26, baseType: !156)
!155 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!156 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !14, line: 41, baseType: !76)
!157 = !DILocation(line: 75, column: 3, scope: !73)
!158 = !DILocation(line: 76, column: 25, scope: !73)
!159 = !DILocation(line: 76, column: 31, scope: !73)
!160 = !DILocation(line: 76, column: 15, scope: !73)
!161 = !DILocation(line: 76, column: 3, scope: !73)
!162 = !DILocation(line: 78, column: 26, scope: !73)
!163 = !DILocalVariable(name: "sser", scope: !73, file: !1, line: 78, type: !15)
!164 = !DILocation(line: 80, column: 16, scope: !73)
!165 = !DILocalVariable(name: "r_tinc", scope: !73, file: !1, line: 80, type: !76)
!166 = !DILocation(line: 81, column: 16, scope: !73)
!167 = !DILocalVariable(name: "r_ser", scope: !73, file: !1, line: 81, type: !76)
!168 = !DILocation(line: 83, column: 22, scope: !73)
!169 = !DILocation(line: 83, column: 27, scope: !73)
!170 = !DILocation(line: 83, column: 15, scope: !73)
!171 = !DILocation(line: 83, column: 3, scope: !73)
!172 = !DILocation(line: 84, column: 3, scope: !73)
!173 = distinct !DISubprogram(name: "predicate_tinc_oob_read", scope: !25, file: !25, line: 41, type: !174, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !24, retainedNodes: !26)
!174 = !DISubroutineType(types: !175)
!175 = !{!76, !176, !189}
!176 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !177, size: 64)
!177 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tinc_module", file: !25, line: 37, size: 128, elements: !178)
!178 = !{!179}
!179 = !DIDerivedType(tag: DW_TAG_member, name: "packet", scope: !177, file: !25, line: 38, baseType: !180, size: 128)
!180 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tinc_packet", file: !25, line: 27, size: 128, elements: !181)
!181 = !{!182, !186, !188}
!182 = !DIDerivedType(tag: DW_TAG_member, name: "payload", scope: !180, file: !25, line: 28, baseType: !183, size: 64)
!183 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !184, size: 64)
!184 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !185)
!185 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int8_t", file: !25, line: 23, baseType: !55)
!186 = !DIDerivedType(tag: DW_TAG_member, name: "payload_packet_len", scope: !180, file: !25, line: 29, baseType: !187, size: 16, offset: 64)
!187 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int16_t", file: !25, line: 24, baseType: !94)
!188 = !DIDerivedType(tag: DW_TAG_member, name: "tcp_non_null", scope: !180, file: !25, line: 30, baseType: !76, size: 32, offset: 96)
!189 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !190, size: 64)
!190 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tinc_flow", file: !25, line: 33, size: 8, elements: !191)
!191 = !{!192}
!192 = !DIDerivedType(tag: DW_TAG_member, name: "tinc_state", scope: !190, file: !25, line: 34, baseType: !185, size: 8)
!193 = !DILocalVariable(name: "ndpi_struct", arg: 1, scope: !173, file: !25, line: 41, type: !176)
!194 = !DILocation(line: 0, scope: !173)
!195 = !DILocalVariable(name: "flow", arg: 2, scope: !173, file: !25, line: 42, type: !189)
!196 = !DILocalVariable(name: "packet_payload", scope: !173, file: !25, line: 44, type: !183)
!197 = !DILocalVariable(name: "payload_len", scope: !173, file: !25, line: 45, type: !198)
!198 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int32_t", file: !25, line: 25, baseType: !11)
!199 = !DILocation(line: 48, column: 8, scope: !200)
!200 = distinct !DILexicalBlock(scope: !173, file: !25, line: 48, column: 7)
!201 = !DILocation(line: 48, column: 7, scope: !173)
!202 = !DILocation(line: 51, column: 24, scope: !203)
!203 = distinct !DILexicalBlock(scope: !173, file: !25, line: 51, column: 7)
!204 = !DILocation(line: 51, column: 29, scope: !203)
!205 = !DILocation(line: 51, column: 49, scope: !203)
!206 = !DILocation(line: 51, column: 7, scope: !173)
!207 = !DILocation(line: 54, column: 19, scope: !208)
!208 = distinct !DILexicalBlock(scope: !173, file: !25, line: 54, column: 7)
!209 = !DILocation(line: 54, column: 7, scope: !173)
!210 = !DILocation(line: 55, column: 7, scope: !211)
!211 = distinct !DILexicalBlock(scope: !173, file: !25, line: 55, column: 7)
!212 = !DILocation(line: 55, column: 25, scope: !211)
!213 = !DILocation(line: 55, column: 7, scope: !173)
!214 = !DILocation(line: 56, column: 7, scope: !215)
!215 = distinct !DILexicalBlock(scope: !173, file: !25, line: 56, column: 7)
!216 = !DILocation(line: 56, column: 25, scope: !215)
!217 = !DILocation(line: 56, column: 7, scope: !173)
!218 = !DILocation(line: 57, column: 7, scope: !219)
!219 = distinct !DILexicalBlock(scope: !173, file: !25, line: 57, column: 7)
!220 = !DILocation(line: 57, column: 25, scope: !219)
!221 = !DILocation(line: 57, column: 7, scope: !173)
!222 = !DILocalVariable(name: "numbers_left", scope: !173, file: !25, line: 60, type: !185)
!223 = !DILocalVariable(name: "i", scope: !173, file: !25, line: 59, type: !187)
!224 = !DILocation(line: 66, column: 13, scope: !225)
!225 = distinct !DILexicalBlock(scope: !226, file: !25, line: 66, column: 11)
!226 = distinct !DILexicalBlock(scope: !227, file: !25, line: 64, column: 15)
!227 = distinct !DILexicalBlock(scope: !173, file: !25, line: 62, column: 24)
!228 = !DILocation(line: 66, column: 38, scope: !225)
!229 = !DILocation(line: 67, column: 8, scope: !226)
!230 = !DILocation(line: 65, column: 13, scope: !231)
!231 = distinct !DILexicalBlock(scope: !226, file: !25, line: 65, column: 11)
!232 = !DILocation(line: 65, column: 11, scope: !226)
!233 = distinct !{!233, !234, !235}
!234 = !DILocation(line: 64, column: 5, scope: !227)
!235 = !DILocation(line: 68, column: 5, scope: !227)
!236 = !DILocation(line: 70, column: 11, scope: !237)
!237 = distinct !DILexicalBlock(scope: !227, file: !25, line: 70, column: 9)
!238 = !DILocation(line: 70, column: 9, scope: !227)
!239 = !DILocation(line: 71, column: 25, scope: !240)
!240 = distinct !DILexicalBlock(scope: !227, file: !25, line: 71, column: 9)
!241 = !DILocation(line: 71, column: 29, scope: !240)
!242 = !DILocation(line: 71, column: 9, scope: !227)
!243 = !DILocation(line: 87, column: 3, scope: !173)
!244 = !DILocation(line: 93, column: 11, scope: !245)
!245 = distinct !DILexicalBlock(scope: !246, file: !25, line: 93, column: 9)
!246 = distinct !DILexicalBlock(scope: !173, file: !25, line: 89, column: 68)
!247 = !DILocation(line: 88, column: 12, scope: !173)
!248 = !DILocation(line: 88, column: 37, scope: !173)
!249 = !DILocation(line: 90, column: 6, scope: !246)
!250 = !DILocation(line: 93, column: 9, scope: !246)
!251 = distinct !{!251, !243, !252, !253}
!252 = !DILocation(line: 94, column: 3, scope: !173)
!253 = !{!"llvm.loop.mustprogress"}
!254 = !DILocation(line: 97, column: 1, scope: !173)
!255 = !DILocation(line: 84, column: 9, scope: !256)
!256 = distinct !DILexicalBlock(scope: !173, file: !25, line: 84, column: 7)
!257 = !DILocation(line: 84, column: 7, scope: !173)
!258 = distinct !DISubprogram(name: "predicate_serializer_int32_oob_write", scope: !28, file: !28, line: 66, type: !259, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !27, retainedNodes: !26)
!259 = !DISubroutineType(types: !260)
!260 = !{!76, !261, !266, !154}
!261 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !262, size: 64)
!262 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_serializer", file: !28, line: 64, baseType: !263)
!263 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !28, line: 64, size: 256, elements: !264)
!264 = !{!265}
!265 = !DIDerivedType(tag: DW_TAG_member, name: "c", scope: !263, file: !28, line: 64, baseType: !20, size: 256)
!266 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !267, size: 64)
!267 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !21)
!268 = !DILocalVariable(name: "_serializer", arg: 1, scope: !258, file: !28, line: 66, type: !261)
!269 = !DILocation(line: 0, scope: !258)
!270 = !DILocalVariable(name: "key", arg: 2, scope: !258, file: !28, line: 67, type: !266)
!271 = !DILocalVariable(name: "value", arg: 3, scope: !258, file: !28, line: 68, type: !154)
!272 = !DILocalVariable(name: "serializer", scope: !258, file: !28, line: 70, type: !32)
!273 = !DILocation(line: 72, column: 19, scope: !274)
!274 = distinct !DILexicalBlock(scope: !258, file: !28, line: 72, column: 7)
!275 = !DILocation(line: 72, column: 23, scope: !274)
!276 = !DILocation(line: 72, column: 7, scope: !258)
!277 = !DILocation(line: 75, column: 26, scope: !278)
!278 = distinct !DILexicalBlock(scope: !258, file: !28, line: 75, column: 7)
!279 = !DILocation(line: 75, column: 31, scope: !278)
!280 = !DILocation(line: 75, column: 7, scope: !258)
!281 = !DILocation(line: 78, column: 26, scope: !282)
!282 = distinct !DILexicalBlock(scope: !258, file: !28, line: 78, column: 7)
!283 = !DILocation(line: 78, column: 33, scope: !282)
!284 = !DILocation(line: 78, column: 57, scope: !282)
!285 = !DILocation(line: 78, column: 64, scope: !282)
!286 = !DILocation(line: 78, column: 43, scope: !282)
!287 = !DILocation(line: 78, column: 7, scope: !258)
!288 = !DILocalVariable(name: "buff_diff", scope: !258, file: !28, line: 80, type: !41)
!289 = !DILocalVariable(name: "needed", scope: !258, file: !28, line: 82, type: !290)
!290 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int16_t", file: !28, line: 32, baseType: !94)
!291 = !DILocalVariable(name: "size_used_after", scope: !258, file: !28, line: 94, type: !41)
!292 = !DILocation(line: 95, column: 28, scope: !293)
!293 = distinct !DILexicalBlock(scope: !258, file: !28, line: 95, column: 7)
!294 = !DILocation(line: 95, column: 34, scope: !293)
!295 = !DILocation(line: 95, column: 52, scope: !293)
!296 = !DILocation(line: 97, column: 25, scope: !297)
!297 = distinct !DILexicalBlock(scope: !298, file: !28, line: 97, column: 9)
!298 = distinct !DILexicalBlock(scope: !293, file: !28, line: 95, column: 76)
!299 = !DILocation(line: 97, column: 9, scope: !298)
!300 = !DILocation(line: 98, column: 20, scope: !298)
!301 = !DILocation(line: 99, column: 3, scope: !298)
!302 = !DILocation(line: 104, column: 23, scope: !303)
!303 = distinct !DILexicalBlock(scope: !258, file: !28, line: 104, column: 7)
!304 = !DILocation(line: 114, column: 1, scope: !258)
!305 = distinct !DISubprogram(name: "memset", scope: !306, file: !306, line: 12, type: !307, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !65, retainedNodes: !26)
!306 = !DIFile(filename: "runtime/Freestanding/memset.c", directory: "/home/wcontrerasmartinez/klee")
!307 = !DISubroutineType(types: !308)
!308 = !{!64, !64, !76, !309}
!309 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !310, line: 46, baseType: !311)
!310 = !DIFile(filename: "/usr/lib/llvm-13/lib/clang/13.0.1/include/stddef.h", directory: "")
!311 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!312 = !DILocalVariable(name: "dst", arg: 1, scope: !305, file: !306, line: 12, type: !64)
!313 = !DILocation(line: 0, scope: !305)
!314 = !DILocalVariable(name: "s", arg: 2, scope: !305, file: !306, line: 12, type: !76)
!315 = !DILocalVariable(name: "count", arg: 3, scope: !305, file: !306, line: 12, type: !309)
!316 = !DILocalVariable(name: "a", scope: !305, file: !306, line: 13, type: !317)
!317 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!318 = !DILocation(line: 14, column: 18, scope: !305)
!319 = !DILocation(line: 14, column: 3, scope: !305)
!320 = !DILocation(line: 14, column: 15, scope: !305)
!321 = !DILocation(line: 15, column: 7, scope: !305)
!322 = !DILocation(line: 15, column: 10, scope: !305)
!323 = distinct !{!323, !319, !324, !253}
!324 = !DILocation(line: 15, column: 12, scope: !305)
!325 = !DILocation(line: 16, column: 3, scope: !305)
