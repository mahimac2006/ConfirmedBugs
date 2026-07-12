; ModuleID = '/app/se_runs/sailor_engine/tcpdump-4.9.2/092_print-beep.c_45_local_cpp_cwe-125-oob-read/harness/slice.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.netdissect_options = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*, i8*, i32, i32, i8*, i8*, i8* }
%struct.netdissect_options.0 = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, %struct.sa_list*, %struct.sa_list*, i8*, i32, i32, i8*, i8*, i32 (%struct.netdissect_options.0*, %struct.pcap_pkthdr*, i8*)*, {}*, i32 (%struct.netdissect_options.0*, i8*, ...)*, void (%struct.netdissect_options.0*, i8*, ...)*, void (%struct.netdissect_options.0*, i8*, ...)* }
%struct.sa_list = type opaque
%struct.pcap_pkthdr = type { %struct.timeval, i32, i32 }
%struct.timeval = type { i64, i64 }

@.str = private unnamed_addr constant [3 x i8] c"bp\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"MSGX\00", align 1
@.str.3 = private unnamed_addr constant [29 x i8] c"SPINE_PROBE:beep_print:ENTRY\00", align 1
@.str.1.4 = private unnamed_addr constant [4 x i8] c"MSG\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c" BEEP MSG\00", align 1
@.str.3.5 = private unnamed_addr constant [5 x i8] c"RPY \00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c" BEEP RPY\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"ERR \00", align 1
@.str.6 = private unnamed_addr constant [10 x i8] c" BEEP ERR\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"ANS \00", align 1
@.str.8 = private unnamed_addr constant [10 x i8] c" BEEP ANS\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"NUL \00", align 1
@.str.10 = private unnamed_addr constant [10 x i8] c" BEEP NUL\00", align 1
@.str.11 = private unnamed_addr constant [5 x i8] c"SEQ \00", align 1
@.str.12 = private unnamed_addr constant [10 x i8] c" BEEP SEQ\00", align 1
@.str.13 = private unnamed_addr constant [4 x i8] c"END\00", align 1
@.str.14 = private unnamed_addr constant [10 x i8] c" BEEP END\00", align 1
@.str.15 = private unnamed_addr constant [29 x i8] c" BEEP (payload or undecoded)\00", align 1
@.str.16 = private unnamed_addr constant [30 x i8] c"SPINE_PROBE:l_strnstart:ENTRY\00", align 1
@.str.17 = private unnamed_addr constant [27 x i8] c"0 && \22SAILOR_SINK_REACHED\22\00", align 1
@.str.18 = private unnamed_addr constant [109 x i8] c"/app/se_runs/sailor_engine/tcpdump-4.9.2/092_print-beep.c_45_local_cpp_cwe-125-oob-read/harness/print-beep.c\00", align 1
@__PRETTY_FUNCTION__.l_strnstart = private unnamed_addr constant [80 x i8] c"int l_strnstart(netdissect_options *, const char *, u_int, const char *, u_int)\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !65 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.netdissect_options*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %2, metadata !69, metadata !DIExpression()), !dbg !70
  %5 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 144) #6, !dbg !71
  %6 = bitcast i8* %5 to %struct.netdissect_options*, !dbg !72
  store %struct.netdissect_options* %6, %struct.netdissect_options** %2, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i32* %3, metadata !73, metadata !DIExpression()), !dbg !76
  store i32 4, i32* %3, align 4, !dbg !76
  call void @llvm.dbg.declare(metadata i8** %4, metadata !77, metadata !DIExpression()), !dbg !78
  %7 = load i32, i32* %3, align 4, !dbg !79
  %8 = zext i32 %7 to i64, !dbg !79
  %9 = call noalias i8* @calloc(i64 noundef 1, i64 noundef %8) #6, !dbg !80
  store i8* %9, i8** %4, align 8, !dbg !78
  %10 = load i8*, i8** %4, align 8, !dbg !81
  %11 = load i32, i32* %3, align 4, !dbg !82
  %12 = zext i32 %11 to i64, !dbg !82
  call void @klee_make_symbolic(i8* noundef %10, i64 noundef %12, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0)), !dbg !83
  %13 = load i8*, i8** %4, align 8, !dbg !84
  %14 = call i8* @memcpy(i8* %13, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i64 4), !dbg !85
  %15 = load i8*, i8** %4, align 8, !dbg !86
  %16 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !87
  %17 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %16, i32 0, i32 25, !dbg !88
  store i8* %15, i8** %17, align 8, !dbg !89
  %18 = load i8*, i8** %4, align 8, !dbg !90
  %19 = load i32, i32* %3, align 4, !dbg !91
  %20 = zext i32 %19 to i64, !dbg !92
  %21 = getelementptr inbounds i8, i8* %18, i64 %20, !dbg !92
  %22 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !93
  %23 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %22, i32 0, i32 26, !dbg !94
  store i8* %21, i8** %23, align 8, !dbg !95
  %24 = load i32, i32* %3, align 4, !dbg !96
  %25 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !97
  %26 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %25, i32 0, i32 24, !dbg !98
  store i32 %24, i32* %26, align 4, !dbg !99
  %27 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !100
  %28 = load i8*, i8** %4, align 8, !dbg !101
  %29 = load i32, i32* %3, align 4, !dbg !102
  call void bitcast (void (%struct.netdissect_options.0*, i8*, i32)* @beep_print to void (%struct.netdissect_options*, i8*, i32)*)(%struct.netdissect_options* noundef %27, i8* noundef %28, i32 noundef %29), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

