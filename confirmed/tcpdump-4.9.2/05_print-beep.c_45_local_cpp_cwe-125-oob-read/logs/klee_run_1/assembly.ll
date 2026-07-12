; ModuleID = '/app/se_runs/sailor_engine/tcpdump-4.9.2/092_print-beep.c_45_local_cpp_cwe-125-oob-read/harness/slice.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.netdissect_options = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*, i8*, i32, i32, i8*, i8*, i8* }

@.str = private unnamed_addr constant [3 x i8] c"bp\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"MSG\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !59 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.netdissect_options*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %2, metadata !63, metadata !DIExpression()), !dbg !64
  %5 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 144) #5, !dbg !65
  %6 = bitcast i8* %5 to %struct.netdissect_options*, !dbg !66
  store %struct.netdissect_options* %6, %struct.netdissect_options** %2, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata i32* %3, metadata !67, metadata !DIExpression()), !dbg !70
  store i32 4, i32* %3, align 4, !dbg !70
  call void @llvm.dbg.declare(metadata i8** %4, metadata !71, metadata !DIExpression()), !dbg !72
  %7 = load i32, i32* %3, align 4, !dbg !73
  %8 = zext i32 %7 to i64, !dbg !73
  %9 = call noalias i8* @calloc(i64 noundef 1, i64 noundef %8) #5, !dbg !74
  store i8* %9, i8** %4, align 8, !dbg !72
  %10 = load i8*, i8** %4, align 8, !dbg !75
  %11 = load i32, i32* %3, align 4, !dbg !76
  %12 = zext i32 %11 to i64, !dbg !76
  call void @klee_make_symbolic(i8* noundef %10, i64 noundef %12, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0)), !dbg !77
  %13 = load i8*, i8** %4, align 8, !dbg !78
  %14 = call i8* @memcpy(i8* %13, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i64 3), !dbg !79
  %15 = load i8*, i8** %4, align 8, !dbg !80
  %16 = getelementptr inbounds i8, i8* %15, i64 3, !dbg !80
  store i8 88, i8* %16, align 1, !dbg !81
  %17 = load i8*, i8** %4, align 8, !dbg !82
  %18 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !83
  %19 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %18, i32 0, i32 25, !dbg !84
  store i8* %17, i8** %19, align 8, !dbg !85
  %20 = load i8*, i8** %4, align 8, !dbg !86
  %21 = load i32, i32* %3, align 4, !dbg !87
  %22 = zext i32 %21 to i64, !dbg !88
  %23 = getelementptr inbounds i8, i8* %20, i64 %22, !dbg !88
  %24 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !89
  %25 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %24, i32 0, i32 26, !dbg !90
  store i8* %23, i8** %25, align 8, !dbg !91
  %26 = load i32, i32* %3, align 4, !dbg !92
  %27 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !93
  %28 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %27, i32 0, i32 24, !dbg !94
  store i32 %26, i32* %28, align 4, !dbg !95
  %29 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !96
  %30 = load i8*, i8** %4, align 8, !dbg !97
  %31 = load i32, i32* %3, align 4, !dbg !98
  call void @beep_print(%struct.netdissect_options* noundef %29, i8* noundef %30, i32 noundef %31), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

declare void @klee_make_symbolic(i8* noundef, i64 noundef, i8* noundef) local_unnamed_addr #3

