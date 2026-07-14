; ModuleID = 'linked_strncasestr-oob-read_serializer-int32-oob-write.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ser_private = type { %struct.ser_status, %struct.ser_buffer, i32, [2 x i8] }
%struct.ser_status = type { i32, %struct.ser_buf_status }
%struct.ser_buf_status = type { i32 }
%struct.ser_buffer = type { i32, i8* }
%struct.ser_serializer = type { [32 x i8] }

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"needle\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"size_used\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"value\00", align 1
@.str.5 = private unnamed_addr constant [68 x i8] c"0 && \22REACHED_BOTH_strncasestr-oob-read_serializer-int32-oob-write\22\00", align 1
@.str.6 = private unnamed_addr constant [57 x i8] c"driver_strncasestr-oob-read_serializer-int32-oob-write.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [15 x i8] c"int main(void)\00", align 1

; Function Attrs: noinline noreturn nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !76 {
  %1 = alloca [256 x i8], align 16
  %2 = alloca [258 x i8], align 16
  %3 = alloca %struct.ser_private, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [256 x i8]* %1, metadata !80, metadata !DIExpression()), !dbg !84
  %6 = getelementptr inbounds [256 x i8], [256 x i8]* %1, i64 0, i64 0, !dbg !85
  call void @klee_make_symbolic(i8* nonnull %6, i64 256, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)) #9, !dbg !86
  call void @llvm.dbg.declare(metadata [258 x i8]* %2, metadata !87, metadata !DIExpression()), !dbg !91
  %7 = getelementptr inbounds [258 x i8], [258 x i8]* %2, i64 0, i64 0, !dbg !92
  call void @klee_make_symbolic(i8* nonnull %7, i64 258, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)) #9, !dbg !93
  %8 = getelementptr inbounds [258 x i8], [258 x i8]* %2, i64 0, i64 257, !dbg !94
  store i8 0, i8* %8, align 1, !dbg !95
  call void @llvm.dbg.value(metadata i32 0, metadata !96, metadata !DIExpression()), !dbg !98
  br label %9, !dbg !99

9:                                                ; preds = %0, %9
  %indvars.iv = phi i64 [ 0, %0 ], [ %indvars.iv.next, %9 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !96, metadata !DIExpression()), !dbg !98
  %10 = getelementptr inbounds [258 x i8], [258 x i8]* %2, i64 0, i64 %indvars.iv, !dbg !100
  %11 = load i8, i8* %10, align 1, !dbg !100
  %12 = icmp ne i8 %11, 0, !dbg !102
  %13 = zext i1 %12 to i64, !dbg !100
  call void @klee_assume(i64 %13) #9, !dbg !103
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !104
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !96, metadata !DIExpression()), !dbg !98
  %exitcond.not = icmp eq i64 %indvars.iv.next, 256, !dbg !105
  br i1 %exitcond.not, label %14, label %9, !dbg !99, !llvm.loop !106