declare void @klee_make_symbolic(i8* noundef, i64 noundef, i8* noundef) local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @beep_print(%struct.netdissect_options.0* noundef %0, i8* noundef %1, i32 noundef %2) unnamed_addr #0 !dbg !105 {
  %4 = alloca %struct.netdissect_options.0*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  store %struct.netdissect_options.0* %0, %struct.netdissect_options.0** %4, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options.0** %4, metadata !185, metadata !DIExpression()), !dbg !186
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !187, metadata !DIExpression()), !dbg !188
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !189, metadata !DIExpression()), !dbg !190
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @.str.3, i64 0, i64 0)), !dbg !191
  %7 = load %struct.netdissect_options.0*, %struct.netdissect_options.0** %4, align 8, !dbg !192
  %8 = load i8*, i8** %5, align 8, !dbg !194
  %9 = load i32, i32* %6, align 4, !dbg !195
  %10 = call fastcc i32 @l_strnstart(%struct.netdissect_options.0* noundef %7, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1.4, i64 0, i64 0), i8* noundef %8, i32 noundef %9), !dbg !196
  %11 = icmp ne i32 %10, 0, !dbg !196
  br i1 %11, label %12, label %18, !dbg !197

12:                                               ; preds = %3
  %13 = load %struct.netdissect_options.0*, %struct.netdissect_options.0** %4, align 8, !dbg !198
  %14 = getelementptr inbounds %struct.netdissect_options.0, %struct.netdissect_options.0* %13, i32 0, i32 29, !dbg !198
  %15 = load i32 (%struct.netdissect_options.0*, i8*, ...)*, i32 (%struct.netdissect_options.0*, i8*, ...)** %14, align 8, !dbg !198
  %16 = load %struct.netdissect_options.0*, %struct.netdissect_options.0** %4, align 8, !dbg !198
  %17 = call i32 (%struct.netdissect_options.0*, i8*, ...) %15(%struct.netdissect_options.0* noundef %16, i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i64 0, i64 0)), !dbg !198
  br label %102, !dbg !198

18:                                               ; preds = %3
  %19 = load %struct.netdissect_options.0*, %struct.netdissect_options.0** %4, align 8, !dbg !199
  %20 = load i8*, i8** %5, align 8, !dbg !201
  %21 = load i32, i32* %6, align 4, !dbg !202
  %22 = call fastcc i32 @l_strnstart(%struct.netdissect_options.0* noundef %19, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3.5, i64 0, i64 0), i8* noundef %20, i32 noundef %21), !dbg !203
  %23 = icmp ne i32 %22, 0, !dbg !203
  br i1 %23, label %24, label %30, !dbg !204

24:                                               ; preds = %18
  %25 = load %struct.netdissect_options.0*, %struct.netdissect_options.0** %4, align 8, !dbg !205
  %26 = getelementptr inbounds %struct.netdissect_options.0, %struct.netdissect_options.0* %25, i32 0, i32 29, !dbg !205
  %27 = load i32 (%struct.netdissect_options.0*, i8*, ...)*, i32 (%struct.netdissect_options.0*, i8*, ...)** %26, align 8, !dbg !205
  %28 = load %struct.netdissect_options.0*, %struct.netdissect_options.0** %4, align 8, !dbg !205
  %29 = call i32 (%struct.netdissect_options.0*, i8*, ...) %27(%struct.netdissect_options.0* noundef %28, i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0)), !dbg !205
  br label %101, !dbg !205

30:                                               ; preds = %18
  %31 = load %struct.netdissect_options.0*, %struct.netdissect_options.0** %4, align 8, !dbg !206
  %32 = load i8*, i8** %5, align 8, !dbg !208
  %33 = load i32, i32* %6, align 4, !dbg !209
  %34 = call fastcc i32 @l_strnstart(%struct.netdissect_options.0* noundef %31, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i64 0, i64 0), i8* noundef %32, i32 noundef %33), !dbg !210
  %35 = icmp ne i32 %34, 0, !dbg !210
  br i1 %35, label %36, label %42, !dbg !211

36:                                               ; preds = %30
  %37 = load %struct.netdissect_options.0*, %struct.netdissect_options.0** %4, align 8, !dbg !212
  %38 = getelementptr inbounds %struct.netdissect_options.0, %struct.netdissect_options.0* %37, i32 0, i32 29, !dbg !212
  %39 = load i32 (%struct.netdissect_options.0*, i8*, ...)*, i32 (%struct.netdissect_options.0*, i8*, ...)** %38, align 8, !dbg !212
  %40 = load %struct.netdissect_options.0*, %struct.netdissect_options.0** %4, align 8, !dbg !212
  %41 = call i32 (%struct.netdissect_options.0*, i8*, ...) %39(%struct.netdissect_options.0* noundef %40, i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str.6, i64 0, i64 0)), !dbg !212
  br label %100, !dbg !212

42:                                               ; preds = %30
  %43 = load %struct.netdissect_options.0*, %struct.netdissect_options.0** %4, align 8, !dbg !213
  %44 = load i8*, i8** %5, align 8, !dbg !215
  %45 = load i32, i32* %6, align 4, !dbg !216
  %46 = call fastcc i32 @l_strnstart(%struct.netdissect_options.0* noundef %43, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i8* noundef %44, i32 noundef %45), !dbg !217
  %47 = icmp ne i32 %46, 0, !dbg !217
  br i1 %47, label %48, label %54, !dbg !218

48:                                               ; preds = %42
  %49 = load %struct.netdissect_options.0*, %struct.netdissect_options.0** %4, align 8, !dbg !219
  %50 = getelementptr inbounds %struct.netdissect_options.0, %struct.netdissect_options.0* %49, i32 0, i32 29, !dbg !219
  %51 = load i32 (%struct.netdissect_options.0*, i8*, ...)*, i32 (%struct.netdissect_options.0*, i8*, ...)** %50, align 8, !dbg !219
  %52 = load %struct.netdissect_options.0*, %struct.netdissect_options.0** %4, align 8, !dbg !219
  %53 = call i32 (%struct.netdissect_options.0*, i8*, ...) %51(%struct.netdissect_options.0* noundef %52, i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str.8, i64 0, i64 0)), !dbg !219
  br label %99, !dbg !219

