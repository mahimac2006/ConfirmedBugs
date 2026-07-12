; ModuleID = '/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/klee_results/01_06/linked.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.cf_t = type { i8, [6 x i8] }

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"len\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"0 && \22BOTH_REACHABLE_01_06\22\00", align 1
@.str.3 = private unnamed_addr constant [78 x i8] c"/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/driver_01_06.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [15 x i8] c"int main(void)\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !20 {
  %1 = alloca i32, align 4
  %2 = alloca [64 x i8], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [64 x i8]* %2, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i32* %3, metadata !30, metadata !DIExpression()), !dbg !31
  %6 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !32
  call void @klee_make_symbolic(i8* %6, i64 64, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !33
  %7 = bitcast i32* %3 to i8*, !dbg !34
  call void @klee_make_symbolic(i8* %7, i64 4, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)), !dbg !35
  %8 = load i32, i32* %3, align 4, !dbg !36
  %9 = icmp uge i32 %8, 1, !dbg !37
  %10 = load i32, i32* %3, align 4, !dbg !38
  %11 = icmp ule i32 %10, 64, !dbg !38
  %12 = select i1 %9, i1 %11, i1 false, !dbg !38
  %13 = zext i1 %12 to i32, !dbg !38
  %14 = sext i32 %13 to i64, !dbg !36
  call void @klee_assume(i64 %14), !dbg !39
  call void @llvm.dbg.declare(metadata i32* %4, metadata !40, metadata !DIExpression()), !dbg !41
  %15 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !42
  %16 = load i32, i32* %3, align 4, !dbg !43
  %17 = call i32 @predicate_01(i8* %15, i32 %16), !dbg !44
  store i32 %17, i32* %4, align 4, !dbg !41
  call void @llvm.dbg.declare(metadata i32* %5, metadata !45, metadata !DIExpression()), !dbg !46
  %18 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !47
  %19 = load i32, i32* %3, align 4, !dbg !48
  %20 = call i32 @predicate_06(i8* %18, i32 %19), !dbg !49
  store i32 %20, i32* %5, align 4, !dbg !46
  %21 = load i32, i32* %4, align 4, !dbg !50
  %22 = icmp eq i32 %21, 1, !dbg !52
  %23 = load i32, i32* %5, align 4
  %24 = icmp eq i32 %23, 1
  %or.cond = select i1 %22, i1 %24, i1 false, !dbg !53
  br i1 %or.cond, label %25, label %26, !dbg !53

25:                                               ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.3, i64 0, i64 0), i32 42, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #4, !dbg !54
  unreachable, !dbg !54

26:                                               ; preds = %0
  ret i32 0, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

declare dso_local void @klee_assume(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @predicate_01(i8* %0, i32 %1) #0 !dbg !56 {
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
  call void @llvm.dbg.declare(metadata i8** %4, metadata !62, metadata !DIExpression()), !dbg !63
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i8** %6, metadata !66, metadata !DIExpression()), !dbg !70
  %12 = load i8*, i8** %4, align 8, !dbg !71
  store i8* %12, i8** %6, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i8** %7, metadata !72, metadata !DIExpression()), !dbg !73
  %13 = load i8*, i8** %4, align 8, !dbg !74
  %14 = load i32, i32* %5, align 4, !dbg !75
  %15 = zext i32 %14 to i64, !dbg !76
  %16 = getelementptr inbounds i8, i8* %13, i64 %15, !dbg !76
  store i8* %16, i8** %7, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata i32* %8, metadata !77, metadata !DIExpression()), !dbg !78
  store i32 1, i32* %8, align 4, !dbg !78
  call void @llvm.dbg.declare(metadata i32* %9, metadata !79, metadata !DIExpression()), !dbg !80
  store i32 0, i32* %9, align 4, !dbg !80
  call void @llvm.dbg.declare(metadata i32* %10, metadata !81, metadata !DIExpression()), !dbg !83
  %17 = load i32, i32* %5, align 4, !dbg !84
  store i32 %17, i32* %10, align 4, !dbg !83
  call void @llvm.dbg.declare(metadata %struct.cf_t* %11, metadata !85, metadata !DIExpression()), !dbg !93
  %18 = load i32, i32* %8, align 4, !dbg !94
  %cond = icmp eq i32 %18, 1, !dbg !95
  br i1 %cond, label %19, label %125, !dbg !95

