; ModuleID = '/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/klee_results/05_12/linked.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"len\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"0 && \22BOTH_REACHABLE_05_12\22\00", align 1
@.str.3 = private unnamed_addr constant [78 x i8] c"/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/driver_05_12.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [15 x i8] c"int main(void)\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"MSG\00", align 1
@.str.1.5 = private unnamed_addr constant [5 x i8] c"RPY \00", align 1
@.str.2.6 = private unnamed_addr constant [5 x i8] c"ERR \00", align 1
@.str.3.7 = private unnamed_addr constant [5 x i8] c"ANS \00", align 1
@.str.4.8 = private unnamed_addr constant [5 x i8] c"NUL \00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"SEQ \00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"END\00", align 1

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
  %17 = call i32 @predicate_05(i8* %15, i32 %16), !dbg !39
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
define dso_local i32 @predicate_05(i8* %0, i32 %1) #0 !dbg !51 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !57, metadata !DIExpression()), !dbg !58
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata i8** %6, metadata !61, metadata !DIExpression()), !dbg !65
  %8 = load i8*, i8** %4, align 8, !dbg !66
  store i8* %8, i8** %6, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata i8** %7, metadata !67, metadata !DIExpression()), !dbg !68
  %9 = load i8*, i8** %4, align 8, !dbg !69
  %10 = load i32, i32* %5, align 4, !dbg !70
  %11 = zext i32 %10 to i64, !dbg !71
  %12 = getelementptr inbounds i8, i8* %9, i64 %11, !dbg !71
  store i8* %12, i8** %7, align 8, !dbg !68
  %13 = load i8*, i8** %6, align 8, !dbg !72
  %14 = load i32, i32* %5, align 4, !dbg !74
  %15 = load i8*, i8** %7, align 8, !dbg !75
  %16 = call i32 @l_strnstart_reaches(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), i32 4, i8* %13, i32 %14, i8* %15), !dbg !76
  %17 = icmp ne i32 %16, 0, !dbg !76
  br i1 %17, label %18, label %19, !dbg !77

18:                                               ; preds = %2
  store i32 1, i32* %3, align 4, !dbg !78
  br label %62, !dbg !78

19:                                               ; preds = %2
  %20 = load i8*, i8** %6, align 8, !dbg !79
  %21 = load i32, i32* %5, align 4, !dbg !81
  %22 = load i8*, i8** %7, align 8, !dbg !82
  %23 = call i32 @l_strnstart_reaches(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1.5, i64 0, i64 0), i32 4, i8* %20, i32 %21, i8* %22), !dbg !83
  %24 = icmp ne i32 %23, 0, !dbg !83
  br i1 %24, label %25, label %26, !dbg !84

25:                                               ; preds = %19
  store i32 1, i32* %3, align 4, !dbg !85
  br label %62, !dbg !85

26:                                               ; preds = %19
  %27 = load i8*, i8** %6, align 8, !dbg !86
  %28 = load i32, i32* %5, align 4, !dbg !88
  %29 = load i8*, i8** %7, align 8, !dbg !89
  %30 = call i32 @l_strnstart_reaches(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2.6, i64 0, i64 0), i32 4, i8* %27, i32 %28, i8* %29), !dbg !90
  %31 = icmp ne i32 %30, 0, !dbg !90
  br i1 %31, label %32, label %33, !dbg !91

32:                                               ; preds = %26
  store i32 1, i32* %3, align 4, !dbg !92
  br label %62, !dbg !92

33:                                               ; preds = %26
  %34 = load i8*, i8** %6, align 8, !dbg !93
  %35 = load i32, i32* %5, align 4, !dbg !95
  %36 = load i8*, i8** %7, align 8, !dbg !96
  %37 = call i32 @l_strnstart_reaches(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3.7, i64 0, i64 0), i32 4, i8* %34, i32 %35, i8* %36), !dbg !97
  %38 = icmp ne i32 %37, 0, !dbg !97
  br i1 %38, label %39, label %40, !dbg !98

39:                                               ; preds = %33
  store i32 1, i32* %3, align 4, !dbg !99
  br label %62, !dbg !99

40:                                               ; preds = %33
  %41 = load i8*, i8** %6, align 8, !dbg !100
  %42 = load i32, i32* %5, align 4, !dbg !102
  %43 = load i8*, i8** %7, align 8, !dbg !103
  %44 = call i32 @l_strnstart_reaches(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4.8, i64 0, i64 0), i32 4, i8* %41, i32 %42, i8* %43), !dbg !104
  %45 = icmp ne i32 %44, 0, !dbg !104
  br i1 %45, label %46, label %47, !dbg !105