54:                                               ; preds = %42
  %55 = load %struct.netdissect_options.0*, %struct.netdissect_options.0** %4, align 8, !dbg !220
  %56 = load i8*, i8** %5, align 8, !dbg !222
  %57 = load i32, i32* %6, align 4, !dbg !223
  %58 = call fastcc i32 @l_strnstart(%struct.netdissect_options.0* noundef %55, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i64 0, i64 0), i8* noundef %56, i32 noundef %57), !dbg !224
  %59 = icmp ne i32 %58, 0, !dbg !224
  br i1 %59, label %60, label %66, !dbg !225

60:                                               ; preds = %54
  %61 = load %struct.netdissect_options.0*, %struct.netdissect_options.0** %4, align 8, !dbg !226
  %62 = getelementptr inbounds %struct.netdissect_options.0, %struct.netdissect_options.0* %61, i32 0, i32 29, !dbg !226
  %63 = load i32 (%struct.netdissect_options.0*, i8*, ...)*, i32 (%struct.netdissect_options.0*, i8*, ...)** %62, align 8, !dbg !226
  %64 = load %struct.netdissect_options.0*, %struct.netdissect_options.0** %4, align 8, !dbg !226
  %65 = call i32 (%struct.netdissect_options.0*, i8*, ...) %63(%struct.netdissect_options.0* noundef %64, i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str.10, i64 0, i64 0)), !dbg !226
  br label %98, !dbg !226

66:                                               ; preds = %54
  %67 = load %struct.netdissect_options.0*, %struct.netdissect_options.0** %4, align 8, !dbg !227
  %68 = load i8*, i8** %5, align 8, !dbg !229
  %69 = load i32, i32* %6, align 4, !dbg !230
  %70 = call fastcc i32 @l_strnstart(%struct.netdissect_options.0* noundef %67, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.11, i64 0, i64 0), i8* noundef %68, i32 noundef %69), !dbg !231
  %71 = icmp ne i32 %70, 0, !dbg !231
  br i1 %71, label %72, label %78, !dbg !232

72:                                               ; preds = %66
  %73 = load %struct.netdissect_options.0*, %struct.netdissect_options.0** %4, align 8, !dbg !233
  %74 = getelementptr inbounds %struct.netdissect_options.0, %struct.netdissect_options.0* %73, i32 0, i32 29, !dbg !233
  %75 = load i32 (%struct.netdissect_options.0*, i8*, ...)*, i32 (%struct.netdissect_options.0*, i8*, ...)** %74, align 8, !dbg !233
  %76 = load %struct.netdissect_options.0*, %struct.netdissect_options.0** %4, align 8, !dbg !233
  %77 = call i32 (%struct.netdissect_options.0*, i8*, ...) %75(%struct.netdissect_options.0* noundef %76, i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str.12, i64 0, i64 0)), !dbg !233
  br label %97, !dbg !233

78:                                               ; preds = %66
  %79 = load %struct.netdissect_options.0*, %struct.netdissect_options.0** %4, align 8, !dbg !234
  %80 = load i8*, i8** %5, align 8, !dbg !236
  %81 = load i32, i32* %6, align 4, !dbg !237
  %82 = call fastcc i32 @l_strnstart(%struct.netdissect_options.0* noundef %79, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i64 0, i64 0), i8* noundef %80, i32 noundef %81), !dbg !238
  %83 = icmp ne i32 %82, 0, !dbg !238
  br i1 %83, label %84, label %90, !dbg !239

84:                                               ; preds = %78
  %85 = load %struct.netdissect_options.0*, %struct.netdissect_options.0** %4, align 8, !dbg !240
  %86 = getelementptr inbounds %struct.netdissect_options.0, %struct.netdissect_options.0* %85, i32 0, i32 29, !dbg !240
  %87 = load i32 (%struct.netdissect_options.0*, i8*, ...)*, i32 (%struct.netdissect_options.0*, i8*, ...)** %86, align 8, !dbg !240
  %88 = load %struct.netdissect_options.0*, %struct.netdissect_options.0** %4, align 8, !dbg !240
  %89 = call i32 (%struct.netdissect_options.0*, i8*, ...) %87(%struct.netdissect_options.0* noundef %88, i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str.14, i64 0, i64 0)), !dbg !240
  br label %96, !dbg !240

90:                                               ; preds = %78
  %91 = load %struct.netdissect_options.0*, %struct.netdissect_options.0** %4, align 8, !dbg !241
  %92 = getelementptr inbounds %struct.netdissect_options.0, %struct.netdissect_options.0* %91, i32 0, i32 29, !dbg !241
  %93 = load i32 (%struct.netdissect_options.0*, i8*, ...)*, i32 (%struct.netdissect_options.0*, i8*, ...)** %92, align 8, !dbg !241
  %94 = load %struct.netdissect_options.0*, %struct.netdissect_options.0** %4, align 8, !dbg !241
  %95 = call i32 (%struct.netdissect_options.0*, i8*, ...) %93(%struct.netdissect_options.0* noundef %94, i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @.str.15, i64 0, i64 0)), !dbg !241
  br label %96

96:                                               ; preds = %90, %84
  br label %97

97:                                               ; preds = %96, %72
  br label %98

98:                                               ; preds = %97, %60
  br label %99

99:                                               ; preds = %98, %48
  br label %100

100:                                              ; preds = %99, %36
  br label %101

101:                                              ; preds = %100, %24
  br label %102

102:                                              ; preds = %101, %12
  ret void, !dbg !242
}

declare void @klee_warning_once(i8* noundef) local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc i32 @l_strnstart(%struct.netdissect_options.0* noundef %0, i8* noundef %1, i8* noundef %2, i32 noundef %3) unnamed_addr #0 !dbg !243 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.netdissect_options.0*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  store %struct.netdissect_options.0* %0, %struct.netdissect_options.0** %6, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options.0** %6, metadata !246, metadata !DIExpression()), !dbg !247
  store i8* %1, i8** %7, align 8
  call void @llvm.dbg.declare(metadata i8** %7, metadata !248, metadata !DIExpression()), !dbg !249
  store i32 4, i32* %8, align 4
  call void @llvm.dbg.declare(metadata i32* %8, metadata !250, metadata !DIExpression()), !dbg !251
  store i8* %2, i8** %9, align 8
  call void @llvm.dbg.declare(metadata i8** %9, metadata !252, metadata !DIExpression()), !dbg !253
  store i32 %3, i32* %10, align 4
  call void @llvm.dbg.declare(metadata i32* %10, metadata !254, metadata !DIExpression()), !dbg !255
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([30 x i8], [30 x i8]* @.str.16, i64 0, i64 0)), !dbg !256
  %11 = load i32, i32* %8, align 4, !dbg !257
  %12 = icmp ugt i32 %11, 0, !dbg !257
  br i1 %12, label %16, label %13, !dbg !257

