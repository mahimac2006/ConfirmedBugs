; ModuleID = '/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/klee_results/04_08/linked.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"len\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"0 && \22BOTH_REACHABLE_04_08\22\00", align 1
@.str.3 = private unnamed_addr constant [78 x i8] c"/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/driver_04_08.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [15 x i8] c"int main(void)\00", align 1
@predicate_04.marker = internal constant [16 x i8] c"\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF", align 16, !dbg !0
@v4prefix = internal constant [16 x i8] c"\00\00\00\00\00\00\00\00\00\00\FF\FF\00\00\00\00", align 16, !dbg !22

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !37 {
  %1 = alloca i32, align 4
  %2 = alloca [64 x i8], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [64 x i8]* %2, metadata !41, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i32* %3, metadata !46, metadata !DIExpression()), !dbg !47
  %6 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !48
  call void @klee_make_symbolic(i8* %6, i64 64, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !49
  %7 = bitcast i32* %3 to i8*, !dbg !50
  call void @klee_make_symbolic(i8* %7, i64 4, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)), !dbg !51
  %8 = load i32, i32* %3, align 4, !dbg !52
  %9 = icmp uge i32 %8, 1, !dbg !53
  %10 = load i32, i32* %3, align 4, !dbg !54
  %11 = icmp ule i32 %10, 64, !dbg !54
  %12 = select i1 %9, i1 %11, i1 false, !dbg !54
  %13 = zext i1 %12 to i32, !dbg !54
  %14 = sext i32 %13 to i64, !dbg !52
  call void @klee_assume(i64 %14), !dbg !55
  call void @llvm.dbg.declare(metadata i32* %4, metadata !56, metadata !DIExpression()), !dbg !57
  %15 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !58
  %16 = load i32, i32* %3, align 4, !dbg !59
  %17 = call i32 @predicate_04(i8* %15, i32 %16), !dbg !60
  store i32 %17, i32* %4, align 4, !dbg !57
  call void @llvm.dbg.declare(metadata i32* %5, metadata !61, metadata !DIExpression()), !dbg !62
  %18 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !63
  %19 = load i32, i32* %3, align 4, !dbg !64
  %20 = call i32 @predicate_08(i8* %18, i32 %19), !dbg !65
  store i32 %20, i32* %5, align 4, !dbg !62
  %21 = load i32, i32* %4, align 4, !dbg !66
  %22 = icmp eq i32 %21, 1, !dbg !68
  %23 = load i32, i32* %5, align 4
  %24 = icmp eq i32 %23, 1
  %or.cond = select i1 %22, i1 %24, i1 false, !dbg !69
  br i1 %or.cond, label %25, label %26, !dbg !69

25:                                               ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.3, i64 0, i64 0), i32 42, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #4, !dbg !70
  unreachable, !dbg !70

26:                                               ; preds = %0
  ret i32 0, !dbg !71
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
  call void @llvm.dbg.declare(metadata i8** %4, metadata !72, metadata !DIExpression()), !dbg !73
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i8** %6, metadata !76, metadata !DIExpression()), !dbg !78
  %17 = load i8*, i8** %4, align 8, !dbg !79
  store i8* %17, i8** %6, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata i8** %7, metadata !80, metadata !DIExpression()), !dbg !81
  %18 = load i8*, i8** %4, align 8, !dbg !82
  %19 = load i32, i32* %5, align 4, !dbg !83
  %20 = zext i32 %19 to i64, !dbg !84
  %21 = getelementptr inbounds i8, i8* %18, i64 %20, !dbg !84
  store i8* %21, i8** %7, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i32* %8, metadata !85, metadata !DIExpression()), !dbg !86
  store i32 1, i32* %8, align 4, !dbg !86
  call void @llvm.dbg.declare(metadata i32* %9, metadata !87, metadata !DIExpression()), !dbg !89
  store i32 16, i32* %9, align 4, !dbg !89
  %22 = load i32, i32* %8, align 4, !dbg !90
  %23 = icmp slt i32 %22, 1, !dbg !92
  br i1 %23, label %24, label %25, !dbg !93

24:                                               ; preds = %2
  store i32 0, i32* %3, align 4, !dbg !94
  br label %134, !dbg !94

25:                                               ; preds = %2
  call void @llvm.dbg.declare(metadata i8** %10, metadata !95, metadata !DIExpression()), !dbg !96
  %26 = load i8*, i8** %6, align 8, !dbg !97
  store i8* %26, i8** %10, align 8, !dbg !96
  br label %27, !dbg !98

27:                                               ; preds = %70, %37, %25
  %28 = load i8*, i8** %10, align 8, !dbg !99
  %29 = load i8*, i8** %7, align 8, !dbg !100
  %30 = icmp ult i8* %28, %29, !dbg !101
  br i1 %30, label %31, label %133, !dbg !98