14:                                               ; preds = %9
  call void @llvm.dbg.declare(metadata %struct.ser_private* %3, metadata !109, metadata !DIExpression()), !dbg !133
  %15 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %3, i64 0, i32 1, !dbg !134
  %16 = bitcast %struct.ser_buffer* %15 to i8*, !dbg !134
  %17 = call i8* @memset(i8* %16, i32 0, i64 24), !dbg !134
  %18 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %3, i64 0, i32 2, !dbg !135
  store i32 3, i32* %18, align 8, !dbg !136
  %19 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %3, i64 0, i32 1, i32 1, !dbg !137
  store i8* %6, i8** %19, align 8, !dbg !138
  %20 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %3, i64 0, i32 3, i64 0, !dbg !139
  store i8 44, i8* %20, align 4, !dbg !140
  %21 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %3, i64 0, i32 1, i32 0, !dbg !141
  store i32 256, i32* %21, align 8, !dbg !142
  %22 = bitcast i32* %4 to i8*, !dbg !143
  call void @llvm.dbg.value(metadata i32* %4, metadata !144, metadata !DIExpression(DW_OP_deref)), !dbg !145
  call void @klee_make_symbolic(i8* nonnull %22, i64 4, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i64 0, i64 0)) #9, !dbg !146
  %23 = load i32, i32* %4, align 4, !dbg !147
  call void @llvm.dbg.value(metadata i32 %23, metadata !144, metadata !DIExpression()), !dbg !145
  %24 = icmp ne i32 %23, 0, !dbg !148
  %25 = zext i1 %24 to i64, !dbg !147
  call void @klee_assume(i64 %25) #9, !dbg !149
  %26 = load i32, i32* %4, align 4, !dbg !150
  call void @llvm.dbg.value(metadata i32 %26, metadata !144, metadata !DIExpression()), !dbg !145
  %27 = add i32 %26, 11, !dbg !151
  %28 = icmp ult i32 %27, 257, !dbg !152
  %29 = zext i1 %28 to i64, !dbg !150
  call void @klee_assume(i64 %29) #9, !dbg !153
  %30 = load i32, i32* %4, align 4, !dbg !154
  call void @llvm.dbg.value(metadata i32 %30, metadata !144, metadata !DIExpression()), !dbg !145
  %31 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %3, i64 0, i32 0, i32 1, i32 0, !dbg !155
  store i32 %30, i32* %31, align 4, !dbg !156
  %32 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %3, i64 0, i32 0, i32 0, !dbg !157
  store i32 0, i32* %32, align 8, !dbg !158
  %33 = bitcast i32* %5 to i8*, !dbg !159
  call void @llvm.dbg.value(metadata i32* %5, metadata !160, metadata !DIExpression(DW_OP_deref)), !dbg !145
  call void @klee_make_symbolic(i8* nonnull %33, i64 4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0)) #9, !dbg !164
  %34 = load i32, i32* %5, align 4, !dbg !165
  call void @llvm.dbg.value(metadata i32 %34, metadata !160, metadata !DIExpression()), !dbg !145
  %35 = icmp ugt i32 %34, 999999999, !dbg !166
  %36 = zext i1 %35 to i64, !dbg !167
  call void @klee_assume(i64 %36) #9, !dbg !168
  %37 = bitcast %struct.ser_private* %3 to %struct.ser_serializer*, !dbg !169
  call void @llvm.dbg.value(metadata %struct.ser_serializer* %37, metadata !170, metadata !DIExpression()), !dbg !145
  %38 = call fastcc i32 @predicate_strncasestr_oob_read(i8* nonnull %6, i8* nonnull %7), !dbg !171
  call void @llvm.dbg.value(metadata i32 %38, metadata !172, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.value(metadata i32 undef, metadata !160, metadata !DIExpression()), !dbg !145
  %39 = call fastcc i32 @predicate_serializer_int32_oob_write(%struct.ser_serializer* nonnull %37), !dbg !173
  call void @llvm.dbg.value(metadata i32 %39, metadata !174, metadata !DIExpression()), !dbg !145
  %40 = icmp eq i32 %38, 1, !dbg !175
  %41 = icmp eq i32 %39, 1, !dbg !176
  %42 = select i1 %40, i1 %41, i1 false, !dbg !176
  %43 = zext i1 %42 to i64, !dbg !177
  call void @klee_assume(i64 %43) #9, !dbg !178
  call void @__assert_fail(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.6, i64 0, i64 0), i32 77, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #10, !dbg !179
  unreachable, !dbg !179
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) local_unnamed_addr #2

declare dso_local void @klee_assume(i64) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #3

; Function Attrs: mustprogress nofree noinline nounwind readonly uwtable willreturn
define internal fastcc i32 @predicate_strncasestr_oob_read(i8* readonly %0, i8* readonly %1) unnamed_addr #4 !dbg !180 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !186, metadata !DIExpression()), !dbg !187
  call void @llvm.dbg.value(metadata i8* %1, metadata !188, metadata !DIExpression()), !dbg !187
  call void @llvm.dbg.value(metadata i64 256, metadata !189, metadata !DIExpression()), !dbg !187
  %3 = icmp eq i8* %0, null, !dbg !190
  %4 = icmp eq i8* %1, null
  %or.cond = select i1 %3, i1 true, i1 %4, !dbg !192
  br i1 %or.cond, label %11, label %5, !dbg !192

5:                                                ; preds = %2
  call void @llvm.dbg.value(metadata i64 undef, metadata !193, metadata !DIExpression()), !dbg !187
  %6 = tail call i64 @strlen(i8* noundef nonnull dereferenceable(1) %1) #11, !dbg !194
  call void @llvm.dbg.value(metadata i64 %6, metadata !195, metadata !DIExpression()), !dbg !187
  %7 = icmp eq i64 %6, 0, !dbg !196
  br i1 %7, label %11, label %8, !dbg !198