13:                                               ; preds = %4
  %14 = load i32, i32* %8, align 4, !dbg !257
  %15 = icmp eq i32 %14, 0, !dbg !257
  br i1 %15, label %16, label %40, !dbg !257

16:                                               ; preds = %13, %4
  %17 = load %struct.netdissect_options.0*, %struct.netdissect_options.0** %6, align 8, !dbg !257
  %18 = getelementptr inbounds %struct.netdissect_options.0, %struct.netdissect_options.0* %17, i32 0, i32 26, !dbg !257
  %19 = load i8*, i8** %18, align 8, !dbg !257
  %20 = ptrtoint i8* %19 to i64, !dbg !257
  %21 = load i32, i32* %8, align 4, !dbg !257
  %22 = zext i32 %21 to i64, !dbg !257
  %23 = sub i64 %20, %22, !dbg !257
  %24 = load %struct.netdissect_options.0*, %struct.netdissect_options.0** %6, align 8, !dbg !257
  %25 = getelementptr inbounds %struct.netdissect_options.0, %struct.netdissect_options.0* %24, i32 0, i32 26, !dbg !257
  %26 = load i8*, i8** %25, align 8, !dbg !257
  %27 = ptrtoint i8* %26 to i64, !dbg !257
  %28 = icmp ule i64 %23, %27, !dbg !257
  br i1 %28, label %29, label %40, !dbg !257

29:                                               ; preds = %16
  %30 = load i8*, i8** %9, align 8, !dbg !257
  %31 = ptrtoint i8* %30 to i64, !dbg !257
  %32 = load %struct.netdissect_options.0*, %struct.netdissect_options.0** %6, align 8, !dbg !257
  %33 = getelementptr inbounds %struct.netdissect_options.0, %struct.netdissect_options.0* %32, i32 0, i32 26, !dbg !257
  %34 = load i8*, i8** %33, align 8, !dbg !257
  %35 = ptrtoint i8* %34 to i64, !dbg !257
  %36 = load i32, i32* %8, align 4, !dbg !257
  %37 = zext i32 %36 to i64, !dbg !257
  %38 = sub i64 %35, %37, !dbg !257
  %39 = icmp ule i64 %31, %38, !dbg !257
  br i1 %39, label %41, label %40, !dbg !259

40:                                               ; preds = %29, %16, %13
  store i32 0, i32* %5, align 4, !dbg !260
  br label %48, !dbg !260

41:                                               ; preds = %29
  %42 = load i32, i32* %8, align 4, !dbg !261
  %43 = load i32, i32* %10, align 4, !dbg !263
  %44 = icmp ugt i32 %42, %43, !dbg !264
  br i1 %44, label %45, label %46, !dbg !265

45:                                               ; preds = %41
  store i32 0, i32* %5, align 4, !dbg !266
  br label %48, !dbg !266

46:                                               ; preds = %41
  %47 = call i32 (i8*, i8*, i32, i8*, ...) bitcast (i32 (...)* @__assert_fail to i32 (i8*, i8*, i32, i8*, ...)*)(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.17, i64 0, i64 0), i8* noundef getelementptr inbounds ([109 x i8], [109 x i8]* @.str.18, i64 0, i64 0), i32 noundef 15, i8* noundef getelementptr inbounds ([80 x i8], [80 x i8]* @__PRETTY_FUNCTION__.l_strnstart, i64 0, i64 0)), !dbg !267
  unreachable, !dbg !268

48:                                               ; preds = %45, %40
  %49 = load i32, i32* %5, align 4, !dbg !269
  ret i32 %49, !dbg !269
}

; Function Attrs: noreturn
declare i32 @__assert_fail(...) local_unnamed_addr #4