31:                                               ; preds = %27
  %32 = load i8*, i8** %10, align 8, !dbg !102
  %33 = getelementptr inbounds i8, i8* %32, i64 0, !dbg !102
  %34 = load i8, i8* %33, align 1, !dbg !102
  %35 = zext i8 %34 to i32, !dbg !102
  %36 = icmp ne i32 %35, 255, !dbg !105
  br i1 %36, label %37, label %40, !dbg !106

37:                                               ; preds = %31
  %38 = load i8*, i8** %10, align 8, !dbg !107
  %39 = getelementptr inbounds i8, i8* %38, i32 1, !dbg !107
  store i8* %39, i8** %10, align 8, !dbg !107
  br label %27, !dbg !109, !llvm.loop !110

40:                                               ; preds = %31
  %41 = load i8*, i8** %10, align 8, !dbg !113
  %42 = getelementptr inbounds i8, i8* %41, i64 16, !dbg !115
  %43 = load i8*, i8** %7, align 8, !dbg !116
  %44 = icmp ugt i8* %42, %43, !dbg !117
  br i1 %44, label %45, label %46, !dbg !118

45:                                               ; preds = %40
  store i32 0, i32* %3, align 4, !dbg !119
  br label %134, !dbg !119

46:                                               ; preds = %40
  call void @llvm.dbg.declare(metadata i32* %11, metadata !120, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i32* %12, metadata !123, metadata !DIExpression()), !dbg !124
  store i32 0, i32* %12, align 4, !dbg !124
  store i32 0, i32* %11, align 4, !dbg !125
  br label %47, !dbg !127

47:                                               ; preds = %64, %46
  %48 = load i32, i32* %11, align 4, !dbg !128
  %49 = icmp ult i32 %48, 16, !dbg !130
  br i1 %49, label %50, label %67, !dbg !131

50:                                               ; preds = %47
  %51 = load i8*, i8** %10, align 8, !dbg !132
  %52 = load i32, i32* %11, align 4, !dbg !135
  %53 = zext i32 %52 to i64, !dbg !132
  %54 = getelementptr inbounds i8, i8* %51, i64 %53, !dbg !132
  %55 = load i8, i8* %54, align 1, !dbg !132
  %56 = zext i8 %55 to i32, !dbg !132
  %57 = load i32, i32* %11, align 4, !dbg !136
  %58 = zext i32 %57 to i64, !dbg !137
  %59 = getelementptr inbounds [16 x i8], [16 x i8]* @predicate_04.marker, i64 0, i64 %58, !dbg !137
  %60 = load i8, i8* %59, align 1, !dbg !137
  %61 = zext i8 %60 to i32, !dbg !137
  %62 = icmp ne i32 %56, %61, !dbg !138
  br i1 %62, label %63, label %64, !dbg !139

63:                                               ; preds = %50
  store i32 1, i32* %12, align 4, !dbg !140
  br label %67, !dbg !142

64:                                               ; preds = %50
  %65 = load i32, i32* %11, align 4, !dbg !143
  %66 = add i32 %65, 1, !dbg !143
  store i32 %66, i32* %11, align 4, !dbg !143
  br label %47, !dbg !144, !llvm.loop !145

67:                                               ; preds = %63, %47
  %68 = load i32, i32* %12, align 4, !dbg !147
  %69 = icmp ne i32 %68, 0, !dbg !147
  br i1 %69, label %70, label %73, !dbg !149

70:                                               ; preds = %67
  %71 = load i8*, i8** %10, align 8, !dbg !150
  %72 = getelementptr inbounds i8, i8* %71, i32 1, !dbg !150
  store i8* %72, i8** %10, align 8, !dbg !150
  br label %27, !dbg !152, !llvm.loop !110

73:                                               ; preds = %67
  %74 = load i8*, i8** %10, align 8, !dbg !153
  %75 = getelementptr inbounds i8, i8* %74, i64 19, !dbg !155
  %76 = load i8*, i8** %7, align 8, !dbg !156
  %77 = icmp ugt i8* %75, %76, !dbg !157
  br i1 %77, label %78, label %79, !dbg !158

78:                                               ; preds = %73
  store i32 0, i32* %3, align 4, !dbg !159
  br label %134, !dbg !159

79:                                               ; preds = %73
  call void @llvm.dbg.declare(metadata i32* %13, metadata !160, metadata !DIExpression()), !dbg !161
  %80 = load i8*, i8** %10, align 8, !dbg !162
  %81 = getelementptr inbounds i8, i8* %80, i64 16, !dbg !162
  %82 = load i8, i8* %81, align 1, !dbg !162
  %83 = zext i8 %82 to i32, !dbg !163
  %84 = shl i32 %83, 8, !dbg !164
  %85 = load i8*, i8** %10, align 8, !dbg !165
  %86 = getelementptr inbounds i8, i8* %85, i64 17, !dbg !165
  %87 = load i8, i8* %86, align 1, !dbg !165
  %88 = zext i8 %87 to i32, !dbg !166
  %89 = or i32 %84, %88, !dbg !167
  store i32 %89, i32* %13, align 4, !dbg !161
  %90 = load i32, i32* %13, align 4, !dbg !168
  %91 = icmp ult i32 %90, 19, !dbg !170
  br i1 %91, label %133, label %92, !dbg !171

