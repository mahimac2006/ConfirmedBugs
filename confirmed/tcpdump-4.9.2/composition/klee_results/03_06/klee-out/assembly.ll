; ModuleID = '/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/klee_results/03_06/linked.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"len\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"0 && \22BOTH_REACHABLE_03_06\22\00", align 1
@.str.3 = private unnamed_addr constant [78 x i8] c"/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/driver_03_06.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [15 x i8] c"int main(void)\00", align 1
@predicate_03.marker = internal constant [16 x i8] c"\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF", align 16, !dbg !0

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !36 {
  %1 = alloca i32, align 4
  %2 = alloca [64 x i8], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [64 x i8]* %2, metadata !40, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i32* %3, metadata !45, metadata !DIExpression()), !dbg !46
  %6 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !47
  call void @klee_make_symbolic(i8* %6, i64 64, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !48
  %7 = bitcast i32* %3 to i8*, !dbg !49
  call void @klee_make_symbolic(i8* %7, i64 4, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)), !dbg !50
  %8 = load i32, i32* %3, align 4, !dbg !51
  %9 = icmp uge i32 %8, 1, !dbg !52
  %10 = load i32, i32* %3, align 4, !dbg !53
  %11 = icmp ule i32 %10, 64, !dbg !53
  %12 = select i1 %9, i1 %11, i1 false, !dbg !53
  %13 = zext i1 %12 to i32, !dbg !53
  %14 = sext i32 %13 to i64, !dbg !51
  call void @klee_assume(i64 %14), !dbg !54
  call void @llvm.dbg.declare(metadata i32* %4, metadata !55, metadata !DIExpression()), !dbg !56
  %15 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !57
  %16 = load i32, i32* %3, align 4, !dbg !58
  %17 = call i32 @predicate_03(i8* %15, i32 %16), !dbg !59
  store i32 %17, i32* %4, align 4, !dbg !56
  call void @llvm.dbg.declare(metadata i32* %5, metadata !60, metadata !DIExpression()), !dbg !61
  %18 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !62
  %19 = load i32, i32* %3, align 4, !dbg !63
  %20 = call i32 @predicate_06(i8* %18, i32 %19), !dbg !64
  store i32 %20, i32* %5, align 4, !dbg !61
  %21 = load i32, i32* %4, align 4, !dbg !65
  %22 = icmp eq i32 %21, 1, !dbg !67
  %23 = load i32, i32* %5, align 4
  %24 = icmp eq i32 %23, 1
  %or.cond = select i1 %22, i1 %24, i1 false, !dbg !68
  br i1 %or.cond, label %25, label %26, !dbg !68

25:                                               ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.3, i64 0, i64 0), i32 42, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #4, !dbg !69
  unreachable, !dbg !69

26:                                               ; preds = %0
  ret i32 0, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

declare dso_local void @klee_assume(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @predicate_03(i8* %0, i32 %1) #0 !dbg !2 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !71, metadata !DIExpression()), !dbg !72
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i8** %6, metadata !75, metadata !DIExpression()), !dbg !77
  %12 = load i8*, i8** %4, align 8, !dbg !78
  store i8* %12, i8** %6, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata i8** %7, metadata !79, metadata !DIExpression()), !dbg !80
  %13 = load i8*, i8** %4, align 8, !dbg !81
  %14 = load i32, i32* %5, align 4, !dbg !82
  %15 = zext i32 %14 to i64, !dbg !83
  %16 = getelementptr inbounds i8, i8* %13, i64 %15, !dbg !83
  store i8* %16, i8** %7, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata i32* %8, metadata !84, metadata !DIExpression()), !dbg !85
  store i32 1, i32* %8, align 4, !dbg !85
  %17 = load i32, i32* %8, align 4, !dbg !86
  call void @llvm.dbg.declare(metadata i32* %9, metadata !87, metadata !DIExpression()), !dbg !89
  store i32 16, i32* %9, align 4, !dbg !89
  br label %18, !dbg !90