; Function Attrs: nofree noinline norecurse nosync nounwind uwtable
define dso_local i8* @memcpy(i8* noundef returned writeonly %0, i8* nocapture noundef readonly %1, i64 noundef %2) local_unnamed_addr #5 !dbg !270 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !278, metadata !DIExpression()), !dbg !279
  call void @llvm.dbg.value(metadata i8* %1, metadata !280, metadata !DIExpression()), !dbg !279
  call void @llvm.dbg.value(metadata i64 %2, metadata !281, metadata !DIExpression()), !dbg !279
  call void @llvm.dbg.value(metadata i8* %0, metadata !282, metadata !DIExpression()), !dbg !279
  call void @llvm.dbg.value(metadata i8* %1, metadata !283, metadata !DIExpression()), !dbg !279
  call void @llvm.dbg.value(metadata i64 %2, metadata !281, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !279
  %.not3 = icmp eq i64 %2, 0, !dbg !284
  br i1 %.not3, label %._crit_edge, label %.lr.ph, !dbg !285

.lr.ph:                                           ; preds = %3, %.lr.ph
  %.06 = phi i8* [ %5, %.lr.ph ], [ %1, %3 ]
  %.015 = phi i8* [ %7, %.lr.ph ], [ %0, %3 ]
  %.024 = phi i64 [ %4, %.lr.ph ], [ %2, %3 ]
  call void @llvm.dbg.value(metadata i8* %.06, metadata !283, metadata !DIExpression()), !dbg !279
  call void @llvm.dbg.value(metadata i8* %.015, metadata !282, metadata !DIExpression()), !dbg !279
  call void @llvm.dbg.value(metadata i64 %.024, metadata !281, metadata !DIExpression()), !dbg !279
  %4 = add i64 %.024, -1, !dbg !286
  call void @llvm.dbg.value(metadata i64 %4, metadata !281, metadata !DIExpression()), !dbg !279
  %5 = getelementptr inbounds i8, i8* %.06, i64 1, !dbg !287
  call void @llvm.dbg.value(metadata i8* %5, metadata !283, metadata !DIExpression()), !dbg !279
  %6 = load i8, i8* %.06, align 1, !dbg !288
  %7 = getelementptr inbounds i8, i8* %.015, i64 1, !dbg !289
  call void @llvm.dbg.value(metadata i8* %7, metadata !282, metadata !DIExpression()), !dbg !279
  store i8 %6, i8* %.015, align 1, !dbg !290
  call void @llvm.dbg.value(metadata i64 %4, metadata !281, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !279
  %.not = icmp eq i64 %4, 0, !dbg !284
  br i1 %.not, label %._crit_edge, label %.lr.ph, !dbg !285, !llvm.loop !291

._crit_edge:                                      ; preds = %.lr.ph, %3
  ret i8* %0, !dbg !293
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree noinline norecurse nosync nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0, !47, !53, !55}
!llvm.ident = !{!57, !57, !57, !57}
!llvm.module.flags = !{!58, !59, !60, !61, !62, !63, !64}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/092_print-beep.c_45_local_cpp_cwe-125-oob-read/harness/driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/092_print-beep.c_45_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "beec7d58b399784479e5b381604e7337")
!2 = !{!3, !46, !9}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "netdissect_options", file: !5, line: 40, baseType: !6)
!5 = !DIFile(filename: "driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/092_print-beep.c_45_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "beec7d58b399784479e5b381604e7337")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !5, line: 11, size: 1152, elements: !7)
!7 = !{!8, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !31, !33, !35, !36, !37, !38, !39, !44, !45}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_bflag", scope: !6, file: !5, line: 12, baseType: !9, size: 32)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_eflag", scope: !6, file: !5, line: 13, baseType: !9, size: 32, offset: 32)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_fflag", scope: !6, file: !5, line: 14, baseType: !9, size: 32, offset: 64)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Kflag", scope: !6, file: !5, line: 15, baseType: !9, size: 32, offset: 96)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_nflag", scope: !6, file: !5, line: 16, baseType: !9, size: 32, offset: 128)
!14 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Nflag", scope: !6, file: !5, line: 17, baseType: !9, size: 32, offset: 160)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_qflag", scope: !6, file: !5, line: 18, baseType: !9, size: 32, offset: 192)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Sflag", scope: !6, file: !5, line: 19, baseType: !9, size: 32, offset: 224)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_tflag", scope: !6, file: !5, line: 20, baseType: !9, size: 32, offset: 256)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_uflag", scope: !6, file: !5, line: 21, baseType: !9, size: 32, offset: 288)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_vflag", scope: !6, file: !5, line: 22, baseType: !9, size: 32, offset: 320)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_xflag", scope: !6, file: !5, line: 23, baseType: !9, size: 32, offset: 352)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Xflag", scope: !6, file: !5, line: 24, baseType: !9, size: 32, offset: 384)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Aflag", scope: !6, file: !5, line: 25, baseType: !9, size: 32, offset: 416)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Hflag", scope: !6, file: !5, line: 26, baseType: !9, size: 32, offset: 448)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_packet_number", scope: !6, file: !5, line: 27, baseType: !9, size: 32, offset: 480)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_suppress_default_print", scope: !6, file: !5, line: 28, baseType: !9, size: 32, offset: 512)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_tstamp_precision", scope: !6, file: !5, line: 29, baseType: !9, size: 32, offset: 544)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "program_name", scope: !6, file: !5, line: 30, baseType: !28, size: 64, offset: 576)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !30)
!30 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_espsecret", scope: !6, file: !5, line: 31, baseType: !32, size: 64, offset: 640)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_sa_list_head", scope: !6, file: !5, line: 32, baseType: !34, size: 64, offset: 704)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_sa_default", scope: !6, file: !5, line: 33, baseType: !34, size: 64, offset: 768)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_sigsecret", scope: !6, file: !5, line: 34, baseType: !32, size: 64, offset: 832)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_packettype", scope: !6, file: !5, line: 35, baseType: !9, size: 32, offset: 896)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_snaplen", scope: !6, file: !5, line: 36, baseType: !9, size: 32, offset: 928)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_packetp", scope: !6, file: !5, line: 37, baseType: !40, size: 64, offset: 960)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !5, line: 8, baseType: !43)
!43 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_snapend", scope: !6, file: !5, line: 38, baseType: !40, size: 64, offset: 1024)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_if_printer", scope: !6, file: !5, line: 39, baseType: !34, size: 64, offset: 1088)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!47 = distinct !DICompileUnit(language: DW_LANG_C99, file: !48, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !49, splitDebugInlining: false, nameTableKind: None)
!48 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/092_print-beep.c_45_local_cpp_cwe-125-oob-read/harness/print-beep.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/092_print-beep.c_45_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "5b4a076c4f00036215a7b66aca5d573c")
!49 = !{!28, !50}
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !51, line: 90, baseType: !52)
!51 = !DIFile(filename: "/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "a48e64edacc5b19f56c99745232c963c")
!52 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!53 = distinct !DICompileUnit(language: DW_LANG_C99, file: !54, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!54 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/092_print-beep.c_45_local_cpp_cwe-125-oob-read/harness/smart_stubs.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/092_print-beep.c_45_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "bcda1acd1a733c696e028616d9d6f3b5")
!55 = distinct !DICompileUnit(language: DW_LANG_C99, file: !56, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!56 = !DIFile(filename: "/opt/tools/klee/runtime/Freestanding/memcpy.c", directory: "/opt/tools/klee/build/runtime/Freestanding", checksumkind: CSK_MD5, checksum: "8fb9a7164e167db005d7d002570068bc")
!57 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!58 = !{i32 7, !"Dwarf Version", i32 5}
!59 = !{i32 2, !"Debug Info Version", i32 3}
!60 = !{i32 1, !"wchar_size", i32 4}
!61 = !{i32 7, !"PIC Level", i32 2}
!62 = !{i32 7, !"PIE Level", i32 2}
!63 = !{i32 7, !"uwtable", i32 1}
!64 = !{i32 7, !"frame-pointer", i32 2}
!65 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 44, type: !66, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !68)
!66 = !DISubroutineType(types: !67)
!67 = !{!9}
!68 = !{}
!69 = !DILocalVariable(name: "ndo", scope: !65, file: !5, line: 45, type: !3)
!70 = !DILocation(line: 45, column: 25, scope: !65)
!71 = !DILocation(line: 45, column: 53, scope: !65)
!72 = !DILocation(line: 45, column: 31, scope: !65)
!73 = !DILocalVariable(name: "length", scope: !65, file: !5, line: 46, type: !74)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !5, line: 9, baseType: !75)
!75 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!76 = !DILocation(line: 46, column: 11, scope: !65)
!77 = !DILocalVariable(name: "bp", scope: !65, file: !5, line: 47, type: !46)
!78 = !DILocation(line: 47, column: 13, scope: !65)
!79 = !DILocation(line: 47, column: 38, scope: !65)
!80 = !DILocation(line: 47, column: 28, scope: !65)
!81 = !DILocation(line: 48, column: 24, scope: !65)
!82 = !DILocation(line: 48, column: 28, scope: !65)
!83 = !DILocation(line: 48, column: 5, scope: !65)
!84 = !DILocation(line: 49, column: 12, scope: !65)
!85 = !DILocation(line: 49, column: 5, scope: !65)
!86 = !DILocation(line: 50, column: 24, scope: !65)
!87 = !DILocation(line: 50, column: 5, scope: !65)
!88 = !DILocation(line: 50, column: 10, scope: !65)
!89 = !DILocation(line: 50, column: 22, scope: !65)
!90 = !DILocation(line: 51, column: 24, scope: !65)
!91 = !DILocation(line: 51, column: 29, scope: !65)
!92 = !DILocation(line: 51, column: 27, scope: !65)
!93 = !DILocation(line: 51, column: 5, scope: !65)
!94 = !DILocation(line: 51, column: 10, scope: !65)
!95 = !DILocation(line: 51, column: 22, scope: !65)
!96 = !DILocation(line: 52, column: 29, scope: !65)
!97 = !DILocation(line: 52, column: 5, scope: !65)
!98 = !DILocation(line: 52, column: 10, scope: !65)
!99 = !DILocation(line: 52, column: 22, scope: !65)
!100 = !DILocation(line: 53, column: 16, scope: !65)
!101 = !DILocation(line: 53, column: 21, scope: !65)
!102 = !DILocation(line: 53, column: 25, scope: !65)
!103 = !DILocation(line: 53, column: 5, scope: !65)
!104 = !DILocation(line: 54, column: 5, scope: !65)
!105 = distinct !DISubprogram(name: "beep_print", scope: !106, file: !106, line: 19, type: !107, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !68)
!106 = !DIFile(filename: "print-beep.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/092_print-beep.c_45_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "5b4a076c4f00036215a7b66aca5d573c")
!107 = !DISubroutineType(types: !108)
!108 = !{null, !109, !142, !154}
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!110 = !DIDerivedType(tag: DW_TAG_typedef, name: "netdissect_options", file: !111, line: 136, baseType: !112)
!111 = !DIFile(filename: "src_copy/netdissect.h", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/092_print-beep.c_45_local_cpp_cwe-125-oob-read", checksumkind: CSK_MD5, checksum: "dbc82a50c9b0ecb6f03752e632a7f5e5")
!112 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !111, line: 142, size: 1408, elements: !113)
!113 = !{!114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !137, !138, !139, !140, !141, !148, !149, !174, !176, !180, !184}
!114 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_bflag", scope: !112, file: !111, line: 143, baseType: !9, size: 32)
!115 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_eflag", scope: !112, file: !111, line: 144, baseType: !9, size: 32, offset: 32)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_fflag", scope: !112, file: !111, line: 145, baseType: !9, size: 32, offset: 64)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Kflag", scope: !112, file: !111, line: 146, baseType: !9, size: 32, offset: 96)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_nflag", scope: !112, file: !111, line: 147, baseType: !9, size: 32, offset: 128)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Nflag", scope: !112, file: !111, line: 148, baseType: !9, size: 32, offset: 160)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_qflag", scope: !112, file: !111, line: 149, baseType: !9, size: 32, offset: 192)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Sflag", scope: !112, file: !111, line: 150, baseType: !9, size: 32, offset: 224)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_tflag", scope: !112, file: !111, line: 151, baseType: !9, size: 32, offset: 256)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_uflag", scope: !112, file: !111, line: 152, baseType: !9, size: 32, offset: 288)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_vflag", scope: !112, file: !111, line: 153, baseType: !9, size: 32, offset: 320)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_xflag", scope: !112, file: !111, line: 154, baseType: !9, size: 32, offset: 352)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Xflag", scope: !112, file: !111, line: 155, baseType: !9, size: 32, offset: 384)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Aflag", scope: !112, file: !111, line: 156, baseType: !9, size: 32, offset: 416)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Hflag", scope: !112, file: !111, line: 159, baseType: !9, size: 32, offset: 448)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_packet_number", scope: !112, file: !111, line: 160, baseType: !9, size: 32, offset: 480)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_suppress_default_print", scope: !112, file: !111, line: 161, baseType: !9, size: 32, offset: 512)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_tstamp_precision", scope: !112, file: !111, line: 162, baseType: !9, size: 32, offset: 544)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "program_name", scope: !112, file: !111, line: 163, baseType: !28, size: 64, offset: 576)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_espsecret", scope: !112, file: !111, line: 165, baseType: !32, size: 64, offset: 640)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_sa_list_head", scope: !112, file: !111, line: 166, baseType: !135, size: 64, offset: 704)
!135 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !136, size: 64)
!136 = !DICompositeType(tag: DW_TAG_structure_type, name: "sa_list", file: !111, line: 166, flags: DIFlagFwdDecl)
!137 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_sa_default", scope: !112, file: !111, line: 167, baseType: !135, size: 64, offset: 768)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_sigsecret", scope: !112, file: !111, line: 169, baseType: !32, size: 64, offset: 832)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_packettype", scope: !112, file: !111, line: 171, baseType: !9, size: 32, offset: 896)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_snaplen", scope: !112, file: !111, line: 173, baseType: !9, size: 32, offset: 928)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_packetp", scope: !112, file: !111, line: 176, baseType: !142, size: 64, offset: 960)
!142 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !143, size: 64)
!143 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !144)
!144 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !145, line: 33, baseType: !146)
!145 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "", checksumkind: CSK_MD5, checksum: "e62424071ad3f1b4d088c139fd9ccfd1")
!146 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u_char", file: !147, line: 31, baseType: !43)
!147 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!148 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_snapend", scope: !112, file: !111, line: 177, baseType: !142, size: 64, offset: 1024)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_if_printer", scope: !112, file: !111, line: 180, baseType: !150, size: 64, offset: 1088)
!150 = !DIDerivedType(tag: DW_TAG_typedef, name: "if_printer", file: !111, line: 140, baseType: !151)
!151 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !152, size: 64)
!152 = !DISubroutineType(types: !153)
!153 = !{!154, !109, !156, !142}
!154 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !145, line: 35, baseType: !155)
!155 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u_int", file: !147, line: 33, baseType: !75)
!156 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !157, size: 64)
!157 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !158)
!158 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "pcap_pkthdr", file: !159, line: 245, size: 192, elements: !160)
!159 = !DIFile(filename: "/usr/include/pcap/pcap.h", directory: "", checksumkind: CSK_MD5, checksum: "df342b11dea7ddce117571532923c631")
!160 = !{!161, !170, !173}
!161 = !DIDerivedType(tag: DW_TAG_member, name: "ts", scope: !158, file: !159, line: 246, baseType: !162, size: 128)
!162 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !163, line: 8, size: 128, elements: !164)
!163 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h", directory: "", checksumkind: CSK_MD5, checksum: "9b45d950050c215f216850b27bd1e8f3")
!164 = !{!165, !168}
!165 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !162, file: !163, line: 14, baseType: !166, size: 64)
!166 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !147, line: 160, baseType: !167)
!167 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!168 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !162, file: !163, line: 15, baseType: !169, size: 64, offset: 64)
!169 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !147, line: 162, baseType: !167)
!170 = !DIDerivedType(tag: DW_TAG_member, name: "caplen", scope: !158, file: !159, line: 247, baseType: !171, size: 32, offset: 128)
!171 = !DIDerivedType(tag: DW_TAG_typedef, name: "bpf_u_int32", file: !172, line: 98, baseType: !154)
!172 = !DIFile(filename: "/usr/include/pcap/bpf.h", directory: "", checksumkind: CSK_MD5, checksum: "e736341f781a19c2dd15abe08571efa1")
!173 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !158, file: !159, line: 248, baseType: !171, size: 32, offset: 160)
!174 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_default_print", scope: !112, file: !111, line: 183, baseType: !175, size: 64, offset: 1152)
!175 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !107, size: 64)
!176 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_printf", scope: !112, file: !111, line: 187, baseType: !177, size: 64, offset: 1216)
!177 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !178, size: 64)
!178 = !DISubroutineType(types: !179)
!179 = !{!9, !109, !28, null}
!180 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_error", scope: !112, file: !111, line: 194, baseType: !181, size: 64, offset: 1280)
!181 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !182, size: 64)
!182 = !DISubroutineType(types: !183)
!183 = !{null, !109, !28, null}
!184 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_warning", scope: !112, file: !111, line: 204, baseType: !181, size: 64, offset: 1344)
!185 = !DILocalVariable(name: "ndo", arg: 1, scope: !105, file: !106, line: 19, type: !109)
!186 = !DILocation(line: 19, column: 37, scope: !105)
!187 = !DILocalVariable(name: "bp", arg: 2, scope: !105, file: !106, line: 19, type: !142)
!188 = !DILocation(line: 19, column: 56, scope: !105)
!189 = !DILocalVariable(name: "length", arg: 3, scope: !105, file: !106, line: 19, type: !154)
!190 = !DILocation(line: 19, column: 66, scope: !105)
!191 = !DILocation(line: 21, column: 5, scope: !105)
!192 = !DILocation(line: 22, column: 21, scope: !193)
!193 = distinct !DILexicalBlock(scope: !105, file: !106, line: 22, column: 9)
!194 = !DILocation(line: 22, column: 50, scope: !193)
!195 = !DILocation(line: 22, column: 54, scope: !193)
!196 = !DILocation(line: 22, column: 9, scope: !193)
!197 = !DILocation(line: 22, column: 9, scope: !105)
!198 = !DILocation(line: 23, column: 9, scope: !193)
!199 = !DILocation(line: 24, column: 26, scope: !200)
!200 = distinct !DILexicalBlock(scope: !193, file: !106, line: 24, column: 14)
!201 = !DILocation(line: 24, column: 56, scope: !200)
!202 = !DILocation(line: 24, column: 60, scope: !200)
!203 = !DILocation(line: 24, column: 14, scope: !200)
!204 = !DILocation(line: 24, column: 14, scope: !193)
!205 = !DILocation(line: 25, column: 9, scope: !200)
!206 = !DILocation(line: 26, column: 26, scope: !207)
!207 = distinct !DILexicalBlock(scope: !200, file: !106, line: 26, column: 14)
!208 = !DILocation(line: 26, column: 56, scope: !207)
!209 = !DILocation(line: 26, column: 60, scope: !207)
!210 = !DILocation(line: 26, column: 14, scope: !207)
!211 = !DILocation(line: 26, column: 14, scope: !200)
!212 = !DILocation(line: 27, column: 9, scope: !207)
!213 = !DILocation(line: 28, column: 26, scope: !214)
!214 = distinct !DILexicalBlock(scope: !207, file: !106, line: 28, column: 14)
!215 = !DILocation(line: 28, column: 56, scope: !214)
!216 = !DILocation(line: 28, column: 60, scope: !214)
!217 = !DILocation(line: 28, column: 14, scope: !214)
!218 = !DILocation(line: 28, column: 14, scope: !207)
!219 = !DILocation(line: 29, column: 9, scope: !214)
!220 = !DILocation(line: 30, column: 26, scope: !221)
!221 = distinct !DILexicalBlock(scope: !214, file: !106, line: 30, column: 14)
!222 = !DILocation(line: 30, column: 56, scope: !221)
!223 = !DILocation(line: 30, column: 60, scope: !221)
!224 = !DILocation(line: 30, column: 14, scope: !221)
!225 = !DILocation(line: 30, column: 14, scope: !214)
!226 = !DILocation(line: 31, column: 9, scope: !221)
!227 = !DILocation(line: 32, column: 26, scope: !228)
!228 = distinct !DILexicalBlock(scope: !221, file: !106, line: 32, column: 14)
!229 = !DILocation(line: 32, column: 56, scope: !228)
!230 = !DILocation(line: 32, column: 60, scope: !228)
!231 = !DILocation(line: 32, column: 14, scope: !228)
!232 = !DILocation(line: 32, column: 14, scope: !221)
!233 = !DILocation(line: 33, column: 9, scope: !228)
!234 = !DILocation(line: 34, column: 26, scope: !235)
!235 = distinct !DILexicalBlock(scope: !228, file: !106, line: 34, column: 14)
!236 = !DILocation(line: 34, column: 55, scope: !235)
!237 = !DILocation(line: 34, column: 59, scope: !235)
!238 = !DILocation(line: 34, column: 14, scope: !235)
!239 = !DILocation(line: 34, column: 14, scope: !228)
!240 = !DILocation(line: 35, column: 9, scope: !235)
!241 = !DILocation(line: 37, column: 9, scope: !235)
!242 = !DILocation(line: 38, column: 1, scope: !105)
!243 = distinct !DISubprogram(name: "l_strnstart", scope: !106, file: !106, line: 9, type: !244, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !68)
!244 = !DISubroutineType(types: !245)
!245 = !{!9, !109, !28, !154, !28, !154}
!246 = !DILocalVariable(name: "ndo", arg: 1, scope: !243, file: !106, line: 9, type: !109)
!247 = !DILocation(line: 9, column: 44, scope: !243)
!248 = !DILocalVariable(name: "tstr1", arg: 2, scope: !243, file: !106, line: 9, type: !28)
!249 = !DILocation(line: 9, column: 61, scope: !243)
!250 = !DILocalVariable(name: "tl1", arg: 3, scope: !243, file: !106, line: 9, type: !154)
!251 = !DILocation(line: 9, column: 74, scope: !243)
!252 = !DILocalVariable(name: "str2", arg: 4, scope: !243, file: !106, line: 10, type: !28)
!253 = !DILocation(line: 10, column: 17, scope: !243)
!254 = !DILocalVariable(name: "l2", arg: 5, scope: !243, file: !106, line: 10, type: !154)
!255 = !DILocation(line: 10, column: 29, scope: !243)
!256 = !DILocation(line: 12, column: 5, scope: !243)
!257 = !DILocation(line: 13, column: 10, scope: !258)
!258 = distinct !DILexicalBlock(scope: !243, file: !106, line: 13, column: 9)
!259 = !DILocation(line: 13, column: 9, scope: !243)
!260 = !DILocation(line: 13, column: 33, scope: !258)
!261 = !DILocation(line: 14, column: 9, scope: !262)
!262 = distinct !DILexicalBlock(scope: !243, file: !106, line: 14, column: 9)
!263 = !DILocation(line: 14, column: 15, scope: !262)
!264 = !DILocation(line: 14, column: 13, scope: !262)
!265 = !DILocation(line: 14, column: 9, scope: !243)
!266 = !DILocation(line: 14, column: 19, scope: !262)
!267 = !DILocation(line: 15, column: 5, scope: !243)
!268 = !DILocation(line: 16, column: 21, scope: !243)
!269 = !DILocation(line: 17, column: 1, scope: !243)
!270 = distinct !DISubprogram(name: "memcpy", scope: !271, file: !271, line: 12, type: !272, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !55, retainedNodes: !68)
!271 = !DIFile(filename: "runtime/Freestanding/memcpy.c", directory: "/opt/tools/klee", checksumkind: CSK_MD5, checksum: "8fb9a7164e167db005d7d002570068bc")
!272 = !DISubroutineType(types: !273)
!273 = !{!34, !34, !274, !276}
!274 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !275, size: 64)
!275 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!276 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !277, line: 46, baseType: !52)
!277 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!278 = !DILocalVariable(name: "destaddr", arg: 1, scope: !270, file: !271, line: 12, type: !34)
!279 = !DILocation(line: 0, scope: !270)
!280 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !270, file: !271, line: 12, type: !274)
!281 = !DILocalVariable(name: "len", arg: 3, scope: !270, file: !271, line: 12, type: !276)
!282 = !DILocalVariable(name: "dest", scope: !270, file: !271, line: 13, type: !32)
!283 = !DILocalVariable(name: "src", scope: !270, file: !271, line: 14, type: !28)
!284 = !DILocation(line: 16, column: 16, scope: !270)
!285 = !DILocation(line: 16, column: 3, scope: !270)
!286 = !DILocation(line: 16, column: 13, scope: !270)
!287 = !DILocation(line: 17, column: 19, scope: !270)
!288 = !DILocation(line: 17, column: 15, scope: !270)
!289 = !DILocation(line: 17, column: 10, scope: !270)
!290 = !DILocation(line: 17, column: 13, scope: !270)
!291 = distinct !{!291, !285, !287, !292}
!292 = !{!"llvm.loop.mustprogress"}
!293 = !DILocation(line: 18, column: 3, scope: !270)
