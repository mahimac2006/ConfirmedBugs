; ModuleID = '/app/se_runs/sailor_engine/tcpdump-4.9.2/093_print-cdp.c_322_local_cpp_cwe-125-oob-read/harness/slice.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.netdissect_options = type { i32 }

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@.str.3 = private unnamed_addr constant [28 x i8] c"SPINE_PROBE:cdp_print:ENTRY\00", align 1
@.str.1 = private unnamed_addr constant [34 x i8] c"SPINE_PROBE:cdp_print:LABEL_trunc\00", align 1
@.str.2 = private unnamed_addr constant [33 x i8] c"SPINE_PROBE:cdp_print_addr:ENTRY\00", align 1
@.str.3.4 = private unnamed_addr constant [108 x i8] c"/app/se_runs/sailor_engine/tcpdump-4.9.2/093_print-cdp.c_322_local_cpp_cwe-125-oob-read/harness/print-cdp.c\00", align 1
@.str.4 = private unnamed_addr constant [29 x i8] c"SAILOR OOB: buffer too small\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"sailor.ptr.err\00", align 1
@.str.6 = private unnamed_addr constant [9 x i8] zeroinitializer, align 1
@.str.7 = private unnamed_addr constant [27 x i8] c"0 && \22SAILOR_SINK_REACHED\22\00", align 1
@__PRETTY_FUNCTION__.cdp_print_addr = private unnamed_addr constant [62 x i8] c"int cdp_print_addr(netdissect_options *, const u_char *, int)\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !37 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.netdissect_options*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %2, metadata !42, metadata !DIExpression()), !dbg !43
  %6 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 4) #6, !dbg !44
  %7 = bitcast i8* %6 to %struct.netdissect_options*, !dbg !45
  store %struct.netdissect_options* %7, %struct.netdissect_options** %2, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i8** %3, metadata !46, metadata !DIExpression()), !dbg !47
  %8 = call noalias i8* @calloc(i64 noundef 64, i64 noundef 1) #6, !dbg !48
  store i8* %8, i8** %3, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i32* %4, metadata !49, metadata !DIExpression()), !dbg !51
  store i32 64, i32* %4, align 4, !dbg !51
  call void @llvm.dbg.declare(metadata i32* %5, metadata !52, metadata !DIExpression()), !dbg !53
  store i32 64, i32* %5, align 4, !dbg !53
  %9 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !54
  %10 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %9, i32 0, i32 0, !dbg !55
  store i32 1, i32* %10, align 4, !dbg !56
  %11 = load i8*, i8** %3, align 8, !dbg !57
  call void @klee_make_symbolic(i8* noundef %11, i64 noundef 64, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !58
  %12 = load i8*, i8** %3, align 8, !dbg !59
  %13 = getelementptr inbounds i8, i8* %12, i64 0, !dbg !59
  store i8 0, i8* %13, align 1, !dbg !60
  %14 = load i8*, i8** %3, align 8, !dbg !61
  %15 = getelementptr inbounds i8, i8* %14, i64 1, !dbg !61
  store i8 0, i8* %15, align 1, !dbg !62
  %16 = load i8*, i8** %3, align 8, !dbg !63
  %17 = getelementptr inbounds i8, i8* %16, i64 2, !dbg !63
  store i8 0, i8* %17, align 1, !dbg !64
  %18 = load i8*, i8** %3, align 8, !dbg !65
  %19 = getelementptr inbounds i8, i8* %18, i64 3, !dbg !65
  store i8 16, i8* %19, align 1, !dbg !66
  %20 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !67
  %21 = load i8*, i8** %3, align 8, !dbg !68
  %22 = load i32, i32* %4, align 4, !dbg !69
  %23 = load i32, i32* %5, align 4, !dbg !70
  call fastcc void @cdp_print(%struct.netdissect_options* noundef %20, i8* noundef %21, i32 noundef %22, i32 noundef %23), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

declare void @klee_make_symbolic(i8* noundef, i64 noundef, i8* noundef) local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @cdp_print(%struct.netdissect_options* noundef %0, i8* noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #0 !dbg !73 {
  %5 = alloca %struct.netdissect_options*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  store %struct.netdissect_options* %0, %struct.netdissect_options** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %5, metadata !82, metadata !DIExpression()), !dbg !83
  store i8* %1, i8** %6, align 8
  call void @llvm.dbg.declare(metadata i8** %6, metadata !84, metadata !DIExpression()), !dbg !85
  store i32 %2, i32* %7, align 4
  call void @llvm.dbg.declare(metadata i32* %7, metadata !86, metadata !DIExpression()), !dbg !87
  store i32 %3, i32* %8, align 4
  call void @llvm.dbg.declare(metadata i32* %8, metadata !88, metadata !DIExpression()), !dbg !89
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([28 x i8], [28 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  call void @llvm.dbg.declare(metadata i32* %9, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i32* %10, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i32* %11, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i32* %12, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i8** %13, metadata !99, metadata !DIExpression()), !dbg !100
  %14 = load i32, i32* %8, align 4, !dbg !101
  %15 = icmp ult i32 %14, 4, !dbg !103
  br i1 %15, label %16, label %19, !dbg !104

16:                                               ; preds = %4
  br label %17, !dbg !105

17:                                               ; preds = %16
  br label %18, !dbg !107

18:                                               ; preds = %17
  br label %113, !dbg !109

19:                                               ; preds = %4
  %20 = load i8*, i8** %6, align 8, !dbg !110
  store i8* %20, i8** %13, align 8, !dbg !111
  br label %21, !dbg !112

21:                                               ; preds = %19
  br label %22, !dbg !113

22:                                               ; preds = %21
  br label %23, !dbg !115

23:                                               ; preds = %22
  br label %24, !dbg !116

24:                                               ; preds = %23
  %25 = load %struct.netdissect_options*, %struct.netdissect_options** %5, align 8, !dbg !118
  %26 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %25, i32 0, i32 0, !dbg !120
  %27 = load i32, i32* %26, align 4, !dbg !120
  %28 = icmp ne i32 %27, 0, !dbg !118
  br i1 %28, label %29, label %32, !dbg !121

29:                                               ; preds = %24
  br label %30, !dbg !122

30:                                               ; preds = %29
  br label %31, !dbg !123

31:                                               ; preds = %30
  br label %32, !dbg !123

32:                                               ; preds = %31, %24
  %33 = load i8*, i8** %13, align 8, !dbg !125
  %34 = getelementptr inbounds i8, i8* %33, i64 4, !dbg !125
  store i8* %34, i8** %13, align 8, !dbg !125
  br label %35, !dbg !126

35:                                               ; preds = %106, %32
  %36 = load i8*, i8** %13, align 8, !dbg !127
  %37 = load i8*, i8** %6, align 8, !dbg !128
  %38 = load i32, i32* %7, align 4, !dbg !129
  %39 = zext i32 %38 to i64, !dbg !130
  %40 = getelementptr inbounds i8, i8* %37, i64 %39, !dbg !130
  %41 = icmp ult i8* %36, %40, !dbg !131
  br i1 %41, label %42, label %.loopexit, !dbg !126

42:                                               ; preds = %35
  br label %43, !dbg !132

43:                                               ; preds = %42
  br label %44, !dbg !134

44:                                               ; preds = %43
  %45 = load i8*, i8** %13, align 8, !dbg !136
  %46 = getelementptr inbounds i8, i8* %45, i64 0, !dbg !136
  %47 = getelementptr inbounds i8, i8* %46, i64 0, !dbg !136
  %48 = load i8, i8* %47, align 1, !dbg !136
  %49 = zext i8 %48 to i32, !dbg !136
  %50 = shl i32 %49, 8, !dbg !136
  %51 = load i8*, i8** %13, align 8, !dbg !136
  %52 = getelementptr inbounds i8, i8* %51, i64 0, !dbg !136
  %53 = getelementptr inbounds i8, i8* %52, i64 1, !dbg !136
  %54 = load i8, i8* %53, align 1, !dbg !136
  %55 = zext i8 %54 to i32, !dbg !136
  %56 = or i32 %50, %55, !dbg !136
  store i32 %56, i32* %9, align 4, !dbg !137
  %57 = load i8*, i8** %13, align 8, !dbg !138
  %58 = getelementptr inbounds i8, i8* %57, i64 2, !dbg !138
  %59 = getelementptr inbounds i8, i8* %58, i64 0, !dbg !138
  %60 = load i8, i8* %59, align 1, !dbg !138
  %61 = zext i8 %60 to i32, !dbg !138
  %62 = shl i32 %61, 8, !dbg !138
  %63 = load i8*, i8** %13, align 8, !dbg !138
  %64 = getelementptr inbounds i8, i8* %63, i64 2, !dbg !138
  %65 = getelementptr inbounds i8, i8* %64, i64 1, !dbg !138
  %66 = load i8, i8* %65, align 1, !dbg !138
  %67 = zext i8 %66 to i32, !dbg !138
  %68 = or i32 %62, %67, !dbg !138
  store i32 %68, i32* %10, align 4, !dbg !139
  %69 = load i32, i32* %10, align 4, !dbg !140
  %70 = icmp slt i32 %69, 4, !dbg !142
  br i1 %70, label %71, label %72, !dbg !143

71:                                               ; preds = %44
  br label %111, !dbg !144

72:                                               ; preds = %44
  %73 = load i8*, i8** %13, align 8, !dbg !145
  %74 = getelementptr inbounds i8, i8* %73, i64 4, !dbg !145
  store i8* %74, i8** %13, align 8, !dbg !145
  %75 = load i32, i32* %10, align 4, !dbg !146
  %76 = sub nsw i32 %75, 4, !dbg !146
  store i32 %76, i32* %10, align 4, !dbg !146
  br label %77, !dbg !147

77:                                               ; preds = %72
  br label %78, !dbg !148

78:                                               ; preds = %77
  %79 = load %struct.netdissect_options*, %struct.netdissect_options** %5, align 8, !dbg !150
  %80 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %79, i32 0, i32 0, !dbg !152
  %81 = load i32, i32* %80, align 4, !dbg !152
  %82 = icmp ne i32 %81, 0, !dbg !150
  br i1 %82, label %86, label %83, !dbg !153

83:                                               ; preds = %78
  %84 = load i32, i32* %9, align 4, !dbg !154
  %85 = icmp eq i32 %84, 1, !dbg !155
  br i1 %85, label %86, label %106, !dbg !156

86:                                               ; preds = %83, %78
  %87 = load i32, i32* %9, align 4, !dbg !157
  switch i32 %87, label %104 [
    i32 1, label %88
    i32 2, label %96
  ], !dbg !159

88:                                               ; preds = %86
  br label %89, !dbg !160

89:                                               ; preds = %88
  br label %90, !dbg !162

90:                                               ; preds = %89
  %91 = load %struct.netdissect_options*, %struct.netdissect_options** %5, align 8, !dbg !164
  %92 = load i8*, i8** %13, align 8, !dbg !165
  %93 = load i32, i32* %10, align 4, !dbg !166
  call fastcc void @fn_printn(%struct.netdissect_options* noundef %91, i8* noundef %92, i32 noundef %93), !dbg !167
  br label %94, !dbg !168

94:                                               ; preds = %90
  br label %95, !dbg !169

95:                                               ; preds = %94
  br label %105, !dbg !171

96:                                               ; preds = %86
  %97 = load %struct.netdissect_options*, %struct.netdissect_options** %5, align 8, !dbg !172
  %98 = load i8*, i8** %13, align 8, !dbg !174
  %99 = load i32, i32* %10, align 4, !dbg !175
  %100 = call fastcc i32 @cdp_print_addr(%struct.netdissect_options* noundef %97, i8* noundef %98, i32 noundef %99), !dbg !176
  %101 = icmp slt i32 %100, 0, !dbg !177
  br i1 %101, label %102, label %103, !dbg !178

102:                                              ; preds = %96
  br label %112, !dbg !179

103:                                              ; preds = %96
  br label %105, !dbg !180

104:                                              ; preds = %86
  br label %105, !dbg !181

105:                                              ; preds = %104, %103, %95
  br label %106, !dbg !182

106:                                              ; preds = %105, %83
  %107 = load i32, i32* %10, align 4, !dbg !183
  %108 = load i8*, i8** %13, align 8, !dbg !184
  %109 = sext i32 %107 to i64, !dbg !184
  %110 = getelementptr inbounds i8, i8* %108, i64 %109, !dbg !184
  store i8* %110, i8** %13, align 8, !dbg !184
  br label %35, !dbg !126, !llvm.loop !185

.loopexit:                                        ; preds = %35
  br label %111, !dbg !126

111:                                              ; preds = %.loopexit, %71
  br label %112, !dbg !126

112:                                              ; preds = %111, %102
  call void @llvm.dbg.label(metadata !188), !dbg !189
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @.str.1, i64 0, i64 0)), !dbg !190
  br label %113, !dbg !191

113:                                              ; preds = %112, %18
  ret void, !dbg !192
}

