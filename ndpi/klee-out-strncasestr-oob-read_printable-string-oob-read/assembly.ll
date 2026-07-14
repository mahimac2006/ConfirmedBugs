; ModuleID = 'linked_strncasestr-oob-read_printable-string-oob-read.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"needle\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"ps_len\00", align 1
@.str.3 = private unnamed_addr constant [67 x i8] c"0 && \22REACHED_BOTH_strncasestr-oob-read_printable-string-oob-read\22\00", align 1
@.str.4 = private unnamed_addr constant [56 x i8] c"driver_strncasestr-oob-read_printable-string-oob-read.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [15 x i8] c"int main(void)\00", align 1

; Function Attrs: noinline noreturn nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !23 {
  %1 = alloca [256 x i8], align 16
  %2 = alloca [258 x i8], align 16
  %3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata [256 x i8]* %1, metadata !27, metadata !DIExpression()), !dbg !36
  %4 = getelementptr inbounds [256 x i8], [256 x i8]* %1, i64 0, i64 0, !dbg !37
  call void @klee_make_symbolic(i8* nonnull %4, i64 256, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)) #7, !dbg !38
  call void @llvm.dbg.declare(metadata [258 x i8]* %2, metadata !39, metadata !DIExpression()), !dbg !43
  %5 = getelementptr inbounds [258 x i8], [258 x i8]* %2, i64 0, i64 0, !dbg !44
  call void @klee_make_symbolic(i8* nonnull %5, i64 258, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)) #7, !dbg !45
  %6 = getelementptr inbounds [258 x i8], [258 x i8]* %2, i64 0, i64 257, !dbg !46
  store i8 0, i8* %6, align 1, !dbg !47
  call void @llvm.dbg.value(metadata i32 0, metadata !48, metadata !DIExpression()), !dbg !50
  br label %7, !dbg !51

7:                                                ; preds = %0, %7
  %indvars.iv = phi i64 [ 0, %0 ], [ %indvars.iv.next, %7 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !48, metadata !DIExpression()), !dbg !50
  %8 = getelementptr inbounds [258 x i8], [258 x i8]* %2, i64 0, i64 %indvars.iv, !dbg !52
  %9 = load i8, i8* %8, align 1, !dbg !52
  %10 = icmp ne i8 %9, 0, !dbg !54
  %11 = zext i1 %10 to i64, !dbg !52
  call void @klee_assume(i64 %11) #7, !dbg !55
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !56
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !48, metadata !DIExpression()), !dbg !50
  %exitcond.not = icmp eq i64 %indvars.iv.next, 256, !dbg !57
  br i1 %exitcond.not, label %12, label %7, !dbg !51, !llvm.loop !58

12:                                               ; preds = %7
  %13 = bitcast i64* %3 to i8*, !dbg !61
  call void @llvm.dbg.value(metadata i64* %3, metadata !62, metadata !DIExpression(DW_OP_deref)), !dbg !63
  call void @klee_make_symbolic(i8* nonnull %13, i64 8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0)) #7, !dbg !64
  %14 = load i64, i64* %3, align 8, !dbg !65
  call void @llvm.dbg.value(metadata i64 %14, metadata !62, metadata !DIExpression()), !dbg !63
  %15 = icmp ugt i64 %14, 256, !dbg !66
  %16 = zext i1 %15 to i64, !dbg !65
  call void @klee_assume(i64 %16) #7, !dbg !67
  %17 = load i64, i64* %3, align 8, !dbg !68
  call void @llvm.dbg.value(metadata i64 %17, metadata !62, metadata !DIExpression()), !dbg !63
  %18 = icmp ult i64 %17, 513, !dbg !69
  %19 = zext i1 %18 to i64, !dbg !68
  call void @klee_assume(i64 %19) #7, !dbg !70
  %20 = call fastcc i32 @predicate_strncasestr_oob_read(i8* nonnull %4, i8* nonnull %5), !dbg !71
  call void @llvm.dbg.value(metadata i32 %20, metadata !72, metadata !DIExpression()), !dbg !63
  %21 = load i64, i64* %3, align 8, !dbg !73
  call void @llvm.dbg.value(metadata i64 %21, metadata !62, metadata !DIExpression()), !dbg !63
  %22 = call fastcc i32 @predicate_printable_string_oob_read(i8* nonnull %4, i64 %21), !dbg !74
  call void @llvm.dbg.value(metadata i32 %22, metadata !75, metadata !DIExpression()), !dbg !63
  %23 = icmp eq i32 %20, 1, !dbg !76
  %24 = icmp eq i32 %22, 1, !dbg !77
  %25 = select i1 %23, i1 %24, i1 false, !dbg !77
  %26 = zext i1 %25 to i64, !dbg !78
  call void @klee_assume(i64 %26) #7, !dbg !79
  call void @__assert_fail(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.4, i64 0, i64 0), i32 48, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #8, !dbg !80
  unreachable, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) local_unnamed_addr #2

