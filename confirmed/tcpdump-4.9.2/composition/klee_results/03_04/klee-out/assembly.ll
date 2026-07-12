; ModuleID = '/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/klee_results/03_04/linked.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"len\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"0 && \22BOTH_REACHABLE_03_04\22\00", align 1
@.str.3 = private unnamed_addr constant [78 x i8] c"/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/driver_03_04.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [15 x i8] c"int main(void)\00", align 1
@predicate_03.marker = internal constant [16 x i8] c"\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF", align 16, !dbg !0
@predicate_04.marker = internal constant [16 x i8] c"\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF", align 16, !dbg !21

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !41 {
  %1 = alloca i32, align 4
  %2 = alloca [64 x i8], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [64 x i8]* %2, metadata !45, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i32* %3, metadata !50, metadata !DIExpression()), !dbg !51
  %6 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !52
  call void @klee_make_symbolic(i8* %6, i64 64, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !53
  %7 = bitcast i32* %3 to i8*, !dbg !54
  call void @klee_make_symbolic(i8* %7, i64 4, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  %8 = load i32, i32* %3, align 4, !dbg !56
  %9 = icmp uge i32 %8, 1, !dbg !57
  %10 = load i32, i32* %3, align 4, !dbg !58
  %11 = icmp ule i32 %10, 64, !dbg !58
  %12 = select i1 %9, i1 %11, i1 false, !dbg !58
  %13 = zext i1 %12 to i32, !dbg !58
  %14 = sext i32 %13 to i64, !dbg !56
  call void @klee_assume(i64 %14), !dbg !59
  call void @llvm.dbg.declare(metadata i32* %4, metadata !60, metadata !DIExpression()), !dbg !61
  %15 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !62
  %16 = load i32, i32* %3, align 4, !dbg !63
  %17 = call i32 @predicate_03(i8* %15, i32 %16), !dbg !64
  store i32 %17, i32* %4, align 4, !dbg !61
  call void @llvm.dbg.declare(metadata i32* %5, metadata !65, metadata !DIExpression()), !dbg !66
  %18 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !67
  %19 = load i32, i32* %3, align 4, !dbg !68
  %20 = call i32 @predicate_04(i8* %18, i32 %19), !dbg !69
  store i32 %20, i32* %5, align 4, !dbg !66
  %21 = load i32, i32* %4, align 4, !dbg !70
  %22 = icmp eq i32 %21, 1, !dbg !72
  %23 = load i32, i32* %5, align 4
  %24 = icmp eq i32 %23, 1
  %or.cond = select i1 %22, i1 %24, i1 false, !dbg !73
  br i1 %or.cond, label %25, label %26, !dbg !73

25:                                               ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.3, i64 0, i64 0), i32 42, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #4, !dbg !74
  unreachable, !dbg !74

26:                                               ; preds = %0
  ret i32 0, !dbg !75
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
  call void @llvm.dbg.declare(metadata i8** %4, metadata !76, metadata !DIExpression()), !dbg !77
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i8** %6, metadata !80, metadata !DIExpression()), !dbg !82
  %12 = load i8*, i8** %4, align 8, !dbg !83
  store i8* %12, i8** %6, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i8** %7, metadata !84, metadata !DIExpression()), !dbg !85
  %13 = load i8*, i8** %4, align 8, !dbg !86
  %14 = load i32, i32* %5, align 4, !dbg !87
  %15 = zext i32 %14 to i64, !dbg !88
  %16 = getelementptr inbounds i8, i8* %13, i64 %15, !dbg !88
  store i8* %16, i8** %7, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i32* %8, metadata !89, metadata !DIExpression()), !dbg !90
  store i32 1, i32* %8, align 4, !dbg !90
  %17 = load i32, i32* %8, align 4, !dbg !91
  call void @llvm.dbg.declare(metadata i32* %9, metadata !92, metadata !DIExpression()), !dbg !94
  store i32 16, i32* %9, align 4, !dbg !94
  br label %18, !dbg !95

18:                                               ; preds = %61, %28, %2
  %19 = load i8*, i8** %6, align 8, !dbg !96
  %20 = load i8*, i8** %7, align 8, !dbg !97
  %21 = icmp ult i8* %19, %20, !dbg !98
  br i1 %21, label %22, label %71, !dbg !95

22:                                               ; preds = %18
  %23 = load i8*, i8** %6, align 8, !dbg !99
  %24 = getelementptr inbounds i8, i8* %23, i64 0, !dbg !99
  %25 = load i8, i8* %24, align 1, !dbg !99
  %26 = zext i8 %25 to i32, !dbg !99
  %27 = icmp ne i32 %26, 255, !dbg !102
  br i1 %27, label %28, label %31, !dbg !103

28:                                               ; preds = %22
  %29 = load i8*, i8** %6, align 8, !dbg !104
  %30 = getelementptr inbounds i8, i8* %29, i32 1, !dbg !104
  store i8* %30, i8** %6, align 8, !dbg !104
  br label %18, !dbg !106, !llvm.loop !107