19:                                               ; preds = %2
  %20 = load i8*, i8** %6, align 8, !dbg !96
  %21 = load i32, i32* %9, align 4, !dbg !99
  %22 = sext i32 %21 to i64, !dbg !100
  %23 = getelementptr inbounds i8, i8* %20, i64 %22, !dbg !100
  %24 = getelementptr inbounds i8, i8* %23, i64 2, !dbg !101
  %25 = load i8*, i8** %7, align 8, !dbg !102
  %26 = icmp ugt i8* %24, %25, !dbg !103
  br i1 %26, label %27, label %28, !dbg !104

27:                                               ; preds = %19
  store i32 0, i32* %3, align 4, !dbg !105
  br label %126, !dbg !105

28:                                               ; preds = %19
  %29 = load i8*, i8** %6, align 8, !dbg !106
  %30 = load i32, i32* %9, align 4, !dbg !107
  %31 = add nsw i32 %30, 0, !dbg !108
  %32 = sext i32 %31 to i64, !dbg !106
  %33 = getelementptr inbounds i8, i8* %29, i64 %32, !dbg !106
  %34 = load i8, i8* %33, align 1, !dbg !106
  %35 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 0, !dbg !109
  store i8 %34, i8* %35, align 1, !dbg !110
  %36 = load i8*, i8** %6, align 8, !dbg !111
  %37 = load i32, i32* %9, align 4, !dbg !112
  %38 = add nsw i32 %37, 1, !dbg !113
  %39 = sext i32 %38 to i64, !dbg !111
  %40 = getelementptr inbounds i8, i8* %36, i64 %39, !dbg !111
  %41 = load i8, i8* %40, align 1, !dbg !111
  %42 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 1, !dbg !114
  %43 = getelementptr inbounds [6 x i8], [6 x i8]* %42, i64 0, i64 0, !dbg !115
  store i8 %41, i8* %43, align 1, !dbg !116
  %44 = load i32, i32* %9, align 4, !dbg !117
  %45 = add nsw i32 %44, 2, !dbg !117
  store i32 %45, i32* %9, align 4, !dbg !117
  %46 = load i32, i32* %10, align 4, !dbg !118
  %47 = sub i32 %46, 2, !dbg !118
  store i32 %47, i32* %10, align 4, !dbg !118
  %48 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 0, !dbg !119
  %49 = load i8, i8* %48, align 1, !dbg !119
  %50 = zext i8 %49 to i32, !dbg !121
  %51 = icmp ne i32 %50, 6, !dbg !122
  br i1 %51, label %52, label %63, !dbg !123

52:                                               ; preds = %28
  %53 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 0, !dbg !124
  %54 = load i8, i8* %53, align 1, !dbg !124
  %55 = zext i8 %54 to i32, !dbg !126
  %56 = load i32, i32* %9, align 4, !dbg !127
  %57 = add nsw i32 %56, %55, !dbg !127
  store i32 %57, i32* %9, align 4, !dbg !127
  %58 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 0, !dbg !128
  %59 = load i8, i8* %58, align 1, !dbg !128
  %60 = zext i8 %59 to i32, !dbg !129
  %61 = load i32, i32* %10, align 4, !dbg !130
  %62 = sub i32 %61, %60, !dbg !130
  store i32 %62, i32* %10, align 4, !dbg !130
  br label %125, !dbg !131

63:                                               ; preds = %28
  %64 = load i8*, i8** %6, align 8, !dbg !132
  %65 = load i32, i32* %9, align 4, !dbg !134
  %66 = sext i32 %65 to i64, !dbg !135
  %67 = getelementptr inbounds i8, i8* %64, i64 %66, !dbg !135
  %68 = getelementptr inbounds i8, i8* %67, i64 6, !dbg !136
  %69 = load i8*, i8** %7, align 8, !dbg !137
  %70 = icmp ugt i8* %68, %69, !dbg !138
  br i1 %70, label %71, label %72, !dbg !139

71:                                               ; preds = %63
  store i32 0, i32* %3, align 4, !dbg !140
  br label %126, !dbg !140

