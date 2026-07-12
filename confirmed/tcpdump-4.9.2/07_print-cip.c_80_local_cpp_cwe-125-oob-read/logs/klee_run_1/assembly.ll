; ModuleID = '/app/se_runs/sailor_engine/tcpdump-4.9.2/094_print-cip.c_80_local_cpp_cwe-125-oob-read/harness/slice.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.netdissect_options = type { i32, i32 }
%struct.pcap_pkthdr = type { %struct.timeval, i32, i32 }
%struct.timeval = type { i64, i64 }

@.str = private unnamed_addr constant [4 x i8] c"ndo\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"h\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"p\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !46 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.netdissect_options*, align 8
  %3 = alloca %struct.pcap_pkthdr*, align 8
  %4 = alloca i8*, align 8
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %2, metadata !50, metadata !DIExpression()), !dbg !51
  %5 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 8) #4, !dbg !52
  %6 = bitcast i8* %5 to %struct.netdissect_options*, !dbg !53
  store %struct.netdissect_options* %6, %struct.netdissect_options** %2, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata %struct.pcap_pkthdr** %3, metadata !54, metadata !DIExpression()), !dbg !55
  %7 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 24) #4, !dbg !56
  %8 = bitcast i8* %7 to %struct.pcap_pkthdr*, !dbg !57
  store %struct.pcap_pkthdr* %8, %struct.pcap_pkthdr** %3, align 8, !dbg !55
  call void @llvm.dbg.declare(metadata i8** %4, metadata !58, metadata !DIExpression()), !dbg !59
  %9 = call noalias i8* @malloc(i64 noundef 64) #4, !dbg !60
  store i8* %9, i8** %4, align 8, !dbg !59
  %10 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !61
  %11 = bitcast %struct.netdissect_options* %10 to i8*, !dbg !61
  call void @klee_make_symbolic(i8* noundef %11, i64 noundef 8, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !62
  %12 = load %struct.pcap_pkthdr*, %struct.pcap_pkthdr** %3, align 8, !dbg !63
  %13 = bitcast %struct.pcap_pkthdr* %12 to i8*, !dbg !63
  call void @klee_make_symbolic(i8* noundef %13, i64 noundef 24, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  %14 = load i8*, i8** %4, align 8, !dbg !65
  call void @klee_make_symbolic(i8* noundef %14, i64 noundef 64, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  %15 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !67
  %16 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %15, i32 0, i32 0, !dbg !68
  store i32 0, i32* %16, align 4, !dbg !69
  %17 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !70
  %18 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %17, i32 0, i32 1, !dbg !71
  store i32 1, i32* %18, align 4, !dbg !72
  %19 = load %struct.pcap_pkthdr*, %struct.pcap_pkthdr** %3, align 8, !dbg !73
  %20 = getelementptr inbounds %struct.pcap_pkthdr, %struct.pcap_pkthdr* %19, i32 0, i32 1, !dbg !74
  store i32 64, i32* %20, align 8, !dbg !75
  %21 = load %struct.pcap_pkthdr*, %struct.pcap_pkthdr** %3, align 8, !dbg !76
  %22 = getelementptr inbounds %struct.pcap_pkthdr, %struct.pcap_pkthdr* %21, i32 0, i32 2, !dbg !77
  store i32 64, i32* %22, align 4, !dbg !78
  %23 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !79
  %24 = load %struct.pcap_pkthdr*, %struct.pcap_pkthdr** %3, align 8, !dbg !80
  %25 = load i8*, i8** %4, align 8, !dbg !81
  %26 = call i32 @cip_if_print(%struct.netdissect_options* noundef %23, %struct.pcap_pkthdr* noundef %24, i8* noundef %25), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) local_unnamed_addr #2

declare void @klee_make_symbolic(i8* noundef, i64 noundef, i8* noundef) local_unnamed_addr #3

declare i32 @cip_if_print(%struct.netdissect_options* noundef, %struct.pcap_pkthdr* noundef, i8* noundef) local_unnamed_addr #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0, !36}
!llvm.ident = !{!38, !38}
!llvm.module.flags = !{!39, !40, !41, !42, !43, !44, !45}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/094_print-cip.c_80_local_cpp_cwe-125-oob-read/harness/driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/094_print-cip.c_80_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "e5387586d7cb95376c8cfb83c0154fbb")
!2 = !{!3, !11, !33}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "netdissect_options", file: !5, line: 12, baseType: !6)
!5 = !DIFile(filename: "driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/094_print-cip.c_80_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "e5387586d7cb95376c8cfb83c0154fbb")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !5, line: 9, size: 64, elements: !7)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_eflag", scope: !6, file: !5, line: 10, baseType: !9, size: 32)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_suppress_default_print", scope: !6, file: !5, line: 11, baseType: !9, size: 32, offset: 32)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "pcap_pkthdr", file: !13, line: 245, size: 192, elements: !14)
!13 = !DIFile(filename: "/usr/include/pcap/pcap.h", directory: "", checksumkind: CSK_MD5, checksum: "df342b11dea7ddce117571532923c631")
!14 = !{!15, !25, !32}
!15 = !DIDerivedType(tag: DW_TAG_member, name: "ts", scope: !12, file: !13, line: 246, baseType: !16, size: 128)
!16 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !17, line: 8, size: 128, elements: !18)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h", directory: "", checksumkind: CSK_MD5, checksum: "9b45d950050c215f216850b27bd1e8f3")
!18 = !{!19, !23}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !16, file: !17, line: 14, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !21, line: 160, baseType: !22)
!21 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!22 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !16, file: !17, line: 15, baseType: !24, size: 64, offset: 64)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !21, line: 162, baseType: !22)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "caplen", scope: !12, file: !13, line: 247, baseType: !26, size: 32, offset: 128)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "bpf_u_int32", file: !27, line: 98, baseType: !28)
!27 = !DIFile(filename: "/usr/include/pcap/bpf.h", directory: "", checksumkind: CSK_MD5, checksum: "e736341f781a19c2dd15abe08571efa1")
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !29, line: 35, baseType: !30)
!29 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "", checksumkind: CSK_MD5, checksum: "e62424071ad3f1b4d088c139fd9ccfd1")
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u_int", file: !21, line: 33, baseType: !31)
!31 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !12, file: !13, line: 248, baseType: !26, size: 32, offset: 160)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !5, line: 7, baseType: !35)
!35 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!36 = distinct !DICompileUnit(language: DW_LANG_C99, file: !37, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!37 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/094_print-cip.c_80_local_cpp_cwe-125-oob-read/harness/smart_stubs.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/094_print-cip.c_80_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "bcda1acd1a733c696e028616d9d6f3b5")
!38 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!39 = !{i32 7, !"Dwarf Version", i32 5}
!40 = !{i32 2, !"Debug Info Version", i32 3}
!41 = !{i32 1, !"wchar_size", i32 4}
!42 = !{i32 7, !"PIC Level", i32 2}
!43 = !{i32 7, !"PIE Level", i32 2}
!44 = !{i32 7, !"uwtable", i32 1}
!45 = !{i32 7, !"frame-pointer", i32 2}
!46 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 16, type: !47, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !49)
!47 = !DISubroutineType(types: !48)
!48 = !{!9}
!49 = !{}
!50 = !DILocalVariable(name: "ndo", scope: !46, file: !5, line: 17, type: !3)
!51 = !DILocation(line: 17, column: 25, scope: !46)
!52 = !DILocation(line: 17, column: 53, scope: !46)
!53 = !DILocation(line: 17, column: 31, scope: !46)
!54 = !DILocalVariable(name: "h", scope: !46, file: !5, line: 18, type: !11)
!55 = !DILocation(line: 18, column: 25, scope: !46)
!56 = !DILocation(line: 18, column: 51, scope: !46)
!57 = !DILocation(line: 18, column: 29, scope: !46)
!58 = !DILocalVariable(name: "p", scope: !46, file: !5, line: 19, type: !33)
!59 = !DILocation(line: 19, column: 13, scope: !46)
!60 = !DILocation(line: 19, column: 27, scope: !46)
!61 = !DILocation(line: 21, column: 24, scope: !46)
!62 = !DILocation(line: 21, column: 5, scope: !46)
!63 = !DILocation(line: 22, column: 24, scope: !46)
!64 = !DILocation(line: 22, column: 5, scope: !46)
!65 = !DILocation(line: 23, column: 24, scope: !46)
!66 = !DILocation(line: 23, column: 5, scope: !46)
!67 = !DILocation(line: 25, column: 5, scope: !46)
!68 = !DILocation(line: 25, column: 10, scope: !46)
!69 = !DILocation(line: 25, column: 20, scope: !46)
!70 = !DILocation(line: 26, column: 5, scope: !46)
!71 = !DILocation(line: 26, column: 10, scope: !46)
!72 = !DILocation(line: 26, column: 37, scope: !46)
!73 = !DILocation(line: 27, column: 5, scope: !46)
!74 = !DILocation(line: 27, column: 8, scope: !46)
!75 = !DILocation(line: 27, column: 15, scope: !46)
!76 = !DILocation(line: 28, column: 5, scope: !46)
!77 = !DILocation(line: 28, column: 8, scope: !46)
!78 = !DILocation(line: 28, column: 12, scope: !46)
!79 = !DILocation(line: 30, column: 18, scope: !46)
!80 = !DILocation(line: 30, column: 23, scope: !46)
!81 = !DILocation(line: 30, column: 26, scope: !46)
!82 = !DILocation(line: 30, column: 5, scope: !46)
!83 = !DILocation(line: 31, column: 5, scope: !46)