18:                                               ; preds = %61, %28, %2
  %19 = load i8*, i8** %6, align 8, !dbg !91
  %20 = load i8*, i8** %7, align 8, !dbg !92
  %21 = icmp ult i8* %19, %20, !dbg !93
  br i1 %21, label %22, label %71, !dbg !90

22:                                               ; preds = %18
  %23 = load i8*, i8** %6, align 8, !dbg !94
  %24 = getelementptr inbounds i8, i8* %23, i64 0, !dbg !94
  %25 = load i8, i8* %24, align 1, !dbg !94
  %26 = zext i8 %25 to i32, !dbg !94
  %27 = icmp ne i32 %26, 255, !dbg !97
  br i1 %27, label %28, label %31, !dbg !98

28:                                               ; preds = %22
  %29 = load i8*, i8** %6, align 8, !dbg !99
  %30 = getelementptr inbounds i8, i8* %29, i32 1, !dbg !99
  store i8* %30, i8** %6, align 8, !dbg !99
  br label %18, !dbg !101, !llvm.loop !102

31:                                               ; preds = %22
  %32 = load i8*, i8** %6, align 8, !dbg !105
  %33 = getelementptr inbounds i8, i8* %32, i64 16, !dbg !107
  %34 = load i8*, i8** %7, align 8, !dbg !108
  %35 = icmp ugt i8* %33, %34, !dbg !109
  br i1 %35, label %36, label %37, !dbg !110

36:                                               ; preds = %31
  store i32 0, i32* %3, align 4, !dbg !111
  br label %72, !dbg !111

37:                                               ; preds = %31
  call void @llvm.dbg.declare(metadata i32* %10, metadata !112, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i32* %11, metadata !116, metadata !DIExpression()), !dbg !117
  store i32 0, i32* %11, align 4, !dbg !117
  store i32 0, i32* %10, align 4, !dbg !118
  br label %38, !dbg !120

38:                                               ; preds = %55, %37
  %39 = load i32, i32* %10, align 4, !dbg !121
  %40 = icmp ult i32 %39, 16, !dbg !123
  br i1 %40, label %41, label %58, !dbg !124

41:                                               ; preds = %38
  %42 = load i8*, i8** %6, align 8, !dbg !125
  %43 = load i32, i32* %10, align 4, !dbg !128
  %44 = zext i32 %43 to i64, !dbg !125
  %45 = getelementptr inbounds i8, i8* %42, i64 %44, !dbg !125
  %46 = load i8, i8* %45, align 1, !dbg !125
  %47 = zext i8 %46 to i32, !dbg !125
  %48 = load i32, i32* %10, align 4, !dbg !129
  %49 = zext i32 %48 to i64, !dbg !130
  %50 = getelementptr inbounds [16 x i8], [16 x i8]* @predicate_03.marker, i64 0, i64 %49, !dbg !130
  %51 = load i8, i8* %50, align 1, !dbg !130
  %52 = zext i8 %51 to i32, !dbg !130
  %53 = icmp ne i32 %47, %52, !dbg !131
  br i1 %53, label %54, label %55, !dbg !132

54:                                               ; preds = %41
  store i32 1, i32* %11, align 4, !dbg !133
  br label %58, !dbg !135

55:                                               ; preds = %41
  %56 = load i32, i32* %10, align 4, !dbg !136
  %57 = add i32 %56, 1, !dbg !136
  store i32 %57, i32* %10, align 4, !dbg !136
  br label %38, !dbg !137, !llvm.loop !138

58:                                               ; preds = %54, %38
  %59 = load i32, i32* %11, align 4, !dbg !140
  %60 = icmp ne i32 %59, 0, !dbg !140
  br i1 %60, label %61, label %64, !dbg !142

61:                                               ; preds = %58
  %62 = load i8*, i8** %6, align 8, !dbg !143
  %63 = getelementptr inbounds i8, i8* %62, i32 1, !dbg !143
  store i8* %63, i8** %6, align 8, !dbg !143
  br label %18, !dbg !145, !llvm.loop !102

