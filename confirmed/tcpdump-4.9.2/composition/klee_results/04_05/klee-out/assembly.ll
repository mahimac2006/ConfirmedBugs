; ModuleID = '/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/klee_results/04_05/linked.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"len\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"0 && \22BOTH_REACHABLE_04_05\22\00", align 1
@.str.3 = private unnamed_addr constant [78 x i8] c"/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/driver_04_05.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [15 x i8] c"int main(void)\00", align 1
@predicate_04.marker = internal constant [16 x i8] c"\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF", align 16, !dbg !0
@.str.5 = private unnamed_addr constant [4 x i8] c"MSG\00", align 1
@.str.1.6 = private unnamed_addr constant [5 x i8] c"RPY \00", align 1
@.str.2.7 = private unnamed_addr constant [5 x i8] c"ERR \00", align 1
@.str.3.8 = private unnamed_addr constant [5 x i8] c"ANS \00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"NUL \00", align 1
@.str.5.9 = private unnamed_addr constant [5 x i8] c"SEQ \00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"END\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !32 {
  %1 = alloca i32, align 4
  %2 = alloca [64 x i8], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [64 x i8]* %2, metadata !36, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i32* %3, metadata !41, metadata !DIExpression()), !dbg !42
  %6 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !43
  call void @klee_make_symbolic(i8* %6, i64 64, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !44
  %7 = bitcast i32* %3 to i8*, !dbg !45
  call void @klee_make_symbolic(i8* %7, i64 4, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)), !dbg !46
  %8 = load i32, i32* %3, align 4, !dbg !47
  %9 = icmp uge i32 %8, 1, !dbg !48
  %10 = load i32, i32* %3, align 4, !dbg !49
  %11 = icmp ule i32 %10, 64, !dbg !49
  %12 = select i1 %9, i1 %11, i1 false, !dbg !49
  %13 = zext i1 %12 to i32, !dbg !49
  %14 = sext i32 %13 to i64, !dbg !47
  call void @klee_assume(i64 %14), !dbg !50
  call void @llvm.dbg.declare(metadata i32* %4, metadata !51, metadata !DIExpression()), !dbg !52
  %15 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !53
  %16 = load i32, i32* %3, align 4, !dbg !54
  %17 = call i32 @predicate_04(i8* %15, i32 %16), !dbg !55
  store i32 %17, i32* %4, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata i32* %5, metadata !56, metadata !DIExpression()), !dbg !57
  %18 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !58
  %19 = load i32, i32* %3, align 4, !dbg !59
  %20 = call i32 @predicate_05(i8* %18, i32 %19), !dbg !60
  store i32 %20, i32* %5, align 4, !dbg !57
  %21 = load i32, i32* %4, align 4, !dbg !61
  %22 = icmp eq i32 %21, 1, !dbg !63
  %23 = load i32, i32* %5, align 4
  %24 = icmp eq i32 %23, 1
  %or.cond = select i1 %22, i1 %24, i1 false, !dbg !64
  br i1 %or.cond, label %25, label %26, !dbg !64

25:                                               ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.3, i64 0, i64 0), i32 42, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #4, !dbg !65
  unreachable, !dbg !65

26:                                               ; preds = %0
  ret i32 0, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

declare dso_local void @klee_assume(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @predicate_04(i8* %0, i32 %1) #0 !dbg !2 {
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
  call void @llvm.dbg.declare(metadata i8** %4, metadata !67, metadata !DIExpression()), !dbg !68
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata i8** %6, metadata !71, metadata !DIExpression()), !dbg !73
  %17 = load i8*, i8** %4, align 8, !dbg !74
  store i8* %17, i8** %6, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata i8** %7, metadata !75, metadata !DIExpression()), !dbg !76
  %18 = load i8*, i8** %4, align 8, !dbg !77
  %19 = load i32, i32* %5, align 4, !dbg !78
  %20 = zext i32 %19 to i64, !dbg !79
  %21 = getelementptr inbounds i8, i8* %18, i64 %20, !dbg !79
  store i8* %21, i8** %7, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata i32* %8, metadata !80, metadata !DIExpression()), !dbg !81
  store i32 1, i32* %8, align 4, !dbg !81
  call void @llvm.dbg.declare(metadata i32* %9, metadata !82, metadata !DIExpression()), !dbg !84
  store i32 16, i32* %9, align 4, !dbg !84
  %22 = load i32, i32* %8, align 4, !dbg !85
  %23 = icmp slt i32 %22, 1, !dbg !87
  br i1 %23, label %24, label %25, !dbg !88

24:                                               ; preds = %2
  store i32 0, i32* %3, align 4, !dbg !89
  br label %134, !dbg !89

25:                                               ; preds = %2
  call void @llvm.dbg.declare(metadata i8** %10, metadata !90, metadata !DIExpression()), !dbg !91
  %26 = load i8*, i8** %6, align 8, !dbg !92
  store i8* %26, i8** %10, align 8, !dbg !91
  br label %27, !dbg !93

27:                                               ; preds = %70, %37, %25
  %28 = load i8*, i8** %10, align 8, !dbg !94
  %29 = load i8*, i8** %7, align 8, !dbg !95
  %30 = icmp ult i8* %28, %29, !dbg !96
  br i1 %30, label %31, label %133, !dbg !93

31:                                               ; preds = %27
  %32 = load i8*, i8** %10, align 8, !dbg !97
  %33 = getelementptr inbounds i8, i8* %32, i64 0, !dbg !97
  %34 = load i8, i8* %33, align 1, !dbg !97
  %35 = zext i8 %34 to i32, !dbg !97
  %36 = icmp ne i32 %35, 255, !dbg !100
  br i1 %36, label %37, label %40, !dbg !101