72:                                               ; preds = %63
  %73 = load i8*, i8** %6, align 8, !dbg !141
  %74 = load i32, i32* %9, align 4, !dbg !142
  %75 = add nsw i32 %74, 0, !dbg !143
  %76 = sext i32 %75 to i64, !dbg !141
  %77 = getelementptr inbounds i8, i8* %73, i64 %76, !dbg !141
  %78 = load i8, i8* %77, align 1, !dbg !141
  %79 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 1, !dbg !144
  %80 = getelementptr inbounds [6 x i8], [6 x i8]* %79, i64 0, i64 0, !dbg !145
  store i8 %78, i8* %80, align 1, !dbg !146
  %81 = load i8*, i8** %6, align 8, !dbg !147
  %82 = load i32, i32* %9, align 4, !dbg !148
  %83 = add nsw i32 %82, 1, !dbg !149
  %84 = sext i32 %83 to i64, !dbg !147
  %85 = getelementptr inbounds i8, i8* %81, i64 %84, !dbg !147
  %86 = load i8, i8* %85, align 1, !dbg !147
  %87 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 1, !dbg !150
  %88 = getelementptr inbounds [6 x i8], [6 x i8]* %87, i64 0, i64 1, !dbg !151
  store i8 %86, i8* %88, align 1, !dbg !152
  %89 = load i8*, i8** %6, align 8, !dbg !153
  %90 = load i32, i32* %9, align 4, !dbg !154
  %91 = add nsw i32 %90, 2, !dbg !155
  %92 = sext i32 %91 to i64, !dbg !153
  %93 = getelementptr inbounds i8, i8* %89, i64 %92, !dbg !153
  %94 = load i8, i8* %93, align 1, !dbg !153
  %95 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 1, !dbg !156
  %96 = getelementptr inbounds [6 x i8], [6 x i8]* %95, i64 0, i64 2, !dbg !157
  store i8 %94, i8* %96, align 1, !dbg !158
  %97 = load i8*, i8** %6, align 8, !dbg !159
  %98 = load i32, i32* %9, align 4, !dbg !160
  %99 = add nsw i32 %98, 3, !dbg !161
  %100 = sext i32 %99 to i64, !dbg !159
  %101 = getelementptr inbounds i8, i8* %97, i64 %100, !dbg !159
  %102 = load i8, i8* %101, align 1, !dbg !159
  %103 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 1, !dbg !162
  %104 = getelementptr inbounds [6 x i8], [6 x i8]* %103, i64 0, i64 3, !dbg !163
  store i8 %102, i8* %104, align 1, !dbg !164
  %105 = load i8*, i8** %6, align 8, !dbg !165
  %106 = load i32, i32* %9, align 4, !dbg !166
  %107 = add nsw i32 %106, 4, !dbg !167
  %108 = sext i32 %107 to i64, !dbg !165
  %109 = getelementptr inbounds i8, i8* %105, i64 %108, !dbg !165
  %110 = load i8, i8* %109, align 1, !dbg !165
  %111 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 1, !dbg !168
  %112 = getelementptr inbounds [6 x i8], [6 x i8]* %111, i64 0, i64 4, !dbg !169
  store i8 %110, i8* %112, align 1, !dbg !170
  %113 = load i8*, i8** %6, align 8, !dbg !171
  %114 = load i32, i32* %9, align 4, !dbg !172
  %115 = add nsw i32 %114, 5, !dbg !173
  %116 = sext i32 %115 to i64, !dbg !171
  %117 = getelementptr inbounds i8, i8* %113, i64 %116, !dbg !171
  %118 = load i8, i8* %117, align 1, !dbg !171
  %119 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 1, !dbg !174
  %120 = getelementptr inbounds [6 x i8], [6 x i8]* %119, i64 0, i64 5, !dbg !175
  store i8 %118, i8* %120, align 1, !dbg !176
  %121 = load i32, i32* %9, align 4, !dbg !177
  %122 = add nsw i32 %121, 6, !dbg !177
  store i32 %122, i32* %9, align 4, !dbg !177
  %123 = load i32, i32* %10, align 4, !dbg !178
  %124 = sub i32 %123, 6, !dbg !178
  store i32 %124, i32* %10, align 4, !dbg !178
  br label %125, !dbg !179

125:                                              ; preds = %2, %72, %52
  store i32 1, i32* %3, align 4, !dbg !180
  br label %126, !dbg !180

