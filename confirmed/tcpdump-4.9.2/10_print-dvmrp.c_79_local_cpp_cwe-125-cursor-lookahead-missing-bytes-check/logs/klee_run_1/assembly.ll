; ModuleID = '/app/se_runs/sailor_engine/tcpdump-4.9.2/217_print-dvmrp.c_79_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness/slice.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.netdissect_options = type { i8*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !26 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.netdissect_options*, align 8
  %3 = alloca i8*, align 8
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %2, metadata !30, metadata !DIExpression()), !dbg !31
  %4 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 16) #4, !dbg !32
  %5 = bitcast i8* %4 to %struct.netdissect_options*, !dbg !33
  store %struct.netdissect_options* %5, %struct.netdissect_options** %2, align 8, !dbg !31
  %6 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !34
  %7 = icmp ne %struct.netdissect_options* %6, null, !dbg !34
  br i1 %7, label %9, label %8, !dbg !36

8:                                                ; preds = %0
  store i32 0, i32* %1, align 4, !dbg !37
  br label %24, !dbg !37

9:                                                ; preds = %0
  call void @llvm.dbg.declare(metadata i8** %3, metadata !38, metadata !DIExpression()), !dbg !39
  %10 = call noalias i8* @malloc(i64 noundef 16) #4, !dbg !40
  store i8* %10, i8** %3, align 8, !dbg !39
  %11 = load i8*, i8** %3, align 8, !dbg !41
  %12 = icmp ne i8* %11, null, !dbg !41
  br i1 %12, label %14, label %13, !dbg !43

13:                                               ; preds = %9
  store i32 0, i32* %1, align 4, !dbg !44
  br label %24, !dbg !44

14:                                               ; preds = %9
  %15 = load i8*, i8** %3, align 8, !dbg !45
  call void @klee_make_symbolic(i8* noundef %15, i64 noundef 16, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !46
  %16 = load i8*, i8** %3, align 8, !dbg !47
  %17 = getelementptr inbounds i8, i8* %16, i64 16, !dbg !48
  %18 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !49
  %19 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %18, i32 0, i32 0, !dbg !50
  store i8* %17, i8** %19, align 8, !dbg !51
  %20 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !52
  %21 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %20, i32 0, i32 1, !dbg !53
  store i32 2, i32* %21, align 8, !dbg !54
  %22 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !55
  %23 = load i8*, i8** %3, align 8, !dbg !56
  call void @dvmrp_print(%struct.netdissect_options* noundef %22, i8* noundef %23, i32 noundef 16), !dbg !57
  store i32 0, i32* %1, align 4, !dbg !58
  br label %24, !dbg !58

24:                                               ; preds = %14, %13, %8
  %25 = load i32, i32* %1, align 4, !dbg !59
  ret i32 %25, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) local_unnamed_addr #2

declare void @klee_make_symbolic(i8* noundef, i64 noundef, i8* noundef) local_unnamed_addr #3

declare void @dvmrp_print(%struct.netdissect_options* noundef, i8* noundef, i32 noundef) local_unnamed_addr #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0, !16}
!llvm.ident = !{!18, !18}
!llvm.module.flags = !{!19, !20, !21, !22, !23, !24, !25}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/217_print-dvmrp.c_79_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness/driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/217_print-dvmrp.c_79_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "148c1e1ead901d450ac2c780f9b2e72b")
!2 = !{!3, !15}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "netdissect_options", file: !5, line: 15, baseType: !6)
!5 = !DIFile(filename: "driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/217_print-dvmrp.c_79_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "148c1e1ead901d450ac2c780f9b2e72b")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !5, line: 12, size: 128, elements: !7)
!7 = !{!8, !13}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_snapend", scope: !6, file: !5, line: 13, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !5, line: 9, baseType: !12)
!12 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_vflag", scope: !6, file: !5, line: 14, baseType: !14, size: 32, offset: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!16 = distinct !DICompileUnit(language: DW_LANG_C99, file: !17, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!17 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/217_print-dvmrp.c_79_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness/smart_stubs.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/217_print-dvmrp.c_79_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "bcda1acd1a733c696e028616d9d6f3b5")
!18 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!19 = !{i32 7, !"Dwarf Version", i32 5}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{i32 7, !"PIC Level", i32 2}
!23 = !{i32 7, !"PIE Level", i32 2}
!24 = !{i32 7, !"uwtable", i32 1}
!25 = !{i32 7, !"frame-pointer", i32 2}
!26 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 19, type: !27, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !29)
!27 = !DISubroutineType(types: !28)
!28 = !{!14}
!29 = !{}
!30 = !DILocalVariable(name: "ndo", scope: !26, file: !5, line: 20, type: !3)
!31 = !DILocation(line: 20, column: 25, scope: !26)
!32 = !DILocation(line: 20, column: 53, scope: !26)
!33 = !DILocation(line: 20, column: 31, scope: !26)
!34 = !DILocation(line: 21, column: 10, scope: !35)
!35 = distinct !DILexicalBlock(scope: !26, file: !5, line: 21, column: 9)
!36 = !DILocation(line: 21, column: 9, scope: !26)
!37 = !DILocation(line: 21, column: 15, scope: !35)
!38 = !DILocalVariable(name: "buf", scope: !26, file: !5, line: 23, type: !15)
!39 = !DILocation(line: 23, column: 13, scope: !26)
!40 = !DILocation(line: 23, column: 29, scope: !26)
!41 = !DILocation(line: 24, column: 10, scope: !42)
!42 = distinct !DILexicalBlock(scope: !26, file: !5, line: 24, column: 9)
!43 = !DILocation(line: 24, column: 9, scope: !26)
!44 = !DILocation(line: 24, column: 15, scope: !42)
!45 = !DILocation(line: 25, column: 24, scope: !26)
!46 = !DILocation(line: 25, column: 5, scope: !26)
!47 = !DILocation(line: 27, column: 24, scope: !26)
!48 = !DILocation(line: 27, column: 28, scope: !26)
!49 = !DILocation(line: 27, column: 5, scope: !26)
!50 = !DILocation(line: 27, column: 10, scope: !26)
!51 = !DILocation(line: 27, column: 22, scope: !26)
!52 = !DILocation(line: 28, column: 5, scope: !26)
!53 = !DILocation(line: 28, column: 10, scope: !26)
!54 = !DILocation(line: 28, column: 20, scope: !26)
!55 = !DILocation(line: 30, column: 17, scope: !26)
!56 = !DILocation(line: 30, column: 22, scope: !26)
!57 = !DILocation(line: 30, column: 5, scope: !26)
!58 = !DILocation(line: 31, column: 5, scope: !26)
!59 = !DILocation(line: 32, column: 1, scope: !26)
