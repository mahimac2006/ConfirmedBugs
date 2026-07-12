; ModuleID = '/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/klee_results/01_07/linked.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.cf_t = type { i8, [6 x i8] }

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"len\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"0 && \22BOTH_REACHABLE_01_07\22\00", align 1
@.str.3 = private unnamed_addr constant [78 x i8] c"/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/driver_01_07.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [15 x i8] c"int main(void)\00", align 1
@predicate_07.rfcllc = internal constant [6 x i8] c"\AA\AA\03\00\00\00", align 1, !dbg !0

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !31 {
  %1 = alloca i32, align 4
  %2 = alloca [64 x i8], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [64 x i8]* %2, metadata !35, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i32* %3, metadata !40, metadata !DIExpression()), !dbg !41
  %6 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !42
  call void @klee_make_symbolic(i8* %6, i64 64, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !43
  %7 = bitcast i32* %3 to i8*, !dbg !44
  call void @klee_make_symbolic(i8* %7, i64 4, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)), !dbg !45
  %8 = load i32, i32* %3, align 4, !dbg !46
  %9 = icmp uge i32 %8, 1, !dbg !47
  %10 = load i32, i32* %3, align 4, !dbg !48
  %11 = icmp ule i32 %10, 64, !dbg !48
  %12 = select i1 %9, i1 %11, i1 false, !dbg !48
  %13 = zext i1 %12 to i32, !dbg !48
  %14 = sext i32 %13 to i64, !dbg !46
  call void @klee_assume(i64 %14), !dbg !49
  call void @llvm.dbg.declare(metadata i32* %4, metadata !50, metadata !DIExpression()), !dbg !51
  %15 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !52
  %16 = load i32, i32* %3, align 4, !dbg !53
  %17 = call i32 @predicate_01(i8* %15, i32 %16), !dbg !54
  store i32 %17, i32* %4, align 4, !dbg !51
  call void @llvm.dbg.declare(metadata i32* %5, metadata !55, metadata !DIExpression()), !dbg !56
  %18 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !57
  %19 = load i32, i32* %3, align 4, !dbg !58
  %20 = call i32 @predicate_07(i8* %18, i32 %19), !dbg !59
  store i32 %20, i32* %5, align 4, !dbg !56
  %21 = load i32, i32* %4, align 4, !dbg !60
  %22 = icmp eq i32 %21, 1, !dbg !62
  %23 = load i32, i32* %5, align 4
  %24 = icmp eq i32 %23, 1
  %or.cond = select i1 %22, i1 %24, i1 false, !dbg !63
  br i1 %or.cond, label %25, label %26, !dbg !63

25:                                               ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.3, i64 0, i64 0), i32 42, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #4, !dbg !64
  unreachable, !dbg !64

26:                                               ; preds = %0
  ret i32 0, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

declare dso_local void @klee_assume(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @predicate_01(i8* %0, i32 %1) #0 !dbg !66 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.cf_t, align 1
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !68, metadata !DIExpression()), !dbg !69
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i8** %6, metadata !72, metadata !DIExpression()), !dbg !76
  %12 = load i8*, i8** %4, align 8, !dbg !77
  store i8* %12, i8** %6, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata i8** %7, metadata !78, metadata !DIExpression()), !dbg !79
  %13 = load i8*, i8** %4, align 8, !dbg !80
  %14 = load i32, i32* %5, align 4, !dbg !81
  %15 = zext i32 %14 to i64, !dbg !82
  %16 = getelementptr inbounds i8, i8* %13, i64 %15, !dbg !82
  store i8* %16, i8** %7, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata i32* %8, metadata !83, metadata !DIExpression()), !dbg !84
  store i32 1, i32* %8, align 4, !dbg !84
  call void @llvm.dbg.declare(metadata i32* %9, metadata !85, metadata !DIExpression()), !dbg !86
  store i32 0, i32* %9, align 4, !dbg !86
  call void @llvm.dbg.declare(metadata i32* %10, metadata !87, metadata !DIExpression()), !dbg !89
  %17 = load i32, i32* %5, align 4, !dbg !90
  store i32 %17, i32* %10, align 4, !dbg !89
  call void @llvm.dbg.declare(metadata %struct.cf_t* %11, metadata !91, metadata !DIExpression()), !dbg !97
  %18 = load i32, i32* %8, align 4, !dbg !98
  %cond = icmp eq i32 %18, 1, !dbg !99
  br i1 %cond, label %19, label %125, !dbg !99

19:                                               ; preds = %2
  %20 = load i8*, i8** %6, align 8, !dbg !100
  %21 = load i32, i32* %9, align 4, !dbg !103
  %22 = sext i32 %21 to i64, !dbg !104
  %23 = getelementptr inbounds i8, i8* %20, i64 %22, !dbg !104
  %24 = getelementptr inbounds i8, i8* %23, i64 2, !dbg !105
  %25 = load i8*, i8** %7, align 8, !dbg !106
  %26 = icmp ugt i8* %24, %25, !dbg !107
  br i1 %26, label %27, label %28, !dbg !108