37:                                               ; preds = %31
  %38 = load i8*, i8** %10, align 8, !dbg !102
  %39 = getelementptr inbounds i8, i8* %38, i32 1, !dbg !102
  store i8* %39, i8** %10, align 8, !dbg !102
  br label %27, !dbg !104, !llvm.loop !105

40:                                               ; preds = %31
  %41 = load i8*, i8** %10, align 8, !dbg !108
  %42 = getelementptr inbounds i8, i8* %41, i64 16, !dbg !110
  %43 = load i8*, i8** %7, align 8, !dbg !111
  %44 = icmp ugt i8* %42, %43, !dbg !112
  br i1 %44, label %45, label %46, !dbg !113

45:                                               ; preds = %40
  store i32 0, i32* %3, align 4, !dbg !114
  br label %134, !dbg !114

46:                                               ; preds = %40
  call void @llvm.dbg.declare(metadata i32* %11, metadata !115, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i32* %12, metadata !118, metadata !DIExpression()), !dbg !119
  store i32 0, i32* %12, align 4, !dbg !119
  store i32 0, i32* %11, align 4, !dbg !120
  br label %47, !dbg !122

47:                                               ; preds = %64, %46
  %48 = load i32, i32* %11, align 4, !dbg !123
  %49 = icmp ult i32 %48, 16, !dbg !125
  br i1 %49, label %50, label %67, !dbg !126

50:                                               ; preds = %47
  %51 = load i8*, i8** %10, align 8, !dbg !127
  %52 = load i32, i32* %11, align 4, !dbg !130
  %53 = zext i32 %52 to i64, !dbg !127
  %54 = getelementptr inbounds i8, i8* %51, i64 %53, !dbg !127
  %55 = load i8, i8* %54, align 1, !dbg !127
  %56 = zext i8 %55 to i32, !dbg !127
  %57 = load i32, i32* %11, align 4, !dbg !131
  %58 = zext i32 %57 to i64, !dbg !132
  %59 = getelementptr inbounds [16 x i8], [16 x i8]* @predicate_04.marker, i64 0, i64 %58, !dbg !132
  %60 = load i8, i8* %59, align 1, !dbg !132
  %61 = zext i8 %60 to i32, !dbg !132
  %62 = icmp ne i32 %56, %61, !dbg !133
  br i1 %62, label %63, label %64, !dbg !134

63:                                               ; preds = %50
  store i32 1, i32* %12, align 4, !dbg !135
  br label %67, !dbg !137

64:                                               ; preds = %50
  %65 = load i32, i32* %11, align 4, !dbg !138
  %66 = add i32 %65, 1, !dbg !138
  store i32 %66, i32* %11, align 4, !dbg !138
  br label %47, !dbg !139, !llvm.loop !140

67:                                               ; preds = %63, %47
  %68 = load i32, i32* %12, align 4, !dbg !142
  %69 = icmp ne i32 %68, 0, !dbg !142
  br i1 %69, label %70, label %73, !dbg !144

70:                                               ; preds = %67
  %71 = load i8*, i8** %10, align 8, !dbg !145
  %72 = getelementptr inbounds i8, i8* %71, i32 1, !dbg !145
  store i8* %72, i8** %10, align 8, !dbg !145
  br label %27, !dbg !147, !llvm.loop !105

73:                                               ; preds = %67
  %74 = load i8*, i8** %10, align 8, !dbg !148
  %75 = getelementptr inbounds i8, i8* %74, i64 19, !dbg !150
  %76 = load i8*, i8** %7, align 8, !dbg !151
  %77 = icmp ugt i8* %75, %76, !dbg !152
  br i1 %77, label %78, label %79, !dbg !153

78:                                               ; preds = %73
  store i32 0, i32* %3, align 4, !dbg !154
  br label %134, !dbg !154

79:                                               ; preds = %73
  call void @llvm.dbg.declare(metadata i32* %13, metadata !155, metadata !DIExpression()), !dbg !156
  %80 = load i8*, i8** %10, align 8, !dbg !157
  %81 = getelementptr inbounds i8, i8* %80, i64 16, !dbg !157
  %82 = load i8, i8* %81, align 1, !dbg !157
  %83 = zext i8 %82 to i32, !dbg !158
  %84 = shl i32 %83, 8, !dbg !159
  %85 = load i8*, i8** %10, align 8, !dbg !160
  %86 = getelementptr inbounds i8, i8* %85, i64 17, !dbg !160
  %87 = load i8, i8* %86, align 1, !dbg !160
  %88 = zext i8 %87 to i32, !dbg !161
  %89 = or i32 %84, %88, !dbg !162
  store i32 %89, i32* %13, align 4, !dbg !156
  %90 = load i32, i32* %13, align 4, !dbg !163
  %91 = icmp ult i32 %90, 19, !dbg !165
  br i1 %91, label %133, label %92, !dbg !166

92:                                               ; preds = %79
  call void @llvm.dbg.declare(metadata i8** %14, metadata !167, metadata !DIExpression()), !dbg !168
  %93 = load i8*, i8** %10, align 8, !dbg !169
  %94 = getelementptr inbounds i8, i8* %93, i64 19, !dbg !170
  store i8* %94, i8** %14, align 8, !dbg !168
  %95 = load i8*, i8** %14, align 8, !dbg !171
  %96 = getelementptr inbounds i8, i8* %95, i64 1, !dbg !173
  %97 = load i8*, i8** %7, align 8, !dbg !174
  %98 = icmp ugt i8* %96, %97, !dbg !175
  br i1 %98, label %99, label %100, !dbg !176