declare void @beep_print(%struct.netdissect_options* noundef, i8* noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: nofree noinline norecurse nosync nounwind uwtable
define dso_local i8* @memcpy(i8* noundef returned writeonly %0, i8* nocapture noundef readonly %1, i64 noundef %2) local_unnamed_addr #4 !dbg !101 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.value(metadata i8* %1, metadata !112, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.value(metadata i64 %2, metadata !113, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.value(metadata i8* %0, metadata !114, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.value(metadata i8* %1, metadata !115, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.value(metadata i64 %2, metadata !113, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !111
  %.not3 = icmp eq i64 %2, 0, !dbg !116
  br i1 %.not3, label %._crit_edge, label %.lr.ph, !dbg !117

.lr.ph:                                           ; preds = %3, %.lr.ph
  %.06 = phi i8* [ %5, %.lr.ph ], [ %1, %3 ]
  %.015 = phi i8* [ %7, %.lr.ph ], [ %0, %3 ]
  %.024 = phi i64 [ %4, %.lr.ph ], [ %2, %3 ]
  call void @llvm.dbg.value(metadata i8* %.06, metadata !115, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.value(metadata i8* %.015, metadata !114, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.value(metadata i64 %.024, metadata !113, metadata !DIExpression()), !dbg !111
  %4 = add i64 %.024, -1, !dbg !118
  call void @llvm.dbg.value(metadata i64 %4, metadata !113, metadata !DIExpression()), !dbg !111
  %5 = getelementptr inbounds i8, i8* %.06, i64 1, !dbg !119
  call void @llvm.dbg.value(metadata i8* %5, metadata !115, metadata !DIExpression()), !dbg !111
  %6 = load i8, i8* %.06, align 1, !dbg !120
  %7 = getelementptr inbounds i8, i8* %.015, i64 1, !dbg !121
  call void @llvm.dbg.value(metadata i8* %7, metadata !114, metadata !DIExpression()), !dbg !111
  store i8 %6, i8* %.015, align 1, !dbg !122
  call void @llvm.dbg.value(metadata i64 %4, metadata !113, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !111
  %.not = icmp eq i64 %4, 0, !dbg !116
  br i1 %.not, label %._crit_edge, label %.lr.ph, !dbg !117, !llvm.loop !123

._crit_edge:                                      ; preds = %.lr.ph, %3
  ret i8* %0, !dbg !125
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree noinline norecurse nosync nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0, !47, !49}
!llvm.ident = !{!51, !51, !51}
!llvm.module.flags = !{!52, !53, !54, !55, !56, !57, !58}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/092_print-beep.c_45_local_cpp_cwe-125-oob-read/harness/driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/092_print-beep.c_45_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "bfa1bedaf5f76e201b3f584e10cb9428")
!2 = !{!3, !46}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "netdissect_options", file: !5, line: 39, baseType: !6)
!5 = !DIFile(filename: "driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/092_print-beep.c_45_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "bfa1bedaf5f76e201b3f584e10cb9428")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !5, line: 10, size: 1152, elements: !7)
!7 = !{!8, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !31, !33, !35, !36, !37, !38, !39, !44, !45}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_bflag", scope: !6, file: !5, line: 11, baseType: !9, size: 32)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_eflag", scope: !6, file: !5, line: 12, baseType: !9, size: 32, offset: 32)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_fflag", scope: !6, file: !5, line: 13, baseType: !9, size: 32, offset: 64)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Kflag", scope: !6, file: !5, line: 14, baseType: !9, size: 32, offset: 96)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_nflag", scope: !6, file: !5, line: 15, baseType: !9, size: 32, offset: 128)
!14 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Nflag", scope: !6, file: !5, line: 16, baseType: !9, size: 32, offset: 160)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_qflag", scope: !6, file: !5, line: 17, baseType: !9, size: 32, offset: 192)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Sflag", scope: !6, file: !5, line: 18, baseType: !9, size: 32, offset: 224)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_tflag", scope: !6, file: !5, line: 19, baseType: !9, size: 32, offset: 256)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_uflag", scope: !6, file: !5, line: 20, baseType: !9, size: 32, offset: 288)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_vflag", scope: !6, file: !5, line: 21, baseType: !9, size: 32, offset: 320)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_xflag", scope: !6, file: !5, line: 22, baseType: !9, size: 32, offset: 352)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Xflag", scope: !6, file: !5, line: 23, baseType: !9, size: 32, offset: 384)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Aflag", scope: !6, file: !5, line: 24, baseType: !9, size: 32, offset: 416)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Hflag", scope: !6, file: !5, line: 25, baseType: !9, size: 32, offset: 448)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_packet_number", scope: !6, file: !5, line: 26, baseType: !9, size: 32, offset: 480)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_suppress_default_print", scope: !6, file: !5, line: 27, baseType: !9, size: 32, offset: 512)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_tstamp_precision", scope: !6, file: !5, line: 28, baseType: !9, size: 32, offset: 544)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "program_name", scope: !6, file: !5, line: 29, baseType: !28, size: 64, offset: 576)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !30)
!30 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_espsecret", scope: !6, file: !5, line: 30, baseType: !32, size: 64, offset: 640)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_sa_list_head", scope: !6, file: !5, line: 31, baseType: !34, size: 64, offset: 704)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_sa_default", scope: !6, file: !5, line: 32, baseType: !34, size: 64, offset: 768)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_sigsecret", scope: !6, file: !5, line: 33, baseType: !32, size: 64, offset: 832)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_packettype", scope: !6, file: !5, line: 34, baseType: !9, size: 32, offset: 896)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_snaplen", scope: !6, file: !5, line: 35, baseType: !9, size: 32, offset: 928)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_packetp", scope: !6, file: !5, line: 36, baseType: !40, size: 64, offset: 960)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !5, line: 7, baseType: !43)
!43 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_snapend", scope: !6, file: !5, line: 37, baseType: !40, size: 64, offset: 1024)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_if_printer", scope: !6, file: !5, line: 38, baseType: !34, size: 64, offset: 1088)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!47 = distinct !DICompileUnit(language: DW_LANG_C99, file: !48, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!48 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/092_print-beep.c_45_local_cpp_cwe-125-oob-read/harness/smart_stubs.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/092_print-beep.c_45_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "bcda1acd1a733c696e028616d9d6f3b5")
!49 = distinct !DICompileUnit(language: DW_LANG_C99, file: !50, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!50 = !DIFile(filename: "/opt/tools/klee/runtime/Freestanding/memcpy.c", directory: "/opt/tools/klee/build/runtime/Freestanding", checksumkind: CSK_MD5, checksum: "8fb9a7164e167db005d7d002570068bc")
!51 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!52 = !{i32 7, !"Dwarf Version", i32 5}
!53 = !{i32 2, !"Debug Info Version", i32 3}
!54 = !{i32 1, !"wchar_size", i32 4}
!55 = !{i32 7, !"PIC Level", i32 2}
!56 = !{i32 7, !"PIE Level", i32 2}
!57 = !{i32 7, !"uwtable", i32 1}
!58 = !{i32 7, !"frame-pointer", i32 2}
!59 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 43, type: !60, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !62)
!60 = !DISubroutineType(types: !61)
!61 = !{!9}
!62 = !{}
!63 = !DILocalVariable(name: "ndo", scope: !59, file: !5, line: 44, type: !3)
!64 = !DILocation(line: 44, column: 25, scope: !59)
!65 = !DILocation(line: 44, column: 53, scope: !59)
!66 = !DILocation(line: 44, column: 31, scope: !59)
!67 = !DILocalVariable(name: "length", scope: !59, file: !5, line: 45, type: !68)
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !5, line: 8, baseType: !69)
!69 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!70 = !DILocation(line: 45, column: 11, scope: !59)
!71 = !DILocalVariable(name: "bp", scope: !59, file: !5, line: 46, type: !46)
!72 = !DILocation(line: 46, column: 13, scope: !59)
!73 = !DILocation(line: 46, column: 38, scope: !59)
!74 = !DILocation(line: 46, column: 28, scope: !59)
!75 = !DILocation(line: 47, column: 24, scope: !59)
!76 = !DILocation(line: 47, column: 28, scope: !59)
!77 = !DILocation(line: 47, column: 5, scope: !59)
!78 = !DILocation(line: 48, column: 12, scope: !59)
!79 = !DILocation(line: 48, column: 5, scope: !59)
!80 = !DILocation(line: 49, column: 5, scope: !59)
!81 = !DILocation(line: 49, column: 11, scope: !59)
!82 = !DILocation(line: 50, column: 24, scope: !59)
!83 = !DILocation(line: 50, column: 5, scope: !59)
!84 = !DILocation(line: 50, column: 10, scope: !59)
!85 = !DILocation(line: 50, column: 22, scope: !59)
!86 = !DILocation(line: 51, column: 24, scope: !59)
!87 = !DILocation(line: 51, column: 29, scope: !59)
!88 = !DILocation(line: 51, column: 27, scope: !59)
!89 = !DILocation(line: 51, column: 5, scope: !59)
!90 = !DILocation(line: 51, column: 10, scope: !59)
!91 = !DILocation(line: 51, column: 22, scope: !59)
!92 = !DILocation(line: 52, column: 24, scope: !59)
!93 = !DILocation(line: 52, column: 5, scope: !59)
!94 = !DILocation(line: 52, column: 10, scope: !59)
!95 = !DILocation(line: 52, column: 22, scope: !59)
!96 = !DILocation(line: 53, column: 16, scope: !59)
!97 = !DILocation(line: 53, column: 21, scope: !59)
!98 = !DILocation(line: 53, column: 25, scope: !59)
!99 = !DILocation(line: 53, column: 5, scope: !59)
!100 = !DILocation(line: 54, column: 5, scope: !59)
!101 = distinct !DISubprogram(name: "memcpy", scope: !102, file: !102, line: 12, type: !103, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !62)
!102 = !DIFile(filename: "runtime/Freestanding/memcpy.c", directory: "/opt/tools/klee", checksumkind: CSK_MD5, checksum: "8fb9a7164e167db005d7d002570068bc")
!103 = !DISubroutineType(types: !104)
!104 = !{!34, !34, !105, !107}
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!107 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !108, line: 46, baseType: !109)
!108 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!109 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!110 = !DILocalVariable(name: "destaddr", arg: 1, scope: !101, file: !102, line: 12, type: !34)
!111 = !DILocation(line: 0, scope: !101)
!112 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !101, file: !102, line: 12, type: !105)
!113 = !DILocalVariable(name: "len", arg: 3, scope: !101, file: !102, line: 12, type: !107)
!114 = !DILocalVariable(name: "dest", scope: !101, file: !102, line: 13, type: !32)
!115 = !DILocalVariable(name: "src", scope: !101, file: !102, line: 14, type: !28)
!116 = !DILocation(line: 16, column: 16, scope: !101)
!117 = !DILocation(line: 16, column: 3, scope: !101)
!118 = !DILocation(line: 16, column: 13, scope: !101)
!119 = !DILocation(line: 17, column: 19, scope: !101)
!120 = !DILocation(line: 17, column: 15, scope: !101)
!121 = !DILocation(line: 17, column: 10, scope: !101)
!122 = !DILocation(line: 17, column: 13, scope: !101)
!123 = distinct !{!123, !117, !119, !124}
!124 = !{!"llvm.loop.mustprogress"}
!125 = !DILocation(line: 18, column: 3, scope: !101)