46:                                               ; preds = %40
  store i32 1, i32* %3, align 4, !dbg !106
  br label %62, !dbg !106

47:                                               ; preds = %40
  %48 = load i8*, i8** %6, align 8, !dbg !107
  %49 = load i32, i32* %5, align 4, !dbg !109
  %50 = load i8*, i8** %7, align 8, !dbg !110
  %51 = call i32 @l_strnstart_reaches(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i64 0, i64 0), i32 4, i8* %48, i32 %49, i8* %50), !dbg !111
  %52 = icmp ne i32 %51, 0, !dbg !111
  br i1 %52, label %53, label %54, !dbg !112

53:                                               ; preds = %47
  store i32 1, i32* %3, align 4, !dbg !113
  br label %62, !dbg !113

54:                                               ; preds = %47
  %55 = load i8*, i8** %6, align 8, !dbg !114
  %56 = load i32, i32* %5, align 4, !dbg !116
  %57 = load i8*, i8** %7, align 8, !dbg !117
  %58 = call i32 @l_strnstart_reaches(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i64 0, i64 0), i32 4, i8* %55, i32 %56, i8* %57), !dbg !118
  %59 = icmp ne i32 %58, 0, !dbg !118
  br i1 %59, label %60, label %61, !dbg !119

60:                                               ; preds = %54
  store i32 1, i32* %3, align 4, !dbg !120
  br label %62, !dbg !120

61:                                               ; preds = %54
  store i32 0, i32* %3, align 4, !dbg !121
  br label %62, !dbg !121

62:                                               ; preds = %61, %60, %53, %46, %39, %32, %25, %18
  %63 = load i32, i32* %3, align 4, !dbg !122
  ret i32 %63, !dbg !122
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @l_strnstart_reaches(i8* %0, i32 %1, i8* %2, i32 %3, i8* %4) #0 !dbg !123 {
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  store i8* %0, i8** %7, align 8
  call void @llvm.dbg.declare(metadata i8** %7, metadata !130, metadata !DIExpression()), !dbg !131
  store i32 %1, i32* %8, align 4
  call void @llvm.dbg.declare(metadata i32* %8, metadata !132, metadata !DIExpression()), !dbg !133
  store i8* %2, i8** %9, align 8
  call void @llvm.dbg.declare(metadata i8** %9, metadata !134, metadata !DIExpression()), !dbg !135
  store i32 %3, i32* %10, align 4
  call void @llvm.dbg.declare(metadata i32* %10, metadata !136, metadata !DIExpression()), !dbg !137
  store i8* %4, i8** %11, align 8
  call void @llvm.dbg.declare(metadata i8** %11, metadata !138, metadata !DIExpression()), !dbg !139
  %12 = load i8*, i8** %9, align 8, !dbg !140
  %13 = load i32, i32* %8, align 4, !dbg !142
  %14 = zext i32 %13 to i64, !dbg !143
  %15 = getelementptr inbounds i8, i8* %12, i64 %14, !dbg !143
  %16 = load i8*, i8** %11, align 8, !dbg !144
  %17 = icmp ugt i8* %15, %16, !dbg !145
  br i1 %17, label %18, label %19, !dbg !146

18:                                               ; preds = %5
  store i32 0, i32* %6, align 4, !dbg !147
  br label %26, !dbg !147

19:                                               ; preds = %5
  %20 = load i32, i32* %8, align 4, !dbg !148
  %21 = load i32, i32* %10, align 4, !dbg !150
  %22 = icmp ugt i32 %20, %21, !dbg !151
  br i1 %22, label %23, label %24, !dbg !152

23:                                               ; preds = %19
  store i32 0, i32* %6, align 4, !dbg !153
  br label %26, !dbg !153

24:                                               ; preds = %19
  %25 = load i8*, i8** %7, align 8, !dbg !154
  store i32 1, i32* %6, align 4, !dbg !155
  br label %26, !dbg !155

