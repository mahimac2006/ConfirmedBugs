; ModuleID = '/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/klee_results/01_05/linked.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.cf_t = type { i8, [6 x i8] }

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"len\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"0 && \22BOTH_REACHABLE_01_05\22\00", align 1
@.str.3 = private unnamed_addr constant [78 x i8] c"/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/driver_01_05.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [15 x i8] c"int main(void)\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"MSG\00", align 1
@.str.1.6 = private unnamed_addr constant [5 x i8] c"RPY \00", align 1
@.str.2.7 = private unnamed_addr constant [5 x i8] c"ERR \00", align 1
@.str.3.8 = private unnamed_addr constant [5 x i8] c"ANS \00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"NUL \00", align 1
@.str.5.9 = private unnamed_addr constant [5 x i8] c"SEQ \00", align 1
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
  %17 = call i32 @predicate_01(i8* %15, i32 %16), !dbg !39
  store i32 %17, i32* %4, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata i32* %5, metadata !40, metadata !DIExpression()), !dbg !41
  %18 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !42
  %19 = load i32, i32* %3, align 4, !dbg !43
  %20 = call i32 @predicate_05(i8* %18, i32 %19), !dbg !44
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
define dso_local i32 @predicate_01(i8* %0, i32 %1) #0 !dbg !51 {
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
  call void @llvm.dbg.declare(metadata i8** %4, metadata !57, metadata !DIExpression()), !dbg !58
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata i8** %6, metadata !61, metadata !DIExpression()), !dbg !65
  %12 = load i8*, i8** %4, align 8, !dbg !66
  store i8* %12, i8** %6, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata i8** %7, metadata !67, metadata !DIExpression()), !dbg !68
  %13 = load i8*, i8** %4, align 8, !dbg !69
  %14 = load i32, i32* %5, align 4, !dbg !70
  %15 = zext i32 %14 to i64, !dbg !71
  %16 = getelementptr inbounds i8, i8* %13, i64 %15, !dbg !71
  store i8* %16, i8** %7, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata i32* %8, metadata !72, metadata !DIExpression()), !dbg !73
  store i32 1, i32* %8, align 4, !dbg !73
  call void @llvm.dbg.declare(metadata i32* %9, metadata !74, metadata !DIExpression()), !dbg !75
  store i32 0, i32* %9, align 4, !dbg !75
  call void @llvm.dbg.declare(metadata i32* %10, metadata !76, metadata !DIExpression()), !dbg !78
  %17 = load i32, i32* %5, align 4, !dbg !79
  store i32 %17, i32* %10, align 4, !dbg !78
  call void @llvm.dbg.declare(metadata %struct.cf_t* %11, metadata !80, metadata !DIExpression()), !dbg !88
  %18 = load i32, i32* %8, align 4, !dbg !89
  %cond = icmp eq i32 %18, 1, !dbg !90
  br i1 %cond, label %19, label %125, !dbg !90

19:                                               ; preds = %2
  %20 = load i8*, i8** %6, align 8, !dbg !91
  %21 = load i32, i32* %9, align 4, !dbg !94
  %22 = sext i32 %21 to i64, !dbg !95
  %23 = getelementptr inbounds i8, i8* %20, i64 %22, !dbg !95
  %24 = getelementptr inbounds i8, i8* %23, i64 2, !dbg !96
  %25 = load i8*, i8** %7, align 8, !dbg !97
  %26 = icmp ugt i8* %24, %25, !dbg !98
  br i1 %26, label %27, label %28, !dbg !99

27:                                               ; preds = %19
  store i32 0, i32* %3, align 4, !dbg !100
  br label %126, !dbg !100

28:                                               ; preds = %19
  %29 = load i8*, i8** %6, align 8, !dbg !101
  %30 = load i32, i32* %9, align 4, !dbg !102
  %31 = add nsw i32 %30, 0, !dbg !103
  %32 = sext i32 %31 to i64, !dbg !101
  %33 = getelementptr inbounds i8, i8* %29, i64 %32, !dbg !101
  %34 = load i8, i8* %33, align 1, !dbg !101
  %35 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 0, !dbg !104
  store i8 %34, i8* %35, align 1, !dbg !105
  %36 = load i8*, i8** %6, align 8, !dbg !106
  %37 = load i32, i32* %9, align 4, !dbg !107
  %38 = add nsw i32 %37, 1, !dbg !108
  %39 = sext i32 %38 to i64, !dbg !106
  %40 = getelementptr inbounds i8, i8* %36, i64 %39, !dbg !106
  %41 = load i8, i8* %40, align 1, !dbg !106
  %42 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 1, !dbg !109
  %43 = getelementptr inbounds [6 x i8], [6 x i8]* %42, i64 0, i64 0, !dbg !110
  store i8 %41, i8* %43, align 1, !dbg !111
  %44 = load i32, i32* %9, align 4, !dbg !112
  %45 = add nsw i32 %44, 2, !dbg !112
  store i32 %45, i32* %9, align 4, !dbg !112
  %46 = load i32, i32* %10, align 4, !dbg !113
  %47 = sub i32 %46, 2, !dbg !113
  store i32 %47, i32* %10, align 4, !dbg !113
  %48 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 0, !dbg !114
  %49 = load i8, i8* %48, align 1, !dbg !114
  %50 = zext i8 %49 to i32, !dbg !116
  %51 = icmp ne i32 %50, 6, !dbg !117
  br i1 %51, label %52, label %63, !dbg !118