31:                                               ; preds = %22
  %32 = load i8*, i8** %6, align 8, !dbg !110
  %33 = getelementptr inbounds i8, i8* %32, i64 16, !dbg !112
  %34 = load i8*, i8** %7, align 8, !dbg !113
  %35 = icmp ugt i8* %33, %34, !dbg !114
  br i1 %35, label %36, label %37, !dbg !115

36:                                               ; preds = %31
  store i32 0, i32* %3, align 4, !dbg !116
  br label %72, !dbg !116

37:                                               ; preds = %31
  call void @llvm.dbg.declare(metadata i32* %10, metadata !117, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i32* %11, metadata !121, metadata !DIExpression()), !dbg !122
  store i32 0, i32* %11, align 4, !dbg !122
  store i32 0, i32* %10, align 4, !dbg !123
  br label %38, !dbg !125

38:                                               ; preds = %55, %37
  %39 = load i32, i32* %10, align 4, !dbg !126
  %40 = icmp ult i32 %39, 16, !dbg !128
  br i1 %40, label %41, label %58, !dbg !129

41:                                               ; preds = %38
  %42 = load i8*, i8** %6, align 8, !dbg !130
  %43 = load i32, i32* %10, align 4, !dbg !133
  %44 = zext i32 %43 to i64, !dbg !130
  %45 = getelementptr inbounds i8, i8* %42, i64 %44, !dbg !130
  %46 = load i8, i8* %45, align 1, !dbg !130
  %47 = zext i8 %46 to i32, !dbg !130
  %48 = load i32, i32* %10, align 4, !dbg !134
  %49 = zext i32 %48 to i64, !dbg !135
  %50 = getelementptr inbounds [16 x i8], [16 x i8]* @predicate_03.marker, i64 0, i64 %49, !dbg !135
  %51 = load i8, i8* %50, align 1, !dbg !135
  %52 = zext i8 %51 to i32, !dbg !135
  %53 = icmp ne i32 %47, %52, !dbg !136
  br i1 %53, label %54, label %55, !dbg !137

54:                                               ; preds = %41
  store i32 1, i32* %11, align 4, !dbg !138
  br label %58, !dbg !140

55:                                               ; preds = %41
  %56 = load i32, i32* %10, align 4, !dbg !141
  %57 = add i32 %56, 1, !dbg !141
  store i32 %57, i32* %10, align 4, !dbg !141
  br label %38, !dbg !142, !llvm.loop !143

58:                                               ; preds = %54, %38
  %59 = load i32, i32* %11, align 4, !dbg !145
  %60 = icmp ne i32 %59, 0, !dbg !145
  br i1 %60, label %61, label %64, !dbg !147

61:                                               ; preds = %58
  %62 = load i8*, i8** %6, align 8, !dbg !148
  %63 = getelementptr inbounds i8, i8* %62, i32 1, !dbg !148
  store i8* %63, i8** %6, align 8, !dbg !148
  br label %18, !dbg !150, !llvm.loop !107

64:                                               ; preds = %58
  %65 = load i8*, i8** %6, align 8, !dbg !151
  %66 = getelementptr inbounds i8, i8* %65, i64 19, !dbg !153
  %67 = load i8*, i8** %7, align 8, !dbg !154
  %68 = icmp ugt i8* %66, %67, !dbg !155
  br i1 %68, label %69, label %70, !dbg !156

69:                                               ; preds = %64
  store i32 0, i32* %3, align 4, !dbg !157
  br label %72, !dbg !157

70:                                               ; preds = %64
  store i32 1, i32* %3, align 4, !dbg !158
  br label %72, !dbg !158

71:                                               ; preds = %18
  store i32 0, i32* %3, align 4, !dbg !159
  br label %72, !dbg !159

72:                                               ; preds = %71, %70, %69, %36
  %73 = load i32, i32* %3, align 4, !dbg !160
  ret i32 %73, !dbg !160
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @predicate_04(i8* %0, i32 %1) #0 !dbg !23 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i8*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !161, metadata !DIExpression()), !dbg !162
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !163, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.declare(metadata i8** %6, metadata !165, metadata !DIExpression()), !dbg !167
  %17 = load i8*, i8** %4, align 8, !dbg !168
  store i8* %17, i8** %6, align 8, !dbg !167
  call void @llvm.dbg.declare(metadata i8** %7, metadata !169, metadata !DIExpression()), !dbg !170
  %18 = load i8*, i8** %4, align 8, !dbg !171
  %19 = load i32, i32* %5, align 4, !dbg !172
  %20 = zext i32 %19 to i64, !dbg !173
  %21 = getelementptr inbounds i8, i8* %18, i64 %20, !dbg !173
  store i8* %21, i8** %7, align 8, !dbg !170
  call void @llvm.dbg.declare(metadata i32* %8, metadata !174, metadata !DIExpression()), !dbg !175
  store i32 1, i32* %8, align 4, !dbg !175
  call void @llvm.dbg.declare(metadata i32* %9, metadata !176, metadata !DIExpression()), !dbg !178
  store i32 16, i32* %9, align 4, !dbg !178
  %22 = load i32, i32* %8, align 4, !dbg !179
  %23 = icmp slt i32 %22, 1, !dbg !181
  br i1 %23, label %24, label %25, !dbg !182