92:                                               ; preds = %79
  call void @llvm.dbg.declare(metadata i8** %14, metadata !172, metadata !DIExpression()), !dbg !173
  %93 = load i8*, i8** %10, align 8, !dbg !174
  %94 = getelementptr inbounds i8, i8* %93, i64 19, !dbg !175
  store i8* %94, i8** %14, align 8, !dbg !173
  %95 = load i8*, i8** %14, align 8, !dbg !176
  %96 = getelementptr inbounds i8, i8* %95, i64 1, !dbg !178
  %97 = load i8*, i8** %7, align 8, !dbg !179
  %98 = icmp ugt i8* %96, %97, !dbg !180
  br i1 %98, label %99, label %100, !dbg !181

99:                                               ; preds = %92
  store i32 0, i32* %3, align 4, !dbg !182
  br label %134, !dbg !182

100:                                              ; preds = %92
  call void @llvm.dbg.declare(metadata i32* %15, metadata !183, metadata !DIExpression()), !dbg !184
  %101 = load i8*, i8** %14, align 8, !dbg !185
  %102 = getelementptr inbounds i8, i8* %101, i64 0, !dbg !185
  %103 = load i8, i8* %102, align 1, !dbg !185
  %104 = zext i8 %103 to i32, !dbg !185
  store i32 %104, i32* %15, align 4, !dbg !184
  %105 = load i32, i32* %15, align 4, !dbg !186
  %106 = sub i32 %105, 24, !dbg !186
  store i32 %106, i32* %15, align 4, !dbg !186
  call void @llvm.dbg.declare(metadata i32* %16, metadata !187, metadata !DIExpression()), !dbg !188
  %107 = load i32, i32* %15, align 4, !dbg !189
  %108 = add i32 %107, 7, !dbg !190
  %109 = udiv i32 %108, 8, !dbg !191
  store i32 %109, i32* %16, align 4, !dbg !188
  %110 = load i8*, i8** %14, align 8, !dbg !192
  %111 = getelementptr inbounds i8, i8* %110, i64 4, !dbg !194
  %112 = load i8*, i8** %7, align 8, !dbg !195
  %113 = icmp ugt i8* %111, %112, !dbg !196
  br i1 %113, label %114, label %115, !dbg !197

114:                                              ; preds = %100
  store i32 0, i32* %3, align 4, !dbg !198
  br label %134, !dbg !198

115:                                              ; preds = %100
  %116 = load i8*, i8** %14, align 8, !dbg !199
  %117 = getelementptr inbounds i8, i8* %116, i64 4, !dbg !201
  %118 = load i8*, i8** %7, align 8, !dbg !202
  %119 = icmp ugt i8* %117, %118, !dbg !203
  br i1 %119, label %120, label %121, !dbg !204

120:                                              ; preds = %115
  store i32 0, i32* %3, align 4, !dbg !205
  br label %134, !dbg !205

121:                                              ; preds = %115
  %122 = load i32, i32* %16, align 4, !dbg !206
  %123 = load i8*, i8** %7, align 8, !dbg !208
  %124 = load i8*, i8** %14, align 8, !dbg !209
  %125 = getelementptr inbounds i8, i8* %124, i64 4, !dbg !210
  %126 = ptrtoint i8* %123 to i64, !dbg !211
  %127 = ptrtoint i8* %125 to i64, !dbg !211
  %128 = sub i64 %126, %127, !dbg !211
  %129 = trunc i64 %128 to i32, !dbg !212
  %130 = icmp ugt i32 %122, %129, !dbg !213
  br i1 %130, label %131, label %132, !dbg !214

131:                                              ; preds = %121
  store i32 0, i32* %3, align 4, !dbg !215
  br label %134, !dbg !215

132:                                              ; preds = %121
  store i32 1, i32* %3, align 4, !dbg !216
  br label %134, !dbg !216

133:                                              ; preds = %79, %27
  store i32 0, i32* %3, align 4, !dbg !217
  br label %134, !dbg !217

