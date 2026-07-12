; ModuleID = '/app/se_runs/sailor_engine/tcpdump-4.9.2/096_print-babel.c_127_local_cpp_cwe-125-oob-read/harness/slice.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.netdissect_options = type { i32 }

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@.str.1.4 = private unnamed_addr constant [30 x i8] c"SPINE_PROBE:babel_print:ENTRY\00", align 1
@.str.2 = private unnamed_addr constant [32 x i8] c"SPINE_PROBE:format_prefix:ENTRY\00", align 1
@.str.3 = private unnamed_addr constant [112 x i8] c"/app/se_runs/sailor_engine/tcpdump-4.9.2/096_print-babel.c_127_local_cpp_cwe-125-oob-read/harness/print-babel.c\00", align 1
@.str.4 = private unnamed_addr constant [47 x i8] c"SAILOR OOB: buffer too small for access length\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"sailor.ptr.err\00", align 1
@.str.6 = private unnamed_addr constant [27 x i8] c"0 && \22SAILOR_SINK_REACHED\22\00", align 1
@__PRETTY_FUNCTION__.format_prefix = private unnamed_addr constant [79 x i8] c"const char *format_prefix(netdissect_options *, const u_char *, unsigned char)\00", align 1

; Function Attrs: noinline noreturn nounwind optnone uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !51 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.netdissect_options*, align 8
  %3 = alloca i8*, align 8
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %2, metadata !55, metadata !DIExpression()), !dbg !56
  %4 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 4) #5, !dbg !57
  %5 = bitcast i8* %4 to %struct.netdissect_options*, !dbg !58
  store %struct.netdissect_options* %5, %struct.netdissect_options** %2, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata i8** %3, metadata !59, metadata !DIExpression()), !dbg !60
  %6 = call noalias i8* @calloc(i64 noundef 64, i64 noundef 1) #5, !dbg !61
  store i8* %6, i8** %3, align 8, !dbg !60
  %7 = load i8*, i8** %3, align 8, !dbg !62
  call void @klee_make_symbolic(i8* noundef %7, i64 noundef 64, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !63
  %8 = load i8*, i8** %3, align 8, !dbg !64
  %9 = getelementptr inbounds i8, i8* %8, i64 0, !dbg !64
  store i8 0, i8* %9, align 1, !dbg !65
  %10 = load i8*, i8** %3, align 8, !dbg !66
  %11 = getelementptr inbounds i8, i8* %10, i64 1, !dbg !66
  store i8 0, i8* %11, align 1, !dbg !67
  %12 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !68
  %13 = load i8*, i8** %3, align 8, !dbg !69
  %14 = call i32 (%struct.netdissect_options*, i8*, i32, ...) bitcast (void (%struct.netdissect_options*, i8*, i32)* @babel_print to i32 (%struct.netdissect_options*, i8*, i32, ...)*)(%struct.netdissect_options* noundef %12, i8* noundef %13, i32 noundef 64), !dbg !70
  unreachable, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

declare void @klee_make_symbolic(i8* noundef, i64 noundef, i8* noundef) local_unnamed_addr #3

; Function Attrs: noinline noreturn nounwind optnone uwtable
define internal fastcc void @babel_print_v2(%struct.netdissect_options* noundef %0, i8* noundef %1, i32 noundef %2) unnamed_addr #0 !dbg !72 {
  %4 = alloca %struct.netdissect_options*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  store %struct.netdissect_options* %0, %struct.netdissect_options** %4, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %4, metadata !77, metadata !DIExpression()), !dbg !78
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !79, metadata !DIExpression()), !dbg !80
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !81, metadata !DIExpression()), !dbg !82
  %7 = load %struct.netdissect_options*, %struct.netdissect_options** %4, align 8, !dbg !83
  call fastcc void @format_prefix(%struct.netdissect_options* noundef %7), !dbg !84
  unreachable
}

; Function Attrs: noinline noreturn nounwind optnone uwtable
define internal fastcc void @format_prefix(%struct.netdissect_options* noundef %0) unnamed_addr #0 !dbg !22 {
  %2 = alloca %struct.netdissect_options*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8, align 1
  store %struct.netdissect_options* %0, %struct.netdissect_options** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %2, metadata !85, metadata !DIExpression()), !dbg !86
  store i8* null, i8** %3, align 8
  call void @llvm.dbg.declare(metadata i8** %3, metadata !87, metadata !DIExpression()), !dbg !88
  store i8 0, i8* %4, align 1
  call void @llvm.dbg.declare(metadata i8* %4, metadata !89, metadata !DIExpression()), !dbg !90
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  %5 = load i8*, i8** %3, align 8, !dbg !92
  %6 = call i64 @klee_get_obj_size(i8* noundef %5), !dbg !94
  %7 = icmp ult i64 %6, 12, !dbg !95
  br i1 %7, label %8, label %9, !dbg !96