8:                                                ; preds = %5
  %9 = tail call i64 @strnlen(i8* %0, i64 256) #11, !dbg !199
  call void @llvm.dbg.value(metadata i64 %9, metadata !193, metadata !DIExpression()), !dbg !187
  %10 = icmp ult i64 %9, %6, !dbg !200
  %. = zext i1 %10 to i32, !dbg !187
  br label %11, !dbg !187

11:                                               ; preds = %8, %5, %2
  %.0 = phi i32 [ 0, %2 ], [ 0, %5 ], [ %., %8 ], !dbg !187
  ret i32 %.0, !dbg !202
}

; Function Attrs: mustprogress nofree nounwind readonly willreturn
declare dso_local i64 @strnlen(i8*, i64) local_unnamed_addr #5

; Function Attrs: mustprogress nofree nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) local_unnamed_addr #5

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readonly uwtable willreturn
define internal fastcc i32 @predicate_serializer_int32_oob_write(%struct.ser_serializer* nocapture readonly %0) unnamed_addr #6 !dbg !203 {
  call void @llvm.dbg.value(metadata %struct.ser_serializer* %0, metadata !211, metadata !DIExpression()), !dbg !212
  call void @llvm.dbg.value(metadata i8* undef, metadata !213, metadata !DIExpression()), !dbg !212
  call void @llvm.dbg.value(metadata i32 undef, metadata !214, metadata !DIExpression()), !dbg !212
  call void @llvm.dbg.value(metadata %struct.ser_serializer* %0, metadata !215, metadata !DIExpression()), !dbg !212
  %2 = getelementptr inbounds %struct.ser_serializer, %struct.ser_serializer* %0, i64 0, i32 0, i64 24, !dbg !216
  %3 = bitcast i8* %2 to i32*, !dbg !216
  %4 = load i32, i32* %3, align 8, !dbg !216
  %.not = icmp eq i32 %4, 3, !dbg !218
  br i1 %.not, label %5, label %30, !dbg !219

5:                                                ; preds = %1
  %6 = getelementptr inbounds %struct.ser_serializer, %struct.ser_serializer* %0, i64 0, i32 0, i64 16, !dbg !220
  %7 = bitcast i8* %6 to i8**, !dbg !220
  %8 = load i8*, i8** %7, align 8, !dbg !220
  %9 = icmp eq i8* %8, null, !dbg !222
  br i1 %9, label %30, label %10, !dbg !223

10:                                               ; preds = %5
  %11 = getelementptr inbounds %struct.ser_serializer, %struct.ser_serializer* %0, i64 0, i32 0, i64 4, !dbg !224
  %12 = bitcast i8* %11 to i32*, !dbg !226
  %13 = load i32, i32* %12, align 4, !dbg !226
  %14 = getelementptr inbounds %struct.ser_serializer, %struct.ser_serializer* %0, i64 0, i32 0, i64 8, !dbg !227
  %15 = bitcast i8* %14 to i32*, !dbg !228
  %16 = load i32, i32* %15, align 8, !dbg !228
  %17 = icmp ult i32 %16, %13, !dbg !229
  %18 = sub i32 %16, %13
  %19 = icmp ult i32 %18, 11
  %or.cond6 = or i1 %17, %19, !dbg !230
  call void @llvm.dbg.value(metadata i32 %18, metadata !231, metadata !DIExpression()), !dbg !212
  call void @llvm.dbg.value(metadata i16 11, metadata !232, metadata !DIExpression()), !dbg !212
  br i1 %or.cond6, label %30, label %20, !dbg !230

20:                                               ; preds = %10
  call void @llvm.dbg.value(metadata i32 %13, metadata !237, metadata !DIExpression()), !dbg !212
  %21 = bitcast %struct.ser_serializer* %0 to i32*, !dbg !238
  %22 = load i32, i32* %21, align 8, !dbg !238
  %23 = and i32 %22, 4, !dbg !240
  %24 = icmp eq i32 %23, 0, !dbg !240
  %25 = icmp ne i32 %13, 0
  %or.cond = select i1 %24, i1 %25, i1 false, !dbg !241
  br i1 %or.cond, label %26, label %29, !dbg !241