52:                                               ; preds = %28
  %53 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 0, !dbg !119
  %54 = load i8, i8* %53, align 1, !dbg !119
  %55 = zext i8 %54 to i32, !dbg !121
  %56 = load i32, i32* %9, align 4, !dbg !122
  %57 = add nsw i32 %56, %55, !dbg !122
  store i32 %57, i32* %9, align 4, !dbg !122
  %58 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 0, !dbg !123
  %59 = load i8, i8* %58, align 1, !dbg !123
  %60 = zext i8 %59 to i32, !dbg !124
  %61 = load i32, i32* %10, align 4, !dbg !125
  %62 = sub i32 %61, %60, !dbg !125
  store i32 %62, i32* %10, align 4, !dbg !125
  br label %125, !dbg !126

63:                                               ; preds = %28
  %64 = load i8*, i8** %6, align 8, !dbg !127
  %65 = load i32, i32* %9, align 4, !dbg !129
  %66 = sext i32 %65 to i64, !dbg !130
  %67 = getelementptr inbounds i8, i8* %64, i64 %66, !dbg !130
  %68 = getelementptr inbounds i8, i8* %67, i64 6, !dbg !131
  %69 = load i8*, i8** %7, align 8, !dbg !132
  %70 = icmp ugt i8* %68, %69, !dbg !133
  br i1 %70, label %71, label %72, !dbg !134

71:                                               ; preds = %63
  store i32 0, i32* %3, align 4, !dbg !135
  br label %126, !dbg !135

72:                                               ; preds = %63
  %73 = load i8*, i8** %6, align 8, !dbg !136
  %74 = load i32, i32* %9, align 4, !dbg !137
  %75 = add nsw i32 %74, 0, !dbg !138
  %76 = sext i32 %75 to i64, !dbg !136
  %77 = getelementptr inbounds i8, i8* %73, i64 %76, !dbg !136
  %78 = load i8, i8* %77, align 1, !dbg !136
  %79 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 1, !dbg !139
  %80 = getelementptr inbounds [6 x i8], [6 x i8]* %79, i64 0, i64 0, !dbg !140
  store i8 %78, i8* %80, align 1, !dbg !141
  %81 = load i8*, i8** %6, align 8, !dbg !142
  %82 = load i32, i32* %9, align 4, !dbg !143
  %83 = add nsw i32 %82, 1, !dbg !144
  %84 = sext i32 %83 to i64, !dbg !142
  %85 = getelementptr inbounds i8, i8* %81, i64 %84, !dbg !142
  %86 = load i8, i8* %85, align 1, !dbg !142
  %87 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 1, !dbg !145
  %88 = getelementptr inbounds [6 x i8], [6 x i8]* %87, i64 0, i64 1, !dbg !146
  store i8 %86, i8* %88, align 1, !dbg !147
  %89 = load i8*, i8** %6, align 8, !dbg !148
  %90 = load i32, i32* %9, align 4, !dbg !149
  %91 = add nsw i32 %90, 2, !dbg !150
  %92 = sext i32 %91 to i64, !dbg !148
  %93 = getelementptr inbounds i8, i8* %89, i64 %92, !dbg !148
  %94 = load i8, i8* %93, align 1, !dbg !148
  %95 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 1, !dbg !151
  %96 = getelementptr inbounds [6 x i8], [6 x i8]* %95, i64 0, i64 2, !dbg !152
  store i8 %94, i8* %96, align 1, !dbg !153
  %97 = load i8*, i8** %6, align 8, !dbg !154
  %98 = load i32, i32* %9, align 4, !dbg !155
  %99 = add nsw i32 %98, 3, !dbg !156
  %100 = sext i32 %99 to i64, !dbg !154
  %101 = getelementptr inbounds i8, i8* %97, i64 %100, !dbg !154
  %102 = load i8, i8* %101, align 1, !dbg !154
  %103 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 1, !dbg !157
  %104 = getelementptr inbounds [6 x i8], [6 x i8]* %103, i64 0, i64 3, !dbg !158
  store i8 %102, i8* %104, align 1, !dbg !159
  %105 = load i8*, i8** %6, align 8, !dbg !160
  %106 = load i32, i32* %9, align 4, !dbg !161
  %107 = add nsw i32 %106, 4, !dbg !162
  %108 = sext i32 %107 to i64, !dbg !160
  %109 = getelementptr inbounds i8, i8* %105, i64 %108, !dbg !160
  %110 = load i8, i8* %109, align 1, !dbg !160
  %111 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 1, !dbg !163
  %112 = getelementptr inbounds [6 x i8], [6 x i8]* %111, i64 0, i64 4, !dbg !164
  store i8 %110, i8* %112, align 1, !dbg !165
  %113 = load i8*, i8** %6, align 8, !dbg !166
  %114 = load i32, i32* %9, align 4, !dbg !167
  %115 = add nsw i32 %114, 5, !dbg !168
  %116 = sext i32 %115 to i64, !dbg !166
  %117 = getelementptr inbounds i8, i8* %113, i64 %116, !dbg !166
  %118 = load i8, i8* %117, align 1, !dbg !166
  %119 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %11, i32 0, i32 1, !dbg !169
  %120 = getelementptr inbounds [6 x i8], [6 x i8]* %119, i64 0, i64 5, !dbg !170
  store i8 %118, i8* %120, align 1, !dbg !171
  %121 = load i32, i32* %9, align 4, !dbg !172
  %122 = add nsw i32 %121, 6, !dbg !172
  store i32 %122, i32* %9, align 4, !dbg !172
  %123 = load i32, i32* %10, align 4, !dbg !173
  %124 = sub i32 %123, 6, !dbg !173
  store i32 %124, i32* %10, align 4, !dbg !173
  br label %125, !dbg !174

