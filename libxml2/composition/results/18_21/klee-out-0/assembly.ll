; ModuleID = 'linked_18_21.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"len\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"0 && \22BOTH_REACHABLE_18_21\22\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"driver_18_21.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [15 x i8] c"int main(void)\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !14 {
  %1 = alloca i32, align 4
  %2 = alloca [32 x i8], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [32 x i8]* %2, metadata !19, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i32* %3, metadata !25, metadata !DIExpression()), !dbg !27
  %6 = getelementptr inbounds [32 x i8], [32 x i8]* %2, i64 0, i64 0, !dbg !28
  call void @klee_make_symbolic(i8* noundef %6, i64 noundef 32, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !29
  %7 = bitcast i32* %3 to i8*, !dbg !30
  call void @klee_make_symbolic(i8* noundef %7, i64 noundef 4, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)), !dbg !31
  %8 = load i32, i32* %3, align 4, !dbg !32
  %9 = icmp uge i32 %8, 1, !dbg !33
  %10 = load i32, i32* %3, align 4, !dbg !34
  %11 = icmp ule i32 %10, 32, !dbg !34
  %12 = select i1 %9, i1 %11, i1 false, !dbg !34
  %13 = zext i1 %12 to i32, !dbg !34
  %14 = sext i32 %13 to i64, !dbg !32
  call void @klee_assume(i64 noundef %14), !dbg !35
  call void @llvm.dbg.declare(metadata i32* %4, metadata !36, metadata !DIExpression()), !dbg !37
  %15 = getelementptr inbounds [32 x i8], [32 x i8]* %2, i64 0, i64 0, !dbg !38
  %16 = load i32, i32* %3, align 4, !dbg !39
  %17 = call i32 @predicate_18(i8* noundef %15, i32 noundef %16), !dbg !40
  store i32 %17, i32* %4, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata i32* %5, metadata !41, metadata !DIExpression()), !dbg !42
  %18 = getelementptr inbounds [32 x i8], [32 x i8]* %2, i64 0, i64 0, !dbg !43
  %19 = load i32, i32* %3, align 4, !dbg !44
  %20 = call i32 @predicate_21(i8* noundef %18, i32 noundef %19), !dbg !45
  store i32 %20, i32* %5, align 4, !dbg !42
  %21 = load i32, i32* %4, align 4, !dbg !46
  %22 = icmp eq i32 %21, 1, !dbg !48
  %23 = load i32, i32* %5, align 4
  %24 = icmp eq i32 %23, 1
  %or.cond = select i1 %22, i1 %24, i1 false, !dbg !49
  br i1 %or.cond, label %25, label %26, !dbg !49

25:                                               ; preds = %0
  call void @__assert_fail(i8* noundef getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0), i32 noundef 42, i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #4, !dbg !50
  unreachable, !dbg !50

26:                                               ; preds = %0
  ret i32 0, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @klee_make_symbolic(i8* noundef, i64 noundef, i8* noundef) #2

declare void @klee_assume(i64 noundef) #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8* noundef, i8* noundef, i32 noundef, i8* noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @predicate_18(i8* noundef %0, i32 noundef %1) #0 !dbg !52 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !57, metadata !DIExpression()), !dbg !58
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata i8** %6, metadata !61, metadata !DIExpression()), !dbg !62
  %10 = load i8*, i8** %4, align 8, !dbg !63
  %11 = load i32, i32* %5, align 4, !dbg !64
  %12 = zext i32 %11 to i64, !dbg !65
  %13 = getelementptr inbounds i8, i8* %10, i64 %12, !dbg !65
  store i8* %13, i8** %6, align 8, !dbg !62
  call void @llvm.dbg.declare(metadata i8** %7, metadata !66, metadata !DIExpression()), !dbg !67
  %14 = load i8*, i8** %4, align 8, !dbg !68
  store i8* %14, i8** %7, align 8, !dbg !67
  br label %15, !dbg !69

15:                                               ; preds = %46, %26, %2
  %16 = load i8*, i8** %7, align 8, !dbg !70
  %17 = load i8*, i8** %6, align 8, !dbg !71
  %18 = icmp ult i8* %16, %17, !dbg !72
  br i1 %18, label %19, label %51, !dbg !69