126:                                              ; preds = %125, %71, %27
  %127 = load i32, i32* %3, align 4, !dbg !181
  ret i32 %127, !dbg !181
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @predicate_06(i8* %0, i32 %1) #0 !dbg !182 {
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
  call void @llvm.dbg.declare(metadata i8** %4, metadata !183, metadata !DIExpression()), !dbg !184
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !185, metadata !DIExpression()), !dbg !186
  call void @llvm.dbg.declare(metadata i8** %6, metadata !187, metadata !DIExpression()), !dbg !188
  %15 = load i8*, i8** %4, align 8, !dbg !189
  store i8* %15, i8** %6, align 8, !dbg !188
  call void @llvm.dbg.declare(metadata i8** %7, metadata !190, metadata !DIExpression()), !dbg !191
  %16 = load i8*, i8** %4, align 8, !dbg !192
  %17 = load i32, i32* %5, align 4, !dbg !193
  %18 = zext i32 %17 to i64, !dbg !194
  %19 = getelementptr inbounds i8, i8* %16, i64 %18, !dbg !194
  store i8* %19, i8** %7, align 8, !dbg !191
  call void @llvm.dbg.declare(metadata i32* %8, metadata !195, metadata !DIExpression()), !dbg !196
  store i32 1, i32* %8, align 4, !dbg !196
  call void @llvm.dbg.declare(metadata i32* %9, metadata !197, metadata !DIExpression()), !dbg !199
  %20 = load i32, i32* %5, align 4, !dbg !200
  store i32 %20, i32* %9, align 4, !dbg !199
  call void @llvm.dbg.declare(metadata i32* %10, metadata !201, metadata !DIExpression()), !dbg !202
  %21 = load i32, i32* %5, align 4, !dbg !203
  store i32 %21, i32* %10, align 4, !dbg !202
  call void @llvm.dbg.declare(metadata i8** %11, metadata !204, metadata !DIExpression()), !dbg !205
  %22 = load i8*, i8** %6, align 8, !dbg !206
  store i8* %22, i8** %11, align 8, !dbg !205
  call void @llvm.dbg.declare(metadata i8** %12, metadata !207, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.declare(metadata i32* %13, metadata !209, metadata !DIExpression()), !dbg !210
  call void @llvm.dbg.declare(metadata i32* %14, metadata !211, metadata !DIExpression()), !dbg !212
  %23 = load i32, i32* %8, align 4, !dbg !213
  %24 = load i32, i32* %13, align 4, !dbg !214
  %25 = load i32, i32* %14, align 4, !dbg !215
  %26 = load i32, i32* %9, align 4, !dbg !216
  %27 = icmp ult i32 %26, 4, !dbg !218
  br i1 %27, label %28, label %29, !dbg !219

28:                                               ; preds = %2
  store i32 0, i32* %3, align 4, !dbg !220
  br label %79, !dbg !220

29:                                               ; preds = %2
  %30 = load i8*, i8** %11, align 8, !dbg !221
  store i8* %30, i8** %12, align 8, !dbg !222
  %31 = load i8*, i8** %12, align 8, !dbg !223
  %32 = getelementptr inbounds i8, i8* %31, i64 4, !dbg !225
  %33 = load i8*, i8** %7, align 8, !dbg !226
  %34 = icmp ugt i8* %32, %33, !dbg !227
  br i1 %34, label %35, label %36, !dbg !228

35:                                               ; preds = %29
  store i32 0, i32* %3, align 4, !dbg !229
  br label %79, !dbg !229

36:                                               ; preds = %29
  %37 = load i8*, i8** %12, align 8, !dbg !230
  %38 = getelementptr inbounds i8, i8* %37, i64 4, !dbg !230
  store i8* %38, i8** %12, align 8, !dbg !230
  %39 = load i8*, i8** %12, align 8, !dbg !231
  %40 = load i8*, i8** %11, align 8, !dbg !232
  %41 = load i32, i32* %10, align 4, !dbg !233
  %42 = zext i32 %41 to i64, !dbg !234
  %43 = getelementptr inbounds i8, i8* %40, i64 %42, !dbg !234
  %44 = icmp ult i8* %39, %43, !dbg !235
  br i1 %44, label %45, label %78, !dbg !236

45:                                               ; preds = %36
  %46 = load i8*, i8** %12, align 8, !dbg !237
  %47 = getelementptr inbounds i8, i8* %46, i64 4, !dbg !240
  %48 = load i8*, i8** %7, align 8, !dbg !241
  %49 = icmp ugt i8* %47, %48, !dbg !242
  br i1 %49, label %50, label %51, !dbg !243

50:                                               ; preds = %45
  store i32 0, i32* %3, align 4, !dbg !244
  br label %79, !dbg !244

51:                                               ; preds = %45
  %52 = load i8*, i8** %12, align 8, !dbg !245
  %53 = getelementptr inbounds i8, i8* %52, i64 0, !dbg !245
  %54 = getelementptr inbounds i8, i8* %53, i64 0, !dbg !245
  %55 = load i8, i8* %54, align 1, !dbg !245
  %56 = zext i8 %55 to i32, !dbg !245
  %57 = shl i32 %56, 8, !dbg !245
  %58 = load i8*, i8** %12, align 8, !dbg !245
  %59 = getelementptr inbounds i8, i8* %58, i64 0, !dbg !245
  %60 = getelementptr inbounds i8, i8* %59, i64 1, !dbg !245
  %61 = load i8, i8* %60, align 1, !dbg !245
  %62 = zext i8 %61 to i32, !dbg !245
  %63 = or i32 %57, %62, !dbg !245
  store i32 %63, i32* %13, align 4, !dbg !246
  %64 = load i8*, i8** %12, align 8, !dbg !247
  %65 = getelementptr inbounds i8, i8* %64, i64 2, !dbg !247
  %66 = getelementptr inbounds i8, i8* %65, i64 0, !dbg !247
  %67 = load i8, i8* %66, align 1, !dbg !247
  %68 = zext i8 %67 to i32, !dbg !247
  %69 = shl i32 %68, 8, !dbg !247
  %70 = load i8*, i8** %12, align 8, !dbg !247
  %71 = getelementptr inbounds i8, i8* %70, i64 2, !dbg !247
  %72 = getelementptr inbounds i8, i8* %71, i64 1, !dbg !247
  %73 = load i8, i8* %72, align 1, !dbg !247
  %74 = zext i8 %73 to i32, !dbg !247
  %75 = or i32 %69, %74, !dbg !247
  store i32 %75, i32* %14, align 4, !dbg !248
  %76 = load i32, i32* %13, align 4, !dbg !249
  %77 = load i32, i32* %14, align 4, !dbg !250
  store i32 1, i32* %3, align 4, !dbg !251
  br label %79, !dbg !251

78:                                               ; preds = %36
  store i32 0, i32* %3, align 4, !dbg !252
  br label %79, !dbg !252

79:                                               ; preds = %78, %51, %50, %35, %28
  %80 = load i32, i32* %3, align 4, !dbg !253
  ret i32 %80, !dbg !253
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind }

!llvm.dbg.cu = !{!0, !3, !5}
!llvm.ident = !{!14, !14, !14}
!llvm.module.flags = !{!15, !16, !17, !18, !19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/driver_01_06.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!2 = !{}
!3 = distinct !DICompileUnit(language: DW_LANG_C99, file: !4, producer: "clang version 13.0.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!4 = !DIFile(filename: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/predicate_01.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!5 = distinct !DICompileUnit(language: DW_LANG_C99, file: !6, producer: "clang version 13.0.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !7, splitDebugInlining: false, nameTableKind: None)
!6 = !DIFile(filename: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/predicate_06.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!7 = !{!8, !9}
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !12, line: 21, baseType: !13)
!12 = !DIFile(filename: "predicate_06.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!13 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!14 = !{!"clang version 13.0.1"}
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 28, type: !22, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "driver_01_06.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!22 = !DISubroutineType(types: !23)
!23 = !{!24}
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !DILocalVariable(name: "buf", scope: !20, file: !21, line: 29, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 512, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 64)
!29 = !DILocation(line: 29, column: 19, scope: !20)
!30 = !DILocalVariable(name: "len", scope: !20, file: !21, line: 30, type: !8)
!31 = !DILocation(line: 30, column: 18, scope: !20)
!32 = !DILocation(line: 33, column: 24, scope: !20)
!33 = !DILocation(line: 33, column: 5, scope: !20)
!34 = !DILocation(line: 34, column: 24, scope: !20)
!35 = !DILocation(line: 34, column: 5, scope: !20)
!36 = !DILocation(line: 35, column: 17, scope: !20)
!37 = !DILocation(line: 35, column: 21, scope: !20)
!38 = !DILocation(line: 35, column: 26, scope: !20)
!39 = !DILocation(line: 35, column: 5, scope: !20)
!40 = !DILocalVariable(name: "r01", scope: !20, file: !21, line: 38, type: !24)
!41 = !DILocation(line: 38, column: 9, scope: !20)
!42 = !DILocation(line: 38, column: 28, scope: !20)
!43 = !DILocation(line: 38, column: 33, scope: !20)
!44 = !DILocation(line: 38, column: 15, scope: !20)
!45 = !DILocalVariable(name: "r06", scope: !20, file: !21, line: 39, type: !24)
!46 = !DILocation(line: 39, column: 9, scope: !20)
!47 = !DILocation(line: 39, column: 28, scope: !20)
!48 = !DILocation(line: 39, column: 33, scope: !20)
!49 = !DILocation(line: 39, column: 15, scope: !20)
!50 = !DILocation(line: 41, column: 9, scope: !51)
!51 = distinct !DILexicalBlock(scope: !20, file: !21, line: 41, column: 9)
!52 = !DILocation(line: 41, column: 13, scope: !51)
!53 = !DILocation(line: 41, column: 18, scope: !51)
!54 = !DILocation(line: 42, column: 9, scope: !51)
!55 = !DILocation(line: 44, column: 5, scope: !20)
!56 = distinct !DISubprogram(name: "predicate_01", scope: !57, file: !57, line: 24, type: !58, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !3, retainedNodes: !2)
!57 = !DIFile(filename: "predicate_01.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!58 = !DISubroutineType(types: !59)
!59 = !{!24, !60, !8}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!62 = !DILocalVariable(name: "buf", arg: 1, scope: !56, file: !57, line: 24, type: !60)
!63 = !DILocation(line: 24, column: 39, scope: !56)
!64 = !DILocalVariable(name: "len", arg: 2, scope: !56, file: !57, line: 24, type: !8)
!65 = !DILocation(line: 24, column: 57, scope: !56)
!66 = !DILocalVariable(name: "bp", scope: !56, file: !57, line: 26, type: !67)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !69)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !57, line: 14, baseType: !13)
!70 = !DILocation(line: 26, column: 19, scope: !56)
!71 = !DILocation(line: 26, column: 24, scope: !56)
!72 = !DILocalVariable(name: "ep", scope: !56, file: !57, line: 27, type: !67)
!73 = !DILocation(line: 27, column: 19, scope: !56)
!74 = !DILocation(line: 27, column: 24, scope: !56)
!75 = !DILocation(line: 27, column: 30, scope: !56)
!76 = !DILocation(line: 27, column: 28, scope: !56)
!77 = !DILocalVariable(name: "element", scope: !56, file: !57, line: 32, type: !24)
!78 = !DILocation(line: 32, column: 11, scope: !56)
!79 = !DILocalVariable(name: "offset", scope: !56, file: !57, line: 33, type: !24)
!80 = !DILocation(line: 33, column: 11, scope: !56)
!81 = !DILocalVariable(name: "length", scope: !56, file: !57, line: 34, type: !82)
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !57, line: 15, baseType: !8)
!83 = !DILocation(line: 34, column: 11, scope: !56)
!84 = !DILocation(line: 34, column: 21, scope: !56)
!85 = !DILocalVariable(name: "cf", scope: !56, file: !57, line: 36, type: !86)
!86 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "cf_t", file: !57, line: 18, size: 56, elements: !87)
!87 = !{!88, !89}
!88 = !DIDerivedType(tag: DW_TAG_member, name: "length", scope: !86, file: !57, line: 18, baseType: !13, size: 8)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !86, file: !57, line: 18, baseType: !90, size: 48, offset: 8)
!90 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 48, elements: !91)
!91 = !{!92}
!92 = !DISubrange(count: 6)
!93 = !DILocation(line: 36, column: 17, scope: !56)
!94 = !DILocation(line: 39, column: 13, scope: !56)
!95 = !DILocation(line: 39, column: 5, scope: !56)
!96 = !DILocation(line: 48, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !98, file: !57, line: 48, column: 13)
!98 = distinct !DILexicalBlock(scope: !56, file: !57, line: 39, column: 22)
!99 = !DILocation(line: 48, column: 18, scope: !97)
!100 = !DILocation(line: 48, column: 16, scope: !97)
!101 = !DILocation(line: 48, column: 25, scope: !97)
!102 = !DILocation(line: 48, column: 31, scope: !97)
!103 = !DILocation(line: 48, column: 29, scope: !97)
!104 = !DILocation(line: 48, column: 13, scope: !98)
!105 = !DILocation(line: 49, column: 13, scope: !97)
!106 = !DILocation(line: 50, column: 23, scope: !98)
!107 = !DILocation(line: 50, column: 26, scope: !98)
!108 = !DILocation(line: 50, column: 33, scope: !98)
!109 = !DILocation(line: 50, column: 12, scope: !98)
!110 = !DILocation(line: 50, column: 21, scope: !98)
!111 = !DILocation(line: 51, column: 23, scope: !98)
!112 = !DILocation(line: 51, column: 26, scope: !98)
!113 = !DILocation(line: 51, column: 33, scope: !98)
!114 = !DILocation(line: 51, column: 12, scope: !98)
!115 = !DILocation(line: 51, column: 9, scope: !98)
!116 = !DILocation(line: 51, column: 21, scope: !98)
!117 = !DILocation(line: 52, column: 16, scope: !98)
!118 = !DILocation(line: 53, column: 16, scope: !98)
!119 = !DILocation(line: 55, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !98, file: !57, line: 55, column: 13)
!121 = !DILocation(line: 55, column: 13, scope: !120)
!122 = !DILocation(line: 55, column: 23, scope: !120)
!123 = !DILocation(line: 55, column: 13, scope: !98)
!124 = !DILocation(line: 56, column: 26, scope: !125)
!125 = distinct !DILexicalBlock(scope: !120, file: !57, line: 55, column: 29)
!126 = !DILocation(line: 56, column: 23, scope: !125)
!127 = !DILocation(line: 56, column: 20, scope: !125)
!128 = !DILocation(line: 57, column: 26, scope: !125)
!129 = !DILocation(line: 57, column: 23, scope: !125)
!130 = !DILocation(line: 57, column: 20, scope: !125)
!131 = !DILocation(line: 58, column: 13, scope: !125)
!132 = !DILocation(line: 63, column: 13, scope: !133)
!133 = distinct !DILexicalBlock(scope: !98, file: !57, line: 63, column: 13)
!134 = !DILocation(line: 63, column: 18, scope: !133)
!135 = !DILocation(line: 63, column: 16, scope: !133)
!136 = !DILocation(line: 63, column: 25, scope: !133)
!137 = !DILocation(line: 63, column: 31, scope: !133)
!138 = !DILocation(line: 63, column: 29, scope: !133)
!139 = !DILocation(line: 63, column: 13, scope: !98)
!140 = !DILocation(line: 64, column: 13, scope: !133)
!141 = !DILocation(line: 65, column: 23, scope: !98)
!142 = !DILocation(line: 65, column: 26, scope: !98)
!143 = !DILocation(line: 65, column: 33, scope: !98)
!144 = !DILocation(line: 65, column: 12, scope: !98)
!145 = !DILocation(line: 65, column: 9, scope: !98)
!146 = !DILocation(line: 65, column: 21, scope: !98)
!147 = !DILocation(line: 66, column: 23, scope: !98)
!148 = !DILocation(line: 66, column: 26, scope: !98)
!149 = !DILocation(line: 66, column: 33, scope: !98)
!150 = !DILocation(line: 66, column: 12, scope: !98)
!151 = !DILocation(line: 66, column: 9, scope: !98)
!152 = !DILocation(line: 66, column: 21, scope: !98)
!153 = !DILocation(line: 67, column: 23, scope: !98)
!154 = !DILocation(line: 67, column: 26, scope: !98)
!155 = !DILocation(line: 67, column: 33, scope: !98)
!156 = !DILocation(line: 67, column: 12, scope: !98)
!157 = !DILocation(line: 67, column: 9, scope: !98)
!158 = !DILocation(line: 67, column: 21, scope: !98)
!159 = !DILocation(line: 68, column: 23, scope: !98)
!160 = !DILocation(line: 68, column: 26, scope: !98)
!161 = !DILocation(line: 68, column: 33, scope: !98)
!162 = !DILocation(line: 68, column: 12, scope: !98)
!163 = !DILocation(line: 68, column: 9, scope: !98)
!164 = !DILocation(line: 68, column: 21, scope: !98)
!165 = !DILocation(line: 69, column: 23, scope: !98)
!166 = !DILocation(line: 69, column: 26, scope: !98)
!167 = !DILocation(line: 69, column: 33, scope: !98)
!168 = !DILocation(line: 69, column: 12, scope: !98)
!169 = !DILocation(line: 69, column: 9, scope: !98)
!170 = !DILocation(line: 69, column: 21, scope: !98)
!171 = !DILocation(line: 70, column: 23, scope: !98)
!172 = !DILocation(line: 70, column: 26, scope: !98)
!173 = !DILocation(line: 70, column: 33, scope: !98)
!174 = !DILocation(line: 70, column: 12, scope: !98)
!175 = !DILocation(line: 70, column: 9, scope: !98)
!176 = !DILocation(line: 70, column: 21, scope: !98)
!177 = !DILocation(line: 71, column: 16, scope: !98)
!178 = !DILocation(line: 72, column: 16, scope: !98)
!179 = !DILocation(line: 73, column: 9, scope: !98)
!180 = !DILocation(line: 77, column: 5, scope: !56)
!181 = !DILocation(line: 78, column: 1, scope: !56)
!182 = distinct !DISubprogram(name: "predicate_06", scope: !12, file: !12, line: 36, type: !58, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, retainedNodes: !2)
!183 = !DILocalVariable(name: "buf", arg: 1, scope: !182, file: !12, line: 36, type: !60)
!184 = !DILocation(line: 36, column: 39, scope: !182)
!185 = !DILocalVariable(name: "len", arg: 2, scope: !182, file: !12, line: 36, type: !8)
!186 = !DILocation(line: 36, column: 57, scope: !182)
!187 = !DILocalVariable(name: "bp", scope: !182, file: !12, line: 38, type: !9)
!188 = !DILocation(line: 38, column: 19, scope: !182)
!189 = !DILocation(line: 38, column: 24, scope: !182)
!190 = !DILocalVariable(name: "ep", scope: !182, file: !12, line: 39, type: !9)
!191 = !DILocation(line: 39, column: 19, scope: !182)
!192 = !DILocation(line: 39, column: 24, scope: !182)
!193 = !DILocation(line: 39, column: 30, scope: !182)
!194 = !DILocation(line: 39, column: 28, scope: !182)
!195 = !DILocalVariable(name: "ndo_vflag", scope: !182, file: !12, line: 42, type: !24)
!196 = !DILocation(line: 42, column: 11, scope: !182)
!197 = !DILocalVariable(name: "caplen", scope: !182, file: !12, line: 43, type: !198)
!198 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !12, line: 22, baseType: !8)
!199 = !DILocation(line: 43, column: 11, scope: !182)
!200 = !DILocation(line: 43, column: 23, scope: !182)
!201 = !DILocalVariable(name: "length", scope: !182, file: !12, line: 44, type: !198)
!202 = !DILocation(line: 44, column: 11, scope: !182)
!203 = !DILocation(line: 44, column: 23, scope: !182)
!204 = !DILocalVariable(name: "pptr", scope: !182, file: !12, line: 46, type: !9)
!205 = !DILocation(line: 46, column: 19, scope: !182)
!206 = !DILocation(line: 46, column: 26, scope: !182)
!207 = !DILocalVariable(name: "tptr", scope: !182, file: !12, line: 47, type: !9)
!208 = !DILocation(line: 47, column: 19, scope: !182)
!209 = !DILocalVariable(name: "type", scope: !182, file: !12, line: 48, type: !8)
!210 = !DILocation(line: 48, column: 19, scope: !182)
!211 = !DILocalVariable(name: "tlen", scope: !182, file: !12, line: 48, type: !8)
!212 = !DILocation(line: 48, column: 25, scope: !182)
!213 = !DILocation(line: 49, column: 11, scope: !182)
!214 = !DILocation(line: 49, column: 28, scope: !182)
!215 = !DILocation(line: 49, column: 40, scope: !182)
!216 = !DILocation(line: 52, column: 9, scope: !217)
!217 = distinct !DILexicalBlock(scope: !182, file: !12, line: 52, column: 9)
!218 = !DILocation(line: 52, column: 16, scope: !217)
!219 = !DILocation(line: 52, column: 9, scope: !182)
!220 = !DILocation(line: 53, column: 9, scope: !217)
!221 = !DILocation(line: 55, column: 12, scope: !182)
!222 = !DILocation(line: 55, column: 10, scope: !182)
!223 = !DILocation(line: 60, column: 9, scope: !224)
!224 = distinct !DILexicalBlock(scope: !182, file: !12, line: 60, column: 9)
!225 = !DILocation(line: 60, column: 14, scope: !224)
!226 = !DILocation(line: 60, column: 33, scope: !224)
!227 = !DILocation(line: 60, column: 31, scope: !224)
!228 = !DILocation(line: 60, column: 9, scope: !182)
!229 = !DILocation(line: 61, column: 9, scope: !224)
!230 = !DILocation(line: 64, column: 10, scope: !182)
!231 = !DILocation(line: 66, column: 12, scope: !182)
!232 = !DILocation(line: 66, column: 20, scope: !182)
!233 = !DILocation(line: 66, column: 27, scope: !182)
!234 = !DILocation(line: 66, column: 25, scope: !182)
!235 = !DILocation(line: 66, column: 17, scope: !182)
!236 = !DILocation(line: 66, column: 5, scope: !182)
!237 = !DILocation(line: 70, column: 13, scope: !238)
!238 = distinct !DILexicalBlock(scope: !239, file: !12, line: 70, column: 13)
!239 = distinct !DILexicalBlock(scope: !182, file: !12, line: 66, column: 36)
!240 = !DILocation(line: 70, column: 18, scope: !238)
!241 = !DILocation(line: 70, column: 41, scope: !238)
!242 = !DILocation(line: 70, column: 39, scope: !238)
!243 = !DILocation(line: 70, column: 13, scope: !239)
!244 = !DILocation(line: 71, column: 13, scope: !238)
!245 = !DILocation(line: 77, column: 16, scope: !239)
!246 = !DILocation(line: 77, column: 14, scope: !239)
!247 = !DILocation(line: 78, column: 16, scope: !239)
!248 = !DILocation(line: 78, column: 14, scope: !239)
!249 = !DILocation(line: 79, column: 15, scope: !239)
!250 = !DILocation(line: 79, column: 27, scope: !239)
!251 = !DILocation(line: 80, column: 9, scope: !239)
!252 = !DILocation(line: 84, column: 5, scope: !182)
!253 = !DILocation(line: 85, column: 1, scope: !182)
