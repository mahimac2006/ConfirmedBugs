; ModuleID = '/app/se_runs/sailor_engine/tcpdump-4.9.2/219_print-dvmrp.c_80_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness/slice.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.netdissect_options = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8* }

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@.str.3 = private unnamed_addr constant [30 x i8] c"SPINE_PROBE:dvmrp_print:ENTRY\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.2 = private unnamed_addr constant [139 x i8] c"/app/se_runs/sailor_engine/tcpdump-4.9.2/219_print-dvmrp.c_80_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness/print-dvmrp.c\00", align 1
@__PRETTY_FUNCTION__.dvmrp_print = private unnamed_addr constant [62 x i8] c"void dvmrp_print(netdissect_options *, const u_char *, u_int)\00", align 1
@.str.3.4 = private unnamed_addr constant [27 x i8] c"0 && \22SAILOR_SINK_REACHED\22\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !53 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.netdissect_options*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %2, metadata !58, metadata !DIExpression()), !dbg !59
  %5 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 64) #5, !dbg !60
  %6 = bitcast i8* %5 to %struct.netdissect_options*, !dbg !61
  store %struct.netdissect_options* %6, %struct.netdissect_options** %2, align 8, !dbg !59
  call void @llvm.dbg.declare(metadata i8** %3, metadata !62, metadata !DIExpression()), !dbg !63
  %7 = call noalias i8* @calloc(i64 noundef 16, i64 noundef 1) #5, !dbg !64
  store i8* %7, i8** %3, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata i8** %4, metadata !65, metadata !DIExpression()), !dbg !66
  %8 = load i8*, i8** %3, align 8, !dbg !67
  %9 = getelementptr inbounds i8, i8* %8, i64 16, !dbg !68
  store i8* %9, i8** %4, align 8, !dbg !66
  %10 = load i8*, i8** %3, align 8, !dbg !69
  call void @klee_make_symbolic(i8* noundef %10, i64 noundef 16, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !70
  %11 = load i8*, i8** %3, align 8, !dbg !71
  %12 = getelementptr inbounds i8, i8* %11, i64 1, !dbg !71
  store i8 0, i8* %12, align 1, !dbg !72
  %13 = load i8*, i8** %4, align 8, !dbg !73
  %14 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !74
  %15 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %14, i32 0, i32 14, !dbg !75
  store i8* %13, i8** %15, align 8, !dbg !76
  %16 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !77
  %17 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %16, i32 0, i32 10, !dbg !78
  store i32 0, i32* %17, align 8, !dbg !79
  %18 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !80
  %19 = load i8*, i8** %3, align 8, !dbg !81
  call fastcc void @dvmrp_print(%struct.netdissect_options* noundef %18, i8* noundef %19), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

declare void @klee_make_symbolic(i8* noundef, i64 noundef, i8* noundef) local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @dvmrp_print(%struct.netdissect_options* noundef %0, i8* noundef %1) unnamed_addr #0 !dbg !84 {
  %3 = alloca %struct.netdissect_options*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8, align 1
  store %struct.netdissect_options* %0, %struct.netdissect_options** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %3, metadata !107, metadata !DIExpression()), !dbg !108
  store i8* %1, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !109, metadata !DIExpression()), !dbg !110
  store i32 16, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !111, metadata !DIExpression()), !dbg !112
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([30 x i8], [30 x i8]* @.str.3, i64 0, i64 0)), !dbg !113
  call void @llvm.dbg.declare(metadata i8** %6, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i8* %7, metadata !116, metadata !DIExpression()), !dbg !117
  %8 = load %struct.netdissect_options*, %struct.netdissect_options** %3, align 8, !dbg !118
  %9 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %8, i32 0, i32 14, !dbg !119
  %10 = load i8*, i8** %9, align 8, !dbg !119
  store i8* %10, i8** %6, align 8, !dbg !120
  %11 = load i8*, i8** %4, align 8, !dbg !121
  %12 = load i8*, i8** %6, align 8, !dbg !123
  %13 = icmp uge i8* %11, %12, !dbg !124
  br i1 %13, label %14, label %15, !dbg !125

