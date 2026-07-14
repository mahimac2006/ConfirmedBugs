; ModuleID = 'linked_tinc-oob-read_printable-string-oob-read.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tinc_module = type { %struct.tinc_packet }
%struct.tinc_packet = type { i8*, i16, i32 }
%struct.tinc_flow = type { i8 }

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"ps_len\00", align 1
@.str.2 = private unnamed_addr constant [60 x i8] c"0 && \22REACHED_BOTH_tinc-oob-read_printable-string-oob-read\22\00", align 1
@.str.3 = private unnamed_addr constant [49 x i8] c"driver_tinc-oob-read_printable-string-oob-read.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [15 x i8] c"int main(void)\00", align 1

; Function Attrs: noinline noreturn nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !23 {
  %1 = alloca [256 x i8], align 16
  %2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata [256 x i8]* %1, metadata !27, metadata !DIExpression()), !dbg !36
  %3 = getelementptr inbounds [256 x i8], [256 x i8]* %1, i64 0, i64 0, !dbg !37
  call void @klee_make_symbolic(i8* nonnull %3, i64 256, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)) #7, !dbg !38
  call void @llvm.dbg.value(metadata i16 0, metadata !39, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 16)), !dbg !53
  call void @llvm.dbg.value(metadata i16 0, metadata !39, metadata !DIExpression(DW_OP_LLVM_fragment, 80, 16)), !dbg !53
  call void @llvm.dbg.value(metadata i32 0, metadata !39, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 32)), !dbg !53
  call void @llvm.dbg.value(metadata i8* %3, metadata !39, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 64)), !dbg !53
  call void @llvm.dbg.value(metadata i16 256, metadata !39, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 16)), !dbg !53
  call void @llvm.dbg.value(metadata i32 1, metadata !39, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 32)), !dbg !53
  call void @llvm.dbg.value(metadata i8 2, metadata !54, metadata !DIExpression()), !dbg !53
  %4 = bitcast i64* %2 to i8*, !dbg !58
  call void @llvm.dbg.value(metadata i64* %2, metadata !59, metadata !DIExpression(DW_OP_deref)), !dbg !53
  call void @klee_make_symbolic(i8* nonnull %4, i64 8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)) #7, !dbg !60
  %5 = load i64, i64* %2, align 8, !dbg !61
  call void @llvm.dbg.value(metadata i64 %5, metadata !59, metadata !DIExpression()), !dbg !53
  %6 = icmp ugt i64 %5, 256, !dbg !62
  %7 = zext i1 %6 to i64, !dbg !61
  call void @klee_assume(i64 %7) #7, !dbg !63
  %8 = load i64, i64* %2, align 8, !dbg !64
  call void @llvm.dbg.value(metadata i64 %8, metadata !59, metadata !DIExpression()), !dbg !53
  %9 = icmp ult i64 %8, 513, !dbg !65
  %10 = zext i1 %9 to i64, !dbg !64
  call void @klee_assume(i64 %10) #7, !dbg !66
  %11 = call fastcc i32 @predicate_tinc_oob_read(i8* nonnull %3, i16 256, i32 1, i8 2), !dbg !67
  call void @llvm.dbg.value(metadata i32 %11, metadata !68, metadata !DIExpression()), !dbg !53
  %12 = load i64, i64* %2, align 8, !dbg !69
  call void @llvm.dbg.value(metadata i64 %12, metadata !59, metadata !DIExpression()), !dbg !53
  %13 = call fastcc i32 @predicate_printable_string_oob_read(i8* nonnull %3, i64 %12), !dbg !70
  call void @llvm.dbg.value(metadata i32 %13, metadata !71, metadata !DIExpression()), !dbg !53
  %14 = icmp eq i32 %11, 1, !dbg !72
  %15 = icmp eq i32 %13, 1, !dbg !73
  %16 = select i1 %14, i1 %15, i1 false, !dbg !73
  %17 = zext i1 %16 to i64, !dbg !74
  call void @klee_assume(i64 %17) #7, !dbg !75
  call void @__assert_fail(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.3, i64 0, i64 0), i32 54, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #8, !dbg !76
  unreachable, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) local_unnamed_addr #2

declare dso_local void @klee_assume(i64) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #3