declare void @klee_warning_once(i8* noundef) local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @fn_printn(%struct.netdissect_options* noundef %0, i8* noundef %1, i32 noundef %2) unnamed_addr #0 !dbg !193 {
  %4 = alloca %struct.netdissect_options*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store %struct.netdissect_options* %0, %struct.netdissect_options** %4, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %4, metadata !196, metadata !DIExpression()), !dbg !197
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !198, metadata !DIExpression()), !dbg !199
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !200, metadata !DIExpression()), !dbg !201
  store i8* null, i8** %7, align 8
  call void @llvm.dbg.declare(metadata i8** %7, metadata !202, metadata !DIExpression()), !dbg !203
  %8 = load %struct.netdissect_options*, %struct.netdissect_options** %4, align 8, !dbg !204
  %9 = load i8*, i8** %5, align 8, !dbg !205
  %10 = load i32, i32* %6, align 4, !dbg !206
  %11 = load i8*, i8** %7, align 8, !dbg !207
  ret void, !dbg !208
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc i32 @cdp_print_addr(%struct.netdissect_options* noundef %0, i8* noundef %1, i32 noundef %2) unnamed_addr #0 !dbg !209 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.netdissect_options*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store %struct.netdissect_options* %0, %struct.netdissect_options** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %5, metadata !212, metadata !DIExpression()), !dbg !213
  store i8* %1, i8** %6, align 8
  call void @llvm.dbg.declare(metadata i8** %6, metadata !214, metadata !DIExpression()), !dbg !215
  store i32 %2, i32* %7, align 4
  call void @llvm.dbg.declare(metadata i32* %7, metadata !216, metadata !DIExpression()), !dbg !217
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i64 0, i64 0)), !dbg !218
  call void @llvm.dbg.declare(metadata i8** %8, metadata !219, metadata !DIExpression()), !dbg !220
  %14 = load i8*, i8** %6, align 8, !dbg !221
  %15 = load i32, i32* %7, align 4, !dbg !222
  %16 = sext i32 %15 to i64, !dbg !223
  %17 = getelementptr inbounds i8, i8* %14, i64 %16, !dbg !223
  store i8* %17, i8** %8, align 8, !dbg !220
  call void @llvm.dbg.declare(metadata i8** %9, metadata !224, metadata !DIExpression()), !dbg !225
  %18 = load i8*, i8** %6, align 8, !dbg !226
  store i8* %18, i8** %9, align 8, !dbg !225
  call void @llvm.dbg.declare(metadata i32* %10, metadata !227, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.declare(metadata i32* %11, metadata !229, metadata !DIExpression()), !dbg !230
  call void @llvm.dbg.declare(metadata i32* %12, metadata !231, metadata !DIExpression()), !dbg !232
  call void @llvm.dbg.declare(metadata i32* %13, metadata !233, metadata !DIExpression()), !dbg !234
  %19 = load %struct.netdissect_options*, %struct.netdissect_options** %5, align 8, !dbg !235
  %20 = load i32, i32* %7, align 4, !dbg !236
  %21 = icmp slt i32 %20, 10, !dbg !238
  br i1 %21, label %22, label %23, !dbg !239

22:                                               ; preds = %3
  store i32 -1, i32* %4, align 4, !dbg !240
  br label %136, !dbg !240

23:                                               ; preds = %3
  %24 = load i8*, i8** %9, align 8, !dbg !241
  %25 = getelementptr inbounds i8, i8* %24, i64 0, !dbg !241
  %26 = load i8, i8* %25, align 1, !dbg !241
  %27 = zext i8 %26 to i32, !dbg !241
  %28 = shl i32 %27, 8, !dbg !241
  %29 = load i8*, i8** %9, align 8, !dbg !241
  %30 = getelementptr inbounds i8, i8* %29, i64 1, !dbg !241
  %31 = load i8, i8* %30, align 1, !dbg !241
  %32 = zext i8 %31 to i32, !dbg !241
  %33 = or i32 %28, %32, !dbg !241
  store i32 %33, i32* %10, align 4, !dbg !242
  %34 = load i8*, i8** %9, align 8, !dbg !243
  %35 = getelementptr inbounds i8, i8* %34, i64 2, !dbg !243
  %36 = getelementptr inbounds i8, i8* %35, i64 0, !dbg !243
  %37 = load i8, i8* %36, align 1, !dbg !243
  %38 = zext i8 %37 to i32, !dbg !243
  %39 = shl i32 %38, 8, !dbg !243
  %40 = load i8*, i8** %9, align 8, !dbg !243
  %41 = getelementptr inbounds i8, i8* %40, i64 2, !dbg !243
  %42 = getelementptr inbounds i8, i8* %41, i64 1, !dbg !243
  %43 = load i8, i8* %42, align 1, !dbg !243
  %44 = zext i8 %43 to i32, !dbg !243
  %45 = or i32 %39, %44, !dbg !243
  store i32 %45, i32* %11, align 4, !dbg !244
  %46 = load i8*, i8** %9, align 8, !dbg !245
  %47 = getelementptr inbounds i8, i8* %46, i64 4, !dbg !245
  %48 = getelementptr inbounds i8, i8* %47, i64 0, !dbg !245
  %49 = load i8, i8* %48, align 1, !dbg !245
  %50 = zext i8 %49 to i32, !dbg !245
  %51 = shl i32 %50, 8, !dbg !245
  %52 = load i8*, i8** %9, align 8, !dbg !245
  %53 = getelementptr inbounds i8, i8* %52, i64 4, !dbg !245
  %54 = getelementptr inbounds i8, i8* %53, i64 1, !dbg !245
  %55 = load i8, i8* %54, align 1, !dbg !245
  %56 = zext i8 %55 to i32, !dbg !245
  %57 = or i32 %51, %56, !dbg !245
  store i32 %57, i32* %12, align 4, !dbg !246
  %58 = load i8*, i8** %9, align 8, !dbg !247
  %59 = getelementptr inbounds i8, i8* %58, i64 6, !dbg !247
  %60 = getelementptr inbounds i8, i8* %59, i64 0, !dbg !247
  %61 = load i8, i8* %60, align 1, !dbg !247
  %62 = zext i8 %61 to i32, !dbg !247
  %63 = shl i32 %62, 8, !dbg !247
  %64 = load i8*, i8** %9, align 8, !dbg !247
  %65 = getelementptr inbounds i8, i8* %64, i64 6, !dbg !247
  %66 = getelementptr inbounds i8, i8* %65, i64 1, !dbg !247
  %67 = load i8, i8* %66, align 1, !dbg !247
  %68 = zext i8 %67 to i32, !dbg !247
  %69 = or i32 %63, %68, !dbg !247
  store i32 %69, i32* %13, align 4, !dbg !248
  %70 = load i8*, i8** %9, align 8, !dbg !249
  store i8* %70, i8** %6, align 8, !dbg !250
  %71 = load i32, i32* %10, align 4, !dbg !251
  %72 = icmp eq i32 %71, 0, !dbg !253
  br i1 %72, label %73, label %95, !dbg !254

73:                                               ; preds = %23
  %74 = load i32, i32* %11, align 4, !dbg !255
  %75 = icmp eq i32 %74, 0, !dbg !256
  br i1 %75, label %76, label %95, !dbg !257

76:                                               ; preds = %73
  %77 = load i32, i32* %12, align 4, !dbg !258
  %78 = icmp eq i32 %77, 0, !dbg !259
  br i1 %78, label %79, label %95, !dbg !260

79:                                               ; preds = %76
  %80 = load i32, i32* %13, align 4, !dbg !261
  %81 = icmp eq i32 %80, 0, !dbg !262
  br i1 %81, label %82, label %95, !dbg !263

82:                                               ; preds = %79
  %83 = load i8*, i8** %6, align 8, !dbg !264
  %84 = getelementptr inbounds i8, i8* %83, i64 10, !dbg !264
  store i8* %84, i8** %6, align 8, !dbg !264
  %85 = load i8*, i8** %6, align 8, !dbg !266
  %86 = getelementptr inbounds i8, i8* %85, i64 4, !dbg !268
  %87 = load i8*, i8** %8, align 8, !dbg !269
  %88 = icmp ugt i8* %86, %87, !dbg !270
  br i1 %88, label %89, label %90, !dbg !271

89:                                               ; preds = %82
  store i32 -1, i32* %4, align 4, !dbg !272
  br label %136, !dbg !272

90:                                               ; preds = %82
  br label %91, !dbg !273

91:                                               ; preds = %90
  br label %92, !dbg !274

92:                                               ; preds = %91
  %93 = load i8*, i8** %6, align 8, !dbg !276
  %94 = getelementptr inbounds i8, i8* %93, i64 4, !dbg !276
  store i8* %94, i8** %6, align 8, !dbg !276
  br label %95, !dbg !277

95:                                               ; preds = %92, %79, %76, %73, %23
  %96 = load i8*, i8** %6, align 8, !dbg !278
  %97 = call i64 @klee_get_obj_size(i8* noundef %96), !dbg !280
  %98 = icmp ult i64 %97, 8, !dbg !281
  br i1 %98, label %99, label %100, !dbg !282

99:                                               ; preds = %95
  call void @klee_report_error(i8* noundef getelementptr inbounds ([108 x i8], [108 x i8]* @.str.3.4, i64 0, i64 0), i32 noundef 0, i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)) #7, !dbg !283
  unreachable, !dbg !283