14:                                               ; preds = %2
  br label %28, !dbg !126

15:                                               ; preds = %2
  %16 = load i8*, i8** %4, align 8, !dbg !127
  %17 = getelementptr inbounds i8, i8* %16, i64 1, !dbg !127
  %18 = load i8, i8* %17, align 1, !dbg !127
  %19 = zext i8 %18 to i32, !dbg !127
  %20 = icmp eq i32 %19, 255, !dbg !129
  br i1 %20, label %21, label %23, !dbg !130

21:                                               ; preds = %15
  %22 = call i32 (i8*, i8*, i32, i8*, ...) bitcast (i32 (...)* @__assert_fail to i32 (i8*, i8*, i32, i8*, ...)*)(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0), i8* noundef getelementptr inbounds ([139 x i8], [139 x i8]* @.str.2, i64 0, i64 0), i32 noundef 57, i8* noundef getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__.dvmrp_print, i64 0, i64 0)), !dbg !131
  unreachable, !dbg !131

23:                                               ; preds = %15
  %24 = load i8*, i8** %4, align 8, !dbg !132
  %25 = getelementptr inbounds i8, i8* %24, i64 1, !dbg !132
  %26 = load i8, i8* %25, align 1, !dbg !132
  store i8 %26, i8* %7, align 1, !dbg !133
  %27 = call i32 (i8*, i8*, i32, i8*, ...) bitcast (i32 (...)* @__assert_fail to i32 (i8*, i8*, i32, i8*, ...)*)(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.3.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([139 x i8], [139 x i8]* @.str.2, i64 0, i64 0), i32 noundef 59, i8* noundef getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__.dvmrp_print, i64 0, i64 0)), !dbg !134
  unreachable, !dbg !135

28:                                               ; preds = %14
  ret void, !dbg !136
}

declare void @klee_warning_once(i8* noundef) local_unnamed_addr #3