26:                                               ; preds = %20
  %.not4 = icmp ugt i32 %16, %13, !dbg !242
  br i1 %.not4, label %27, label %30, !dbg !245

27:                                               ; preds = %26
  %28 = add i32 %13, 1, !dbg !246
  call void @llvm.dbg.value(metadata i32 %28, metadata !237, metadata !DIExpression()), !dbg !212
  br label %29, !dbg !247

29:                                               ; preds = %27, %20
  %.02 = phi i32 [ %28, %27 ], [ %13, %20 ], !dbg !212
  call void @llvm.dbg.value(metadata i32 %.02, metadata !237, metadata !DIExpression()), !dbg !212
  call void @llvm.dbg.value(metadata i16 10, metadata !232, metadata !DIExpression()), !dbg !212
  %.not3 = icmp ult i32 %.02, %16, !dbg !248
  %. = zext i1 %.not3 to i32, !dbg !212
  br label %30, !dbg !212

30:                                               ; preds = %29, %26, %10, %5, %1
  %.0 = phi i32 [ 0, %1 ], [ 0, %5 ], [ 0, %10 ], [ 0, %26 ], [ %., %29 ], !dbg !212
  ret i32 %.0, !dbg !250
}

; Function Attrs: nofree noinline norecurse nosync nounwind uwtable writeonly
define dso_local i8* @memset(i8* returned %0, i32 %1, i64 %2) local_unnamed_addr #7 !dbg !251 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !255, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata i32 %1, metadata !257, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata i64 %2, metadata !258, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata i8* %0, metadata !259, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata i64 %2, metadata !258, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !256
  %.not2 = icmp eq i64 %2, 0, !dbg !261
  br i1 %.not2, label %._crit_edge, label %.lr.ph, !dbg !262

.lr.ph:                                           ; preds = %3
  %4 = trunc i32 %1 to i8
  br label %5, !dbg !262