125:                                              ; preds = %2, %72, %52
  store i32 1, i32* %3, align 4, !dbg !175
  br label %126, !dbg !175

126:                                              ; preds = %125, %71, %27
  %127 = load i32, i32* %3, align 4, !dbg !176
  ret i32 %127, !dbg !176
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @predicate_05(i8* %0, i32 %1) #0 !dbg !177 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !179, metadata !DIExpression()), !dbg !180
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !181, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.declare(metadata i8** %6, metadata !183, metadata !DIExpression()), !dbg !187
  %8 = load i8*, i8** %4, align 8, !dbg !188
  store i8* %8, i8** %6, align 8, !dbg !187
  call void @llvm.dbg.declare(metadata i8** %7, metadata !189, metadata !DIExpression()), !dbg !190
  %9 = load i8*, i8** %4, align 8, !dbg !191
  %10 = load i32, i32* %5, align 4, !dbg !192
  %11 = zext i32 %10 to i64, !dbg !193
  %12 = getelementptr inbounds i8, i8* %9, i64 %11, !dbg !193
  store i8* %12, i8** %7, align 8, !dbg !190
  %13 = load i8*, i8** %6, align 8, !dbg !194
  %14 = load i32, i32* %5, align 4, !dbg !196
  %15 = load i8*, i8** %7, align 8, !dbg !197
  %16 = call i32 @l_strnstart_reaches(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 4, i8* %13, i32 %14, i8* %15), !dbg !198
  %17 = icmp ne i32 %16, 0, !dbg !198
  br i1 %17, label %18, label %19, !dbg !199

18:                                               ; preds = %2
  store i32 1, i32* %3, align 4, !dbg !200
  br label %62, !dbg !200

19:                                               ; preds = %2
  %20 = load i8*, i8** %6, align 8, !dbg !201
  %21 = load i32, i32* %5, align 4, !dbg !203
  %22 = load i8*, i8** %7, align 8, !dbg !204
  %23 = call i32 @l_strnstart_reaches(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1.6, i64 0, i64 0), i32 4, i8* %20, i32 %21, i8* %22), !dbg !205
  %24 = icmp ne i32 %23, 0, !dbg !205
  br i1 %24, label %25, label %26, !dbg !206

25:                                               ; preds = %19
  store i32 1, i32* %3, align 4, !dbg !207
  br label %62, !dbg !207