99:                                               ; preds = %92
  store i32 0, i32* %3, align 4, !dbg !177
  br label %134, !dbg !177

100:                                              ; preds = %92
  call void @llvm.dbg.declare(metadata i32* %15, metadata !178, metadata !DIExpression()), !dbg !179
  %101 = load i8*, i8** %14, align 8, !dbg !180
  %102 = getelementptr inbounds i8, i8* %101, i64 0, !dbg !180
  %103 = load i8, i8* %102, align 1, !dbg !180
  %104 = zext i8 %103 to i32, !dbg !180
  store i32 %104, i32* %15, align 4, !dbg !179
  %105 = load i32, i32* %15, align 4, !dbg !181
  %106 = sub i32 %105, 24, !dbg !181
  store i32 %106, i32* %15, align 4, !dbg !181
  call void @llvm.dbg.declare(metadata i32* %16, metadata !182, metadata !DIExpression()), !dbg !183
  %107 = load i32, i32* %15, align 4, !dbg !184
  %108 = add i32 %107, 7, !dbg !185
  %109 = udiv i32 %108, 8, !dbg !186
  store i32 %109, i32* %16, align 4, !dbg !183
  %110 = load i8*, i8** %14, align 8, !dbg !187
  %111 = getelementptr inbounds i8, i8* %110, i64 4, !dbg !189
  %112 = load i8*, i8** %7, align 8, !dbg !190
  %113 = icmp ugt i8* %111, %112, !dbg !191
  br i1 %113, label %114, label %115, !dbg !192

114:                                              ; preds = %100
  store i32 0, i32* %3, align 4, !dbg !193
  br label %134, !dbg !193

115:                                              ; preds = %100
  %116 = load i8*, i8** %14, align 8, !dbg !194
  %117 = getelementptr inbounds i8, i8* %116, i64 4, !dbg !196
  %118 = load i8*, i8** %7, align 8, !dbg !197
  %119 = icmp ugt i8* %117, %118, !dbg !198
  br i1 %119, label %120, label %121, !dbg !199

120:                                              ; preds = %115
  store i32 0, i32* %3, align 4, !dbg !200
  br label %134, !dbg !200

121:                                              ; preds = %115
  %122 = load i32, i32* %16, align 4, !dbg !201
  %123 = load i8*, i8** %7, align 8, !dbg !203
  %124 = load i8*, i8** %14, align 8, !dbg !204
  %125 = getelementptr inbounds i8, i8* %124, i64 4, !dbg !205
  %126 = ptrtoint i8* %123 to i64, !dbg !206
  %127 = ptrtoint i8* %125 to i64, !dbg !206
  %128 = sub i64 %126, %127, !dbg !206
  %129 = trunc i64 %128 to i32, !dbg !207
  %130 = icmp ugt i32 %122, %129, !dbg !208
  br i1 %130, label %131, label %132, !dbg !209

131:                                              ; preds = %121
  store i32 0, i32* %3, align 4, !dbg !210
  br label %134, !dbg !210

132:                                              ; preds = %121
  store i32 1, i32* %3, align 4, !dbg !211
  br label %134, !dbg !211

133:                                              ; preds = %79, %27
  store i32 0, i32* %3, align 4, !dbg !212
  br label %134, !dbg !212

134:                                              ; preds = %133, %132, %131, %120, %114, %99, %78, %45, %24
  %135 = load i32, i32* %3, align 4, !dbg !213
  ret i32 %135, !dbg !213
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @predicate_05(i8* %0, i32 %1) #0 !dbg !214 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !216, metadata !DIExpression()), !dbg !217
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !218, metadata !DIExpression()), !dbg !219
  call void @llvm.dbg.declare(metadata i8** %6, metadata !220, metadata !DIExpression()), !dbg !224
  %8 = load i8*, i8** %4, align 8, !dbg !225
  store i8* %8, i8** %6, align 8, !dbg !224
  call void @llvm.dbg.declare(metadata i8** %7, metadata !226, metadata !DIExpression()), !dbg !227
  %9 = load i8*, i8** %4, align 8, !dbg !228
  %10 = load i32, i32* %5, align 4, !dbg !229
  %11 = zext i32 %10 to i64, !dbg !230
  %12 = getelementptr inbounds i8, i8* %9, i64 %11, !dbg !230
  store i8* %12, i8** %7, align 8, !dbg !227
  %13 = load i8*, i8** %6, align 8, !dbg !231
  %14 = load i32, i32* %5, align 4, !dbg !233
  %15 = load i8*, i8** %7, align 8, !dbg !234
  %16 = call i32 @l_strnstart_reaches(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 4, i8* %13, i32 %14, i8* %15), !dbg !235
  %17 = icmp ne i32 %16, 0, !dbg !235
  br i1 %17, label %18, label %19, !dbg !236

18:                                               ; preds = %2
  store i32 1, i32* %3, align 4, !dbg !237
  br label %62, !dbg !237

19:                                               ; preds = %2
  %20 = load i8*, i8** %6, align 8, !dbg !238
  %21 = load i32, i32* %5, align 4, !dbg !240
  %22 = load i8*, i8** %7, align 8, !dbg !241
  %23 = call i32 @l_strnstart_reaches(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1.6, i64 0, i64 0), i32 4, i8* %20, i32 %21, i8* %22), !dbg !242
  %24 = icmp ne i32 %23, 0, !dbg !242
  br i1 %24, label %25, label %26, !dbg !243

25:                                               ; preds = %19
  store i32 1, i32* %3, align 4, !dbg !244
  br label %62, !dbg !244