27:                                               ; preds = %19
  store i32 0, i32* %3, align 4, !dbg !109
  br label %126, !dbg !109

28:                                               ; preds = %19
  %29 = load i8*, i8** %6, align 8, !dbg !110
  %30 = load i32, i32* %9, align 4, !dbg !111
  %31 = add nsw i32 %30, 0, !dbg !112
  %32 = sext i32 %31 to i64, !dbg !110
  %33 = getelementptr inbounds i8, i8* %29, i64 %32, !dbg !110
  %34 = load i8, i8* %33, align 1, !dbg !110
  %35 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 0, !dbg !113
  store i8 %34, i8* %35, align 1, !dbg !114
  %36 = load i8*, i8** %6, align 8, !dbg !115
  %37 = load i32, i32* %9, align 4, !dbg !116
  %38 = add nsw i32 %37, 1, !dbg !117
  %39 = sext i32 %38 to i64, !dbg !115
  %40 = getelementptr inbounds i8, i8* %36, i64 %39, !dbg !115
  %41 = load i8, i8* %40, align 1, !dbg !115
  %42 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 1, !dbg !118
  %43 = getelementptr inbounds [6 x i8], [6 x i8]* %42, i64 0, i64 0, !dbg !119
  store i8 %41, i8* %43, align 1, !dbg !120
  %44 = load i32, i32* %9, align 4, !dbg !121
  %45 = add nsw i32 %44, 2, !dbg !121
  store i32 %45, i32* %9, align 4, !dbg !121
  %46 = load i32, i32* %10, align 4, !dbg !122
  %47 = sub i32 %46, 2, !dbg !122
  store i32 %47, i32* %10, align 4, !dbg !122
  %48 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 0, !dbg !123
  %49 = load i8, i8* %48, align 1, !dbg !123
  %50 = zext i8 %49 to i32, !dbg !125
  %51 = icmp ne i32 %50, 6, !dbg !126
  br i1 %51, label %52, label %63, !dbg !127

52:                                               ; preds = %28
  %53 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 0, !dbg !128
  %54 = load i8, i8* %53, align 1, !dbg !128
  %55 = zext i8 %54 to i32, !dbg !130
  %56 = load i32, i32* %9, align 4, !dbg !131
  %57 = add nsw i32 %56, %55, !dbg !131
  store i32 %57, i32* %9, align 4, !dbg !131
  %58 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 0, !dbg !132
  %59 = load i8, i8* %58, align 1, !dbg !132
  %60 = zext i8 %59 to i32, !dbg !133
  %61 = load i32, i32* %10, align 4, !dbg !134
  %62 = sub i32 %61, %60, !dbg !134
  store i32 %62, i32* %10, align 4, !dbg !134
  br label %125, !dbg !135

63:                                               ; preds = %28
  %64 = load i8*, i8** %6, align 8, !dbg !136
  %65 = load i32, i32* %9, align 4, !dbg !138
  %66 = sext i32 %65 to i64, !dbg !139
  %67 = getelementptr inbounds i8, i8* %64, i64 %66, !dbg !139
  %68 = getelementptr inbounds i8, i8* %67, i64 6, !dbg !140
  %69 = load i8*, i8** %7, align 8, !dbg !141
  %70 = icmp ugt i8* %68, %69, !dbg !142
  br i1 %70, label %71, label %72, !dbg !143

71:                                               ; preds = %63
  store i32 0, i32* %3, align 4, !dbg !144
  br label %126, !dbg !144

