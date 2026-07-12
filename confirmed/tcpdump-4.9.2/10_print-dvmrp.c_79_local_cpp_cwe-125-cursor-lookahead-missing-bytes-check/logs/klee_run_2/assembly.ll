; ModuleID = '/app/se_runs/sailor_engine/tcpdump-4.9.2/217_print-dvmrp.c_79_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness/slice.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.netdissect_options = type { i8*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@.str.3 = private unnamed_addr constant [30 x i8] c"SPINE_PROBE:dvmrp_print:ENTRY\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"SPINE_PROBE:dvmrp_print:CASE_0\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"SPINE_PROBE:dvmrp_print:CASE_1\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !33 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.netdissect_options*, align 8
  %3 = alloca i8*, align 8
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %2, metadata !38, metadata !DIExpression()), !dbg !39
  %4 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 16) #4, !dbg !40
  %5 = bitcast i8* %4 to %struct.netdissect_options*, !dbg !41
  store %struct.netdissect_options* %5, %struct.netdissect_options** %2, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i8** %3, metadata !42, metadata !DIExpression()), !dbg !43
  %6 = call noalias i8* @malloc(i64 noundef 16) #4, !dbg !44
  store i8* %6, i8** %3, align 8, !dbg !43
  %7 = load i8*, i8** %3, align 8, !dbg !45
  call void @klee_make_symbolic(i8* noundef %7, i64 noundef 16, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !46
  %8 = load i8*, i8** %3, align 8, !dbg !47
  %9 = getelementptr inbounds i8, i8* %8, i64 16, !dbg !48
  %10 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !49
  %11 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %10, i32 0, i32 0, !dbg !50
  store i8* %9, i8** %11, align 8, !dbg !51
  %12 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !52
  %13 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %12, i32 0, i32 1, !dbg !53
  store i32 2, i32* %13, align 8, !dbg !54
  %14 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !55
  %15 = load i8*, i8** %3, align 8, !dbg !56
  %16 = call i32 (%struct.netdissect_options*, i8*, i32, ...) bitcast (void (%struct.netdissect_options*, i8*, i32)* @dvmrp_print to i32 (%struct.netdissect_options*, i8*, i32, ...)*)(%struct.netdissect_options* noundef %14, i8* noundef %15, i32 noundef 16), !dbg !57
  ret i32 0, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) local_unnamed_addr #2

declare void @klee_make_symbolic(i8* noundef, i64 noundef, i8* noundef) local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @dvmrp_print(%struct.netdissect_options* noundef %0, i8* noundef %1, i32 noundef %2) unnamed_addr #0 !dbg !59 {
  %4 = alloca %struct.netdissect_options*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i8, align 1
  store %struct.netdissect_options* %0, %struct.netdissect_options** %4, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %4, metadata !70, metadata !DIExpression()), !dbg !71
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !72, metadata !DIExpression()), !dbg !73
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !74, metadata !DIExpression()), !dbg !75
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([30 x i8], [30 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  call void @llvm.dbg.declare(metadata i8** %7, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i8* %8, metadata !79, metadata !DIExpression()), !dbg !80
  %9 = load %struct.netdissect_options*, %struct.netdissect_options** %4, align 8, !dbg !81
  %10 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %9, i32 0, i32 0, !dbg !82
  %11 = load i8*, i8** %10, align 8, !dbg !82
  store i8* %11, i8** %7, align 8, !dbg !83
  %12 = load i8*, i8** %5, align 8, !dbg !84
  %13 = load i8*, i8** %7, align 8, !dbg !86
  %14 = icmp uge i8* %12, %13, !dbg !87
  br i1 %14, label %15, label %16, !dbg !88

15:                                               ; preds = %3
  br label %47, !dbg !89

16:                                               ; preds = %3
  br label %17, !dbg !90

17:                                               ; preds = %16
  br label %18, !dbg !91

18:                                               ; preds = %17
  %19 = load i8*, i8** %5, align 8, !dbg !93
  %20 = getelementptr inbounds i8, i8* %19, i64 1, !dbg !93
  %21 = load i8, i8* %20, align 1, !dbg !93
  store i8 %21, i8* %8, align 1, !dbg !94
  %22 = load i8*, i8** %5, align 8, !dbg !95
  %23 = getelementptr inbounds i8, i8* %22, i64 8, !dbg !95
  store i8* %23, i8** %5, align 8, !dbg !95
  %24 = load i32, i32* %6, align 4, !dbg !96
  %25 = sub i32 %24, 8, !dbg !96
  store i32 %25, i32* %6, align 4, !dbg !96
  %26 = load i8, i8* %8, align 1, !dbg !97
  %27 = zext i8 %26 to i32, !dbg !97
  switch i32 %27, label %46 [
    i32 0, label %28
    i32 1, label %37
  ], !dbg !98

28:                                               ; preds = %18
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  br label %29, !dbg !101

29:                                               ; preds = %28
  br label %30, !dbg !102

30:                                               ; preds = %29
  %31 = load %struct.netdissect_options*, %struct.netdissect_options** %4, align 8, !dbg !104
  %32 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %31, i32 0, i32 1, !dbg !106
  %33 = load i32, i32* %32, align 8, !dbg !106
  %34 = icmp ne i32 %33, 0, !dbg !104
  br i1 %34, label %35, label %36, !dbg !107

35:                                               ; preds = %30
  br label %47, !dbg !108

36:                                               ; preds = %30
  br label %47, !dbg !110

37:                                               ; preds = %18
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.2, i64 0, i64 0)), !dbg !111
  br label %38, !dbg !112

