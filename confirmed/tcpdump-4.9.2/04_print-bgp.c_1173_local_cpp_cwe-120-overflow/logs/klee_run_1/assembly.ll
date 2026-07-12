; ModuleID = '/app/se_runs/sailor_engine/tcpdump-4.9.2/058_print-bgp.c_1173_local_cpp_cwe-120-overflow/harness/slice.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.netdissect_options = type { i32, i8* }

@.str = private unnamed_addr constant [10 x i8] c"bgp_input\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !30 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.netdissect_options*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %2, metadata !34, metadata !DIExpression()), !dbg !35
  %5 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 16) #5, !dbg !36
  %6 = bitcast i8* %5 to %struct.netdissect_options*, !dbg !37
  store %struct.netdissect_options* %6, %struct.netdissect_options** %2, align 8, !dbg !35
  %7 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !38
  %8 = icmp ne %struct.netdissect_options* %7, null, !dbg !38
  br i1 %8, label %10, label %9, !dbg !40

9:                                                ; preds = %0
  store i32 0, i32* %1, align 4, !dbg !41
  br label %33, !dbg !41

10:                                               ; preds = %0
  %11 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !42
  %12 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %11, i32 0, i32 0, !dbg !43
  store i32 1, i32* %12, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i32* %3, metadata !45, metadata !DIExpression()), !dbg !47
  store i32 512, i32* %3, align 4, !dbg !47
  call void @llvm.dbg.declare(metadata i8** %4, metadata !48, metadata !DIExpression()), !dbg !49
  %13 = call noalias i8* @malloc(i64 noundef 512) #5, !dbg !50
  store i8* %13, i8** %4, align 8, !dbg !49
  %14 = load i8*, i8** %4, align 8, !dbg !51
  %15 = icmp ne i8* %14, null, !dbg !51
  br i1 %15, label %17, label %16, !dbg !53

16:                                               ; preds = %10
  store i32 0, i32* %1, align 4, !dbg !54
  br label %33, !dbg !54

17:                                               ; preds = %10
  %18 = load i8*, i8** %4, align 8, !dbg !55
  call void @klee_make_symbolic(i8* noundef %18, i64 noundef 512, i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !56
  %19 = load i8*, i8** %4, align 8, !dbg !57
  %20 = call i8* @memset(i8* %19, i32 255, i64 16), !dbg !58
  %21 = load i8*, i8** %4, align 8, !dbg !59
  %22 = getelementptr inbounds i8, i8* %21, i64 16, !dbg !59
  store i8 2, i8* %22, align 1, !dbg !60
  %23 = load i8*, i8** %4, align 8, !dbg !61
  %24 = getelementptr inbounds i8, i8* %23, i64 17, !dbg !61
  store i8 0, i8* %24, align 1, !dbg !62
  %25 = load i8*, i8** %4, align 8, !dbg !63
  %26 = getelementptr inbounds i8, i8* %25, i64 18, !dbg !63
  store i8 32, i8* %26, align 1, !dbg !64
  %27 = load i8*, i8** %4, align 8, !dbg !65
  %28 = getelementptr inbounds i8, i8* %27, i64 512, !dbg !66
  %29 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !67
  %30 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %29, i32 0, i32 1, !dbg !68
  store i8* %28, i8** %30, align 8, !dbg !69
  %31 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !70
  %32 = load i8*, i8** %4, align 8, !dbg !71
  call void @bgp_print(%struct.netdissect_options* noundef %31, i8* noundef %32, i32 noundef 32), !dbg !72
  store i32 0, i32* %1, align 4, !dbg !73
  br label %33, !dbg !73

33:                                               ; preds = %17, %16, %9
  %34 = load i32, i32* %1, align 4, !dbg !74
  ret i32 %34, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) local_unnamed_addr #2

declare void @klee_make_symbolic(i8* noundef, i64 noundef, i8* noundef) local_unnamed_addr #3