declare dso_local void @klee_assume(i64) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #3

; Function Attrs: mustprogress nofree noinline nounwind readonly uwtable willreturn
define internal fastcc i32 @predicate_strncasestr_oob_read(i8* readonly %0, i8* readonly %1) unnamed_addr #4 !dbg !81 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i8* %1, metadata !86, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i64 256, metadata !87, metadata !DIExpression()), !dbg !85
  %3 = icmp eq i8* %0, null, !dbg !88
  %4 = icmp eq i8* %1, null
  %or.cond = select i1 %3, i1 true, i1 %4, !dbg !90
  br i1 %or.cond, label %11, label %5, !dbg !90

5:                                                ; preds = %2
  call void @llvm.dbg.value(metadata i64 undef, metadata !91, metadata !DIExpression()), !dbg !85
  %6 = tail call i64 @strlen(i8* noundef nonnull dereferenceable(1) %1) #9, !dbg !92
  call void @llvm.dbg.value(metadata i64 %6, metadata !93, metadata !DIExpression()), !dbg !85
  %7 = icmp eq i64 %6, 0, !dbg !94
  br i1 %7, label %11, label %8, !dbg !96

8:                                                ; preds = %5
  %9 = tail call i64 @strnlen(i8* %0, i64 256) #9, !dbg !97
  call void @llvm.dbg.value(metadata i64 %9, metadata !91, metadata !DIExpression()), !dbg !85
  %10 = icmp ult i64 %9, %6, !dbg !98
  %. = zext i1 %10 to i32, !dbg !85
  br label %11, !dbg !85

11:                                               ; preds = %8, %5, %2
  %.0 = phi i32 [ 0, %2 ], [ 0, %5 ], [ %., %8 ], !dbg !85
  ret i32 %.0, !dbg !100
}

; Function Attrs: mustprogress nofree nounwind readonly willreturn
declare dso_local i64 @strnlen(i8*, i64) local_unnamed_addr #5