38:                                               ; preds = %37
  br label %39, !dbg !113

39:                                               ; preds = %38
  %40 = load %struct.netdissect_options*, %struct.netdissect_options** %4, align 8, !dbg !115
  %41 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %40, i32 0, i32 1, !dbg !117
  %42 = load i32, i32* %41, align 8, !dbg !117
  %43 = icmp sgt i32 %42, 1, !dbg !118
  br i1 %43, label %44, label %45, !dbg !119

44:                                               ; preds = %39
  br label %47, !dbg !120

45:                                               ; preds = %39
  br label %47, !dbg !122

46:                                               ; preds = %18
  br label %47, !dbg !123

47:                                               ; preds = %15, %46, %45, %44, %36, %35
  ret void, !dbg !124
}

declare void @klee_warning_once(i8* noundef) local_unnamed_addr #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0, !16, !23}
!llvm.ident = !{!25, !25, !25}
!llvm.module.flags = !{!26, !27, !28, !29, !30, !31, !32}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/217_print-dvmrp.c_79_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness/driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/217_print-dvmrp.c_79_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "ff23468487d63267ff4c220b02d1be9e")
!2 = !{!3, !15}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "netdissect_options", file: !5, line: 14, baseType: !6)
!5 = !DIFile(filename: "harness_types.h", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/217_print-dvmrp.c_79_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "44636d18de83ce11a7a8f0652cb11689")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !5, line: 11, size: 128, elements: !7)
!7 = !{!8, !13}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_snapend", scope: !6, file: !5, line: 12, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !5, line: 8, baseType: !12)
!12 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_vflag", scope: !6, file: !5, line: 13, baseType: !14, size: 32, offset: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!16 = distinct !DICompileUnit(language: DW_LANG_C99, file: !17, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !18, splitDebugInlining: false, nameTableKind: None)
!17 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/217_print-dvmrp.c_79_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness/print-dvmrp.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/217_print-dvmrp.c_79_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "72b349284d0af89944185dce99c2191a")
!18 = !{!19}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !22, line: 6, baseType: !12)
!22 = !DIFile(filename: "print-dvmrp.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/217_print-dvmrp.c_79_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "72b349284d0af89944185dce99c2191a")
!23 = distinct !DICompileUnit(language: DW_LANG_C99, file: !24, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!24 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/217_print-dvmrp.c_79_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness/smart_stubs.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/217_print-dvmrp.c_79_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "bcda1acd1a733c696e028616d9d6f3b5")
!25 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!26 = !{i32 7, !"Dwarf Version", i32 5}
!27 = !{i32 2, !"Debug Info Version", i32 3}
!28 = !{i32 1, !"wchar_size", i32 4}
!29 = !{i32 7, !"PIC Level", i32 2}
!30 = !{i32 7, !"PIE Level", i32 2}
!31 = !{i32 7, !"uwtable", i32 1}
!32 = !{i32 7, !"frame-pointer", i32 2}
!33 = distinct !DISubprogram(name: "main", scope: !34, file: !34, line: 5, type: !35, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !37)
!34 = !DIFile(filename: "driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/217_print-dvmrp.c_79_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "ff23468487d63267ff4c220b02d1be9e")
!35 = !DISubroutineType(types: !36)
!36 = !{!14}
!37 = !{}
!38 = !DILocalVariable(name: "ndo", scope: !33, file: !34, line: 6, type: !3)
!39 = !DILocation(line: 6, column: 25, scope: !33)
!40 = !DILocation(line: 6, column: 53, scope: !33)
!41 = !DILocation(line: 6, column: 31, scope: !33)
!42 = !DILocalVariable(name: "buf", scope: !33, file: !34, line: 7, type: !15)
!43 = !DILocation(line: 7, column: 13, scope: !33)
!44 = !DILocation(line: 7, column: 29, scope: !33)
!45 = !DILocation(line: 8, column: 24, scope: !33)
!46 = !DILocation(line: 8, column: 5, scope: !33)
!47 = !DILocation(line: 10, column: 24, scope: !33)
!48 = !DILocation(line: 10, column: 28, scope: !33)
!49 = !DILocation(line: 10, column: 5, scope: !33)
!50 = !DILocation(line: 10, column: 10, scope: !33)
!51 = !DILocation(line: 10, column: 22, scope: !33)
!52 = !DILocation(line: 11, column: 5, scope: !33)
!53 = !DILocation(line: 11, column: 10, scope: !33)
!54 = !DILocation(line: 11, column: 20, scope: !33)
!55 = !DILocation(line: 13, column: 17, scope: !33)
!56 = !DILocation(line: 13, column: 22, scope: !33)
!57 = !DILocation(line: 13, column: 5, scope: !33)
!58 = !DILocation(line: 14, column: 5, scope: !33)
!59 = distinct !DISubprogram(name: "dvmrp_print", scope: !22, file: !22, line: 17, type: !60, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !37)
!60 = !DISubroutineType(types: !61)
!61 = !{null, !62, !19, !68}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "netdissect_options", file: !22, line: 12, baseType: !64)
!64 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !22, line: 9, size: 128, elements: !65)
!65 = !{!66, !67}
!66 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_snapend", scope: !64, file: !22, line: 10, baseType: !19, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_vflag", scope: !64, file: !22, line: 11, baseType: !14, size: 32, offset: 64)
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !22, line: 7, baseType: !69)
!69 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!70 = !DILocalVariable(name: "ndo", arg: 1, scope: !59, file: !22, line: 17, type: !62)
!71 = !DILocation(line: 17, column: 38, scope: !59)
!72 = !DILocalVariable(name: "bp", arg: 2, scope: !59, file: !22, line: 18, type: !19)
!73 = !DILocation(line: 18, column: 41, scope: !59)
!74 = !DILocalVariable(name: "len", arg: 3, scope: !59, file: !22, line: 18, type: !68)
!75 = !DILocation(line: 18, column: 60, scope: !59)
!76 = !DILocation(line: 20, column: 5, scope: !59)
!77 = !DILocalVariable(name: "ep", scope: !59, file: !22, line: 21, type: !19)
!78 = !DILocation(line: 21, column: 28, scope: !59)
!79 = !DILocalVariable(name: "type", scope: !59, file: !22, line: 22, type: !21)
!80 = !DILocation(line: 22, column: 21, scope: !59)
!81 = !DILocation(line: 24, column: 26, scope: !59)
!82 = !DILocation(line: 24, column: 31, scope: !59)
!83 = !DILocation(line: 24, column: 8, scope: !59)
!84 = !DILocation(line: 25, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !59, file: !22, line: 25, column: 9)
!86 = !DILocation(line: 25, column: 15, scope: !85)
!87 = !DILocation(line: 25, column: 12, scope: !85)
!88 = !DILocation(line: 25, column: 9, scope: !59)
!89 = !DILocation(line: 26, column: 9, scope: !85)
!90 = !DILocation(line: 28, column: 5, scope: !59)
!91 = !DILocation(line: 28, column: 5, scope: !92)
!92 = distinct !DILexicalBlock(scope: !59, file: !22, line: 28, column: 5)
!93 = !DILocation(line: 29, column: 12, scope: !59)
!94 = !DILocation(line: 29, column: 10, scope: !59)
!95 = !DILocation(line: 32, column: 8, scope: !59)
!96 = !DILocation(line: 33, column: 9, scope: !59)
!97 = !DILocation(line: 35, column: 13, scope: !59)
!98 = !DILocation(line: 35, column: 5, scope: !59)
!99 = !DILocation(line: 37, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !59, file: !22, line: 35, column: 19)
!101 = !DILocation(line: 38, column: 9, scope: !100)
!102 = !DILocation(line: 38, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !22, line: 38, column: 9)
!104 = !DILocation(line: 39, column: 13, scope: !105)
!105 = distinct !DILexicalBlock(scope: !100, file: !22, line: 39, column: 13)
!106 = !DILocation(line: 39, column: 18, scope: !105)
!107 = !DILocation(line: 39, column: 13, scope: !100)
!108 = !DILocation(line: 40, column: 13, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !22, line: 39, column: 29)
!110 = !DILocation(line: 42, column: 9, scope: !100)
!111 = !DILocation(line: 44, column: 9, scope: !100)
!112 = !DILocation(line: 45, column: 9, scope: !100)
!113 = !DILocation(line: 45, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !100, file: !22, line: 45, column: 9)
!115 = !DILocation(line: 46, column: 13, scope: !116)
!116 = distinct !DILexicalBlock(scope: !100, file: !22, line: 46, column: 13)
!117 = !DILocation(line: 46, column: 18, scope: !116)
!118 = !DILocation(line: 46, column: 28, scope: !116)
!119 = !DILocation(line: 46, column: 13, scope: !100)
!120 = !DILocation(line: 47, column: 13, scope: !121)
!121 = distinct !DILexicalBlock(scope: !116, file: !22, line: 46, column: 33)
!122 = !DILocation(line: 49, column: 9, scope: !100)
!123 = !DILocation(line: 51, column: 9, scope: !100)
!124 = !DILocation(line: 54, column: 1, scope: !59)