26:                                               ; preds = %24, %23, %18
  %27 = load i32, i32* %6, align 4, !dbg !156
  ret i32 %27, !dbg !156
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @predicate_12(i8* %0, i32 %1) #0 !dbg !157 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !159, metadata !DIExpression()), !dbg !160
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !161, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.declare(metadata i8** %6, metadata !163, metadata !DIExpression()), !dbg !167
  %9 = load i8*, i8** %4, align 8, !dbg !168
  store i8* %9, i8** %6, align 8, !dbg !167
  call void @llvm.dbg.declare(metadata i8** %7, metadata !169, metadata !DIExpression()), !dbg !170
  %10 = load i8*, i8** %4, align 8, !dbg !171
  %11 = load i32, i32* %5, align 4, !dbg !172
  %12 = zext i32 %11 to i64, !dbg !173
  %13 = getelementptr inbounds i8, i8* %10, i64 %12, !dbg !173
  store i8* %13, i8** %7, align 8, !dbg !170
  call void @llvm.dbg.declare(metadata i32* %8, metadata !174, metadata !DIExpression()), !dbg !176
  %14 = load i32, i32* %5, align 4, !dbg !177
  store i32 %14, i32* %8, align 4, !dbg !176
  %15 = load i32, i32* %8, align 4, !dbg !178
  %16 = icmp ult i32 %15, 2, !dbg !180
  br i1 %16, label %17, label %18, !dbg !181

17:                                               ; preds = %2
  store i32 0, i32* %3, align 4, !dbg !182
  br label %31, !dbg !182

18:                                               ; preds = %2
  %19 = load i8*, i8** %6, align 8, !dbg !183
  %20 = getelementptr inbounds i8, i8* %19, i64 2, !dbg !185
  %21 = load i8*, i8** %7, align 8, !dbg !186
  %22 = icmp ugt i8* %20, %21, !dbg !187
  br i1 %22, label %23, label %24, !dbg !188

23:                                               ; preds = %18
  store i32 0, i32* %3, align 4, !dbg !189
  br label %31, !dbg !189

24:                                               ; preds = %18
  %25 = load i8*, i8** %6, align 8, !dbg !190
  %26 = getelementptr inbounds i8, i8* %25, i64 0, !dbg !190
  %27 = load i8, i8* %26, align 1, !dbg !190
  %28 = load i8*, i8** %6, align 8, !dbg !191
  %29 = getelementptr inbounds i8, i8* %28, i64 1, !dbg !191
  %30 = load i8, i8* %29, align 1, !dbg !191
  store i32 1, i32* %3, align 4, !dbg !192
  br label %31, !dbg !192