5:                                                ; preds = %.lr.ph, %5
  %.04 = phi i8* [ %0, %.lr.ph ], [ %7, %5 ]
  %.013 = phi i64 [ %2, %.lr.ph ], [ %6, %5 ]
  call void @llvm.dbg.value(metadata i8* %.04, metadata !259, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata i64 %.013, metadata !258, metadata !DIExpression()), !dbg !256
  %6 = add i64 %.013, -1, !dbg !263
  call void @llvm.dbg.value(metadata i64 %6, metadata !258, metadata !DIExpression()), !dbg !256
  %7 = getelementptr inbounds i8, i8* %.04, i64 1, !dbg !264
  call void @llvm.dbg.value(metadata i8* %7, metadata !259, metadata !DIExpression()), !dbg !256
  store i8 %4, i8* %.04, align 1, !dbg !265
  call void @llvm.dbg.value(metadata i64 %6, metadata !258, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !256
  %.not = icmp eq i64 %6, 0, !dbg !261
  br i1 %.not, label %._crit_edge, label %5, !dbg !262, !llvm.loop !266

._crit_edge:                                      ; preds = %5, %3
  ret i8* %0, !dbg !268
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #8

attributes #0 = { noinline noreturn nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree noinline nounwind readonly uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree noinline norecurse nosync nounwind readonly uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree noinline norecurse nosync nounwind uwtable writeonly "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #9 = { nounwind }
attributes #10 = { noreturn nounwind }
attributes #11 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0, !26, !31, !68}
!llvm.ident = !{!70, !70, !70, !70}
!llvm.module.flags = !{!71, !72, !73, !74, !75}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !10, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "driver_strncasestr-oob-read_serializer-int32-oob-write.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!2 = !{!3}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !1, line: 25, baseType: !4, size: 32, elements: !5)
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !7, !8, !9}
!6 = !DIEnumerator(name: "ser_fmt_unknown", value: 0)
!7 = !DIEnumerator(name: "ser_fmt_tlv", value: 1)
!8 = !DIEnumerator(name: "ser_fmt_json", value: 2)
!9 = !DIEnumerator(name: "ser_fmt_csv", value: 3)
!10 = !{!11, !15, !24}
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !12, line: 26, baseType: !13)
!12 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !14, line: 42, baseType: !4)
!14 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_serializer", file: !1, line: 34, baseType: !17)
!17 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 34, size: 256, elements: !18)
!18 = !{!19}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "c", scope: !17, file: !1, line: 34, baseType: !20, size: 256)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 256, elements: !22)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !{!23}
!23 = !DISubrange(count: 32)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !21)
!26 = distinct !DICompileUnit(language: DW_LANG_C99, file: !27, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !28, retainedTypes: !29, splitDebugInlining: false, nameTableKind: None)
!27 = !DIFile(filename: "predicate_strncasestr-oob-read.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!28 = !{}
!29 = !{!30}
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!31 = distinct !DICompileUnit(language: DW_LANG_C99, file: !32, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !33, retainedTypes: !35, splitDebugInlining: false, nameTableKind: None)
!32 = !DIFile(filename: "predicate_serializer-int32-oob-write.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!33 = !{!34}
!34 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !32, line: 35, baseType: !4, size: 32, elements: !5)
!35 = !{!36, !30}
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_private", file: !32, line: 62, baseType: !38)
!38 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !32, line: 57, size: 256, elements: !39)
!39 = !{!40, !51, !62, !64}
!40 = !DIDerivedType(tag: DW_TAG_member, name: "status", scope: !38, file: !32, line: 58, baseType: !41, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_status", file: !32, line: 50, baseType: !42)
!42 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !32, line: 47, size: 64, elements: !43)
!43 = !{!44, !46}
!44 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !42, file: !32, line: 48, baseType: !45, size: 32)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int32_t", file: !32, line: 33, baseType: !11)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !42, file: !32, line: 49, baseType: !47, size: 32, offset: 32)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_buf_status", file: !32, line: 45, baseType: !48)
!48 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !32, line: 45, size: 32, elements: !49)
!49 = !{!50}
!50 = !DIDerivedType(tag: DW_TAG_member, name: "size_used", scope: !48, file: !32, line: 45, baseType: !45, size: 32)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !38, file: !32, line: 59, baseType: !52, size: 128, offset: 64)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_buffer", file: !32, line: 55, baseType: !53)
!53 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !32, line: 52, size: 128, elements: !54)
!54 = !{!55, !56}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !53, file: !32, line: 53, baseType: !45, size: 32)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !53, file: !32, line: 54, baseType: !57, size: 64, offset: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int8_t", file: !32, line: 31, baseType: !59)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !12, line: 24, baseType: !60)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !14, line: 38, baseType: !61)
!61 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "fmt", scope: !38, file: !32, line: 60, baseType: !63, size: 32, offset: 192)
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_format", file: !32, line: 40, baseType: !34)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "csv_separator", scope: !38, file: !32, line: 61, baseType: !65, size: 16, offset: 224)
!65 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 16, elements: !66)
!66 = !{!67}
!67 = !DISubrange(count: 2)
!68 = distinct !DICompileUnit(language: DW_LANG_C99, file: !69, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !28, splitDebugInlining: false, nameTableKind: None)
!69 = !DIFile(filename: "/home/wcontrerasmartinez/klee/runtime/Freestanding/memset.c", directory: "/home/wcontrerasmartinez/klee/build/runtime/Freestanding")
!70 = !{!"Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8"}
!71 = !{i32 7, !"Dwarf Version", i32 4}
!72 = !{i32 2, !"Debug Info Version", i32 3}
!73 = !{i32 1, !"wchar_size", i32 4}
!74 = !{i32 7, !"uwtable", i32 1}
!75 = !{i32 7, !"frame-pointer", i32 2}
!76 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 39, type: !77, scopeLine: 39, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !28)
!77 = !DISubroutineType(types: !78)
!78 = !{!79}
!79 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!80 = !DILocalVariable(name: "buf", scope: !76, file: !1, line: 40, type: !81)
!81 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 2048, elements: !82)
!82 = !{!83}
!83 = !DISubrange(count: 256)
!84 = !DILocation(line: 40, column: 11, scope: !76)
!85 = !DILocation(line: 41, column: 22, scope: !76)
!86 = !DILocation(line: 41, column: 3, scope: !76)
!87 = !DILocalVariable(name: "needle", scope: !76, file: !1, line: 44, type: !88)
!88 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 2064, elements: !89)
!89 = !{!90}
!90 = !DISubrange(count: 258)
!91 = !DILocation(line: 44, column: 8, scope: !76)
!92 = !DILocation(line: 45, column: 22, scope: !76)
!93 = !DILocation(line: 45, column: 3, scope: !76)
!94 = !DILocation(line: 46, column: 3, scope: !76)
!95 = !DILocation(line: 46, column: 23, scope: !76)
!96 = !DILocalVariable(name: "k", scope: !97, file: !1, line: 47, type: !79)
!97 = distinct !DILexicalBlock(scope: !76, file: !1, line: 47, column: 3)
!98 = !DILocation(line: 0, scope: !97)
!99 = !DILocation(line: 47, column: 3, scope: !97)
!100 = !DILocation(line: 48, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !1, line: 47, column: 3)
!102 = !DILocation(line: 48, column: 27, scope: !101)
!103 = !DILocation(line: 48, column: 5, scope: !101)
!104 = !DILocation(line: 47, column: 33, scope: !101)
!105 = !DILocation(line: 47, column: 21, scope: !101)
!106 = distinct !{!106, !99, !107, !108}
!107 = !DILocation(line: 48, column: 34, scope: !97)
!108 = !{!"llvm.loop.mustprogress"}
!109 = !DILocalVariable(name: "ser", scope: !76, file: !1, line: 51, type: !110)
!110 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_private", file: !1, line: 33, baseType: !111)
!111 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 31, size: 256, elements: !112)
!112 = !{!113, !123, !130, !132}
!113 = !DIDerivedType(tag: DW_TAG_member, name: "status", scope: !111, file: !1, line: 32, baseType: !114, size: 64)
!114 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_status", file: !1, line: 29, baseType: !115)
!115 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 29, size: 64, elements: !116)
!116 = !{!117, !118}
!117 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !115, file: !1, line: 29, baseType: !11, size: 32)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !115, file: !1, line: 29, baseType: !119, size: 32, offset: 32)
!119 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_buf_status", file: !1, line: 28, baseType: !120)
!120 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 28, size: 32, elements: !121)
!121 = !{!122}
!122 = !DIDerivedType(tag: DW_TAG_member, name: "size_used", scope: !120, file: !1, line: 28, baseType: !11, size: 32)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !111, file: !1, line: 32, baseType: !124, size: 128, offset: 64)
!124 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_buffer", file: !1, line: 30, baseType: !125)
!125 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 30, size: 128, elements: !126)
!126 = !{!127, !128}
!127 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !125, file: !1, line: 30, baseType: !11, size: 32)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !125, file: !1, line: 30, baseType: !129, size: 64, offset: 64)
!129 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "fmt", scope: !111, file: !1, line: 32, baseType: !131, size: 32, offset: 192)
!131 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_format", file: !1, line: 26, baseType: !3)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "csv_separator", scope: !111, file: !1, line: 32, baseType: !65, size: 16, offset: 224)
!133 = !DILocation(line: 51, column: 15, scope: !76)
!134 = !DILocation(line: 52, column: 3, scope: !76)
!135 = !DILocation(line: 54, column: 7, scope: !76)
!136 = !DILocation(line: 54, column: 24, scope: !76)
!137 = !DILocation(line: 55, column: 14, scope: !76)
!138 = !DILocation(line: 55, column: 24, scope: !76)
!139 = !DILocation(line: 56, column: 3, scope: !76)
!140 = !DILocation(line: 56, column: 24, scope: !76)
!141 = !DILocation(line: 57, column: 14, scope: !76)
!142 = !DILocation(line: 57, column: 24, scope: !76)
!143 = !DILocation(line: 60, column: 22, scope: !76)
!144 = !DILocalVariable(name: "su", scope: !76, file: !1, line: 59, type: !11)
!145 = !DILocation(line: 0, scope: !76)
!146 = !DILocation(line: 60, column: 3, scope: !76)
!147 = !DILocation(line: 61, column: 15, scope: !76)
!148 = !DILocation(line: 61, column: 18, scope: !76)
!149 = !DILocation(line: 61, column: 3, scope: !76)
!150 = !DILocation(line: 62, column: 15, scope: !76)
!151 = !DILocation(line: 62, column: 18, scope: !76)
!152 = !DILocation(line: 62, column: 24, scope: !76)
!153 = !DILocation(line: 62, column: 3, scope: !76)
!154 = !DILocation(line: 63, column: 33, scope: !76)
!155 = !DILocation(line: 63, column: 21, scope: !76)
!156 = !DILocation(line: 63, column: 31, scope: !76)
!157 = !DILocation(line: 64, column: 14, scope: !76)
!158 = !DILocation(line: 64, column: 31, scope: !76)
!159 = !DILocation(line: 67, column: 22, scope: !76)
!160 = !DILocalVariable(name: "value", scope: !76, file: !1, line: 66, type: !161)
!161 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !162, line: 26, baseType: !163)
!162 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!163 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !14, line: 41, baseType: !79)
!164 = !DILocation(line: 67, column: 3, scope: !76)
!165 = !DILocation(line: 68, column: 25, scope: !76)
!166 = !DILocation(line: 68, column: 31, scope: !76)
!167 = !DILocation(line: 68, column: 15, scope: !76)
!168 = !DILocation(line: 68, column: 3, scope: !76)
!169 = !DILocation(line: 70, column: 26, scope: !76)
!170 = !DILocalVariable(name: "sser", scope: !76, file: !1, line: 70, type: !15)
!171 = !DILocation(line: 72, column: 15, scope: !76)
!172 = !DILocalVariable(name: "r_str", scope: !76, file: !1, line: 72, type: !79)
!173 = !DILocation(line: 74, column: 15, scope: !76)
!174 = !DILocalVariable(name: "r_ser", scope: !76, file: !1, line: 74, type: !79)
!175 = !DILocation(line: 76, column: 21, scope: !76)
!176 = !DILocation(line: 76, column: 26, scope: !76)
!177 = !DILocation(line: 76, column: 15, scope: !76)
!178 = !DILocation(line: 76, column: 3, scope: !76)
!179 = !DILocation(line: 77, column: 3, scope: !76)
!180 = distinct !DISubprogram(name: "predicate_strncasestr_oob_read", scope: !27, file: !27, line: 22, type: !181, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !26, retainedNodes: !28)
!181 = !DISubroutineType(types: !182)
!182 = !{!79, !24, !24, !183}
!183 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !184, line: 46, baseType: !185)
!184 = !DIFile(filename: "/usr/lib/llvm-13/lib/clang/13.0.1/include/stddef.h", directory: "")
!185 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!186 = !DILocalVariable(name: "str1", arg: 1, scope: !180, file: !27, line: 22, type: !24)
!187 = !DILocation(line: 0, scope: !180)
!188 = !DILocalVariable(name: "str2", arg: 2, scope: !180, file: !27, line: 22, type: !24)
!189 = !DILocalVariable(name: "len", arg: 3, scope: !180, file: !27, line: 23, type: !183)
!190 = !DILocation(line: 25, column: 12, scope: !191)
!191 = distinct !DILexicalBlock(scope: !180, file: !27, line: 25, column: 7)
!192 = !DILocation(line: 25, column: 20, scope: !191)
!193 = !DILocalVariable(name: "str1_len", scope: !180, file: !27, line: 28, type: !183)
!194 = !DILocation(line: 29, column: 21, scope: !180)
!195 = !DILocalVariable(name: "str2_len", scope: !180, file: !27, line: 29, type: !183)
!196 = !DILocation(line: 31, column: 16, scope: !197)
!197 = distinct !DILexicalBlock(scope: !180, file: !27, line: 31, column: 7)
!198 = !DILocation(line: 31, column: 7, scope: !180)
!199 = !DILocation(line: 28, column: 21, scope: !180)
!200 = !DILocation(line: 38, column: 16, scope: !201)
!201 = distinct !DILexicalBlock(scope: !180, file: !27, line: 38, column: 7)
!202 = !DILocation(line: 41, column: 1, scope: !180)
!203 = distinct !DISubprogram(name: "predicate_serializer_int32_oob_write", scope: !32, file: !32, line: 66, type: !204, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !31, retainedNodes: !28)
!204 = !DISubroutineType(types: !205)
!205 = !{!79, !206, !24, !161}
!206 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !207, size: 64)
!207 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_serializer", file: !32, line: 64, baseType: !208)
!208 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !32, line: 64, size: 256, elements: !209)
!209 = !{!210}
!210 = !DIDerivedType(tag: DW_TAG_member, name: "c", scope: !208, file: !32, line: 64, baseType: !20, size: 256)
!211 = !DILocalVariable(name: "_serializer", arg: 1, scope: !203, file: !32, line: 66, type: !206)
!212 = !DILocation(line: 0, scope: !203)
!213 = !DILocalVariable(name: "key", arg: 2, scope: !203, file: !32, line: 67, type: !24)
!214 = !DILocalVariable(name: "value", arg: 3, scope: !203, file: !32, line: 68, type: !161)
!215 = !DILocalVariable(name: "serializer", scope: !203, file: !32, line: 70, type: !36)
!216 = !DILocation(line: 72, column: 19, scope: !217)
!217 = distinct !DILexicalBlock(scope: !203, file: !32, line: 72, column: 7)
!218 = !DILocation(line: 72, column: 23, scope: !217)
!219 = !DILocation(line: 72, column: 7, scope: !203)
!220 = !DILocation(line: 75, column: 26, scope: !221)
!221 = distinct !DILexicalBlock(scope: !203, file: !32, line: 75, column: 7)
!222 = !DILocation(line: 75, column: 31, scope: !221)
!223 = !DILocation(line: 75, column: 7, scope: !203)
!224 = !DILocation(line: 78, column: 26, scope: !225)
!225 = distinct !DILexicalBlock(scope: !203, file: !32, line: 78, column: 7)
!226 = !DILocation(line: 78, column: 33, scope: !225)
!227 = !DILocation(line: 78, column: 57, scope: !225)
!228 = !DILocation(line: 78, column: 64, scope: !225)
!229 = !DILocation(line: 78, column: 43, scope: !225)
!230 = !DILocation(line: 78, column: 7, scope: !203)
!231 = !DILocalVariable(name: "buff_diff", scope: !203, file: !32, line: 80, type: !45)
!232 = !DILocalVariable(name: "needed", scope: !203, file: !32, line: 82, type: !233)
!233 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int16_t", file: !32, line: 32, baseType: !234)
!234 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !12, line: 25, baseType: !235)
!235 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !14, line: 40, baseType: !236)
!236 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!237 = !DILocalVariable(name: "size_used_after", scope: !203, file: !32, line: 94, type: !45)
!238 = !DILocation(line: 95, column: 28, scope: !239)
!239 = distinct !DILexicalBlock(scope: !203, file: !32, line: 95, column: 7)
!240 = !DILocation(line: 95, column: 34, scope: !239)
!241 = !DILocation(line: 95, column: 52, scope: !239)
!242 = !DILocation(line: 97, column: 25, scope: !243)
!243 = distinct !DILexicalBlock(scope: !244, file: !32, line: 97, column: 9)
!244 = distinct !DILexicalBlock(scope: !239, file: !32, line: 95, column: 76)
!245 = !DILocation(line: 97, column: 9, scope: !244)
!246 = !DILocation(line: 98, column: 20, scope: !244)
!247 = !DILocation(line: 99, column: 3, scope: !244)
!248 = !DILocation(line: 104, column: 23, scope: !249)
!249 = distinct !DILexicalBlock(scope: !203, file: !32, line: 104, column: 7)
!250 = !DILocation(line: 114, column: 1, scope: !203)
!251 = distinct !DISubprogram(name: "memset", scope: !252, file: !252, line: 12, type: !253, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !28)
!252 = !DIFile(filename: "runtime/Freestanding/memset.c", directory: "/home/wcontrerasmartinez/klee")
!253 = !DISubroutineType(types: !254)
!254 = !{!30, !30, !79, !183}
!255 = !DILocalVariable(name: "dst", arg: 1, scope: !251, file: !252, line: 12, type: !30)
!256 = !DILocation(line: 0, scope: !251)
!257 = !DILocalVariable(name: "s", arg: 2, scope: !251, file: !252, line: 12, type: !79)
!258 = !DILocalVariable(name: "count", arg: 3, scope: !251, file: !252, line: 12, type: !183)
!259 = !DILocalVariable(name: "a", scope: !251, file: !252, line: 13, type: !260)
!260 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!261 = !DILocation(line: 14, column: 18, scope: !251)
!262 = !DILocation(line: 14, column: 3, scope: !251)
!263 = !DILocation(line: 14, column: 15, scope: !251)
!264 = !DILocation(line: 15, column: 7, scope: !251)
!265 = !DILocation(line: 15, column: 10, scope: !251)
!266 = distinct !{!266, !262, !267, !108}
!267 = !DILocation(line: 15, column: 12, scope: !251)
!268 = !DILocation(line: 16, column: 3, scope: !251)