26:                                               ; preds = %19
  %27 = load i8*, i8** %6, align 8, !dbg !245
  %28 = load i32, i32* %5, align 4, !dbg !247
  %29 = load i8*, i8** %7, align 8, !dbg !248
  %30 = call i32 @l_strnstart_reaches(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2.7, i64 0, i64 0), i32 4, i8* %27, i32 %28, i8* %29), !dbg !249
  %31 = icmp ne i32 %30, 0, !dbg !249
  br i1 %31, label %32, label %33, !dbg !250

32:                                               ; preds = %26
  store i32 1, i32* %3, align 4, !dbg !251
  br label %62, !dbg !251

33:                                               ; preds = %26
  %34 = load i8*, i8** %6, align 8, !dbg !252
  %35 = load i32, i32* %5, align 4, !dbg !254
  %36 = load i8*, i8** %7, align 8, !dbg !255
  %37 = call i32 @l_strnstart_reaches(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3.8, i64 0, i64 0), i32 4, i8* %34, i32 %35, i8* %36), !dbg !256
  %38 = icmp ne i32 %37, 0, !dbg !256
  br i1 %38, label %39, label %40, !dbg !257

39:                                               ; preds = %33
  store i32 1, i32* %3, align 4, !dbg !258
  br label %62, !dbg !258

40:                                               ; preds = %33
  %41 = load i8*, i8** %6, align 8, !dbg !259
  %42 = load i32, i32* %5, align 4, !dbg !261
  %43 = load i8*, i8** %7, align 8, !dbg !262
  %44 = call i32 @l_strnstart_reaches(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i64 0, i64 0), i32 4, i8* %41, i32 %42, i8* %43), !dbg !263
  %45 = icmp ne i32 %44, 0, !dbg !263
  br i1 %45, label %46, label %47, !dbg !264

46:                                               ; preds = %40
  store i32 1, i32* %3, align 4, !dbg !265
  br label %62, !dbg !265

47:                                               ; preds = %40
  %48 = load i8*, i8** %6, align 8, !dbg !266
  %49 = load i32, i32* %5, align 4, !dbg !268
  %50 = load i8*, i8** %7, align 8, !dbg !269
  %51 = call i32 @l_strnstart_reaches(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5.9, i64 0, i64 0), i32 4, i8* %48, i32 %49, i8* %50), !dbg !270
  %52 = icmp ne i32 %51, 0, !dbg !270
  br i1 %52, label %53, label %54, !dbg !271

53:                                               ; preds = %47
  store i32 1, i32* %3, align 4, !dbg !272
  br label %62, !dbg !272

54:                                               ; preds = %47
  %55 = load i8*, i8** %6, align 8, !dbg !273
  %56 = load i32, i32* %5, align 4, !dbg !275
  %57 = load i8*, i8** %7, align 8, !dbg !276
  %58 = call i32 @l_strnstart_reaches(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i64 0, i64 0), i32 4, i8* %55, i32 %56, i8* %57), !dbg !277
  %59 = icmp ne i32 %58, 0, !dbg !277
  br i1 %59, label %60, label %61, !dbg !278

60:                                               ; preds = %54
  store i32 1, i32* %3, align 4, !dbg !279
  br label %62, !dbg !279

61:                                               ; preds = %54
  store i32 0, i32* %3, align 4, !dbg !280
  br label %62, !dbg !280

62:                                               ; preds = %61, %60, %53, %46, %39, %32, %25, %18
  %63 = load i32, i32* %3, align 4, !dbg !281
  ret i32 %63, !dbg !281
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @l_strnstart_reaches(i8* %0, i32 %1, i8* %2, i32 %3, i8* %4) #0 !dbg !282 {
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  store i8* %0, i8** %7, align 8
  call void @llvm.dbg.declare(metadata i8** %7, metadata !289, metadata !DIExpression()), !dbg !290
  store i32 %1, i32* %8, align 4
  call void @llvm.dbg.declare(metadata i32* %8, metadata !291, metadata !DIExpression()), !dbg !292
  store i8* %2, i8** %9, align 8
  call void @llvm.dbg.declare(metadata i8** %9, metadata !293, metadata !DIExpression()), !dbg !294
  store i32 %3, i32* %10, align 4
  call void @llvm.dbg.declare(metadata i32* %10, metadata !295, metadata !DIExpression()), !dbg !296
  store i8* %4, i8** %11, align 8
  call void @llvm.dbg.declare(metadata i8** %11, metadata !297, metadata !DIExpression()), !dbg !298
  %12 = load i8*, i8** %9, align 8, !dbg !299
  %13 = load i32, i32* %8, align 4, !dbg !301
  %14 = zext i32 %13 to i64, !dbg !302
  %15 = getelementptr inbounds i8, i8* %12, i64 %14, !dbg !302
  %16 = load i8*, i8** %11, align 8, !dbg !303
  %17 = icmp ugt i8* %15, %16, !dbg !304
  br i1 %17, label %18, label %19, !dbg !305

18:                                               ; preds = %5
  store i32 0, i32* %6, align 4, !dbg !306
  br label %26, !dbg !306

19:                                               ; preds = %5
  %20 = load i32, i32* %8, align 4, !dbg !307
  %21 = load i32, i32* %10, align 4, !dbg !309
  %22 = icmp ugt i32 %20, %21, !dbg !310
  br i1 %22, label %23, label %24, !dbg !311

23:                                               ; preds = %19
  store i32 0, i32* %6, align 4, !dbg !312
  br label %26, !dbg !312

