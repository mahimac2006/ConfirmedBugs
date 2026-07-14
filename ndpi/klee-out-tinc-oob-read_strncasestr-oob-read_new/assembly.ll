; ModuleID = 'linked_tinc-oob-read_strncasestr-oob-read_new.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tinc_module = type { %struct.tinc_packet }
%struct.tinc_packet = type { i8*, i16, i32 }
%struct.tinc_flow = type { i8 }

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"needle\00", align 1
@.str.2 = private unnamed_addr constant [55 x i8] c"0 && \22REACHED_BOTH_tinc-oob-read_strncasestr-oob-read\22\00", align 1
@.str.3 = private unnamed_addr constant [50 x i8] c"driver_tinc-oob-read_strncasestr-oob-read_final.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [15 x i8] c"int main(void)\00", align 1

; Function Attrs: nofree noinline norecurse nosync nounwind readonly uwtable
define internal fastcc i32 @predicate_tinc_oob_read(i8* nocapture readonly %.0.0.0.val, i16 %.0.0.1.val, i32 %.0.0.2.val, i8 %.0.0.val) unnamed_addr #0 !dbg !21 {
  call void @llvm.dbg.value(metadata %struct.tinc_module* undef, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.value(metadata %struct.tinc_flow* undef, metadata !52, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.value(metadata i8* %.0.0.0.val, metadata !53, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.value(metadata i16 %.0.0.1.val, metadata !54, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !51
  %.not = icmp eq i32 %.0.0.2.val, 0, !dbg !59
  %1 = icmp eq i16 %.0.0.1.val, 0
  %or.cond = select i1 %.not, i1 true, i1 %1, !dbg !61
  br i1 %or.cond, label %.critedge, label %2, !dbg !61

2:                                                ; preds = %0
  %.not5 = icmp eq i8 %.0.0.val, 2, !dbg !62
  br i1 %.not5, label %5, label %3, !dbg !64

3:                                                ; preds = %2
  %.not14 = icmp ne i8 %.0.0.val, 3, !dbg !65
  %4 = icmp ult i16 %.0.0.1.val, 12
  %or.cond15 = select i1 %.not14, i1 true, i1 %4, !dbg !66
  br i1 %or.cond15, label %.critedge, label %6, !dbg !66

5:                                                ; preds = %2
  %.old = icmp ult i16 %.0.0.1.val, 12, !dbg !67
  br i1 %.old, label %.critedge, label %6, !dbg !69

6:                                                ; preds = %3, %5
  %7 = load i8, i8* %.0.0.0.val, align 1, !dbg !70
  %.not6 = icmp eq i8 %7, 49, !dbg !72
  br i1 %.not6, label %8, label %.critedge, !dbg !73

8:                                                ; preds = %6
  %9 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 1, !dbg !74
  %10 = load i8, i8* %9, align 1, !dbg !74
  %.not7 = icmp eq i8 %10, 32, !dbg !76
  br i1 %.not7, label %11, label %.critedge, !dbg !77

11:                                               ; preds = %8
  %12 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 2, !dbg !78
  %13 = load i8, i8* %12, align 1, !dbg !78
  %14 = icmp ne i8 %13, 32, !dbg !80
  %.not1226 = icmp ugt i16 %.0.0.1.val, 3
  %or.cond49 = select i1 %14, i1 %.not1226, i1 false, !dbg !81
  call void @llvm.dbg.value(metadata i8 4, metadata !82, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.value(metadata i16 3, metadata !83, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.value(metadata i8 4, metadata !82, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.value(metadata i16 3, metadata !83, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.value(metadata i16 3, metadata !83, metadata !DIExpression()), !dbg !51
  br i1 %or.cond49, label %.lr.ph, label %.critedge, !dbg !81

.lr.ph:                                           ; preds = %11, %19
  %.127 = phi i16 [ %20, %19 ], [ 3, %11 ]
  call void @llvm.dbg.value(metadata i16 %.127, metadata !83, metadata !DIExpression()), !dbg !51
  %15 = zext i16 %.127 to i64, !dbg !84
  %16 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 %15, !dbg !84
  %17 = load i8, i8* %16, align 1, !dbg !84
  %.off = add i8 %17, -48, !dbg !88
  %18 = icmp ult i8 %.off, 10, !dbg !88
  br i1 %18, label %19, label %21, !dbg !88

19:                                               ; preds = %.lr.ph
  %20 = add nuw i16 %.127, 1, !dbg !89
  call void @llvm.dbg.value(metadata i16 %20, metadata !83, metadata !DIExpression()), !dbg !51
  %exitcond31.not = icmp eq i16 %20, %.0.0.1.val, !dbg !90
  br i1 %exitcond31.not, label %.critedge, label %.lr.ph, !dbg !92, !llvm.loop !93

21:                                               ; preds = %.lr.ph
  %.not13 = icmp ult i16 %.127, %.0.0.1.val, !dbg !96
  br i1 %.not13, label %22, label %.critedge, !dbg !98

22:                                               ; preds = %21
  %23 = add i16 %.127, 1, !dbg !99
  call void @llvm.dbg.value(metadata i16 %23, metadata !83, metadata !DIExpression()), !dbg !51
  %24 = icmp eq i8 %17, 32, !dbg !101
  call void @llvm.dbg.value(metadata i8 3, metadata !82, metadata !DIExpression()), !dbg !51
  %.not1226.1 = icmp ult i16 %23, %.0.0.1.val
  %or.cond50 = select i1 %24, i1 %.not1226.1, i1 false, !dbg !102
  call void @llvm.dbg.value(metadata i8 3, metadata !82, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.value(metadata i16 %23, metadata !83, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.value(metadata i8 3, metadata !82, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.value(metadata i16 %23, metadata !83, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.value(metadata i16 %23, metadata !83, metadata !DIExpression()), !dbg !51
  br i1 %or.cond50, label %.lr.ph.1, label %.critedge, !dbg !102

.preheader:                                       ; preds = %.thread
  %25 = zext i16 %57 to i64, !dbg !103
  %wide.trip.count = zext i16 %.0.0.1.val to i64, !dbg !104
  br label %26, !dbg !103

26:                                               ; preds = %.preheader, %.critedge1
  %indvars.iv = phi i64 [ %25, %.preheader ], [ %indvars.iv.next, %.critedge1 ], !dbg !51
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !83, metadata !DIExpression()), !dbg !51
  %27 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 %indvars.iv, !dbg !107
  %28 = load i8, i8* %27, align 1, !dbg !107
  %.off64 = add i8 %28, -48, !dbg !108
  %29 = icmp ult i8 %.off64, 10, !dbg !108
  %.off65 = add i8 %28, -65
  %30 = icmp ult i8 %.off65, 26
  %or.cond17 = or i1 %29, %30, !dbg !108
  br i1 %or.cond17, label %.critedge1, label %.critedge, !dbg !108

.critedge1:                                       ; preds = %26
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !109
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !83, metadata !DIExpression()), !dbg !51
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count, !dbg !104
  br i1 %exitcond.not, label %.critedge, label %26, !dbg !110, !llvm.loop !111

.critedge:                                        ; preds = %26, %19, %39, %49, %59, %.critedge1, %22, %21, %35, %36, %45, %46, %55, %56, %.thread, %11, %8, %6, %5, %3, %0
  %.0 = phi i32 [ 0, %0 ], [ 0, %3 ], [ 0, %5 ], [ 0, %6 ], [ 0, %8 ], [ 0, %11 ], [ 1, %.thread ], [ 0, %56 ], [ 0, %55 ], [ 0, %46 ], [ 0, %45 ], [ 0, %36 ], [ 0, %35 ], [ 0, %21 ], [ 0, %22 ], [ 1, %.critedge1 ], [ 0, %59 ], [ 0, %49 ], [ 0, %39 ], [ 0, %19 ], [ 0, %26 ], !dbg !51
  ret i32 %.0, !dbg !114

.lr.ph.1:                                         ; preds = %22, %39
  %.127.1 = phi i16 [ %40, %39 ], [ %23, %22 ]
  call void @llvm.dbg.value(metadata i16 %.127.1, metadata !83, metadata !DIExpression()), !dbg !51
  %31 = zext i16 %.127.1 to i64, !dbg !84
  %32 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 %31, !dbg !84
  %33 = load i8, i8* %32, align 1, !dbg !84
  %.off61 = add i8 %33, -48, !dbg !88
  %34 = icmp ult i8 %.off61, 10, !dbg !88
  br i1 %34, label %39, label %35, !dbg !88

35:                                               ; preds = %.lr.ph.1
  %.not13.1 = icmp ult i16 %.127.1, %.0.0.1.val, !dbg !96
  br i1 %.not13.1, label %36, label %.critedge, !dbg !98

36:                                               ; preds = %35
  %37 = add i16 %.127.1, 1, !dbg !99
  call void @llvm.dbg.value(metadata i16 %37, metadata !83, metadata !DIExpression()), !dbg !51
  %38 = icmp eq i8 %33, 32, !dbg !101
  call void @llvm.dbg.value(metadata i8 2, metadata !82, metadata !DIExpression()), !dbg !51
  %.not1226.2 = icmp ult i16 %37, %.0.0.1.val
  %or.cond43 = select i1 %38, i1 %.not1226.2, i1 false, !dbg !102
  br i1 %or.cond43, label %.lr.ph.2, label %.critedge, !dbg !102

39:                                               ; preds = %.lr.ph.1
  %40 = add nuw i16 %.127.1, 1, !dbg !89
  call void @llvm.dbg.value(metadata i16 %40, metadata !83, metadata !DIExpression()), !dbg !51
  %exitcond31.1.not = icmp eq i16 %40, %.0.0.1.val, !dbg !90
  br i1 %exitcond31.1.not, label %.critedge, label %.lr.ph.1, !dbg !92, !llvm.loop !93

.lr.ph.2:                                         ; preds = %36, %49
  %.127.2 = phi i16 [ %50, %49 ], [ %37, %36 ]
  call void @llvm.dbg.value(metadata i16 %.127.2, metadata !83, metadata !DIExpression()), !dbg !51
  %41 = zext i16 %.127.2 to i64, !dbg !84
  %42 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 %41, !dbg !84
  %43 = load i8, i8* %42, align 1, !dbg !84
  %.off62 = add i8 %43, -48, !dbg !88
  %44 = icmp ult i8 %.off62, 10, !dbg !88
  br i1 %44, label %49, label %45, !dbg !88

45:                                               ; preds = %.lr.ph.2
  %.not13.2 = icmp ult i16 %.127.2, %.0.0.1.val, !dbg !96
  br i1 %.not13.2, label %46, label %.critedge, !dbg !98

46:                                               ; preds = %45
  %47 = add i16 %.127.2, 1, !dbg !99
  call void @llvm.dbg.value(metadata i16 %47, metadata !83, metadata !DIExpression()), !dbg !51
  %48 = icmp eq i8 %43, 32, !dbg !101
  call void @llvm.dbg.value(metadata i8 1, metadata !82, metadata !DIExpression()), !dbg !51
  %.not1226.3 = icmp ult i16 %47, %.0.0.1.val
  %or.cond46 = select i1 %48, i1 %.not1226.3, i1 false, !dbg !102
  br i1 %or.cond46, label %.lr.ph.3, label %.critedge, !dbg !102

49:                                               ; preds = %.lr.ph.2
  %50 = add nuw i16 %.127.2, 1, !dbg !89
  call void @llvm.dbg.value(metadata i16 %50, metadata !83, metadata !DIExpression()), !dbg !51
  %exitcond31.2.not = icmp eq i16 %50, %.0.0.1.val, !dbg !90
  br i1 %exitcond31.2.not, label %.critedge, label %.lr.ph.2, !dbg !92, !llvm.loop !93

.lr.ph.3:                                         ; preds = %46, %59
  %.127.3 = phi i16 [ %60, %59 ], [ %47, %46 ]
  call void @llvm.dbg.value(metadata i16 %.127.3, metadata !83, metadata !DIExpression()), !dbg !51
  %51 = zext i16 %.127.3 to i64, !dbg !84
  %52 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 %51, !dbg !84
  %53 = load i8, i8* %52, align 1, !dbg !84
  %.off63 = add i8 %53, -48, !dbg !88
  %54 = icmp ult i8 %.off63, 10, !dbg !88
  br i1 %54, label %59, label %55, !dbg !88

55:                                               ; preds = %.lr.ph.3
  %.not13.3 = icmp ult i16 %.127.3, %.0.0.1.val, !dbg !96
  br i1 %.not13.3, label %56, label %.critedge, !dbg !98

56:                                               ; preds = %55
  %57 = add i16 %.127.3, 1, !dbg !99
  call void @llvm.dbg.value(metadata i16 %57, metadata !83, metadata !DIExpression()), !dbg !51
  %58 = icmp eq i8 %53, 32, !dbg !101
  call void @llvm.dbg.value(metadata i8 0, metadata !82, metadata !DIExpression()), !dbg !51
  br i1 %58, label %.thread, label %.critedge, !dbg !102

.thread:                                          ; preds = %56
  call void @llvm.dbg.value(metadata i8 0, metadata !82, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.value(metadata i16 %57, metadata !83, metadata !DIExpression()), !dbg !51
  %.not10 = icmp ult i16 %57, %.0.0.1.val, !dbg !115
  br i1 %.not10, label %.preheader, label %.critedge, !dbg !117

59:                                               ; preds = %.lr.ph.3
  %60 = add nuw i16 %.127.3, 1, !dbg !89
  call void @llvm.dbg.value(metadata i16 %60, metadata !83, metadata !DIExpression()), !dbg !51
  %exitcond31.3.not = icmp eq i16 %60, %.0.0.1.val, !dbg !90
  br i1 %exitcond31.3.not, label %.critedge, label %.lr.ph.3, !dbg !92, !llvm.loop !93
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: mustprogress nofree noinline nounwind readonly uwtable willreturn
define internal fastcc i32 @predicate_strncasestr_oob_read(i8* readonly %0, i8* readonly %1) unnamed_addr #2 !dbg !118 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.value(metadata i8* %1, metadata !126, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.value(metadata i64 12, metadata !127, metadata !DIExpression()), !dbg !125
  %3 = icmp eq i8* %0, null, !dbg !128
  %4 = icmp eq i8* %1, null
  %or.cond = select i1 %3, i1 true, i1 %4, !dbg !130
  br i1 %or.cond, label %11, label %5, !dbg !130

5:                                                ; preds = %2
  call void @llvm.dbg.value(metadata i64 undef, metadata !131, metadata !DIExpression()), !dbg !125
  %6 = tail call i64 @strlen(i8* noundef nonnull dereferenceable(1) %1) #8, !dbg !132
  call void @llvm.dbg.value(metadata i64 %6, metadata !133, metadata !DIExpression()), !dbg !125
  %7 = icmp eq i64 %6, 0, !dbg !134
  br i1 %7, label %11, label %8, !dbg !136

8:                                                ; preds = %5
  %9 = tail call i64 @strnlen(i8* %0, i64 12) #8, !dbg !137
  call void @llvm.dbg.value(metadata i64 %9, metadata !131, metadata !DIExpression()), !dbg !125
  %10 = icmp ult i64 %9, %6, !dbg !138
  %. = zext i1 %10 to i32, !dbg !125
  br label %11, !dbg !125

11:                                               ; preds = %8, %5, %2
  %.0 = phi i32 [ 0, %2 ], [ 0, %5 ], [ %., %8 ], !dbg !125
  ret i32 %.0, !dbg !140
}

; Function Attrs: mustprogress nofree nounwind readonly willreturn
declare dso_local i64 @strnlen(i8*, i64) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) local_unnamed_addr #3

; Function Attrs: noinline noreturn nounwind optnone uwtable
define dso_local i32 @main() local_unnamed_addr #4 !dbg !141 {
  %1 = alloca i32, align 4
  %2 = alloca [12 x i8], align 1
  %3 = alloca [14 x i8], align 1
  %4 = alloca i32, align 4
  %5 = alloca %struct.tinc_module, align 8
  %6 = alloca %struct.tinc_flow, align 1
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [12 x i8]* %2, metadata !144, metadata !DIExpression()), !dbg !148
  %9 = getelementptr inbounds [12 x i8], [12 x i8]* %2, i64 0, i64 0, !dbg !149
  call void @klee_make_symbolic(i8* %9, i64 12, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !150
  %10 = getelementptr inbounds [12 x i8], [12 x i8]* %2, i64 0, i64 0, !dbg !151
  %11 = load i8, i8* %10, align 1, !dbg !151
  %12 = zext i8 %11 to i32, !dbg !151
  %13 = icmp eq i32 %12, 49, !dbg !152
  %14 = zext i1 %13 to i32, !dbg !152
  %15 = sext i32 %14 to i64, !dbg !151
  call void @klee_assume(i64 %15), !dbg !153
  %16 = getelementptr inbounds [12 x i8], [12 x i8]* %2, i64 0, i64 1, !dbg !154
  %17 = load i8, i8* %16, align 1, !dbg !154
  %18 = zext i8 %17 to i32, !dbg !154
  %19 = icmp eq i32 %18, 32, !dbg !155
  %20 = zext i1 %19 to i32, !dbg !155
  %21 = sext i32 %20 to i64, !dbg !154
  call void @klee_assume(i64 %21), !dbg !156
  %22 = getelementptr inbounds [12 x i8], [12 x i8]* %2, i64 0, i64 2, !dbg !157
  %23 = load i8, i8* %22, align 1, !dbg !157
  %24 = zext i8 %23 to i32, !dbg !157
  %25 = icmp ne i32 %24, 32, !dbg !158
  %26 = zext i1 %25 to i32, !dbg !158
  %27 = sext i32 %26 to i64, !dbg !157
  call void @klee_assume(i64 %27), !dbg !159
  call void @llvm.dbg.declare(metadata [14 x i8]* %3, metadata !160, metadata !DIExpression()), !dbg !164
  %28 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 0, !dbg !165
  call void @klee_make_symbolic(i8* %28, i64 14, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)), !dbg !166
  %29 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 13, !dbg !167
  store i8 0, i8* %29, align 1, !dbg !168
  call void @llvm.dbg.declare(metadata i32* %4, metadata !169, metadata !DIExpression()), !dbg !171
  store i32 0, i32* %4, align 4, !dbg !171
  br label %30, !dbg !172

30:                                               ; preds = %42, %0
  %31 = load i32, i32* %4, align 4, !dbg !173
  %32 = icmp sle i32 %31, 12, !dbg !175
  br i1 %32, label %33, label %45, !dbg !176

33:                                               ; preds = %30
  %34 = load i32, i32* %4, align 4, !dbg !177
  %35 = sext i32 %34 to i64, !dbg !178
  %36 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 %35, !dbg !178
  %37 = load i8, i8* %36, align 1, !dbg !178
  %38 = sext i8 %37 to i32, !dbg !178
  %39 = icmp ne i32 %38, 0, !dbg !179
  %40 = zext i1 %39 to i32, !dbg !179
  %41 = sext i32 %40 to i64, !dbg !178
  call void @klee_assume(i64 %41), !dbg !180
  br label %42, !dbg !180

42:                                               ; preds = %33
  %43 = load i32, i32* %4, align 4, !dbg !181
  %44 = add nsw i32 %43, 1, !dbg !181
  store i32 %44, i32* %4, align 4, !dbg !181
  br label %30, !dbg !182, !llvm.loop !183

45:                                               ; preds = %30
  call void @llvm.dbg.declare(metadata %struct.tinc_module* %5, metadata !185, metadata !DIExpression()), !dbg !196
  call void @llvm.dbg.declare(metadata %struct.tinc_flow* %6, metadata !197, metadata !DIExpression()), !dbg !201
  %46 = bitcast %struct.tinc_module* %5 to i8*, !dbg !202
  %47 = call i8* @memset(i8* %46, i32 0, i64 16), !dbg !202
  %48 = bitcast %struct.tinc_flow* %6 to i8*, !dbg !203
  %49 = call i8* @memset(i8* %48, i32 0, i64 1), !dbg !203
  %50 = getelementptr inbounds [12 x i8], [12 x i8]* %2, i64 0, i64 0, !dbg !204
  %51 = getelementptr inbounds %struct.tinc_module, %struct.tinc_module* %5, i32 0, i32 0, !dbg !205
  %52 = getelementptr inbounds %struct.tinc_packet, %struct.tinc_packet* %51, i32 0, i32 0, !dbg !206
  store i8* %50, i8** %52, align 8, !dbg !207
  %53 = getelementptr inbounds %struct.tinc_module, %struct.tinc_module* %5, i32 0, i32 0, !dbg !208
  %54 = getelementptr inbounds %struct.tinc_packet, %struct.tinc_packet* %53, i32 0, i32 1, !dbg !209
  store i16 12, i16* %54, align 8, !dbg !210
  %55 = getelementptr inbounds %struct.tinc_module, %struct.tinc_module* %5, i32 0, i32 0, !dbg !211
  %56 = getelementptr inbounds %struct.tinc_packet, %struct.tinc_packet* %55, i32 0, i32 2, !dbg !212
  store i32 1, i32* %56, align 4, !dbg !213
  %57 = getelementptr inbounds %struct.tinc_flow, %struct.tinc_flow* %6, i32 0, i32 0, !dbg !214
  store i8 2, i8* %57, align 1, !dbg !215
  call void @llvm.dbg.declare(metadata i32* %7, metadata !216, metadata !DIExpression()), !dbg !217
  %.idx = getelementptr %struct.tinc_module, %struct.tinc_module* %5, i64 0, i32 0, i32 0, !dbg !218
  %.idx.val = load i8*, i8** %.idx, align 8, !dbg !218
  %.idx1 = getelementptr %struct.tinc_module, %struct.tinc_module* %5, i64 0, i32 0, i32 1, !dbg !218
  %.idx1.val = load i16, i16* %.idx1, align 8, !dbg !218
  %.idx2 = getelementptr %struct.tinc_module, %struct.tinc_module* %5, i64 0, i32 0, i32 2, !dbg !218
  %.idx2.val = load i32, i32* %.idx2, align 4, !dbg !218
  %.idx3 = getelementptr %struct.tinc_flow, %struct.tinc_flow* %6, i64 0, i32 0, !dbg !218
  %.idx3.val = load i8, i8* %.idx3, align 1, !dbg !218
  %58 = call fastcc i32 @predicate_tinc_oob_read(i8* %.idx.val, i16 %.idx1.val, i32 %.idx2.val, i8 %.idx3.val), !dbg !218
  store i32 %58, i32* %7, align 4, !dbg !217
  call void @llvm.dbg.declare(metadata i32* %8, metadata !219, metadata !DIExpression()), !dbg !220
  %59 = getelementptr inbounds [12 x i8], [12 x i8]* %2, i64 0, i64 0, !dbg !221
  %60 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 0, !dbg !222
  %61 = call fastcc i32 @predicate_strncasestr_oob_read(i8* %59, i8* %60), !dbg !223
  store i32 %61, i32* %8, align 4, !dbg !220
  %62 = load i32, i32* %7, align 4, !dbg !224
  %63 = icmp eq i32 %62, 1, !dbg !225
  br i1 %63, label %64, label %67, !dbg !226

64:                                               ; preds = %45
  %65 = load i32, i32* %8, align 4, !dbg !227
  %66 = icmp eq i32 %65, 1, !dbg !228
  br label %67

67:                                               ; preds = %64, %45
  %68 = phi i1 [ false, %45 ], [ %66, %64 ], !dbg !229
  %69 = zext i1 %68 to i32, !dbg !226
  %70 = sext i32 %69 to i64, !dbg !224
  call void @klee_assume(i64 %70), !dbg !230
  call void @__assert_fail(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.3, i64 0, i64 0), i32 69, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #9, !dbg !231
  unreachable, !dbg !231
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) local_unnamed_addr #5

declare dso_local void @klee_assume(i64) local_unnamed_addr #5

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #6

; Function Attrs: nofree noinline norecurse nosync nounwind uwtable writeonly
define dso_local i8* @memset(i8* returned %0, i32 %1, i64 %2) local_unnamed_addr #7 !dbg !232 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !236, metadata !DIExpression()), !dbg !237
  call void @llvm.dbg.value(metadata i32 %1, metadata !238, metadata !DIExpression()), !dbg !237
  call void @llvm.dbg.value(metadata i64 %2, metadata !239, metadata !DIExpression()), !dbg !237
  call void @llvm.dbg.value(metadata i8* %0, metadata !240, metadata !DIExpression()), !dbg !237
  call void @llvm.dbg.value(metadata i64 %2, metadata !239, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !237
  %.not2 = icmp eq i64 %2, 0, !dbg !242
  br i1 %.not2, label %._crit_edge, label %.lr.ph, !dbg !243

.lr.ph:                                           ; preds = %3
  %4 = trunc i32 %1 to i8
  br label %5, !dbg !243

5:                                                ; preds = %.lr.ph, %5
  %.04 = phi i8* [ %0, %.lr.ph ], [ %7, %5 ]
  %.013 = phi i64 [ %2, %.lr.ph ], [ %6, %5 ]
  call void @llvm.dbg.value(metadata i8* %.04, metadata !240, metadata !DIExpression()), !dbg !237
  call void @llvm.dbg.value(metadata i64 %.013, metadata !239, metadata !DIExpression()), !dbg !237
  %6 = add i64 %.013, -1, !dbg !244
  call void @llvm.dbg.value(metadata i64 %6, metadata !239, metadata !DIExpression()), !dbg !237
  %7 = getelementptr inbounds i8, i8* %.04, i64 1, !dbg !245
  call void @llvm.dbg.value(metadata i8* %7, metadata !240, metadata !DIExpression()), !dbg !237
  store i8 %4, i8* %.04, align 1, !dbg !246
  call void @llvm.dbg.value(metadata i64 %6, metadata !239, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !237
  %.not = icmp eq i64 %6, 0, !dbg !242
  br i1 %.not, label %._crit_edge, label %5, !dbg !243, !llvm.loop !247

._crit_edge:                                      ; preds = %5, %3
  ret i8* %0, !dbg !249
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nofree noinline norecurse nosync nounwind readonly uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree noinline nounwind readonly uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noinline noreturn nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree noinline norecurse nosync nounwind uwtable writeonly "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind readonly willreturn }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!0, !3, !7, !13}
!llvm.ident = !{!15, !15, !15, !15}
!llvm.module.flags = !{!16, !17, !18, !19, !20}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "predicate_tinc-oob-read.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!2 = !{}
!3 = distinct !DICompileUnit(language: DW_LANG_C99, file: !4, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !5, splitDebugInlining: false, nameTableKind: None)
!4 = !DIFile(filename: "predicate_strncasestr-oob-read.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!5 = !{!6}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !9, splitDebugInlining: false, nameTableKind: None)
!8 = !DIFile(filename: "driver_tinc-oob-read_strncasestr-oob-read_final.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!9 = !{!10}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = distinct !DICompileUnit(language: DW_LANG_C99, file: !14, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!14 = !DIFile(filename: "/home/wcontrerasmartinez/klee/runtime/Freestanding/memset.c", directory: "/home/wcontrerasmartinez/klee/build/runtime/Freestanding")
!15 = !{!"Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8"}
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = distinct !DISubprogram(name: "predicate_tinc_oob_read", scope: !1, file: !1, line: 41, type: !22, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!22 = !DISubroutineType(types: !23)
!23 = !{!24, !25, !46}
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tinc_module", file: !1, line: 37, size: 128, elements: !27)
!27 = !{!28}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "packet", scope: !26, file: !1, line: 38, baseType: !29, size: 128)
!29 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tinc_packet", file: !1, line: 27, size: 128, elements: !30)
!30 = !{!31, !40, !45}
!31 = !DIDerivedType(tag: DW_TAG_member, name: "payload", scope: !29, file: !1, line: 28, baseType: !32, size: 64)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!33 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !34)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int8_t", file: !1, line: 23, baseType: !35)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !36, line: 24, baseType: !37)
!36 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !38, line: 38, baseType: !39)
!38 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!39 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "payload_packet_len", scope: !29, file: !1, line: 29, baseType: !41, size: 16, offset: 64)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int16_t", file: !1, line: 24, baseType: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !36, line: 25, baseType: !43)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !38, line: 40, baseType: !44)
!44 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "tcp_non_null", scope: !29, file: !1, line: 30, baseType: !24, size: 32, offset: 96)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tinc_flow", file: !1, line: 33, size: 8, elements: !48)
!48 = !{!49}
!49 = !DIDerivedType(tag: DW_TAG_member, name: "tinc_state", scope: !47, file: !1, line: 34, baseType: !34, size: 8)
!50 = !DILocalVariable(name: "ndpi_struct", arg: 1, scope: !21, file: !1, line: 41, type: !25)
!51 = !DILocation(line: 0, scope: !21)
!52 = !DILocalVariable(name: "flow", arg: 2, scope: !21, file: !1, line: 42, type: !46)
!53 = !DILocalVariable(name: "packet_payload", scope: !21, file: !1, line: 44, type: !32)
!54 = !DILocalVariable(name: "payload_len", scope: !21, file: !1, line: 45, type: !55)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int32_t", file: !1, line: 25, baseType: !56)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !36, line: 26, baseType: !57)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !38, line: 42, baseType: !58)
!58 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!59 = !DILocation(line: 48, column: 8, scope: !60)
!60 = distinct !DILexicalBlock(scope: !21, file: !1, line: 48, column: 7)
!61 = !DILocation(line: 48, column: 7, scope: !21)
!62 = !DILocation(line: 51, column: 24, scope: !63)
!63 = distinct !DILexicalBlock(scope: !21, file: !1, line: 51, column: 7)
!64 = !DILocation(line: 51, column: 29, scope: !63)
!65 = !DILocation(line: 51, column: 49, scope: !63)
!66 = !DILocation(line: 51, column: 7, scope: !21)
!67 = !DILocation(line: 54, column: 19, scope: !68)
!68 = distinct !DILexicalBlock(scope: !21, file: !1, line: 54, column: 7)
!69 = !DILocation(line: 54, column: 7, scope: !21)
!70 = !DILocation(line: 55, column: 7, scope: !71)
!71 = distinct !DILexicalBlock(scope: !21, file: !1, line: 55, column: 7)
!72 = !DILocation(line: 55, column: 25, scope: !71)
!73 = !DILocation(line: 55, column: 7, scope: !21)
!74 = !DILocation(line: 56, column: 7, scope: !75)
!75 = distinct !DILexicalBlock(scope: !21, file: !1, line: 56, column: 7)
!76 = !DILocation(line: 56, column: 25, scope: !75)
!77 = !DILocation(line: 56, column: 7, scope: !21)
!78 = !DILocation(line: 57, column: 7, scope: !79)
!79 = distinct !DILexicalBlock(scope: !21, file: !1, line: 57, column: 7)
!80 = !DILocation(line: 57, column: 25, scope: !79)
!81 = !DILocation(line: 57, column: 7, scope: !21)
!82 = !DILocalVariable(name: "numbers_left", scope: !21, file: !1, line: 60, type: !34)
!83 = !DILocalVariable(name: "i", scope: !21, file: !1, line: 59, type: !41)
!84 = !DILocation(line: 66, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !86, file: !1, line: 66, column: 11)
!86 = distinct !DILexicalBlock(scope: !87, file: !1, line: 64, column: 15)
!87 = distinct !DILexicalBlock(scope: !21, file: !1, line: 62, column: 24)
!88 = !DILocation(line: 66, column: 38, scope: !85)
!89 = !DILocation(line: 67, column: 8, scope: !86)
!90 = !DILocation(line: 65, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !86, file: !1, line: 65, column: 11)
!92 = !DILocation(line: 65, column: 11, scope: !86)
!93 = distinct !{!93, !94, !95}
!94 = !DILocation(line: 64, column: 5, scope: !87)
!95 = !DILocation(line: 68, column: 5, scope: !87)
!96 = !DILocation(line: 70, column: 11, scope: !97)
!97 = distinct !DILexicalBlock(scope: !87, file: !1, line: 70, column: 9)
!98 = !DILocation(line: 70, column: 9, scope: !87)
!99 = !DILocation(line: 71, column: 25, scope: !100)
!100 = distinct !DILexicalBlock(scope: !87, file: !1, line: 71, column: 9)
!101 = !DILocation(line: 71, column: 29, scope: !100)
!102 = !DILocation(line: 71, column: 9, scope: !87)
!103 = !DILocation(line: 87, column: 3, scope: !21)
!104 = !DILocation(line: 93, column: 11, scope: !105)
!105 = distinct !DILexicalBlock(scope: !106, file: !1, line: 93, column: 9)
!106 = distinct !DILexicalBlock(scope: !21, file: !1, line: 89, column: 68)
!107 = !DILocation(line: 88, column: 12, scope: !21)
!108 = !DILocation(line: 88, column: 37, scope: !21)
!109 = !DILocation(line: 90, column: 6, scope: !106)
!110 = !DILocation(line: 93, column: 9, scope: !106)
!111 = distinct !{!111, !103, !112, !113}
!112 = !DILocation(line: 94, column: 3, scope: !21)
!113 = !{!"llvm.loop.mustprogress"}
!114 = !DILocation(line: 97, column: 1, scope: !21)
!115 = !DILocation(line: 84, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !21, file: !1, line: 84, column: 7)
!117 = !DILocation(line: 84, column: 7, scope: !21)
!118 = distinct !DISubprogram(name: "predicate_strncasestr_oob_read", scope: !4, file: !4, line: 22, type: !119, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !3, retainedNodes: !2)
!119 = !DISubroutineType(types: !120)
!120 = !{!24, !10, !10, !121}
!121 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !122, line: 46, baseType: !123)
!122 = !DIFile(filename: "/usr/lib/llvm-13/lib/clang/13.0.1/include/stddef.h", directory: "")
!123 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!124 = !DILocalVariable(name: "str1", arg: 1, scope: !118, file: !4, line: 22, type: !10)
!125 = !DILocation(line: 0, scope: !118)
!126 = !DILocalVariable(name: "str2", arg: 2, scope: !118, file: !4, line: 22, type: !10)
!127 = !DILocalVariable(name: "len", arg: 3, scope: !118, file: !4, line: 23, type: !121)
!128 = !DILocation(line: 25, column: 12, scope: !129)
!129 = distinct !DILexicalBlock(scope: !118, file: !4, line: 25, column: 7)
!130 = !DILocation(line: 25, column: 20, scope: !129)
!131 = !DILocalVariable(name: "str1_len", scope: !118, file: !4, line: 28, type: !121)
!132 = !DILocation(line: 29, column: 21, scope: !118)
!133 = !DILocalVariable(name: "str2_len", scope: !118, file: !4, line: 29, type: !121)
!134 = !DILocation(line: 31, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !118, file: !4, line: 31, column: 7)
!136 = !DILocation(line: 31, column: 7, scope: !118)
!137 = !DILocation(line: 28, column: 21, scope: !118)
!138 = !DILocation(line: 38, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !118, file: !4, line: 38, column: 7)
!140 = !DILocation(line: 41, column: 1, scope: !118)
!141 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 30, type: !142, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !2)
!142 = !DISubroutineType(types: !143)
!143 = !{!24}
!144 = !DILocalVariable(name: "buf", scope: !141, file: !8, line: 31, type: !145)
!145 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 96, elements: !146)
!146 = !{!147}
!147 = !DISubrange(count: 12)
!148 = !DILocation(line: 31, column: 11, scope: !141)
!149 = !DILocation(line: 32, column: 22, scope: !141)
!150 = !DILocation(line: 32, column: 3, scope: !141)
!151 = !DILocation(line: 36, column: 15, scope: !141)
!152 = !DILocation(line: 36, column: 22, scope: !141)
!153 = !DILocation(line: 36, column: 3, scope: !141)
!154 = !DILocation(line: 37, column: 15, scope: !141)
!155 = !DILocation(line: 37, column: 22, scope: !141)
!156 = !DILocation(line: 37, column: 3, scope: !141)
!157 = !DILocation(line: 38, column: 15, scope: !141)
!158 = !DILocation(line: 38, column: 22, scope: !141)
!159 = !DILocation(line: 38, column: 3, scope: !141)
!160 = !DILocalVariable(name: "needle", scope: !141, file: !8, line: 42, type: !161)
!161 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 112, elements: !162)
!162 = !{!163}
!163 = !DISubrange(count: 14)
!164 = !DILocation(line: 42, column: 8, scope: !141)
!165 = !DILocation(line: 43, column: 22, scope: !141)
!166 = !DILocation(line: 43, column: 3, scope: !141)
!167 = !DILocation(line: 46, column: 3, scope: !141)
!168 = !DILocation(line: 46, column: 24, scope: !141)
!169 = !DILocalVariable(name: "k", scope: !170, file: !8, line: 49, type: !24)
!170 = distinct !DILexicalBlock(scope: !141, file: !8, line: 49, column: 3)
!171 = !DILocation(line: 49, column: 12, scope: !170)
!172 = !DILocation(line: 49, column: 8, scope: !170)
!173 = !DILocation(line: 49, column: 19, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !8, line: 49, column: 3)
!175 = !DILocation(line: 49, column: 21, scope: !174)
!176 = !DILocation(line: 49, column: 3, scope: !170)
!177 = !DILocation(line: 50, column: 24, scope: !174)
!178 = !DILocation(line: 50, column: 17, scope: !174)
!179 = !DILocation(line: 50, column: 27, scope: !174)
!180 = !DILocation(line: 50, column: 5, scope: !174)
!181 = !DILocation(line: 49, column: 35, scope: !174)
!182 = !DILocation(line: 49, column: 3, scope: !174)
!183 = distinct !{!183, !176, !184, !113}
!184 = !DILocation(line: 50, column: 34, scope: !170)
!185 = !DILocalVariable(name: "tinc_mod", scope: !141, file: !8, line: 53, type: !186)
!186 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tinc_module", file: !8, line: 25, size: 128, elements: !187)
!187 = !{!188}
!188 = !DIDerivedType(tag: DW_TAG_member, name: "packet", scope: !186, file: !8, line: 25, baseType: !189, size: 128)
!189 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tinc_packet", file: !8, line: 22, size: 128, elements: !190)
!190 = !{!191, !194, !195}
!191 = !DIDerivedType(tag: DW_TAG_member, name: "payload", scope: !189, file: !8, line: 22, baseType: !192, size: 64)
!192 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !193, size: 64)
!193 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !35)
!194 = !DIDerivedType(tag: DW_TAG_member, name: "payload_packet_len", scope: !189, file: !8, line: 22, baseType: !42, size: 16, offset: 64)
!195 = !DIDerivedType(tag: DW_TAG_member, name: "tcp_non_null", scope: !189, file: !8, line: 23, baseType: !24, size: 32, offset: 96)
!196 = !DILocation(line: 53, column: 22, scope: !141)
!197 = !DILocalVariable(name: "tinc_flow", scope: !141, file: !8, line: 54, type: !198)
!198 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tinc_flow", file: !8, line: 24, size: 8, elements: !199)
!199 = !{!200}
!200 = !DIDerivedType(tag: DW_TAG_member, name: "tinc_state", scope: !198, file: !8, line: 24, baseType: !35, size: 8)
!201 = !DILocation(line: 54, column: 22, scope: !141)
!202 = !DILocation(line: 55, column: 3, scope: !141)
!203 = !DILocation(line: 56, column: 3, scope: !141)
!204 = !DILocation(line: 58, column: 40, scope: !141)
!205 = !DILocation(line: 58, column: 12, scope: !141)
!206 = !DILocation(line: 58, column: 19, scope: !141)
!207 = !DILocation(line: 58, column: 38, scope: !141)
!208 = !DILocation(line: 59, column: 12, scope: !141)
!209 = !DILocation(line: 59, column: 19, scope: !141)
!210 = !DILocation(line: 59, column: 38, scope: !141)
!211 = !DILocation(line: 60, column: 12, scope: !141)
!212 = !DILocation(line: 60, column: 19, scope: !141)
!213 = !DILocation(line: 60, column: 38, scope: !141)
!214 = !DILocation(line: 61, column: 13, scope: !141)
!215 = !DILocation(line: 61, column: 38, scope: !141)
!216 = !DILocalVariable(name: "r_tinc", scope: !141, file: !8, line: 64, type: !24)
!217 = !DILocation(line: 64, column: 7, scope: !141)
!218 = !DILocation(line: 64, column: 16, scope: !141)
!219 = !DILocalVariable(name: "r_str", scope: !141, file: !8, line: 65, type: !24)
!220 = !DILocation(line: 65, column: 7, scope: !141)
!221 = !DILocation(line: 65, column: 61, scope: !141)
!222 = !DILocation(line: 65, column: 66, scope: !141)
!223 = !DILocation(line: 65, column: 16, scope: !141)
!224 = !DILocation(line: 68, column: 15, scope: !141)
!225 = !DILocation(line: 68, column: 22, scope: !141)
!226 = !DILocation(line: 68, column: 27, scope: !141)
!227 = !DILocation(line: 68, column: 30, scope: !141)
!228 = !DILocation(line: 68, column: 36, scope: !141)
!229 = !DILocation(line: 0, scope: !141)
!230 = !DILocation(line: 68, column: 3, scope: !141)
!231 = !DILocation(line: 69, column: 3, scope: !141)
!232 = distinct !DISubprogram(name: "memset", scope: !233, file: !233, line: 12, type: !234, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !13, retainedNodes: !2)
!233 = !DIFile(filename: "runtime/Freestanding/memset.c", directory: "/home/wcontrerasmartinez/klee")
!234 = !DISubroutineType(types: !235)
!235 = !{!6, !6, !24, !121}
!236 = !DILocalVariable(name: "dst", arg: 1, scope: !232, file: !233, line: 12, type: !6)
!237 = !DILocation(line: 0, scope: !232)
!238 = !DILocalVariable(name: "s", arg: 2, scope: !232, file: !233, line: 12, type: !24)
!239 = !DILocalVariable(name: "count", arg: 3, scope: !232, file: !233, line: 12, type: !121)
!240 = !DILocalVariable(name: "a", scope: !232, file: !233, line: 13, type: !241)
!241 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!242 = !DILocation(line: 14, column: 18, scope: !232)
!243 = !DILocation(line: 14, column: 3, scope: !232)
!244 = !DILocation(line: 14, column: 15, scope: !232)
!245 = !DILocation(line: 15, column: 7, scope: !232)
!246 = !DILocation(line: 15, column: 10, scope: !232)
!247 = distinct !{!247, !243, !248, !113}
!248 = !DILocation(line: 15, column: 12, scope: !232)
!249 = !DILocation(line: 16, column: 3, scope: !232)