100:                                              ; preds = %95
  %101 = load i32, i32* %10, align 4, !dbg !284
  %102 = icmp eq i32 %101, 1, !dbg !286
  br i1 %102, label %103, label %130, !dbg !287

103:                                              ; preds = %100
  %104 = load i32, i32* %11, align 4, !dbg !288
  %105 = icmp eq i32 %104, 8, !dbg !289
  br i1 %105, label %106, label %130, !dbg !290

106:                                              ; preds = %103
  %107 = load i8*, i8** %6, align 8, !dbg !291
  %108 = call i32 @memcmp(i8* noundef %107, i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.6, i64 0, i64 0), i64 noundef 8) #8, !dbg !292
  %109 = icmp eq i32 %108, 0, !dbg !293
  br i1 %109, label %110, label %130, !dbg !294

110:                                              ; preds = %106
  %111 = load i32, i32* %12, align 4, !dbg !295
  %112 = icmp eq i32 %111, 16, !dbg !296
  br i1 %112, label %113, label %130, !dbg !297

113:                                              ; preds = %110
  %114 = load i8*, i8** %6, align 8, !dbg !298
  %115 = getelementptr inbounds i8, i8* %114, i64 10, !dbg !298
  store i8* %115, i8** %6, align 8, !dbg !298
  %116 = load i8*, i8** %6, align 8, !dbg !300
  %117 = load i32, i32* %12, align 4, !dbg !302
  %118 = zext i32 %117 to i64, !dbg !303
  %119 = getelementptr inbounds i8, i8* %116, i64 %118, !dbg !303
  %120 = load i8*, i8** %8, align 8, !dbg !304
  %121 = icmp ugt i8* %119, %120, !dbg !305
  br i1 %121, label %122, label %123, !dbg !306