8:                                                ; preds = %1
  call void @klee_report_error(i8* noundef getelementptr inbounds ([112 x i8], [112 x i8]* @.str.3, i64 0, i64 0), i32 noundef 0, i8* noundef getelementptr inbounds ([47 x i8], [47 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)) #6, !dbg !97
  unreachable, !dbg !97

9:                                                ; preds = %1
  %10 = call i32 (i8*, i8*, i32, i8*, ...) bitcast (i32 (...)* @__assert_fail to i32 (i8*, i8*, i32, i8*, ...)*)(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.6, i64 0, i64 0), i8* noundef getelementptr inbounds ([112 x i8], [112 x i8]* @.str.3, i64 0, i64 0), i32 noundef 20, i8* noundef getelementptr inbounds ([79 x i8], [79 x i8]* @__PRETTY_FUNCTION__.format_prefix, i64 0, i64 0)), !dbg !98
  unreachable, !dbg !99
}

declare void @klee_warning_once(i8* noundef) local_unnamed_addr #3

declare i64 @klee_get_obj_size(i8* noundef) local_unnamed_addr #3

; Function Attrs: noreturn
declare void @klee_report_error(i8* noundef, i32 noundef, i8* noundef, i8* noundef) local_unnamed_addr #4

; Function Attrs: noreturn
declare i32 @__assert_fail(...) local_unnamed_addr #4

; Function Attrs: noinline noreturn nounwind optnone uwtable
define internal void @babel_print(%struct.netdissect_options* noundef %0, i8* noundef %1, i32 noundef %2) unnamed_addr #0 !dbg !101 {
  %4 = alloca %struct.netdissect_options*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  store %struct.netdissect_options* %0, %struct.netdissect_options** %4, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %4, metadata !102, metadata !DIExpression()), !dbg !103
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !104, metadata !DIExpression()), !dbg !105
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !106, metadata !DIExpression()), !dbg !107
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([30 x i8], [30 x i8]* @.str.1.4, i64 0, i64 0)), !dbg !108
  %7 = load %struct.netdissect_options*, %struct.netdissect_options** %4, align 8, !dbg !109
  %8 = load i8*, i8** %5, align 8, !dbg !110
  %9 = load i32, i32* %6, align 4, !dbg !111
  call fastcc void @babel_print_v2(%struct.netdissect_options* noundef %7, i8* noundef %8, i32 noundef %9), !dbg !112
  unreachable
}

attributes #0 = { noinline noreturn nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn }

!llvm.dbg.cu = !{!0, !12, !41}
!llvm.ident = !{!43, !43, !43}
!llvm.module.flags = !{!44, !45, !46, !47, !48, !49, !50}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/096_print-babel.c_127_local_cpp_cwe-125-oob-read/harness/driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/096_print-babel.c_127_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "79527694e52719da64e37f3299e4e976")
!2 = !{!3, !10}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "netdissect_options", file: !5, line: 14, baseType: !6)
!5 = !DIFile(filename: "harness_types.h", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/096_print-babel.c_127_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "a0ac5c3d1939d18943d3802d9e5fb2f8")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !5, line: 12, size: 32, elements: !7)
!7 = !{!8}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "dummy", scope: !6, file: !5, line: 13, baseType: !9, size: 32)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !19, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/096_print-babel.c_127_local_cpp_cwe-125-oob-read/harness/print-babel.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/096_print-babel.c_127_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "8895afb846e01ba63e15761094bb0942")
!14 = !{!15, !16}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !17, line: 46, baseType: !18)
!17 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!18 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!19 = !{!20}
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "buf", scope: !22, file: !23, line: 16, type: !38, isLocal: true, isDefinition: true)
!22 = distinct !DISubprogram(name: "format_prefix", scope: !23, file: !23, line: 14, type: !24, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !12, retainedNodes: !37)
!23 = !DIFile(filename: "print-babel.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/096_print-babel.c_127_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "8895afb846e01ba63e15761094bb0942")
!24 = !DISubroutineType(types: !25)
!25 = !{!26, !29, !34, !11}
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !28)
!28 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "netdissect_options", file: !23, line: 12, baseType: !31)
!31 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !23, line: 10, size: 32, elements: !32)
!32 = !{!33}
!33 = !DIDerivedType(tag: DW_TAG_member, name: "dummy", scope: !31, file: !23, line: 11, baseType: !9, size: 32)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !36)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !23, line: 7, baseType: !11)
!37 = !{}
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 400, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 50)
!41 = distinct !DICompileUnit(language: DW_LANG_C99, file: !42, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!42 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/096_print-babel.c_127_local_cpp_cwe-125-oob-read/harness/smart_stubs.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/096_print-babel.c_127_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "bcda1acd1a733c696e028616d9d6f3b5")
!43 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!44 = !{i32 7, !"Dwarf Version", i32 5}
!45 = !{i32 2, !"Debug Info Version", i32 3}
!46 = !{i32 1, !"wchar_size", i32 4}
!47 = !{i32 7, !"PIC Level", i32 2}
!48 = !{i32 7, !"PIE Level", i32 2}
!49 = !{i32 7, !"uwtable", i32 1}
!50 = !{i32 7, !"frame-pointer", i32 2}
!51 = distinct !DISubprogram(name: "main", scope: !52, file: !52, line: 7, type: !53, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !37)
!52 = !DIFile(filename: "driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/096_print-babel.c_127_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "79527694e52719da64e37f3299e4e976")
!53 = !DISubroutineType(types: !54)
!54 = !{!9}
!55 = !DILocalVariable(name: "ndo", scope: !51, file: !52, line: 8, type: !3)
!56 = !DILocation(line: 8, column: 25, scope: !51)
!57 = !DILocation(line: 8, column: 53, scope: !51)
!58 = !DILocation(line: 8, column: 31, scope: !51)
!59 = !DILocalVariable(name: "buf", scope: !51, file: !52, line: 9, type: !10)
!60 = !DILocation(line: 9, column: 20, scope: !51)
!61 = !DILocation(line: 9, column: 43, scope: !51)
!62 = !DILocation(line: 10, column: 24, scope: !51)
!63 = !DILocation(line: 10, column: 5, scope: !51)
!64 = !DILocation(line: 11, column: 5, scope: !51)
!65 = !DILocation(line: 11, column: 12, scope: !51)
!66 = !DILocation(line: 12, column: 5, scope: !51)
!67 = !DILocation(line: 12, column: 12, scope: !51)
!68 = !DILocation(line: 13, column: 17, scope: !51)
!69 = !DILocation(line: 13, column: 22, scope: !51)
!70 = !DILocation(line: 13, column: 5, scope: !51)
!71 = !DILocation(line: 14, column: 5, scope: !51)
!72 = distinct !DISubprogram(name: "babel_print_v2", scope: !23, file: !23, line: 30, type: !73, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !37)
!73 = !DISubroutineType(types: !74)
!74 = !{null, !29, !34, !75}
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !23, line: 8, baseType: !76)
!76 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!77 = !DILocalVariable(name: "ndo", arg: 1, scope: !72, file: !23, line: 30, type: !29)
!78 = !DILocation(line: 30, column: 41, scope: !72)
!79 = !DILocalVariable(name: "cp", arg: 2, scope: !72, file: !23, line: 30, type: !34)
!80 = !DILocation(line: 30, column: 60, scope: !72)
!81 = !DILocalVariable(name: "length", arg: 3, scope: !72, file: !23, line: 30, type: !75)
!82 = !DILocation(line: 30, column: 70, scope: !72)
!83 = !DILocation(line: 31, column: 19, scope: !72)
!84 = !DILocation(line: 31, column: 5, scope: !72)
!85 = !DILocalVariable(name: "ndo", arg: 1, scope: !22, file: !23, line: 14, type: !29)
!86 = !DILocation(line: 14, column: 54, scope: !22)
!87 = !DILocalVariable(name: "prefix", arg: 2, scope: !22, file: !23, line: 14, type: !34)
!88 = !DILocation(line: 14, column: 73, scope: !22)
!89 = !DILocalVariable(name: "plen", arg: 3, scope: !22, file: !23, line: 14, type: !11)
!90 = !DILocation(line: 14, column: 95, scope: !22)
!91 = !DILocation(line: 15, column: 5, scope: !22)
!92 = !DILocation(line: 18, column: 34, scope: !93)
!93 = distinct !DILexicalBlock(scope: !22, file: !23, line: 18, column: 9)
!94 = !DILocation(line: 18, column: 9, scope: !93)
!95 = !DILocation(line: 18, column: 42, scope: !93)
!96 = !DILocation(line: 18, column: 9, scope: !22)
!97 = !DILocation(line: 19, column: 7, scope: !93)
!98 = !DILocation(line: 20, column: 5, scope: !22)
!99 = !DILocation(line: 21, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !22, file: !23, line: 21, column: 9)
!101 = distinct !DISubprogram(name: "babel_print", scope: !23, file: !23, line: 37, type: !73, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !37)
!102 = !DILocalVariable(name: "ndo", arg: 1, scope: !101, file: !23, line: 37, type: !29)
!103 = !DILocation(line: 37, column: 38, scope: !101)
!104 = !DILocalVariable(name: "cp", arg: 2, scope: !101, file: !23, line: 37, type: !34)
!105 = !DILocation(line: 37, column: 57, scope: !101)
!106 = !DILocalVariable(name: "length", arg: 3, scope: !101, file: !23, line: 37, type: !75)
!107 = !DILocation(line: 37, column: 67, scope: !101)
!108 = !DILocation(line: 38, column: 5, scope: !101)
!109 = !DILocation(line: 39, column: 20, scope: !101)
!110 = !DILocation(line: 39, column: 25, scope: !101)
!111 = !DILocation(line: 39, column: 29, scope: !101)
!112 = !DILocation(line: 39, column: 5, scope: !101)