; Function Attrs: noreturn
declare i32 @__assert_fail(...) local_unnamed_addr #4

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0, !28, !43}
!llvm.ident = !{!45, !45, !45}
!llvm.module.flags = !{!46, !47, !48, !49, !50, !51, !52}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/219_print-dvmrp.c_80_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness/driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/219_print-dvmrp.c_80_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "09804cb459480835ffd0dc15a7d117f3")
!2 = !{!3, !25}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "netdissect_options", file: !5, line: 27, baseType: !6)
!5 = !DIFile(filename: "harness_types.h", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/219_print-dvmrp.c_80_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "511be2d3a1f547f2ae66086824a9609e")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !5, line: 11, size: 512, elements: !7)
!7 = !{!8, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_bflag", scope: !6, file: !5, line: 12, baseType: !9, size: 32)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_eflag", scope: !6, file: !5, line: 13, baseType: !9, size: 32, offset: 32)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_fflag", scope: !6, file: !5, line: 14, baseType: !9, size: 32, offset: 64)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Kflag", scope: !6, file: !5, line: 15, baseType: !9, size: 32, offset: 96)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_nflag", scope: !6, file: !5, line: 16, baseType: !9, size: 32, offset: 128)
!14 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Nflag", scope: !6, file: !5, line: 17, baseType: !9, size: 32, offset: 160)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_qflag", scope: !6, file: !5, line: 18, baseType: !9, size: 32, offset: 192)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Sflag", scope: !6, file: !5, line: 19, baseType: !9, size: 32, offset: 224)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_tflag", scope: !6, file: !5, line: 20, baseType: !9, size: 32, offset: 256)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_uflag", scope: !6, file: !5, line: 21, baseType: !9, size: 32, offset: 288)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_vflag", scope: !6, file: !5, line: 22, baseType: !9, size: 32, offset: 320)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_xflag", scope: !6, file: !5, line: 23, baseType: !9, size: 32, offset: 352)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Xflag", scope: !6, file: !5, line: 24, baseType: !9, size: 32, offset: 384)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Aflag", scope: !6, file: !5, line: 25, baseType: !9, size: 32, offset: 416)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_snapend", scope: !6, file: !5, line: 26, baseType: !24, size: 64, offset: 448)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !5, line: 8, baseType: !27)
!27 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!28 = distinct !DICompileUnit(language: DW_LANG_C99, file: !29, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !30, globals: !35, splitDebugInlining: false, nameTableKind: None)
!29 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/219_print-dvmrp.c_80_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness/print-dvmrp.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/219_print-dvmrp.c_80_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "f91d453545a0d2afdbe9f177046606ec")
!30 = !{!31}
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !33)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !34, line: 6, baseType: !27)
!34 = !DIFile(filename: "print-dvmrp.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/219_print-dvmrp.c_80_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "f91d453545a0d2afdbe9f177046606ec")
!35 = !{!36}
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression())
!37 = distinct !DIGlobalVariable(name: "target_level", scope: !28, file: !34, line: 37, type: !38, isLocal: true, isDefinition: true)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !39, line: 26, baseType: !40)
!39 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "2bf2ae53c58c01b1a1b9383b5195125c")
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !41, line: 42, baseType: !42)
!41 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!42 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!43 = distinct !DICompileUnit(language: DW_LANG_C99, file: !44, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!44 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/219_print-dvmrp.c_80_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness/smart_stubs.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/219_print-dvmrp.c_80_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "bcda1acd1a733c696e028616d9d6f3b5")
!45 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!46 = !{i32 7, !"Dwarf Version", i32 5}
!47 = !{i32 2, !"Debug Info Version", i32 3}
!48 = !{i32 1, !"wchar_size", i32 4}
!49 = !{i32 7, !"PIC Level", i32 2}
!50 = !{i32 7, !"PIE Level", i32 2}
!51 = !{i32 7, !"uwtable", i32 1}
!52 = !{i32 7, !"frame-pointer", i32 2}
!53 = distinct !DISubprogram(name: "main", scope: !54, file: !54, line: 8, type: !55, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !57)
!54 = !DIFile(filename: "driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/219_print-dvmrp.c_80_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "09804cb459480835ffd0dc15a7d117f3")
!55 = !DISubroutineType(types: !56)
!56 = !{!9}
!57 = !{}
!58 = !DILocalVariable(name: "ndo", scope: !53, file: !54, line: 9, type: !3)
!59 = !DILocation(line: 9, column: 25, scope: !53)
!60 = !DILocation(line: 9, column: 53, scope: !53)
!61 = !DILocation(line: 9, column: 31, scope: !53)
!62 = !DILocalVariable(name: "buf", scope: !53, file: !54, line: 10, type: !25)
!63 = !DILocation(line: 10, column: 13, scope: !53)
!64 = !DILocation(line: 10, column: 29, scope: !53)
!65 = !DILocalVariable(name: "snap", scope: !53, file: !54, line: 11, type: !25)
!66 = !DILocation(line: 11, column: 13, scope: !53)
!67 = !DILocation(line: 11, column: 20, scope: !53)
!68 = !DILocation(line: 11, column: 24, scope: !53)
!69 = !DILocation(line: 13, column: 24, scope: !53)
!70 = !DILocation(line: 13, column: 5, scope: !53)
!71 = !DILocation(line: 14, column: 5, scope: !53)
!72 = !DILocation(line: 14, column: 12, scope: !53)
!73 = !DILocation(line: 16, column: 24, scope: !53)
!74 = !DILocation(line: 16, column: 5, scope: !53)
!75 = !DILocation(line: 16, column: 10, scope: !53)
!76 = !DILocation(line: 16, column: 22, scope: !53)
!77 = !DILocation(line: 17, column: 5, scope: !53)
!78 = !DILocation(line: 17, column: 10, scope: !53)
!79 = !DILocation(line: 17, column: 20, scope: !53)
!80 = !DILocation(line: 19, column: 17, scope: !53)
!81 = !DILocation(line: 19, column: 22, scope: !53)
!82 = !DILocation(line: 19, column: 5, scope: !53)
!83 = !DILocation(line: 20, column: 5, scope: !53)
!84 = distinct !DISubprogram(name: "dvmrp_print", scope: !34, file: !34, line: 47, type: !85, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !57)
!85 = !DISubroutineType(types: !86)
!86 = !{null, !87, !31, !106}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "netdissect_options", file: !34, line: 25, baseType: !89)
!89 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !34, line: 9, size: 512, elements: !90)
!90 = !{!91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105}
!91 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_bflag", scope: !89, file: !34, line: 10, baseType: !9, size: 32)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_eflag", scope: !89, file: !34, line: 11, baseType: !9, size: 32, offset: 32)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_fflag", scope: !89, file: !34, line: 12, baseType: !9, size: 32, offset: 64)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Kflag", scope: !89, file: !34, line: 13, baseType: !9, size: 32, offset: 96)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_nflag", scope: !89, file: !34, line: 14, baseType: !9, size: 32, offset: 128)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Nflag", scope: !89, file: !34, line: 15, baseType: !9, size: 32, offset: 160)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_qflag", scope: !89, file: !34, line: 16, baseType: !9, size: 32, offset: 192)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Sflag", scope: !89, file: !34, line: 17, baseType: !9, size: 32, offset: 224)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_tflag", scope: !89, file: !34, line: 18, baseType: !9, size: 32, offset: 256)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_uflag", scope: !89, file: !34, line: 19, baseType: !9, size: 32, offset: 288)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_vflag", scope: !89, file: !34, line: 20, baseType: !9, size: 32, offset: 320)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_xflag", scope: !89, file: !34, line: 21, baseType: !9, size: 32, offset: 352)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Xflag", scope: !89, file: !34, line: 22, baseType: !9, size: 32, offset: 384)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Aflag", scope: !89, file: !34, line: 23, baseType: !9, size: 32, offset: 416)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_snapend", scope: !89, file: !34, line: 24, baseType: !24, size: 64, offset: 448)
!106 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !34, line: 7, baseType: !42)
!107 = !DILocalVariable(name: "ndo", arg: 1, scope: !84, file: !34, line: 47, type: !87)
!108 = !DILocation(line: 47, column: 38, scope: !84)
!109 = !DILocalVariable(name: "bp", arg: 2, scope: !84, file: !34, line: 47, type: !31)
!110 = !DILocation(line: 47, column: 66, scope: !84)
!111 = !DILocalVariable(name: "len", arg: 3, scope: !84, file: !34, line: 47, type: !106)
!112 = !DILocation(line: 47, column: 85, scope: !84)
!113 = !DILocation(line: 49, column: 5, scope: !84)
!114 = !DILocalVariable(name: "ep", scope: !84, file: !34, line: 50, type: !31)
!115 = !DILocation(line: 50, column: 25, scope: !84)
!116 = !DILocalVariable(name: "type", scope: !84, file: !34, line: 51, type: !33)
!117 = !DILocation(line: 51, column: 18, scope: !84)
!118 = !DILocation(line: 53, column: 23, scope: !84)
!119 = !DILocation(line: 53, column: 28, scope: !84)
!120 = !DILocation(line: 53, column: 5, scope: !84)
!121 = !DILocation(line: 54, column: 6, scope: !122)
!122 = distinct !DILexicalBlock(scope: !84, file: !34, line: 54, column: 6)
!123 = !DILocation(line: 54, column: 12, scope: !122)
!124 = !DILocation(line: 54, column: 9, scope: !122)
!125 = !DILocation(line: 54, column: 6, scope: !84)
!126 = !DILocation(line: 55, column: 3, scope: !122)
!127 = !DILocation(line: 57, column: 6, scope: !128)
!128 = distinct !DILexicalBlock(scope: !84, file: !34, line: 57, column: 6)
!129 = !DILocation(line: 57, column: 12, scope: !128)
!130 = !DILocation(line: 57, column: 6, scope: !84)
!131 = !DILocation(line: 57, column: 21, scope: !128)
!132 = !DILocation(line: 58, column: 9, scope: !84)
!133 = !DILocation(line: 58, column: 7, scope: !84)
!134 = !DILocation(line: 59, column: 2, scope: !84)
!135 = !DILocation(line: 62, column: 5, scope: !84)
!136 = !DILocation(line: 120, column: 1, scope: !84)