26:                                               ; preds = %19
  %27 = load i8*, i8** %6, align 8, !dbg !208
  %28 = load i32, i32* %5, align 4, !dbg !210
  %29 = load i8*, i8** %7, align 8, !dbg !211
  %30 = call i32 @l_strnstart_reaches(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2.7, i64 0, i64 0), i32 4, i8* %27, i32 %28, i8* %29), !dbg !212
  %31 = icmp ne i32 %30, 0, !dbg !212
  br i1 %31, label %32, label %33, !dbg !213

32:                                               ; preds = %26
  store i32 1, i32* %3, align 4, !dbg !214
  br label %62, !dbg !214

33:                                               ; preds = %26
  %34 = load i8*, i8** %6, align 8, !dbg !215
  %35 = load i32, i32* %5, align 4, !dbg !217
  %36 = load i8*, i8** %7, align 8, !dbg !218
  %37 = call i32 @l_strnstart_reaches(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3.8, i64 0, i64 0), i32 4, i8* %34, i32 %35, i8* %36), !dbg !219
  %38 = icmp ne i32 %37, 0, !dbg !219
  br i1 %38, label %39, label %40, !dbg !220

39:                                               ; preds = %33
  store i32 1, i32* %3, align 4, !dbg !221
  br label %62, !dbg !221

40:                                               ; preds = %33
  %41 = load i8*, i8** %6, align 8, !dbg !222
  %42 = load i32, i32* %5, align 4, !dbg !224
  %43 = load i8*, i8** %7, align 8, !dbg !225
  %44 = call i32 @l_strnstart_reaches(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i64 0, i64 0), i32 4, i8* %41, i32 %42, i8* %43), !dbg !226
  %45 = icmp ne i32 %44, 0, !dbg !226
  br i1 %45, label %46, label %47, !dbg !227

46:                                               ; preds = %40
  store i32 1, i32* %3, align 4, !dbg !228
  br label %62, !dbg !228

47:                                               ; preds = %40
  %48 = load i8*, i8** %6, align 8, !dbg !229
  %49 = load i32, i32* %5, align 4, !dbg !231
  %50 = load i8*, i8** %7, align 8, !dbg !232
  %51 = call i32 @l_strnstart_reaches(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5.9, i64 0, i64 0), i32 4, i8* %48, i32 %49, i8* %50), !dbg !233
  %52 = icmp ne i32 %51, 0, !dbg !233
  br i1 %52, label %53, label %54, !dbg !234

53:                                               ; preds = %47
  store i32 1, i32* %3, align 4, !dbg !235
  br label %62, !dbg !235

54:                                               ; preds = %47
  %55 = load i8*, i8** %6, align 8, !dbg !236
  %56 = load i32, i32* %5, align 4, !dbg !238
  %57 = load i8*, i8** %7, align 8, !dbg !239
  %58 = call i32 @l_strnstart_reaches(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i64 0, i64 0), i32 4, i8* %55, i32 %56, i8* %57), !dbg !240
  %59 = icmp ne i32 %58, 0, !dbg !240
  br i1 %59, label %60, label %61, !dbg !241

60:                                               ; preds = %54
  store i32 1, i32* %3, align 4, !dbg !242
  br label %62, !dbg !242

61:                                               ; preds = %54
  store i32 0, i32* %3, align 4, !dbg !243
  br label %62, !dbg !243

62:                                               ; preds = %61, %60, %53, %46, %39, %32, %25, %18
  %63 = load i32, i32* %3, align 4, !dbg !244
  ret i32 %63, !dbg !244
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @l_strnstart_reaches(i8* %0, i32 %1, i8* %2, i32 %3, i8* %4) #0 !dbg !245 {
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  store i8* %0, i8** %7, align 8
  call void @llvm.dbg.declare(metadata i8** %7, metadata !252, metadata !DIExpression()), !dbg !253
  store i32 %1, i32* %8, align 4
  call void @llvm.dbg.declare(metadata i32* %8, metadata !254, metadata !DIExpression()), !dbg !255
  store i8* %2, i8** %9, align 8
  call void @llvm.dbg.declare(metadata i8** %9, metadata !256, metadata !DIExpression()), !dbg !257
  store i32 %3, i32* %10, align 4
  call void @llvm.dbg.declare(metadata i32* %10, metadata !258, metadata !DIExpression()), !dbg !259
  store i8* %4, i8** %11, align 8
  call void @llvm.dbg.declare(metadata i8** %11, metadata !260, metadata !DIExpression()), !dbg !261
  %12 = load i8*, i8** %9, align 8, !dbg !262
  %13 = load i32, i32* %8, align 4, !dbg !264
  %14 = zext i32 %13 to i64, !dbg !265
  %15 = getelementptr inbounds i8, i8* %12, i64 %14, !dbg !265
  %16 = load i8*, i8** %11, align 8, !dbg !266
  %17 = icmp ugt i8* %15, %16, !dbg !267
  br i1 %17, label %18, label %19, !dbg !268

