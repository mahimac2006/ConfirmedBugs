; ModuleID = 'linked_cert-elements-oob-write_strncasestr-oob-read_new.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ce_module = type { %struct.ce_packet }
%struct.ce_packet = type { i8*, i16 }
%struct.ce_flow = type { %struct.ce_module }

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"needle\00", align 1
@main.existing_names = internal global [1 x i8] zeroinitializer, align 1, !dbg !0
@.str.2 = private unnamed_addr constant [65 x i8] c"0 && \22REACHED_BOTH_cert-elements-oob-write_strncasestr-oob-read\22\00", align 1
@.str.3 = private unnamed_addr constant [60 x i8] c"driver_cert-elements-oob-write_strncasestr-oob-read_final.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [15 x i8] c"int main(void)\00", align 1

; Function Attrs: nofree noinline norecurse nosync nounwind uwtable
define internal fastcc i32 @predicate_cert_elements_oob_write(%struct.ce_module* nocapture readonly %0, %struct.ce_flow* nocapture %1, i16 zeroext %2, i16 zeroext %3) unnamed_addr #0 !dbg !46 {
  call void @llvm.dbg.value(metadata %struct.ce_module* %0, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.value(metadata %struct.ce_flow* %1, metadata !76, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.value(metadata i16 %2, metadata !77, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.value(metadata i16 %3, metadata !78, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.value(metadata %struct.ce_module* %0, metadata !79, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.value(metadata i16 %2, metadata !81, metadata !DIExpression()), !dbg !75
  %5 = icmp ult i16 %2, %3, !dbg !82
  br i1 %5, label %.lr.ph17, label %.loopexit10, !dbg !85

.lr.ph17:                                         ; preds = %4
  %6 = getelementptr inbounds %struct.ce_module, %struct.ce_module* %0, i64 0, i32 0, i32 1
  %7 = getelementptr inbounds %struct.ce_module, %struct.ce_module* %0, i64 0, i32 0, i32 0
  %8 = getelementptr inbounds %struct.ce_flow, %struct.ce_flow* %1, i64 0, i32 0, i32 0, i32 0
  %9 = getelementptr inbounds %struct.ce_flow, %struct.ce_flow* %1, i64 0, i32 0, i32 0, i32 1
  %.pre = load i16, i16* %6, align 8, !dbg !86
  br label %10, !dbg !85

10:                                               ; preds = %.lr.ph17, %.loopexit
  %11 = phi i16 [ %.pre, %.lr.ph17 ], [ %101, %.loopexit ]
  %12 = phi i16 [ %.pre, %.lr.ph17 ], [ %102, %.loopexit ], !dbg !86
  %.0116 = phi i16 [ %2, %.lr.ph17 ], [ %103, %.loopexit ]
  call void @llvm.dbg.value(metadata i16 %.0116, metadata !81, metadata !DIExpression()), !dbg !75
  %13 = zext i16 %.0116 to i32, !dbg !89
  %14 = add nuw nsw i32 %13, 2, !dbg !90
  %15 = zext i16 %12 to i32, !dbg !91
  %.not = icmp ult i32 %14, %15, !dbg !92
  br i1 %.not, label %16, label %.loopexit10, !dbg !93

16:                                               ; preds = %10
  %17 = load i8*, i8** %7, align 8, !dbg !94
  %18 = zext i16 %.0116 to i64, !dbg !96
  %19 = getelementptr inbounds i8, i8* %17, i64 %18, !dbg !96
  %20 = load i8, i8* %19, align 1, !dbg !96
  %21 = icmp eq i8 %20, 85, !dbg !97
  br i1 %21, label %22, label %.loopexit, !dbg !98

22:                                               ; preds = %16
  %23 = add nuw nsw i64 %18, 1, !dbg !99
  %24 = getelementptr inbounds i8, i8* %17, i64 %23, !dbg !100
  %25 = load i8, i8* %24, align 1, !dbg !100
  %26 = icmp eq i8 %25, 29, !dbg !101
  br i1 %26, label %27, label %.loopexit, !dbg !102

27:                                               ; preds = %22
  %28 = add nuw nsw i64 %18, 2, !dbg !103
  %29 = getelementptr inbounds i8, i8* %17, i64 %28, !dbg !104
  %30 = load i8, i8* %29, align 1, !dbg !104
  %31 = icmp eq i8 %30, 17, !dbg !105
  br i1 %31, label %32, label %.loopexit, !dbg !106

32:                                               ; preds = %27
  %33 = add i16 %.0116, 3, !dbg !107
  call void @llvm.dbg.value(metadata i16 %33, metadata !81, metadata !DIExpression()), !dbg !75
  %.not2 = icmp ult i16 %33, %12, !dbg !109
  br i1 %.not2, label %34, label %.loopexit10, !dbg !111

34:                                               ; preds = %32
  %35 = zext i16 %33 to i64, !dbg !112
  %36 = getelementptr inbounds i8, i8* %17, i64 %35, !dbg !112
  %37 = load i8, i8* %36, align 1, !dbg !112
  %38 = icmp eq i8 %37, 4, !dbg !114
  %.1.v = select i1 %38, i16 4, i16 7, !dbg !115
  %.1 = add i16 %.1.v, %.0116, !dbg !115
  call void @llvm.dbg.value(metadata i16 %.1, metadata !81, metadata !DIExpression()), !dbg !75
  %.not3 = icmp ult i16 %.1, %12, !dbg !116
  br i1 %.not3, label %39, label %.loopexit10, !dbg !118

39:                                               ; preds = %34
  %40 = zext i16 %.1 to i64, !dbg !119
  %41 = getelementptr inbounds i8, i8* %17, i64 %40, !dbg !119
  %42 = load i8, i8* %41, align 1, !dbg !119
  %43 = and i8 %42, 127, !dbg !120
  %.not4.inv = icmp slt i8 %42, 0, !dbg !120
  %narrow = select i1 %.not4.inv, i8 %43, i8 0, !dbg !120
  %44 = zext i8 %narrow to i16, !dbg !120
  %45 = add i16 %.1, %44, !dbg !121
  call void @llvm.dbg.value(metadata i16 %45, metadata !81, metadata !DIExpression()), !dbg !75
  %.not5 = icmp ult i16 %45, %12, !dbg !122
  br i1 %.not5, label %46, label %.loopexit10, !dbg !124

46:                                               ; preds = %39
  %47 = add i16 %45, 2, !dbg !125
  call void @llvm.dbg.value(metadata i16 %47, metadata !81, metadata !DIExpression()), !dbg !75
  %.not6 = icmp ult i16 %47, %12, !dbg !126
  br i1 %.not6, label %48, label %.loopexit10, !dbg !128

48:                                               ; preds = %46
  %49 = zext i16 %47 to i64, !dbg !129
  %50 = getelementptr inbounds i8, i8* %17, i64 %49, !dbg !129
  %51 = load i8, i8* %50, align 1, !dbg !129
  %52 = and i8 %51, 127, !dbg !130
  %.not7.inv = icmp slt i8 %51, 0, !dbg !130
  %narrow44 = select i1 %.not7.inv, i8 %52, i8 0, !dbg !130
  %53 = zext i8 %narrow44 to i16, !dbg !130
  call void @llvm.dbg.value(metadata i16 undef, metadata !81, metadata !DIExpression()), !dbg !75
  %54 = add i16 %45, 3, !dbg !131
  %55 = add i16 %54, %53, !dbg !132
  call void @llvm.dbg.value(metadata i16 %55, metadata !81, metadata !DIExpression()), !dbg !75
  %56 = icmp ult i16 %55, %11, !dbg !133
  br i1 %56, label %.lr.ph, label %.loopexit, !dbg !134

.lr.ph:                                           ; preds = %48, %._crit_edge
  %57 = phi i8* [ %.pre25, %._crit_edge ], [ %17, %48 ], !dbg !135
  %58 = phi i16 [ %99, %._crit_edge ], [ %11, %48 ]
  %.213 = phi i16 [ %98, %._crit_edge ], [ %55, %48 ]
  call void @llvm.dbg.value(metadata i16 %.213, metadata !81, metadata !DIExpression()), !dbg !75
  %59 = zext i16 %.213 to i64, !dbg !137
  %60 = getelementptr inbounds i8, i8* %57, i64 %59, !dbg !137
  %61 = load i8, i8* %60, align 1, !dbg !137
  call void @llvm.dbg.value(metadata i8 %61, metadata !138, metadata !DIExpression()), !dbg !139
  switch i8 %61, label %.loopexit [
    i8 -127, label %62
    i8 -126, label %62
    i8 -121, label %62
  ], !dbg !140

62:                                               ; preds = %.lr.ph, %.lr.ph, %.lr.ph
  %63 = zext i16 %.213 to i32, !dbg !142
  %64 = add nuw nsw i32 %63, 1, !dbg !145
  %65 = zext i16 %58 to i32, !dbg !146
  %.not8 = icmp ult i32 %64, %65, !dbg !147
  br i1 %.not8, label %66, label %.loopexit10, !dbg !148

66:                                               ; preds = %62
  %67 = add nuw nsw i64 %59, 1, !dbg !149
  %68 = getelementptr inbounds i8, i8* %57, i64 %67, !dbg !150
  %69 = load i8, i8* %68, align 1, !dbg !150
  call void @llvm.dbg.value(metadata i8 %69, metadata !151, metadata !DIExpression()), !dbg !152
  %70 = add nsw i32 %65, -1, !dbg !153
  %71 = icmp sgt i32 %70, %63, !dbg !155
  br i1 %71, label %72, label %.loopexit10, !dbg !156

72:                                               ; preds = %66
  %73 = zext i8 %69 to i32, !dbg !157
  %74 = add nuw nsw i32 %63, 2, !dbg !158
  %75 = add nuw nsw i32 %74, %73, !dbg !159
  %76 = icmp ult i32 %75, %65, !dbg !160
  br i1 %76, label %77, label %.loopexit10, !dbg !161

77:                                               ; preds = %72
  %78 = add i16 %.213, 2, !dbg !162
  call void @llvm.dbg.value(metadata i16 %78, metadata !81, metadata !DIExpression()), !dbg !75
  %79 = icmp eq i8 %69, 0, !dbg !163
  br i1 %79, label %.loopexit10, label %80, !dbg !165

80:                                               ; preds = %77
  %81 = zext i16 %78 to i32, !dbg !166
  %82 = add nuw nsw i32 %73, %81, !dbg !168
  %83 = icmp ugt i32 %82, %65, !dbg !169
  br i1 %83, label %.loopexit10, label %84, !dbg !170

84:                                               ; preds = %80
  call void @llvm.dbg.value(metadata i8 %69, metadata !171, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !152
  %85 = load i8*, i8** %8, align 8, !dbg !172
  %.not9 = icmp eq i8* %85, null, !dbg !174
  br i1 %.not9, label %95, label %86, !dbg !175

86:                                               ; preds = %84
  %87 = load i16, i16* %9, align 8, !dbg !176
  %88 = zext i16 %87 to i32, !dbg !179
  %89 = add nuw nsw i32 %88, %73, !dbg !180
  %90 = icmp ugt i32 %89, 65534, !dbg !181
  br i1 %90, label %.loopexit10, label %91, !dbg !182

91:                                               ; preds = %86
  %92 = zext i8 %69 to i16, !dbg !183
  %93 = add nuw nsw i16 %92, 1, !dbg !184
  %94 = add i16 %93, %87, !dbg !185
  br label %97, !dbg !186

95:                                               ; preds = %84
  %96 = zext i8 %69 to i16, !dbg !187
  call void @llvm.dbg.value(metadata i16 %96, metadata !171, metadata !DIExpression()), !dbg !152
  store i8* inttoptr (i64 1 to i8*), i8** %8, align 8, !dbg !188
  br label %97

97:                                               ; preds = %95, %91
  %storemerge = phi i16 [ %94, %91 ], [ %96, %95 ], !dbg !190
  %.pre-phi = phi i16 [ %92, %91 ], [ %96, %95 ], !dbg !191
  store i16 %storemerge, i16* %9, align 8, !dbg !190
  %98 = add i16 %78, %.pre-phi, !dbg !192
  call void @llvm.dbg.value(metadata i16 %98, metadata !81, metadata !DIExpression()), !dbg !75
  %99 = load i16, i16* %6, align 8, !dbg !193
  %100 = icmp ult i16 %98, %99, !dbg !133
  br i1 %100, label %._crit_edge, label %.loopexit, !dbg !134, !llvm.loop !194

._crit_edge:                                      ; preds = %97
  %.pre25 = load i8*, i8** %7, align 8, !dbg !135
  br label %.lr.ph, !dbg !134

.loopexit:                                        ; preds = %97, %.lr.ph, %48, %16, %22, %27
  %101 = phi i16 [ %11, %27 ], [ %11, %22 ], [ %11, %16 ], [ %11, %48 ], [ %58, %.lr.ph ], [ %99, %97 ]
  %102 = phi i16 [ %12, %27 ], [ %12, %22 ], [ %12, %16 ], [ %11, %48 ], [ %58, %.lr.ph ], [ %99, %97 ]
  %.3 = phi i16 [ %.0116, %27 ], [ %.0116, %22 ], [ %.0116, %16 ], [ %55, %48 ], [ %.213, %.lr.ph ], [ %98, %97 ], !dbg !197
  call void @llvm.dbg.value(metadata i16 %.3, metadata !81, metadata !DIExpression()), !dbg !75
  %103 = add i16 %.3, 1, !dbg !198
  call void @llvm.dbg.value(metadata i16 %103, metadata !81, metadata !DIExpression()), !dbg !75
  %104 = icmp ult i16 %103, %3, !dbg !82
  br i1 %104, label %10, label %.loopexit10, !dbg !85, !llvm.loop !199

.loopexit10:                                      ; preds = %10, %32, %34, %39, %46, %.loopexit, %86, %80, %77, %66, %72, %62, %4
  %.0 = phi i32 [ 0, %4 ], [ 0, %62 ], [ 0, %72 ], [ 0, %66 ], [ 0, %77 ], [ 0, %80 ], [ 1, %86 ], [ 0, %.loopexit ], [ 0, %46 ], [ 0, %39 ], [ 0, %34 ], [ 0, %32 ], [ 0, %10 ], !dbg !75
  ret i32 %.0, !dbg !201
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: mustprogress nofree noinline nounwind readonly uwtable willreturn
define internal fastcc i32 @predicate_strncasestr_oob_read(i8* readonly %0, i8* readonly %1) unnamed_addr #2 !dbg !202 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !207, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.value(metadata i8* %1, metadata !209, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.value(metadata i64 64, metadata !210, metadata !DIExpression()), !dbg !208
  %3 = icmp eq i8* %0, null, !dbg !211
  %4 = icmp eq i8* %1, null
  %or.cond = select i1 %3, i1 true, i1 %4, !dbg !213
  br i1 %or.cond, label %11, label %5, !dbg !213

5:                                                ; preds = %2
  call void @llvm.dbg.value(metadata i64 undef, metadata !214, metadata !DIExpression()), !dbg !208
  %6 = tail call i64 @strlen(i8* noundef nonnull dereferenceable(1) %1) #8, !dbg !215
  call void @llvm.dbg.value(metadata i64 %6, metadata !216, metadata !DIExpression()), !dbg !208
  %7 = icmp eq i64 %6, 0, !dbg !217
  br i1 %7, label %11, label %8, !dbg !219

8:                                                ; preds = %5
  %9 = tail call i64 @strnlen(i8* %0, i64 64) #8, !dbg !220
  call void @llvm.dbg.value(metadata i64 %9, metadata !214, metadata !DIExpression()), !dbg !208
  %10 = icmp ult i64 %9, %6, !dbg !221
  %. = zext i1 %10 to i32, !dbg !208
  br label %11, !dbg !208

11:                                               ; preds = %8, %5, %2
  %.0 = phi i32 [ 0, %2 ], [ 0, %5 ], [ %., %8 ], !dbg !208
  ret i32 %.0, !dbg !223
}

; Function Attrs: mustprogress nofree nounwind readonly willreturn
declare dso_local i64 @strnlen(i8*, i64) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) local_unnamed_addr #3

; Function Attrs: noinline noreturn nounwind optnone uwtable
define dso_local i32 @main() local_unnamed_addr #4 !dbg !2 {
  %1 = alloca i32, align 4
  %2 = alloca [64 x i8], align 16
  %3 = alloca [66 x i8], align 16
  %4 = alloca i32, align 4
  %5 = alloca %struct.ce_module, align 8
  %6 = alloca %struct.ce_flow, align 8
  %7 = alloca i16, align 2
  %8 = alloca i16, align 2
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [64 x i8]* %2, metadata !224, metadata !DIExpression()), !dbg !228
  %11 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !229
  call void @klee_make_symbolic(i8* %11, i64 64, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !230
  call void @llvm.dbg.declare(metadata [66 x i8]* %3, metadata !231, metadata !DIExpression()), !dbg !235
  %12 = getelementptr inbounds [66 x i8], [66 x i8]* %3, i64 0, i64 0, !dbg !236
  call void @klee_make_symbolic(i8* %12, i64 66, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)), !dbg !237
  %13 = getelementptr inbounds [66 x i8], [66 x i8]* %3, i64 0, i64 65, !dbg !238
  store i8 0, i8* %13, align 1, !dbg !239
  call void @llvm.dbg.declare(metadata i32* %4, metadata !240, metadata !DIExpression()), !dbg !242
  store i32 0, i32* %4, align 4, !dbg !242
  br label %14, !dbg !243

14:                                               ; preds = %26, %0
  %15 = load i32, i32* %4, align 4, !dbg !244
  %16 = icmp sle i32 %15, 64, !dbg !246
  br i1 %16, label %17, label %29, !dbg !247

17:                                               ; preds = %14
  %18 = load i32, i32* %4, align 4, !dbg !248
  %19 = sext i32 %18 to i64, !dbg !249
  %20 = getelementptr inbounds [66 x i8], [66 x i8]* %3, i64 0, i64 %19, !dbg !249
  %21 = load i8, i8* %20, align 1, !dbg !249
  %22 = sext i8 %21 to i32, !dbg !249
  %23 = icmp ne i32 %22, 0, !dbg !250
  %24 = zext i1 %23 to i32, !dbg !250
  %25 = sext i32 %24 to i64, !dbg !249
  call void @klee_assume(i64 %25), !dbg !251
  br label %26, !dbg !251

26:                                               ; preds = %17
  %27 = load i32, i32* %4, align 4, !dbg !252
  %28 = add nsw i32 %27, 1, !dbg !252
  store i32 %28, i32* %4, align 4, !dbg !252
  br label %14, !dbg !253, !llvm.loop !254

29:                                               ; preds = %14
  call void @llvm.dbg.declare(metadata %struct.ce_module* %5, metadata !256, metadata !DIExpression()), !dbg !266
  call void @llvm.dbg.declare(metadata %struct.ce_flow* %6, metadata !267, metadata !DIExpression()), !dbg !278
  %30 = bitcast %struct.ce_module* %5 to i8*, !dbg !279
  %31 = call i8* @memset(i8* %30, i32 0, i64 16), !dbg !279
  %32 = bitcast %struct.ce_flow* %6 to i8*, !dbg !280
  %33 = call i8* @memset(i8* %32, i32 0, i64 16), !dbg !280
  %34 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !281
  %35 = getelementptr inbounds %struct.ce_module, %struct.ce_module* %5, i32 0, i32 0, !dbg !282
  %36 = getelementptr inbounds %struct.ce_packet, %struct.ce_packet* %35, i32 0, i32 0, !dbg !283
  store i8* %34, i8** %36, align 8, !dbg !284
  %37 = getelementptr inbounds %struct.ce_module, %struct.ce_module* %5, i32 0, i32 0, !dbg !285
  %38 = getelementptr inbounds %struct.ce_packet, %struct.ce_packet* %37, i32 0, i32 1, !dbg !286
  store i16 64, i16* %38, align 8, !dbg !287
  %39 = getelementptr inbounds %struct.ce_flow, %struct.ce_flow* %6, i32 0, i32 0, !dbg !288
  %40 = bitcast %struct.ce_module* %39 to %struct.ce_packet*, !dbg !289
  %41 = getelementptr inbounds %struct.ce_packet, %struct.ce_packet* %40, i32 0, i32 0, !dbg !290
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @main.existing_names, i64 0, i64 0), i8** %41, align 8, !dbg !291
  %42 = getelementptr inbounds %struct.ce_flow, %struct.ce_flow* %6, i32 0, i32 0, !dbg !292
  %43 = bitcast %struct.ce_module* %42 to %struct.ce_packet*, !dbg !293
  %44 = getelementptr inbounds %struct.ce_packet, %struct.ce_packet* %43, i32 0, i32 1, !dbg !294
  store i16 -1, i16* %44, align 8, !dbg !295
  call void @llvm.dbg.declare(metadata i16* %7, metadata !296, metadata !DIExpression()), !dbg !297
  store i16 0, i16* %7, align 2, !dbg !297
  call void @llvm.dbg.declare(metadata i16* %8, metadata !298, metadata !DIExpression()), !dbg !299
  store i16 64, i16* %8, align 2, !dbg !299
  call void @llvm.dbg.declare(metadata i32* %9, metadata !300, metadata !DIExpression()), !dbg !301
  %45 = load i16, i16* %7, align 2, !dbg !302
  %46 = load i16, i16* %8, align 2, !dbg !303
  %47 = call fastcc i32 @predicate_cert_elements_oob_write(%struct.ce_module* %5, %struct.ce_flow* %6, i16 zeroext %45, i16 zeroext %46), !dbg !304
  store i32 %47, i32* %9, align 4, !dbg !301
  call void @llvm.dbg.declare(metadata i32* %10, metadata !305, metadata !DIExpression()), !dbg !306
  %48 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !307
  %49 = getelementptr inbounds [66 x i8], [66 x i8]* %3, i64 0, i64 0, !dbg !308
  %50 = call fastcc i32 @predicate_strncasestr_oob_read(i8* %48, i8* %49), !dbg !309
  store i32 %50, i32* %10, align 4, !dbg !306
  %51 = load i32, i32* %9, align 4, !dbg !310
  %52 = icmp eq i32 %51, 1, !dbg !311
  br i1 %52, label %53, label %56, !dbg !312

53:                                               ; preds = %29
  %54 = load i32, i32* %10, align 4, !dbg !313
  %55 = icmp eq i32 %54, 1, !dbg !314
  br label %56

56:                                               ; preds = %53, %29
  %57 = phi i1 [ false, %29 ], [ %55, %53 ], !dbg !315
  %58 = zext i1 %57 to i32, !dbg !312
  %59 = sext i32 %58 to i64, !dbg !310
  call void @klee_assume(i64 %59), !dbg !316
  call void @__assert_fail(i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.3, i64 0, i64 0), i32 75, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #9, !dbg !317
  unreachable, !dbg !317
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) local_unnamed_addr #5

declare dso_local void @klee_assume(i64) local_unnamed_addr #5

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #6

; Function Attrs: nofree noinline norecurse nosync nounwind uwtable writeonly
define dso_local i8* @memset(i8* returned %0, i32 %1, i64 %2) local_unnamed_addr #7 !dbg !318 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !322, metadata !DIExpression()), !dbg !323
  call void @llvm.dbg.value(metadata i32 %1, metadata !324, metadata !DIExpression()), !dbg !323
  call void @llvm.dbg.value(metadata i64 %2, metadata !325, metadata !DIExpression()), !dbg !323
  call void @llvm.dbg.value(metadata i8* %0, metadata !326, metadata !DIExpression()), !dbg !323
  call void @llvm.dbg.value(metadata i64 %2, metadata !325, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !323
  %.not2 = icmp eq i64 %2, 0, !dbg !327
  br i1 %.not2, label %._crit_edge, label %.lr.ph, !dbg !328

.lr.ph:                                           ; preds = %3
  %4 = trunc i32 %1 to i8
  br label %5, !dbg !328

5:                                                ; preds = %.lr.ph, %5
  %.04 = phi i8* [ %0, %.lr.ph ], [ %7, %5 ]
  %.013 = phi i64 [ %2, %.lr.ph ], [ %6, %5 ]
  call void @llvm.dbg.value(metadata i8* %.04, metadata !326, metadata !DIExpression()), !dbg !323
  call void @llvm.dbg.value(metadata i64 %.013, metadata !325, metadata !DIExpression()), !dbg !323
  %6 = add i64 %.013, -1, !dbg !329
  call void @llvm.dbg.value(metadata i64 %6, metadata !325, metadata !DIExpression()), !dbg !323
  %7 = getelementptr inbounds i8, i8* %.04, i64 1, !dbg !330
  call void @llvm.dbg.value(metadata i8* %7, metadata !326, metadata !DIExpression()), !dbg !323
  store i8 %4, i8* %.04, align 1, !dbg !331
  call void @llvm.dbg.value(metadata i64 %6, metadata !325, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !323
  %.not = icmp eq i64 %6, 0, !dbg !327
  br i1 %.not, label %._crit_edge, label %5, !dbg !328, !llvm.loop !332

._crit_edge:                                      ; preds = %5, %3
  ret i8* %0, !dbg !334
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nofree noinline norecurse nosync nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree noinline nounwind readonly uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noinline noreturn nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree noinline norecurse nosync nounwind uwtable writeonly "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind readonly willreturn }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!17, !35, !7, !38}
!llvm.ident = !{!40, !40, !40, !40}
!llvm.module.flags = !{!41, !42, !43, !44, !45}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "existing_names", scope: !2, file: !3, line: 61, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 35, type: !4, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!3 = !DIFile(filename: "driver_cert-elements-oob-write_strncasestr-oob-read_final.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!4 = !DISubroutineType(types: !5)
!5 = !{!6}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, retainedTypes: !9, globals: !13, splitDebugInlining: false, nameTableKind: None)
!8 = !{}
!9 = !{!10}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !{!0}
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 8, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 1)
!17 = distinct !DICompileUnit(language: DW_LANG_C99, file: !18, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, retainedTypes: !19, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "predicate_cert-elements-oob-write.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!19 = !{!20, !26, !27, !31, !32}
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int32_t", file: !18, line: 28, baseType: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !22, line: 26, baseType: !23)
!22 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !24, line: 42, baseType: !25)
!24 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!25 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int16_t", file: !18, line: 27, baseType: !28)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !22, line: 25, baseType: !29)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !24, line: 40, baseType: !30)
!30 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !33, line: 79, baseType: !34)
!33 = !DIFile(filename: "/usr/include/stdint.h", directory: "")
!34 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, retainedTypes: !37, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "predicate_strncasestr-oob-read.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!37 = !{!26}
!38 = distinct !DICompileUnit(language: DW_LANG_C99, file: !39, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, splitDebugInlining: false, nameTableKind: None)
!39 = !DIFile(filename: "/home/wcontrerasmartinez/klee/runtime/Freestanding/memset.c", directory: "/home/wcontrerasmartinez/klee/build/runtime/Freestanding")
!40 = !{!"Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8"}
!41 = !{i32 7, !"Dwarf Version", i32 4}
!42 = !{i32 2, !"Debug Info Version", i32 3}
!43 = !{i32 1, !"wchar_size", i32 4}
!44 = !{i32 7, !"uwtable", i32 1}
!45 = !{i32 7, !"frame-pointer", i32 2}
!46 = distinct !DISubprogram(name: "predicate_cert_elements_oob_write", scope: !18, file: !18, line: 49, type: !47, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !8)
!47 = !DISubroutineType(types: !48)
!48 = !{!6, !49, !63, !27, !27}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_module", file: !18, line: 45, size: 128, elements: !51)
!51 = !{!52}
!52 = !DIDerivedType(tag: DW_TAG_member, name: "packet", scope: !50, file: !18, line: 46, baseType: !53, size: 128)
!53 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_packet", file: !18, line: 40, size: 128, elements: !54)
!54 = !{!55, !62}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "payload", scope: !53, file: !18, line: 41, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !58)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int8_t", file: !18, line: 26, baseType: !59)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !22, line: 24, baseType: !60)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !24, line: 38, baseType: !61)
!61 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "payload_packet_len", scope: !53, file: !18, line: 42, baseType: !27, size: 16, offset: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_flow", file: !18, line: 36, size: 128, elements: !65)
!65 = !{!66}
!66 = !DIDerivedType(tag: DW_TAG_member, name: "protos", scope: !64, file: !18, line: 37, baseType: !67, size: 128)
!67 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !64, file: !18, line: 37, size: 128, elements: !68)
!68 = !{!69}
!69 = !DIDerivedType(tag: DW_TAG_member, name: "tls_quic", scope: !67, file: !18, line: 37, baseType: !70, size: 128)
!70 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_tls_quic", file: !18, line: 31, size: 128, elements: !71)
!71 = !{!72, !73}
!72 = !DIDerivedType(tag: DW_TAG_member, name: "server_names", scope: !70, file: !18, line: 32, baseType: !31, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "server_names_len", scope: !70, file: !18, line: 33, baseType: !27, size: 16, offset: 64)
!74 = !DILocalVariable(name: "ndpi_struct", arg: 1, scope: !46, file: !18, line: 50, type: !49)
!75 = !DILocation(line: 0, scope: !46)
!76 = !DILocalVariable(name: "flow", arg: 2, scope: !46, file: !18, line: 51, type: !63)
!77 = !DILocalVariable(name: "p_offset", arg: 3, scope: !46, file: !18, line: 52, type: !27)
!78 = !DILocalVariable(name: "certificate_len", arg: 4, scope: !46, file: !18, line: 53, type: !27)
!79 = !DILocalVariable(name: "packet", scope: !46, file: !18, line: 55, type: !80)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!81 = !DILocalVariable(name: "i", scope: !46, file: !18, line: 56, type: !27)
!82 = !DILocation(line: 58, column: 24, scope: !83)
!83 = distinct !DILexicalBlock(scope: !84, file: !18, line: 58, column: 3)
!84 = distinct !DILexicalBlock(scope: !46, file: !18, line: 58, column: 3)
!85 = !DILocation(line: 58, column: 3, scope: !84)
!86 = !DILocation(line: 60, column: 37, scope: !87)
!87 = distinct !DILexicalBlock(scope: !88, file: !18, line: 60, column: 9)
!88 = distinct !DILexicalBlock(scope: !83, file: !18, line: 58, column: 48)
!89 = !DILocation(line: 60, column: 9, scope: !87)
!90 = !DILocation(line: 60, column: 22, scope: !87)
!91 = !DILocation(line: 60, column: 29, scope: !87)
!92 = !DILocation(line: 60, column: 26, scope: !87)
!93 = !DILocation(line: 60, column: 9, scope: !88)
!94 = !DILocation(line: 62, column: 18, scope: !95)
!95 = distinct !DILexicalBlock(scope: !88, file: !18, line: 62, column: 9)
!96 = !DILocation(line: 62, column: 10, scope: !95)
!97 = !DILocation(line: 62, column: 31, scope: !95)
!98 = !DILocation(line: 62, column: 40, scope: !95)
!99 = !DILocation(line: 63, column: 27, scope: !95)
!100 = !DILocation(line: 63, column: 10, scope: !95)
!101 = !DILocation(line: 63, column: 31, scope: !95)
!102 = !DILocation(line: 63, column: 40, scope: !95)
!103 = !DILocation(line: 64, column: 27, scope: !95)
!104 = !DILocation(line: 64, column: 10, scope: !95)
!105 = !DILocation(line: 64, column: 31, scope: !95)
!106 = !DILocation(line: 62, column: 9, scope: !88)
!107 = !DILocation(line: 67, column: 9, scope: !108)
!108 = distinct !DILexicalBlock(scope: !95, file: !18, line: 64, column: 41)
!109 = !DILocation(line: 68, column: 13, scope: !110)
!110 = distinct !DILexicalBlock(scope: !108, file: !18, line: 68, column: 11)
!111 = !DILocation(line: 68, column: 11, scope: !108)
!112 = !DILocation(line: 71, column: 11, scope: !113)
!113 = distinct !DILexicalBlock(scope: !108, file: !18, line: 71, column: 11)
!114 = !DILocation(line: 71, column: 30, scope: !113)
!115 = !DILocation(line: 71, column: 11, scope: !108)
!116 = !DILocation(line: 73, column: 13, scope: !117)
!117 = distinct !DILexicalBlock(scope: !108, file: !18, line: 73, column: 11)
!118 = !DILocation(line: 73, column: 11, scope: !108)
!119 = !DILocation(line: 76, column: 13, scope: !108)
!120 = !DILocation(line: 76, column: 12, scope: !108)
!121 = !DILocation(line: 76, column: 9, scope: !108)
!122 = !DILocation(line: 77, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !108, file: !18, line: 77, column: 11)
!124 = !DILocation(line: 77, column: 11, scope: !108)
!125 = !DILocation(line: 79, column: 9, scope: !108)
!126 = !DILocation(line: 80, column: 13, scope: !127)
!127 = distinct !DILexicalBlock(scope: !108, file: !18, line: 80, column: 11)
!128 = !DILocation(line: 80, column: 11, scope: !108)
!129 = !DILocation(line: 83, column: 13, scope: !108)
!130 = !DILocation(line: 83, column: 12, scope: !108)
!131 = !DILocation(line: 83, column: 9, scope: !108)
!132 = !DILocation(line: 84, column: 8, scope: !108)
!133 = !DILocation(line: 86, column: 16, scope: !108)
!134 = !DILocation(line: 86, column: 7, scope: !108)
!135 = !DILocation(line: 87, column: 36, scope: !136)
!136 = distinct !DILexicalBlock(scope: !108, file: !18, line: 86, column: 46)
!137 = !DILocation(line: 87, column: 28, scope: !136)
!138 = !DILocalVariable(name: "gn_type", scope: !136, file: !18, line: 87, type: !58)
!139 = !DILocation(line: 0, scope: !136)
!140 = !DILocation(line: 89, column: 29, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !18, line: 89, column: 13)
!142 = !DILocation(line: 91, column: 15, scope: !143)
!143 = distinct !DILexicalBlock(scope: !144, file: !18, line: 91, column: 15)
!144 = distinct !DILexicalBlock(scope: !141, file: !18, line: 89, column: 68)
!145 = !DILocation(line: 91, column: 17, scope: !143)
!146 = !DILocation(line: 91, column: 24, scope: !143)
!147 = !DILocation(line: 91, column: 21, scope: !143)
!148 = !DILocation(line: 91, column: 15, scope: !144)
!149 = !DILocation(line: 93, column: 50, scope: !144)
!150 = !DILocation(line: 93, column: 32, scope: !144)
!151 = !DILocalVariable(name: "len", scope: !144, file: !18, line: 93, type: !58)
!152 = !DILocation(line: 0, scope: !144)
!153 = !DILocation(line: 97, column: 50, scope: !154)
!154 = distinct !DILexicalBlock(scope: !144, file: !18, line: 97, column: 15)
!155 = !DILocation(line: 97, column: 20, scope: !154)
!156 = !DILocation(line: 97, column: 56, scope: !154)
!157 = !DILocation(line: 98, column: 34, scope: !154)
!158 = !DILocation(line: 98, column: 32, scope: !154)
!159 = !DILocation(line: 98, column: 38, scope: !154)
!160 = !DILocation(line: 98, column: 43, scope: !154)
!161 = !DILocation(line: 97, column: 15, scope: !144)
!162 = !DILocation(line: 101, column: 13, scope: !144)
!163 = !DILocation(line: 102, column: 19, scope: !164)
!164 = distinct !DILexicalBlock(scope: !144, file: !18, line: 102, column: 15)
!165 = !DILocation(line: 102, column: 15, scope: !144)
!166 = !DILocation(line: 105, column: 15, scope: !167)
!167 = distinct !DILexicalBlock(scope: !144, file: !18, line: 105, column: 15)
!168 = !DILocation(line: 105, column: 28, scope: !167)
!169 = !DILocation(line: 105, column: 34, scope: !167)
!170 = !DILocation(line: 105, column: 15, scope: !144)
!171 = !DILocalVariable(name: "dNSName_len", scope: !144, file: !18, line: 94, type: !27)
!172 = !DILocation(line: 110, column: 37, scope: !173)
!173 = distinct !DILexicalBlock(scope: !144, file: !18, line: 110, column: 15)
!174 = !DILocation(line: 110, column: 50, scope: !173)
!175 = !DILocation(line: 110, column: 15, scope: !144)
!176 = !DILocation(line: 112, column: 50, scope: !177)
!177 = distinct !DILexicalBlock(scope: !178, file: !18, line: 112, column: 17)
!178 = distinct !DILexicalBlock(scope: !173, file: !18, line: 110, column: 59)
!179 = !DILocation(line: 112, column: 17, scope: !177)
!180 = !DILocation(line: 112, column: 67, scope: !177)
!181 = !DILocation(line: 113, column: 45, scope: !177)
!182 = !DILocation(line: 112, column: 17, scope: !178)
!183 = !DILocation(line: 117, column: 68, scope: !178)
!184 = !DILocation(line: 117, column: 66, scope: !178)
!185 = !DILocation(line: 117, column: 80, scope: !178)
!186 = !DILocation(line: 118, column: 11, scope: !178)
!187 = !DILocation(line: 108, column: 25, scope: !144)
!188 = !DILocation(line: 119, column: 52, scope: !189)
!189 = distinct !DILexicalBlock(scope: !173, file: !18, line: 118, column: 18)
!190 = !DILocation(line: 0, scope: !173)
!191 = !DILocation(line: 123, column: 16, scope: !144)
!192 = !DILocation(line: 123, column: 13, scope: !144)
!193 = !DILocation(line: 86, column: 26, scope: !108)
!194 = distinct !{!194, !134, !195, !196}
!195 = !DILocation(line: 127, column: 7, scope: !108)
!196 = !{!"llvm.loop.mustprogress"}
!197 = !DILocation(line: 0, scope: !84)
!198 = !DILocation(line: 58, column: 44, scope: !83)
!199 = distinct !{!199, !85, !200, !196}
!200 = !DILocation(line: 129, column: 3, scope: !84)
!201 = !DILocation(line: 131, column: 1, scope: !46)
!202 = distinct !DISubprogram(name: "predicate_strncasestr_oob_read", scope: !36, file: !36, line: 22, type: !203, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !35, retainedNodes: !8)
!203 = !DISubroutineType(types: !204)
!204 = !{!6, !10, !10, !205}
!205 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !206, line: 46, baseType: !34)
!206 = !DIFile(filename: "/usr/lib/llvm-13/lib/clang/13.0.1/include/stddef.h", directory: "")
!207 = !DILocalVariable(name: "str1", arg: 1, scope: !202, file: !36, line: 22, type: !10)
!208 = !DILocation(line: 0, scope: !202)
!209 = !DILocalVariable(name: "str2", arg: 2, scope: !202, file: !36, line: 22, type: !10)
!210 = !DILocalVariable(name: "len", arg: 3, scope: !202, file: !36, line: 23, type: !205)
!211 = !DILocation(line: 25, column: 12, scope: !212)
!212 = distinct !DILexicalBlock(scope: !202, file: !36, line: 25, column: 7)
!213 = !DILocation(line: 25, column: 20, scope: !212)
!214 = !DILocalVariable(name: "str1_len", scope: !202, file: !36, line: 28, type: !205)
!215 = !DILocation(line: 29, column: 21, scope: !202)
!216 = !DILocalVariable(name: "str2_len", scope: !202, file: !36, line: 29, type: !205)
!217 = !DILocation(line: 31, column: 16, scope: !218)
!218 = distinct !DILexicalBlock(scope: !202, file: !36, line: 31, column: 7)
!219 = !DILocation(line: 31, column: 7, scope: !202)
!220 = !DILocation(line: 28, column: 21, scope: !202)
!221 = !DILocation(line: 38, column: 16, scope: !222)
!222 = distinct !DILexicalBlock(scope: !202, file: !36, line: 38, column: 7)
!223 = !DILocation(line: 41, column: 1, scope: !202)
!224 = !DILocalVariable(name: "buf", scope: !2, file: !3, line: 36, type: !225)
!225 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 512, elements: !226)
!226 = !{!227}
!227 = !DISubrange(count: 64)
!228 = !DILocation(line: 36, column: 11, scope: !2)
!229 = !DILocation(line: 37, column: 22, scope: !2)
!230 = !DILocation(line: 37, column: 3, scope: !2)
!231 = !DILocalVariable(name: "needle", scope: !2, file: !3, line: 42, type: !232)
!232 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 528, elements: !233)
!233 = !{!234}
!234 = !DISubrange(count: 66)
!235 = !DILocation(line: 42, column: 8, scope: !2)
!236 = !DILocation(line: 43, column: 22, scope: !2)
!237 = !DILocation(line: 43, column: 3, scope: !2)
!238 = !DILocation(line: 46, column: 3, scope: !2)
!239 = !DILocation(line: 46, column: 24, scope: !2)
!240 = !DILocalVariable(name: "k", scope: !241, file: !3, line: 49, type: !6)
!241 = distinct !DILexicalBlock(scope: !2, file: !3, line: 49, column: 3)
!242 = !DILocation(line: 49, column: 12, scope: !241)
!243 = !DILocation(line: 49, column: 8, scope: !241)
!244 = !DILocation(line: 49, column: 19, scope: !245)
!245 = distinct !DILexicalBlock(scope: !241, file: !3, line: 49, column: 3)
!246 = !DILocation(line: 49, column: 21, scope: !245)
!247 = !DILocation(line: 49, column: 3, scope: !241)
!248 = !DILocation(line: 50, column: 24, scope: !245)
!249 = !DILocation(line: 50, column: 17, scope: !245)
!250 = !DILocation(line: 50, column: 27, scope: !245)
!251 = !DILocation(line: 50, column: 5, scope: !245)
!252 = !DILocation(line: 49, column: 35, scope: !245)
!253 = !DILocation(line: 49, column: 3, scope: !245)
!254 = distinct !{!254, !247, !255, !196}
!255 = !DILocation(line: 50, column: 34, scope: !241)
!256 = !DILocalVariable(name: "ce_mod", scope: !2, file: !3, line: 53, type: !257)
!257 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_module", file: !3, line: 29, size: 128, elements: !258)
!258 = !{!259}
!259 = !DIDerivedType(tag: DW_TAG_member, name: "packet", scope: !257, file: !3, line: 29, baseType: !260, size: 128)
!260 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_packet", file: !3, line: 28, size: 128, elements: !261)
!261 = !{!262, !265}
!262 = !DIDerivedType(tag: DW_TAG_member, name: "payload", scope: !260, file: !3, line: 28, baseType: !263, size: 64)
!263 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !264, size: 64)
!264 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !59)
!265 = !DIDerivedType(tag: DW_TAG_member, name: "payload_packet_len", scope: !260, file: !3, line: 28, baseType: !28, size: 16, offset: 64)
!266 = !DILocation(line: 53, column: 20, scope: !2)
!267 = !DILocalVariable(name: "ce_flow", scope: !2, file: !3, line: 54, type: !268)
!268 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_flow", file: !3, line: 27, size: 128, elements: !269)
!269 = !{!270}
!270 = !DIDerivedType(tag: DW_TAG_member, name: "protos", scope: !268, file: !3, line: 27, baseType: !271, size: 128)
!271 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !268, file: !3, line: 27, size: 128, elements: !272)
!272 = !{!273}
!273 = !DIDerivedType(tag: DW_TAG_member, name: "tls_quic", scope: !271, file: !3, line: 27, baseType: !274, size: 128)
!274 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_tls_quic", file: !3, line: 26, size: 128, elements: !275)
!275 = !{!276, !277}
!276 = !DIDerivedType(tag: DW_TAG_member, name: "server_names", scope: !274, file: !3, line: 26, baseType: !31, size: 64)
!277 = !DIDerivedType(tag: DW_TAG_member, name: "server_names_len", scope: !274, file: !3, line: 26, baseType: !28, size: 16, offset: 64)
!278 = !DILocation(line: 54, column: 20, scope: !2)
!279 = !DILocation(line: 55, column: 3, scope: !2)
!280 = !DILocation(line: 56, column: 3, scope: !2)
!281 = !DILocation(line: 58, column: 38, scope: !2)
!282 = !DILocation(line: 58, column: 10, scope: !2)
!283 = !DILocation(line: 58, column: 17, scope: !2)
!284 = !DILocation(line: 58, column: 36, scope: !2)
!285 = !DILocation(line: 59, column: 10, scope: !2)
!286 = !DILocation(line: 59, column: 17, scope: !2)
!287 = !DILocation(line: 59, column: 36, scope: !2)
!288 = !DILocation(line: 62, column: 11, scope: !2)
!289 = !DILocation(line: 62, column: 18, scope: !2)
!290 = !DILocation(line: 62, column: 27, scope: !2)
!291 = !DILocation(line: 62, column: 40, scope: !2)
!292 = !DILocation(line: 63, column: 11, scope: !2)
!293 = !DILocation(line: 63, column: 18, scope: !2)
!294 = !DILocation(line: 63, column: 27, scope: !2)
!295 = !DILocation(line: 63, column: 44, scope: !2)
!296 = !DILocalVariable(name: "p_offset", scope: !2, file: !3, line: 65, type: !28)
!297 = !DILocation(line: 65, column: 12, scope: !2)
!298 = !DILocalVariable(name: "cert_len", scope: !2, file: !3, line: 66, type: !28)
!299 = !DILocation(line: 66, column: 12, scope: !2)
!300 = !DILocalVariable(name: "r_ce", scope: !2, file: !3, line: 69, type: !6)
!301 = !DILocation(line: 69, column: 7, scope: !2)
!302 = !DILocation(line: 70, column: 50, scope: !2)
!303 = !DILocation(line: 70, column: 60, scope: !2)
!304 = !DILocation(line: 69, column: 15, scope: !2)
!305 = !DILocalVariable(name: "r_str", scope: !2, file: !3, line: 71, type: !6)
!306 = !DILocation(line: 71, column: 7, scope: !2)
!307 = !DILocation(line: 71, column: 60, scope: !2)
!308 = !DILocation(line: 71, column: 65, scope: !2)
!309 = !DILocation(line: 71, column: 15, scope: !2)
!310 = !DILocation(line: 74, column: 15, scope: !2)
!311 = !DILocation(line: 74, column: 20, scope: !2)
!312 = !DILocation(line: 74, column: 25, scope: !2)
!313 = !DILocation(line: 74, column: 28, scope: !2)
!314 = !DILocation(line: 74, column: 34, scope: !2)
!315 = !DILocation(line: 0, scope: !2)
!316 = !DILocation(line: 74, column: 3, scope: !2)
!317 = !DILocation(line: 75, column: 3, scope: !2)
!318 = distinct !DISubprogram(name: "memset", scope: !319, file: !319, line: 12, type: !320, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !8)
!319 = !DIFile(filename: "runtime/Freestanding/memset.c", directory: "/home/wcontrerasmartinez/klee")
!320 = !DISubroutineType(types: !321)
!321 = !{!26, !26, !6, !205}
!322 = !DILocalVariable(name: "dst", arg: 1, scope: !318, file: !319, line: 12, type: !26)
!323 = !DILocation(line: 0, scope: !318)
!324 = !DILocalVariable(name: "s", arg: 2, scope: !318, file: !319, line: 12, type: !6)
!325 = !DILocalVariable(name: "count", arg: 3, scope: !318, file: !319, line: 12, type: !205)
!326 = !DILocalVariable(name: "a", scope: !318, file: !319, line: 13, type: !31)
!327 = !DILocation(line: 14, column: 18, scope: !318)
!328 = !DILocation(line: 14, column: 3, scope: !318)
!329 = !DILocation(line: 14, column: 15, scope: !318)
!330 = !DILocation(line: 15, column: 7, scope: !318)
!331 = !DILocation(line: 15, column: 10, scope: !318)
!332 = distinct !{!332, !328, !333, !196}
!333 = !DILocation(line: 15, column: 12, scope: !318)
!334 = !DILocation(line: 16, column: 3, scope: !318)
