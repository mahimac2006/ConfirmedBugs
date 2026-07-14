; ModuleID = 'linked_printable-string-oob-read_serializer-int32-oob-write.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ser_private = type { %struct.ser_status, %struct.ser_buffer, i32, [2 x i8] }
%struct.ser_status = type { i32, %struct.ser_buf_status }
%struct.ser_buf_status = type { i32 }
%struct.ser_buffer = type { i32, i8* }
%struct.ser_serializer = type { [32 x i8] }

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"ps_len\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"size_used\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"value\00", align 1
@.str.5 = private unnamed_addr constant [73 x i8] c"0 && \22REACHED_BOTH_printable-string-oob-read_serializer-int32-oob-write\22\00", align 1
@.str.6 = private unnamed_addr constant [62 x i8] c"driver_printable-string-oob-read_serializer-int32-oob-write.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [15 x i8] c"int main(void)\00", align 1

; Function Attrs: noinline noreturn nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !78 {
  %1 = alloca [256 x i8], align 16
  %2 = alloca i64, align 8
  %3 = alloca %struct.ser_private, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [256 x i8]* %1, metadata !82, metadata !DIExpression()), !dbg !86
  %6 = getelementptr inbounds [256 x i8], [256 x i8]* %1, i64 0, i64 0, !dbg !87
  call void @klee_make_symbolic(i8* nonnull %6, i64 256, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)) #8, !dbg !88
  %7 = bitcast i64* %2 to i8*, !dbg !89
  call void @llvm.dbg.value(metadata i64* %2, metadata !90, metadata !DIExpression(DW_OP_deref)), !dbg !91
  call void @klee_make_symbolic(i8* nonnull %7, i64 8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)) #8, !dbg !92
  %8 = load i64, i64* %2, align 8, !dbg !93
  call void @llvm.dbg.value(metadata i64 %8, metadata !90, metadata !DIExpression()), !dbg !91
  %9 = icmp ugt i64 %8, 256, !dbg !94
  %10 = zext i1 %9 to i64, !dbg !93
  call void @klee_assume(i64 %10) #8, !dbg !95
  %11 = load i64, i64* %2, align 8, !dbg !96
  call void @llvm.dbg.value(metadata i64 %11, metadata !90, metadata !DIExpression()), !dbg !91
  %12 = icmp ult i64 %11, 513, !dbg !97
  %13 = zext i1 %12 to i64, !dbg !96
  call void @klee_assume(i64 %13) #8, !dbg !98
  call void @llvm.dbg.declare(metadata %struct.ser_private* %3, metadata !99, metadata !DIExpression()), !dbg !123
  %14 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %3, i64 0, i32 1, !dbg !124
  %15 = bitcast %struct.ser_buffer* %14 to i8*, !dbg !124
  %16 = call i8* @memset(i8* %15, i32 0, i64 24), !dbg !124
  %17 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %3, i64 0, i32 2, !dbg !125
  store i32 3, i32* %17, align 8, !dbg !126
  %18 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %3, i64 0, i32 1, i32 1, !dbg !127
  store i8* %6, i8** %18, align 8, !dbg !128
  %19 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %3, i64 0, i32 3, i64 0, !dbg !129
  store i8 44, i8* %19, align 4, !dbg !130
  %20 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %3, i64 0, i32 1, i32 0, !dbg !131
  store i32 256, i32* %20, align 8, !dbg !132
  %21 = bitcast i32* %4 to i8*, !dbg !133
  call void @llvm.dbg.value(metadata i32* %4, metadata !134, metadata !DIExpression(DW_OP_deref)), !dbg !91
  call void @klee_make_symbolic(i8* nonnull %21, i64 4, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i64 0, i64 0)) #8, !dbg !135
  %22 = load i32, i32* %4, align 4, !dbg !136
  call void @llvm.dbg.value(metadata i32 %22, metadata !134, metadata !DIExpression()), !dbg !91
  %23 = icmp ne i32 %22, 0, !dbg !137
  %24 = zext i1 %23 to i64, !dbg !136
  call void @klee_assume(i64 %24) #8, !dbg !138
  %25 = load i32, i32* %4, align 4, !dbg !139
  call void @llvm.dbg.value(metadata i32 %25, metadata !134, metadata !DIExpression()), !dbg !91
  %26 = add i32 %25, 11, !dbg !140
  %27 = icmp ult i32 %26, 257, !dbg !141
  %28 = zext i1 %27 to i64, !dbg !139
  call void @klee_assume(i64 %28) #8, !dbg !142
  %29 = load i32, i32* %4, align 4, !dbg !143
  call void @llvm.dbg.value(metadata i32 %29, metadata !134, metadata !DIExpression()), !dbg !91
  %30 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %3, i64 0, i32 0, i32 1, i32 0, !dbg !144
  store i32 %29, i32* %30, align 4, !dbg !145
  %31 = getelementptr inbounds %struct.ser_private, %struct.ser_private* %3, i64 0, i32 0, i32 0, !dbg !146
  store i32 0, i32* %31, align 8, !dbg !147
  %32 = bitcast i32* %5 to i8*, !dbg !148
  call void @llvm.dbg.value(metadata i32* %5, metadata !149, metadata !DIExpression(DW_OP_deref)), !dbg !91
  call void @klee_make_symbolic(i8* nonnull %32, i64 4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0)) #8, !dbg !153
  %33 = load i32, i32* %5, align 4, !dbg !154
  call void @llvm.dbg.value(metadata i32 %33, metadata !149, metadata !DIExpression()), !dbg !91
  %34 = icmp ugt i32 %33, 999999999, !dbg !155
  %35 = zext i1 %34 to i64, !dbg !156
  call void @klee_assume(i64 %35) #8, !dbg !157
  %36 = bitcast %struct.ser_private* %3 to %struct.ser_serializer*, !dbg !158
  call void @llvm.dbg.value(metadata %struct.ser_serializer* %36, metadata !159, metadata !DIExpression()), !dbg !91
  %37 = load i64, i64* %2, align 8, !dbg !160
  call void @llvm.dbg.value(metadata i64 %37, metadata !90, metadata !DIExpression()), !dbg !91
  %38 = call fastcc i32 @predicate_printable_string_oob_read(i8* nonnull %6, i64 %37), !dbg !161
  call void @llvm.dbg.value(metadata i32 %38, metadata !162, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.value(metadata i32 undef, metadata !149, metadata !DIExpression()), !dbg !91
  %39 = call fastcc i32 @predicate_serializer_int32_oob_write(%struct.ser_serializer* nonnull %36), !dbg !163
  call void @llvm.dbg.value(metadata i32 %39, metadata !164, metadata !DIExpression()), !dbg !91
  %40 = icmp eq i32 %38, 1, !dbg !165
  %41 = icmp eq i32 %39, 1, !dbg !166
  %42 = select i1 %40, i1 %41, i1 false, !dbg !166
  %43 = zext i1 %42 to i64, !dbg !167
  call void @klee_assume(i64 %43) #8, !dbg !168
  call void @__assert_fail(i8* getelementptr inbounds ([73 x i8], [73 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.6, i64 0, i64 0), i32 75, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #9, !dbg !169
  unreachable, !dbg !169
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) local_unnamed_addr #2

declare dso_local void @klee_assume(i64) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #3

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readnone uwtable willreturn
define internal fastcc i32 @predicate_printable_string_oob_read(i8* readnone %0, i64 %1) unnamed_addr #4 !dbg !170 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !174, metadata !DIExpression()), !dbg !175
  call void @llvm.dbg.value(metadata i64 %1, metadata !176, metadata !DIExpression()), !dbg !175
  call void @llvm.dbg.value(metadata i64 256, metadata !177, metadata !DIExpression()), !dbg !175
  %3 = icmp ne i8* %0, null, !dbg !178
  %4 = icmp ne i64 %1, 0
  %or.cond = select i1 %3, i1 %4, i1 false, !dbg !180
  %5 = icmp ugt i64 %1, 256, !dbg !180
  %narrow = select i1 %or.cond, i1 %5, i1 false, !dbg !180
  %.0 = zext i1 %narrow to i32, !dbg !180
  ret i32 %.0, !dbg !181
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readonly uwtable willreturn
define internal fastcc i32 @predicate_serializer_int32_oob_write(%struct.ser_serializer* nocapture readonly %0) unnamed_addr #5 !dbg !182 {
  call void @llvm.dbg.value(metadata %struct.ser_serializer* %0, metadata !192, metadata !DIExpression()), !dbg !193
  call void @llvm.dbg.value(metadata i8* undef, metadata !194, metadata !DIExpression()), !dbg !193
  call void @llvm.dbg.value(metadata i32 undef, metadata !195, metadata !DIExpression()), !dbg !193
  call void @llvm.dbg.value(metadata %struct.ser_serializer* %0, metadata !196, metadata !DIExpression()), !dbg !193
  %2 = getelementptr inbounds %struct.ser_serializer, %struct.ser_serializer* %0, i64 0, i32 0, i64 24, !dbg !197
  %3 = bitcast i8* %2 to i32*, !dbg !197
  %4 = load i32, i32* %3, align 8, !dbg !197
  %.not = icmp eq i32 %4, 3, !dbg !199
  br i1 %.not, label %5, label %30, !dbg !200

5:                                                ; preds = %1
  %6 = getelementptr inbounds %struct.ser_serializer, %struct.ser_serializer* %0, i64 0, i32 0, i64 16, !dbg !201
  %7 = bitcast i8* %6 to i8**, !dbg !201
  %8 = load i8*, i8** %7, align 8, !dbg !201
  %9 = icmp eq i8* %8, null, !dbg !203
  br i1 %9, label %30, label %10, !dbg !204

10:                                               ; preds = %5
  %11 = getelementptr inbounds %struct.ser_serializer, %struct.ser_serializer* %0, i64 0, i32 0, i64 4, !dbg !205
  %12 = bitcast i8* %11 to i32*, !dbg !207
  %13 = load i32, i32* %12, align 4, !dbg !207
  %14 = getelementptr inbounds %struct.ser_serializer, %struct.ser_serializer* %0, i64 0, i32 0, i64 8, !dbg !208
  %15 = bitcast i8* %14 to i32*, !dbg !209
  %16 = load i32, i32* %15, align 8, !dbg !209
  %17 = icmp ult i32 %16, %13, !dbg !210
  %18 = sub i32 %16, %13
  %19 = icmp ult i32 %18, 11
  %or.cond6 = or i1 %17, %19, !dbg !211
  call void @llvm.dbg.value(metadata i32 %18, metadata !212, metadata !DIExpression()), !dbg !193
  call void @llvm.dbg.value(metadata i16 11, metadata !213, metadata !DIExpression()), !dbg !193
  br i1 %or.cond6, label %30, label %20, !dbg !211

20:                                               ; preds = %10
  call void @llvm.dbg.value(metadata i32 %13, metadata !218, metadata !DIExpression()), !dbg !193
  %21 = bitcast %struct.ser_serializer* %0 to i32*, !dbg !219
  %22 = load i32, i32* %21, align 8, !dbg !219
  %23 = and i32 %22, 4, !dbg !221
  %24 = icmp eq i32 %23, 0, !dbg !221
  %25 = icmp ne i32 %13, 0
  %or.cond = select i1 %24, i1 %25, i1 false, !dbg !222
  br i1 %or.cond, label %26, label %29, !dbg !222

26:                                               ; preds = %20
  %.not4 = icmp ugt i32 %16, %13, !dbg !223
  br i1 %.not4, label %27, label %30, !dbg !226

27:                                               ; preds = %26
  %28 = add i32 %13, 1, !dbg !227
  call void @llvm.dbg.value(metadata i32 %28, metadata !218, metadata !DIExpression()), !dbg !193
  br label %29, !dbg !228

29:                                               ; preds = %27, %20
  %.02 = phi i32 [ %28, %27 ], [ %13, %20 ], !dbg !193
  call void @llvm.dbg.value(metadata i32 %.02, metadata !218, metadata !DIExpression()), !dbg !193
  call void @llvm.dbg.value(metadata i16 10, metadata !213, metadata !DIExpression()), !dbg !193
  %.not3 = icmp ult i32 %.02, %16, !dbg !229
  %. = zext i1 %.not3 to i32, !dbg !193
  br label %30, !dbg !193

30:                                               ; preds = %29, %26, %10, %5, %1
  %.0 = phi i32 [ 0, %1 ], [ 0, %5 ], [ 0, %10 ], [ 0, %26 ], [ %., %29 ], !dbg !193
  ret i32 %.0, !dbg !231
}

; Function Attrs: nofree noinline norecurse nosync nounwind uwtable writeonly
define dso_local i8* @memset(i8* returned %0, i32 %1, i64 %2) local_unnamed_addr #6 !dbg !232 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !236, metadata !DIExpression()), !dbg !237
  call void @llvm.dbg.value(metadata i32 %1, metadata !238, metadata !DIExpression()), !dbg !237
  call void @llvm.dbg.value(metadata i64 %2, metadata !239, metadata !DIExpression()), !dbg !237
  call void @llvm.dbg.value(metadata i8* %0, metadata !240, metadata !DIExpression()), !dbg !237
  call void @llvm.dbg.value(metadata i64 %2, metadata !239, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !237
  %.not2 = icmp eq i64 %2, 0, !dbg !241
  br i1 %.not2, label %._crit_edge, label %.lr.ph, !dbg !242

.lr.ph:                                           ; preds = %3
  %4 = trunc i32 %1 to i8
  br label %5, !dbg !242

5:                                                ; preds = %.lr.ph, %5
  %.04 = phi i8* [ %0, %.lr.ph ], [ %7, %5 ]
  %.013 = phi i64 [ %2, %.lr.ph ], [ %6, %5 ]
  call void @llvm.dbg.value(metadata i8* %.04, metadata !240, metadata !DIExpression()), !dbg !237
  call void @llvm.dbg.value(metadata i64 %.013, metadata !239, metadata !DIExpression()), !dbg !237
  %6 = add i64 %.013, -1, !dbg !243
  call void @llvm.dbg.value(metadata i64 %6, metadata !239, metadata !DIExpression()), !dbg !237
  %7 = getelementptr inbounds i8, i8* %.04, i64 1, !dbg !244
  call void @llvm.dbg.value(metadata i8* %7, metadata !240, metadata !DIExpression()), !dbg !237
  store i8 %4, i8* %.04, align 1, !dbg !245
  call void @llvm.dbg.value(metadata i64 %6, metadata !239, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !237
  %.not = icmp eq i64 %6, 0, !dbg !241
  br i1 %.not, label %._crit_edge, label %5, !dbg !242, !llvm.loop !246

._crit_edge:                                      ; preds = %5, %3
  ret i8* %0, !dbg !249
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #7

attributes #0 = { noinline noreturn nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree noinline norecurse nosync nounwind readnone uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree noinline norecurse nosync nounwind readonly uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree noinline norecurse nosync nounwind uwtable writeonly "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!0, !28, !33, !70}
!llvm.ident = !{!72, !72, !72, !72}
!llvm.module.flags = !{!73, !74, !75, !76, !77}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !10, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "driver_printable-string-oob-read_serializer-int32-oob-write.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!2 = !{!3}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !1, line: 24, baseType: !4, size: 32, elements: !5)
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !7, !8, !9}
!6 = !DIEnumerator(name: "ser_fmt_unknown", value: 0)
!7 = !DIEnumerator(name: "ser_fmt_tlv", value: 1)
!8 = !DIEnumerator(name: "ser_fmt_json", value: 2)
!9 = !DIEnumerator(name: "ser_fmt_csv", value: 3)
!10 = !{!11, !14, !18, !27}
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !12, line: 46, baseType: !13)
!12 = !DIFile(filename: "/usr/lib/llvm-13/lib/clang/13.0.1/include/stddef.h", directory: "")
!13 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !15, line: 26, baseType: !16)
!15 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !17, line: 42, baseType: !4)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_serializer", file: !1, line: 33, baseType: !20)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 33, size: 256, elements: !21)
!21 = !{!22}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "c", scope: !20, file: !1, line: 33, baseType: !23, size: 256)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 256, elements: !25)
!24 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!25 = !{!26}
!26 = !DISubrange(count: 32)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!28 = distinct !DICompileUnit(language: DW_LANG_C99, file: !29, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !30, retainedTypes: !31, splitDebugInlining: false, nameTableKind: None)
!29 = !DIFile(filename: "predicate_printable-string-oob-read.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!30 = !{}
!31 = !{!32}
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!33 = distinct !DICompileUnit(language: DW_LANG_C99, file: !34, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !35, retainedTypes: !37, splitDebugInlining: false, nameTableKind: None)
!34 = !DIFile(filename: "predicate_serializer-int32-oob-write.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!35 = !{!36}
!36 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !34, line: 35, baseType: !4, size: 32, elements: !5)
!37 = !{!38, !32}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_private", file: !34, line: 62, baseType: !40)
!40 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !34, line: 57, size: 256, elements: !41)
!41 = !{!42, !53, !64, !66}
!42 = !DIDerivedType(tag: DW_TAG_member, name: "status", scope: !40, file: !34, line: 58, baseType: !43, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_status", file: !34, line: 50, baseType: !44)
!44 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !34, line: 47, size: 64, elements: !45)
!45 = !{!46, !48}
!46 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !44, file: !34, line: 48, baseType: !47, size: 32)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int32_t", file: !34, line: 33, baseType: !14)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !44, file: !34, line: 49, baseType: !49, size: 32, offset: 32)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_buf_status", file: !34, line: 45, baseType: !50)
!50 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !34, line: 45, size: 32, elements: !51)
!51 = !{!52}
!52 = !DIDerivedType(tag: DW_TAG_member, name: "size_used", scope: !50, file: !34, line: 45, baseType: !47, size: 32)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !40, file: !34, line: 59, baseType: !54, size: 128, offset: 64)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_buffer", file: !34, line: 55, baseType: !55)
!55 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !34, line: 52, size: 128, elements: !56)
!56 = !{!57, !58}
!57 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !55, file: !34, line: 53, baseType: !47, size: 32)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !55, file: !34, line: 54, baseType: !59, size: 64, offset: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int8_t", file: !34, line: 31, baseType: !61)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !15, line: 24, baseType: !62)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !17, line: 38, baseType: !63)
!63 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "fmt", scope: !40, file: !34, line: 60, baseType: !65, size: 32, offset: 192)
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_format", file: !34, line: 40, baseType: !36)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "csv_separator", scope: !40, file: !34, line: 61, baseType: !67, size: 16, offset: 224)
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 16, elements: !68)
!68 = !{!69}
!69 = !DISubrange(count: 2)
!70 = distinct !DICompileUnit(language: DW_LANG_C99, file: !71, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !30, splitDebugInlining: false, nameTableKind: None)
!71 = !DIFile(filename: "/home/wcontrerasmartinez/klee/runtime/Freestanding/memset.c", directory: "/home/wcontrerasmartinez/klee/build/runtime/Freestanding")
!72 = !{!"Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8"}
!73 = !{i32 7, !"Dwarf Version", i32 4}
!74 = !{i32 2, !"Debug Info Version", i32 3}
!75 = !{i32 1, !"wchar_size", i32 4}
!76 = !{i32 7, !"uwtable", i32 1}
!77 = !{i32 7, !"frame-pointer", i32 2}
!78 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 38, type: !79, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !30)
!79 = !DISubroutineType(types: !80)
!80 = !{!81}
!81 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!82 = !DILocalVariable(name: "buf", scope: !78, file: !1, line: 39, type: !83)
!83 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 2048, elements: !84)
!84 = !{!85}
!85 = !DISubrange(count: 256)
!86 = !DILocation(line: 39, column: 11, scope: !78)
!87 = !DILocation(line: 40, column: 22, scope: !78)
!88 = !DILocation(line: 40, column: 3, scope: !78)
!89 = !DILocation(line: 44, column: 22, scope: !78)
!90 = !DILocalVariable(name: "ps_len", scope: !78, file: !1, line: 43, type: !11)
!91 = !DILocation(line: 0, scope: !78)
!92 = !DILocation(line: 44, column: 3, scope: !78)
!93 = !DILocation(line: 45, column: 15, scope: !78)
!94 = !DILocation(line: 45, column: 22, scope: !78)
!95 = !DILocation(line: 45, column: 3, scope: !78)
!96 = !DILocation(line: 46, column: 15, scope: !78)
!97 = !DILocation(line: 46, column: 22, scope: !78)
!98 = !DILocation(line: 46, column: 3, scope: !78)
!99 = !DILocalVariable(name: "ser", scope: !78, file: !1, line: 49, type: !100)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_private", file: !1, line: 32, baseType: !101)
!101 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 30, size: 256, elements: !102)
!102 = !{!103, !113, !120, !122}
!103 = !DIDerivedType(tag: DW_TAG_member, name: "status", scope: !101, file: !1, line: 31, baseType: !104, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_status", file: !1, line: 28, baseType: !105)
!105 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 28, size: 64, elements: !106)
!106 = !{!107, !108}
!107 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !105, file: !1, line: 28, baseType: !14, size: 32)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !105, file: !1, line: 28, baseType: !109, size: 32, offset: 32)
!109 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_buf_status", file: !1, line: 27, baseType: !110)
!110 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 27, size: 32, elements: !111)
!111 = !{!112}
!112 = !DIDerivedType(tag: DW_TAG_member, name: "size_used", scope: !110, file: !1, line: 27, baseType: !14, size: 32)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !101, file: !1, line: 31, baseType: !114, size: 128, offset: 64)
!114 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_buffer", file: !1, line: 29, baseType: !115)
!115 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 29, size: 128, elements: !116)
!116 = !{!117, !118}
!117 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !115, file: !1, line: 29, baseType: !14, size: 32)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !115, file: !1, line: 29, baseType: !119, size: 64, offset: 64)
!119 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "fmt", scope: !101, file: !1, line: 31, baseType: !121, size: 32, offset: 192)
!121 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_format", file: !1, line: 25, baseType: !3)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "csv_separator", scope: !101, file: !1, line: 31, baseType: !67, size: 16, offset: 224)
!123 = !DILocation(line: 49, column: 15, scope: !78)
!124 = !DILocation(line: 50, column: 3, scope: !78)
!125 = !DILocation(line: 52, column: 7, scope: !78)
!126 = !DILocation(line: 52, column: 24, scope: !78)
!127 = !DILocation(line: 53, column: 14, scope: !78)
!128 = !DILocation(line: 53, column: 24, scope: !78)
!129 = !DILocation(line: 54, column: 3, scope: !78)
!130 = !DILocation(line: 54, column: 24, scope: !78)
!131 = !DILocation(line: 55, column: 14, scope: !78)
!132 = !DILocation(line: 55, column: 24, scope: !78)
!133 = !DILocation(line: 58, column: 22, scope: !78)
!134 = !DILocalVariable(name: "su", scope: !78, file: !1, line: 57, type: !14)
!135 = !DILocation(line: 58, column: 3, scope: !78)
!136 = !DILocation(line: 59, column: 15, scope: !78)
!137 = !DILocation(line: 59, column: 18, scope: !78)
!138 = !DILocation(line: 59, column: 3, scope: !78)
!139 = !DILocation(line: 60, column: 15, scope: !78)
!140 = !DILocation(line: 60, column: 18, scope: !78)
!141 = !DILocation(line: 60, column: 24, scope: !78)
!142 = !DILocation(line: 60, column: 3, scope: !78)
!143 = !DILocation(line: 61, column: 33, scope: !78)
!144 = !DILocation(line: 61, column: 21, scope: !78)
!145 = !DILocation(line: 61, column: 31, scope: !78)
!146 = !DILocation(line: 62, column: 14, scope: !78)
!147 = !DILocation(line: 62, column: 31, scope: !78)
!148 = !DILocation(line: 65, column: 22, scope: !78)
!149 = !DILocalVariable(name: "value", scope: !78, file: !1, line: 64, type: !150)
!150 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !151, line: 26, baseType: !152)
!151 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!152 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !17, line: 41, baseType: !81)
!153 = !DILocation(line: 65, column: 3, scope: !78)
!154 = !DILocation(line: 66, column: 25, scope: !78)
!155 = !DILocation(line: 66, column: 31, scope: !78)
!156 = !DILocation(line: 66, column: 15, scope: !78)
!157 = !DILocation(line: 66, column: 3, scope: !78)
!158 = !DILocation(line: 68, column: 26, scope: !78)
!159 = !DILocalVariable(name: "sser", scope: !78, file: !1, line: 68, type: !18)
!160 = !DILocation(line: 70, column: 64, scope: !78)
!161 = !DILocation(line: 70, column: 15, scope: !78)
!162 = !DILocalVariable(name: "r_ps", scope: !78, file: !1, line: 70, type: !81)
!163 = !DILocation(line: 72, column: 15, scope: !78)
!164 = !DILocalVariable(name: "r_ser", scope: !78, file: !1, line: 72, type: !81)
!165 = !DILocation(line: 74, column: 20, scope: !78)
!166 = !DILocation(line: 74, column: 25, scope: !78)
!167 = !DILocation(line: 74, column: 15, scope: !78)
!168 = !DILocation(line: 74, column: 3, scope: !78)
!169 = !DILocation(line: 75, column: 3, scope: !78)
!170 = distinct !DISubprogram(name: "predicate_printable_string_oob_read", scope: !29, file: !29, line: 20, type: !171, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !30)
!171 = !DISubroutineType(types: !172)
!172 = !{!81, !173, !11, !11}
!173 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !27)
!174 = !DILocalVariable(name: "str", arg: 1, scope: !170, file: !29, line: 20, type: !173)
!175 = !DILocation(line: 0, scope: !170)
!176 = !DILocalVariable(name: "len", arg: 2, scope: !170, file: !29, line: 20, type: !11)
!177 = !DILocalVariable(name: "buf_size", arg: 3, scope: !170, file: !29, line: 21, type: !11)
!178 = !DILocation(line: 23, column: 11, scope: !179)
!179 = distinct !DILexicalBlock(scope: !170, file: !29, line: 23, column: 7)
!180 = !DILocation(line: 23, column: 7, scope: !170)
!181 = !DILocation(line: 33, column: 1, scope: !170)
!182 = distinct !DISubprogram(name: "predicate_serializer_int32_oob_write", scope: !34, file: !34, line: 66, type: !183, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !30)
!183 = !DISubroutineType(types: !184)
!184 = !{!81, !185, !190, !150}
!185 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !186, size: 64)
!186 = !DIDerivedType(tag: DW_TAG_typedef, name: "ser_serializer", file: !34, line: 64, baseType: !187)
!187 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !34, line: 64, size: 256, elements: !188)
!188 = !{!189}
!189 = !DIDerivedType(tag: DW_TAG_member, name: "c", scope: !187, file: !34, line: 64, baseType: !23, size: 256)
!190 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !191, size: 64)
!191 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !24)
!192 = !DILocalVariable(name: "_serializer", arg: 1, scope: !182, file: !34, line: 66, type: !185)
!193 = !DILocation(line: 0, scope: !182)
!194 = !DILocalVariable(name: "key", arg: 2, scope: !182, file: !34, line: 67, type: !190)
!195 = !DILocalVariable(name: "value", arg: 3, scope: !182, file: !34, line: 68, type: !150)
!196 = !DILocalVariable(name: "serializer", scope: !182, file: !34, line: 70, type: !38)
!197 = !DILocation(line: 72, column: 19, scope: !198)
!198 = distinct !DILexicalBlock(scope: !182, file: !34, line: 72, column: 7)
!199 = !DILocation(line: 72, column: 23, scope: !198)
!200 = !DILocation(line: 72, column: 7, scope: !182)
!201 = !DILocation(line: 75, column: 26, scope: !202)
!202 = distinct !DILexicalBlock(scope: !182, file: !34, line: 75, column: 7)
!203 = !DILocation(line: 75, column: 31, scope: !202)
!204 = !DILocation(line: 75, column: 7, scope: !182)
!205 = !DILocation(line: 78, column: 26, scope: !206)
!206 = distinct !DILexicalBlock(scope: !182, file: !34, line: 78, column: 7)
!207 = !DILocation(line: 78, column: 33, scope: !206)
!208 = !DILocation(line: 78, column: 57, scope: !206)
!209 = !DILocation(line: 78, column: 64, scope: !206)
!210 = !DILocation(line: 78, column: 43, scope: !206)
!211 = !DILocation(line: 78, column: 7, scope: !182)
!212 = !DILocalVariable(name: "buff_diff", scope: !182, file: !34, line: 80, type: !47)
!213 = !DILocalVariable(name: "needed", scope: !182, file: !34, line: 82, type: !214)
!214 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int16_t", file: !34, line: 32, baseType: !215)
!215 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !15, line: 25, baseType: !216)
!216 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !17, line: 40, baseType: !217)
!217 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!218 = !DILocalVariable(name: "size_used_after", scope: !182, file: !34, line: 94, type: !47)
!219 = !DILocation(line: 95, column: 28, scope: !220)
!220 = distinct !DILexicalBlock(scope: !182, file: !34, line: 95, column: 7)
!221 = !DILocation(line: 95, column: 34, scope: !220)
!222 = !DILocation(line: 95, column: 52, scope: !220)
!223 = !DILocation(line: 97, column: 25, scope: !224)
!224 = distinct !DILexicalBlock(scope: !225, file: !34, line: 97, column: 9)
!225 = distinct !DILexicalBlock(scope: !220, file: !34, line: 95, column: 76)
!226 = !DILocation(line: 97, column: 9, scope: !225)
!227 = !DILocation(line: 98, column: 20, scope: !225)
!228 = !DILocation(line: 99, column: 3, scope: !225)
!229 = !DILocation(line: 104, column: 23, scope: !230)
!230 = distinct !DILexicalBlock(scope: !182, file: !34, line: 104, column: 7)
!231 = !DILocation(line: 114, column: 1, scope: !182)
!232 = distinct !DISubprogram(name: "memset", scope: !233, file: !233, line: 12, type: !234, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !70, retainedNodes: !30)
!233 = !DIFile(filename: "runtime/Freestanding/memset.c", directory: "/home/wcontrerasmartinez/klee")
!234 = !DISubroutineType(types: !235)
!235 = !{!32, !32, !81, !11}
!236 = !DILocalVariable(name: "dst", arg: 1, scope: !232, file: !233, line: 12, type: !32)
!237 = !DILocation(line: 0, scope: !232)
!238 = !DILocalVariable(name: "s", arg: 2, scope: !232, file: !233, line: 12, type: !81)
!239 = !DILocalVariable(name: "count", arg: 3, scope: !232, file: !233, line: 12, type: !11)
!240 = !DILocalVariable(name: "a", scope: !232, file: !233, line: 13, type: !27)
!241 = !DILocation(line: 14, column: 18, scope: !232)
!242 = !DILocation(line: 14, column: 3, scope: !232)
!243 = !DILocation(line: 14, column: 15, scope: !232)
!244 = !DILocation(line: 15, column: 7, scope: !232)
!245 = !DILocation(line: 15, column: 10, scope: !232)
!246 = distinct !{!246, !242, !247, !248}
!247 = !DILocation(line: 15, column: 12, scope: !232)
!248 = !{!"llvm.loop.mustprogress"}
!249 = !DILocation(line: 16, column: 3, scope: !232)