64:                                               ; preds = %58
  %65 = load i8*, i8** %6, align 8, !dbg !146
  %66 = getelementptr inbounds i8, i8* %65, i64 19, !dbg !148
  %67 = load i8*, i8** %7, align 8, !dbg !149
  %68 = icmp ugt i8* %66, %67, !dbg !150
  br i1 %68, label %69, label %70, !dbg !151

69:                                               ; preds = %64
  store i32 0, i32* %3, align 4, !dbg !152
  br label %72, !dbg !152

70:                                               ; preds = %64
  store i32 1, i32* %3, align 4, !dbg !153
  br label %72, !dbg !153

71:                                               ; preds = %18
  store i32 0, i32* %3, align 4, !dbg !154
  br label %72, !dbg !154

72:                                               ; preds = %71, %70, %69, %36
  %73 = load i32, i32* %3, align 4, !dbg !155
  ret i32 %73, !dbg !155
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @predicate_06(i8* %0, i32 %1) #0 !dbg !156 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !157, metadata !DIExpression()), !dbg !158
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !159, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata i8** %6, metadata !161, metadata !DIExpression()), !dbg !162
  %15 = load i8*, i8** %4, align 8, !dbg !163
  store i8* %15, i8** %6, align 8, !dbg !162
  call void @llvm.dbg.declare(metadata i8** %7, metadata !164, metadata !DIExpression()), !dbg !165
  %16 = load i8*, i8** %4, align 8, !dbg !166
  %17 = load i32, i32* %5, align 4, !dbg !167
  %18 = zext i32 %17 to i64, !dbg !168
  %19 = getelementptr inbounds i8, i8* %16, i64 %18, !dbg !168
  store i8* %19, i8** %7, align 8, !dbg !165
  call void @llvm.dbg.declare(metadata i32* %8, metadata !169, metadata !DIExpression()), !dbg !170
  store i32 1, i32* %8, align 4, !dbg !170
  call void @llvm.dbg.declare(metadata i32* %9, metadata !171, metadata !DIExpression()), !dbg !173
  %20 = load i32, i32* %5, align 4, !dbg !174
  store i32 %20, i32* %9, align 4, !dbg !173
  call void @llvm.dbg.declare(metadata i32* %10, metadata !175, metadata !DIExpression()), !dbg !176
  %21 = load i32, i32* %5, align 4, !dbg !177
  store i32 %21, i32* %10, align 4, !dbg !176
  call void @llvm.dbg.declare(metadata i8** %11, metadata !178, metadata !DIExpression()), !dbg !179
  %22 = load i8*, i8** %6, align 8, !dbg !180
  store i8* %22, i8** %11, align 8, !dbg !179
  call void @llvm.dbg.declare(metadata i8** %12, metadata !181, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.declare(metadata i32* %13, metadata !183, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.declare(metadata i32* %14, metadata !185, metadata !DIExpression()), !dbg !186
  %23 = load i32, i32* %8, align 4, !dbg !187
  %24 = load i32, i32* %13, align 4, !dbg !188
  %25 = load i32, i32* %14, align 4, !dbg !189
  %26 = load i32, i32* %9, align 4, !dbg !190
  %27 = icmp ult i32 %26, 4, !dbg !192
  br i1 %27, label %28, label %29, !dbg !193

28:                                               ; preds = %2
  store i32 0, i32* %3, align 4, !dbg !194
  br label %79, !dbg !194

29:                                               ; preds = %2
  %30 = load i8*, i8** %11, align 8, !dbg !195
  store i8* %30, i8** %12, align 8, !dbg !196
  %31 = load i8*, i8** %12, align 8, !dbg !197
  %32 = getelementptr inbounds i8, i8* %31, i64 4, !dbg !199
  %33 = load i8*, i8** %7, align 8, !dbg !200
  %34 = icmp ugt i8* %32, %33, !dbg !201
  br i1 %34, label %35, label %36, !dbg !202

35:                                               ; preds = %29
  store i32 0, i32* %3, align 4, !dbg !203
  br label %79, !dbg !203

36:                                               ; preds = %29
  %37 = load i8*, i8** %12, align 8, !dbg !204
  %38 = getelementptr inbounds i8, i8* %37, i64 4, !dbg !204
  store i8* %38, i8** %12, align 8, !dbg !204
  %39 = load i8*, i8** %12, align 8, !dbg !205
  %40 = load i8*, i8** %11, align 8, !dbg !206
  %41 = load i32, i32* %10, align 4, !dbg !207
  %42 = zext i32 %41 to i64, !dbg !208
  %43 = getelementptr inbounds i8, i8* %40, i64 %42, !dbg !208
  %44 = icmp ult i8* %39, %43, !dbg !209
  br i1 %44, label %45, label %78, !dbg !210

45:                                               ; preds = %36
  %46 = load i8*, i8** %12, align 8, !dbg !211
  %47 = getelementptr inbounds i8, i8* %46, i64 4, !dbg !214
  %48 = load i8*, i8** %7, align 8, !dbg !215
  %49 = icmp ugt i8* %47, %48, !dbg !216
  br i1 %49, label %50, label %51, !dbg !217

50:                                               ; preds = %45
  store i32 0, i32* %3, align 4, !dbg !218
  br label %79, !dbg !218

51:                                               ; preds = %45
  %52 = load i8*, i8** %12, align 8, !dbg !219
  %53 = getelementptr inbounds i8, i8* %52, i64 0, !dbg !219
  %54 = getelementptr inbounds i8, i8* %53, i64 0, !dbg !219
  %55 = load i8, i8* %54, align 1, !dbg !219
  %56 = zext i8 %55 to i32, !dbg !219
  %57 = shl i32 %56, 8, !dbg !219
  %58 = load i8*, i8** %12, align 8, !dbg !219
  %59 = getelementptr inbounds i8, i8* %58, i64 0, !dbg !219
  %60 = getelementptr inbounds i8, i8* %59, i64 1, !dbg !219
  %61 = load i8, i8* %60, align 1, !dbg !219
  %62 = zext i8 %61 to i32, !dbg !219
  %63 = or i32 %57, %62, !dbg !219
  store i32 %63, i32* %13, align 4, !dbg !220
  %64 = load i8*, i8** %12, align 8, !dbg !221
  %65 = getelementptr inbounds i8, i8* %64, i64 2, !dbg !221
  %66 = getelementptr inbounds i8, i8* %65, i64 0, !dbg !221
  %67 = load i8, i8* %66, align 1, !dbg !221
  %68 = zext i8 %67 to i32, !dbg !221
  %69 = shl i32 %68, 8, !dbg !221
  %70 = load i8*, i8** %12, align 8, !dbg !221
  %71 = getelementptr inbounds i8, i8* %70, i64 2, !dbg !221
  %72 = getelementptr inbounds i8, i8* %71, i64 1, !dbg !221
  %73 = load i8, i8* %72, align 1, !dbg !221
  %74 = zext i8 %73 to i32, !dbg !221
  %75 = or i32 %69, %74, !dbg !221
  store i32 %75, i32* %14, align 4, !dbg !222
  %76 = load i32, i32* %13, align 4, !dbg !223
  %77 = load i32, i32* %14, align 4, !dbg !224
  store i32 1, i32* %3, align 4, !dbg !225
  br label %79, !dbg !225

78:                                               ; preds = %36
  store i32 0, i32* %3, align 4, !dbg !226
  br label %79, !dbg !226

79:                                               ; preds = %78, %51, %50, %35, %28
  %80 = load i32, i32* %3, align 4, !dbg !227
  ret i32 %80, !dbg !227
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind }

!llvm.dbg.cu = !{!21, !11, !23}
!llvm.ident = !{!30, !30, !30}
!llvm.module.flags = !{!31, !32, !33, !34, !35}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "marker", scope: !2, file: !3, line: 35, type: !16, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "predicate_03", scope: !3, file: !3, line: 25, type: !4, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !11, retainedNodes: !13)
!3 = !DIFile(filename: "predicate_03.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !7, !10}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!9 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = distinct !DICompileUnit(language: DW_LANG_C99, file: !12, producer: "clang version 13.0.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !13, retainedTypes: !14, globals: !15, splitDebugInlining: false, nameTableKind: None)
!12 = !DIFile(filename: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/predicate_03.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!13 = !{}
!14 = !{!10}
!15 = !{!0}
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 128, elements: !19)
!17 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !3, line: 18, baseType: !9)
!19 = !{!20}
!20 = !DISubrange(count: 16)
!21 = distinct !DICompileUnit(language: DW_LANG_C99, file: !22, producer: "clang version 13.0.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !13, splitDebugInlining: false, nameTableKind: None)
!22 = !DIFile(filename: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/driver_03_06.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!23 = distinct !DICompileUnit(language: DW_LANG_C99, file: !24, producer: "clang version 13.0.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !13, retainedTypes: !25, splitDebugInlining: false, nameTableKind: None)
!24 = !DIFile(filename: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/predicate_06.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!25 = !{!10, !26}
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !28)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !29, line: 21, baseType: !9)
!29 = !DIFile(filename: "predicate_06.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!30 = !{!"clang version 13.0.1"}
!31 = !{i32 7, !"Dwarf Version", i32 4}
!32 = !{i32 2, !"Debug Info Version", i32 3}
!33 = !{i32 1, !"wchar_size", i32 4}
!34 = !{i32 7, !"uwtable", i32 1}
!35 = !{i32 7, !"frame-pointer", i32 2}
!36 = distinct !DISubprogram(name: "main", scope: !37, file: !37, line: 28, type: !38, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !13)
!37 = !DIFile(filename: "driver_03_06.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!38 = !DISubroutineType(types: !39)
!39 = !{!6}
!40 = !DILocalVariable(name: "buf", scope: !36, file: !37, line: 29, type: !41)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 512, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 64)
!44 = !DILocation(line: 29, column: 19, scope: !36)
!45 = !DILocalVariable(name: "len", scope: !36, file: !37, line: 30, type: !10)
!46 = !DILocation(line: 30, column: 18, scope: !36)
!47 = !DILocation(line: 33, column: 24, scope: !36)
!48 = !DILocation(line: 33, column: 5, scope: !36)
!49 = !DILocation(line: 34, column: 24, scope: !36)
!50 = !DILocation(line: 34, column: 5, scope: !36)
!51 = !DILocation(line: 35, column: 17, scope: !36)
!52 = !DILocation(line: 35, column: 21, scope: !36)
!53 = !DILocation(line: 35, column: 26, scope: !36)
!54 = !DILocation(line: 35, column: 5, scope: !36)
!55 = !DILocalVariable(name: "r03", scope: !36, file: !37, line: 38, type: !6)
!56 = !DILocation(line: 38, column: 9, scope: !36)
!57 = !DILocation(line: 38, column: 28, scope: !36)
!58 = !DILocation(line: 38, column: 33, scope: !36)
!59 = !DILocation(line: 38, column: 15, scope: !36)
!60 = !DILocalVariable(name: "r06", scope: !36, file: !37, line: 39, type: !6)
!61 = !DILocation(line: 39, column: 9, scope: !36)
!62 = !DILocation(line: 39, column: 28, scope: !36)
!63 = !DILocation(line: 39, column: 33, scope: !36)
!64 = !DILocation(line: 39, column: 15, scope: !36)
!65 = !DILocation(line: 41, column: 9, scope: !66)
!66 = distinct !DILexicalBlock(scope: !36, file: !37, line: 41, column: 9)
!67 = !DILocation(line: 41, column: 13, scope: !66)
!68 = !DILocation(line: 41, column: 18, scope: !66)
!69 = !DILocation(line: 42, column: 9, scope: !66)
!70 = !DILocation(line: 44, column: 5, scope: !36)
!71 = !DILocalVariable(name: "buf", arg: 1, scope: !2, file: !3, line: 25, type: !7)
!72 = !DILocation(line: 25, column: 39, scope: !2)
!73 = !DILocalVariable(name: "len", arg: 2, scope: !2, file: !3, line: 25, type: !10)
!74 = !DILocation(line: 25, column: 57, scope: !2)
!75 = !DILocalVariable(name: "p", scope: !2, file: !3, line: 27, type: !76)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!77 = !DILocation(line: 27, column: 19, scope: !2)
!78 = !DILocation(line: 27, column: 24, scope: !2)
!79 = !DILocalVariable(name: "ep", scope: !2, file: !3, line: 28, type: !76)
!80 = !DILocation(line: 28, column: 19, scope: !2)
!81 = !DILocation(line: 28, column: 24, scope: !2)
!82 = !DILocation(line: 28, column: 30, scope: !2)
!83 = !DILocation(line: 28, column: 28, scope: !2)
!84 = !DILocalVariable(name: "ndo_vflag", scope: !2, file: !3, line: 31, type: !6)
!85 = !DILocation(line: 31, column: 9, scope: !2)
!86 = !DILocation(line: 32, column: 11, scope: !2)
!87 = !DILocalVariable(name: "marker_len", scope: !2, file: !3, line: 39, type: !88)
!88 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !10)
!89 = !DILocation(line: 39, column: 24, scope: !2)
!90 = !DILocation(line: 42, column: 5, scope: !2)
!91 = !DILocation(line: 42, column: 12, scope: !2)
!92 = !DILocation(line: 42, column: 16, scope: !2)
!93 = !DILocation(line: 42, column: 14, scope: !2)
!94 = !DILocation(line: 44, column: 13, scope: !95)
!95 = distinct !DILexicalBlock(scope: !96, file: !3, line: 44, column: 13)
!96 = distinct !DILexicalBlock(scope: !2, file: !3, line: 42, column: 20)
!97 = !DILocation(line: 44, column: 18, scope: !95)
!98 = !DILocation(line: 44, column: 13, scope: !96)
!99 = !DILocation(line: 45, column: 14, scope: !100)
!100 = distinct !DILexicalBlock(scope: !95, file: !3, line: 44, column: 27)
!101 = !DILocation(line: 46, column: 13, scope: !100)
!102 = distinct !{!102, !90, !103, !104}
!103 = !DILocation(line: 75, column: 5, scope: !2)
!104 = !{!"llvm.loop.mustprogress"}
!105 = !DILocation(line: 51, column: 13, scope: !106)
!106 = distinct !DILexicalBlock(scope: !96, file: !3, line: 51, column: 13)
!107 = !DILocation(line: 51, column: 15, scope: !106)
!108 = !DILocation(line: 51, column: 30, scope: !106)
!109 = !DILocation(line: 51, column: 28, scope: !106)
!110 = !DILocation(line: 51, column: 13, scope: !96)
!111 = !DILocation(line: 52, column: 13, scope: !106)
!112 = !DILocalVariable(name: "i", scope: !113, file: !3, line: 56, type: !114)
!113 = distinct !DILexicalBlock(scope: !96, file: !3, line: 55, column: 9)
!114 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !3, line: 19, baseType: !10)
!115 = !DILocation(line: 56, column: 19, scope: !113)
!116 = !DILocalVariable(name: "mismatch", scope: !113, file: !3, line: 57, type: !6)
!117 = !DILocation(line: 57, column: 17, scope: !113)
!118 = !DILocation(line: 58, column: 20, scope: !119)
!119 = distinct !DILexicalBlock(scope: !113, file: !3, line: 58, column: 13)
!120 = !DILocation(line: 58, column: 18, scope: !119)
!121 = !DILocation(line: 58, column: 25, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !3, line: 58, column: 13)
!123 = !DILocation(line: 58, column: 27, scope: !122)
!124 = !DILocation(line: 58, column: 13, scope: !119)
!125 = !DILocation(line: 59, column: 21, scope: !126)
!126 = distinct !DILexicalBlock(scope: !127, file: !3, line: 59, column: 21)
!127 = distinct !DILexicalBlock(scope: !122, file: !3, line: 58, column: 46)
!128 = !DILocation(line: 59, column: 23, scope: !126)
!129 = !DILocation(line: 59, column: 36, scope: !126)
!130 = !DILocation(line: 59, column: 29, scope: !126)
!131 = !DILocation(line: 59, column: 26, scope: !126)
!132 = !DILocation(line: 59, column: 21, scope: !127)
!133 = !DILocation(line: 59, column: 51, scope: !134)
!134 = distinct !DILexicalBlock(scope: !126, file: !3, line: 59, column: 40)
!135 = !DILocation(line: 59, column: 56, scope: !134)
!136 = !DILocation(line: 58, column: 42, scope: !122)
!137 = !DILocation(line: 58, column: 13, scope: !122)
!138 = distinct !{!138, !124, !139, !104}
!139 = !DILocation(line: 60, column: 13, scope: !119)
!140 = !DILocation(line: 61, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !113, file: !3, line: 61, column: 17)
!142 = !DILocation(line: 61, column: 17, scope: !113)
!143 = !DILocation(line: 62, column: 18, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !3, line: 61, column: 27)
!145 = !DILocation(line: 63, column: 17, scope: !144)
!146 = !DILocation(line: 69, column: 13, scope: !147)
!147 = distinct !DILexicalBlock(scope: !96, file: !3, line: 69, column: 13)
!148 = !DILocation(line: 69, column: 15, scope: !147)
!149 = !DILocation(line: 69, column: 28, scope: !147)
!150 = !DILocation(line: 69, column: 26, scope: !147)
!151 = !DILocation(line: 69, column: 13, scope: !96)
!152 = !DILocation(line: 70, column: 13, scope: !147)
!153 = !DILocation(line: 74, column: 9, scope: !96)
!154 = !DILocation(line: 77, column: 5, scope: !2)
!155 = !DILocation(line: 78, column: 1, scope: !2)
!156 = distinct !DISubprogram(name: "predicate_06", scope: !29, file: !29, line: 36, type: !4, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !23, retainedNodes: !13)
!157 = !DILocalVariable(name: "buf", arg: 1, scope: !156, file: !29, line: 36, type: !7)
!158 = !DILocation(line: 36, column: 39, scope: !156)
!159 = !DILocalVariable(name: "len", arg: 2, scope: !156, file: !29, line: 36, type: !10)
!160 = !DILocation(line: 36, column: 57, scope: !156)
!161 = !DILocalVariable(name: "bp", scope: !156, file: !29, line: 38, type: !26)
!162 = !DILocation(line: 38, column: 19, scope: !156)
!163 = !DILocation(line: 38, column: 24, scope: !156)
!164 = !DILocalVariable(name: "ep", scope: !156, file: !29, line: 39, type: !26)
!165 = !DILocation(line: 39, column: 19, scope: !156)
!166 = !DILocation(line: 39, column: 24, scope: !156)
!167 = !DILocation(line: 39, column: 30, scope: !156)
!168 = !DILocation(line: 39, column: 28, scope: !156)
!169 = !DILocalVariable(name: "ndo_vflag", scope: !156, file: !29, line: 42, type: !6)
!170 = !DILocation(line: 42, column: 11, scope: !156)
!171 = !DILocalVariable(name: "caplen", scope: !156, file: !29, line: 43, type: !172)
!172 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !29, line: 22, baseType: !10)
!173 = !DILocation(line: 43, column: 11, scope: !156)
!174 = !DILocation(line: 43, column: 23, scope: !156)
!175 = !DILocalVariable(name: "length", scope: !156, file: !29, line: 44, type: !172)
!176 = !DILocation(line: 44, column: 11, scope: !156)
!177 = !DILocation(line: 44, column: 23, scope: !156)
!178 = !DILocalVariable(name: "pptr", scope: !156, file: !29, line: 46, type: !26)
!179 = !DILocation(line: 46, column: 19, scope: !156)
!180 = !DILocation(line: 46, column: 26, scope: !156)
!181 = !DILocalVariable(name: "tptr", scope: !156, file: !29, line: 47, type: !26)
!182 = !DILocation(line: 47, column: 19, scope: !156)
!183 = !DILocalVariable(name: "type", scope: !156, file: !29, line: 48, type: !10)
!184 = !DILocation(line: 48, column: 19, scope: !156)
!185 = !DILocalVariable(name: "tlen", scope: !156, file: !29, line: 48, type: !10)
!186 = !DILocation(line: 48, column: 25, scope: !156)
!187 = !DILocation(line: 49, column: 11, scope: !156)
!188 = !DILocation(line: 49, column: 28, scope: !156)
!189 = !DILocation(line: 49, column: 40, scope: !156)
!190 = !DILocation(line: 52, column: 9, scope: !191)
!191 = distinct !DILexicalBlock(scope: !156, file: !29, line: 52, column: 9)
!192 = !DILocation(line: 52, column: 16, scope: !191)
!193 = !DILocation(line: 52, column: 9, scope: !156)
!194 = !DILocation(line: 53, column: 9, scope: !191)
!195 = !DILocation(line: 55, column: 12, scope: !156)
!196 = !DILocation(line: 55, column: 10, scope: !156)
!197 = !DILocation(line: 60, column: 9, scope: !198)
!198 = distinct !DILexicalBlock(scope: !156, file: !29, line: 60, column: 9)
!199 = !DILocation(line: 60, column: 14, scope: !198)
!200 = !DILocation(line: 60, column: 33, scope: !198)
!201 = !DILocation(line: 60, column: 31, scope: !198)
!202 = !DILocation(line: 60, column: 9, scope: !156)
!203 = !DILocation(line: 61, column: 9, scope: !198)
!204 = !DILocation(line: 64, column: 10, scope: !156)
!205 = !DILocation(line: 66, column: 12, scope: !156)
!206 = !DILocation(line: 66, column: 20, scope: !156)
!207 = !DILocation(line: 66, column: 27, scope: !156)
!208 = !DILocation(line: 66, column: 25, scope: !156)
!209 = !DILocation(line: 66, column: 17, scope: !156)
!210 = !DILocation(line: 66, column: 5, scope: !156)
!211 = !DILocation(line: 70, column: 13, scope: !212)
!212 = distinct !DILexicalBlock(scope: !213, file: !29, line: 70, column: 13)
!213 = distinct !DILexicalBlock(scope: !156, file: !29, line: 66, column: 36)
!214 = !DILocation(line: 70, column: 18, scope: !212)
!215 = !DILocation(line: 70, column: 41, scope: !212)
!216 = !DILocation(line: 70, column: 39, scope: !212)
!217 = !DILocation(line: 70, column: 13, scope: !213)
!218 = !DILocation(line: 71, column: 13, scope: !212)
!219 = !DILocation(line: 77, column: 16, scope: !213)
!220 = !DILocation(line: 77, column: 14, scope: !213)
!221 = !DILocation(line: 78, column: 16, scope: !213)
!222 = !DILocation(line: 78, column: 14, scope: !213)
!223 = !DILocation(line: 79, column: 15, scope: !213)
!224 = !DILocation(line: 79, column: 27, scope: !213)
!225 = !DILocation(line: 80, column: 9, scope: !213)
!226 = !DILocation(line: 84, column: 5, scope: !156)
!227 = !DILocation(line: 85, column: 1, scope: !156)