19:                                               ; preds = %15
  call void @llvm.dbg.declare(metadata i32* %8, metadata !73, metadata !DIExpression()), !dbg !75
  %20 = load i8*, i8** %7, align 8, !dbg !76
  %21 = getelementptr inbounds i8, i8* %20, i64 0, !dbg !76
  %22 = load i8, i8* %21, align 1, !dbg !76
  %23 = zext i8 %22 to i32, !dbg !76
  store i32 %23, i32* %8, align 4, !dbg !75
  %24 = load i32, i32* %8, align 4, !dbg !77
  %25 = icmp ult i32 %24, 128, !dbg !79
  br i1 %25, label %26, label %29, !dbg !80

26:                                               ; preds = %19
  %27 = load i8*, i8** %7, align 8, !dbg !81
  %28 = getelementptr inbounds i8, i8* %27, i64 1, !dbg !81
  store i8* %28, i8** %7, align 8, !dbg !81
  br label %15, !dbg !83, !llvm.loop !84

29:                                               ; preds = %19
  call void @llvm.dbg.declare(metadata i32* %9, metadata !87, metadata !DIExpression()), !dbg !88
  %30 = load i32, i32* %8, align 4, !dbg !89
  %31 = icmp ult i32 %30, 224, !dbg !90
  br i1 %31, label %37, label %32, !dbg !91

32:                                               ; preds = %29
  %33 = load i32, i32* %8, align 4, !dbg !92
  %34 = icmp ult i32 %33, 240, !dbg !93
  %35 = zext i1 %34 to i64, !dbg !94
  %36 = select i1 %34, i32 3, i32 4, !dbg !94
  br label %37, !dbg !91

37:                                               ; preds = %29, %32
  %38 = phi i32 [ %36, %32 ], [ 2, %29 ], !dbg !91
  store i32 %38, i32* %9, align 4, !dbg !88
  %39 = load i8*, i8** %7, align 8, !dbg !95
  %40 = load i32, i32* %9, align 4, !dbg !97
  %41 = sext i32 %40 to i64, !dbg !98
  %42 = getelementptr inbounds i8, i8* %39, i64 %41, !dbg !98
  %43 = load i8*, i8** %6, align 8, !dbg !99
  %44 = icmp ugt i8* %42, %43, !dbg !100
  br i1 %44, label %45, label %46, !dbg !101

45:                                               ; preds = %37
  store i32 1, i32* %3, align 4, !dbg !102
  br label %52, !dbg !102

46:                                               ; preds = %37
  %47 = load i32, i32* %9, align 4, !dbg !103
  %48 = load i8*, i8** %7, align 8, !dbg !104
  %49 = sext i32 %47 to i64, !dbg !104
  %50 = getelementptr inbounds i8, i8* %48, i64 %49, !dbg !104
  store i8* %50, i8** %7, align 8, !dbg !104
  br label %15, !dbg !69, !llvm.loop !84

51:                                               ; preds = %15
  store i32 0, i32* %3, align 4, !dbg !105
  br label %52, !dbg !105

52:                                               ; preds = %51, %45
  %53 = load i32, i32* %3, align 4, !dbg !106
  ret i32 %53, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @predicate_21(i8* noundef %0, i32 noundef %1) #0 !dbg !107 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !108, metadata !DIExpression()), !dbg !109
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i8** %6, metadata !112, metadata !DIExpression()), !dbg !113
  %9 = load i8*, i8** %4, align 8, !dbg !114
  %10 = load i32, i32* %5, align 4, !dbg !115
  %11 = zext i32 %10 to i64, !dbg !116
  %12 = getelementptr inbounds i8, i8* %9, i64 %11, !dbg !116
  store i8* %12, i8** %6, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i8** %7, metadata !117, metadata !DIExpression()), !dbg !118
  %13 = load i8*, i8** %4, align 8, !dbg !119
  store i8* %13, i8** %7, align 8, !dbg !118
  br label %14, !dbg !120