24:                                               ; preds = %2
  store i32 0, i32* %3, align 4, !dbg !183
  br label %134, !dbg !183

25:                                               ; preds = %2
  call void @llvm.dbg.declare(metadata i8** %10, metadata !184, metadata !DIExpression()), !dbg !185
  %26 = load i8*, i8** %6, align 8, !dbg !186
  store i8* %26, i8** %10, align 8, !dbg !185
  br label %27, !dbg !187

27:                                               ; preds = %70, %37, %25
  %28 = load i8*, i8** %10, align 8, !dbg !188
  %29 = load i8*, i8** %7, align 8, !dbg !189
  %30 = icmp ult i8* %28, %29, !dbg !190
  br i1 %30, label %31, label %133, !dbg !187

31:                                               ; preds = %27
  %32 = load i8*, i8** %10, align 8, !dbg !191
  %33 = getelementptr inbounds i8, i8* %32, i64 0, !dbg !191
  %34 = load i8, i8* %33, align 1, !dbg !191
  %35 = zext i8 %34 to i32, !dbg !191
  %36 = icmp ne i32 %35, 255, !dbg !194
  br i1 %36, label %37, label %40, !dbg !195

37:                                               ; preds = %31
  %38 = load i8*, i8** %10, align 8, !dbg !196
  %39 = getelementptr inbounds i8, i8* %38, i32 1, !dbg !196
  store i8* %39, i8** %10, align 8, !dbg !196
  br label %27, !dbg !198, !llvm.loop !199

40:                                               ; preds = %31
  %41 = load i8*, i8** %10, align 8, !dbg !201
  %42 = getelementptr inbounds i8, i8* %41, i64 16, !dbg !203
  %43 = load i8*, i8** %7, align 8, !dbg !204
  %44 = icmp ugt i8* %42, %43, !dbg !205
  br i1 %44, label %45, label %46, !dbg !206

45:                                               ; preds = %40
  store i32 0, i32* %3, align 4, !dbg !207
  br label %134, !dbg !207

46:                                               ; preds = %40
  call void @llvm.dbg.declare(metadata i32* %11, metadata !208, metadata !DIExpression()), !dbg !210
  call void @llvm.dbg.declare(metadata i32* %12, metadata !211, metadata !DIExpression()), !dbg !212
  store i32 0, i32* %12, align 4, !dbg !212
  store i32 0, i32* %11, align 4, !dbg !213
  br label %47, !dbg !215

47:                                               ; preds = %64, %46
  %48 = load i32, i32* %11, align 4, !dbg !216
  %49 = icmp ult i32 %48, 16, !dbg !218
  br i1 %49, label %50, label %67, !dbg !219

50:                                               ; preds = %47
  %51 = load i8*, i8** %10, align 8, !dbg !220
  %52 = load i32, i32* %11, align 4, !dbg !223
  %53 = zext i32 %52 to i64, !dbg !220
  %54 = getelementptr inbounds i8, i8* %51, i64 %53, !dbg !220
  %55 = load i8, i8* %54, align 1, !dbg !220
  %56 = zext i8 %55 to i32, !dbg !220
  %57 = load i32, i32* %11, align 4, !dbg !224
  %58 = zext i32 %57 to i64, !dbg !225
  %59 = getelementptr inbounds [16 x i8], [16 x i8]* @predicate_04.marker, i64 0, i64 %58, !dbg !225
  %60 = load i8, i8* %59, align 1, !dbg !225
  %61 = zext i8 %60 to i32, !dbg !225
  %62 = icmp ne i32 %56, %61, !dbg !226
  br i1 %62, label %63, label %64, !dbg !227

63:                                               ; preds = %50
  store i32 1, i32* %12, align 4, !dbg !228
  br label %67, !dbg !230

64:                                               ; preds = %50
  %65 = load i32, i32* %11, align 4, !dbg !231
  %66 = add i32 %65, 1, !dbg !231
  store i32 %66, i32* %11, align 4, !dbg !231
  br label %47, !dbg !232, !llvm.loop !233

67:                                               ; preds = %63, %47
  %68 = load i32, i32* %12, align 4, !dbg !235
  %69 = icmp ne i32 %68, 0, !dbg !235
  br i1 %69, label %70, label %73, !dbg !237

70:                                               ; preds = %67
  %71 = load i8*, i8** %10, align 8, !dbg !238
  %72 = getelementptr inbounds i8, i8* %71, i32 1, !dbg !238
  store i8* %72, i8** %10, align 8, !dbg !238
  br label %27, !dbg !240, !llvm.loop !199

73:                                               ; preds = %67
  %74 = load i8*, i8** %10, align 8, !dbg !241
  %75 = getelementptr inbounds i8, i8* %74, i64 19, !dbg !243
  %76 = load i8*, i8** %7, align 8, !dbg !244
  %77 = icmp ugt i8* %75, %76, !dbg !245
  br i1 %77, label %78, label %79, !dbg !246

78:                                               ; preds = %73
  store i32 0, i32* %3, align 4, !dbg !247
  br label %134, !dbg !247