122:                                              ; preds = %113
  store i32 -1, i32* %4, align 4, !dbg !307
  br label %136, !dbg !307

123:                                              ; preds = %113
  br label %124, !dbg !308

124:                                              ; preds = %123
  br label %125, !dbg !309

125:                                              ; preds = %124
  %126 = load i32, i32* %12, align 4, !dbg !311
  %127 = load i8*, i8** %6, align 8, !dbg !312
  %128 = zext i32 %126 to i64, !dbg !312
  %129 = getelementptr inbounds i8, i8* %127, i64 %128, !dbg !312
  store i8* %129, i8** %6, align 8, !dbg !312
  br label %133, !dbg !313

130:                                              ; preds = %110, %106, %103, %100
  br label %131, !dbg !314

131:                                              ; preds = %130
  br label %132, !dbg !316

132:                                              ; preds = %131
  br label %133

133:                                              ; preds = %132, %125
  br label %134

134:                                              ; preds = %133
  %135 = call i32 (i8*, i8*, i32, i8*, ...) bitcast (i32 (...)* @__assert_fail to i32 (i8*, i8*, i32, i8*, ...)*)(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.7, i64 0, i64 0), i8* noundef getelementptr inbounds ([108 x i8], [108 x i8]* @.str.3.4, i64 0, i64 0), i32 noundef 67, i8* noundef getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__.cdp_print_addr, i64 0, i64 0)), !dbg !318
  unreachable, !dbg !319

136:                                              ; preds = %122, %89, %22
  %137 = load i32, i32* %4, align 4, !dbg !320
  ret i32 %137, !dbg !320
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

declare i64 @klee_get_obj_size(i8* noundef) local_unnamed_addr #3

; Function Attrs: noreturn
declare void @klee_report_error(i8* noundef, i32 noundef, i8* noundef, i8* noundef) local_unnamed_addr #4

; Function Attrs: noreturn
declare i32 @__assert_fail(...) local_unnamed_addr #4

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readonly uwtable willreturn
define dso_local i32 @memcmp(i8* nocapture noundef nonnull readonly %0, i8* nocapture noundef nonnull readonly %1, i64 noundef %2) local_unnamed_addr #5 !dbg !321 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !327, metadata !DIExpression()), !dbg !328
  call void @llvm.dbg.value(metadata i8* %1, metadata !329, metadata !DIExpression()), !dbg !328
  call void @llvm.dbg.value(metadata i64 %2, metadata !330, metadata !DIExpression()), !dbg !328
  %.not = icmp eq i64 %2, 0, !dbg !331
  br i1 %.not, label %.loopexit, label %.preheader, !dbg !333