72:                                               ; preds = %63
  %73 = load i8*, i8** %6, align 8, !dbg !145
  %74 = load i32, i32* %9, align 4, !dbg !146
  %75 = add nsw i32 %74, 0, !dbg !147
  %76 = sext i32 %75 to i64, !dbg !145
  %77 = getelementptr inbounds i8, i8* %73, i64 %76, !dbg !145
  %78 = load i8, i8* %77, align 1, !dbg !145
  %79 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 1, !dbg !148
  %80 = getelementptr inbounds [6 x i8], [6 x i8]* %79, i64 0, i64 0, !dbg !149
  store i8 %78, i8* %80, align 1, !dbg !150
  %81 = load i8*, i8** %6, align 8, !dbg !151
  %82 = load i32, i32* %9, align 4, !dbg !152
  %83 = add nsw i32 %82, 1, !dbg !153
  %84 = sext i32 %83 to i64, !dbg !151
  %85 = getelementptr inbounds i8, i8* %81, i64 %84, !dbg !151
  %86 = load i8, i8* %85, align 1, !dbg !151
  %87 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 1, !dbg !154
  %88 = getelementptr inbounds [6 x i8], [6 x i8]* %87, i64 0, i64 1, !dbg !155
  store i8 %86, i8* %88, align 1, !dbg !156
  %89 = load i8*, i8** %6, align 8, !dbg !157
  %90 = load i32, i32* %9, align 4, !dbg !158
  %91 = add nsw i32 %90, 2, !dbg !159
  %92 = sext i32 %91 to i64, !dbg !157
  %93 = getelementptr inbounds i8, i8* %89, i64 %92, !dbg !157
  %94 = load i8, i8* %93, align 1, !dbg !157
  %95 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 1, !dbg !160
  %96 = getelementptr inbounds [6 x i8], [6 x i8]* %95, i64 0, i64 2, !dbg !161
  store i8 %94, i8* %96, align 1, !dbg !162
  %97 = load i8*, i8** %6, align 8, !dbg !163
  %98 = load i32, i32* %9, align 4, !dbg !164
  %99 = add nsw i32 %98, 3, !dbg !165
  %100 = sext i32 %99 to i64, !dbg !163
  %101 = getelementptr inbounds i8, i8* %97, i64 %100, !dbg !163
  %102 = load i8, i8* %101, align 1, !dbg !163
  %103 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 1, !dbg !166
  %104 = getelementptr inbounds [6 x i8], [6 x i8]* %103, i64 0, i64 3, !dbg !167
  store i8 %102, i8* %104, align 1, !dbg !168
  %105 = load i8*, i8** %6, align 8, !dbg !169
  %106 = load i32, i32* %9, align 4, !dbg !170
  %107 = add nsw i32 %106, 4, !dbg !171
  %108 = sext i32 %107 to i64, !dbg !169
  %109 = getelementptr inbounds i8, i8* %105, i64 %108, !dbg !169
  %110 = load i8, i8* %109, align 1, !dbg !169
  %111 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 1, !dbg !172
  %112 = getelementptr inbounds [6 x i8], [6 x i8]* %111, i64 0, i64 4, !dbg !173
  store i8 %110, i8* %112, align 1, !dbg !174
  %113 = load i8*, i8** %6, align 8, !dbg !175
  %114 = load i32, i32* %9, align 4, !dbg !176
  %115 = add nsw i32 %114, 5, !dbg !177
  %116 = sext i32 %115 to i64, !dbg !175
  %117 = getelementptr inbounds i8, i8* %113, i64 %116, !dbg !175
  %118 = load i8, i8* %117, align 1, !dbg !175
  %119 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 1, !dbg !178
  %120 = getelementptr inbounds [6 x i8], [6 x i8]* %119, i64 0, i64 5, !dbg !179
  store i8 %118, i8* %120, align 1, !dbg !180
  %121 = load i32, i32* %9, align 4, !dbg !181
  %122 = add nsw i32 %121, 6, !dbg !181
  store i32 %122, i32* %9, align 4, !dbg !181
  %123 = load i32, i32* %10, align 4, !dbg !182
  %124 = sub i32 %123, 6, !dbg !182
  store i32 %124, i32* %10, align 4, !dbg !182
  br label %125, !dbg !183

125:                                              ; preds = %2, %72, %52
  store i32 1, i32* %3, align 4, !dbg !184
  br label %126, !dbg !184

126:                                              ; preds = %125, %71, %27
  %127 = load i32, i32* %3, align 4, !dbg !185
  ret i32 %127, !dbg !185
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @predicate_07(i8* %0, i32 %1) #0 !dbg !2 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !186, metadata !DIExpression()), !dbg !187
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !188, metadata !DIExpression()), !dbg !189
  call void @llvm.dbg.declare(metadata i8** %6, metadata !190, metadata !DIExpression()), !dbg !192
  %16 = load i8*, i8** %4, align 8, !dbg !193
  store i8* %16, i8** %6, align 8, !dbg !192
  call void @llvm.dbg.declare(metadata i8** %7, metadata !194, metadata !DIExpression()), !dbg !195
  %17 = load i8*, i8** %4, align 8, !dbg !196
  %18 = load i32, i32* %5, align 4, !dbg !197
  %19 = zext i32 %18 to i64, !dbg !198
  %20 = getelementptr inbounds i8, i8* %17, i64 %19, !dbg !198
  store i8* %20, i8** %7, align 8, !dbg !195
  call void @llvm.dbg.declare(metadata i32* %8, metadata !199, metadata !DIExpression()), !dbg !200
  store i32 0, i32* %8, align 4, !dbg !200
  call void @llvm.dbg.declare(metadata i32* %9, metadata !201, metadata !DIExpression()), !dbg !202
  store i32 1, i32* %9, align 4, !dbg !202
  %21 = load i32, i32* %9, align 4, !dbg !203
  call void @llvm.dbg.declare(metadata i32* %10, metadata !204, metadata !DIExpression()), !dbg !206
  store i32 6, i32* %10, align 4, !dbg !206
  call void @llvm.dbg.declare(metadata i32* %11, metadata !207, metadata !DIExpression()), !dbg !208
  store i32 6, i32* %11, align 4, !dbg !208
  call void @llvm.dbg.declare(metadata i32* %12, metadata !209, metadata !DIExpression()), !dbg !210
  call void @llvm.dbg.declare(metadata i32* %13, metadata !211, metadata !DIExpression()), !dbg !212
  store i32 6, i32* %12, align 4, !dbg !213
  %22 = load i32, i32* %12, align 4, !dbg !214
  %23 = load i32, i32* %10, align 4, !dbg !216
  %24 = icmp ugt i32 %22, %23, !dbg !217
  br i1 %24, label %25, label %27, !dbg !218

