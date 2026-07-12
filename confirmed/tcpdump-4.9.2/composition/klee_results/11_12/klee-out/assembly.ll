; ModuleID = '/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/klee_results/11_12/linked.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"len\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"0 && \22BOTH_REACHABLE_11_12\22\00", align 1
@.str.3 = private unnamed_addr constant [78 x i8] c"/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/driver_11_12.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [15 x i8] c"int main(void)\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !13 {
  %1 = alloca i32, align 4
  %2 = alloca [64 x i8], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [64 x i8]* %2, metadata !18, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %3, metadata !24, metadata !DIExpression()), !dbg !26
  %6 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !27
  call void @klee_make_symbolic(i8* %6, i64 64, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !28
  %7 = bitcast i32* %3 to i8*, !dbg !29
  call void @klee_make_symbolic(i8* %7, i64 4, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)), !dbg !30
  %8 = load i32, i32* %3, align 4, !dbg !31
  %9 = icmp uge i32 %8, 1, !dbg !32
  %10 = load i32, i32* %3, align 4, !dbg !33
  %11 = icmp ule i32 %10, 64, !dbg !33
  %12 = select i1 %9, i1 %11, i1 false, !dbg !33
  %13 = zext i1 %12 to i32, !dbg !33
  %14 = sext i32 %13 to i64, !dbg !31
  call void @klee_assume(i64 %14), !dbg !34
  call void @llvm.dbg.declare(metadata i32* %4, metadata !35, metadata !DIExpression()), !dbg !36
  %15 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !37
  %16 = load i32, i32* %3, align 4, !dbg !38
  %17 = call i32 @predicate_11(i8* %15, i32 %16), !dbg !39
  store i32 %17, i32* %4, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata i32* %5, metadata !40, metadata !DIExpression()), !dbg !41
  %18 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !42
  %19 = load i32, i32* %3, align 4, !dbg !43
  %20 = call i32 @predicate_12(i8* %18, i32 %19), !dbg !44
  store i32 %20, i32* %5, align 4, !dbg !41
  %21 = load i32, i32* %4, align 4, !dbg !45
  %22 = icmp eq i32 %21, 1, !dbg !47
  %23 = load i32, i32* %5, align 4
  %24 = icmp eq i32 %23, 1
  %or.cond = select i1 %22, i1 %24, i1 false, !dbg !48
  br i1 %or.cond, label %25, label %26, !dbg !48

25:                                               ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.3, i64 0, i64 0), i32 42, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #4, !dbg !49
  unreachable, !dbg !49

26:                                               ; preds = %0
  ret i32 0, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

declare dso_local void @klee_assume(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @predicate_11(i8* %0, i32 %1) #0 !dbg !51 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !57, metadata !DIExpression()), !dbg !58
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata i8** %6, metadata !61, metadata !DIExpression()), !dbg !65
  %9 = load i8*, i8** %4, align 8, !dbg !66
  store i8* %9, i8** %6, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata i8** %7, metadata !67, metadata !DIExpression()), !dbg !68
  %10 = load i8*, i8** %4, align 8, !dbg !69
  %11 = load i32, i32* %5, align 4, !dbg !70
  %12 = zext i32 %11 to i64, !dbg !71
  %13 = getelementptr inbounds i8, i8* %10, i64 %12, !dbg !71
  store i8* %13, i8** %7, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata i32* %8, metadata !72, metadata !DIExpression()), !dbg !73
  store i32 0, i32* %8, align 4, !dbg !73
  %14 = load i32, i32* %8, align 4, !dbg !74
  %15 = load i8*, i8** %6, align 8, !dbg !75
  %16 = load i8*, i8** %7, align 8, !dbg !77
  %17 = icmp uge i8* %15, %16, !dbg !78
  br i1 %17, label %18, label %19, !dbg !79

18:                                               ; preds = %2
  store i32 0, i32* %3, align 4, !dbg !80
  br label %29, !dbg !80