79:                                               ; preds = %73
  call void @llvm.dbg.declare(metadata i32* %13, metadata !248, metadata !DIExpression()), !dbg !249
  %80 = load i8*, i8** %10, align 8, !dbg !250
  %81 = getelementptr inbounds i8, i8* %80, i64 16, !dbg !250
  %82 = load i8, i8* %81, align 1, !dbg !250
  %83 = zext i8 %82 to i32, !dbg !251
  %84 = shl i32 %83, 8, !dbg !252
  %85 = load i8*, i8** %10, align 8, !dbg !253
  %86 = getelementptr inbounds i8, i8* %85, i64 17, !dbg !253
  %87 = load i8, i8* %86, align 1, !dbg !253
  %88 = zext i8 %87 to i32, !dbg !254
  %89 = or i32 %84, %88, !dbg !255
  store i32 %89, i32* %13, align 4, !dbg !249
  %90 = load i32, i32* %13, align 4, !dbg !256
  %91 = icmp ult i32 %90, 19, !dbg !258
  br i1 %91, label %133, label %92, !dbg !259

92:                                               ; preds = %79
  call void @llvm.dbg.declare(metadata i8** %14, metadata !260, metadata !DIExpression()), !dbg !261
  %93 = load i8*, i8** %10, align 8, !dbg !262
  %94 = getelementptr inbounds i8, i8* %93, i64 19, !dbg !263
  store i8* %94, i8** %14, align 8, !dbg !261
  %95 = load i8*, i8** %14, align 8, !dbg !264
  %96 = getelementptr inbounds i8, i8* %95, i64 1, !dbg !266
  %97 = load i8*, i8** %7, align 8, !dbg !267
  %98 = icmp ugt i8* %96, %97, !dbg !268
  br i1 %98, label %99, label %100, !dbg !269

99:                                               ; preds = %92
  store i32 0, i32* %3, align 4, !dbg !270
  br label %134, !dbg !270

100:                                              ; preds = %92
  call void @llvm.dbg.declare(metadata i32* %15, metadata !271, metadata !DIExpression()), !dbg !272
  %101 = load i8*, i8** %14, align 8, !dbg !273
  %102 = getelementptr inbounds i8, i8* %101, i64 0, !dbg !273
  %103 = load i8, i8* %102, align 1, !dbg !273
  %104 = zext i8 %103 to i32, !dbg !273
  store i32 %104, i32* %15, align 4, !dbg !272
  %105 = load i32, i32* %15, align 4, !dbg !274
  %106 = sub i32 %105, 24, !dbg !274
  store i32 %106, i32* %15, align 4, !dbg !274
  call void @llvm.dbg.declare(metadata i32* %16, metadata !275, metadata !DIExpression()), !dbg !276
  %107 = load i32, i32* %15, align 4, !dbg !277
  %108 = add i32 %107, 7, !dbg !278
  %109 = udiv i32 %108, 8, !dbg !279
  store i32 %109, i32* %16, align 4, !dbg !276
  %110 = load i8*, i8** %14, align 8, !dbg !280
  %111 = getelementptr inbounds i8, i8* %110, i64 4, !dbg !282
  %112 = load i8*, i8** %7, align 8, !dbg !283
  %113 = icmp ugt i8* %111, %112, !dbg !284
  br i1 %113, label %114, label %115, !dbg !285

114:                                              ; preds = %100
  store i32 0, i32* %3, align 4, !dbg !286
  br label %134, !dbg !286

115:                                              ; preds = %100
  %116 = load i8*, i8** %14, align 8, !dbg !287
  %117 = getelementptr inbounds i8, i8* %116, i64 4, !dbg !289
  %118 = load i8*, i8** %7, align 8, !dbg !290
  %119 = icmp ugt i8* %117, %118, !dbg !291
  br i1 %119, label %120, label %121, !dbg !292

120:                                              ; preds = %115
  store i32 0, i32* %3, align 4, !dbg !293
  br label %134, !dbg !293

121:                                              ; preds = %115
  %122 = load i32, i32* %16, align 4, !dbg !294
  %123 = load i8*, i8** %7, align 8, !dbg !296
  %124 = load i8*, i8** %14, align 8, !dbg !297
  %125 = getelementptr inbounds i8, i8* %124, i64 4, !dbg !298
  %126 = ptrtoint i8* %123 to i64, !dbg !299
  %127 = ptrtoint i8* %125 to i64, !dbg !299
  %128 = sub i64 %126, %127, !dbg !299
  %129 = trunc i64 %128 to i32, !dbg !300
  %130 = icmp ugt i32 %122, %129, !dbg !301
  br i1 %130, label %131, label %132, !dbg !302

131:                                              ; preds = %121
  store i32 0, i32* %3, align 4, !dbg !303
  br label %134, !dbg !303

132:                                              ; preds = %121
  store i32 1, i32* %3, align 4, !dbg !304
  br label %134, !dbg !304

133:                                              ; preds = %79, %27
  store i32 0, i32* %3, align 4, !dbg !305
  br label %134, !dbg !305

134:                                              ; preds = %133, %132, %131, %120, %114, %99, %78, %45, %24
  %135 = load i32, i32* %3, align 4, !dbg !306
  ret i32 %135, !dbg !306
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind }

!llvm.dbg.cu = !{!33, !11, !25}
!llvm.ident = !{!35, !35, !35}
!llvm.module.flags = !{!36, !37, !38, !39, !40}

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
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "marker", scope: !23, file: !24, line: 40, type: !30, isLocal: true, isDefinition: true)
!23 = distinct !DISubprogram(name: "predicate_04", scope: !24, file: !24, line: 31, type: !4, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !25, retainedNodes: !13)
!24 = !DIFile(filename: "predicate_04.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!25 = distinct !DICompileUnit(language: DW_LANG_C99, file: !26, producer: "clang version 13.0.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !13, retainedTypes: !27, globals: !29, splitDebugInlining: false, nameTableKind: None)
!26 = !DIFile(filename: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/predicate_04.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!27 = !{!28}
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !24, line: 25, baseType: !10)
!29 = !{!21}
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !31, size: 128, elements: !19)
!31 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !32)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !24, line: 24, baseType: !9)
!33 = distinct !DICompileUnit(language: DW_LANG_C99, file: !34, producer: "clang version 13.0.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !13, splitDebugInlining: false, nameTableKind: None)
!34 = !DIFile(filename: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/driver_03_04.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!35 = !{!"clang version 13.0.1"}
!36 = !{i32 7, !"Dwarf Version", i32 4}
!37 = !{i32 2, !"Debug Info Version", i32 3}
!38 = !{i32 1, !"wchar_size", i32 4}
!39 = !{i32 7, !"uwtable", i32 1}
!40 = !{i32 7, !"frame-pointer", i32 2}
!41 = distinct !DISubprogram(name: "main", scope: !42, file: !42, line: 28, type: !43, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !13)
!42 = !DIFile(filename: "driver_03_04.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!43 = !DISubroutineType(types: !44)
!44 = !{!6}
!45 = !DILocalVariable(name: "buf", scope: !41, file: !42, line: 29, type: !46)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 512, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 64)
!49 = !DILocation(line: 29, column: 19, scope: !41)
!50 = !DILocalVariable(name: "len", scope: !41, file: !42, line: 30, type: !10)
!51 = !DILocation(line: 30, column: 18, scope: !41)
!52 = !DILocation(line: 33, column: 24, scope: !41)
!53 = !DILocation(line: 33, column: 5, scope: !41)
!54 = !DILocation(line: 34, column: 24, scope: !41)
!55 = !DILocation(line: 34, column: 5, scope: !41)
!56 = !DILocation(line: 35, column: 17, scope: !41)
!57 = !DILocation(line: 35, column: 21, scope: !41)
!58 = !DILocation(line: 35, column: 26, scope: !41)
!59 = !DILocation(line: 35, column: 5, scope: !41)
!60 = !DILocalVariable(name: "r03", scope: !41, file: !42, line: 38, type: !6)
!61 = !DILocation(line: 38, column: 9, scope: !41)
!62 = !DILocation(line: 38, column: 28, scope: !41)
!63 = !DILocation(line: 38, column: 33, scope: !41)
!64 = !DILocation(line: 38, column: 15, scope: !41)
!65 = !DILocalVariable(name: "r04", scope: !41, file: !42, line: 39, type: !6)
!66 = !DILocation(line: 39, column: 9, scope: !41)
!67 = !DILocation(line: 39, column: 28, scope: !41)
!68 = !DILocation(line: 39, column: 33, scope: !41)
!69 = !DILocation(line: 39, column: 15, scope: !41)
!70 = !DILocation(line: 41, column: 9, scope: !71)
!71 = distinct !DILexicalBlock(scope: !41, file: !42, line: 41, column: 9)
!72 = !DILocation(line: 41, column: 13, scope: !71)
!73 = !DILocation(line: 41, column: 18, scope: !71)
!74 = !DILocation(line: 42, column: 9, scope: !71)
!75 = !DILocation(line: 44, column: 5, scope: !41)
!76 = !DILocalVariable(name: "buf", arg: 1, scope: !2, file: !3, line: 25, type: !7)
!77 = !DILocation(line: 25, column: 39, scope: !2)
!78 = !DILocalVariable(name: "len", arg: 2, scope: !2, file: !3, line: 25, type: !10)
!79 = !DILocation(line: 25, column: 57, scope: !2)
!80 = !DILocalVariable(name: "p", scope: !2, file: !3, line: 27, type: !81)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!82 = !DILocation(line: 27, column: 19, scope: !2)
!83 = !DILocation(line: 27, column: 24, scope: !2)
!84 = !DILocalVariable(name: "ep", scope: !2, file: !3, line: 28, type: !81)
!85 = !DILocation(line: 28, column: 19, scope: !2)
!86 = !DILocation(line: 28, column: 24, scope: !2)
!87 = !DILocation(line: 28, column: 30, scope: !2)
!88 = !DILocation(line: 28, column: 28, scope: !2)
!89 = !DILocalVariable(name: "ndo_vflag", scope: !2, file: !3, line: 31, type: !6)
!90 = !DILocation(line: 31, column: 9, scope: !2)
!91 = !DILocation(line: 32, column: 11, scope: !2)
!92 = !DILocalVariable(name: "marker_len", scope: !2, file: !3, line: 39, type: !93)
!93 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !10)
!94 = !DILocation(line: 39, column: 24, scope: !2)
!95 = !DILocation(line: 42, column: 5, scope: !2)
!96 = !DILocation(line: 42, column: 12, scope: !2)
!97 = !DILocation(line: 42, column: 16, scope: !2)
!98 = !DILocation(line: 42, column: 14, scope: !2)
!99 = !DILocation(line: 44, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !101, file: !3, line: 44, column: 13)
!101 = distinct !DILexicalBlock(scope: !2, file: !3, line: 42, column: 20)
!102 = !DILocation(line: 44, column: 18, scope: !100)
!103 = !DILocation(line: 44, column: 13, scope: !101)
!104 = !DILocation(line: 45, column: 14, scope: !105)
!105 = distinct !DILexicalBlock(scope: !100, file: !3, line: 44, column: 27)
!106 = !DILocation(line: 46, column: 13, scope: !105)
!107 = distinct !{!107, !95, !108, !109}
!108 = !DILocation(line: 75, column: 5, scope: !2)
!109 = !{!"llvm.loop.mustprogress"}
!110 = !DILocation(line: 51, column: 13, scope: !111)
!111 = distinct !DILexicalBlock(scope: !101, file: !3, line: 51, column: 13)
!112 = !DILocation(line: 51, column: 15, scope: !111)
!113 = !DILocation(line: 51, column: 30, scope: !111)
!114 = !DILocation(line: 51, column: 28, scope: !111)
!115 = !DILocation(line: 51, column: 13, scope: !101)
!116 = !DILocation(line: 52, column: 13, scope: !111)
!117 = !DILocalVariable(name: "i", scope: !118, file: !3, line: 56, type: !119)
!118 = distinct !DILexicalBlock(scope: !101, file: !3, line: 55, column: 9)
!119 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !3, line: 19, baseType: !10)
!120 = !DILocation(line: 56, column: 19, scope: !118)
!121 = !DILocalVariable(name: "mismatch", scope: !118, file: !3, line: 57, type: !6)
!122 = !DILocation(line: 57, column: 17, scope: !118)
!123 = !DILocation(line: 58, column: 20, scope: !124)
!124 = distinct !DILexicalBlock(scope: !118, file: !3, line: 58, column: 13)
!125 = !DILocation(line: 58, column: 18, scope: !124)
!126 = !DILocation(line: 58, column: 25, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !3, line: 58, column: 13)
!128 = !DILocation(line: 58, column: 27, scope: !127)
!129 = !DILocation(line: 58, column: 13, scope: !124)
!130 = !DILocation(line: 59, column: 21, scope: !131)
!131 = distinct !DILexicalBlock(scope: !132, file: !3, line: 59, column: 21)
!132 = distinct !DILexicalBlock(scope: !127, file: !3, line: 58, column: 46)
!133 = !DILocation(line: 59, column: 23, scope: !131)
!134 = !DILocation(line: 59, column: 36, scope: !131)
!135 = !DILocation(line: 59, column: 29, scope: !131)
!136 = !DILocation(line: 59, column: 26, scope: !131)
!137 = !DILocation(line: 59, column: 21, scope: !132)
!138 = !DILocation(line: 59, column: 51, scope: !139)
!139 = distinct !DILexicalBlock(scope: !131, file: !3, line: 59, column: 40)
!140 = !DILocation(line: 59, column: 56, scope: !139)
!141 = !DILocation(line: 58, column: 42, scope: !127)
!142 = !DILocation(line: 58, column: 13, scope: !127)
!143 = distinct !{!143, !129, !144, !109}
!144 = !DILocation(line: 60, column: 13, scope: !124)
!145 = !DILocation(line: 61, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !118, file: !3, line: 61, column: 17)
!147 = !DILocation(line: 61, column: 17, scope: !118)
!148 = !DILocation(line: 62, column: 18, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !3, line: 61, column: 27)
!150 = !DILocation(line: 63, column: 17, scope: !149)
!151 = !DILocation(line: 69, column: 13, scope: !152)
!152 = distinct !DILexicalBlock(scope: !101, file: !3, line: 69, column: 13)
!153 = !DILocation(line: 69, column: 15, scope: !152)
!154 = !DILocation(line: 69, column: 28, scope: !152)
!155 = !DILocation(line: 69, column: 26, scope: !152)
!156 = !DILocation(line: 69, column: 13, scope: !101)
!157 = !DILocation(line: 70, column: 13, scope: !152)
!158 = !DILocation(line: 74, column: 9, scope: !101)
!159 = !DILocation(line: 77, column: 5, scope: !2)
!160 = !DILocation(line: 78, column: 1, scope: !2)
!161 = !DILocalVariable(name: "buf", arg: 1, scope: !23, file: !24, line: 31, type: !7)
!162 = !DILocation(line: 31, column: 39, scope: !23)
!163 = !DILocalVariable(name: "len", arg: 2, scope: !23, file: !24, line: 31, type: !10)
!164 = !DILocation(line: 31, column: 57, scope: !23)
!165 = !DILocalVariable(name: "dat", scope: !23, file: !24, line: 33, type: !166)
!166 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!167 = !DILocation(line: 33, column: 19, scope: !23)
!168 = !DILocation(line: 33, column: 25, scope: !23)
!169 = !DILocalVariable(name: "ep", scope: !23, file: !24, line: 34, type: !166)
!170 = !DILocation(line: 34, column: 19, scope: !23)
!171 = !DILocation(line: 34, column: 25, scope: !23)
!172 = !DILocation(line: 34, column: 31, scope: !23)
!173 = !DILocation(line: 34, column: 29, scope: !23)
!174 = !DILocalVariable(name: "ndo_vflag", scope: !23, file: !24, line: 37, type: !6)
!175 = !DILocation(line: 37, column: 9, scope: !23)
!176 = !DILocalVariable(name: "marker_len", scope: !23, file: !24, line: 44, type: !177)
!177 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !28)
!178 = !DILocation(line: 44, column: 17, scope: !23)
!179 = !DILocation(line: 47, column: 9, scope: !180)
!180 = distinct !DILexicalBlock(scope: !23, file: !24, line: 47, column: 9)
!181 = !DILocation(line: 47, column: 19, scope: !180)
!182 = !DILocation(line: 47, column: 9, scope: !23)
!183 = !DILocation(line: 48, column: 9, scope: !180)
!184 = !DILocalVariable(name: "p", scope: !23, file: !24, line: 50, type: !166)
!185 = !DILocation(line: 50, column: 19, scope: !23)
!186 = !DILocation(line: 50, column: 23, scope: !23)
!187 = !DILocation(line: 52, column: 5, scope: !23)
!188 = !DILocation(line: 52, column: 12, scope: !23)
!189 = !DILocation(line: 52, column: 16, scope: !23)
!190 = !DILocation(line: 52, column: 14, scope: !23)
!191 = !DILocation(line: 54, column: 13, scope: !192)
!192 = distinct !DILexicalBlock(scope: !193, file: !24, line: 54, column: 13)
!193 = distinct !DILexicalBlock(scope: !23, file: !24, line: 52, column: 20)
!194 = !DILocation(line: 54, column: 18, scope: !192)
!195 = !DILocation(line: 54, column: 13, scope: !193)
!196 = !DILocation(line: 55, column: 14, scope: !197)
!197 = distinct !DILexicalBlock(scope: !192, file: !24, line: 54, column: 27)
!198 = !DILocation(line: 56, column: 13, scope: !197)
!199 = distinct !{!199, !187, !200, !109}
!200 = !DILocation(line: 116, column: 5, scope: !23)
!201 = !DILocation(line: 61, column: 13, scope: !202)
!202 = distinct !DILexicalBlock(scope: !193, file: !24, line: 61, column: 13)
!203 = !DILocation(line: 61, column: 15, scope: !202)
!204 = !DILocation(line: 61, column: 30, scope: !202)
!205 = !DILocation(line: 61, column: 28, scope: !202)
!206 = !DILocation(line: 61, column: 13, scope: !193)
!207 = !DILocation(line: 62, column: 13, scope: !202)
!208 = !DILocalVariable(name: "i", scope: !209, file: !24, line: 66, type: !28)
!209 = distinct !DILexicalBlock(scope: !193, file: !24, line: 65, column: 9)
!210 = !DILocation(line: 66, column: 19, scope: !209)
!211 = !DILocalVariable(name: "mismatch", scope: !209, file: !24, line: 67, type: !6)
!212 = !DILocation(line: 67, column: 17, scope: !209)
!213 = !DILocation(line: 68, column: 20, scope: !214)
!214 = distinct !DILexicalBlock(scope: !209, file: !24, line: 68, column: 13)
!215 = !DILocation(line: 68, column: 18, scope: !214)
!216 = !DILocation(line: 68, column: 25, scope: !217)
!217 = distinct !DILexicalBlock(scope: !214, file: !24, line: 68, column: 13)
!218 = !DILocation(line: 68, column: 27, scope: !217)
!219 = !DILocation(line: 68, column: 13, scope: !214)
!220 = !DILocation(line: 69, column: 21, scope: !221)
!221 = distinct !DILexicalBlock(scope: !222, file: !24, line: 69, column: 21)
!222 = distinct !DILexicalBlock(scope: !217, file: !24, line: 68, column: 46)
!223 = !DILocation(line: 69, column: 23, scope: !221)
!224 = !DILocation(line: 69, column: 36, scope: !221)
!225 = !DILocation(line: 69, column: 29, scope: !221)
!226 = !DILocation(line: 69, column: 26, scope: !221)
!227 = !DILocation(line: 69, column: 21, scope: !222)
!228 = !DILocation(line: 69, column: 51, scope: !229)
!229 = distinct !DILexicalBlock(scope: !221, file: !24, line: 69, column: 40)
!230 = !DILocation(line: 69, column: 56, scope: !229)
!231 = !DILocation(line: 68, column: 42, scope: !217)
!232 = !DILocation(line: 68, column: 13, scope: !217)
!233 = distinct !{!233, !219, !234, !109}
!234 = !DILocation(line: 70, column: 13, scope: !214)
!235 = !DILocation(line: 71, column: 17, scope: !236)
!236 = distinct !DILexicalBlock(scope: !209, file: !24, line: 71, column: 17)
!237 = !DILocation(line: 71, column: 17, scope: !209)
!238 = !DILocation(line: 72, column: 18, scope: !239)
!239 = distinct !DILexicalBlock(scope: !236, file: !24, line: 71, column: 27)
!240 = !DILocation(line: 73, column: 17, scope: !239)
!241 = !DILocation(line: 79, column: 13, scope: !242)
!242 = distinct !DILexicalBlock(scope: !193, file: !24, line: 79, column: 13)
!243 = !DILocation(line: 79, column: 15, scope: !242)
!244 = !DILocation(line: 79, column: 28, scope: !242)
!245 = !DILocation(line: 79, column: 26, scope: !242)
!246 = !DILocation(line: 79, column: 13, scope: !193)
!247 = !DILocation(line: 80, column: 13, scope: !242)
!248 = !DILocalVariable(name: "hlen", scope: !193, file: !24, line: 83, type: !28)
!249 = !DILocation(line: 83, column: 15, scope: !193)
!250 = !DILocation(line: 83, column: 30, scope: !193)
!251 = !DILocation(line: 83, column: 23, scope: !193)
!252 = !DILocation(line: 83, column: 36, scope: !193)
!253 = !DILocation(line: 83, column: 51, scope: !193)
!254 = !DILocation(line: 83, column: 44, scope: !193)
!255 = !DILocation(line: 83, column: 42, scope: !193)
!256 = !DILocation(line: 84, column: 13, scope: !257)
!257 = distinct !DILexicalBlock(scope: !193, file: !24, line: 84, column: 13)
!258 = !DILocation(line: 84, column: 18, scope: !257)
!259 = !DILocation(line: 84, column: 13, scope: !193)
!260 = !DILocalVariable(name: "pptr", scope: !193, file: !24, line: 90, type: !166)
!261 = !DILocation(line: 90, column: 23, scope: !193)
!262 = !DILocation(line: 90, column: 30, scope: !193)
!263 = !DILocation(line: 90, column: 32, scope: !193)
!264 = !DILocation(line: 93, column: 13, scope: !265)
!265 = distinct !DILexicalBlock(scope: !193, file: !24, line: 93, column: 13)
!266 = !DILocation(line: 93, column: 18, scope: !265)
!267 = !DILocation(line: 93, column: 24, scope: !265)
!268 = !DILocation(line: 93, column: 22, scope: !265)
!269 = !DILocation(line: 93, column: 13, scope: !193)
!270 = !DILocation(line: 94, column: 13, scope: !265)
!271 = !DILocalVariable(name: "plen", scope: !193, file: !24, line: 95, type: !28)
!272 = !DILocation(line: 95, column: 15, scope: !193)
!273 = !DILocation(line: 95, column: 22, scope: !193)
!274 = !DILocation(line: 96, column: 14, scope: !193)
!275 = !DILocalVariable(name: "plenbytes", scope: !193, file: !24, line: 98, type: !28)
!276 = !DILocation(line: 98, column: 15, scope: !193)
!277 = !DILocation(line: 98, column: 28, scope: !193)
!278 = !DILocation(line: 98, column: 33, scope: !193)
!279 = !DILocation(line: 98, column: 38, scope: !193)
!280 = !DILocation(line: 101, column: 13, scope: !281)
!281 = distinct !DILexicalBlock(scope: !193, file: !24, line: 101, column: 13)
!282 = !DILocation(line: 101, column: 18, scope: !281)
!283 = !DILocation(line: 101, column: 24, scope: !281)
!284 = !DILocation(line: 101, column: 22, scope: !281)
!285 = !DILocation(line: 101, column: 13, scope: !193)
!286 = !DILocation(line: 102, column: 13, scope: !281)
!287 = !DILocation(line: 108, column: 13, scope: !288)
!288 = distinct !DILexicalBlock(scope: !193, file: !24, line: 108, column: 13)
!289 = !DILocation(line: 108, column: 18, scope: !288)
!290 = !DILocation(line: 108, column: 24, scope: !288)
!291 = !DILocation(line: 108, column: 22, scope: !288)
!292 = !DILocation(line: 108, column: 13, scope: !193)
!293 = !DILocation(line: 109, column: 13, scope: !288)
!294 = !DILocation(line: 110, column: 13, scope: !295)
!295 = distinct !DILexicalBlock(scope: !193, file: !24, line: 110, column: 13)
!296 = !DILocation(line: 110, column: 33, scope: !295)
!297 = !DILocation(line: 110, column: 39, scope: !295)
!298 = !DILocation(line: 110, column: 44, scope: !295)
!299 = !DILocation(line: 110, column: 36, scope: !295)
!300 = !DILocation(line: 110, column: 25, scope: !295)
!301 = !DILocation(line: 110, column: 23, scope: !295)
!302 = !DILocation(line: 110, column: 13, scope: !193)
!303 = !DILocation(line: 111, column: 13, scope: !295)
!304 = !DILocation(line: 115, column: 9, scope: !193)
!305 = !DILocation(line: 118, column: 5, scope: !23)
!306 = !DILocation(line: 119, column: 1, scope: !23)
