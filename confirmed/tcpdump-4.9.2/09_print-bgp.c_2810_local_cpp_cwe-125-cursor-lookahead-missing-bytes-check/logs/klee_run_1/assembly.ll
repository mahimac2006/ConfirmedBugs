; ModuleID = '/app/se_runs/sailor_engine/tcpdump-4.9.2/171_print-bgp.c_2810_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness/slice.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.netdissect_options = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8* }

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !40 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.netdissect_options*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %2, metadata !44, metadata !DIExpression()), !dbg !45
  %5 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 80) #4, !dbg !46
  %6 = bitcast i8* %5 to %struct.netdissect_options*, !dbg !47
  store %struct.netdissect_options* %6, %struct.netdissect_options** %2, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i8** %3, metadata !48, metadata !DIExpression()), !dbg !49
  %7 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 64) #4, !dbg !50
  store i8* %7, i8** %3, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata i32* %4, metadata !51, metadata !DIExpression()), !dbg !52
  store i32 64, i32* %4, align 4, !dbg !52
  %8 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !53
  %9 = icmp ne %struct.netdissect_options* %8, null, !dbg !53
  br i1 %9, label %10, label %13, !dbg !55

10:                                               ; preds = %0
  %11 = load i8*, i8** %3, align 8, !dbg !56
  %12 = icmp ne i8* %11, null, !dbg !56
  br i1 %12, label %14, label %13, !dbg !57

13:                                               ; preds = %10, %0
  store i32 0, i32* %1, align 4, !dbg !58
  br label %32, !dbg !58