14:                                               ; preds = %34, %2
  %15 = load i8*, i8** %7, align 8, !dbg !121
  %16 = load i8*, i8** %6, align 8, !dbg !122
  %17 = icmp ult i8* %15, %16, !dbg !123
  br i1 %17, label %18, label %37, !dbg !120

18:                                               ; preds = %14
  call void @llvm.dbg.declare(metadata i32* %8, metadata !124, metadata !DIExpression()), !dbg !126
  %19 = load i8*, i8** %7, align 8, !dbg !127
  %20 = getelementptr inbounds i8, i8* %19, i64 0, !dbg !127
  %21 = load i8, i8* %20, align 1, !dbg !127
  %22 = zext i8 %21 to i32, !dbg !127
  store i32 %22, i32* %8, align 4, !dbg !126
  %23 = load i32, i32* %8, align 4, !dbg !128
  %24 = icmp uge i32 %23, 128, !dbg !130
  br i1 %24, label %25, label %34, !dbg !131

25:                                               ; preds = %18
  %26 = load i8*, i8** %6, align 8, !dbg !132
  %27 = load i8*, i8** %7, align 8, !dbg !135
  %28 = ptrtoint i8* %26 to i64, !dbg !136
  %29 = ptrtoint i8* %27 to i64, !dbg !136
  %30 = sub i64 %28, %29, !dbg !136
  %31 = icmp slt i64 %30, 4, !dbg !137
  br i1 %31, label %32, label %33, !dbg !138

32:                                               ; preds = %25
  store i32 1, i32* %3, align 4, !dbg !139
  br label %38, !dbg !139

33:                                               ; preds = %25
  store i32 0, i32* %3, align 4, !dbg !140
  br label %38, !dbg !140

34:                                               ; preds = %18
  %35 = load i8*, i8** %7, align 8, !dbg !141
  %36 = getelementptr inbounds i8, i8* %35, i64 1, !dbg !141
  store i8* %36, i8** %7, align 8, !dbg !141
  br label %14, !dbg !120, !llvm.loop !142

37:                                               ; preds = %14
  store i32 0, i32* %3, align 4, !dbg !144
  br label %38, !dbg !144

38:                                               ; preds = %37, %33, %32
  %39 = load i32, i32* %3, align 4, !dbg !145
  ret i32 %39, !dbg !145
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind }

!llvm.dbg.cu = !{!0, !2, !4}
!llvm.ident = !{!6, !6, !6}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12, !13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "driver_18_21.c", directory: "/home/mahima/Downloads/ChainingPaper/libxml2/composition", checksumkind: CSK_MD5, checksum: "723f573b6a74f33659b92bc2fd8cef8d")
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "predicate_18.c", directory: "/home/mahima/Downloads/ChainingPaper/libxml2/composition", checksumkind: CSK_MD5, checksum: "02197c5ecee3f7b4522cc93cff4c535e")
!4 = distinct !DICompileUnit(language: DW_LANG_C99, file: !5, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!5 = !DIFile(filename: "predicate_21.c", directory: "/home/mahima/Downloads/ChainingPaper/libxml2/composition", checksumkind: CSK_MD5, checksum: "478d4e249a6f2620ed8216107ff66c70")
!6 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!7 = !{i32 7, !"Dwarf Version", i32 5}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"PIE Level", i32 2}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 28, type: !15, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DISubroutineType(types: !16)
!16 = !{!17}
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !{}
!19 = !DILocalVariable(name: "buf", scope: !14, file: !1, line: 29, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 256, elements: !22)
!21 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!22 = !{!23}
!23 = !DISubrange(count: 32)
!24 = !DILocation(line: 29, column: 19, scope: !14)
!25 = !DILocalVariable(name: "len", scope: !14, file: !1, line: 30, type: !26)
!26 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!27 = !DILocation(line: 30, column: 18, scope: !14)
!28 = !DILocation(line: 33, column: 24, scope: !14)
!29 = !DILocation(line: 33, column: 5, scope: !14)
!30 = !DILocation(line: 34, column: 24, scope: !14)
!31 = !DILocation(line: 34, column: 5, scope: !14)
!32 = !DILocation(line: 35, column: 17, scope: !14)
!33 = !DILocation(line: 35, column: 21, scope: !14)
!34 = !DILocation(line: 35, column: 26, scope: !14)
!35 = !DILocation(line: 35, column: 5, scope: !14)
!36 = !DILocalVariable(name: "r18", scope: !14, file: !1, line: 38, type: !17)
!37 = !DILocation(line: 38, column: 9, scope: !14)
!38 = !DILocation(line: 38, column: 28, scope: !14)
!39 = !DILocation(line: 38, column: 33, scope: !14)
!40 = !DILocation(line: 38, column: 15, scope: !14)
!41 = !DILocalVariable(name: "r21", scope: !14, file: !1, line: 39, type: !17)
!42 = !DILocation(line: 39, column: 9, scope: !14)
!43 = !DILocation(line: 39, column: 28, scope: !14)
!44 = !DILocation(line: 39, column: 33, scope: !14)
!45 = !DILocation(line: 39, column: 15, scope: !14)
!46 = !DILocation(line: 41, column: 9, scope: !47)
!47 = distinct !DILexicalBlock(scope: !14, file: !1, line: 41, column: 9)
!48 = !DILocation(line: 41, column: 13, scope: !47)
!49 = !DILocation(line: 41, column: 18, scope: !47)
!50 = !DILocation(line: 42, column: 9, scope: !47)
!51 = !DILocation(line: 44, column: 5, scope: !14)
!52 = distinct !DISubprogram(name: "predicate_18", scope: !3, file: !3, line: 11, type: !53, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !18)
!53 = !DISubroutineType(types: !54)
!54 = !{!17, !55, !26}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !21)
!57 = !DILocalVariable(name: "buf", arg: 1, scope: !52, file: !3, line: 11, type: !55)
!58 = !DILocation(line: 11, column: 39, scope: !52)
!59 = !DILocalVariable(name: "len", arg: 2, scope: !52, file: !3, line: 11, type: !26)
!60 = !DILocation(line: 11, column: 57, scope: !52)
!61 = !DILocalVariable(name: "end", scope: !52, file: !3, line: 12, type: !55)
!62 = !DILocation(line: 12, column: 26, scope: !52)
!63 = !DILocation(line: 12, column: 32, scope: !52)
!64 = !DILocation(line: 12, column: 38, scope: !52)
!65 = !DILocation(line: 12, column: 36, scope: !52)
!66 = !DILocalVariable(name: "cur", scope: !52, file: !3, line: 13, type: !55)
!67 = !DILocation(line: 13, column: 26, scope: !52)
!68 = !DILocation(line: 13, column: 32, scope: !52)
!69 = !DILocation(line: 14, column: 5, scope: !52)
!70 = !DILocation(line: 14, column: 12, scope: !52)
!71 = !DILocation(line: 14, column: 18, scope: !52)
!72 = !DILocation(line: 14, column: 16, scope: !52)
!73 = !DILocalVariable(name: "c", scope: !74, file: !3, line: 15, type: !26)
!74 = distinct !DILexicalBlock(scope: !52, file: !3, line: 14, column: 23)
!75 = !DILocation(line: 15, column: 22, scope: !74)
!76 = !DILocation(line: 15, column: 26, scope: !74)
!77 = !DILocation(line: 16, column: 13, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !3, line: 16, column: 13)
!79 = !DILocation(line: 16, column: 15, scope: !78)
!80 = !DILocation(line: 16, column: 13, scope: !74)
!81 = !DILocation(line: 16, column: 29, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !3, line: 16, column: 23)
!83 = !DILocation(line: 16, column: 35, scope: !82)
!84 = distinct !{!84, !69, !85, !86}
!85 = !DILocation(line: 20, column: 5, scope: !52)
!86 = !{!"llvm.loop.mustprogress"}
!87 = !DILocalVariable(name: "seqlen", scope: !74, file: !3, line: 17, type: !17)
!88 = !DILocation(line: 17, column: 13, scope: !74)
!89 = !DILocation(line: 17, column: 23, scope: !74)
!90 = !DILocation(line: 17, column: 25, scope: !74)
!91 = !DILocation(line: 17, column: 22, scope: !74)
!92 = !DILocation(line: 17, column: 40, scope: !74)
!93 = !DILocation(line: 17, column: 42, scope: !74)
!94 = !DILocation(line: 17, column: 39, scope: !74)
!95 = !DILocation(line: 18, column: 13, scope: !96)
!96 = distinct !DILexicalBlock(scope: !74, file: !3, line: 18, column: 13)
!97 = !DILocation(line: 18, column: 19, scope: !96)
!98 = !DILocation(line: 18, column: 17, scope: !96)
!99 = !DILocation(line: 18, column: 28, scope: !96)
!100 = !DILocation(line: 18, column: 26, scope: !96)
!101 = !DILocation(line: 18, column: 13, scope: !74)
!102 = !DILocation(line: 18, column: 33, scope: !96)
!103 = !DILocation(line: 19, column: 16, scope: !74)
!104 = !DILocation(line: 19, column: 13, scope: !74)
!105 = !DILocation(line: 21, column: 5, scope: !52)
!106 = !DILocation(line: 22, column: 1, scope: !52)
!107 = distinct !DISubprogram(name: "predicate_21", scope: !5, file: !5, line: 11, type: !53, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !18)
!108 = !DILocalVariable(name: "buf", arg: 1, scope: !107, file: !5, line: 11, type: !55)
!109 = !DILocation(line: 11, column: 39, scope: !107)
!110 = !DILocalVariable(name: "len", arg: 2, scope: !107, file: !5, line: 11, type: !26)
!111 = !DILocation(line: 11, column: 57, scope: !107)
!112 = !DILocalVariable(name: "end", scope: !107, file: !5, line: 12, type: !55)
!113 = !DILocation(line: 12, column: 26, scope: !107)
!114 = !DILocation(line: 12, column: 32, scope: !107)
!115 = !DILocation(line: 12, column: 38, scope: !107)
!116 = !DILocation(line: 12, column: 36, scope: !107)
!117 = !DILocalVariable(name: "cur", scope: !107, file: !5, line: 13, type: !55)
!118 = !DILocation(line: 13, column: 26, scope: !107)
!119 = !DILocation(line: 13, column: 32, scope: !107)
!120 = !DILocation(line: 14, column: 5, scope: !107)
!121 = !DILocation(line: 14, column: 12, scope: !107)
!122 = !DILocation(line: 14, column: 18, scope: !107)
!123 = !DILocation(line: 14, column: 16, scope: !107)
!124 = !DILocalVariable(name: "c", scope: !125, file: !5, line: 15, type: !26)
!125 = distinct !DILexicalBlock(scope: !107, file: !5, line: 14, column: 23)
!126 = !DILocation(line: 15, column: 22, scope: !125)
!127 = !DILocation(line: 15, column: 26, scope: !125)
!128 = !DILocation(line: 16, column: 13, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !5, line: 16, column: 13)
!130 = !DILocation(line: 16, column: 15, scope: !129)
!131 = !DILocation(line: 16, column: 13, scope: !125)
!132 = !DILocation(line: 17, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !134, file: !5, line: 17, column: 17)
!134 = distinct !DILexicalBlock(scope: !129, file: !5, line: 16, column: 24)
!135 = !DILocation(line: 17, column: 23, scope: !133)
!136 = !DILocation(line: 17, column: 21, scope: !133)
!137 = !DILocation(line: 17, column: 27, scope: !133)
!138 = !DILocation(line: 17, column: 17, scope: !134)
!139 = !DILocation(line: 17, column: 32, scope: !133)
!140 = !DILocation(line: 18, column: 13, scope: !134)
!141 = !DILocation(line: 20, column: 13, scope: !125)
!142 = distinct !{!142, !120, !143, !86}
!143 = !DILocation(line: 21, column: 5, scope: !107)
!144 = !DILocation(line: 22, column: 5, scope: !107)
!145 = !DILocation(line: 23, column: 1, scope: !107)