18:                                               ; preds = %5
  store i32 0, i32* %6, align 4, !dbg !269
  br label %26, !dbg !269

19:                                               ; preds = %5
  %20 = load i32, i32* %8, align 4, !dbg !270
  %21 = load i32, i32* %10, align 4, !dbg !272
  %22 = icmp ugt i32 %20, %21, !dbg !273
  br i1 %22, label %23, label %24, !dbg !274

23:                                               ; preds = %19
  store i32 0, i32* %6, align 4, !dbg !275
  br label %26, !dbg !275

24:                                               ; preds = %19
  %25 = load i8*, i8** %7, align 8, !dbg !276
  store i32 1, i32* %6, align 4, !dbg !277
  br label %26, !dbg !277

26:                                               ; preds = %24, %23, %18
  %27 = load i32, i32* %6, align 4, !dbg !278
  ret i32 %27, !dbg !278
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
!1 = !DIFile(filename: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/driver_01_05.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!2 = !{}
!3 = distinct !DICompileUnit(language: DW_LANG_C99, file: !4, producer: "clang version 13.0.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!4 = !DIFile(filename: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/predicate_01.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!5 = distinct !DICompileUnit(language: DW_LANG_C99, file: !6, producer: "clang version 13.0.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!6 = !DIFile(filename: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition/predicate_05.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!7 = !{!"clang version 13.0.1"}
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 28, type: !15, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "driver_01_05.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
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
!35 = !DILocalVariable(name: "r01", scope: !13, file: !14, line: 38, type: !17)
!36 = !DILocation(line: 38, column: 9, scope: !13)
!37 = !DILocation(line: 38, column: 28, scope: !13)
!38 = !DILocation(line: 38, column: 33, scope: !13)
!39 = !DILocation(line: 38, column: 15, scope: !13)
!40 = !DILocalVariable(name: "r05", scope: !13, file: !14, line: 39, type: !17)
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
!51 = distinct !DISubprogram(name: "predicate_01", scope: !52, file: !52, line: 24, type: !53, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !3, retainedNodes: !2)
!52 = !DIFile(filename: "predicate_01.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!53 = !DISubroutineType(types: !54)
!54 = !{!17, !55, !25}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !20)
!57 = !DILocalVariable(name: "buf", arg: 1, scope: !51, file: !52, line: 24, type: !55)
!58 = !DILocation(line: 24, column: 39, scope: !51)
!59 = !DILocalVariable(name: "len", arg: 2, scope: !51, file: !52, line: 24, type: !25)
!60 = !DILocation(line: 24, column: 57, scope: !51)
!61 = !DILocalVariable(name: "bp", scope: !51, file: !52, line: 26, type: !62)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !64)
!64 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !52, line: 14, baseType: !20)
!65 = !DILocation(line: 26, column: 19, scope: !51)
!66 = !DILocation(line: 26, column: 24, scope: !51)
!67 = !DILocalVariable(name: "ep", scope: !51, file: !52, line: 27, type: !62)
!68 = !DILocation(line: 27, column: 19, scope: !51)
!69 = !DILocation(line: 27, column: 24, scope: !51)
!70 = !DILocation(line: 27, column: 30, scope: !51)
!71 = !DILocation(line: 27, column: 28, scope: !51)
!72 = !DILocalVariable(name: "element", scope: !51, file: !52, line: 32, type: !17)
!73 = !DILocation(line: 32, column: 11, scope: !51)
!74 = !DILocalVariable(name: "offset", scope: !51, file: !52, line: 33, type: !17)
!75 = !DILocation(line: 33, column: 11, scope: !51)
!76 = !DILocalVariable(name: "length", scope: !51, file: !52, line: 34, type: !77)
!77 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !52, line: 15, baseType: !25)
!78 = !DILocation(line: 34, column: 11, scope: !51)
!79 = !DILocation(line: 34, column: 21, scope: !51)
!80 = !DILocalVariable(name: "cf", scope: !51, file: !52, line: 36, type: !81)
!81 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "cf_t", file: !52, line: 18, size: 56, elements: !82)
!82 = !{!83, !84}
!83 = !DIDerivedType(tag: DW_TAG_member, name: "length", scope: !81, file: !52, line: 18, baseType: !20, size: 8)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !81, file: !52, line: 18, baseType: !85, size: 48, offset: 8)
!85 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 48, elements: !86)
!86 = !{!87}
!87 = !DISubrange(count: 6)
!88 = !DILocation(line: 36, column: 17, scope: !51)
!89 = !DILocation(line: 39, column: 13, scope: !51)
!90 = !DILocation(line: 39, column: 5, scope: !51)
!91 = !DILocation(line: 48, column: 13, scope: !92)
!92 = distinct !DILexicalBlock(scope: !93, file: !52, line: 48, column: 13)
!93 = distinct !DILexicalBlock(scope: !51, file: !52, line: 39, column: 22)
!94 = !DILocation(line: 48, column: 18, scope: !92)
!95 = !DILocation(line: 48, column: 16, scope: !92)
!96 = !DILocation(line: 48, column: 25, scope: !92)
!97 = !DILocation(line: 48, column: 31, scope: !92)
!98 = !DILocation(line: 48, column: 29, scope: !92)
!99 = !DILocation(line: 48, column: 13, scope: !93)
!100 = !DILocation(line: 49, column: 13, scope: !92)
!101 = !DILocation(line: 50, column: 23, scope: !93)
!102 = !DILocation(line: 50, column: 26, scope: !93)
!103 = !DILocation(line: 50, column: 33, scope: !93)
!104 = !DILocation(line: 50, column: 12, scope: !93)
!105 = !DILocation(line: 50, column: 21, scope: !93)
!106 = !DILocation(line: 51, column: 23, scope: !93)
!107 = !DILocation(line: 51, column: 26, scope: !93)
!108 = !DILocation(line: 51, column: 33, scope: !93)
!109 = !DILocation(line: 51, column: 12, scope: !93)
!110 = !DILocation(line: 51, column: 9, scope: !93)
!111 = !DILocation(line: 51, column: 21, scope: !93)
!112 = !DILocation(line: 52, column: 16, scope: !93)
!113 = !DILocation(line: 53, column: 16, scope: !93)
!114 = !DILocation(line: 55, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !93, file: !52, line: 55, column: 13)
!116 = !DILocation(line: 55, column: 13, scope: !115)
!117 = !DILocation(line: 55, column: 23, scope: !115)
!118 = !DILocation(line: 55, column: 13, scope: !93)
!119 = !DILocation(line: 56, column: 26, scope: !120)
!120 = distinct !DILexicalBlock(scope: !115, file: !52, line: 55, column: 29)
!121 = !DILocation(line: 56, column: 23, scope: !120)
!122 = !DILocation(line: 56, column: 20, scope: !120)
!123 = !DILocation(line: 57, column: 26, scope: !120)
!124 = !DILocation(line: 57, column: 23, scope: !120)
!125 = !DILocation(line: 57, column: 20, scope: !120)
!126 = !DILocation(line: 58, column: 13, scope: !120)
!127 = !DILocation(line: 63, column: 13, scope: !128)
!128 = distinct !DILexicalBlock(scope: !93, file: !52, line: 63, column: 13)
!129 = !DILocation(line: 63, column: 18, scope: !128)
!130 = !DILocation(line: 63, column: 16, scope: !128)
!131 = !DILocation(line: 63, column: 25, scope: !128)
!132 = !DILocation(line: 63, column: 31, scope: !128)
!133 = !DILocation(line: 63, column: 29, scope: !128)
!134 = !DILocation(line: 63, column: 13, scope: !93)
!135 = !DILocation(line: 64, column: 13, scope: !128)
!136 = !DILocation(line: 65, column: 23, scope: !93)
!137 = !DILocation(line: 65, column: 26, scope: !93)
!138 = !DILocation(line: 65, column: 33, scope: !93)
!139 = !DILocation(line: 65, column: 12, scope: !93)
!140 = !DILocation(line: 65, column: 9, scope: !93)
!141 = !DILocation(line: 65, column: 21, scope: !93)
!142 = !DILocation(line: 66, column: 23, scope: !93)
!143 = !DILocation(line: 66, column: 26, scope: !93)
!144 = !DILocation(line: 66, column: 33, scope: !93)
!145 = !DILocation(line: 66, column: 12, scope: !93)
!146 = !DILocation(line: 66, column: 9, scope: !93)
!147 = !DILocation(line: 66, column: 21, scope: !93)
!148 = !DILocation(line: 67, column: 23, scope: !93)
!149 = !DILocation(line: 67, column: 26, scope: !93)
!150 = !DILocation(line: 67, column: 33, scope: !93)
!151 = !DILocation(line: 67, column: 12, scope: !93)
!152 = !DILocation(line: 67, column: 9, scope: !93)
!153 = !DILocation(line: 67, column: 21, scope: !93)
!154 = !DILocation(line: 68, column: 23, scope: !93)
!155 = !DILocation(line: 68, column: 26, scope: !93)
!156 = !DILocation(line: 68, column: 33, scope: !93)
!157 = !DILocation(line: 68, column: 12, scope: !93)
!158 = !DILocation(line: 68, column: 9, scope: !93)
!159 = !DILocation(line: 68, column: 21, scope: !93)
!160 = !DILocation(line: 69, column: 23, scope: !93)
!161 = !DILocation(line: 69, column: 26, scope: !93)
!162 = !DILocation(line: 69, column: 33, scope: !93)
!163 = !DILocation(line: 69, column: 12, scope: !93)
!164 = !DILocation(line: 69, column: 9, scope: !93)
!165 = !DILocation(line: 69, column: 21, scope: !93)
!166 = !DILocation(line: 70, column: 23, scope: !93)
!167 = !DILocation(line: 70, column: 26, scope: !93)
!168 = !DILocation(line: 70, column: 33, scope: !93)
!169 = !DILocation(line: 70, column: 12, scope: !93)
!170 = !DILocation(line: 70, column: 9, scope: !93)
!171 = !DILocation(line: 70, column: 21, scope: !93)
!172 = !DILocation(line: 71, column: 16, scope: !93)
!173 = !DILocation(line: 72, column: 16, scope: !93)
!174 = !DILocation(line: 73, column: 9, scope: !93)
!175 = !DILocation(line: 77, column: 5, scope: !51)
!176 = !DILocation(line: 78, column: 1, scope: !51)
!177 = distinct !DISubprogram(name: "predicate_05", scope: !178, file: !178, line: 46, type: !53, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, retainedNodes: !2)
!178 = !DIFile(filename: "predicate_05.c", directory: "/home/vishva/ChainingPaper/confirmed/tcpdump-4.9.2/composition")
!179 = !DILocalVariable(name: "buf", arg: 1, scope: !177, file: !178, line: 46, type: !55)
!180 = !DILocation(line: 46, column: 39, scope: !177)
!181 = !DILocalVariable(name: "len", arg: 2, scope: !177, file: !178, line: 46, type: !25)
!182 = !DILocation(line: 46, column: 57, scope: !177)
!183 = !DILocalVariable(name: "bp", scope: !177, file: !178, line: 48, type: !184)
!184 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !185, size: 64)
!185 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !186)
!186 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !178, line: 18, baseType: !20)
!187 = !DILocation(line: 48, column: 19, scope: !177)
!188 = !DILocation(line: 48, column: 24, scope: !177)
!189 = !DILocalVariable(name: "ep", scope: !177, file: !178, line: 49, type: !184)
!190 = !DILocation(line: 49, column: 19, scope: !177)
!191 = !DILocation(line: 49, column: 24, scope: !177)
!192 = !DILocation(line: 49, column: 30, scope: !177)
!193 = !DILocation(line: 49, column: 28, scope: !177)
!194 = !DILocation(line: 55, column: 40, scope: !195)
!195 = distinct !DILexicalBlock(scope: !177, file: !178, line: 55, column: 9)
!196 = !DILocation(line: 55, column: 44, scope: !195)
!197 = !DILocation(line: 55, column: 49, scope: !195)
!198 = !DILocation(line: 55, column: 9, scope: !195)
!199 = !DILocation(line: 55, column: 9, scope: !177)
!200 = !DILocation(line: 55, column: 54, scope: !195)
!201 = !DILocation(line: 56, column: 40, scope: !202)
!202 = distinct !DILexicalBlock(scope: !177, file: !178, line: 56, column: 9)
!203 = !DILocation(line: 56, column: 44, scope: !202)
!204 = !DILocation(line: 56, column: 49, scope: !202)
!205 = !DILocation(line: 56, column: 9, scope: !202)
!206 = !DILocation(line: 56, column: 9, scope: !177)
!207 = !DILocation(line: 56, column: 54, scope: !202)
!208 = !DILocation(line: 57, column: 40, scope: !209)
!209 = distinct !DILexicalBlock(scope: !177, file: !178, line: 57, column: 9)
!210 = !DILocation(line: 57, column: 44, scope: !209)
!211 = !DILocation(line: 57, column: 49, scope: !209)
!212 = !DILocation(line: 57, column: 9, scope: !209)
!213 = !DILocation(line: 57, column: 9, scope: !177)
!214 = !DILocation(line: 57, column: 54, scope: !209)
!215 = !DILocation(line: 58, column: 40, scope: !216)
!216 = distinct !DILexicalBlock(scope: !177, file: !178, line: 58, column: 9)
!217 = !DILocation(line: 58, column: 44, scope: !216)
!218 = !DILocation(line: 58, column: 49, scope: !216)
!219 = !DILocation(line: 58, column: 9, scope: !216)
!220 = !DILocation(line: 58, column: 9, scope: !177)
!221 = !DILocation(line: 58, column: 54, scope: !216)
!222 = !DILocation(line: 59, column: 40, scope: !223)
!223 = distinct !DILexicalBlock(scope: !177, file: !178, line: 59, column: 9)
!224 = !DILocation(line: 59, column: 44, scope: !223)
!225 = !DILocation(line: 59, column: 49, scope: !223)
!226 = !DILocation(line: 59, column: 9, scope: !223)
!227 = !DILocation(line: 59, column: 9, scope: !177)
!228 = !DILocation(line: 59, column: 54, scope: !223)
!229 = !DILocation(line: 60, column: 40, scope: !230)
!230 = distinct !DILexicalBlock(scope: !177, file: !178, line: 60, column: 9)
!231 = !DILocation(line: 60, column: 44, scope: !230)
!232 = !DILocation(line: 60, column: 49, scope: !230)
!233 = !DILocation(line: 60, column: 9, scope: !230)
!234 = !DILocation(line: 60, column: 9, scope: !177)
!235 = !DILocation(line: 60, column: 54, scope: !230)
!236 = !DILocation(line: 61, column: 40, scope: !237)
!237 = distinct !DILexicalBlock(scope: !177, file: !178, line: 61, column: 9)
!238 = !DILocation(line: 61, column: 44, scope: !237)
!239 = !DILocation(line: 61, column: 49, scope: !237)
!240 = !DILocation(line: 61, column: 9, scope: !237)
!241 = !DILocation(line: 61, column: 9, scope: !177)
!242 = !DILocation(line: 61, column: 54, scope: !237)
!243 = !DILocation(line: 63, column: 5, scope: !177)
!244 = !DILocation(line: 64, column: 1, scope: !177)
!245 = distinct !DISubprogram(name: "l_strnstart_reaches", scope: !178, file: !178, line: 26, type: !246, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !5, retainedNodes: !2)
!246 = !DISubroutineType(types: !247)
!247 = !{!17, !248, !251, !184, !251, !184}
!248 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !249, size: 64)
!249 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !250)
!250 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!251 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !178, line: 19, baseType: !25)
!252 = !DILocalVariable(name: "tstr1", arg: 1, scope: !245, file: !178, line: 26, type: !248)
!253 = !DILocation(line: 26, column: 44, scope: !245)
!254 = !DILocalVariable(name: "tl1", arg: 2, scope: !245, file: !178, line: 26, type: !251)
!255 = !DILocation(line: 26, column: 57, scope: !245)
!256 = !DILocalVariable(name: "str2", arg: 3, scope: !245, file: !178, line: 27, type: !184)
!257 = !DILocation(line: 27, column: 46, scope: !245)
!258 = !DILocalVariable(name: "l2", arg: 4, scope: !245, file: !178, line: 27, type: !251)
!259 = !DILocation(line: 27, column: 58, scope: !245)
!260 = !DILocalVariable(name: "ep", arg: 5, scope: !245, file: !178, line: 28, type: !184)
!261 = !DILocation(line: 28, column: 46, scope: !245)
!262 = !DILocation(line: 34, column: 9, scope: !263)
!263 = distinct !DILexicalBlock(scope: !245, file: !178, line: 34, column: 9)
!264 = !DILocation(line: 34, column: 16, scope: !263)
!265 = !DILocation(line: 34, column: 14, scope: !263)
!266 = !DILocation(line: 34, column: 22, scope: !263)
!267 = !DILocation(line: 34, column: 20, scope: !263)
!268 = !DILocation(line: 34, column: 9, scope: !245)
!269 = !DILocation(line: 35, column: 9, scope: !263)
!270 = !DILocation(line: 38, column: 9, scope: !271)
!271 = distinct !DILexicalBlock(scope: !245, file: !178, line: 38, column: 9)
!272 = !DILocation(line: 38, column: 15, scope: !271)
!273 = !DILocation(line: 38, column: 13, scope: !271)
!274 = !DILocation(line: 38, column: 9, scope: !245)
!275 = !DILocation(line: 39, column: 9, scope: !271)
!276 = !DILocation(line: 42, column: 11, scope: !245)
!277 = !DILocation(line: 43, column: 5, scope: !245)
!278 = !DILocation(line: 44, column: 1, scope: !245)