24:                                               ; preds = %19
  %25 = load i8*, i8** %7, align 8, !dbg !313
  store i32 1, i32* %6, align 4, !dbg !314
  br label %26, !dbg !314

26:                                               ; preds = %24, %23, %18
  %27 = load i32, i32* %6, align 4, !dbg !315
  ret i32 %27, !dbg !315
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind }

!llvm.dbg.cu = !{!22, !11, !24}
!llvm.ident = !{!26, !26, !26}
!llvm.module.flags = !{!27, !28, !29, !30, !31}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "marker", scope: !2, file: !3, line: 40, type: !17, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "predicate_04", scope: !3, file: !3, line: 31, type: !4, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !11, retainedNodes: !13)
!3 = !DIFile(filename: "predicate_04.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !7, !10}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!9 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = distinct !DICompileUnit(language: DW_LANG_C99, file: !12, producer: "clang version 13.0.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !13, retainedTypes: !14, globals: !16, splitDebugInlining: false, nameTableKind: None)
!12 = !DIFile(filename: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/predicate_04.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!13 = !{}
!14 = !{!15}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !3, line: 25, baseType: !10)
!16 = !{!0}
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 128, elements: !20)
!18 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !19)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !3, line: 24, baseType: !9)
!20 = !{!21}
!21 = !DISubrange(count: 16)
!22 = distinct !DICompileUnit(language: DW_LANG_C99, file: !23, producer: "clang version 13.0.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !13, splitDebugInlining: false, nameTableKind: None)
!23 = !DIFile(filename: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/driver_04_05.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!24 = distinct !DICompileUnit(language: DW_LANG_C99, file: !25, producer: "clang version 13.0.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !13, splitDebugInlining: false, nameTableKind: None)
!25 = !DIFile(filename: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/predicate_05.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!26 = !{!"clang version 13.0.1"}
!27 = !{i32 7, !"Dwarf Version", i32 4}
!28 = !{i32 2, !"Debug Info Version", i32 3}
!29 = !{i32 1, !"wchar_size", i32 4}
!30 = !{i32 7, !"uwtable", i32 1}
!31 = !{i32 7, !"frame-pointer", i32 2}
!32 = distinct !DISubprogram(name: "main", scope: !33, file: !33, line: 28, type: !34, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !22, retainedNodes: !13)
!33 = !DIFile(filename: "driver_04_05.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!34 = !DISubroutineType(types: !35)
!35 = !{!6}
!36 = !DILocalVariable(name: "buf", scope: !32, file: !33, line: 29, type: !37)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 512, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 64)
!40 = !DILocation(line: 29, column: 19, scope: !32)
!41 = !DILocalVariable(name: "len", scope: !32, file: !33, line: 30, type: !10)
!42 = !DILocation(line: 30, column: 18, scope: !32)
!43 = !DILocation(line: 33, column: 24, scope: !32)
!44 = !DILocation(line: 33, column: 5, scope: !32)
!45 = !DILocation(line: 34, column: 24, scope: !32)
!46 = !DILocation(line: 34, column: 5, scope: !32)
!47 = !DILocation(line: 35, column: 17, scope: !32)
!48 = !DILocation(line: 35, column: 21, scope: !32)
!49 = !DILocation(line: 35, column: 26, scope: !32)
!50 = !DILocation(line: 35, column: 5, scope: !32)
!51 = !DILocalVariable(name: "r04", scope: !32, file: !33, line: 38, type: !6)
!52 = !DILocation(line: 38, column: 9, scope: !32)
!53 = !DILocation(line: 38, column: 28, scope: !32)
!54 = !DILocation(line: 38, column: 33, scope: !32)
!55 = !DILocation(line: 38, column: 15, scope: !32)
!56 = !DILocalVariable(name: "r05", scope: !32, file: !33, line: 39, type: !6)
!57 = !DILocation(line: 39, column: 9, scope: !32)
!58 = !DILocation(line: 39, column: 28, scope: !32)
!59 = !DILocation(line: 39, column: 33, scope: !32)
!60 = !DILocation(line: 39, column: 15, scope: !32)
!61 = !DILocation(line: 41, column: 9, scope: !62)
!62 = distinct !DILexicalBlock(scope: !32, file: !33, line: 41, column: 9)
!63 = !DILocation(line: 41, column: 13, scope: !62)
!64 = !DILocation(line: 41, column: 18, scope: !62)
!65 = !DILocation(line: 42, column: 9, scope: !62)
!66 = !DILocation(line: 44, column: 5, scope: !32)
!67 = !DILocalVariable(name: "buf", arg: 1, scope: !2, file: !3, line: 31, type: !7)
!68 = !DILocation(line: 31, column: 39, scope: !2)
!69 = !DILocalVariable(name: "len", arg: 2, scope: !2, file: !3, line: 31, type: !10)
!70 = !DILocation(line: 31, column: 57, scope: !2)
!71 = !DILocalVariable(name: "dat", scope: !2, file: !3, line: 33, type: !72)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!73 = !DILocation(line: 33, column: 19, scope: !2)
!74 = !DILocation(line: 33, column: 25, scope: !2)
!75 = !DILocalVariable(name: "ep", scope: !2, file: !3, line: 34, type: !72)
!76 = !DILocation(line: 34, column: 19, scope: !2)
!77 = !DILocation(line: 34, column: 25, scope: !2)
!78 = !DILocation(line: 34, column: 31, scope: !2)
!79 = !DILocation(line: 34, column: 29, scope: !2)
!80 = !DILocalVariable(name: "ndo_vflag", scope: !2, file: !3, line: 37, type: !6)
!81 = !DILocation(line: 37, column: 9, scope: !2)
!82 = !DILocalVariable(name: "marker_len", scope: !2, file: !3, line: 44, type: !83)
!83 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!84 = !DILocation(line: 44, column: 17, scope: !2)
!85 = !DILocation(line: 47, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !2, file: !3, line: 47, column: 9)
!87 = !DILocation(line: 47, column: 19, scope: !86)
!88 = !DILocation(line: 47, column: 9, scope: !2)
!89 = !DILocation(line: 48, column: 9, scope: !86)
!90 = !DILocalVariable(name: "p", scope: !2, file: !3, line: 50, type: !72)
!91 = !DILocation(line: 50, column: 19, scope: !2)
!92 = !DILocation(line: 50, column: 23, scope: !2)
!93 = !DILocation(line: 52, column: 5, scope: !2)
!94 = !DILocation(line: 52, column: 12, scope: !2)
!95 = !DILocation(line: 52, column: 16, scope: !2)
!96 = !DILocation(line: 52, column: 14, scope: !2)
!97 = !DILocation(line: 54, column: 13, scope: !98)
!98 = distinct !DILexicalBlock(scope: !99, file: !3, line: 54, column: 13)
!99 = distinct !DILexicalBlock(scope: !2, file: !3, line: 52, column: 20)
!100 = !DILocation(line: 54, column: 18, scope: !98)
!101 = !DILocation(line: 54, column: 13, scope: !99)
!102 = !DILocation(line: 55, column: 14, scope: !103)
!103 = distinct !DILexicalBlock(scope: !98, file: !3, line: 54, column: 27)
!104 = !DILocation(line: 56, column: 13, scope: !103)
!105 = distinct !{!105, !93, !106, !107}
!106 = !DILocation(line: 116, column: 5, scope: !2)
!107 = !{!"llvm.loop.mustprogress"}
!108 = !DILocation(line: 61, column: 13, scope: !109)
!109 = distinct !DILexicalBlock(scope: !99, file: !3, line: 61, column: 13)
!110 = !DILocation(line: 61, column: 15, scope: !109)
!111 = !DILocation(line: 61, column: 30, scope: !109)
!112 = !DILocation(line: 61, column: 28, scope: !109)
!113 = !DILocation(line: 61, column: 13, scope: !99)
!114 = !DILocation(line: 62, column: 13, scope: !109)
!115 = !DILocalVariable(name: "i", scope: !116, file: !3, line: 66, type: !15)
!116 = distinct !DILexicalBlock(scope: !99, file: !3, line: 65, column: 9)
!117 = !DILocation(line: 66, column: 19, scope: !116)
!118 = !DILocalVariable(name: "mismatch", scope: !116, file: !3, line: 67, type: !6)
!119 = !DILocation(line: 67, column: 17, scope: !116)
!120 = !DILocation(line: 68, column: 20, scope: !121)
!121 = distinct !DILexicalBlock(scope: !116, file: !3, line: 68, column: 13)
!122 = !DILocation(line: 68, column: 18, scope: !121)
!123 = !DILocation(line: 68, column: 25, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !3, line: 68, column: 13)
!125 = !DILocation(line: 68, column: 27, scope: !124)
!126 = !DILocation(line: 68, column: 13, scope: !121)
!127 = !DILocation(line: 69, column: 21, scope: !128)
!128 = distinct !DILexicalBlock(scope: !129, file: !3, line: 69, column: 21)
!129 = distinct !DILexicalBlock(scope: !124, file: !3, line: 68, column: 46)
!130 = !DILocation(line: 69, column: 23, scope: !128)
!131 = !DILocation(line: 69, column: 36, scope: !128)
!132 = !DILocation(line: 69, column: 29, scope: !128)
!133 = !DILocation(line: 69, column: 26, scope: !128)
!134 = !DILocation(line: 69, column: 21, scope: !129)
!135 = !DILocation(line: 69, column: 51, scope: !136)
!136 = distinct !DILexicalBlock(scope: !128, file: !3, line: 69, column: 40)
!137 = !DILocation(line: 69, column: 56, scope: !136)
!138 = !DILocation(line: 68, column: 42, scope: !124)
!139 = !DILocation(line: 68, column: 13, scope: !124)
!140 = distinct !{!140, !126, !141, !107}
!141 = !DILocation(line: 70, column: 13, scope: !121)
!142 = !DILocation(line: 71, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !116, file: !3, line: 71, column: 17)
!144 = !DILocation(line: 71, column: 17, scope: !116)
!145 = !DILocation(line: 72, column: 18, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !3, line: 71, column: 27)
!147 = !DILocation(line: 73, column: 17, scope: !146)
!148 = !DILocation(line: 79, column: 13, scope: !149)
!149 = distinct !DILexicalBlock(scope: !99, file: !3, line: 79, column: 13)
!150 = !DILocation(line: 79, column: 15, scope: !149)
!151 = !DILocation(line: 79, column: 28, scope: !149)
!152 = !DILocation(line: 79, column: 26, scope: !149)
!153 = !DILocation(line: 79, column: 13, scope: !99)
!154 = !DILocation(line: 80, column: 13, scope: !149)
!155 = !DILocalVariable(name: "hlen", scope: !99, file: !3, line: 83, type: !15)
!156 = !DILocation(line: 83, column: 15, scope: !99)
!157 = !DILocation(line: 83, column: 30, scope: !99)
!158 = !DILocation(line: 83, column: 23, scope: !99)
!159 = !DILocation(line: 83, column: 36, scope: !99)
!160 = !DILocation(line: 83, column: 51, scope: !99)
!161 = !DILocation(line: 83, column: 44, scope: !99)
!162 = !DILocation(line: 83, column: 42, scope: !99)
!163 = !DILocation(line: 84, column: 13, scope: !164)
!164 = distinct !DILexicalBlock(scope: !99, file: !3, line: 84, column: 13)
!165 = !DILocation(line: 84, column: 18, scope: !164)
!166 = !DILocation(line: 84, column: 13, scope: !99)
!167 = !DILocalVariable(name: "pptr", scope: !99, file: !3, line: 90, type: !72)
!168 = !DILocation(line: 90, column: 23, scope: !99)
!169 = !DILocation(line: 90, column: 30, scope: !99)
!170 = !DILocation(line: 90, column: 32, scope: !99)
!171 = !DILocation(line: 93, column: 13, scope: !172)
!172 = distinct !DILexicalBlock(scope: !99, file: !3, line: 93, column: 13)
!173 = !DILocation(line: 93, column: 18, scope: !172)
!174 = !DILocation(line: 93, column: 24, scope: !172)
!175 = !DILocation(line: 93, column: 22, scope: !172)
!176 = !DILocation(line: 93, column: 13, scope: !99)
!177 = !DILocation(line: 94, column: 13, scope: !172)
!178 = !DILocalVariable(name: "plen", scope: !99, file: !3, line: 95, type: !15)
!179 = !DILocation(line: 95, column: 15, scope: !99)
!180 = !DILocation(line: 95, column: 22, scope: !99)
!181 = !DILocation(line: 96, column: 14, scope: !99)
!182 = !DILocalVariable(name: "plenbytes", scope: !99, file: !3, line: 98, type: !15)
!183 = !DILocation(line: 98, column: 15, scope: !99)
!184 = !DILocation(line: 98, column: 28, scope: !99)
!185 = !DILocation(line: 98, column: 33, scope: !99)
!186 = !DILocation(line: 98, column: 38, scope: !99)
!187 = !DILocation(line: 101, column: 13, scope: !188)
!188 = distinct !DILexicalBlock(scope: !99, file: !3, line: 101, column: 13)
!189 = !DILocation(line: 101, column: 18, scope: !188)
!190 = !DILocation(line: 101, column: 24, scope: !188)
!191 = !DILocation(line: 101, column: 22, scope: !188)
!192 = !DILocation(line: 101, column: 13, scope: !99)
!193 = !DILocation(line: 102, column: 13, scope: !188)
!194 = !DILocation(line: 108, column: 13, scope: !195)
!195 = distinct !DILexicalBlock(scope: !99, file: !3, line: 108, column: 13)
!196 = !DILocation(line: 108, column: 18, scope: !195)
!197 = !DILocation(line: 108, column: 24, scope: !195)
!198 = !DILocation(line: 108, column: 22, scope: !195)
!199 = !DILocation(line: 108, column: 13, scope: !99)
!200 = !DILocation(line: 109, column: 13, scope: !195)
!201 = !DILocation(line: 110, column: 13, scope: !202)
!202 = distinct !DILexicalBlock(scope: !99, file: !3, line: 110, column: 13)
!203 = !DILocation(line: 110, column: 33, scope: !202)
!204 = !DILocation(line: 110, column: 39, scope: !202)
!205 = !DILocation(line: 110, column: 44, scope: !202)
!206 = !DILocation(line: 110, column: 36, scope: !202)
!207 = !DILocation(line: 110, column: 25, scope: !202)
!208 = !DILocation(line: 110, column: 23, scope: !202)
!209 = !DILocation(line: 110, column: 13, scope: !99)
!210 = !DILocation(line: 111, column: 13, scope: !202)
!211 = !DILocation(line: 115, column: 9, scope: !99)
!212 = !DILocation(line: 118, column: 5, scope: !2)
!213 = !DILocation(line: 119, column: 1, scope: !2)
!214 = distinct !DISubprogram(name: "predicate_05", scope: !215, file: !215, line: 46, type: !4, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !24, retainedNodes: !13)
!215 = !DIFile(filename: "predicate_05.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!216 = !DILocalVariable(name: "buf", arg: 1, scope: !214, file: !215, line: 46, type: !7)
!217 = !DILocation(line: 46, column: 39, scope: !214)
!218 = !DILocalVariable(name: "len", arg: 2, scope: !214, file: !215, line: 46, type: !10)
!219 = !DILocation(line: 46, column: 57, scope: !214)
!220 = !DILocalVariable(name: "bp", scope: !214, file: !215, line: 48, type: !221)
!221 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !222, size: 64)
!222 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !223)
!223 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !215, line: 18, baseType: !9)
!224 = !DILocation(line: 48, column: 19, scope: !214)
!225 = !DILocation(line: 48, column: 24, scope: !214)
!226 = !DILocalVariable(name: "ep", scope: !214, file: !215, line: 49, type: !221)
!227 = !DILocation(line: 49, column: 19, scope: !214)
!228 = !DILocation(line: 49, column: 24, scope: !214)
!229 = !DILocation(line: 49, column: 30, scope: !214)
!230 = !DILocation(line: 49, column: 28, scope: !214)
!231 = !DILocation(line: 55, column: 40, scope: !232)
!232 = distinct !DILexicalBlock(scope: !214, file: !215, line: 55, column: 9)
!233 = !DILocation(line: 55, column: 44, scope: !232)
!234 = !DILocation(line: 55, column: 49, scope: !232)
!235 = !DILocation(line: 55, column: 9, scope: !232)
!236 = !DILocation(line: 55, column: 9, scope: !214)
!237 = !DILocation(line: 55, column: 54, scope: !232)
!238 = !DILocation(line: 56, column: 40, scope: !239)
!239 = distinct !DILexicalBlock(scope: !214, file: !215, line: 56, column: 9)
!240 = !DILocation(line: 56, column: 44, scope: !239)
!241 = !DILocation(line: 56, column: 49, scope: !239)
!242 = !DILocation(line: 56, column: 9, scope: !239)
!243 = !DILocation(line: 56, column: 9, scope: !214)
!244 = !DILocation(line: 56, column: 54, scope: !239)
!245 = !DILocation(line: 57, column: 40, scope: !246)
!246 = distinct !DILexicalBlock(scope: !214, file: !215, line: 57, column: 9)
!247 = !DILocation(line: 57, column: 44, scope: !246)
!248 = !DILocation(line: 57, column: 49, scope: !246)
!249 = !DILocation(line: 57, column: 9, scope: !246)
!250 = !DILocation(line: 57, column: 9, scope: !214)
!251 = !DILocation(line: 57, column: 54, scope: !246)
!252 = !DILocation(line: 58, column: 40, scope: !253)
!253 = distinct !DILexicalBlock(scope: !214, file: !215, line: 58, column: 9)
!254 = !DILocation(line: 58, column: 44, scope: !253)
!255 = !DILocation(line: 58, column: 49, scope: !253)
!256 = !DILocation(line: 58, column: 9, scope: !253)
!257 = !DILocation(line: 58, column: 9, scope: !214)
!258 = !DILocation(line: 58, column: 54, scope: !253)
!259 = !DILocation(line: 59, column: 40, scope: !260)
!260 = distinct !DILexicalBlock(scope: !214, file: !215, line: 59, column: 9)
!261 = !DILocation(line: 59, column: 44, scope: !260)
!262 = !DILocation(line: 59, column: 49, scope: !260)
!263 = !DILocation(line: 59, column: 9, scope: !260)
!264 = !DILocation(line: 59, column: 9, scope: !214)
!265 = !DILocation(line: 59, column: 54, scope: !260)
!266 = !DILocation(line: 60, column: 40, scope: !267)
!267 = distinct !DILexicalBlock(scope: !214, file: !215, line: 60, column: 9)
!268 = !DILocation(line: 60, column: 44, scope: !267)
!269 = !DILocation(line: 60, column: 49, scope: !267)
!270 = !DILocation(line: 60, column: 9, scope: !267)
!271 = !DILocation(line: 60, column: 9, scope: !214)
!272 = !DILocation(line: 60, column: 54, scope: !267)
!273 = !DILocation(line: 61, column: 40, scope: !274)
!274 = distinct !DILexicalBlock(scope: !214, file: !215, line: 61, column: 9)
!275 = !DILocation(line: 61, column: 44, scope: !274)
!276 = !DILocation(line: 61, column: 49, scope: !274)
!277 = !DILocation(line: 61, column: 9, scope: !274)
!278 = !DILocation(line: 61, column: 9, scope: !214)
!279 = !DILocation(line: 61, column: 54, scope: !274)
!280 = !DILocation(line: 63, column: 5, scope: !214)
!281 = !DILocation(line: 64, column: 1, scope: !214)
!282 = distinct !DISubprogram(name: "l_strnstart_reaches", scope: !215, file: !215, line: 26, type: !283, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !24, retainedNodes: !13)
!283 = !DISubroutineType(types: !284)
!284 = !{!6, !285, !288, !221, !288, !221}
!285 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !286, size: 64)
!286 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !287)
!287 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!288 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !215, line: 19, baseType: !10)
!289 = !DILocalVariable(name: "tstr1", arg: 1, scope: !282, file: !215, line: 26, type: !285)
!290 = !DILocation(line: 26, column: 44, scope: !282)
!291 = !DILocalVariable(name: "tl1", arg: 2, scope: !282, file: !215, line: 26, type: !288)
!292 = !DILocation(line: 26, column: 57, scope: !282)
!293 = !DILocalVariable(name: "str2", arg: 3, scope: !282, file: !215, line: 27, type: !221)
!294 = !DILocation(line: 27, column: 46, scope: !282)
!295 = !DILocalVariable(name: "l2", arg: 4, scope: !282, file: !215, line: 27, type: !288)
!296 = !DILocation(line: 27, column: 58, scope: !282)
!297 = !DILocalVariable(name: "ep", arg: 5, scope: !282, file: !215, line: 28, type: !221)
!298 = !DILocation(line: 28, column: 46, scope: !282)
!299 = !DILocation(line: 34, column: 9, scope: !300)
!300 = distinct !DILexicalBlock(scope: !282, file: !215, line: 34, column: 9)
!301 = !DILocation(line: 34, column: 16, scope: !300)
!302 = !DILocation(line: 34, column: 14, scope: !300)
!303 = !DILocation(line: 34, column: 22, scope: !300)
!304 = !DILocation(line: 34, column: 20, scope: !300)
!305 = !DILocation(line: 34, column: 9, scope: !282)
!306 = !DILocation(line: 35, column: 9, scope: !300)
!307 = !DILocation(line: 38, column: 9, scope: !308)
!308 = distinct !DILexicalBlock(scope: !282, file: !215, line: 38, column: 9)
!309 = !DILocation(line: 38, column: 15, scope: !308)
!310 = !DILocation(line: 38, column: 13, scope: !308)
!311 = !DILocation(line: 38, column: 9, scope: !282)
!312 = !DILocation(line: 39, column: 9, scope: !308)
!313 = !DILocation(line: 42, column: 11, scope: !282)
!314 = !DILocation(line: 43, column: 5, scope: !282)
!315 = !DILocation(line: 44, column: 1, scope: !282)