.preheader:                                       ; preds = %3, %10
  %.03 = phi i64 [ %13, %10 ], [ %2, %3 ]
  %.02 = phi i8* [ %12, %10 ], [ %0, %3 ], !dbg !334
  %.01 = phi i8* [ %11, %10 ], [ %1, %3 ], !dbg !334
  call void @llvm.dbg.value(metadata i8* %.01, metadata !336, metadata !DIExpression()), !dbg !334
  call void @llvm.dbg.value(metadata i8* %.02, metadata !339, metadata !DIExpression()), !dbg !334
  call void @llvm.dbg.value(metadata i64 %.03, metadata !330, metadata !DIExpression()), !dbg !328
  call void @llvm.dbg.value(metadata i8* %.02, metadata !339, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !334
  %4 = load i8, i8* %.02, align 1, !dbg !340
  call void @llvm.dbg.value(metadata i8* %.01, metadata !336, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !334
  %5 = load i8, i8* %.01, align 1, !dbg !343
  %.not4 = icmp eq i8 %4, %5, !dbg !344
  br i1 %.not4, label %10, label %6, !dbg !345

6:                                                ; preds = %.preheader
  call void @llvm.dbg.value(metadata i8* %.02, metadata !339, metadata !DIExpression()), !dbg !334
  %7 = zext i8 %4 to i32, !dbg !346
  call void @llvm.dbg.value(metadata i8* %.01, metadata !336, metadata !DIExpression()), !dbg !334
  %8 = zext i8 %5 to i32, !dbg !348
  %9 = sub nsw i32 %7, %8, !dbg !349
  br label %.loopexit, !dbg !350

10:                                               ; preds = %.preheader
  %11 = getelementptr inbounds i8, i8* %.01, i64 1, !dbg !351
  call void @llvm.dbg.value(metadata i8* %11, metadata !336, metadata !DIExpression()), !dbg !334
  %12 = getelementptr inbounds i8, i8* %.02, i64 1, !dbg !352
  call void @llvm.dbg.value(metadata i8* %12, metadata !339, metadata !DIExpression()), !dbg !334
  %13 = add i64 %.03, -1, !dbg !353
  call void @llvm.dbg.value(metadata i64 %13, metadata !330, metadata !DIExpression()), !dbg !328
  %.not5 = icmp eq i64 %13, 0, !dbg !354
  br i1 %.not5, label %.loopexit, label %.preheader, !dbg !355, !llvm.loop !356

.loopexit:                                        ; preds = %10, %3, %6
  %.0 = phi i32 [ %9, %6 ], [ 0, %3 ], [ 0, %10 ], !dbg !328
  ret i32 %.0, !dbg !359
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree noinline norecurse nosync nounwind readonly uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0, !13, !25, !27}
!llvm.ident = !{!29, !29, !29, !29}
!llvm.module.flags = !{!30, !31, !32, !33, !34, !35, !36}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/093_print-cdp.c_322_local_cpp_cwe-125-oob-read/harness/driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/093_print-cdp.c_322_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "41b19ef7ffdcf443fbb16ed93454039b")
!2 = !{!3, !10}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "netdissect_options", file: !5, line: 25, baseType: !6)
!5 = !DIFile(filename: "harness_types.h", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/093_print-cdp.c_322_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "068813c0d2e5623bf3d106ab79441d5e")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !5, line: 23, size: 32, elements: !7)
!7 = !{!8}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_vflag", scope: !6, file: !5, line: 24, baseType: !9, size: 32)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !5, line: 17, baseType: !12)
!12 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!13 = distinct !DICompileUnit(language: DW_LANG_C99, file: !14, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !15, splitDebugInlining: false, nameTableKind: None)
!14 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/093_print-cdp.c_322_local_cpp_cwe-125-oob-read/harness/print-cdp.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/093_print-cdp.c_322_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "a0584222307a4e873e8f9603ba49dd4e")
!15 = !{!16, !17, !21, !22}
!16 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !19)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !20, line: 15, baseType: !12)
!20 = !DIFile(filename: "print-cdp.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/093_print-cdp.c_322_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "a0584222307a4e873e8f9603ba49dd4e")
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !23, line: 46, baseType: !24)
!23 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!24 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!25 = distinct !DICompileUnit(language: DW_LANG_C99, file: !26, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!26 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/093_print-cdp.c_322_local_cpp_cwe-125-oob-read/harness/smart_stubs.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/093_print-cdp.c_322_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "bcda1acd1a733c696e028616d9d6f3b5")
!27 = distinct !DICompileUnit(language: DW_LANG_C99, file: !28, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!28 = !DIFile(filename: "/opt/tools/klee/runtime/Freestanding/memcmp.c", directory: "/opt/tools/klee/build/runtime/Freestanding", checksumkind: CSK_MD5, checksum: "5350b831de232a5be5b37d49ccbaf0ef")
!29 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!30 = !{i32 7, !"Dwarf Version", i32 5}
!31 = !{i32 2, !"Debug Info Version", i32 3}
!32 = !{i32 1, !"wchar_size", i32 4}
!33 = !{i32 7, !"PIC Level", i32 2}
!34 = !{i32 7, !"PIE Level", i32 2}
!35 = !{i32 7, !"uwtable", i32 1}
!36 = !{i32 7, !"frame-pointer", i32 2}
!37 = distinct !DISubprogram(name: "main", scope: !38, file: !38, line: 8, type: !39, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !41)
!38 = !DIFile(filename: "driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/093_print-cdp.c_322_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "41b19ef7ffdcf443fbb16ed93454039b")
!39 = !DISubroutineType(types: !40)
!40 = !{!9}
!41 = !{}
!42 = !DILocalVariable(name: "ndo", scope: !37, file: !38, line: 9, type: !3)
!43 = !DILocation(line: 9, column: 25, scope: !37)
!44 = !DILocation(line: 9, column: 53, scope: !37)
!45 = !DILocation(line: 9, column: 31, scope: !37)
!46 = !DILocalVariable(name: "buf", scope: !37, file: !38, line: 10, type: !10)
!47 = !DILocation(line: 10, column: 13, scope: !37)
!48 = !DILocation(line: 10, column: 29, scope: !37)
!49 = !DILocalVariable(name: "length", scope: !37, file: !38, line: 11, type: !50)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !5, line: 20, baseType: !16)
!51 = !DILocation(line: 11, column: 11, scope: !37)
!52 = !DILocalVariable(name: "caplen", scope: !37, file: !38, line: 12, type: !50)
!53 = !DILocation(line: 12, column: 11, scope: !37)
!54 = !DILocation(line: 14, column: 5, scope: !37)
!55 = !DILocation(line: 14, column: 10, scope: !37)
!56 = !DILocation(line: 14, column: 20, scope: !37)
!57 = !DILocation(line: 16, column: 24, scope: !37)
!58 = !DILocation(line: 16, column: 5, scope: !37)
!59 = !DILocation(line: 17, column: 5, scope: !37)
!60 = !DILocation(line: 17, column: 12, scope: !37)
!61 = !DILocation(line: 18, column: 5, scope: !37)
!62 = !DILocation(line: 18, column: 12, scope: !37)
!63 = !DILocation(line: 19, column: 5, scope: !37)
!64 = !DILocation(line: 19, column: 12, scope: !37)
!65 = !DILocation(line: 20, column: 5, scope: !37)
!66 = !DILocation(line: 20, column: 12, scope: !37)
!67 = !DILocation(line: 22, column: 15, scope: !37)
!68 = !DILocation(line: 22, column: 20, scope: !37)
!69 = !DILocation(line: 22, column: 25, scope: !37)
!70 = !DILocation(line: 22, column: 33, scope: !37)
!71 = !DILocation(line: 22, column: 5, scope: !37)
!72 = !DILocation(line: 23, column: 5, scope: !37)
!73 = distinct !DISubprogram(name: "cdp_print", scope: !20, file: !20, line: 71, type: !74, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !13, retainedNodes: !41)
!74 = !DISubroutineType(types: !75)
!75 = !{null, !76, !17, !81, !81}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_typedef, name: "netdissect_options", file: !20, line: 23, baseType: !78)
!78 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !20, line: 21, size: 32, elements: !79)
!79 = !{!80}
!80 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_vflag", scope: !78, file: !20, line: 22, baseType: !9, size: 32)
!81 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !20, line: 18, baseType: !16)
!82 = !DILocalVariable(name: "ndo", arg: 1, scope: !73, file: !20, line: 71, type: !76)
!83 = !DILocation(line: 71, column: 36, scope: !73)
!84 = !DILocalVariable(name: "pptr", arg: 2, scope: !73, file: !20, line: 71, type: !17)
!85 = !DILocation(line: 71, column: 55, scope: !73)
!86 = !DILocalVariable(name: "length", arg: 3, scope: !73, file: !20, line: 71, type: !81)
!87 = !DILocation(line: 71, column: 67, scope: !73)
!88 = !DILocalVariable(name: "caplen", arg: 4, scope: !73, file: !20, line: 71, type: !81)
!89 = !DILocation(line: 71, column: 81, scope: !73)
!90 = !DILocation(line: 72, column: 5, scope: !73)
!91 = !DILocalVariable(name: "type", scope: !73, file: !20, line: 73, type: !9)
!92 = !DILocation(line: 73, column: 9, scope: !73)
!93 = !DILocalVariable(name: "len", scope: !73, file: !20, line: 73, type: !9)
!94 = !DILocation(line: 73, column: 15, scope: !73)
!95 = !DILocalVariable(name: "i", scope: !73, file: !20, line: 73, type: !9)
!96 = !DILocation(line: 73, column: 20, scope: !73)
!97 = !DILocalVariable(name: "j", scope: !73, file: !20, line: 73, type: !9)
!98 = !DILocation(line: 73, column: 23, scope: !73)
!99 = !DILocalVariable(name: "tptr", scope: !73, file: !20, line: 74, type: !17)
!100 = !DILocation(line: 74, column: 19, scope: !73)
!101 = !DILocation(line: 75, column: 9, scope: !102)
!102 = distinct !DILexicalBlock(scope: !73, file: !20, line: 75, column: 9)
!103 = !DILocation(line: 75, column: 16, scope: !102)
!104 = !DILocation(line: 75, column: 9, scope: !73)
!105 = !DILocation(line: 75, column: 36, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !20, line: 75, column: 34)
!107 = !DILocation(line: 75, column: 36, scope: !108)
!108 = distinct !DILexicalBlock(scope: !106, file: !20, line: 75, column: 36)
!109 = !DILocation(line: 75, column: 65, scope: !106)
!110 = !DILocation(line: 76, column: 12, scope: !73)
!111 = !DILocation(line: 76, column: 10, scope: !73)
!112 = !DILocation(line: 77, column: 5, scope: !73)
!113 = !DILocation(line: 77, column: 5, scope: !114)
!114 = distinct !DILexicalBlock(scope: !73, file: !20, line: 77, column: 5)
!115 = !DILocation(line: 78, column: 5, scope: !73)
!116 = !DILocation(line: 78, column: 5, scope: !117)
!117 = distinct !DILexicalBlock(scope: !73, file: !20, line: 78, column: 5)
!118 = !DILocation(line: 79, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !73, file: !20, line: 79, column: 9)
!120 = !DILocation(line: 79, column: 14, scope: !119)
!121 = !DILocation(line: 79, column: 9, scope: !73)
!122 = !DILocation(line: 79, column: 25, scope: !119)
!123 = !DILocation(line: 79, column: 25, scope: !124)
!124 = distinct !DILexicalBlock(scope: !119, file: !20, line: 79, column: 25)
!125 = !DILocation(line: 80, column: 10, scope: !73)
!126 = !DILocation(line: 81, column: 5, scope: !73)
!127 = !DILocation(line: 81, column: 12, scope: !73)
!128 = !DILocation(line: 81, column: 20, scope: !73)
!129 = !DILocation(line: 81, column: 25, scope: !73)
!130 = !DILocation(line: 81, column: 24, scope: !73)
!131 = !DILocation(line: 81, column: 17, scope: !73)
!132 = !DILocation(line: 82, column: 9, scope: !133)
!133 = distinct !DILexicalBlock(scope: !73, file: !20, line: 81, column: 34)
!134 = !DILocation(line: 82, column: 9, scope: !135)
!135 = distinct !DILexicalBlock(scope: !133, file: !20, line: 82, column: 9)
!136 = !DILocation(line: 83, column: 16, scope: !133)
!137 = !DILocation(line: 83, column: 14, scope: !133)
!138 = !DILocation(line: 84, column: 16, scope: !133)
!139 = !DILocation(line: 84, column: 14, scope: !133)
!140 = !DILocation(line: 85, column: 13, scope: !141)
!141 = distinct !DILexicalBlock(scope: !133, file: !20, line: 85, column: 13)
!142 = !DILocation(line: 85, column: 17, scope: !141)
!143 = !DILocation(line: 85, column: 13, scope: !133)
!144 = !DILocation(line: 85, column: 39, scope: !141)
!145 = !DILocation(line: 86, column: 14, scope: !133)
!146 = !DILocation(line: 87, column: 13, scope: !133)
!147 = !DILocation(line: 88, column: 9, scope: !133)
!148 = !DILocation(line: 88, column: 9, scope: !149)
!149 = distinct !DILexicalBlock(scope: !133, file: !20, line: 88, column: 9)
!150 = !DILocation(line: 89, column: 13, scope: !151)
!151 = distinct !DILexicalBlock(scope: !133, file: !20, line: 89, column: 13)
!152 = !DILocation(line: 89, column: 18, scope: !151)
!153 = !DILocation(line: 89, column: 28, scope: !151)
!154 = !DILocation(line: 89, column: 31, scope: !151)
!155 = !DILocation(line: 89, column: 36, scope: !151)
!156 = !DILocation(line: 89, column: 13, scope: !133)
!157 = !DILocation(line: 90, column: 21, scope: !158)
!158 = distinct !DILexicalBlock(scope: !151, file: !20, line: 89, column: 42)
!159 = !DILocation(line: 90, column: 13, scope: !158)
!160 = !DILocation(line: 91, column: 24, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !20, line: 90, column: 27)
!162 = !DILocation(line: 91, column: 24, scope: !163)
!163 = distinct !DILexicalBlock(scope: !161, file: !20, line: 91, column: 24)
!164 = !DILocation(line: 91, column: 62, scope: !161)
!165 = !DILocation(line: 91, column: 67, scope: !161)
!166 = !DILocation(line: 91, column: 73, scope: !161)
!167 = !DILocation(line: 91, column: 52, scope: !161)
!168 = !DILocation(line: 91, column: 85, scope: !161)
!169 = !DILocation(line: 91, column: 85, scope: !170)
!170 = distinct !DILexicalBlock(scope: !161, file: !20, line: 91, column: 85)
!171 = !DILocation(line: 91, column: 107, scope: !161)
!172 = !DILocation(line: 93, column: 43, scope: !173)
!173 = distinct !DILexicalBlock(scope: !161, file: !20, line: 93, column: 28)
!174 = !DILocation(line: 93, column: 48, scope: !173)
!175 = !DILocation(line: 93, column: 54, scope: !173)
!176 = !DILocation(line: 93, column: 28, scope: !173)
!177 = !DILocation(line: 93, column: 59, scope: !173)
!178 = !DILocation(line: 93, column: 28, scope: !161)
!179 = !DILocation(line: 93, column: 64, scope: !173)
!180 = !DILocation(line: 93, column: 76, scope: !161)
!181 = !DILocation(line: 95, column: 22, scope: !161)
!182 = !DILocation(line: 97, column: 9, scope: !158)
!183 = !DILocation(line: 98, column: 17, scope: !133)
!184 = !DILocation(line: 98, column: 14, scope: !133)
!185 = distinct !{!185, !126, !186, !187}
!186 = !DILocation(line: 99, column: 5, scope: !73)
!187 = !{!"llvm.loop.mustprogress"}
!188 = !DILabel(scope: !73, name: "trunc", file: !20, line: 100)
!189 = !DILocation(line: 100, column: 1, scope: !73)
!190 = !DILocation(line: 101, column: 5, scope: !73)
!191 = !DILocation(line: 102, column: 5, scope: !73)
!192 = !DILocation(line: 103, column: 1, scope: !73)
!193 = distinct !DISubprogram(name: "fn_printn", scope: !20, file: !20, line: 35, type: !194, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !13, retainedNodes: !41)
!194 = !DISubroutineType(types: !195)
!195 = !{!9, !76, !17, !9, !17}
!196 = !DILocalVariable(name: "ndo", arg: 1, scope: !193, file: !20, line: 35, type: !76)
!197 = !DILocation(line: 35, column: 42, scope: !193)
!198 = !DILocalVariable(name: "p", arg: 2, scope: !193, file: !20, line: 35, type: !17)
!199 = !DILocation(line: 35, column: 61, scope: !193)
!200 = !DILocalVariable(name: "len", arg: 3, scope: !193, file: !20, line: 35, type: !9)
!201 = !DILocation(line: 35, column: 68, scope: !193)
!202 = !DILocalVariable(name: "end", arg: 4, scope: !193, file: !20, line: 35, type: !17)
!203 = !DILocation(line: 35, column: 87, scope: !193)
!204 = !DILocation(line: 35, column: 100, scope: !193)
!205 = !DILocation(line: 35, column: 111, scope: !193)
!206 = !DILocation(line: 35, column: 120, scope: !193)
!207 = !DILocation(line: 35, column: 131, scope: !193)
!208 = !DILocation(line: 35, column: 136, scope: !193)
!209 = distinct !DISubprogram(name: "cdp_print_addr", scope: !20, file: !20, line: 39, type: !210, scopeLine: 39, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !13, retainedNodes: !41)
!210 = !DISubroutineType(types: !211)
!211 = !{!9, !76, !17, !9}
!212 = !DILocalVariable(name: "ndo", arg: 1, scope: !209, file: !20, line: 39, type: !76)
!213 = !DILocation(line: 39, column: 47, scope: !209)
!214 = !DILocalVariable(name: "p", arg: 2, scope: !209, file: !20, line: 39, type: !17)
!215 = !DILocation(line: 39, column: 67, scope: !209)
!216 = !DILocalVariable(name: "l", arg: 3, scope: !209, file: !20, line: 39, type: !9)
!217 = !DILocation(line: 39, column: 74, scope: !209)
!218 = !DILocation(line: 40, column: 5, scope: !209)
!219 = !DILocalVariable(name: "endp", scope: !209, file: !20, line: 41, type: !17)
!220 = !DILocation(line: 41, column: 19, scope: !209)
!221 = !DILocation(line: 41, column: 26, scope: !209)
!222 = !DILocation(line: 41, column: 30, scope: !209)
!223 = !DILocation(line: 41, column: 28, scope: !209)
!224 = !DILocalVariable(name: "p0", scope: !209, file: !20, line: 42, type: !17)
!225 = !DILocation(line: 42, column: 19, scope: !209)
!226 = !DILocation(line: 42, column: 24, scope: !209)
!227 = !DILocalVariable(name: "pt", scope: !209, file: !20, line: 43, type: !16)
!228 = !DILocation(line: 43, column: 18, scope: !209)
!229 = !DILocalVariable(name: "pl", scope: !209, file: !20, line: 43, type: !16)
!230 = !DILocation(line: 43, column: 22, scope: !209)
!231 = !DILocalVariable(name: "al", scope: !209, file: !20, line: 43, type: !16)
!232 = !DILocation(line: 43, column: 26, scope: !209)
!233 = !DILocalVariable(name: "num", scope: !209, file: !20, line: 43, type: !16)
!234 = !DILocation(line: 43, column: 30, scope: !209)
!235 = !DILocation(line: 44, column: 11, scope: !209)
!236 = !DILocation(line: 45, column: 9, scope: !237)
!237 = distinct !DILexicalBlock(scope: !209, file: !20, line: 45, column: 9)
!238 = !DILocation(line: 45, column: 11, scope: !237)
!239 = !DILocation(line: 45, column: 9, scope: !209)
!240 = !DILocation(line: 45, column: 17, scope: !237)
!241 = !DILocation(line: 46, column: 10, scope: !209)
!242 = !DILocation(line: 46, column: 8, scope: !209)
!243 = !DILocation(line: 47, column: 10, scope: !209)
!244 = !DILocation(line: 47, column: 8, scope: !209)
!245 = !DILocation(line: 48, column: 10, scope: !209)
!246 = !DILocation(line: 48, column: 8, scope: !209)
!247 = !DILocation(line: 49, column: 11, scope: !209)
!248 = !DILocation(line: 49, column: 9, scope: !209)
!249 = !DILocation(line: 50, column: 9, scope: !209)
!250 = !DILocation(line: 50, column: 7, scope: !209)
!251 = !DILocation(line: 51, column: 9, scope: !252)
!252 = distinct !DILexicalBlock(scope: !209, file: !20, line: 51, column: 9)
!253 = !DILocation(line: 51, column: 12, scope: !252)
!254 = !DILocation(line: 51, column: 17, scope: !252)
!255 = !DILocation(line: 51, column: 20, scope: !252)
!256 = !DILocation(line: 51, column: 23, scope: !252)
!257 = !DILocation(line: 51, column: 28, scope: !252)
!258 = !DILocation(line: 51, column: 31, scope: !252)
!259 = !DILocation(line: 51, column: 34, scope: !252)
!260 = !DILocation(line: 51, column: 39, scope: !252)
!261 = !DILocation(line: 51, column: 42, scope: !252)
!262 = !DILocation(line: 51, column: 46, scope: !252)
!263 = !DILocation(line: 51, column: 9, scope: !209)
!264 = !DILocation(line: 52, column: 11, scope: !265)
!265 = distinct !DILexicalBlock(scope: !252, file: !20, line: 51, column: 52)
!266 = !DILocation(line: 53, column: 13, scope: !267)
!267 = distinct !DILexicalBlock(scope: !265, file: !20, line: 53, column: 13)
!268 = !DILocation(line: 53, column: 15, scope: !267)
!269 = !DILocation(line: 53, column: 21, scope: !267)
!270 = !DILocation(line: 53, column: 19, scope: !267)
!271 = !DILocation(line: 53, column: 13, scope: !265)
!272 = !DILocation(line: 53, column: 27, scope: !267)
!273 = !DILocation(line: 54, column: 9, scope: !265)
!274 = !DILocation(line: 54, column: 9, scope: !275)
!275 = distinct !DILexicalBlock(scope: !265, file: !20, line: 54, column: 9)
!276 = !DILocation(line: 55, column: 11, scope: !265)
!277 = !DILocation(line: 56, column: 5, scope: !265)
!278 = !DILocation(line: 57, column: 34, scope: !279)
!279 = distinct !DILexicalBlock(scope: !209, file: !20, line: 57, column: 9)
!280 = !DILocation(line: 57, column: 9, scope: !279)
!281 = !DILocation(line: 57, column: 37, scope: !279)
!282 = !DILocation(line: 57, column: 9, scope: !209)
!283 = !DILocation(line: 57, column: 52, scope: !279)
!284 = !DILocation(line: 58, column: 14, scope: !285)
!285 = distinct !DILexicalBlock(scope: !279, file: !20, line: 58, column: 14)
!286 = !DILocation(line: 58, column: 17, scope: !285)
!287 = !DILocation(line: 58, column: 22, scope: !285)
!288 = !DILocation(line: 58, column: 25, scope: !285)
!289 = !DILocation(line: 58, column: 28, scope: !285)
!290 = !DILocation(line: 58, column: 33, scope: !285)
!291 = !DILocation(line: 58, column: 43, scope: !285)
!292 = !DILocation(line: 58, column: 36, scope: !285)
!293 = !DILocation(line: 58, column: 85, scope: !285)
!294 = !DILocation(line: 58, column: 90, scope: !285)
!295 = !DILocation(line: 58, column: 93, scope: !285)
!296 = !DILocation(line: 58, column: 96, scope: !285)
!297 = !DILocation(line: 58, column: 14, scope: !279)
!298 = !DILocation(line: 59, column: 11, scope: !299)
!299 = distinct !DILexicalBlock(scope: !285, file: !20, line: 58, column: 103)
!300 = !DILocation(line: 60, column: 13, scope: !301)
!301 = distinct !DILexicalBlock(scope: !299, file: !20, line: 60, column: 13)
!302 = !DILocation(line: 60, column: 17, scope: !301)
!303 = !DILocation(line: 60, column: 15, scope: !301)
!304 = !DILocation(line: 60, column: 22, scope: !301)
!305 = !DILocation(line: 60, column: 20, scope: !301)
!306 = !DILocation(line: 60, column: 13, scope: !299)
!307 = !DILocation(line: 60, column: 28, scope: !301)
!308 = !DILocation(line: 61, column: 9, scope: !299)
!309 = !DILocation(line: 61, column: 9, scope: !310)
!310 = distinct !DILexicalBlock(scope: !299, file: !20, line: 61, column: 9)
!311 = !DILocation(line: 62, column: 14, scope: !299)
!312 = !DILocation(line: 62, column: 11, scope: !299)
!313 = !DILocation(line: 63, column: 5, scope: !299)
!314 = !DILocation(line: 65, column: 9, scope: !315)
!315 = distinct !DILexicalBlock(scope: !285, file: !20, line: 64, column: 10)
!316 = !DILocation(line: 65, column: 9, scope: !317)
!317 = distinct !DILexicalBlock(scope: !315, file: !20, line: 65, column: 9)
!318 = !DILocation(line: 67, column: 5, scope: !209)
!319 = !DILocation(line: 68, column: 5, scope: !209)
!320 = !DILocation(line: 69, column: 1, scope: !209)
!321 = distinct !DISubprogram(name: "memcmp", scope: !322, file: !322, line: 42, type: !323, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !27, retainedNodes: !41)
!322 = !DIFile(filename: "runtime/Freestanding/memcmp.c", directory: "/opt/tools/klee", checksumkind: CSK_MD5, checksum: "5350b831de232a5be5b37d49ccbaf0ef")
!323 = !DISubroutineType(types: !324)
!324 = !{!9, !325, !325, !22}
!325 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !326, size: 64)
!326 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!327 = !DILocalVariable(name: "s1", arg: 1, scope: !321, file: !322, line: 42, type: !325)
!328 = !DILocation(line: 0, scope: !321)
!329 = !DILocalVariable(name: "s2", arg: 2, scope: !321, file: !322, line: 42, type: !325)
!330 = !DILocalVariable(name: "n", arg: 3, scope: !321, file: !322, line: 42, type: !22)
!331 = !DILocation(line: 43, column: 9, scope: !332)
!332 = distinct !DILexicalBlock(scope: !321, file: !322, line: 43, column: 7)
!333 = !DILocation(line: 43, column: 7, scope: !321)
!334 = !DILocation(line: 0, scope: !335)
!335 = distinct !DILexicalBlock(scope: !332, file: !322, line: 43, column: 15)
!336 = !DILocalVariable(name: "p2", scope: !335, file: !322, line: 44, type: !337)
!337 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !338, size: 64)
!338 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!339 = !DILocalVariable(name: "p1", scope: !335, file: !322, line: 44, type: !337)
!340 = !DILocation(line: 47, column: 11, scope: !341)
!341 = distinct !DILexicalBlock(scope: !342, file: !322, line: 47, column: 11)
!342 = distinct !DILexicalBlock(scope: !335, file: !322, line: 46, column: 8)
!343 = !DILocation(line: 47, column: 20, scope: !341)
!344 = !DILocation(line: 47, column: 17, scope: !341)
!345 = !DILocation(line: 47, column: 11, scope: !342)
!346 = !DILocation(line: 48, column: 17, scope: !347)
!347 = distinct !DILexicalBlock(scope: !341, file: !322, line: 47, column: 27)
!348 = !DILocation(line: 48, column: 25, scope: !347)
!349 = !DILocation(line: 48, column: 23, scope: !347)
!350 = !DILocation(line: 48, column: 9, scope: !347)
!351 = !DILocation(line: 47, column: 23, scope: !341)
!352 = !DILocation(line: 47, column: 14, scope: !341)
!353 = !DILocation(line: 50, column: 14, scope: !335)
!354 = !DILocation(line: 50, column: 18, scope: !335)
!355 = !DILocation(line: 50, column: 5, scope: !342)
!356 = distinct !{!356, !357, !358, !187}
!357 = !DILocation(line: 46, column: 5, scope: !335)
!358 = !DILocation(line: 50, column: 22, scope: !335)
!359 = !DILocation(line: 53, column: 1, scope: !321)
