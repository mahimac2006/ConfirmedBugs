; ModuleID = 'linked_cert-elements-oob-write_printable-string-oob-read.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ce_module = type { %struct.ce_packet }
%struct.ce_packet = type { i8*, i16 }
%struct.ce_flow = type { %struct.ce_module }

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@main.existing_names = internal global [1 x i8] zeroinitializer, align 1, !dbg !0
@.str.1 = private unnamed_addr constant [8 x i8] c"srv_len\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"p_offset\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"ps_len\00", align 1
@.str.4 = private unnamed_addr constant [70 x i8] c"0 && \22REACHED_BOTH_cert-elements-oob-write_printable-string-oob-read\22\00", align 1
@.str.5 = private unnamed_addr constant [59 x i8] c"driver_cert-elements-oob-write_printable-string-oob-read.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [15 x i8] c"int main(void)\00", align 1

; Function Attrs: noinline noreturn nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !2 {
  %1 = alloca [256 x i8], align 16
  %2 = alloca %struct.ce_module, align 8
  %3 = alloca %struct.ce_flow, align 8
  %4 = alloca i16, align 2
  %5 = alloca i16, align 2
  %6 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata [256 x i8]* %1, metadata !46, metadata !DIExpression()), !dbg !53
  %7 = getelementptr inbounds [256 x i8], [256 x i8]* %1, i64 0, i64 0, !dbg !54
  call void @klee_make_symbolic(i8* nonnull %7, i64 256, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)) #7, !dbg !55
  call void @llvm.dbg.declare(metadata %struct.ce_module* %2, metadata !56, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata %struct.ce_flow* %3, metadata !67, metadata !DIExpression()), !dbg !78
  %8 = getelementptr inbounds %struct.ce_module, %struct.ce_module* %2, i64 0, i32 0, i32 1, !dbg !79
  %9 = bitcast i16* %8 to i64*, !dbg !79
  store i64 256, i64* %9, align 8, !dbg !79
  %10 = getelementptr inbounds %struct.ce_flow, %struct.ce_flow* %3, i64 0, i32 0, i32 0, i32 1, !dbg !80
  %11 = bitcast i16* %10 to i64*, !dbg !80
  store i64 0, i64* %11, align 8, !dbg !80
  %12 = getelementptr inbounds %struct.ce_module, %struct.ce_module* %2, i64 0, i32 0, i32 0, !dbg !81
  store i8* %7, i8** %12, align 8, !dbg !82
  %13 = getelementptr inbounds %struct.ce_flow, %struct.ce_flow* %3, i64 0, i32 0, i32 0, i32 0, !dbg !83
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @main.existing_names, i64 0, i64 0), i8** %13, align 8, !dbg !84
  %14 = bitcast i16* %4 to i8*, !dbg !85
  call void @llvm.dbg.value(metadata i16* %4, metadata !86, metadata !DIExpression(DW_OP_deref)), !dbg !87
  call void @klee_make_symbolic(i8* nonnull %14, i64 2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0)) #7, !dbg !88
  %15 = load i16, i16* %4, align 2, !dbg !89
  call void @llvm.dbg.value(metadata i16 %15, metadata !86, metadata !DIExpression()), !dbg !87
  %16 = icmp ugt i16 %15, -3, !dbg !90
  %17 = zext i1 %16 to i64, !dbg !89
  call void @klee_assume(i64 %17) #7, !dbg !91
  %18 = load i16, i16* %4, align 2, !dbg !92
  call void @llvm.dbg.value(metadata i16 %18, metadata !86, metadata !DIExpression()), !dbg !87
  store i16 %18, i16* %10, align 8, !dbg !93
  %19 = bitcast i16* %5 to i8*, !dbg !94
  call void @llvm.dbg.value(metadata i16* %5, metadata !95, metadata !DIExpression(DW_OP_deref)), !dbg !87
  call void @klee_make_symbolic(i8* nonnull %19, i64 2, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0)) #7, !dbg !96
  %20 = load i16, i16* %5, align 2, !dbg !97
  call void @llvm.dbg.value(metadata i16 %20, metadata !95, metadata !DIExpression()), !dbg !87
  %21 = icmp ult i16 %20, 256, !dbg !98
  %22 = zext i1 %21 to i64, !dbg !97
  call void @klee_assume(i64 %22) #7, !dbg !99
  %23 = bitcast i64* %6 to i8*, !dbg !100
  call void @llvm.dbg.value(metadata i64* %6, metadata !101, metadata !DIExpression(DW_OP_deref)), !dbg !87
  call void @klee_make_symbolic(i8* nonnull %23, i64 8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7, !dbg !102
  %24 = load i64, i64* %6, align 8, !dbg !103
  call void @llvm.dbg.value(metadata i64 %24, metadata !101, metadata !DIExpression()), !dbg !87
  %25 = icmp ugt i64 %24, 256, !dbg !104
  %26 = zext i1 %25 to i64, !dbg !103
  call void @klee_assume(i64 %26) #7, !dbg !105
  %27 = load i64, i64* %6, align 8, !dbg !106
  call void @llvm.dbg.value(metadata i64 %27, metadata !101, metadata !DIExpression()), !dbg !87
  %28 = icmp ult i64 %27, 513, !dbg !107
  %29 = zext i1 %28 to i64, !dbg !106
  call void @klee_assume(i64 %29) #7, !dbg !108
  %30 = load i16, i16* %5, align 2, !dbg !109
  call void @llvm.dbg.value(metadata i16 %30, metadata !95, metadata !DIExpression()), !dbg !87
  %31 = call fastcc i32 @predicate_cert_elements_oob_write(%struct.ce_module* nonnull %2, %struct.ce_flow* nonnull %3, i16 zeroext %30), !dbg !110
  call void @llvm.dbg.value(metadata i32 %31, metadata !111, metadata !DIExpression()), !dbg !87
  %32 = load i64, i64* %6, align 8, !dbg !112
  call void @llvm.dbg.value(metadata i64 %32, metadata !101, metadata !DIExpression()), !dbg !87
  %33 = call fastcc i32 @predicate_printable_string_oob_read(i8* nonnull %7, i64 %32), !dbg !113
  call void @llvm.dbg.value(metadata i32 %33, metadata !114, metadata !DIExpression()), !dbg !87
  %34 = icmp eq i32 %31, 1, !dbg !115
  %35 = icmp eq i32 %33, 1, !dbg !116
  %36 = select i1 %34, i1 %35, i1 false, !dbg !116
  %37 = zext i1 %36 to i64, !dbg !117
  call void @klee_assume(i64 %37) #7, !dbg !118
  call void @__assert_fail(i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.5, i64 0, i64 0), i32 68, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #8, !dbg !119
  unreachable, !dbg !119
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) local_unnamed_addr #2