; Function Attrs: mustprogress nofree nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) local_unnamed_addr #5

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readnone uwtable willreturn
define internal fastcc i32 @predicate_printable_string_oob_read(i8* readnone %0, i64 %1) unnamed_addr #6 !dbg !101 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.value(metadata i64 %1, metadata !107, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.value(metadata i64 256, metadata !108, metadata !DIExpression()), !dbg !106
  %3 = icmp ne i8* %0, null, !dbg !109
  %4 = icmp ne i64 %1, 0
  %or.cond = select i1 %3, i1 %4, i1 false, !dbg !111
  %5 = icmp ugt i64 %1, 256, !dbg !111
  %narrow = select i1 %or.cond, i1 %5, i1 false, !dbg !111
  %.0 = zext i1 %narrow to i32, !dbg !111
  ret i32 %.0, !dbg !112
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline noreturn nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree noinline nounwind readonly uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree noinline norecurse nosync nounwind readnone uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0, !11, !15}
!llvm.ident = !{!17, !17, !17}
!llvm.module.flags = !{!18, !19, !20, !21, !22}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "driver_strncasestr-oob-read_printable-string-oob-read.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!2 = !{}
!3 = !{!4, !7, !10}
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !5, line: 46, baseType: !6)
!5 = !DIFile(filename: "/usr/lib/llvm-13/lib/clang/13.0.1/include/stddef.h", directory: "")
!6 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!9 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!11 = distinct !DICompileUnit(language: DW_LANG_C99, file: !12, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !13, splitDebugInlining: false, nameTableKind: None)
!12 = !DIFile(filename: "predicate_strncasestr-oob-read.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!13 = !{!14}
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!15 = distinct !DICompileUnit(language: DW_LANG_C99, file: !16, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !13, splitDebugInlining: false, nameTableKind: None)
!16 = !DIFile(filename: "predicate_printable-string-oob-read.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!17 = !{!"Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8"}
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 25, type: !24, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!24 = !DISubroutineType(types: !25)
!25 = !{!26}
!26 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!27 = !DILocalVariable(name: "buf", scope: !23, file: !1, line: 26, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 2048, elements: !34)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !30, line: 24, baseType: !31)
!30 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !32, line: 38, baseType: !33)
!32 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!33 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!34 = !{!35}
!35 = !DISubrange(count: 256)
!36 = !DILocation(line: 26, column: 11, scope: !23)
!37 = !DILocation(line: 27, column: 22, scope: !23)
!38 = !DILocation(line: 27, column: 3, scope: !23)
!39 = !DILocalVariable(name: "needle", scope: !23, file: !1, line: 30, type: !40)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 2064, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 258)
!43 = !DILocation(line: 30, column: 8, scope: !23)
!44 = !DILocation(line: 31, column: 22, scope: !23)
!45 = !DILocation(line: 31, column: 3, scope: !23)
!46 = !DILocation(line: 32, column: 3, scope: !23)
!47 = !DILocation(line: 32, column: 23, scope: !23)
!48 = !DILocalVariable(name: "k", scope: !49, file: !1, line: 33, type: !26)
!49 = distinct !DILexicalBlock(scope: !23, file: !1, line: 33, column: 3)
!50 = !DILocation(line: 0, scope: !49)
!51 = !DILocation(line: 33, column: 3, scope: !49)
!52 = !DILocation(line: 34, column: 17, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !1, line: 33, column: 3)
!54 = !DILocation(line: 34, column: 27, scope: !53)
!55 = !DILocation(line: 34, column: 5, scope: !53)
!56 = !DILocation(line: 33, column: 33, scope: !53)
!57 = !DILocation(line: 33, column: 21, scope: !53)
!58 = distinct !{!58, !51, !59, !60}
!59 = !DILocation(line: 34, column: 34, scope: !49)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 38, column: 22, scope: !23)
!62 = !DILocalVariable(name: "ps_len", scope: !23, file: !1, line: 37, type: !4)
!63 = !DILocation(line: 0, scope: !23)
!64 = !DILocation(line: 38, column: 3, scope: !23)
!65 = !DILocation(line: 39, column: 15, scope: !23)
!66 = !DILocation(line: 39, column: 22, scope: !23)
!67 = !DILocation(line: 39, column: 3, scope: !23)
!68 = !DILocation(line: 40, column: 15, scope: !23)
!69 = !DILocation(line: 40, column: 22, scope: !23)
!70 = !DILocation(line: 40, column: 3, scope: !23)
!71 = !DILocation(line: 42, column: 15, scope: !23)
!72 = !DILocalVariable(name: "r_str", scope: !23, file: !1, line: 42, type: !26)
!73 = !DILocation(line: 44, column: 64, scope: !23)
!74 = !DILocation(line: 44, column: 15, scope: !23)
!75 = !DILocalVariable(name: "r_ps", scope: !23, file: !1, line: 44, type: !26)
!76 = !DILocation(line: 47, column: 21, scope: !23)
!77 = !DILocation(line: 47, column: 26, scope: !23)
!78 = !DILocation(line: 47, column: 15, scope: !23)
!79 = !DILocation(line: 47, column: 3, scope: !23)
!80 = !DILocation(line: 48, column: 3, scope: !23)
!81 = distinct !DISubprogram(name: "predicate_strncasestr_oob_read", scope: !12, file: !12, line: 22, type: !82, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !11, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!26, !7, !7, !4}
!84 = !DILocalVariable(name: "str1", arg: 1, scope: !81, file: !12, line: 22, type: !7)
!85 = !DILocation(line: 0, scope: !81)
!86 = !DILocalVariable(name: "str2", arg: 2, scope: !81, file: !12, line: 22, type: !7)
!87 = !DILocalVariable(name: "len", arg: 3, scope: !81, file: !12, line: 23, type: !4)
!88 = !DILocation(line: 25, column: 12, scope: !89)
!89 = distinct !DILexicalBlock(scope: !81, file: !12, line: 25, column: 7)
!90 = !DILocation(line: 25, column: 20, scope: !89)
!91 = !DILocalVariable(name: "str1_len", scope: !81, file: !12, line: 28, type: !4)
!92 = !DILocation(line: 29, column: 21, scope: !81)
!93 = !DILocalVariable(name: "str2_len", scope: !81, file: !12, line: 29, type: !4)
!94 = !DILocation(line: 31, column: 16, scope: !95)
!95 = distinct !DILexicalBlock(scope: !81, file: !12, line: 31, column: 7)
!96 = !DILocation(line: 31, column: 7, scope: !81)
!97 = !DILocation(line: 28, column: 21, scope: !81)
!98 = !DILocation(line: 38, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !81, file: !12, line: 38, column: 7)
!100 = !DILocation(line: 41, column: 1, scope: !81)
!101 = distinct !DISubprogram(name: "predicate_printable_string_oob_read", scope: !16, file: !16, line: 20, type: !102, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !2)
!102 = !DISubroutineType(types: !103)
!103 = !{!26, !104, !4, !4}
!104 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !10)
!105 = !DILocalVariable(name: "str", arg: 1, scope: !101, file: !16, line: 20, type: !104)
!106 = !DILocation(line: 0, scope: !101)
!107 = !DILocalVariable(name: "len", arg: 2, scope: !101, file: !16, line: 20, type: !4)
!108 = !DILocalVariable(name: "buf_size", arg: 3, scope: !101, file: !16, line: 21, type: !4)
!109 = !DILocation(line: 23, column: 11, scope: !110)
!110 = distinct !DILexicalBlock(scope: !101, file: !16, line: 23, column: 7)
!111 = !DILocation(line: 23, column: 7, scope: !101)
!112 = !DILocation(line: 33, column: 1, scope: !101)