19:                                               ; preds = %2
  %20 = load i8*, i8** %6, align 8, !dbg !81
  %21 = getelementptr inbounds i8, i8* %20, i64 2, !dbg !83
  %22 = load i8*, i8** %7, align 8, !dbg !84
  %23 = icmp ugt i8* %21, %22, !dbg !85
  br i1 %23, label %24, label %25, !dbg !86

24:                                               ; preds = %19
  store i32 0, i32* %3, align 4, !dbg !87
  br label %29, !dbg !87

25:                                               ; preds = %19
  %26 = load i8*, i8** %6, align 8, !dbg !88
  %27 = getelementptr inbounds i8, i8* %26, i64 1, !dbg !88
  %28 = load i8, i8* %27, align 1, !dbg !88
  store i32 1, i32* %3, align 4, !dbg !89
  br label %29, !dbg !89

29:                                               ; preds = %25, %24, %18
  %30 = load i32, i32* %3, align 4, !dbg !90
  ret i32 %30, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @predicate_12(i8* %0, i32 %1) #0 !dbg !91 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !93, metadata !DIExpression()), !dbg !94
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i8** %6, metadata !97, metadata !DIExpression()), !dbg !101
  %9 = load i8*, i8** %4, align 8, !dbg !102
  store i8* %9, i8** %6, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i8** %7, metadata !103, metadata !DIExpression()), !dbg !104
  %10 = load i8*, i8** %4, align 8, !dbg !105
  %11 = load i32, i32* %5, align 4, !dbg !106
  %12 = zext i32 %11 to i64, !dbg !107
  %13 = getelementptr inbounds i8, i8* %10, i64 %12, !dbg !107
  store i8* %13, i8** %7, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i32* %8, metadata !108, metadata !DIExpression()), !dbg !110
  %14 = load i32, i32* %5, align 4, !dbg !111
  store i32 %14, i32* %8, align 4, !dbg !110
  %15 = load i32, i32* %8, align 4, !dbg !112
  %16 = icmp ult i32 %15, 2, !dbg !114
  br i1 %16, label %17, label %18, !dbg !115

17:                                               ; preds = %2
  store i32 0, i32* %3, align 4, !dbg !116
  br label %31, !dbg !116

18:                                               ; preds = %2
  %19 = load i8*, i8** %6, align 8, !dbg !117
  %20 = getelementptr inbounds i8, i8* %19, i64 2, !dbg !119
  %21 = load i8*, i8** %7, align 8, !dbg !120
  %22 = icmp ugt i8* %20, %21, !dbg !121
  br i1 %22, label %23, label %24, !dbg !122

23:                                               ; preds = %18
  store i32 0, i32* %3, align 4, !dbg !123
  br label %31, !dbg !123

24:                                               ; preds = %18
  %25 = load i8*, i8** %6, align 8, !dbg !124
  %26 = getelementptr inbounds i8, i8* %25, i64 0, !dbg !124
  %27 = load i8, i8* %26, align 1, !dbg !124
  %28 = load i8*, i8** %6, align 8, !dbg !125
  %29 = getelementptr inbounds i8, i8* %28, i64 1, !dbg !125
  %30 = load i8, i8* %29, align 1, !dbg !125
  store i32 1, i32* %3, align 4, !dbg !126
  br label %31, !dbg !126

31:                                               ; preds = %24, %23, %17
  %32 = load i32, i32* %3, align 4, !dbg !127
  ret i32 %32, !dbg !127
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind }

!llvm.dbg.cu = !{!0, !3, !5}
!llvm.ident = !{!7, !7, !7}
!llvm.module.flags = !{!8, !9, !10, !11, !12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/driver_11_12.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!2 = !{}
!3 = distinct !DICompileUnit(language: DW_LANG_C99, file: !4, producer: "clang version 13.0.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!4 = !DIFile(filename: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/predicate_11.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!5 = distinct !DICompileUnit(language: DW_LANG_C99, file: !6, producer: "clang version 13.0.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!6 = !DIFile(filename: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/predicate_12.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!7 = !{!"clang version 13.0.1"}
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 28, type: !15, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "driver_11_12.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!15 = !DISubroutineType(types: !16)
!16 = !{!17}
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "buf", scope: !13, file: !14, line: 29, type: !19)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 512, elements: !21)
!20 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!21 = !{!22}
!22 = !DISubrange(count: 64)
!23 = !DILocation(line: 29, column: 19, scope: !13)
!24 = !DILocalVariable(name: "len", scope: !13, file: !14, line: 30, type: !25)
!25 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!26 = !DILocation(line: 30, column: 18, scope: !13)
!27 = !DILocation(line: 33, column: 24, scope: !13)
!28 = !DILocation(line: 33, column: 5, scope: !13)
!29 = !DILocation(line: 34, column: 24, scope: !13)
!30 = !DILocation(line: 34, column: 5, scope: !13)
!31 = !DILocation(line: 35, column: 17, scope: !13)
!32 = !DILocation(line: 35, column: 21, scope: !13)
!33 = !DILocation(line: 35, column: 26, scope: !13)
!34 = !DILocation(line: 35, column: 5, scope: !13)
!35 = !DILocalVariable(name: "r11", scope: !13, file: !14, line: 38, type: !17)
!36 = !DILocation(line: 38, column: 9, scope: !13)
!37 = !DILocation(line: 38, column: 28, scope: !13)
!38 = !DILocation(line: 38, column: 33, scope: !13)
!39 = !DILocation(line: 38, column: 15, scope: !13)
!40 = !DILocalVariable(name: "r12", scope: !13, file: !14, line: 39, type: !17)
!41 = !DILocation(line: 39, column: 9, scope: !13)
!42 = !DILocation(line: 39, column: 28, scope: !13)
!43 = !DILocation(line: 39, column: 33, scope: !13)
!44 = !DILocation(line: 39, column: 15, scope: !13)
!45 = !DILocation(line: 41, column: 9, scope: !46)
!46 = distinct !DILexicalBlock(scope: !13, file: !14, line: 41, column: 9)
!47 = !DILocation(line: 41, column: 13, scope: !46)
!48 = !DILocation(line: 41, column: 18, scope: !46)
!49 = !DILocation(line: 42, column: 9, scope: !46)
!50 = !DILocation(line: 44, column: 5, scope: !13)
!51 = distinct !DISubprogram(name: "predicate_11", scope: !52, file: !52, line: 11, type: !53, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !3, retainedNodes: !2)
!52 = !DIFile(filename: "predicate_11.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!53 = !DISubroutineType(types: !54)
!54 = !{!17, !55, !25}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !20)
!57 = !DILocalVariable(name: "buf", arg: 1, scope: !51, file: !52, line: 11, type: !55)
!58 = !DILocation(line: 11, column: 39, scope: !51)
!59 = !DILocalVariable(name: "len", arg: 2, scope: !51, file: !52, line: 11, type: !25)
!60 = !DILocation(line: 11, column: 57, scope: !51)
!61 = !DILocalVariable(name: "bp", scope: !51, file: !52, line: 13, type: !62)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !64)
!64 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !52, line: 8, baseType: !20)
!65 = !DILocation(line: 13, column: 16, scope: !51)
!66 = !DILocation(line: 13, column: 21, scope: !51)
!67 = !DILocalVariable(name: "ep", scope: !51, file: !52, line: 14, type: !62)
!68 = !DILocation(line: 14, column: 16, scope: !51)
!69 = !DILocation(line: 14, column: 21, scope: !51)
!70 = !DILocation(line: 14, column: 27, scope: !51)
!71 = !DILocation(line: 14, column: 25, scope: !51)
!72 = !DILocalVariable(name: "ndo_vflag", scope: !51, file: !52, line: 18, type: !17)
!73 = !DILocation(line: 18, column: 6, scope: !51)
!74 = !DILocation(line: 19, column: 8, scope: !51)
!75 = !DILocation(line: 22, column: 6, scope: !76)
!76 = distinct !DILexicalBlock(scope: !51, file: !52, line: 22, column: 6)
!77 = !DILocation(line: 22, column: 12, scope: !76)
!78 = !DILocation(line: 22, column: 9, scope: !76)
!79 = !DILocation(line: 22, column: 6, scope: !51)
!80 = !DILocation(line: 23, column: 3, scope: !76)
!81 = !DILocation(line: 27, column: 6, scope: !82)
!82 = distinct !DILexicalBlock(scope: !51, file: !52, line: 27, column: 6)
!83 = !DILocation(line: 27, column: 9, scope: !82)
!84 = !DILocation(line: 27, column: 15, scope: !82)
!85 = !DILocation(line: 27, column: 13, scope: !82)
!86 = !DILocation(line: 27, column: 6, scope: !51)
!87 = !DILocation(line: 28, column: 3, scope: !82)
!88 = !DILocation(line: 31, column: 8, scope: !51)
!89 = !DILocation(line: 32, column: 2, scope: !51)
!90 = !DILocation(line: 33, column: 1, scope: !51)
!91 = distinct !DISubprogram(name: "predicate_12", scope: !92, file: !92, line: 29, type: !53, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, retainedNodes: !2)
!92 = !DIFile(filename: "predicate_12.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!93 = !DILocalVariable(name: "buf", arg: 1, scope: !91, file: !92, line: 29, type: !55)
!94 = !DILocation(line: 29, column: 39, scope: !91)
!95 = !DILocalVariable(name: "len", arg: 2, scope: !91, file: !92, line: 29, type: !25)
!96 = !DILocation(line: 29, column: 57, scope: !91)
!97 = !DILocalVariable(name: "bp", scope: !91, file: !92, line: 31, type: !98)
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !100)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !92, line: 20, baseType: !20)
!101 = !DILocation(line: 31, column: 19, scope: !91)
!102 = !DILocation(line: 31, column: 24, scope: !91)
!103 = !DILocalVariable(name: "ep", scope: !91, file: !92, line: 32, type: !98)
!104 = !DILocation(line: 32, column: 19, scope: !91)
!105 = !DILocation(line: 32, column: 24, scope: !91)
!106 = !DILocation(line: 32, column: 30, scope: !91)
!107 = !DILocation(line: 32, column: 28, scope: !91)
!108 = !DILocalVariable(name: "length", scope: !91, file: !92, line: 34, type: !109)
!109 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !92, line: 21, baseType: !25)
!110 = !DILocation(line: 34, column: 11, scope: !91)
!111 = !DILocation(line: 34, column: 20, scope: !91)
!112 = !DILocation(line: 42, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !91, file: !92, line: 42, column: 9)
!114 = !DILocation(line: 42, column: 16, scope: !113)
!115 = !DILocation(line: 42, column: 9, scope: !91)
!116 = !DILocation(line: 43, column: 9, scope: !113)
!117 = !DILocation(line: 53, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !91, file: !92, line: 53, column: 9)
!119 = !DILocation(line: 53, column: 12, scope: !118)
!120 = !DILocation(line: 53, column: 18, scope: !118)
!121 = !DILocation(line: 53, column: 16, scope: !118)
!122 = !DILocation(line: 53, column: 9, scope: !91)
!123 = !DILocation(line: 54, column: 9, scope: !118)
!124 = !DILocation(line: 57, column: 11, scope: !91)
!125 = !DILocation(line: 58, column: 11, scope: !91)
!126 = !DILocation(line: 59, column: 5, scope: !91)
!127 = !DILocation(line: 60, column: 1, scope: !91)