declare dso_local void @klee_assume(i64) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #3

; Function Attrs: nofree noinline norecurse nosync nounwind uwtable
define internal fastcc i32 @predicate_cert_elements_oob_write(%struct.ce_module* nocapture readonly %0, %struct.ce_flow* nocapture %1, i16 zeroext %2) unnamed_addr #4 !dbg !120 {
  call void @llvm.dbg.value(metadata %struct.ce_module* %0, metadata !145, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.value(metadata %struct.ce_flow* %1, metadata !147, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.value(metadata i16 %2, metadata !148, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.value(metadata i16 256, metadata !149, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.value(metadata %struct.ce_module* %0, metadata !150, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.value(metadata i16 %2, metadata !152, metadata !DIExpression()), !dbg !146
  %4 = icmp ult i16 %2, 256, !dbg !153
  br i1 %4, label %.lr.ph17, label %.loopexit10, !dbg !156

.lr.ph17:                                         ; preds = %3
  %5 = getelementptr inbounds %struct.ce_module, %struct.ce_module* %0, i64 0, i32 0, i32 1
  %6 = getelementptr inbounds %struct.ce_module, %struct.ce_module* %0, i64 0, i32 0, i32 0
  %7 = getelementptr inbounds %struct.ce_flow, %struct.ce_flow* %1, i64 0, i32 0, i32 0, i32 0
  %8 = getelementptr inbounds %struct.ce_flow, %struct.ce_flow* %1, i64 0, i32 0, i32 0, i32 1
  %.pre = load i16, i16* %5, align 8, !dbg !157
  br label %9, !dbg !156

9:                                                ; preds = %.lr.ph17, %.loopexit
  %10 = phi i16 [ %.pre, %.lr.ph17 ], [ %100, %.loopexit ]
  %11 = phi i16 [ %.pre, %.lr.ph17 ], [ %101, %.loopexit ], !dbg !157
  %.0116 = phi i16 [ %2, %.lr.ph17 ], [ %102, %.loopexit ]
  call void @llvm.dbg.value(metadata i16 %.0116, metadata !152, metadata !DIExpression()), !dbg !146
  %12 = zext i16 %.0116 to i32, !dbg !160
  %13 = add nuw nsw i32 %12, 2, !dbg !161
  %14 = zext i16 %11 to i32, !dbg !162
  %.not = icmp ult i32 %13, %14, !dbg !163
  br i1 %.not, label %15, label %.loopexit10, !dbg !164

15:                                               ; preds = %9
  %16 = load i8*, i8** %6, align 8, !dbg !165
  %17 = zext i16 %.0116 to i64, !dbg !167
  %18 = getelementptr inbounds i8, i8* %16, i64 %17, !dbg !167
  %19 = load i8, i8* %18, align 1, !dbg !167
  %20 = icmp eq i8 %19, 85, !dbg !168
  br i1 %20, label %21, label %.loopexit, !dbg !169

21:                                               ; preds = %15
  %22 = add nuw nsw i64 %17, 1, !dbg !170
  %23 = getelementptr inbounds i8, i8* %16, i64 %22, !dbg !171
  %24 = load i8, i8* %23, align 1, !dbg !171
  %25 = icmp eq i8 %24, 29, !dbg !172
  br i1 %25, label %26, label %.loopexit, !dbg !173

26:                                               ; preds = %21
  %27 = add nuw nsw i64 %17, 2, !dbg !174
  %28 = getelementptr inbounds i8, i8* %16, i64 %27, !dbg !175
  %29 = load i8, i8* %28, align 1, !dbg !175
  %30 = icmp eq i8 %29, 17, !dbg !176
  br i1 %30, label %31, label %.loopexit, !dbg !177

31:                                               ; preds = %26
  %32 = add i16 %.0116, 3, !dbg !178
  call void @llvm.dbg.value(metadata i16 %32, metadata !152, metadata !DIExpression()), !dbg !146
  %.not2 = icmp ult i16 %32, %11, !dbg !180
  br i1 %.not2, label %33, label %.loopexit10, !dbg !182

33:                                               ; preds = %31
  %34 = zext i16 %32 to i64, !dbg !183
  %35 = getelementptr inbounds i8, i8* %16, i64 %34, !dbg !183
  %36 = load i8, i8* %35, align 1, !dbg !183
  %37 = icmp eq i8 %36, 4, !dbg !185
  %.1.v = select i1 %37, i16 4, i16 7, !dbg !186
  %.1 = add i16 %.1.v, %.0116, !dbg !186
  call void @llvm.dbg.value(metadata i16 %.1, metadata !152, metadata !DIExpression()), !dbg !146
  %.not3 = icmp ult i16 %.1, %11, !dbg !187
  br i1 %.not3, label %38, label %.loopexit10, !dbg !189

38:                                               ; preds = %33
  %39 = zext i16 %.1 to i64, !dbg !190
  %40 = getelementptr inbounds i8, i8* %16, i64 %39, !dbg !190
  %41 = load i8, i8* %40, align 1, !dbg !190
  %42 = and i8 %41, 127, !dbg !191
  %.not4.inv = icmp slt i8 %41, 0, !dbg !191
  %narrow = select i1 %.not4.inv, i8 %42, i8 0, !dbg !191
  %43 = zext i8 %narrow to i16, !dbg !191
  %44 = add i16 %.1, %43, !dbg !192
  call void @llvm.dbg.value(metadata i16 %44, metadata !152, metadata !DIExpression()), !dbg !146
  %.not5 = icmp ult i16 %44, %11, !dbg !193
  br i1 %.not5, label %45, label %.loopexit10, !dbg !195

45:                                               ; preds = %38
  %46 = add i16 %44, 2, !dbg !196
  call void @llvm.dbg.value(metadata i16 %46, metadata !152, metadata !DIExpression()), !dbg !146
  %.not6 = icmp ult i16 %46, %11, !dbg !197
  br i1 %.not6, label %47, label %.loopexit10, !dbg !199

47:                                               ; preds = %45
  %48 = zext i16 %46 to i64, !dbg !200
  %49 = getelementptr inbounds i8, i8* %16, i64 %48, !dbg !200
  %50 = load i8, i8* %49, align 1, !dbg !200
  %51 = and i8 %50, 127, !dbg !201
  %.not7.inv = icmp slt i8 %50, 0, !dbg !201
  %narrow1 = select i1 %.not7.inv, i8 %51, i8 0, !dbg !201
  %52 = zext i8 %narrow1 to i16, !dbg !201
  call void @llvm.dbg.value(metadata i16 undef, metadata !152, metadata !DIExpression()), !dbg !146
  %53 = add i16 %44, 3, !dbg !202
  %54 = add i16 %53, %52, !dbg !203
  call void @llvm.dbg.value(metadata i16 %54, metadata !152, metadata !DIExpression()), !dbg !146
  %55 = icmp ult i16 %54, %10, !dbg !204
  br i1 %55, label %.lr.ph, label %.loopexit, !dbg !205

.lr.ph:                                           ; preds = %47, %._crit_edge
  %56 = phi i8* [ %.pre25, %._crit_edge ], [ %16, %47 ], !dbg !206
  %57 = phi i16 [ %98, %._crit_edge ], [ %10, %47 ]
  %.213 = phi i16 [ %97, %._crit_edge ], [ %54, %47 ]
  call void @llvm.dbg.value(metadata i16 %.213, metadata !152, metadata !DIExpression()), !dbg !146
  %58 = zext i16 %.213 to i64, !dbg !208
  %59 = getelementptr inbounds i8, i8* %56, i64 %58, !dbg !208
  %60 = load i8, i8* %59, align 1, !dbg !208
  call void @llvm.dbg.value(metadata i8 %60, metadata !209, metadata !DIExpression()), !dbg !210
  switch i8 %60, label %.loopexit [
    i8 -127, label %61
    i8 -126, label %61
    i8 -121, label %61
  ], !dbg !211

61:                                               ; preds = %.lr.ph, %.lr.ph, %.lr.ph
  %62 = zext i16 %.213 to i32, !dbg !213
  %63 = add nuw nsw i32 %62, 1, !dbg !216
  %64 = zext i16 %57 to i32, !dbg !217
  %.not8 = icmp ult i32 %63, %64, !dbg !218
  br i1 %.not8, label %65, label %.loopexit10, !dbg !219

65:                                               ; preds = %61
  %66 = add nuw nsw i64 %58, 1, !dbg !220
  %67 = getelementptr inbounds i8, i8* %56, i64 %66, !dbg !221
  %68 = load i8, i8* %67, align 1, !dbg !221
  call void @llvm.dbg.value(metadata i8 %68, metadata !222, metadata !DIExpression()), !dbg !223
  %69 = add nsw i32 %64, -1, !dbg !224
  %70 = icmp sgt i32 %69, %62, !dbg !226
  br i1 %70, label %71, label %.loopexit10, !dbg !227

71:                                               ; preds = %65
  %72 = zext i8 %68 to i32, !dbg !228
  %73 = add nuw nsw i32 %62, 2, !dbg !229
  %74 = add nuw nsw i32 %73, %72, !dbg !230
  %75 = icmp ult i32 %74, %64, !dbg !231
  br i1 %75, label %76, label %.loopexit10, !dbg !232

76:                                               ; preds = %71
  %77 = add i16 %.213, 2, !dbg !233
  call void @llvm.dbg.value(metadata i16 %77, metadata !152, metadata !DIExpression()), !dbg !146
  %78 = icmp eq i8 %68, 0, !dbg !234
  br i1 %78, label %.loopexit10, label %79, !dbg !236

79:                                               ; preds = %76
  %80 = zext i16 %77 to i32, !dbg !237
  %81 = add nuw nsw i32 %72, %80, !dbg !239
  %82 = icmp ugt i32 %81, %64, !dbg !240
  br i1 %82, label %.loopexit10, label %83, !dbg !241

83:                                               ; preds = %79
  call void @llvm.dbg.value(metadata i8 %68, metadata !242, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !223
  %84 = load i8*, i8** %7, align 8, !dbg !243
  %.not9 = icmp eq i8* %84, null, !dbg !245
  br i1 %.not9, label %94, label %85, !dbg !246

85:                                               ; preds = %83
  %86 = load i16, i16* %8, align 8, !dbg !247
  %87 = zext i16 %86 to i32, !dbg !250
  %88 = add nuw nsw i32 %87, %72, !dbg !251
  %89 = icmp ugt i32 %88, 65534, !dbg !252
  br i1 %89, label %.loopexit10, label %90, !dbg !253

90:                                               ; preds = %85
  %91 = zext i8 %68 to i16, !dbg !254
  %92 = add nuw nsw i16 %91, 1, !dbg !255
  %93 = add i16 %92, %86, !dbg !256
  br label %96, !dbg !257

94:                                               ; preds = %83
  %95 = zext i8 %68 to i16, !dbg !258
  call void @llvm.dbg.value(metadata i16 %95, metadata !242, metadata !DIExpression()), !dbg !223
  store i8* inttoptr (i64 1 to i8*), i8** %7, align 8, !dbg !259
  br label %96

96:                                               ; preds = %94, %90
  %storemerge = phi i16 [ %93, %90 ], [ %95, %94 ], !dbg !261
  %.pre-phi = phi i16 [ %91, %90 ], [ %95, %94 ], !dbg !262
  store i16 %storemerge, i16* %8, align 8, !dbg !261
  %97 = add i16 %77, %.pre-phi, !dbg !263
  call void @llvm.dbg.value(metadata i16 %97, metadata !152, metadata !DIExpression()), !dbg !146
  %98 = load i16, i16* %5, align 8, !dbg !264
  %99 = icmp ult i16 %97, %98, !dbg !204
  br i1 %99, label %._crit_edge, label %.loopexit, !dbg !205, !llvm.loop !265

._crit_edge:                                      ; preds = %96
  %.pre25 = load i8*, i8** %6, align 8, !dbg !206
  br label %.lr.ph, !dbg !205

.loopexit:                                        ; preds = %96, %.lr.ph, %47, %15, %21, %26
  %100 = phi i16 [ %10, %26 ], [ %10, %21 ], [ %10, %15 ], [ %10, %47 ], [ %57, %.lr.ph ], [ %98, %96 ]
  %101 = phi i16 [ %11, %26 ], [ %11, %21 ], [ %11, %15 ], [ %10, %47 ], [ %57, %.lr.ph ], [ %98, %96 ]
  %.3 = phi i16 [ %.0116, %26 ], [ %.0116, %21 ], [ %.0116, %15 ], [ %54, %47 ], [ %.213, %.lr.ph ], [ %97, %96 ], !dbg !268
  call void @llvm.dbg.value(metadata i16 %.3, metadata !152, metadata !DIExpression()), !dbg !146
  %102 = add i16 %.3, 1, !dbg !269
  call void @llvm.dbg.value(metadata i16 %102, metadata !152, metadata !DIExpression()), !dbg !146
  %103 = icmp ult i16 %102, 256, !dbg !153
  br i1 %103, label %9, label %.loopexit10, !dbg !156, !llvm.loop !270

.loopexit10:                                      ; preds = %9, %31, %33, %38, %45, %.loopexit, %85, %79, %76, %65, %71, %61, %3
  %.0 = phi i32 [ 0, %3 ], [ 0, %61 ], [ 0, %71 ], [ 0, %65 ], [ 0, %76 ], [ 0, %79 ], [ 1, %85 ], [ 0, %.loopexit ], [ 0, %45 ], [ 0, %38 ], [ 0, %33 ], [ 0, %31 ], [ 0, %9 ], !dbg !146
  ret i32 %.0, !dbg !272
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readnone uwtable willreturn
define internal fastcc i32 @predicate_printable_string_oob_read(i8* readnone %0, i64 %1) unnamed_addr #5 !dbg !273 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !277, metadata !DIExpression()), !dbg !278
  call void @llvm.dbg.value(metadata i64 %1, metadata !279, metadata !DIExpression()), !dbg !278
  call void @llvm.dbg.value(metadata i64 256, metadata !280, metadata !DIExpression()), !dbg !278
  %3 = icmp ne i8* %0, null, !dbg !281
  %4 = icmp ne i64 %1, 0
  %or.cond = select i1 %3, i1 %4, i1 false, !dbg !283
  %5 = icmp ugt i64 %1, 256, !dbg !283
  %narrow = select i1 %or.cond, i1 %5, i1 false, !dbg !283
  %.0 = zext i1 %narrow to i32, !dbg !283
  ret i32 %.0, !dbg !284
}

; Function Attrs: nofree noinline norecurse nosync nounwind uwtable writeonly
define dso_local i8* @memset(i8* returned %0, i32 %1, i64 %2) local_unnamed_addr #6 !dbg !285 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !289, metadata !DIExpression()), !dbg !290
  call void @llvm.dbg.value(metadata i32 %1, metadata !291, metadata !DIExpression()), !dbg !290
  call void @llvm.dbg.value(metadata i64 %2, metadata !292, metadata !DIExpression()), !dbg !290
  call void @llvm.dbg.value(metadata i8* %0, metadata !293, metadata !DIExpression()), !dbg !290
  call void @llvm.dbg.value(metadata i64 %2, metadata !292, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !290
  %.not2 = icmp eq i64 %2, 0, !dbg !294
  br i1 %.not2, label %._crit_edge, label %.lr.ph, !dbg !295

.lr.ph:                                           ; preds = %3
  %4 = trunc i32 %1 to i8
  br label %5, !dbg !295

5:                                                ; preds = %.lr.ph, %5
  %.04 = phi i8* [ %0, %.lr.ph ], [ %7, %5 ]
  %.013 = phi i64 [ %2, %.lr.ph ], [ %6, %5 ]
  call void @llvm.dbg.value(metadata i8* %.04, metadata !293, metadata !DIExpression()), !dbg !290
  call void @llvm.dbg.value(metadata i64 %.013, metadata !292, metadata !DIExpression()), !dbg !290
  %6 = add i64 %.013, -1, !dbg !296
  call void @llvm.dbg.value(metadata i64 %6, metadata !292, metadata !DIExpression()), !dbg !290
  %7 = getelementptr inbounds i8, i8* %.04, i64 1, !dbg !297
  call void @llvm.dbg.value(metadata i8* %7, metadata !293, metadata !DIExpression()), !dbg !290
  store i8 %4, i8* %.04, align 1, !dbg !298
  call void @llvm.dbg.value(metadata i64 %6, metadata !292, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !290
  %.not = icmp eq i64 %6, 0, !dbg !294
  br i1 %.not, label %._crit_edge, label %5, !dbg !295, !llvm.loop !299

._crit_edge:                                      ; preds = %5, %3
  ret i8* %0, !dbg !301
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline noreturn nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree noinline norecurse nosync nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree noinline norecurse nosync nounwind readnone uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree noinline norecurse nosync nounwind uwtable writeonly "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!7, !19, !35, !38}
!llvm.ident = !{!40, !40, !40, !40}
!llvm.module.flags = !{!41, !42, !43, !44, !45}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "existing_names", scope: !2, file: !3, line: 44, type: !16, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 31, type: !4, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!3 = !DIFile(filename: "driver_cert-elements-oob-write_printable-string-oob-read.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!4 = !DISubroutineType(types: !5)
!5 = !{!6}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, retainedTypes: !9, globals: !15, splitDebugInlining: false, nameTableKind: None)
!8 = !{}
!9 = !{!10, !13}
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !11, line: 46, baseType: !12)
!11 = !DIFile(filename: "/usr/lib/llvm-13/lib/clang/13.0.1/include/stddef.h", directory: "")
!12 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !{!0}
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 8, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 1)
!19 = distinct !DICompileUnit(language: DW_LANG_C99, file: !20, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, retainedTypes: !21, splitDebugInlining: false, nameTableKind: None)
!20 = !DIFile(filename: "predicate_cert-elements-oob-write.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!21 = !{!22, !28, !29, !13, !33}
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int32_t", file: !20, line: 28, baseType: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !24, line: 26, baseType: !25)
!24 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !26, line: 42, baseType: !27)
!26 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!27 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int16_t", file: !20, line: 27, baseType: !30)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !24, line: 25, baseType: !31)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !26, line: 40, baseType: !32)
!32 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !34, line: 79, baseType: !12)
!34 = !DIFile(filename: "/usr/include/stdint.h", directory: "")
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, retainedTypes: !37, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "predicate_printable-string-oob-read.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!37 = !{!28}
!38 = distinct !DICompileUnit(language: DW_LANG_C99, file: !39, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, splitDebugInlining: false, nameTableKind: None)
!39 = !DIFile(filename: "/home/wcontrerasmartinez/klee/runtime/Freestanding/memset.c", directory: "/home/wcontrerasmartinez/klee/build/runtime/Freestanding")
!40 = !{!"Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8"}
!41 = !{i32 7, !"Dwarf Version", i32 4}
!42 = !{i32 2, !"Debug Info Version", i32 3}
!43 = !{i32 1, !"wchar_size", i32 4}
!44 = !{i32 7, !"uwtable", i32 1}
!45 = !{i32 7, !"frame-pointer", i32 2}
!46 = !DILocalVariable(name: "buf", scope: !2, file: !3, line: 32, type: !47)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !48, size: 2048, elements: !51)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !24, line: 24, baseType: !49)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !26, line: 38, baseType: !50)
!50 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!51 = !{!52}
!52 = !DISubrange(count: 256)
!53 = !DILocation(line: 32, column: 11, scope: !2)
!54 = !DILocation(line: 33, column: 22, scope: !2)
!55 = !DILocation(line: 33, column: 3, scope: !2)
!56 = !DILocalVariable(name: "ce_mod", scope: !2, file: !3, line: 36, type: !57)
!57 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_module", file: !3, line: 25, size: 128, elements: !58)
!58 = !{!59}
!59 = !DIDerivedType(tag: DW_TAG_member, name: "packet", scope: !57, file: !3, line: 25, baseType: !60, size: 128)
!60 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_packet", file: !3, line: 24, size: 128, elements: !61)
!61 = !{!62, !65}
!62 = !DIDerivedType(tag: DW_TAG_member, name: "payload", scope: !60, file: !3, line: 24, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !48)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "payload_packet_len", scope: !60, file: !3, line: 24, baseType: !30, size: 16, offset: 64)
!66 = !DILocation(line: 36, column: 20, scope: !2)
!67 = !DILocalVariable(name: "ce_flow", scope: !2, file: !3, line: 37, type: !68)
!68 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_flow", file: !3, line: 23, size: 128, elements: !69)
!69 = !{!70}
!70 = !DIDerivedType(tag: DW_TAG_member, name: "protos", scope: !68, file: !3, line: 23, baseType: !71, size: 128)
!71 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !68, file: !3, line: 23, size: 128, elements: !72)
!72 = !{!73}
!73 = !DIDerivedType(tag: DW_TAG_member, name: "tls_quic", scope: !71, file: !3, line: 23, baseType: !74, size: 128)
!74 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_tls_quic", file: !3, line: 22, size: 128, elements: !75)
!75 = !{!76, !77}
!76 = !DIDerivedType(tag: DW_TAG_member, name: "server_names", scope: !74, file: !3, line: 22, baseType: !13, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "server_names_len", scope: !74, file: !3, line: 22, baseType: !30, size: 16, offset: 64)
!78 = !DILocation(line: 37, column: 20, scope: !2)
!79 = !DILocation(line: 38, column: 3, scope: !2)
!80 = !DILocation(line: 39, column: 3, scope: !2)
!81 = !DILocation(line: 41, column: 17, scope: !2)
!82 = !DILocation(line: 41, column: 36, scope: !2)
!83 = !DILocation(line: 45, column: 27, scope: !2)
!84 = !DILocation(line: 45, column: 40, scope: !2)
!85 = !DILocation(line: 48, column: 22, scope: !2)
!86 = !DILocalVariable(name: "srv_len", scope: !2, file: !3, line: 47, type: !30)
!87 = !DILocation(line: 0, scope: !2)
!88 = !DILocation(line: 48, column: 3, scope: !2)
!89 = !DILocation(line: 49, column: 15, scope: !2)
!90 = !DILocation(line: 49, column: 23, scope: !2)
!91 = !DILocation(line: 49, column: 3, scope: !2)
!92 = !DILocation(line: 50, column: 46, scope: !2)
!93 = !DILocation(line: 50, column: 44, scope: !2)
!94 = !DILocation(line: 53, column: 22, scope: !2)
!95 = !DILocalVariable(name: "p_offset", scope: !2, file: !3, line: 52, type: !30)
!96 = !DILocation(line: 53, column: 3, scope: !2)
!97 = !DILocation(line: 54, column: 15, scope: !2)
!98 = !DILocation(line: 54, column: 24, scope: !2)
!99 = !DILocation(line: 54, column: 3, scope: !2)
!100 = !DILocation(line: 59, column: 22, scope: !2)
!101 = !DILocalVariable(name: "ps_len", scope: !2, file: !3, line: 58, type: !10)
!102 = !DILocation(line: 59, column: 3, scope: !2)
!103 = !DILocation(line: 60, column: 15, scope: !2)
!104 = !DILocation(line: 60, column: 22, scope: !2)
!105 = !DILocation(line: 60, column: 3, scope: !2)
!106 = !DILocation(line: 61, column: 15, scope: !2)
!107 = !DILocation(line: 61, column: 22, scope: !2)
!108 = !DILocation(line: 61, column: 3, scope: !2)
!109 = !DILocation(line: 64, column: 49, scope: !2)
!110 = !DILocation(line: 63, column: 14, scope: !2)
!111 = !DILocalVariable(name: "r_ce", scope: !2, file: !3, line: 63, type: !6)
!112 = !DILocation(line: 65, column: 63, scope: !2)
!113 = !DILocation(line: 65, column: 14, scope: !2)
!114 = !DILocalVariable(name: "r_ps", scope: !2, file: !3, line: 65, type: !6)
!115 = !DILocation(line: 67, column: 20, scope: !2)
!116 = !DILocation(line: 67, column: 25, scope: !2)
!117 = !DILocation(line: 67, column: 15, scope: !2)
!118 = !DILocation(line: 67, column: 3, scope: !2)
!119 = !DILocation(line: 68, column: 3, scope: !2)
!120 = distinct !DISubprogram(name: "predicate_cert_elements_oob_write", scope: !20, file: !20, line: 49, type: !121, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !8)
!121 = !DISubroutineType(types: !122)
!122 = !{!6, !123, !134, !29, !29}
!123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !124, size: 64)
!124 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_module", file: !20, line: 45, size: 128, elements: !125)
!125 = !{!126}
!126 = !DIDerivedType(tag: DW_TAG_member, name: "packet", scope: !124, file: !20, line: 46, baseType: !127, size: 128)
!127 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_packet", file: !20, line: 40, size: 128, elements: !128)
!128 = !{!129, !133}
!129 = !DIDerivedType(tag: DW_TAG_member, name: "payload", scope: !127, file: !20, line: 41, baseType: !130, size: 64)
!130 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !131, size: 64)
!131 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !132)
!132 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int8_t", file: !20, line: 26, baseType: !48)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "payload_packet_len", scope: !127, file: !20, line: 42, baseType: !29, size: 16, offset: 64)
!134 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !135, size: 64)
!135 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_flow", file: !20, line: 36, size: 128, elements: !136)
!136 = !{!137}
!137 = !DIDerivedType(tag: DW_TAG_member, name: "protos", scope: !135, file: !20, line: 37, baseType: !138, size: 128)
!138 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !135, file: !20, line: 37, size: 128, elements: !139)
!139 = !{!140}
!140 = !DIDerivedType(tag: DW_TAG_member, name: "tls_quic", scope: !138, file: !20, line: 37, baseType: !141, size: 128)
!141 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_tls_quic", file: !20, line: 31, size: 128, elements: !142)
!142 = !{!143, !144}
!143 = !DIDerivedType(tag: DW_TAG_member, name: "server_names", scope: !141, file: !20, line: 32, baseType: !13, size: 64)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "server_names_len", scope: !141, file: !20, line: 33, baseType: !29, size: 16, offset: 64)
!145 = !DILocalVariable(name: "ndpi_struct", arg: 1, scope: !120, file: !20, line: 50, type: !123)
!146 = !DILocation(line: 0, scope: !120)
!147 = !DILocalVariable(name: "flow", arg: 2, scope: !120, file: !20, line: 51, type: !134)
!148 = !DILocalVariable(name: "p_offset", arg: 3, scope: !120, file: !20, line: 52, type: !29)
!149 = !DILocalVariable(name: "certificate_len", arg: 4, scope: !120, file: !20, line: 53, type: !29)
!150 = !DILocalVariable(name: "packet", scope: !120, file: !20, line: 55, type: !151)
!151 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !127, size: 64)
!152 = !DILocalVariable(name: "i", scope: !120, file: !20, line: 56, type: !29)
!153 = !DILocation(line: 58, column: 24, scope: !154)
!154 = distinct !DILexicalBlock(scope: !155, file: !20, line: 58, column: 3)
!155 = distinct !DILexicalBlock(scope: !120, file: !20, line: 58, column: 3)
!156 = !DILocation(line: 58, column: 3, scope: !155)
!157 = !DILocation(line: 60, column: 37, scope: !158)
!158 = distinct !DILexicalBlock(scope: !159, file: !20, line: 60, column: 9)
!159 = distinct !DILexicalBlock(scope: !154, file: !20, line: 58, column: 48)
!160 = !DILocation(line: 60, column: 9, scope: !158)
!161 = !DILocation(line: 60, column: 22, scope: !158)
!162 = !DILocation(line: 60, column: 29, scope: !158)
!163 = !DILocation(line: 60, column: 26, scope: !158)
!164 = !DILocation(line: 60, column: 9, scope: !159)
!165 = !DILocation(line: 62, column: 18, scope: !166)
!166 = distinct !DILexicalBlock(scope: !159, file: !20, line: 62, column: 9)
!167 = !DILocation(line: 62, column: 10, scope: !166)
!168 = !DILocation(line: 62, column: 31, scope: !166)
!169 = !DILocation(line: 62, column: 40, scope: !166)
!170 = !DILocation(line: 63, column: 27, scope: !166)
!171 = !DILocation(line: 63, column: 10, scope: !166)
!172 = !DILocation(line: 63, column: 31, scope: !166)
!173 = !DILocation(line: 63, column: 40, scope: !166)
!174 = !DILocation(line: 64, column: 27, scope: !166)
!175 = !DILocation(line: 64, column: 10, scope: !166)
!176 = !DILocation(line: 64, column: 31, scope: !166)
!177 = !DILocation(line: 62, column: 9, scope: !159)
!178 = !DILocation(line: 67, column: 9, scope: !179)
!179 = distinct !DILexicalBlock(scope: !166, file: !20, line: 64, column: 41)
!180 = !DILocation(line: 68, column: 13, scope: !181)
!181 = distinct !DILexicalBlock(scope: !179, file: !20, line: 68, column: 11)
!182 = !DILocation(line: 68, column: 11, scope: !179)
!183 = !DILocation(line: 71, column: 11, scope: !184)
!184 = distinct !DILexicalBlock(scope: !179, file: !20, line: 71, column: 11)
!185 = !DILocation(line: 71, column: 30, scope: !184)
!186 = !DILocation(line: 71, column: 11, scope: !179)
!187 = !DILocation(line: 73, column: 13, scope: !188)
!188 = distinct !DILexicalBlock(scope: !179, file: !20, line: 73, column: 11)
!189 = !DILocation(line: 73, column: 11, scope: !179)
!190 = !DILocation(line: 76, column: 13, scope: !179)
!191 = !DILocation(line: 76, column: 12, scope: !179)
!192 = !DILocation(line: 76, column: 9, scope: !179)
!193 = !DILocation(line: 77, column: 13, scope: !194)
!194 = distinct !DILexicalBlock(scope: !179, file: !20, line: 77, column: 11)
!195 = !DILocation(line: 77, column: 11, scope: !179)
!196 = !DILocation(line: 79, column: 9, scope: !179)
!197 = !DILocation(line: 80, column: 13, scope: !198)
!198 = distinct !DILexicalBlock(scope: !179, file: !20, line: 80, column: 11)
!199 = !DILocation(line: 80, column: 11, scope: !179)
!200 = !DILocation(line: 83, column: 13, scope: !179)
!201 = !DILocation(line: 83, column: 12, scope: !179)
!202 = !DILocation(line: 83, column: 9, scope: !179)
!203 = !DILocation(line: 84, column: 8, scope: !179)
!204 = !DILocation(line: 86, column: 16, scope: !179)
!205 = !DILocation(line: 86, column: 7, scope: !179)
!206 = !DILocation(line: 87, column: 36, scope: !207)
!207 = distinct !DILexicalBlock(scope: !179, file: !20, line: 86, column: 46)
!208 = !DILocation(line: 87, column: 28, scope: !207)
!209 = !DILocalVariable(name: "gn_type", scope: !207, file: !20, line: 87, type: !132)
!210 = !DILocation(line: 0, scope: !207)
!211 = !DILocation(line: 89, column: 29, scope: !212)
!212 = distinct !DILexicalBlock(scope: !207, file: !20, line: 89, column: 13)
!213 = !DILocation(line: 91, column: 15, scope: !214)
!214 = distinct !DILexicalBlock(scope: !215, file: !20, line: 91, column: 15)
!215 = distinct !DILexicalBlock(scope: !212, file: !20, line: 89, column: 68)
!216 = !DILocation(line: 91, column: 17, scope: !214)
!217 = !DILocation(line: 91, column: 24, scope: !214)
!218 = !DILocation(line: 91, column: 21, scope: !214)
!219 = !DILocation(line: 91, column: 15, scope: !215)
!220 = !DILocation(line: 93, column: 50, scope: !215)
!221 = !DILocation(line: 93, column: 32, scope: !215)
!222 = !DILocalVariable(name: "len", scope: !215, file: !20, line: 93, type: !132)
!223 = !DILocation(line: 0, scope: !215)
!224 = !DILocation(line: 97, column: 50, scope: !225)
!225 = distinct !DILexicalBlock(scope: !215, file: !20, line: 97, column: 15)
!226 = !DILocation(line: 97, column: 20, scope: !225)
!227 = !DILocation(line: 97, column: 56, scope: !225)
!228 = !DILocation(line: 98, column: 34, scope: !225)
!229 = !DILocation(line: 98, column: 32, scope: !225)
!230 = !DILocation(line: 98, column: 38, scope: !225)
!231 = !DILocation(line: 98, column: 43, scope: !225)
!232 = !DILocation(line: 97, column: 15, scope: !215)
!233 = !DILocation(line: 101, column: 13, scope: !215)
!234 = !DILocation(line: 102, column: 19, scope: !235)
!235 = distinct !DILexicalBlock(scope: !215, file: !20, line: 102, column: 15)
!236 = !DILocation(line: 102, column: 15, scope: !215)
!237 = !DILocation(line: 105, column: 15, scope: !238)
!238 = distinct !DILexicalBlock(scope: !215, file: !20, line: 105, column: 15)
!239 = !DILocation(line: 105, column: 28, scope: !238)
!240 = !DILocation(line: 105, column: 34, scope: !238)
!241 = !DILocation(line: 105, column: 15, scope: !215)
!242 = !DILocalVariable(name: "dNSName_len", scope: !215, file: !20, line: 94, type: !29)
!243 = !DILocation(line: 110, column: 37, scope: !244)
!244 = distinct !DILexicalBlock(scope: !215, file: !20, line: 110, column: 15)
!245 = !DILocation(line: 110, column: 50, scope: !244)
!246 = !DILocation(line: 110, column: 15, scope: !215)
!247 = !DILocation(line: 112, column: 50, scope: !248)
!248 = distinct !DILexicalBlock(scope: !249, file: !20, line: 112, column: 17)
!249 = distinct !DILexicalBlock(scope: !244, file: !20, line: 110, column: 59)
!250 = !DILocation(line: 112, column: 17, scope: !248)
!251 = !DILocation(line: 112, column: 67, scope: !248)
!252 = !DILocation(line: 113, column: 45, scope: !248)
!253 = !DILocation(line: 112, column: 17, scope: !249)
!254 = !DILocation(line: 117, column: 68, scope: !249)
!255 = !DILocation(line: 117, column: 66, scope: !249)
!256 = !DILocation(line: 117, column: 80, scope: !249)
!257 = !DILocation(line: 118, column: 11, scope: !249)
!258 = !DILocation(line: 108, column: 25, scope: !215)
!259 = !DILocation(line: 119, column: 52, scope: !260)
!260 = distinct !DILexicalBlock(scope: !244, file: !20, line: 118, column: 18)
!261 = !DILocation(line: 0, scope: !244)
!262 = !DILocation(line: 123, column: 16, scope: !215)
!263 = !DILocation(line: 123, column: 13, scope: !215)
!264 = !DILocation(line: 86, column: 26, scope: !179)
!265 = distinct !{!265, !205, !266, !267}
!266 = !DILocation(line: 127, column: 7, scope: !179)
!267 = !{!"llvm.loop.mustprogress"}
!268 = !DILocation(line: 0, scope: !155)
!269 = !DILocation(line: 58, column: 44, scope: !154)
!270 = distinct !{!270, !156, !271, !267}
!271 = !DILocation(line: 129, column: 3, scope: !155)
!272 = !DILocation(line: 131, column: 1, scope: !120)
!273 = distinct !DISubprogram(name: "predicate_printable_string_oob_read", scope: !36, file: !36, line: 20, type: !274, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !35, retainedNodes: !8)
!274 = !DISubroutineType(types: !275)
!275 = !{!6, !276, !10, !10}
!276 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!277 = !DILocalVariable(name: "str", arg: 1, scope: !273, file: !36, line: 20, type: !276)
!278 = !DILocation(line: 0, scope: !273)
!279 = !DILocalVariable(name: "len", arg: 2, scope: !273, file: !36, line: 20, type: !10)
!280 = !DILocalVariable(name: "buf_size", arg: 3, scope: !273, file: !36, line: 21, type: !10)
!281 = !DILocation(line: 23, column: 11, scope: !282)
!282 = distinct !DILexicalBlock(scope: !273, file: !36, line: 23, column: 7)
!283 = !DILocation(line: 23, column: 7, scope: !273)
!284 = !DILocation(line: 33, column: 1, scope: !273)
!285 = distinct !DISubprogram(name: "memset", scope: !286, file: !286, line: 12, type: !287, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !8)
!286 = !DIFile(filename: "runtime/Freestanding/memset.c", directory: "/home/wcontrerasmartinez/klee")
!287 = !DISubroutineType(types: !288)
!288 = !{!28, !28, !6, !10}
!289 = !DILocalVariable(name: "dst", arg: 1, scope: !285, file: !286, line: 12, type: !28)
!290 = !DILocation(line: 0, scope: !285)
!291 = !DILocalVariable(name: "s", arg: 2, scope: !285, file: !286, line: 12, type: !6)
!292 = !DILocalVariable(name: "count", arg: 3, scope: !285, file: !286, line: 12, type: !10)
!293 = !DILocalVariable(name: "a", scope: !285, file: !286, line: 13, type: !13)
!294 = !DILocation(line: 14, column: 18, scope: !285)
!295 = !DILocation(line: 14, column: 3, scope: !285)
!296 = !DILocation(line: 14, column: 15, scope: !285)
!297 = !DILocation(line: 15, column: 7, scope: !285)
!298 = !DILocation(line: 15, column: 10, scope: !285)
!299 = distinct !{!299, !295, !300, !267}
!300 = !DILocation(line: 15, column: 12, scope: !285)
!301 = !DILocation(line: 16, column: 3, scope: !285)