31:                                               ; preds = %24, %23, %17
  %32 = load i32, i32* %3, align 4, !dbg !193
  ret i32 %32, !dbg !193
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
!1 = !DIFile(filename: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/driver_05_12.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!2 = !{}
!3 = distinct !DICompileUnit(language: DW_LANG_C99, file: !4, producer: "clang version 13.0.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!4 = !DIFile(filename: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/predicate_05.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!5 = distinct !DICompileUnit(language: DW_LANG_C99, file: !6, producer: "clang version 13.0.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!6 = !DIFile(filename: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/predicate_12.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!7 = !{!"clang version 13.0.1"}
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 28, type: !15, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "driver_05_12.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
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
!35 = !DILocalVariable(name: "r05", scope: !13, file: !14, line: 38, type: !17)
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
!51 = distinct !DISubprogram(name: "predicate_05", scope: !52, file: !52, line: 46, type: !53, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !3, retainedNodes: !2)
!52 = !DIFile(filename: "predicate_05.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!53 = !DISubroutineType(types: !54)
!54 = !{!17, !55, !25}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !20)
!57 = !DILocalVariable(name: "buf", arg: 1, scope: !51, file: !52, line: 46, type: !55)
!58 = !DILocation(line: 46, column: 39, scope: !51)
!59 = !DILocalVariable(name: "len", arg: 2, scope: !51, file: !52, line: 46, type: !25)
!60 = !DILocation(line: 46, column: 57, scope: !51)
!61 = !DILocalVariable(name: "bp", scope: !51, file: !52, line: 48, type: !62)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !64)
!64 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !52, line: 18, baseType: !20)
!65 = !DILocation(line: 48, column: 19, scope: !51)
!66 = !DILocation(line: 48, column: 24, scope: !51)
!67 = !DILocalVariable(name: "ep", scope: !51, file: !52, line: 49, type: !62)
!68 = !DILocation(line: 49, column: 19, scope: !51)
!69 = !DILocation(line: 49, column: 24, scope: !51)
!70 = !DILocation(line: 49, column: 30, scope: !51)
!71 = !DILocation(line: 49, column: 28, scope: !51)
!72 = !DILocation(line: 55, column: 40, scope: !73)
!73 = distinct !DILexicalBlock(scope: !51, file: !52, line: 55, column: 9)
!74 = !DILocation(line: 55, column: 44, scope: !73)
!75 = !DILocation(line: 55, column: 49, scope: !73)
!76 = !DILocation(line: 55, column: 9, scope: !73)
!77 = !DILocation(line: 55, column: 9, scope: !51)
!78 = !DILocation(line: 55, column: 54, scope: !73)
!79 = !DILocation(line: 56, column: 40, scope: !80)
!80 = distinct !DILexicalBlock(scope: !51, file: !52, line: 56, column: 9)
!81 = !DILocation(line: 56, column: 44, scope: !80)
!82 = !DILocation(line: 56, column: 49, scope: !80)
!83 = !DILocation(line: 56, column: 9, scope: !80)
!84 = !DILocation(line: 56, column: 9, scope: !51)
!85 = !DILocation(line: 56, column: 54, scope: !80)
!86 = !DILocation(line: 57, column: 40, scope: !87)
!87 = distinct !DILexicalBlock(scope: !51, file: !52, line: 57, column: 9)
!88 = !DILocation(line: 57, column: 44, scope: !87)
!89 = !DILocation(line: 57, column: 49, scope: !87)
!90 = !DILocation(line: 57, column: 9, scope: !87)
!91 = !DILocation(line: 57, column: 9, scope: !51)
!92 = !DILocation(line: 57, column: 54, scope: !87)
!93 = !DILocation(line: 58, column: 40, scope: !94)
!94 = distinct !DILexicalBlock(scope: !51, file: !52, line: 58, column: 9)
!95 = !DILocation(line: 58, column: 44, scope: !94)
!96 = !DILocation(line: 58, column: 49, scope: !94)
!97 = !DILocation(line: 58, column: 9, scope: !94)
!98 = !DILocation(line: 58, column: 9, scope: !51)
!99 = !DILocation(line: 58, column: 54, scope: !94)
!100 = !DILocation(line: 59, column: 40, scope: !101)
!101 = distinct !DILexicalBlock(scope: !51, file: !52, line: 59, column: 9)
!102 = !DILocation(line: 59, column: 44, scope: !101)
!103 = !DILocation(line: 59, column: 49, scope: !101)
!104 = !DILocation(line: 59, column: 9, scope: !101)
!105 = !DILocation(line: 59, column: 9, scope: !51)
!106 = !DILocation(line: 59, column: 54, scope: !101)
!107 = !DILocation(line: 60, column: 40, scope: !108)
!108 = distinct !DILexicalBlock(scope: !51, file: !52, line: 60, column: 9)
!109 = !DILocation(line: 60, column: 44, scope: !108)
!110 = !DILocation(line: 60, column: 49, scope: !108)
!111 = !DILocation(line: 60, column: 9, scope: !108)
!112 = !DILocation(line: 60, column: 9, scope: !51)
!113 = !DILocation(line: 60, column: 54, scope: !108)
!114 = !DILocation(line: 61, column: 40, scope: !115)
!115 = distinct !DILexicalBlock(scope: !51, file: !52, line: 61, column: 9)
!116 = !DILocation(line: 61, column: 44, scope: !115)
!117 = !DILocation(line: 61, column: 49, scope: !115)
!118 = !DILocation(line: 61, column: 9, scope: !115)
!119 = !DILocation(line: 61, column: 9, scope: !51)
!120 = !DILocation(line: 61, column: 54, scope: !115)
!121 = !DILocation(line: 63, column: 5, scope: !51)
!122 = !DILocation(line: 64, column: 1, scope: !51)
!123 = distinct !DISubprogram(name: "l_strnstart_reaches", scope: !52, file: !52, line: 26, type: !124, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !2)
!124 = !DISubroutineType(types: !125)
!125 = !{!17, !126, !129, !62, !129, !62}
!126 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !127, size: 64)
!127 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !128)
!128 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!129 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !52, line: 19, baseType: !25)
!130 = !DILocalVariable(name: "tstr1", arg: 1, scope: !123, file: !52, line: 26, type: !126)
!131 = !DILocation(line: 26, column: 44, scope: !123)
!132 = !DILocalVariable(name: "tl1", arg: 2, scope: !123, file: !52, line: 26, type: !129)
!133 = !DILocation(line: 26, column: 57, scope: !123)
!134 = !DILocalVariable(name: "str2", arg: 3, scope: !123, file: !52, line: 27, type: !62)
!135 = !DILocation(line: 27, column: 46, scope: !123)
!136 = !DILocalVariable(name: "l2", arg: 4, scope: !123, file: !52, line: 27, type: !129)
!137 = !DILocation(line: 27, column: 58, scope: !123)
!138 = !DILocalVariable(name: "ep", arg: 5, scope: !123, file: !52, line: 28, type: !62)
!139 = !DILocation(line: 28, column: 46, scope: !123)
!140 = !DILocation(line: 34, column: 9, scope: !141)
!141 = distinct !DILexicalBlock(scope: !123, file: !52, line: 34, column: 9)
!142 = !DILocation(line: 34, column: 16, scope: !141)
!143 = !DILocation(line: 34, column: 14, scope: !141)
!144 = !DILocation(line: 34, column: 22, scope: !141)
!145 = !DILocation(line: 34, column: 20, scope: !141)
!146 = !DILocation(line: 34, column: 9, scope: !123)
!147 = !DILocation(line: 35, column: 9, scope: !141)
!148 = !DILocation(line: 38, column: 9, scope: !149)
!149 = distinct !DILexicalBlock(scope: !123, file: !52, line: 38, column: 9)
!150 = !DILocation(line: 38, column: 15, scope: !149)
!151 = !DILocation(line: 38, column: 13, scope: !149)
!152 = !DILocation(line: 38, column: 9, scope: !123)
!153 = !DILocation(line: 39, column: 9, scope: !149)
!154 = !DILocation(line: 42, column: 11, scope: !123)
!155 = !DILocation(line: 43, column: 5, scope: !123)
!156 = !DILocation(line: 44, column: 1, scope: !123)
!157 = distinct !DISubprogram(name: "predicate_12", scope: !158, file: !158, line: 29, type: !53, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, retainedNodes: !2)
!158 = !DIFile(filename: "predicate_12.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!159 = !DILocalVariable(name: "buf", arg: 1, scope: !157, file: !158, line: 29, type: !55)
!160 = !DILocation(line: 29, column: 39, scope: !157)
!161 = !DILocalVariable(name: "len", arg: 2, scope: !157, file: !158, line: 29, type: !25)
!162 = !DILocation(line: 29, column: 57, scope: !157)
!163 = !DILocalVariable(name: "bp", scope: !157, file: !158, line: 31, type: !164)
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !165, size: 64)
!165 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !166)
!166 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !158, line: 20, baseType: !20)
!167 = !DILocation(line: 31, column: 19, scope: !157)
!168 = !DILocation(line: 31, column: 24, scope: !157)
!169 = !DILocalVariable(name: "ep", scope: !157, file: !158, line: 32, type: !164)
!170 = !DILocation(line: 32, column: 19, scope: !157)
!171 = !DILocation(line: 32, column: 24, scope: !157)
!172 = !DILocation(line: 32, column: 30, scope: !157)
!173 = !DILocation(line: 32, column: 28, scope: !157)
!174 = !DILocalVariable(name: "length", scope: !157, file: !158, line: 34, type: !175)
!175 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !158, line: 21, baseType: !25)
!176 = !DILocation(line: 34, column: 11, scope: !157)
!177 = !DILocation(line: 34, column: 20, scope: !157)
!178 = !DILocation(line: 42, column: 9, scope: !179)
!179 = distinct !DILexicalBlock(scope: !157, file: !158, line: 42, column: 9)
!180 = !DILocation(line: 42, column: 16, scope: !179)
!181 = !DILocation(line: 42, column: 9, scope: !157)
!182 = !DILocation(line: 43, column: 9, scope: !179)
!183 = !DILocation(line: 53, column: 9, scope: !184)
!184 = distinct !DILexicalBlock(scope: !157, file: !158, line: 53, column: 9)
!185 = !DILocation(line: 53, column: 12, scope: !184)
!186 = !DILocation(line: 53, column: 18, scope: !184)
!187 = !DILocation(line: 53, column: 16, scope: !184)
!188 = !DILocation(line: 53, column: 9, scope: !157)
!189 = !DILocation(line: 54, column: 9, scope: !184)
!190 = !DILocation(line: 57, column: 11, scope: !157)
!191 = !DILocation(line: 58, column: 11, scope: !157)
!192 = !DILocation(line: 59, column: 5, scope: !157)
!193 = !DILocation(line: 60, column: 1, scope: !157)