134:                                              ; preds = %133, %132, %131, %120, %114, %99, %78, %45, %24
  %135 = load i32, i32* %3, align 4, !dbg !218
  ret i32 %135, !dbg !218
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @predicate_08(i8* %0, i32 %1) #0 !dbg !219 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8, align 1
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !220, metadata !DIExpression()), !dbg !221
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !222, metadata !DIExpression()), !dbg !223
  call void @llvm.dbg.declare(metadata i8** %6, metadata !224, metadata !DIExpression()), !dbg !228
  %12 = load i8*, i8** %4, align 8, !dbg !229
  store i8* %12, i8** %6, align 8, !dbg !228
  call void @llvm.dbg.declare(metadata i8** %7, metadata !230, metadata !DIExpression()), !dbg !231
  %13 = load i8*, i8** %4, align 8, !dbg !232
  %14 = load i32, i32* %5, align 4, !dbg !233
  %15 = zext i32 %14 to i64, !dbg !234
  %16 = getelementptr inbounds i8, i8* %13, i64 %15, !dbg !234
  store i8* %16, i8** %7, align 8, !dbg !231
  call void @llvm.dbg.declare(metadata i8** %8, metadata !235, metadata !DIExpression()), !dbg !236
  %17 = load i8*, i8** %6, align 8, !dbg !237
  store i8* %17, i8** %8, align 8, !dbg !236
  call void @llvm.dbg.declare(metadata i8* %9, metadata !238, metadata !DIExpression()), !dbg !239
  store i8 0, i8* %9, align 1, !dbg !239
  %18 = load i8, i8* %9, align 1, !dbg !240
  %19 = zext i8 %18 to i32, !dbg !240
  %20 = icmp sge i32 %19, 96, !dbg !242
  br i1 %20, label %21, label %50, !dbg !243

21:                                               ; preds = %2
  %22 = load i8*, i8** %8, align 8, !dbg !244
  %23 = getelementptr inbounds i8, i8* %22, i64 16, !dbg !247
  %24 = load i8*, i8** %7, align 8, !dbg !248
  %25 = icmp ugt i8* %23, %24, !dbg !249
  br i1 %25, label %26, label %27, !dbg !250

26:                                               ; preds = %21
  store i32 0, i32* %3, align 4, !dbg !251
  br label %57, !dbg !251

27:                                               ; preds = %21
  call void @llvm.dbg.declare(metadata i32* %10, metadata !252, metadata !DIExpression()), !dbg !254
  call void @llvm.dbg.declare(metadata i32* %11, metadata !255, metadata !DIExpression()), !dbg !256
  store i32 1, i32* %11, align 4, !dbg !256
  store i32 0, i32* %10, align 4, !dbg !257
  br label %28, !dbg !259

28:                                               ; preds = %45, %27
  %29 = load i32, i32* %10, align 4, !dbg !260
  %30 = icmp slt i32 %29, 12, !dbg !262
  br i1 %30, label %31, label %48, !dbg !263

31:                                               ; preds = %28
  %32 = load i8*, i8** %8, align 8, !dbg !264
  %33 = load i32, i32* %10, align 4, !dbg !266
  %34 = sext i32 %33 to i64, !dbg !264
  %35 = getelementptr inbounds i8, i8* %32, i64 %34, !dbg !264
  %36 = load i8, i8* %35, align 1, !dbg !264
  %37 = zext i8 %36 to i32, !dbg !264
  %38 = load i32, i32* %10, align 4, !dbg !267
  %39 = sext i32 %38 to i64, !dbg !268
  %40 = getelementptr inbounds [16 x i8], [16 x i8]* @v4prefix, i64 0, i64 %39, !dbg !268
  %41 = load i8, i8* %40, align 1, !dbg !268
  %42 = zext i8 %41 to i32, !dbg !268
  %43 = icmp ne i32 %37, %42, !dbg !269
  br i1 %43, label %44, label %45, !dbg !270

44:                                               ; preds = %31
  store i32 0, i32* %11, align 4, !dbg !271
  br label %48, !dbg !273

45:                                               ; preds = %31
  %46 = load i32, i32* %10, align 4, !dbg !274
  %47 = add nsw i32 %46, 1, !dbg !274
  store i32 %47, i32* %10, align 4, !dbg !274
  br label %28, !dbg !275, !llvm.loop !276

48:                                               ; preds = %44, %28
  %49 = load i32, i32* %11, align 4, !dbg !278
  br label %56, !dbg !279

50:                                               ; preds = %2
  %51 = load i8*, i8** %8, align 8, !dbg !280
  %52 = getelementptr inbounds i8, i8* %51, i64 16, !dbg !283
  %53 = load i8*, i8** %7, align 8, !dbg !284
  %54 = icmp ugt i8* %52, %53, !dbg !285
  br i1 %54, label %55, label %56, !dbg !286

55:                                               ; preds = %50
  store i32 0, i32* %3, align 4, !dbg !287
  br label %57, !dbg !287

56:                                               ; preds = %50, %48
  store i32 1, i32* %3, align 4, !dbg !288
  br label %57, !dbg !288

57:                                               ; preds = %56, %55, %26
  %58 = load i32, i32* %3, align 4, !dbg !289
  ret i32 %58, !dbg !289
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind }

!llvm.dbg.cu = !{!29, !11, !24}
!llvm.ident = !{!31, !31, !31}
!llvm.module.flags = !{!32, !33, !34, !35, !36}

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
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "v4prefix", scope: !24, file: !27, line: 27, type: !28, isLocal: true, isDefinition: true)
!24 = distinct !DICompileUnit(language: DW_LANG_C99, file: !25, producer: "clang version 13.0.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !13, globals: !26, splitDebugInlining: false, nameTableKind: None)
!25 = !DIFile(filename: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/predicate_08.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!26 = !{!22}
!27 = !DIFile(filename: "predicate_08.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 128, elements: !20)
!29 = distinct !DICompileUnit(language: DW_LANG_C99, file: !30, producer: "clang version 13.0.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !13, splitDebugInlining: false, nameTableKind: None)
!30 = !DIFile(filename: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/driver_04_08.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!31 = !{!"clang version 13.0.1"}
!32 = !{i32 7, !"Dwarf Version", i32 4}
!33 = !{i32 2, !"Debug Info Version", i32 3}
!34 = !{i32 1, !"wchar_size", i32 4}
!35 = !{i32 7, !"uwtable", i32 1}
!36 = !{i32 7, !"frame-pointer", i32 2}
!37 = distinct !DISubprogram(name: "main", scope: !38, file: !38, line: 28, type: !39, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !29, retainedNodes: !13)
!38 = !DIFile(filename: "driver_04_08.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!39 = !DISubroutineType(types: !40)
!40 = !{!6}
!41 = !DILocalVariable(name: "buf", scope: !37, file: !38, line: 29, type: !42)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 512, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 64)
!45 = !DILocation(line: 29, column: 19, scope: !37)
!46 = !DILocalVariable(name: "len", scope: !37, file: !38, line: 30, type: !10)
!47 = !DILocation(line: 30, column: 18, scope: !37)
!48 = !DILocation(line: 33, column: 24, scope: !37)
!49 = !DILocation(line: 33, column: 5, scope: !37)
!50 = !DILocation(line: 34, column: 24, scope: !37)
!51 = !DILocation(line: 34, column: 5, scope: !37)
!52 = !DILocation(line: 35, column: 17, scope: !37)
!53 = !DILocation(line: 35, column: 21, scope: !37)
!54 = !DILocation(line: 35, column: 26, scope: !37)
!55 = !DILocation(line: 35, column: 5, scope: !37)
!56 = !DILocalVariable(name: "r04", scope: !37, file: !38, line: 38, type: !6)
!57 = !DILocation(line: 38, column: 9, scope: !37)
!58 = !DILocation(line: 38, column: 28, scope: !37)
!59 = !DILocation(line: 38, column: 33, scope: !37)
!60 = !DILocation(line: 38, column: 15, scope: !37)
!61 = !DILocalVariable(name: "r08", scope: !37, file: !38, line: 39, type: !6)
!62 = !DILocation(line: 39, column: 9, scope: !37)
!63 = !DILocation(line: 39, column: 28, scope: !37)
!64 = !DILocation(line: 39, column: 33, scope: !37)
!65 = !DILocation(line: 39, column: 15, scope: !37)
!66 = !DILocation(line: 41, column: 9, scope: !67)
!67 = distinct !DILexicalBlock(scope: !37, file: !38, line: 41, column: 9)
!68 = !DILocation(line: 41, column: 13, scope: !67)
!69 = !DILocation(line: 41, column: 18, scope: !67)
!70 = !DILocation(line: 42, column: 9, scope: !67)
!71 = !DILocation(line: 44, column: 5, scope: !37)
!72 = !DILocalVariable(name: "buf", arg: 1, scope: !2, file: !3, line: 31, type: !7)
!73 = !DILocation(line: 31, column: 39, scope: !2)
!74 = !DILocalVariable(name: "len", arg: 2, scope: !2, file: !3, line: 31, type: !10)
!75 = !DILocation(line: 31, column: 57, scope: !2)
!76 = !DILocalVariable(name: "dat", scope: !2, file: !3, line: 33, type: !77)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!78 = !DILocation(line: 33, column: 19, scope: !2)
!79 = !DILocation(line: 33, column: 25, scope: !2)
!80 = !DILocalVariable(name: "ep", scope: !2, file: !3, line: 34, type: !77)
!81 = !DILocation(line: 34, column: 19, scope: !2)
!82 = !DILocation(line: 34, column: 25, scope: !2)
!83 = !DILocation(line: 34, column: 31, scope: !2)
!84 = !DILocation(line: 34, column: 29, scope: !2)
!85 = !DILocalVariable(name: "ndo_vflag", scope: !2, file: !3, line: 37, type: !6)
!86 = !DILocation(line: 37, column: 9, scope: !2)
!87 = !DILocalVariable(name: "marker_len", scope: !2, file: !3, line: 44, type: !88)
!88 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!89 = !DILocation(line: 44, column: 17, scope: !2)
!90 = !DILocation(line: 47, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !2, file: !3, line: 47, column: 9)
!92 = !DILocation(line: 47, column: 19, scope: !91)
!93 = !DILocation(line: 47, column: 9, scope: !2)
!94 = !DILocation(line: 48, column: 9, scope: !91)
!95 = !DILocalVariable(name: "p", scope: !2, file: !3, line: 50, type: !77)
!96 = !DILocation(line: 50, column: 19, scope: !2)
!97 = !DILocation(line: 50, column: 23, scope: !2)
!98 = !DILocation(line: 52, column: 5, scope: !2)
!99 = !DILocation(line: 52, column: 12, scope: !2)
!100 = !DILocation(line: 52, column: 16, scope: !2)
!101 = !DILocation(line: 52, column: 14, scope: !2)
!102 = !DILocation(line: 54, column: 13, scope: !103)
!103 = distinct !DILexicalBlock(scope: !104, file: !3, line: 54, column: 13)
!104 = distinct !DILexicalBlock(scope: !2, file: !3, line: 52, column: 20)
!105 = !DILocation(line: 54, column: 18, scope: !103)
!106 = !DILocation(line: 54, column: 13, scope: !104)
!107 = !DILocation(line: 55, column: 14, scope: !108)
!108 = distinct !DILexicalBlock(scope: !103, file: !3, line: 54, column: 27)
!109 = !DILocation(line: 56, column: 13, scope: !108)
!110 = distinct !{!110, !98, !111, !112}
!111 = !DILocation(line: 116, column: 5, scope: !2)
!112 = !{!"llvm.loop.mustprogress"}
!113 = !DILocation(line: 61, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !104, file: !3, line: 61, column: 13)
!115 = !DILocation(line: 61, column: 15, scope: !114)
!116 = !DILocation(line: 61, column: 30, scope: !114)
!117 = !DILocation(line: 61, column: 28, scope: !114)
!118 = !DILocation(line: 61, column: 13, scope: !104)
!119 = !DILocation(line: 62, column: 13, scope: !114)
!120 = !DILocalVariable(name: "i", scope: !121, file: !3, line: 66, type: !15)
!121 = distinct !DILexicalBlock(scope: !104, file: !3, line: 65, column: 9)
!122 = !DILocation(line: 66, column: 19, scope: !121)
!123 = !DILocalVariable(name: "mismatch", scope: !121, file: !3, line: 67, type: !6)
!124 = !DILocation(line: 67, column: 17, scope: !121)
!125 = !DILocation(line: 68, column: 20, scope: !126)
!126 = distinct !DILexicalBlock(scope: !121, file: !3, line: 68, column: 13)
!127 = !DILocation(line: 68, column: 18, scope: !126)
!128 = !DILocation(line: 68, column: 25, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !3, line: 68, column: 13)
!130 = !DILocation(line: 68, column: 27, scope: !129)
!131 = !DILocation(line: 68, column: 13, scope: !126)
!132 = !DILocation(line: 69, column: 21, scope: !133)
!133 = distinct !DILexicalBlock(scope: !134, file: !3, line: 69, column: 21)
!134 = distinct !DILexicalBlock(scope: !129, file: !3, line: 68, column: 46)
!135 = !DILocation(line: 69, column: 23, scope: !133)
!136 = !DILocation(line: 69, column: 36, scope: !133)
!137 = !DILocation(line: 69, column: 29, scope: !133)
!138 = !DILocation(line: 69, column: 26, scope: !133)
!139 = !DILocation(line: 69, column: 21, scope: !134)
!140 = !DILocation(line: 69, column: 51, scope: !141)
!141 = distinct !DILexicalBlock(scope: !133, file: !3, line: 69, column: 40)
!142 = !DILocation(line: 69, column: 56, scope: !141)
!143 = !DILocation(line: 68, column: 42, scope: !129)
!144 = !DILocation(line: 68, column: 13, scope: !129)
!145 = distinct !{!145, !131, !146, !112}
!146 = !DILocation(line: 70, column: 13, scope: !126)
!147 = !DILocation(line: 71, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !121, file: !3, line: 71, column: 17)
!149 = !DILocation(line: 71, column: 17, scope: !121)
!150 = !DILocation(line: 72, column: 18, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !3, line: 71, column: 27)
!152 = !DILocation(line: 73, column: 17, scope: !151)
!153 = !DILocation(line: 79, column: 13, scope: !154)
!154 = distinct !DILexicalBlock(scope: !104, file: !3, line: 79, column: 13)
!155 = !DILocation(line: 79, column: 15, scope: !154)
!156 = !DILocation(line: 79, column: 28, scope: !154)
!157 = !DILocation(line: 79, column: 26, scope: !154)
!158 = !DILocation(line: 79, column: 13, scope: !104)
!159 = !DILocation(line: 80, column: 13, scope: !154)
!160 = !DILocalVariable(name: "hlen", scope: !104, file: !3, line: 83, type: !15)
!161 = !DILocation(line: 83, column: 15, scope: !104)
!162 = !DILocation(line: 83, column: 30, scope: !104)
!163 = !DILocation(line: 83, column: 23, scope: !104)
!164 = !DILocation(line: 83, column: 36, scope: !104)
!165 = !DILocation(line: 83, column: 51, scope: !104)
!166 = !DILocation(line: 83, column: 44, scope: !104)
!167 = !DILocation(line: 83, column: 42, scope: !104)
!168 = !DILocation(line: 84, column: 13, scope: !169)
!169 = distinct !DILexicalBlock(scope: !104, file: !3, line: 84, column: 13)
!170 = !DILocation(line: 84, column: 18, scope: !169)
!171 = !DILocation(line: 84, column: 13, scope: !104)
!172 = !DILocalVariable(name: "pptr", scope: !104, file: !3, line: 90, type: !77)
!173 = !DILocation(line: 90, column: 23, scope: !104)
!174 = !DILocation(line: 90, column: 30, scope: !104)
!175 = !DILocation(line: 90, column: 32, scope: !104)
!176 = !DILocation(line: 93, column: 13, scope: !177)
!177 = distinct !DILexicalBlock(scope: !104, file: !3, line: 93, column: 13)
!178 = !DILocation(line: 93, column: 18, scope: !177)
!179 = !DILocation(line: 93, column: 24, scope: !177)
!180 = !DILocation(line: 93, column: 22, scope: !177)
!181 = !DILocation(line: 93, column: 13, scope: !104)
!182 = !DILocation(line: 94, column: 13, scope: !177)
!183 = !DILocalVariable(name: "plen", scope: !104, file: !3, line: 95, type: !15)
!184 = !DILocation(line: 95, column: 15, scope: !104)
!185 = !DILocation(line: 95, column: 22, scope: !104)
!186 = !DILocation(line: 96, column: 14, scope: !104)
!187 = !DILocalVariable(name: "plenbytes", scope: !104, file: !3, line: 98, type: !15)
!188 = !DILocation(line: 98, column: 15, scope: !104)
!189 = !DILocation(line: 98, column: 28, scope: !104)
!190 = !DILocation(line: 98, column: 33, scope: !104)
!191 = !DILocation(line: 98, column: 38, scope: !104)
!192 = !DILocation(line: 101, column: 13, scope: !193)
!193 = distinct !DILexicalBlock(scope: !104, file: !3, line: 101, column: 13)
!194 = !DILocation(line: 101, column: 18, scope: !193)
!195 = !DILocation(line: 101, column: 24, scope: !193)
!196 = !DILocation(line: 101, column: 22, scope: !193)
!197 = !DILocation(line: 101, column: 13, scope: !104)
!198 = !DILocation(line: 102, column: 13, scope: !193)
!199 = !DILocation(line: 108, column: 13, scope: !200)
!200 = distinct !DILexicalBlock(scope: !104, file: !3, line: 108, column: 13)
!201 = !DILocation(line: 108, column: 18, scope: !200)
!202 = !DILocation(line: 108, column: 24, scope: !200)
!203 = !DILocation(line: 108, column: 22, scope: !200)
!204 = !DILocation(line: 108, column: 13, scope: !104)
!205 = !DILocation(line: 109, column: 13, scope: !200)
!206 = !DILocation(line: 110, column: 13, scope: !207)
!207 = distinct !DILexicalBlock(scope: !104, file: !3, line: 110, column: 13)
!208 = !DILocation(line: 110, column: 33, scope: !207)
!209 = !DILocation(line: 110, column: 39, scope: !207)
!210 = !DILocation(line: 110, column: 44, scope: !207)
!211 = !DILocation(line: 110, column: 36, scope: !207)
!212 = !DILocation(line: 110, column: 25, scope: !207)
!213 = !DILocation(line: 110, column: 23, scope: !207)
!214 = !DILocation(line: 110, column: 13, scope: !104)
!215 = !DILocation(line: 111, column: 13, scope: !207)
!216 = !DILocation(line: 115, column: 9, scope: !104)
!217 = !DILocation(line: 118, column: 5, scope: !2)
!218 = !DILocation(line: 119, column: 1, scope: !2)
!219 = distinct !DISubprogram(name: "predicate_08", scope: !27, file: !27, line: 30, type: !4, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !24, retainedNodes: !13)
!220 = !DILocalVariable(name: "buf", arg: 1, scope: !219, file: !27, line: 30, type: !7)
!221 = !DILocation(line: 30, column: 39, scope: !219)
!222 = !DILocalVariable(name: "len", arg: 2, scope: !219, file: !27, line: 30, type: !10)
!223 = !DILocation(line: 30, column: 57, scope: !219)
!224 = !DILocalVariable(name: "bp", scope: !219, file: !27, line: 32, type: !225)
!225 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !226, size: 64)
!226 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !227)
!227 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !27, line: 23, baseType: !9)
!228 = !DILocation(line: 32, column: 19, scope: !219)
!229 = !DILocation(line: 32, column: 24, scope: !219)
!230 = !DILocalVariable(name: "ep", scope: !219, file: !27, line: 33, type: !225)
!231 = !DILocation(line: 33, column: 19, scope: !219)
!232 = !DILocation(line: 33, column: 24, scope: !219)
!233 = !DILocation(line: 33, column: 30, scope: !219)
!234 = !DILocation(line: 33, column: 28, scope: !219)
!235 = !DILocalVariable(name: "prefix", scope: !219, file: !27, line: 37, type: !225)
!236 = !DILocation(line: 37, column: 19, scope: !219)
!237 = !DILocation(line: 37, column: 28, scope: !219)
!238 = !DILocalVariable(name: "plen", scope: !219, file: !27, line: 38, type: !9)
!239 = !DILocation(line: 38, column: 19, scope: !219)
!240 = !DILocation(line: 44, column: 9, scope: !241)
!241 = distinct !DILexicalBlock(scope: !219, file: !27, line: 44, column: 9)
!242 = !DILocation(line: 44, column: 14, scope: !241)
!243 = !DILocation(line: 44, column: 9, scope: !219)
!244 = !DILocation(line: 48, column: 13, scope: !245)
!245 = distinct !DILexicalBlock(scope: !246, file: !27, line: 48, column: 13)
!246 = distinct !DILexicalBlock(scope: !241, file: !27, line: 44, column: 21)
!247 = !DILocation(line: 48, column: 20, scope: !245)
!248 = !DILocation(line: 48, column: 27, scope: !245)
!249 = !DILocation(line: 48, column: 25, scope: !245)
!250 = !DILocation(line: 48, column: 13, scope: !246)
!251 = !DILocation(line: 49, column: 13, scope: !245)
!252 = !DILocalVariable(name: "i", scope: !253, file: !27, line: 51, type: !6)
!253 = distinct !DILexicalBlock(scope: !246, file: !27, line: 50, column: 9)
!254 = !DILocation(line: 51, column: 17, scope: !253)
!255 = !DILocalVariable(name: "match", scope: !253, file: !27, line: 51, type: !6)
!256 = !DILocation(line: 51, column: 20, scope: !253)
!257 = !DILocation(line: 52, column: 20, scope: !258)
!258 = distinct !DILexicalBlock(scope: !253, file: !27, line: 52, column: 13)
!259 = !DILocation(line: 52, column: 18, scope: !258)
!260 = !DILocation(line: 52, column: 25, scope: !261)
!261 = distinct !DILexicalBlock(scope: !258, file: !27, line: 52, column: 13)
!262 = !DILocation(line: 52, column: 27, scope: !261)
!263 = !DILocation(line: 52, column: 13, scope: !258)
!264 = !DILocation(line: 53, column: 21, scope: !265)
!265 = distinct !DILexicalBlock(scope: !261, file: !27, line: 53, column: 21)
!266 = !DILocation(line: 53, column: 28, scope: !265)
!267 = !DILocation(line: 53, column: 43, scope: !265)
!268 = !DILocation(line: 53, column: 34, scope: !265)
!269 = !DILocation(line: 53, column: 31, scope: !265)
!270 = !DILocation(line: 53, column: 21, scope: !261)
!271 = !DILocation(line: 53, column: 55, scope: !272)
!272 = distinct !DILexicalBlock(scope: !265, file: !27, line: 53, column: 47)
!273 = !DILocation(line: 53, column: 60, scope: !272)
!274 = !DILocation(line: 52, column: 34, scope: !261)
!275 = !DILocation(line: 52, column: 13, scope: !261)
!276 = distinct !{!276, !263, !277, !112}
!277 = !DILocation(line: 53, column: 67, scope: !258)
!278 = !DILocation(line: 54, column: 19, scope: !253)
!279 = !DILocation(line: 56, column: 5, scope: !246)
!280 = !DILocation(line: 59, column: 13, scope: !281)
!281 = distinct !DILexicalBlock(scope: !282, file: !27, line: 59, column: 13)
!282 = distinct !DILexicalBlock(scope: !241, file: !27, line: 56, column: 12)
!283 = !DILocation(line: 59, column: 20, scope: !281)
!284 = !DILocation(line: 59, column: 27, scope: !281)
!285 = !DILocation(line: 59, column: 25, scope: !281)
!286 = !DILocation(line: 59, column: 13, scope: !282)
!287 = !DILocation(line: 60, column: 13, scope: !281)
!288 = !DILocation(line: 65, column: 5, scope: !219)
!289 = !DILocation(line: 66, column: 1, scope: !219)