declare void @bgp_print(%struct.netdissect_options* noundef, i8* noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: nofree noinline norecurse nosync nounwind uwtable writeonly
define dso_local i8* @memset(i8* noundef returned writeonly %0, i32 noundef %1, i64 noundef %2) local_unnamed_addr #4 !dbg !75 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i32 %1, metadata !85, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i64 %2, metadata !86, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i8* %0, metadata !87, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i64 %2, metadata !86, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !84
  %.not2 = icmp eq i64 %2, 0, !dbg !90
  br i1 %.not2, label %._crit_edge, label %.lr.ph, !dbg !91

.lr.ph:                                           ; preds = %3
  %4 = trunc i32 %1 to i8
  br label %5, !dbg !91

5:                                                ; preds = %.lr.ph, %5
  %.04 = phi i8* [ %0, %.lr.ph ], [ %7, %5 ]
  %.013 = phi i64 [ %2, %.lr.ph ], [ %6, %5 ]
  call void @llvm.dbg.value(metadata i8* %.04, metadata !87, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i64 %.013, metadata !86, metadata !DIExpression()), !dbg !84
  %6 = add i64 %.013, -1, !dbg !92
  call void @llvm.dbg.value(metadata i64 %6, metadata !86, metadata !DIExpression()), !dbg !84
  %7 = getelementptr inbounds i8, i8* %.04, i64 1, !dbg !93
  call void @llvm.dbg.value(metadata i8* %7, metadata !87, metadata !DIExpression()), !dbg !84
  store i8 %4, i8* %.04, align 1, !dbg !94
  call void @llvm.dbg.value(metadata i64 %6, metadata !86, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !84
  %.not = icmp eq i64 %6, 0, !dbg !90
  br i1 %.not, label %._crit_edge, label %5, !dbg !91, !llvm.loop !95

._crit_edge:                                      ; preds = %5, %3
  ret i8* %0, !dbg !98
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree noinline norecurse nosync nounwind uwtable writeonly "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0, !16, !18, !20}
!llvm.ident = !{!22, !22, !22, !22}
!llvm.module.flags = !{!23, !24, !25, !26, !27, !28, !29}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/058_print-bgp.c_1173_local_cpp_cwe-120-overflow/harness/driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/058_print-bgp.c_1173_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "5d3324bb3c28740eb76a4f6636e5b4e2")
!2 = !{!3, !15}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "netdissect_options", file: !5, line: 18, baseType: !6)
!5 = !DIFile(filename: "driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/058_print-bgp.c_1173_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "5d3324bb3c28740eb76a4f6636e5b4e2")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !5, line: 15, size: 128, elements: !7)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_vflag", scope: !6, file: !5, line: 16, baseType: !9, size: 32)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_snapend", scope: !6, file: !5, line: 17, baseType: !11, size: 64, offset: 64)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !5, line: 11, baseType: !14)
!14 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!16 = distinct !DICompileUnit(language: DW_LANG_C99, file: !17, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!17 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/058_print-bgp.c_1173_local_cpp_cwe-120-overflow/harness/smart_stubs.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/058_print-bgp.c_1173_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "bcda1acd1a733c696e028616d9d6f3b5")
!18 = distinct !DICompileUnit(language: DW_LANG_C99, file: !19, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!19 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/058_print-bgp.c_1173_local_cpp_cwe-120-overflow/harness/stubs.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/058_print-bgp.c_1173_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "d9e236e5fdbc5e9ecaf3391321ab999b")
!20 = distinct !DICompileUnit(language: DW_LANG_C99, file: !21, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!21 = !DIFile(filename: "/opt/tools/klee/runtime/Freestanding/memset.c", directory: "/opt/tools/klee/build/runtime/Freestanding", checksumkind: CSK_MD5, checksum: "72c61b3d8150747c019c191df9708e2b")
!22 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!23 = !{i32 7, !"Dwarf Version", i32 5}
!24 = !{i32 2, !"Debug Info Version", i32 3}
!25 = !{i32 1, !"wchar_size", i32 4}
!26 = !{i32 7, !"PIC Level", i32 2}
!27 = !{i32 7, !"PIE Level", i32 2}
!28 = !{i32 7, !"uwtable", i32 1}
!29 = !{i32 7, !"frame-pointer", i32 2}
!30 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 22, type: !31, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!31 = !DISubroutineType(types: !32)
!32 = !{!9}
!33 = !{}
!34 = !DILocalVariable(name: "ndo", scope: !30, file: !5, line: 23, type: !3)
!35 = !DILocation(line: 23, column: 25, scope: !30)
!36 = !DILocation(line: 23, column: 53, scope: !30)
!37 = !DILocation(line: 23, column: 31, scope: !30)
!38 = !DILocation(line: 24, column: 10, scope: !39)
!39 = distinct !DILexicalBlock(scope: !30, file: !5, line: 24, column: 9)
!40 = !DILocation(line: 24, column: 9, scope: !30)
!41 = !DILocation(line: 24, column: 15, scope: !39)
!42 = !DILocation(line: 26, column: 5, scope: !30)
!43 = !DILocation(line: 26, column: 10, scope: !30)
!44 = !DILocation(line: 26, column: 20, scope: !30)
!45 = !DILocalVariable(name: "len", scope: !30, file: !5, line: 28, type: !46)
!46 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!47 = !DILocation(line: 28, column: 15, scope: !30)
!48 = !DILocalVariable(name: "buf", scope: !30, file: !5, line: 29, type: !15)
!49 = !DILocation(line: 29, column: 13, scope: !30)
!50 = !DILocation(line: 29, column: 29, scope: !30)
!51 = !DILocation(line: 30, column: 10, scope: !52)
!52 = distinct !DILexicalBlock(scope: !30, file: !5, line: 30, column: 9)
!53 = !DILocation(line: 30, column: 9, scope: !30)
!54 = !DILocation(line: 30, column: 15, scope: !52)
!55 = !DILocation(line: 31, column: 24, scope: !30)
!56 = !DILocation(line: 31, column: 5, scope: !30)
!57 = !DILocation(line: 33, column: 12, scope: !30)
!58 = !DILocation(line: 33, column: 5, scope: !30)
!59 = !DILocation(line: 34, column: 5, scope: !30)
!60 = !DILocation(line: 34, column: 13, scope: !30)
!61 = !DILocation(line: 35, column: 5, scope: !30)
!62 = !DILocation(line: 35, column: 13, scope: !30)
!63 = !DILocation(line: 36, column: 5, scope: !30)
!64 = !DILocation(line: 36, column: 13, scope: !30)
!65 = !DILocation(line: 38, column: 24, scope: !30)
!66 = !DILocation(line: 38, column: 28, scope: !30)
!67 = !DILocation(line: 38, column: 5, scope: !30)
!68 = !DILocation(line: 38, column: 10, scope: !30)
!69 = !DILocation(line: 38, column: 22, scope: !30)
!70 = !DILocation(line: 40, column: 15, scope: !30)
!71 = !DILocation(line: 40, column: 20, scope: !30)
!72 = !DILocation(line: 40, column: 5, scope: !30)
!73 = !DILocation(line: 41, column: 5, scope: !30)
!74 = !DILocation(line: 42, column: 1, scope: !30)
!75 = distinct !DISubprogram(name: "memset", scope: !76, file: !76, line: 12, type: !77, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !20, retainedNodes: !33)
!76 = !DIFile(filename: "runtime/Freestanding/memset.c", directory: "/opt/tools/klee", checksumkind: CSK_MD5, checksum: "72c61b3d8150747c019c191df9708e2b")
!77 = !DISubroutineType(types: !78)
!78 = !{!79, !79, !9, !80}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !81, line: 46, baseType: !82)
!81 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!82 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!83 = !DILocalVariable(name: "dst", arg: 1, scope: !75, file: !76, line: 12, type: !79)
!84 = !DILocation(line: 0, scope: !75)
!85 = !DILocalVariable(name: "s", arg: 2, scope: !75, file: !76, line: 12, type: !9)
!86 = !DILocalVariable(name: "count", arg: 3, scope: !75, file: !76, line: 12, type: !80)
!87 = !DILocalVariable(name: "a", scope: !75, file: !76, line: 13, type: !88)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocation(line: 14, column: 18, scope: !75)
!91 = !DILocation(line: 14, column: 3, scope: !75)
!92 = !DILocation(line: 14, column: 15, scope: !75)
!93 = !DILocation(line: 15, column: 7, scope: !75)
!94 = !DILocation(line: 15, column: 10, scope: !75)
!95 = distinct !{!95, !91, !96, !97}
!96 = !DILocation(line: 15, column: 12, scope: !75)
!97 = !{!"llvm.loop.mustprogress"}
!98 = !DILocation(line: 16, column: 3, scope: !75)