14:                                               ; preds = %10
  %15 = load i8*, i8** %3, align 8, !dbg !59
  %16 = load i32, i32* %4, align 4, !dbg !60
  %17 = sext i32 %16 to i64, !dbg !60
  call void @klee_make_symbolic(i8* noundef %15, i64 noundef %17, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !61
  %18 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !62
  %19 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %18, i32 0, i32 10, !dbg !63
  store i32 1, i32* %19, align 8, !dbg !64
  %20 = load i8*, i8** %3, align 8, !dbg !65
  %21 = load i32, i32* %4, align 4, !dbg !66
  %22 = sext i32 %21 to i64, !dbg !67
  %23 = getelementptr inbounds i8, i8* %20, i64 %22, !dbg !67
  %24 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !68
  %25 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %24, i32 0, i32 17, !dbg !69
  store i8* %23, i8** %25, align 8, !dbg !70
  %26 = load i8*, i8** %3, align 8, !dbg !71
  %27 = getelementptr inbounds i8, i8* %26, i64 0, !dbg !71
  store i8 -1, i8* %27, align 1, !dbg !72
  %28 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !73
  %29 = load i8*, i8** %3, align 8, !dbg !74
  %30 = load i32, i32* %4, align 4, !dbg !75
  %31 = call i32 @bgp_print(%struct.netdissect_options* noundef %28, i8* noundef %29, i32 noundef %30), !dbg !76
  store i32 0, i32* %1, align 4, !dbg !77
  br label %32, !dbg !77

32:                                               ; preds = %14, %13
  %33 = load i32, i32* %1, align 4, !dbg !78
  ret i32 %33, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

declare void @klee_make_symbolic(i8* noundef, i64 noundef, i8* noundef) local_unnamed_addr #3

declare i32 @bgp_print(%struct.netdissect_options* noundef, i8* noundef, i32 noundef) local_unnamed_addr #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0, !30}
!llvm.ident = !{!32, !32}
!llvm.module.flags = !{!33, !34, !35, !36, !37, !38, !39}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/171_print-bgp.c_2810_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness/driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/171_print-bgp.c_2810_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "4fe678d28318614c9aca801fe33e16cf")
!2 = !{!3, !29}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !5, line: 11, size: 640, elements: !6)
!5 = !DIFile(filename: "driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/171_print-bgp.c_2810_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "4fe678d28318614c9aca801fe33e16cf")
!6 = !{!7, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25}
!7 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_bflag", scope: !4, file: !5, line: 12, baseType: !8, size: 32)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_eflag", scope: !4, file: !5, line: 13, baseType: !8, size: 32, offset: 32)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_fflag", scope: !4, file: !5, line: 14, baseType: !8, size: 32, offset: 64)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Kflag", scope: !4, file: !5, line: 15, baseType: !8, size: 32, offset: 96)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_nflag", scope: !4, file: !5, line: 16, baseType: !8, size: 32, offset: 128)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Nflag", scope: !4, file: !5, line: 17, baseType: !8, size: 32, offset: 160)
!14 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_qflag", scope: !4, file: !5, line: 18, baseType: !8, size: 32, offset: 192)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Sflag", scope: !4, file: !5, line: 19, baseType: !8, size: 32, offset: 224)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_tflag", scope: !4, file: !5, line: 20, baseType: !8, size: 32, offset: 256)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_uflag", scope: !4, file: !5, line: 21, baseType: !8, size: 32, offset: 288)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_vflag", scope: !4, file: !5, line: 22, baseType: !8, size: 32, offset: 320)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_xflag", scope: !4, file: !5, line: 23, baseType: !8, size: 32, offset: 352)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Xflag", scope: !4, file: !5, line: 24, baseType: !8, size: 32, offset: 384)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Aflag", scope: !4, file: !5, line: 25, baseType: !8, size: 32, offset: 416)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Hflag", scope: !4, file: !5, line: 26, baseType: !8, size: 32, offset: 448)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_packet_number", scope: !4, file: !5, line: 27, baseType: !8, size: 32, offset: 480)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_suppress_default_print", scope: !4, file: !5, line: 28, baseType: !8, size: 32, offset: 512)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_snapend", scope: !4, file: !5, line: 29, baseType: !26, size: 64, offset: 576)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !28)
!28 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!30 = distinct !DICompileUnit(language: DW_LANG_C99, file: !31, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!31 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/171_print-bgp.c_2810_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness/smart_stubs.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/171_print-bgp.c_2810_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "bcda1acd1a733c696e028616d9d6f3b5")
!32 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!33 = !{i32 7, !"Dwarf Version", i32 5}
!34 = !{i32 2, !"Debug Info Version", i32 3}
!35 = !{i32 1, !"wchar_size", i32 4}
!36 = !{i32 7, !"PIC Level", i32 2}
!37 = !{i32 7, !"PIE Level", i32 2}
!38 = !{i32 7, !"uwtable", i32 1}
!39 = !{i32 7, !"frame-pointer", i32 2}
!40 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 34, type: !41, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !43)
!41 = !DISubroutineType(types: !42)
!42 = !{!8}
!43 = !{}
!44 = !DILocalVariable(name: "ndo", scope: !40, file: !5, line: 35, type: !3)
!45 = !DILocation(line: 35, column: 32, scope: !40)
!46 = !DILocation(line: 35, column: 67, scope: !40)
!47 = !DILocation(line: 35, column: 38, scope: !40)
!48 = !DILocalVariable(name: "buf", scope: !40, file: !5, line: 36, type: !29)
!49 = !DILocation(line: 36, column: 20, scope: !40)
!50 = !DILocation(line: 36, column: 43, scope: !40)
!51 = !DILocalVariable(name: "length", scope: !40, file: !5, line: 37, type: !8)
!52 = !DILocation(line: 37, column: 9, scope: !40)
!53 = !DILocation(line: 39, column: 10, scope: !54)
!54 = distinct !DILexicalBlock(scope: !40, file: !5, line: 39, column: 9)
!55 = !DILocation(line: 39, column: 14, scope: !54)
!56 = !DILocation(line: 39, column: 18, scope: !54)
!57 = !DILocation(line: 39, column: 9, scope: !40)
!58 = !DILocation(line: 39, column: 23, scope: !54)
!59 = !DILocation(line: 41, column: 24, scope: !40)
!60 = !DILocation(line: 41, column: 29, scope: !40)
!61 = !DILocation(line: 41, column: 5, scope: !40)
!62 = !DILocation(line: 42, column: 5, scope: !40)
!63 = !DILocation(line: 42, column: 10, scope: !40)
!64 = !DILocation(line: 42, column: 20, scope: !40)
!65 = !DILocation(line: 43, column: 24, scope: !40)
!66 = !DILocation(line: 43, column: 30, scope: !40)
!67 = !DILocation(line: 43, column: 28, scope: !40)
!68 = !DILocation(line: 43, column: 5, scope: !40)
!69 = !DILocation(line: 43, column: 10, scope: !40)
!70 = !DILocation(line: 43, column: 22, scope: !40)
!71 = !DILocation(line: 44, column: 5, scope: !40)
!72 = !DILocation(line: 44, column: 12, scope: !40)
!73 = !DILocation(line: 46, column: 15, scope: !40)
!74 = !DILocation(line: 46, column: 20, scope: !40)
!75 = !DILocation(line: 46, column: 25, scope: !40)
!76 = !DILocation(line: 46, column: 5, scope: !40)
!77 = !DILocation(line: 47, column: 5, scope: !40)
!78 = !DILocation(line: 48, column: 1, scope: !40)