25:                                               ; preds = %2
  %26 = load i32, i32* %10, align 4, !dbg !219
  store i32 %26, i32* %12, align 4, !dbg !220
  br label %27, !dbg !221

27:                                               ; preds = %25, %2
  %28 = load i32, i32* %12, align 4, !dbg !222
  %29 = load i32, i32* %11, align 4, !dbg !224
  %30 = icmp ugt i32 %28, %29, !dbg !225
  br i1 %30, label %31, label %33, !dbg !226

31:                                               ; preds = %27
  %32 = load i32, i32* %11, align 4, !dbg !227
  store i32 %32, i32* %12, align 4, !dbg !228
  br label %33, !dbg !229

33:                                               ; preds = %31, %27
  %34 = load i32, i32* %8, align 4, !dbg !230
  %35 = icmp ne i32 %34, 0, !dbg !230
  %36 = load i32, i32* %12, align 4, !dbg !232
  %37 = icmp eq i32 %36, 0, !dbg !234
  br i1 %37, label %38, label %39, !dbg !235

38:                                               ; preds = %33
  store i32 0, i32* %3, align 4, !dbg !236
  br label %76, !dbg !236

39:                                               ; preds = %33
  %40 = load i8*, i8** %6, align 8, !dbg !238
  %41 = load i32, i32* %12, align 4, !dbg !240
  %42 = zext i32 %41 to i64, !dbg !241
  %43 = getelementptr inbounds i8, i8* %40, i64 %42, !dbg !241
  %44 = load i8*, i8** %7, align 8, !dbg !242
  %45 = icmp ugt i8* %43, %44, !dbg !243
  br i1 %45, label %46, label %47, !dbg !244

46:                                               ; preds = %39
  store i32 0, i32* %3, align 4, !dbg !245
  br label %76, !dbg !245

47:                                               ; preds = %39
  call void @llvm.dbg.declare(metadata i32* %14, metadata !246, metadata !DIExpression()), !dbg !248
  call void @llvm.dbg.declare(metadata i32* %15, metadata !249, metadata !DIExpression()), !dbg !250
  store i32 1, i32* %15, align 4, !dbg !250
  store i32 0, i32* %14, align 4, !dbg !251
  br label %48, !dbg !253

48:                                               ; preds = %66, %47
  %49 = load i32, i32* %14, align 4, !dbg !254
  %50 = load i32, i32* %12, align 4, !dbg !256
  %51 = icmp ult i32 %49, %50, !dbg !257
  br i1 %51, label %52, label %69, !dbg !258

52:                                               ; preds = %48
  %53 = load i8*, i8** %6, align 8, !dbg !259
  %54 = load i32, i32* %14, align 4, !dbg !262
  %55 = zext i32 %54 to i64, !dbg !259
  %56 = getelementptr inbounds i8, i8* %53, i64 %55, !dbg !259
  %57 = load i8, i8* %56, align 1, !dbg !259
  %58 = zext i8 %57 to i32, !dbg !259
  %59 = load i32, i32* %14, align 4, !dbg !263
  %60 = zext i32 %59 to i64, !dbg !264
  %61 = getelementptr inbounds [6 x i8], [6 x i8]* @predicate_07.rfcllc, i64 0, i64 %60, !dbg !264
  %62 = load i8, i8* %61, align 1, !dbg !264
  %63 = zext i8 %62 to i32, !dbg !264
  %64 = icmp ne i32 %58, %63, !dbg !265
  br i1 %64, label %65, label %66, !dbg !266

65:                                               ; preds = %52
  store i32 0, i32* %15, align 4, !dbg !267
  br label %69, !dbg !269

66:                                               ; preds = %52
  %67 = load i32, i32* %14, align 4, !dbg !270
  %68 = add i32 %67, 1, !dbg !270
  store i32 %68, i32* %14, align 4, !dbg !270
  br label %48, !dbg !271, !llvm.loop !272

69:                                               ; preds = %65, %48
  %70 = load i32, i32* %15, align 4, !dbg !275
  %71 = icmp ne i32 %70, 0, !dbg !275
  br i1 %71, label %72, label %73, !dbg !277

72:                                               ; preds = %69
  store i32 0, i32* %13, align 4, !dbg !278
  br label %74, !dbg !280

73:                                               ; preds = %69
  store i32 0, i32* %13, align 4, !dbg !281
  br label %74

74:                                               ; preds = %73, %72
  %75 = load i32, i32* %13, align 4, !dbg !283
  store i32 1, i32* %3, align 4, !dbg !284
  br label %76, !dbg !284

76:                                               ; preds = %74, %46, %38
  %77 = load i32, i32* %3, align 4, !dbg !285
  ret i32 %77, !dbg !285
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind }

!llvm.dbg.cu = !{!21, !23, !11}
!llvm.ident = !{!25, !25, !25}
!llvm.module.flags = !{!26, !27, !28, !29, !30}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "rfcllc", scope: !2, file: !3, line: 40, type: !16, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "predicate_07", scope: !3, file: !3, line: 25, type: !4, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !11, retainedNodes: !13)
!3 = !DIFile(filename: "predicate_07.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !7, !10}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!9 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = distinct !DICompileUnit(language: DW_LANG_C99, file: !12, producer: "clang version 13.0.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !13, retainedTypes: !14, globals: !15, splitDebugInlining: false, nameTableKind: None)
!12 = !DIFile(filename: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/predicate_07.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!13 = !{}
!14 = !{!10}
!15 = !{!0}
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 48, elements: !19)
!17 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !3, line: 22, baseType: !9)
!19 = !{!20}
!20 = !DISubrange(count: 6)
!21 = distinct !DICompileUnit(language: DW_LANG_C99, file: !22, producer: "clang version 13.0.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !13, splitDebugInlining: false, nameTableKind: None)
!22 = !DIFile(filename: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/driver_01_07.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!23 = distinct !DICompileUnit(language: DW_LANG_C99, file: !24, producer: "clang version 13.0.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !13, splitDebugInlining: false, nameTableKind: None)
!24 = !DIFile(filename: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/predicate_01.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!25 = !{!"clang version 13.0.1"}
!26 = !{i32 7, !"Dwarf Version", i32 4}
!27 = !{i32 2, !"Debug Info Version", i32 3}
!28 = !{i32 1, !"wchar_size", i32 4}
!29 = !{i32 7, !"uwtable", i32 1}
!30 = !{i32 7, !"frame-pointer", i32 2}
!31 = distinct !DISubprogram(name: "main", scope: !32, file: !32, line: 28, type: !33, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !13)
!32 = !DIFile(filename: "driver_01_07.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!33 = !DISubroutineType(types: !34)
!34 = !{!6}
!35 = !DILocalVariable(name: "buf", scope: !31, file: !32, line: 29, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 512, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 64)
!39 = !DILocation(line: 29, column: 19, scope: !31)
!40 = !DILocalVariable(name: "len", scope: !31, file: !32, line: 30, type: !10)
!41 = !DILocation(line: 30, column: 18, scope: !31)
!42 = !DILocation(line: 33, column: 24, scope: !31)
!43 = !DILocation(line: 33, column: 5, scope: !31)
!44 = !DILocation(line: 34, column: 24, scope: !31)
!45 = !DILocation(line: 34, column: 5, scope: !31)
!46 = !DILocation(line: 35, column: 17, scope: !31)
!47 = !DILocation(line: 35, column: 21, scope: !31)
!48 = !DILocation(line: 35, column: 26, scope: !31)
!49 = !DILocation(line: 35, column: 5, scope: !31)
!50 = !DILocalVariable(name: "r01", scope: !31, file: !32, line: 38, type: !6)
!51 = !DILocation(line: 38, column: 9, scope: !31)
!52 = !DILocation(line: 38, column: 28, scope: !31)
!53 = !DILocation(line: 38, column: 33, scope: !31)
!54 = !DILocation(line: 38, column: 15, scope: !31)
!55 = !DILocalVariable(name: "r07", scope: !31, file: !32, line: 39, type: !6)
!56 = !DILocation(line: 39, column: 9, scope: !31)
!57 = !DILocation(line: 39, column: 28, scope: !31)
!58 = !DILocation(line: 39, column: 33, scope: !31)
!59 = !DILocation(line: 39, column: 15, scope: !31)
!60 = !DILocation(line: 41, column: 9, scope: !61)
!61 = distinct !DILexicalBlock(scope: !31, file: !32, line: 41, column: 9)
!62 = !DILocation(line: 41, column: 13, scope: !61)
!63 = !DILocation(line: 41, column: 18, scope: !61)
!64 = !DILocation(line: 42, column: 9, scope: !61)
!65 = !DILocation(line: 44, column: 5, scope: !31)
!66 = distinct !DISubprogram(name: "predicate_01", scope: !67, file: !67, line: 24, type: !4, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !23, retainedNodes: !13)
!67 = !DIFile(filename: "predicate_01.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!68 = !DILocalVariable(name: "buf", arg: 1, scope: !66, file: !67, line: 24, type: !7)
!69 = !DILocation(line: 24, column: 39, scope: !66)
!70 = !DILocalVariable(name: "len", arg: 2, scope: !66, file: !67, line: 24, type: !10)
!71 = !DILocation(line: 24, column: 57, scope: !66)
!72 = !DILocalVariable(name: "bp", scope: !66, file: !67, line: 26, type: !73)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !75)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !67, line: 14, baseType: !9)
!76 = !DILocation(line: 26, column: 19, scope: !66)
!77 = !DILocation(line: 26, column: 24, scope: !66)
!78 = !DILocalVariable(name: "ep", scope: !66, file: !67, line: 27, type: !73)
!79 = !DILocation(line: 27, column: 19, scope: !66)
!80 = !DILocation(line: 27, column: 24, scope: !66)
!81 = !DILocation(line: 27, column: 30, scope: !66)
!82 = !DILocation(line: 27, column: 28, scope: !66)
!83 = !DILocalVariable(name: "element", scope: !66, file: !67, line: 32, type: !6)
!84 = !DILocation(line: 32, column: 11, scope: !66)
!85 = !DILocalVariable(name: "offset", scope: !66, file: !67, line: 33, type: !6)
!86 = !DILocation(line: 33, column: 11, scope: !66)
!87 = !DILocalVariable(name: "length", scope: !66, file: !67, line: 34, type: !88)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !67, line: 15, baseType: !10)
!89 = !DILocation(line: 34, column: 11, scope: !66)
!90 = !DILocation(line: 34, column: 21, scope: !66)
!91 = !DILocalVariable(name: "cf", scope: !66, file: !67, line: 36, type: !92)
!92 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "cf_t", file: !67, line: 18, size: 56, elements: !93)
!93 = !{!94, !95}
!94 = !DIDerivedType(tag: DW_TAG_member, name: "length", scope: !92, file: !67, line: 18, baseType: !9, size: 8)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !92, file: !67, line: 18, baseType: !96, size: 48, offset: 8)
!96 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 48, elements: !19)
!97 = !DILocation(line: 36, column: 17, scope: !66)
!98 = !DILocation(line: 39, column: 13, scope: !66)
!99 = !DILocation(line: 39, column: 5, scope: !66)
!100 = !DILocation(line: 48, column: 13, scope: !101)
!101 = distinct !DILexicalBlock(scope: !102, file: !67, line: 48, column: 13)
!102 = distinct !DILexicalBlock(scope: !66, file: !67, line: 39, column: 22)
!103 = !DILocation(line: 48, column: 18, scope: !101)
!104 = !DILocation(line: 48, column: 16, scope: !101)
!105 = !DILocation(line: 48, column: 25, scope: !101)
!106 = !DILocation(line: 48, column: 31, scope: !101)
!107 = !DILocation(line: 48, column: 29, scope: !101)
!108 = !DILocation(line: 48, column: 13, scope: !102)
!109 = !DILocation(line: 49, column: 13, scope: !101)
!110 = !DILocation(line: 50, column: 23, scope: !102)
!111 = !DILocation(line: 50, column: 26, scope: !102)
!112 = !DILocation(line: 50, column: 33, scope: !102)
!113 = !DILocation(line: 50, column: 12, scope: !102)
!114 = !DILocation(line: 50, column: 21, scope: !102)
!115 = !DILocation(line: 51, column: 23, scope: !102)
!116 = !DILocation(line: 51, column: 26, scope: !102)
!117 = !DILocation(line: 51, column: 33, scope: !102)
!118 = !DILocation(line: 51, column: 12, scope: !102)
!119 = !DILocation(line: 51, column: 9, scope: !102)
!120 = !DILocation(line: 51, column: 21, scope: !102)
!121 = !DILocation(line: 52, column: 16, scope: !102)
!122 = !DILocation(line: 53, column: 16, scope: !102)
!123 = !DILocation(line: 55, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !102, file: !67, line: 55, column: 13)
!125 = !DILocation(line: 55, column: 13, scope: !124)
!126 = !DILocation(line: 55, column: 23, scope: !124)
!127 = !DILocation(line: 55, column: 13, scope: !102)
!128 = !DILocation(line: 56, column: 26, scope: !129)
!129 = distinct !DILexicalBlock(scope: !124, file: !67, line: 55, column: 29)
!130 = !DILocation(line: 56, column: 23, scope: !129)
!131 = !DILocation(line: 56, column: 20, scope: !129)
!132 = !DILocation(line: 57, column: 26, scope: !129)
!133 = !DILocation(line: 57, column: 23, scope: !129)
!134 = !DILocation(line: 57, column: 20, scope: !129)
!135 = !DILocation(line: 58, column: 13, scope: !129)
!136 = !DILocation(line: 63, column: 13, scope: !137)
!137 = distinct !DILexicalBlock(scope: !102, file: !67, line: 63, column: 13)
!138 = !DILocation(line: 63, column: 18, scope: !137)
!139 = !DILocation(line: 63, column: 16, scope: !137)
!140 = !DILocation(line: 63, column: 25, scope: !137)
!141 = !DILocation(line: 63, column: 31, scope: !137)
!142 = !DILocation(line: 63, column: 29, scope: !137)
!143 = !DILocation(line: 63, column: 13, scope: !102)
!144 = !DILocation(line: 64, column: 13, scope: !137)
!145 = !DILocation(line: 65, column: 23, scope: !102)
!146 = !DILocation(line: 65, column: 26, scope: !102)
!147 = !DILocation(line: 65, column: 33, scope: !102)
!148 = !DILocation(line: 65, column: 12, scope: !102)
!149 = !DILocation(line: 65, column: 9, scope: !102)
!150 = !DILocation(line: 65, column: 21, scope: !102)
!151 = !DILocation(line: 66, column: 23, scope: !102)
!152 = !DILocation(line: 66, column: 26, scope: !102)
!153 = !DILocation(line: 66, column: 33, scope: !102)
!154 = !DILocation(line: 66, column: 12, scope: !102)
!155 = !DILocation(line: 66, column: 9, scope: !102)
!156 = !DILocation(line: 66, column: 21, scope: !102)
!157 = !DILocation(line: 67, column: 23, scope: !102)
!158 = !DILocation(line: 67, column: 26, scope: !102)
!159 = !DILocation(line: 67, column: 33, scope: !102)
!160 = !DILocation(line: 67, column: 12, scope: !102)
!161 = !DILocation(line: 67, column: 9, scope: !102)
!162 = !DILocation(line: 67, column: 21, scope: !102)
!163 = !DILocation(line: 68, column: 23, scope: !102)
!164 = !DILocation(line: 68, column: 26, scope: !102)
!165 = !DILocation(line: 68, column: 33, scope: !102)
!166 = !DILocation(line: 68, column: 12, scope: !102)
!167 = !DILocation(line: 68, column: 9, scope: !102)
!168 = !DILocation(line: 68, column: 21, scope: !102)
!169 = !DILocation(line: 69, column: 23, scope: !102)
!170 = !DILocation(line: 69, column: 26, scope: !102)
!171 = !DILocation(line: 69, column: 33, scope: !102)
!172 = !DILocation(line: 69, column: 12, scope: !102)
!173 = !DILocation(line: 69, column: 9, scope: !102)
!174 = !DILocation(line: 69, column: 21, scope: !102)
!175 = !DILocation(line: 70, column: 23, scope: !102)
!176 = !DILocation(line: 70, column: 26, scope: !102)
!177 = !DILocation(line: 70, column: 33, scope: !102)
!178 = !DILocation(line: 70, column: 12, scope: !102)
!179 = !DILocation(line: 70, column: 9, scope: !102)
!180 = !DILocation(line: 70, column: 21, scope: !102)
!181 = !DILocation(line: 71, column: 16, scope: !102)
!182 = !DILocation(line: 72, column: 16, scope: !102)
!183 = !DILocation(line: 73, column: 9, scope: !102)
!184 = !DILocation(line: 77, column: 5, scope: !66)
!185 = !DILocation(line: 78, column: 1, scope: !66)
!186 = !DILocalVariable(name: "buf", arg: 1, scope: !2, file: !3, line: 25, type: !7)
!187 = !DILocation(line: 25, column: 39, scope: !2)
!188 = !DILocalVariable(name: "len", arg: 2, scope: !2, file: !3, line: 25, type: !10)
!189 = !DILocation(line: 25, column: 57, scope: !2)
!190 = !DILocalVariable(name: "p", scope: !2, file: !3, line: 27, type: !191)
!191 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!192 = !DILocation(line: 27, column: 19, scope: !2)
!193 = !DILocation(line: 27, column: 24, scope: !2)
!194 = !DILocalVariable(name: "ep", scope: !2, file: !3, line: 28, type: !191)
!195 = !DILocation(line: 28, column: 19, scope: !2)
!196 = !DILocation(line: 28, column: 24, scope: !2)
!197 = !DILocation(line: 28, column: 30, scope: !2)
!198 = !DILocation(line: 28, column: 28, scope: !2)
!199 = !DILocalVariable(name: "ndo_eflag", scope: !2, file: !3, line: 31, type: !6)
!200 = !DILocation(line: 31, column: 9, scope: !2)
!201 = !DILocalVariable(name: "ndo_suppress_default_print", scope: !2, file: !3, line: 32, type: !6)
!202 = !DILocation(line: 32, column: 9, scope: !2)
!203 = !DILocation(line: 33, column: 11, scope: !2)
!204 = !DILocalVariable(name: "caplen", scope: !2, file: !3, line: 36, type: !205)
!205 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !3, line: 23, baseType: !10)
!206 = !DILocation(line: 36, column: 11, scope: !2)
!207 = !DILocalVariable(name: "length", scope: !2, file: !3, line: 37, type: !205)
!208 = !DILocation(line: 37, column: 11, scope: !2)
!209 = !DILocalVariable(name: "cmplen", scope: !2, file: !3, line: 42, type: !10)
!210 = !DILocation(line: 42, column: 18, scope: !2)
!211 = !DILocalVariable(name: "llc_hdrlen", scope: !2, file: !3, line: 43, type: !6)
!212 = !DILocation(line: 43, column: 9, scope: !2)
!213 = !DILocation(line: 46, column: 12, scope: !2)
!214 = !DILocation(line: 47, column: 9, scope: !215)
!215 = distinct !DILexicalBlock(scope: !2, file: !3, line: 47, column: 9)
!216 = !DILocation(line: 47, column: 18, scope: !215)
!217 = !DILocation(line: 47, column: 16, scope: !215)
!218 = !DILocation(line: 47, column: 9, scope: !2)
!219 = !DILocation(line: 48, column: 18, scope: !215)
!220 = !DILocation(line: 48, column: 16, scope: !215)
!221 = !DILocation(line: 48, column: 9, scope: !215)
!222 = !DILocation(line: 49, column: 9, scope: !223)
!223 = distinct !DILexicalBlock(scope: !2, file: !3, line: 49, column: 9)
!224 = !DILocation(line: 49, column: 18, scope: !223)
!225 = !DILocation(line: 49, column: 16, scope: !223)
!226 = !DILocation(line: 49, column: 9, scope: !2)
!227 = !DILocation(line: 50, column: 18, scope: !223)
!228 = !DILocation(line: 50, column: 16, scope: !223)
!229 = !DILocation(line: 50, column: 9, scope: !223)
!230 = !DILocation(line: 52, column: 9, scope: !231)
!231 = distinct !DILexicalBlock(scope: !2, file: !3, line: 52, column: 9)
!232 = !DILocation(line: 56, column: 9, scope: !233)
!233 = distinct !DILexicalBlock(scope: !2, file: !3, line: 56, column: 9)
!234 = !DILocation(line: 56, column: 16, scope: !233)
!235 = !DILocation(line: 56, column: 9, scope: !2)
!236 = !DILocation(line: 58, column: 9, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !3, line: 56, column: 22)
!238 = !DILocation(line: 63, column: 9, scope: !239)
!239 = distinct !DILexicalBlock(scope: !2, file: !3, line: 63, column: 9)
!240 = !DILocation(line: 63, column: 13, scope: !239)
!241 = !DILocation(line: 63, column: 11, scope: !239)
!242 = !DILocation(line: 63, column: 22, scope: !239)
!243 = !DILocation(line: 63, column: 20, scope: !239)
!244 = !DILocation(line: 63, column: 9, scope: !2)
!245 = !DILocation(line: 64, column: 9, scope: !239)
!246 = !DILocalVariable(name: "i", scope: !247, file: !3, line: 69, type: !10)
!247 = distinct !DILexicalBlock(scope: !2, file: !3, line: 68, column: 5)
!248 = !DILocation(line: 69, column: 22, scope: !247)
!249 = !DILocalVariable(name: "equal", scope: !247, file: !3, line: 70, type: !6)
!250 = !DILocation(line: 70, column: 13, scope: !247)
!251 = !DILocation(line: 71, column: 16, scope: !252)
!252 = distinct !DILexicalBlock(scope: !247, file: !3, line: 71, column: 9)
!253 = !DILocation(line: 71, column: 14, scope: !252)
!254 = !DILocation(line: 71, column: 21, scope: !255)
!255 = distinct !DILexicalBlock(scope: !252, file: !3, line: 71, column: 9)
!256 = !DILocation(line: 71, column: 25, scope: !255)
!257 = !DILocation(line: 71, column: 23, scope: !255)
!258 = !DILocation(line: 71, column: 9, scope: !252)
!259 = !DILocation(line: 72, column: 17, scope: !260)
!260 = distinct !DILexicalBlock(scope: !261, file: !3, line: 72, column: 17)
!261 = distinct !DILexicalBlock(scope: !255, file: !3, line: 71, column: 38)
!262 = !DILocation(line: 72, column: 19, scope: !260)
!263 = !DILocation(line: 72, column: 32, scope: !260)
!264 = !DILocation(line: 72, column: 25, scope: !260)
!265 = !DILocation(line: 72, column: 22, scope: !260)
!266 = !DILocation(line: 72, column: 17, scope: !261)
!267 = !DILocation(line: 72, column: 44, scope: !268)
!268 = distinct !DILexicalBlock(scope: !260, file: !3, line: 72, column: 36)
!269 = !DILocation(line: 72, column: 49, scope: !268)
!270 = !DILocation(line: 71, column: 34, scope: !255)
!271 = !DILocation(line: 71, column: 9, scope: !255)
!272 = distinct !{!272, !258, !273, !274}
!273 = !DILocation(line: 73, column: 9, scope: !252)
!274 = !{!"llvm.loop.mustprogress"}
!275 = !DILocation(line: 74, column: 13, scope: !276)
!276 = distinct !DILexicalBlock(scope: !247, file: !3, line: 74, column: 13)
!277 = !DILocation(line: 74, column: 13, scope: !247)
!278 = !DILocation(line: 76, column: 24, scope: !279)
!279 = distinct !DILexicalBlock(scope: !276, file: !3, line: 74, column: 20)
!280 = !DILocation(line: 77, column: 9, scope: !279)
!281 = !DILocation(line: 79, column: 24, scope: !282)
!282 = distinct !DILexicalBlock(scope: !276, file: !3, line: 77, column: 16)
!283 = !DILocation(line: 82, column: 11, scope: !2)
!284 = !DILocation(line: 86, column: 5, scope: !2)
!285 = !DILocation(line: 87, column: 1, scope: !2)