; Function Attrs: nofree noinline norecurse nosync nounwind readonly uwtable
define internal fastcc i32 @predicate_tinc_oob_read(i8* nocapture readonly %.0.0.0.val, i16 %.0.0.1.val, i32 %.0.0.2.val, i8 %.0.0.val) unnamed_addr #4 !dbg !77 {
  call void @llvm.dbg.value(metadata %struct.tinc_module* undef, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.value(metadata %struct.tinc_flow* undef, metadata !99, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.value(metadata i8* %.0.0.0.val, metadata !100, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.value(metadata i16 %.0.0.1.val, metadata !101, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !98
  %.not = icmp eq i32 %.0.0.2.val, 0, !dbg !106
  %1 = icmp eq i16 %.0.0.1.val, 0
  %or.cond = select i1 %.not, i1 true, i1 %1, !dbg !108
  br i1 %or.cond, label %.critedge, label %2, !dbg !108

2:                                                ; preds = %0
  %.not5 = icmp eq i8 %.0.0.val, 2, !dbg !109
  br i1 %.not5, label %5, label %3, !dbg !111

3:                                                ; preds = %2
  %.not14 = icmp ne i8 %.0.0.val, 3, !dbg !112
  %4 = icmp ult i16 %.0.0.1.val, 12
  %or.cond15 = select i1 %.not14, i1 true, i1 %4, !dbg !113
  br i1 %or.cond15, label %.critedge, label %6, !dbg !113

5:                                                ; preds = %2
  %.old = icmp ult i16 %.0.0.1.val, 12, !dbg !114
  br i1 %.old, label %.critedge, label %6, !dbg !116

6:                                                ; preds = %3, %5
  %7 = load i8, i8* %.0.0.0.val, align 1, !dbg !117
  %.not6 = icmp eq i8 %7, 49, !dbg !119
  br i1 %.not6, label %8, label %.critedge, !dbg !120

8:                                                ; preds = %6
  %9 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 1, !dbg !121
  %10 = load i8, i8* %9, align 1, !dbg !121
  %.not7 = icmp eq i8 %10, 32, !dbg !123
  br i1 %.not7, label %11, label %.critedge, !dbg !124

11:                                               ; preds = %8
  %12 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 2, !dbg !125
  %13 = load i8, i8* %12, align 1, !dbg !125
  %14 = icmp ne i8 %13, 32, !dbg !127
  %.not1226 = icmp ugt i16 %.0.0.1.val, 3
  %or.cond49 = select i1 %14, i1 %.not1226, i1 false, !dbg !128
  call void @llvm.dbg.value(metadata i8 4, metadata !129, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.value(metadata i16 3, metadata !130, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.value(metadata i8 4, metadata !129, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.value(metadata i16 3, metadata !130, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.value(metadata i16 3, metadata !130, metadata !DIExpression()), !dbg !98
  br i1 %or.cond49, label %.lr.ph, label %.critedge, !dbg !128

.lr.ph:                                           ; preds = %11, %19
  %.127 = phi i16 [ %20, %19 ], [ 3, %11 ]
  call void @llvm.dbg.value(metadata i16 %.127, metadata !130, metadata !DIExpression()), !dbg !98
  %15 = zext i16 %.127 to i64, !dbg !131
  %16 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 %15, !dbg !131
  %17 = load i8, i8* %16, align 1, !dbg !131
  %.off = add i8 %17, -48, !dbg !135
  %18 = icmp ult i8 %.off, 10, !dbg !135
  br i1 %18, label %19, label %21, !dbg !135

19:                                               ; preds = %.lr.ph
  %20 = add nuw i16 %.127, 1, !dbg !136
  call void @llvm.dbg.value(metadata i16 %20, metadata !130, metadata !DIExpression()), !dbg !98
  %exitcond31.not = icmp eq i16 %20, %.0.0.1.val, !dbg !137
  br i1 %exitcond31.not, label %.critedge, label %.lr.ph, !dbg !139, !llvm.loop !140

21:                                               ; preds = %.lr.ph
  %.not13 = icmp ult i16 %.127, %.0.0.1.val, !dbg !143
  br i1 %.not13, label %22, label %.critedge, !dbg !145

22:                                               ; preds = %21
  %23 = add i16 %.127, 1, !dbg !146
  call void @llvm.dbg.value(metadata i16 %23, metadata !130, metadata !DIExpression()), !dbg !98
  %24 = icmp eq i8 %17, 32, !dbg !148
  call void @llvm.dbg.value(metadata i8 3, metadata !129, metadata !DIExpression()), !dbg !98
  %.not1226.1 = icmp ult i16 %23, %.0.0.1.val
  %or.cond50 = select i1 %24, i1 %.not1226.1, i1 false, !dbg !149
  call void @llvm.dbg.value(metadata i8 3, metadata !129, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.value(metadata i16 %23, metadata !130, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.value(metadata i8 3, metadata !129, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.value(metadata i16 %23, metadata !130, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.value(metadata i16 %23, metadata !130, metadata !DIExpression()), !dbg !98
  br i1 %or.cond50, label %.lr.ph.1, label %.critedge, !dbg !149

.preheader:                                       ; preds = %.thread
  %25 = zext i16 %57 to i64, !dbg !150
  %wide.trip.count = zext i16 %.0.0.1.val to i64, !dbg !151
  br label %26, !dbg !150

26:                                               ; preds = %.preheader, %.critedge1
  %indvars.iv = phi i64 [ %25, %.preheader ], [ %indvars.iv.next, %.critedge1 ], !dbg !98
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !130, metadata !DIExpression()), !dbg !98
  %27 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 %indvars.iv, !dbg !154
  %28 = load i8, i8* %27, align 1, !dbg !154
  %.off64 = add i8 %28, -48, !dbg !155
  %29 = icmp ult i8 %.off64, 10, !dbg !155
  %.off65 = add i8 %28, -65
  %30 = icmp ult i8 %.off65, 26
  %or.cond17 = or i1 %29, %30, !dbg !155
  br i1 %or.cond17, label %.critedge1, label %.critedge, !dbg !155

.critedge1:                                       ; preds = %26
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !156
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !130, metadata !DIExpression()), !dbg !98
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count, !dbg !151
  br i1 %exitcond.not, label %.critedge, label %26, !dbg !157, !llvm.loop !158

.critedge:                                        ; preds = %26, %19, %39, %49, %59, %.critedge1, %22, %21, %35, %36, %45, %46, %55, %56, %.thread, %11, %8, %6, %5, %3, %0
  %.0 = phi i32 [ 0, %0 ], [ 0, %3 ], [ 0, %5 ], [ 0, %6 ], [ 0, %8 ], [ 0, %11 ], [ 1, %.thread ], [ 0, %56 ], [ 0, %55 ], [ 0, %46 ], [ 0, %45 ], [ 0, %36 ], [ 0, %35 ], [ 0, %21 ], [ 0, %22 ], [ 1, %.critedge1 ], [ 0, %59 ], [ 0, %49 ], [ 0, %39 ], [ 0, %19 ], [ 0, %26 ], !dbg !98
  ret i32 %.0, !dbg !161

.lr.ph.1:                                         ; preds = %22, %39
  %.127.1 = phi i16 [ %40, %39 ], [ %23, %22 ]
  call void @llvm.dbg.value(metadata i16 %.127.1, metadata !130, metadata !DIExpression()), !dbg !98
  %31 = zext i16 %.127.1 to i64, !dbg !131
  %32 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 %31, !dbg !131
  %33 = load i8, i8* %32, align 1, !dbg !131
  %.off61 = add i8 %33, -48, !dbg !135
  %34 = icmp ult i8 %.off61, 10, !dbg !135
  br i1 %34, label %39, label %35, !dbg !135

35:                                               ; preds = %.lr.ph.1
  %.not13.1 = icmp ult i16 %.127.1, %.0.0.1.val, !dbg !143
  br i1 %.not13.1, label %36, label %.critedge, !dbg !145

36:                                               ; preds = %35
  %37 = add i16 %.127.1, 1, !dbg !146
  call void @llvm.dbg.value(metadata i16 %37, metadata !130, metadata !DIExpression()), !dbg !98
  %38 = icmp eq i8 %33, 32, !dbg !148
  call void @llvm.dbg.value(metadata i8 2, metadata !129, metadata !DIExpression()), !dbg !98
  %.not1226.2 = icmp ult i16 %37, %.0.0.1.val
  %or.cond43 = select i1 %38, i1 %.not1226.2, i1 false, !dbg !149
  br i1 %or.cond43, label %.lr.ph.2, label %.critedge, !dbg !149

39:                                               ; preds = %.lr.ph.1
  %40 = add nuw i16 %.127.1, 1, !dbg !136
  call void @llvm.dbg.value(metadata i16 %40, metadata !130, metadata !DIExpression()), !dbg !98
  %exitcond31.1.not = icmp eq i16 %40, %.0.0.1.val, !dbg !137
  br i1 %exitcond31.1.not, label %.critedge, label %.lr.ph.1, !dbg !139, !llvm.loop !140

.lr.ph.2:                                         ; preds = %36, %49
  %.127.2 = phi i16 [ %50, %49 ], [ %37, %36 ]
  call void @llvm.dbg.value(metadata i16 %.127.2, metadata !130, metadata !DIExpression()), !dbg !98
  %41 = zext i16 %.127.2 to i64, !dbg !131
  %42 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 %41, !dbg !131
  %43 = load i8, i8* %42, align 1, !dbg !131
  %.off62 = add i8 %43, -48, !dbg !135
  %44 = icmp ult i8 %.off62, 10, !dbg !135
  br i1 %44, label %49, label %45, !dbg !135

45:                                               ; preds = %.lr.ph.2
  %.not13.2 = icmp ult i16 %.127.2, %.0.0.1.val, !dbg !143
  br i1 %.not13.2, label %46, label %.critedge, !dbg !145

46:                                               ; preds = %45
  %47 = add i16 %.127.2, 1, !dbg !146
  call void @llvm.dbg.value(metadata i16 %47, metadata !130, metadata !DIExpression()), !dbg !98
  %48 = icmp eq i8 %43, 32, !dbg !148
  call void @llvm.dbg.value(metadata i8 1, metadata !129, metadata !DIExpression()), !dbg !98
  %.not1226.3 = icmp ult i16 %47, %.0.0.1.val
  %or.cond46 = select i1 %48, i1 %.not1226.3, i1 false, !dbg !149
  br i1 %or.cond46, label %.lr.ph.3, label %.critedge, !dbg !149

49:                                               ; preds = %.lr.ph.2
  %50 = add nuw i16 %.127.2, 1, !dbg !136
  call void @llvm.dbg.value(metadata i16 %50, metadata !130, metadata !DIExpression()), !dbg !98
  %exitcond31.2.not = icmp eq i16 %50, %.0.0.1.val, !dbg !137
  br i1 %exitcond31.2.not, label %.critedge, label %.lr.ph.2, !dbg !139, !llvm.loop !140

.lr.ph.3:                                         ; preds = %46, %59
  %.127.3 = phi i16 [ %60, %59 ], [ %47, %46 ]
  call void @llvm.dbg.value(metadata i16 %.127.3, metadata !130, metadata !DIExpression()), !dbg !98
  %51 = zext i16 %.127.3 to i64, !dbg !131
  %52 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 %51, !dbg !131
  %53 = load i8, i8* %52, align 1, !dbg !131
  %.off63 = add i8 %53, -48, !dbg !135
  %54 = icmp ult i8 %.off63, 10, !dbg !135
  br i1 %54, label %59, label %55, !dbg !135

55:                                               ; preds = %.lr.ph.3
  %.not13.3 = icmp ult i16 %.127.3, %.0.0.1.val, !dbg !143
  br i1 %.not13.3, label %56, label %.critedge, !dbg !145

56:                                               ; preds = %55
  %57 = add i16 %.127.3, 1, !dbg !146
  call void @llvm.dbg.value(metadata i16 %57, metadata !130, metadata !DIExpression()), !dbg !98
  %58 = icmp eq i8 %53, 32, !dbg !148
  call void @llvm.dbg.value(metadata i8 0, metadata !129, metadata !DIExpression()), !dbg !98
  br i1 %58, label %.thread, label %.critedge, !dbg !149

.thread:                                          ; preds = %56
  call void @llvm.dbg.value(metadata i8 0, metadata !129, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.value(metadata i16 %57, metadata !130, metadata !DIExpression()), !dbg !98
  %.not10 = icmp ult i16 %57, %.0.0.1.val, !dbg !162
  br i1 %.not10, label %.preheader, label %.critedge, !dbg !164

59:                                               ; preds = %.lr.ph.3
  %60 = add nuw i16 %.127.3, 1, !dbg !136
  call void @llvm.dbg.value(metadata i16 %60, metadata !130, metadata !DIExpression()), !dbg !98
  %exitcond31.3.not = icmp eq i16 %60, %.0.0.1.val, !dbg !137
  br i1 %exitcond31.3.not, label %.critedge, label %.lr.ph.3, !dbg !139, !llvm.loop !140
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readnone uwtable willreturn
define internal fastcc i32 @predicate_printable_string_oob_read(i8* readnone %0, i64 %1) unnamed_addr #5 !dbg !165 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !169, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.value(metadata i64 %1, metadata !171, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.value(metadata i64 256, metadata !172, metadata !DIExpression()), !dbg !170
  %3 = icmp ne i8* %0, null, !dbg !173
  %4 = icmp ne i64 %1, 0
  %or.cond = select i1 %3, i1 %4, i1 false, !dbg !175
  %5 = icmp ugt i64 %1, 256, !dbg !175
  %narrow = select i1 %or.cond, i1 %5, i1 false, !dbg !175
  %.0 = zext i1 %narrow to i32, !dbg !175
  ret i32 %.0, !dbg !176
}

; Function Attrs: nofree noinline norecurse nosync nounwind uwtable writeonly
define dso_local i8* @memset(i8* returned %0, i32 %1, i64 %2) local_unnamed_addr #6 !dbg !177 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !181, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.value(metadata i32 %1, metadata !183, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.value(metadata i64 %2, metadata !184, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.value(metadata i8* %0, metadata !185, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.value(metadata i64 %2, metadata !184, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !182
  %.not2 = icmp eq i64 %2, 0, !dbg !186
  br i1 %.not2, label %._crit_edge, label %.lr.ph, !dbg !187

.lr.ph:                                           ; preds = %3
  %4 = trunc i32 %1 to i8
  br label %5, !dbg !187

5:                                                ; preds = %.lr.ph, %5
  %.04 = phi i8* [ %0, %.lr.ph ], [ %7, %5 ]
  %.013 = phi i64 [ %2, %.lr.ph ], [ %6, %5 ]
  call void @llvm.dbg.value(metadata i8* %.04, metadata !185, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.value(metadata i64 %.013, metadata !184, metadata !DIExpression()), !dbg !182
  %6 = add i64 %.013, -1, !dbg !188
  call void @llvm.dbg.value(metadata i64 %6, metadata !184, metadata !DIExpression()), !dbg !182
  %7 = getelementptr inbounds i8, i8* %.04, i64 1, !dbg !189
  call void @llvm.dbg.value(metadata i8* %7, metadata !185, metadata !DIExpression()), !dbg !182
  store i8 %4, i8* %.04, align 1, !dbg !190
  call void @llvm.dbg.value(metadata i64 %6, metadata !184, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !182
  %.not = icmp eq i64 %6, 0, !dbg !186
  br i1 %.not, label %._crit_edge, label %5, !dbg !187, !llvm.loop !191

._crit_edge:                                      ; preds = %5, %3
  ret i8* %0, !dbg !193
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline noreturn nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree noinline norecurse nosync nounwind readonly uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree noinline norecurse nosync nounwind readnone uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree noinline norecurse nosync nounwind uwtable writeonly "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0, !9, !11, !15}
!llvm.ident = !{!17, !17, !17, !17}
!llvm.module.flags = !{!18, !19, !20, !21, !22}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "driver_tinc-oob-read_printable-string-oob-read.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!2 = !{}
!3 = !{!4, !7}
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !5, line: 46, baseType: !6)
!5 = !DIFile(filename: "/usr/lib/llvm-13/lib/clang/13.0.1/include/stddef.h", directory: "")
!6 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!9 = distinct !DICompileUnit(language: DW_LANG_C99, file: !10, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!10 = !DIFile(filename: "predicate_tinc-oob-read.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!11 = distinct !DICompileUnit(language: DW_LANG_C99, file: !12, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !13, splitDebugInlining: false, nameTableKind: None)
!12 = !DIFile(filename: "predicate_printable-string-oob-read.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!13 = !{!14}
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!15 = distinct !DICompileUnit(language: DW_LANG_C99, file: !16, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!16 = !DIFile(filename: "/home/wcontrerasmartinez/klee/runtime/Freestanding/memset.c", directory: "/home/wcontrerasmartinez/klee/build/runtime/Freestanding")
!17 = !{!"Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8"}
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 28, type: !24, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!24 = !DISubroutineType(types: !25)
!25 = !{!26}
!26 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!27 = !DILocalVariable(name: "buf", scope: !23, file: !1, line: 29, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 2048, elements: !34)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !30, line: 24, baseType: !31)
!30 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !32, line: 38, baseType: !33)
!32 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!33 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!34 = !{!35}
!35 = !DISubrange(count: 256)
!36 = !DILocation(line: 29, column: 11, scope: !23)
!37 = !DILocation(line: 30, column: 22, scope: !23)
!38 = !DILocation(line: 30, column: 3, scope: !23)
!39 = !DILocalVariable(name: "tinc_mod", scope: !23, file: !1, line: 33, type: !40)
!40 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tinc_module", file: !1, line: 23, size: 128, elements: !41)
!41 = !{!42}
!42 = !DIDerivedType(tag: DW_TAG_member, name: "packet", scope: !40, file: !1, line: 23, baseType: !43, size: 128)
!43 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tinc_packet", file: !1, line: 20, size: 128, elements: !44)
!44 = !{!45, !48, !52}
!45 = !DIDerivedType(tag: DW_TAG_member, name: "payload", scope: !43, file: !1, line: 20, baseType: !46, size: 64)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !29)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "payload_packet_len", scope: !43, file: !1, line: 20, baseType: !49, size: 16, offset: 64)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !30, line: 25, baseType: !50)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !32, line: 40, baseType: !51)
!51 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "tcp_non_null", scope: !43, file: !1, line: 21, baseType: !26, size: 32, offset: 96)
!53 = !DILocation(line: 0, scope: !23)
!54 = !DILocalVariable(name: "tinc_flow", scope: !23, file: !1, line: 34, type: !55)
!55 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tinc_flow", file: !1, line: 22, size: 8, elements: !56)
!56 = !{!57}
!57 = !DIDerivedType(tag: DW_TAG_member, name: "tinc_state", scope: !55, file: !1, line: 22, baseType: !29, size: 8)
!58 = !DILocation(line: 45, column: 22, scope: !23)
!59 = !DILocalVariable(name: "ps_len", scope: !23, file: !1, line: 44, type: !4)
!60 = !DILocation(line: 45, column: 3, scope: !23)
!61 = !DILocation(line: 46, column: 15, scope: !23)
!62 = !DILocation(line: 46, column: 22, scope: !23)
!63 = !DILocation(line: 46, column: 3, scope: !23)
!64 = !DILocation(line: 47, column: 15, scope: !23)
!65 = !DILocation(line: 47, column: 22, scope: !23)
!66 = !DILocation(line: 47, column: 3, scope: !23)
!67 = !DILocation(line: 49, column: 16, scope: !23)
!68 = !DILocalVariable(name: "r_tinc", scope: !23, file: !1, line: 49, type: !26)
!69 = !DILocation(line: 50, column: 65, scope: !23)
!70 = !DILocation(line: 50, column: 16, scope: !23)
!71 = !DILocalVariable(name: "r_ps", scope: !23, file: !1, line: 50, type: !26)
!72 = !DILocation(line: 53, column: 22, scope: !23)
!73 = !DILocation(line: 53, column: 27, scope: !23)
!74 = !DILocation(line: 53, column: 15, scope: !23)
!75 = !DILocation(line: 53, column: 3, scope: !23)
!76 = !DILocation(line: 54, column: 3, scope: !23)
!77 = distinct !DISubprogram(name: "predicate_tinc_oob_read", scope: !10, file: !10, line: 41, type: !78, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!26, !80, !93}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tinc_module", file: !10, line: 37, size: 128, elements: !82)
!82 = !{!83}
!83 = !DIDerivedType(tag: DW_TAG_member, name: "packet", scope: !81, file: !10, line: 38, baseType: !84, size: 128)
!84 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tinc_packet", file: !10, line: 27, size: 128, elements: !85)
!85 = !{!86, !90, !92}
!86 = !DIDerivedType(tag: DW_TAG_member, name: "payload", scope: !84, file: !10, line: 28, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !89)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int8_t", file: !10, line: 23, baseType: !29)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "payload_packet_len", scope: !84, file: !10, line: 29, baseType: !91, size: 16, offset: 64)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int16_t", file: !10, line: 24, baseType: !49)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "tcp_non_null", scope: !84, file: !10, line: 30, baseType: !26, size: 32, offset: 96)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tinc_flow", file: !10, line: 33, size: 8, elements: !95)
!95 = !{!96}
!96 = !DIDerivedType(tag: DW_TAG_member, name: "tinc_state", scope: !94, file: !10, line: 34, baseType: !89, size: 8)
!97 = !DILocalVariable(name: "ndpi_struct", arg: 1, scope: !77, file: !10, line: 41, type: !80)
!98 = !DILocation(line: 0, scope: !77)
!99 = !DILocalVariable(name: "flow", arg: 2, scope: !77, file: !10, line: 42, type: !93)
!100 = !DILocalVariable(name: "packet_payload", scope: !77, file: !10, line: 44, type: !87)
!101 = !DILocalVariable(name: "payload_len", scope: !77, file: !10, line: 45, type: !102)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int32_t", file: !10, line: 25, baseType: !103)
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !30, line: 26, baseType: !104)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !32, line: 42, baseType: !105)
!105 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!106 = !DILocation(line: 48, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !77, file: !10, line: 48, column: 7)
!108 = !DILocation(line: 48, column: 7, scope: !77)
!109 = !DILocation(line: 51, column: 24, scope: !110)
!110 = distinct !DILexicalBlock(scope: !77, file: !10, line: 51, column: 7)
!111 = !DILocation(line: 51, column: 29, scope: !110)
!112 = !DILocation(line: 51, column: 49, scope: !110)
!113 = !DILocation(line: 51, column: 7, scope: !77)
!114 = !DILocation(line: 54, column: 19, scope: !115)
!115 = distinct !DILexicalBlock(scope: !77, file: !10, line: 54, column: 7)
!116 = !DILocation(line: 54, column: 7, scope: !77)
!117 = !DILocation(line: 55, column: 7, scope: !118)
!118 = distinct !DILexicalBlock(scope: !77, file: !10, line: 55, column: 7)
!119 = !DILocation(line: 55, column: 25, scope: !118)
!120 = !DILocation(line: 55, column: 7, scope: !77)
!121 = !DILocation(line: 56, column: 7, scope: !122)
!122 = distinct !DILexicalBlock(scope: !77, file: !10, line: 56, column: 7)
!123 = !DILocation(line: 56, column: 25, scope: !122)
!124 = !DILocation(line: 56, column: 7, scope: !77)
!125 = !DILocation(line: 57, column: 7, scope: !126)
!126 = distinct !DILexicalBlock(scope: !77, file: !10, line: 57, column: 7)
!127 = !DILocation(line: 57, column: 25, scope: !126)
!128 = !DILocation(line: 57, column: 7, scope: !77)
!129 = !DILocalVariable(name: "numbers_left", scope: !77, file: !10, line: 60, type: !89)
!130 = !DILocalVariable(name: "i", scope: !77, file: !10, line: 59, type: !91)
!131 = !DILocation(line: 66, column: 13, scope: !132)
!132 = distinct !DILexicalBlock(scope: !133, file: !10, line: 66, column: 11)
!133 = distinct !DILexicalBlock(scope: !134, file: !10, line: 64, column: 15)
!134 = distinct !DILexicalBlock(scope: !77, file: !10, line: 62, column: 24)
!135 = !DILocation(line: 66, column: 38, scope: !132)
!136 = !DILocation(line: 67, column: 8, scope: !133)
!137 = !DILocation(line: 65, column: 13, scope: !138)
!138 = distinct !DILexicalBlock(scope: !133, file: !10, line: 65, column: 11)
!139 = !DILocation(line: 65, column: 11, scope: !133)
!140 = distinct !{!140, !141, !142}
!141 = !DILocation(line: 64, column: 5, scope: !134)
!142 = !DILocation(line: 68, column: 5, scope: !134)
!143 = !DILocation(line: 70, column: 11, scope: !144)
!144 = distinct !DILexicalBlock(scope: !134, file: !10, line: 70, column: 9)
!145 = !DILocation(line: 70, column: 9, scope: !134)
!146 = !DILocation(line: 71, column: 25, scope: !147)
!147 = distinct !DILexicalBlock(scope: !134, file: !10, line: 71, column: 9)
!148 = !DILocation(line: 71, column: 29, scope: !147)
!149 = !DILocation(line: 71, column: 9, scope: !134)
!150 = !DILocation(line: 87, column: 3, scope: !77)
!151 = !DILocation(line: 93, column: 11, scope: !152)
!152 = distinct !DILexicalBlock(scope: !153, file: !10, line: 93, column: 9)
!153 = distinct !DILexicalBlock(scope: !77, file: !10, line: 89, column: 68)
!154 = !DILocation(line: 88, column: 12, scope: !77)
!155 = !DILocation(line: 88, column: 37, scope: !77)
!156 = !DILocation(line: 90, column: 6, scope: !153)
!157 = !DILocation(line: 93, column: 9, scope: !153)
!158 = distinct !{!158, !150, !159, !160}
!159 = !DILocation(line: 94, column: 3, scope: !77)
!160 = !{!"llvm.loop.mustprogress"}
!161 = !DILocation(line: 97, column: 1, scope: !77)
!162 = !DILocation(line: 84, column: 9, scope: !163)
!163 = distinct !DILexicalBlock(scope: !77, file: !10, line: 84, column: 7)
!164 = !DILocation(line: 84, column: 7, scope: !77)
!165 = distinct !DISubprogram(name: "predicate_printable_string_oob_read", scope: !12, file: !12, line: 20, type: !166, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !11, retainedNodes: !2)
!166 = !DISubroutineType(types: !167)
!167 = !{!26, !168, !4, !4}
!168 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!169 = !DILocalVariable(name: "str", arg: 1, scope: !165, file: !12, line: 20, type: !168)
!170 = !DILocation(line: 0, scope: !165)
!171 = !DILocalVariable(name: "len", arg: 2, scope: !165, file: !12, line: 20, type: !4)
!172 = !DILocalVariable(name: "buf_size", arg: 3, scope: !165, file: !12, line: 21, type: !4)
!173 = !DILocation(line: 23, column: 11, scope: !174)
!174 = distinct !DILexicalBlock(scope: !165, file: !12, line: 23, column: 7)
!175 = !DILocation(line: 23, column: 7, scope: !165)
!176 = !DILocation(line: 33, column: 1, scope: !165)
!177 = distinct !DISubprogram(name: "memset", scope: !178, file: !178, line: 12, type: !179, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !2)
!178 = !DIFile(filename: "runtime/Freestanding/memset.c", directory: "/home/wcontrerasmartinez/klee")
!179 = !DISubroutineType(types: !180)
!180 = !{!14, !14, !26, !4}
!181 = !DILocalVariable(name: "dst", arg: 1, scope: !177, file: !178, line: 12, type: !14)
!182 = !DILocation(line: 0, scope: !177)
!183 = !DILocalVariable(name: "s", arg: 2, scope: !177, file: !178, line: 12, type: !26)
!184 = !DILocalVariable(name: "count", arg: 3, scope: !177, file: !178, line: 12, type: !4)
!185 = !DILocalVariable(name: "a", scope: !177, file: !178, line: 13, type: !7)
!186 = !DILocation(line: 14, column: 18, scope: !177)
!187 = !DILocation(line: 14, column: 3, scope: !177)
!188 = !DILocation(line: 14, column: 15, scope: !177)
!189 = !DILocation(line: 15, column: 7, scope: !177)
!190 = !DILocation(line: 15, column: 10, scope: !177)
!191 = distinct !{!191, !187, !192, !160}
!192 = !DILocation(line: 15, column: 12, scope: !177)
!193 = !DILocation(line: 16, column: 3, scope: !177)
