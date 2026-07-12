; ModuleID = '/app/se_runs/sailor_engine/tcpdump-4.9.2/096_print-babel.c_127_local_cpp_cwe-125-oob-read/harness/slice.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.netdissect_options = type { i32, i8* }

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !25 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.netdissect_options*, align 8
  %3 = alloca i8*, align 8
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %2, metadata !29, metadata !DIExpression()), !dbg !30
  %4 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 16) #4, !dbg !31
  %5 = bitcast i8* %4 to %struct.netdissect_options*, !dbg !32
  store %struct.netdissect_options* %5, %struct.netdissect_options** %2, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i8** %3, metadata !33, metadata !DIExpression()), !dbg !34
  %6 = call noalias i8* @calloc(i64 noundef 64, i64 noundef 1) #4, !dbg !35
  store i8* %6, i8** %3, align 8, !dbg !34
  %7 = load i8*, i8** %3, align 8, !dbg !36
  call void @klee_make_symbolic(i8* noundef %7, i64 noundef 64, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !37
  %8 = load i8*, i8** %3, align 8, !dbg !38
  %9 = getelementptr inbounds i8, i8* %8, i64 0, !dbg !38
  store i8 42, i8* %9, align 1, !dbg !39
  %10 = load i8*, i8** %3, align 8, !dbg !40
  %11 = getelementptr inbounds i8, i8* %10, i64 1, !dbg !40
  store i8 2, i8* %11, align 1, !dbg !41
  %12 = load i8*, i8** %3, align 8, !dbg !42
  %13 = getelementptr inbounds i8, i8* %12, i64 4, !dbg !42
  store i8 96, i8* %13, align 1, !dbg !43
  %14 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !44
  %15 = load i8*, i8** %3, align 8, !dbg !45
  call void @babel_print(%struct.netdissect_options* noundef %14, i8* noundef %15, i32 noundef 64), !dbg !46
  ret i32 0, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

declare void @klee_make_symbolic(i8* noundef, i64 noundef, i8* noundef) local_unnamed_addr #3

declare void @babel_print(%struct.netdissect_options* noundef, i8* noundef, i32 noundef) local_unnamed_addr #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0, !15}
!llvm.ident = !{!17, !17}
!llvm.module.flags = !{!18, !19, !20, !21, !22, !23, !24}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/096_print-babel.c_127_local_cpp_cwe-125-oob-read/harness/driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/096_print-babel.c_127_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "7ac7b638209e30b2e845e17fd6a7cb0b")
!2 = !{!3, !12}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "netdissect_options", file: !5, line: 12, baseType: !6)
!5 = !DIFile(filename: "driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/096_print-babel.c_127_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "7ac7b638209e30b2e845e17fd6a7cb0b")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !5, line: 9, size: 128, elements: !7)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "dummy", scope: !6, file: !5, line: 10, baseType: !9, size: 32)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_snapend", scope: !6, file: !5, line: 11, baseType: !11, size: 64, offset: 64)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !5, line: 6, baseType: !14)
!14 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!15 = distinct !DICompileUnit(language: DW_LANG_C99, file: !16, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!16 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/096_print-babel.c_127_local_cpp_cwe-125-oob-read/harness/smart_stubs.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/096_print-babel.c_127_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "bcda1acd1a733c696e028616d9d6f3b5")
!17 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!18 = !{i32 7, !"Dwarf Version", i32 5}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"PIC Level", i32 2}
!22 = !{i32 7, !"PIE Level", i32 2}
!23 = !{i32 7, !"uwtable", i32 1}
!24 = !{i32 7, !"frame-pointer", i32 2}
!25 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 16, type: !26, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !28)
!26 = !DISubroutineType(types: !27)
!27 = !{!9}
!28 = !{}
!29 = !DILocalVariable(name: "ndo", scope: !25, file: !5, line: 17, type: !3)
!30 = !DILocation(line: 17, column: 25, scope: !25)
!31 = !DILocation(line: 17, column: 53, scope: !25)
!32 = !DILocation(line: 17, column: 31, scope: !25)
!33 = !DILocalVariable(name: "buf", scope: !25, file: !5, line: 18, type: !12)
!34 = !DILocation(line: 18, column: 13, scope: !25)
!35 = !DILocation(line: 18, column: 29, scope: !25)
!36 = !DILocation(line: 19, column: 24, scope: !25)
!37 = !DILocation(line: 19, column: 5, scope: !25)
!38 = !DILocation(line: 20, column: 5, scope: !25)
!39 = !DILocation(line: 20, column: 12, scope: !25)
!40 = !DILocation(line: 21, column: 5, scope: !25)
!41 = !DILocation(line: 21, column: 12, scope: !25)
!42 = !DILocation(line: 22, column: 5, scope: !25)
!43 = !DILocation(line: 22, column: 12, scope: !25)
!44 = !DILocation(line: 23, column: 17, scope: !25)
!45 = !DILocation(line: 23, column: 22, scope: !25)
!46 = !DILocation(line: 23, column: 5, scope: !25)
!47 = !DILocation(line: 24, column: 5, scope: !25)
