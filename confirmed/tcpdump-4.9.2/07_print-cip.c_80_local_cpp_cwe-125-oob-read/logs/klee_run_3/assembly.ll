; ModuleID = '/app/se_runs/sailor_engine/tcpdump-4.9.2/094_print-cip.c_80_local_cpp_cwe-125-oob-read/harness/slice.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.netdissect_options = type { i32, i32 }
%struct.pcap_pkthdr = type { %struct.timeval, i32, i32 }
%struct.timeval = type { i64, i64 }

@.str = private unnamed_addr constant [4 x i8] c"ndo\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"h\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"p\00", align 1
@.str.3 = private unnamed_addr constant [31 x i8] c"SPINE_PROBE:cip_if_print:ENTRY\00", align 1
@.str.1.4 = private unnamed_addr constant [7 x i8] c"\AA\AA\03\00\00\00\00", align 1
@.str.2.5 = private unnamed_addr constant [27 x i8] c"0 && \22SAILOR_SINK_REACHED\22\00", align 1
@.str.3.6 = private unnamed_addr constant [107 x i8] c"/app/se_runs/sailor_engine/tcpdump-4.9.2/094_print-cip.c_80_local_cpp_cwe-125-oob-read/harness/print-cip.c\00", align 1
@__PRETTY_FUNCTION__.cip_if_print = private unnamed_addr constant [85 x i8] c"u_int cip_if_print(netdissect_options *, const struct pcap_pkthdr *, const u_char *)\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !52 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.netdissect_options*, align 8
  %3 = alloca %struct.pcap_pkthdr*, align 8
  %4 = alloca i8*, align 8
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %2, metadata !57, metadata !DIExpression()), !dbg !58
  %5 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 8) #6, !dbg !59
  %6 = bitcast i8* %5 to %struct.netdissect_options*, !dbg !60
  store %struct.netdissect_options* %6, %struct.netdissect_options** %2, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata %struct.pcap_pkthdr** %3, metadata !61, metadata !DIExpression()), !dbg !62
  %7 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 24) #6, !dbg !63
  %8 = bitcast i8* %7 to %struct.pcap_pkthdr*, !dbg !64
  store %struct.pcap_pkthdr* %8, %struct.pcap_pkthdr** %3, align 8, !dbg !62
  call void @llvm.dbg.declare(metadata i8** %4, metadata !65, metadata !DIExpression()), !dbg !66
  %9 = call noalias i8* @malloc(i64 noundef 4) #6, !dbg !67
  store i8* %9, i8** %4, align 8, !dbg !66
  %10 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !68
  %11 = bitcast %struct.netdissect_options* %10 to i8*, !dbg !68
  call void @klee_make_symbolic(i8* noundef %11, i64 noundef 8, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !69
  %12 = load %struct.pcap_pkthdr*, %struct.pcap_pkthdr** %3, align 8, !dbg !70
  %13 = bitcast %struct.pcap_pkthdr* %12 to i8*, !dbg !70
  call void @klee_make_symbolic(i8* noundef %13, i64 noundef 24, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  %14 = load i8*, i8** %4, align 8, !dbg !72
  call void @klee_make_symbolic(i8* noundef %14, i64 noundef 4, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  %15 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !74
  %16 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %15, i32 0, i32 0, !dbg !75
  store i32 0, i32* %16, align 4, !dbg !76
  %17 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !77
  %18 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %17, i32 0, i32 1, !dbg !78
  store i32 1, i32* %18, align 4, !dbg !79
  %19 = load %struct.pcap_pkthdr*, %struct.pcap_pkthdr** %3, align 8, !dbg !80
  %20 = getelementptr inbounds %struct.pcap_pkthdr, %struct.pcap_pkthdr* %19, i32 0, i32 1, !dbg !81
  store i32 6, i32* %20, align 8, !dbg !82
  %21 = load %struct.pcap_pkthdr*, %struct.pcap_pkthdr** %3, align 8, !dbg !83
  %22 = getelementptr inbounds %struct.pcap_pkthdr, %struct.pcap_pkthdr* %21, i32 0, i32 2, !dbg !84
  store i32 6, i32* %22, align 4, !dbg !85
  %23 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !86
  %24 = load %struct.pcap_pkthdr*, %struct.pcap_pkthdr** %3, align 8, !dbg !87
  %25 = load i8*, i8** %4, align 8, !dbg !88
  call fastcc void @cip_if_print(%struct.netdissect_options* noundef %23, %struct.pcap_pkthdr* noundef %24, i8* noundef %25), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) local_unnamed_addr #2

declare void @klee_make_symbolic(i8* noundef, i64 noundef, i8* noundef) local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @cip_if_print(%struct.netdissect_options* noundef %0, %struct.pcap_pkthdr* noundef %1, i8* noundef %2) unnamed_addr #0 !dbg !91 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.netdissect_options*, align 8
  %6 = alloca %struct.pcap_pkthdr*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  store %struct.netdissect_options* %0, %struct.netdissect_options** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %5, metadata !115, metadata !DIExpression()), !dbg !116
  store %struct.pcap_pkthdr* %1, %struct.pcap_pkthdr** %6, align 8
  call void @llvm.dbg.declare(metadata %struct.pcap_pkthdr** %6, metadata !117, metadata !DIExpression()), !dbg !118
  store i8* %2, i8** %7, align 8
  call void @llvm.dbg.declare(metadata i8** %7, metadata !119, metadata !DIExpression()), !dbg !120
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.3, i64 0, i64 0)), !dbg !121
  call void @llvm.dbg.declare(metadata i32* %8, metadata !122, metadata !DIExpression()), !dbg !123
  %12 = load %struct.pcap_pkthdr*, %struct.pcap_pkthdr** %6, align 8, !dbg !124
  %13 = getelementptr inbounds %struct.pcap_pkthdr, %struct.pcap_pkthdr* %12, i32 0, i32 1, !dbg !125
  %14 = load i32, i32* %13, align 8, !dbg !125
  store i32 %14, i32* %8, align 4, !dbg !123
  call void @llvm.dbg.declare(metadata i32* %9, metadata !126, metadata !DIExpression()), !dbg !127
  %15 = load %struct.pcap_pkthdr*, %struct.pcap_pkthdr** %6, align 8, !dbg !128
  %16 = getelementptr inbounds %struct.pcap_pkthdr, %struct.pcap_pkthdr* %15, i32 0, i32 2, !dbg !129
  %17 = load i32, i32* %16, align 4, !dbg !129
  store i32 %17, i32* %9, align 4, !dbg !127
  call void @llvm.dbg.declare(metadata i64* %10, metadata !130, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata i32* %11, metadata !135, metadata !DIExpression()), !dbg !136
  store i64 6, i64* %10, align 8, !dbg !137
  %18 = load i64, i64* %10, align 8, !dbg !138
  %19 = load i32, i32* %8, align 4, !dbg !140
  %20 = zext i32 %19 to i64, !dbg !140
  %21 = icmp ugt i64 %18, %20, !dbg !141
  br i1 %21, label %22, label %25, !dbg !142

22:                                               ; preds = %3
  %23 = load i32, i32* %8, align 4, !dbg !143
  %24 = zext i32 %23 to i64, !dbg !143
  store i64 %24, i64* %10, align 8, !dbg !144
  br label %25, !dbg !145

25:                                               ; preds = %22, %3
  %26 = load i64, i64* %10, align 8, !dbg !146
  %27 = load i32, i32* %9, align 4, !dbg !148
  %28 = zext i32 %27 to i64, !dbg !148
  %29 = icmp ugt i64 %26, %28, !dbg !149
  br i1 %29, label %30, label %33, !dbg !150

30:                                               ; preds = %25
  %31 = load i32, i32* %9, align 4, !dbg !151
  %32 = zext i32 %31 to i64, !dbg !151
  store i64 %32, i64* %10, align 8, !dbg !152
  br label %33, !dbg !153

33:                                               ; preds = %30, %25
  %34 = load %struct.netdissect_options*, %struct.netdissect_options** %5, align 8, !dbg !154
  %35 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %34, i32 0, i32 0, !dbg !156
  %36 = load i32, i32* %35, align 4, !dbg !156
  %37 = icmp ne i32 %36, 0, !dbg !154
  br i1 %37, label %38, label %41, !dbg !157

38:                                               ; preds = %33
  %39 = load %struct.netdissect_options*, %struct.netdissect_options** %5, align 8, !dbg !158
  %40 = load i32, i32* %9, align 4, !dbg !159
  call fastcc void @cip_print(%struct.netdissect_options* noundef %39, i32 noundef %40), !dbg !160
  br label %41, !dbg !160

41:                                               ; preds = %38, %33
  %42 = load i64, i64* %10, align 8, !dbg !161
  %43 = icmp eq i64 %42, 0, !dbg !163
  br i1 %43, label %44, label %47, !dbg !164

44:                                               ; preds = %41
  br label %45, !dbg !165

45:                                               ; preds = %44
  br label %46, !dbg !167

46:                                               ; preds = %45
  store i32 0, i32* %4, align 4, !dbg !169
  br label %79, !dbg !169

47:                                               ; preds = %41
  %48 = load i8*, i8** %7, align 8, !dbg !170
  %49 = load i64, i64* %10, align 8, !dbg !172
  %50 = call i32 @memcmp(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1.4, i64 0, i64 0), i8* noundef %48, i64 noundef %49) #7, !dbg !173
  %51 = icmp eq i32 %50, 0, !dbg !174
  br i1 %51, label %52, label %73, !dbg !175

52:                                               ; preds = %47
  %53 = load %struct.netdissect_options*, %struct.netdissect_options** %5, align 8, !dbg !176
  %54 = load i8*, i8** %7, align 8, !dbg !178
  %55 = load i32, i32* %9, align 4, !dbg !179
  %56 = load i32, i32* %8, align 4, !dbg !180
  call fastcc void @llc_print(%struct.netdissect_options* noundef %53, i8* noundef %54, i32 noundef %55, i32 noundef %56), !dbg !181
  store i32 -1, i32* %11, align 4, !dbg !182
  %57 = load i32, i32* %11, align 4, !dbg !183
  %58 = icmp slt i32 %57, 0, !dbg !185
  br i1 %58, label %59, label %72, !dbg !186

59:                                               ; preds = %52
  %60 = load %struct.netdissect_options*, %struct.netdissect_options** %5, align 8, !dbg !187
  %61 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %60, i32 0, i32 1, !dbg !190
  %62 = load i32, i32* %61, align 4, !dbg !190
  %63 = icmp ne i32 %62, 0, !dbg !187
  br i1 %63, label %69, label %64, !dbg !191

64:                                               ; preds = %59
  br label %65, !dbg !192

65:                                               ; preds = %64
  %66 = load i8*, i8** %7, align 8, !dbg !193
  %67 = load i32, i32* %8, align 4, !dbg !193
  br label %68, !dbg !193

68:                                               ; preds = %65
  br label %69, !dbg !193

69:                                               ; preds = %68, %59
  %70 = load i32, i32* %11, align 4, !dbg !195
  %71 = sub nsw i32 0, %70, !dbg !196
  store i32 %71, i32* %11, align 4, !dbg !197
  br label %72, !dbg !198

72:                                               ; preds = %69, %52
  br label %77, !dbg !199

73:                                               ; preds = %47
  store i32 0, i32* %11, align 4, !dbg !200
  %74 = load %struct.netdissect_options*, %struct.netdissect_options** %5, align 8, !dbg !202
  %75 = load i8*, i8** %7, align 8, !dbg !203
  %76 = load i32, i32* %9, align 4, !dbg !204
  call fastcc void @ip_print(%struct.netdissect_options* noundef %74, i8* noundef %75, i32 noundef %76), !dbg !205
  br label %77

77:                                               ; preds = %73, %72
  %78 = call i32 (i8*, i8*, i32, i8*, ...) bitcast (i32 (...)* @__assert_fail to i32 (i8*, i8*, i32, i8*, ...)*)(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2.5, i64 0, i64 0), i8* noundef getelementptr inbounds ([107 x i8], [107 x i8]* @.str.3.6, i64 0, i64 0), i32 noundef 57, i8* noundef getelementptr inbounds ([85 x i8], [85 x i8]* @__PRETTY_FUNCTION__.cip_if_print, i64 0, i64 0)), !dbg !206
  unreachable, !dbg !207

79:                                               ; preds = %46
  %80 = load i32, i32* %4, align 4, !dbg !208
  ret void, !dbg !208
}

declare void @klee_warning_once(i8* noundef) local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @cip_print(%struct.netdissect_options* noundef %0, i32 noundef %1) unnamed_addr #0 !dbg !209 {
  %3 = alloca %struct.netdissect_options*, align 8
  %4 = alloca i32, align 4
  store %struct.netdissect_options* %0, %struct.netdissect_options** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %3, metadata !212, metadata !DIExpression()), !dbg !213
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !214, metadata !DIExpression()), !dbg !215
  %5 = load %struct.netdissect_options*, %struct.netdissect_options** %3, align 8, !dbg !216
  %6 = load i32, i32* %4, align 4, !dbg !217
  ret void, !dbg !218
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @llc_print(%struct.netdissect_options* noundef %0, i8* noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #0 !dbg !219 {
  %5 = alloca %struct.netdissect_options*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  store %struct.netdissect_options* %0, %struct.netdissect_options** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %5, metadata !222, metadata !DIExpression()), !dbg !223
  store i8* %1, i8** %6, align 8
  call void @llvm.dbg.declare(metadata i8** %6, metadata !224, metadata !DIExpression()), !dbg !225
  store i32 %2, i32* %7, align 4
  call void @llvm.dbg.declare(metadata i32* %7, metadata !226, metadata !DIExpression()), !dbg !227
  store i32 %3, i32* %8, align 4
  call void @llvm.dbg.declare(metadata i32* %8, metadata !228, metadata !DIExpression()), !dbg !229
  store i8* null, i8** %9, align 8
  call void @llvm.dbg.declare(metadata i8** %9, metadata !230, metadata !DIExpression()), !dbg !231
  store i8* null, i8** %10, align 8
  call void @llvm.dbg.declare(metadata i8** %10, metadata !232, metadata !DIExpression()), !dbg !233
  %11 = load %struct.netdissect_options*, %struct.netdissect_options** %5, align 8, !dbg !234
  %12 = load i8*, i8** %6, align 8, !dbg !235
  %13 = load i32, i32* %7, align 4, !dbg !236
  %14 = load i32, i32* %8, align 4, !dbg !237
  %15 = load i8*, i8** %9, align 8, !dbg !238
  %16 = load i8*, i8** %10, align 8, !dbg !239
  ret void, !dbg !240
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @ip_print(%struct.netdissect_options* noundef %0, i8* noundef %1, i32 noundef %2) unnamed_addr #0 !dbg !241 {
  %4 = alloca %struct.netdissect_options*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  store %struct.netdissect_options* %0, %struct.netdissect_options** %4, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %4, metadata !244, metadata !DIExpression()), !dbg !245
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !246, metadata !DIExpression()), !dbg !247
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !248, metadata !DIExpression()), !dbg !249
  %7 = load %struct.netdissect_options*, %struct.netdissect_options** %4, align 8, !dbg !250
  %8 = load i8*, i8** %5, align 8, !dbg !251
  %9 = load i32, i32* %6, align 4, !dbg !252
  ret void, !dbg !253
}

; Function Attrs: noreturn
declare i32 @__assert_fail(...) local_unnamed_addr #4

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readonly uwtable willreturn
define dso_local i32 @memcmp(i8* nocapture noundef nonnull readonly %0, i8* nocapture noundef nonnull readonly %1, i64 noundef %2) local_unnamed_addr #5 !dbg !254 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !260, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.value(metadata i8* %1, metadata !262, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.value(metadata i64 %2, metadata !263, metadata !DIExpression()), !dbg !261
  %.not = icmp eq i64 %2, 0, !dbg !264
  br i1 %.not, label %.loopexit, label %.preheader, !dbg !266

.preheader:                                       ; preds = %3, %10
  %.03 = phi i64 [ %13, %10 ], [ %2, %3 ]
  %.02 = phi i8* [ %12, %10 ], [ %0, %3 ], !dbg !267
  %.01 = phi i8* [ %11, %10 ], [ %1, %3 ], !dbg !267
  call void @llvm.dbg.value(metadata i8* %.01, metadata !269, metadata !DIExpression()), !dbg !267
  call void @llvm.dbg.value(metadata i8* %.02, metadata !272, metadata !DIExpression()), !dbg !267
  call void @llvm.dbg.value(metadata i64 %.03, metadata !263, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.value(metadata i8* %.02, metadata !272, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !267
  %4 = load i8, i8* %.02, align 1, !dbg !273
  call void @llvm.dbg.value(metadata i8* %.01, metadata !269, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !267
  %5 = load i8, i8* %.01, align 1, !dbg !276
  %.not4 = icmp eq i8 %4, %5, !dbg !277
  br i1 %.not4, label %10, label %6, !dbg !278

6:                                                ; preds = %.preheader
  call void @llvm.dbg.value(metadata i8* %.02, metadata !272, metadata !DIExpression()), !dbg !267
  %7 = zext i8 %4 to i32, !dbg !279
  call void @llvm.dbg.value(metadata i8* %.01, metadata !269, metadata !DIExpression()), !dbg !267
  %8 = zext i8 %5 to i32, !dbg !281
  %9 = sub nsw i32 %7, %8, !dbg !282
  br label %.loopexit, !dbg !283

10:                                               ; preds = %.preheader
  %11 = getelementptr inbounds i8, i8* %.01, i64 1, !dbg !284
  call void @llvm.dbg.value(metadata i8* %11, metadata !269, metadata !DIExpression()), !dbg !267
  %12 = getelementptr inbounds i8, i8* %.02, i64 1, !dbg !285
  call void @llvm.dbg.value(metadata i8* %12, metadata !272, metadata !DIExpression()), !dbg !267
  %13 = add i64 %.03, -1, !dbg !286
  call void @llvm.dbg.value(metadata i64 %13, metadata !263, metadata !DIExpression()), !dbg !261
  %.not5 = icmp eq i64 %13, 0, !dbg !287
  br i1 %.not5, label %.loopexit, label %.preheader, !dbg !288, !llvm.loop !289

.loopexit:                                        ; preds = %10, %3, %6
  %.0 = phi i32 [ %9, %6 ], [ 0, %3 ], [ 0, %10 ], !dbg !261
  ret i32 %.0, !dbg !293
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
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0, !36, !40, !42}
!llvm.ident = !{!44, !44, !44, !44}
!llvm.module.flags = !{!45, !46, !47, !48, !49, !50, !51}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/094_print-cip.c_80_local_cpp_cwe-125-oob-read/harness/driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/094_print-cip.c_80_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "7925c318041ca50c5df3e9acdf72a78f")
!2 = !{!3, !11, !33}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "netdissect_options", file: !5, line: 15, baseType: !6)
!5 = !DIFile(filename: "harness_types.h", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/094_print-cip.c_80_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "18256b5584b59f2879f4a41daad03ddf")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !5, line: 12, size: 64, elements: !7)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_eflag", scope: !6, file: !5, line: 13, baseType: !9, size: 32)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_suppress_default_print", scope: !6, file: !5, line: 14, baseType: !9, size: 32, offset: 32)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "pcap_pkthdr", file: !13, line: 245, size: 192, elements: !14)
!13 = !DIFile(filename: "/usr/include/pcap/pcap.h", directory: "", checksumkind: CSK_MD5, checksum: "df342b11dea7ddce117571532923c631")
!14 = !{!15, !25, !32}
!15 = !DIDerivedType(tag: DW_TAG_member, name: "ts", scope: !12, file: !13, line: 246, baseType: !16, size: 128)
!16 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !17, line: 8, size: 128, elements: !18)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h", directory: "", checksumkind: CSK_MD5, checksum: "9b45d950050c215f216850b27bd1e8f3")
!18 = !{!19, !23}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !16, file: !17, line: 14, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !21, line: 160, baseType: !22)
!21 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!22 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !16, file: !17, line: 15, baseType: !24, size: 64, offset: 64)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !21, line: 162, baseType: !22)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "caplen", scope: !12, file: !13, line: 247, baseType: !26, size: 32, offset: 128)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "bpf_u_int32", file: !27, line: 98, baseType: !28)
!27 = !DIFile(filename: "/usr/include/pcap/bpf.h", directory: "", checksumkind: CSK_MD5, checksum: "e736341f781a19c2dd15abe08571efa1")
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !29, line: 35, baseType: !30)
!29 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "", checksumkind: CSK_MD5, checksum: "e62424071ad3f1b4d088c139fd9ccfd1")
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u_int", file: !21, line: 33, baseType: !31)
!31 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !12, file: !13, line: 248, baseType: !26, size: 32, offset: 160)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !5, line: 10, baseType: !35)
!35 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!36 = distinct !DICompileUnit(language: DW_LANG_C99, file: !37, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !38, splitDebugInlining: false, nameTableKind: None)
!37 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/094_print-cip.c_80_local_cpp_cwe-125-oob-read/harness/print-cip.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/094_print-cip.c_80_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "d77cd0d856bd4fad478795ae540f9fc3")
!38 = !{!39}
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!40 = distinct !DICompileUnit(language: DW_LANG_C99, file: !41, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!41 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/094_print-cip.c_80_local_cpp_cwe-125-oob-read/harness/smart_stubs.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/094_print-cip.c_80_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "bcda1acd1a733c696e028616d9d6f3b5")
!42 = distinct !DICompileUnit(language: DW_LANG_C99, file: !43, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!43 = !DIFile(filename: "/opt/tools/klee/runtime/Freestanding/memcmp.c", directory: "/opt/tools/klee/build/runtime/Freestanding", checksumkind: CSK_MD5, checksum: "5350b831de232a5be5b37d49ccbaf0ef")
!44 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!45 = !{i32 7, !"Dwarf Version", i32 5}
!46 = !{i32 2, !"Debug Info Version", i32 3}
!47 = !{i32 1, !"wchar_size", i32 4}
!48 = !{i32 7, !"PIC Level", i32 2}
!49 = !{i32 7, !"PIE Level", i32 2}
!50 = !{i32 7, !"uwtable", i32 1}
!51 = !{i32 7, !"frame-pointer", i32 2}
!52 = distinct !DISubprogram(name: "main", scope: !53, file: !53, line: 8, type: !54, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !56)
!53 = !DIFile(filename: "driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/094_print-cip.c_80_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "7925c318041ca50c5df3e9acdf72a78f")
!54 = !DISubroutineType(types: !55)
!55 = !{!9}
!56 = !{}
!57 = !DILocalVariable(name: "ndo", scope: !52, file: !53, line: 9, type: !3)
!58 = !DILocation(line: 9, column: 25, scope: !52)
!59 = !DILocation(line: 9, column: 53, scope: !52)
!60 = !DILocation(line: 9, column: 31, scope: !52)
!61 = !DILocalVariable(name: "h", scope: !52, file: !53, line: 10, type: !11)
!62 = !DILocation(line: 10, column: 25, scope: !52)
!63 = !DILocation(line: 10, column: 51, scope: !52)
!64 = !DILocation(line: 10, column: 29, scope: !52)
!65 = !DILocalVariable(name: "p", scope: !52, file: !53, line: 11, type: !33)
!66 = !DILocation(line: 11, column: 13, scope: !52)
!67 = !DILocation(line: 11, column: 27, scope: !52)
!68 = !DILocation(line: 13, column: 24, scope: !52)
!69 = !DILocation(line: 13, column: 5, scope: !52)
!70 = !DILocation(line: 14, column: 24, scope: !52)
!71 = !DILocation(line: 14, column: 5, scope: !52)
!72 = !DILocation(line: 15, column: 24, scope: !52)
!73 = !DILocation(line: 15, column: 5, scope: !52)
!74 = !DILocation(line: 17, column: 5, scope: !52)
!75 = !DILocation(line: 17, column: 10, scope: !52)
!76 = !DILocation(line: 17, column: 20, scope: !52)
!77 = !DILocation(line: 18, column: 5, scope: !52)
!78 = !DILocation(line: 18, column: 10, scope: !52)
!79 = !DILocation(line: 18, column: 37, scope: !52)
!80 = !DILocation(line: 19, column: 5, scope: !52)
!81 = !DILocation(line: 19, column: 8, scope: !52)
!82 = !DILocation(line: 19, column: 15, scope: !52)
!83 = !DILocation(line: 20, column: 5, scope: !52)
!84 = !DILocation(line: 20, column: 8, scope: !52)
!85 = !DILocation(line: 20, column: 12, scope: !52)
!86 = !DILocation(line: 22, column: 18, scope: !52)
!87 = !DILocation(line: 22, column: 23, scope: !52)
!88 = !DILocation(line: 22, column: 26, scope: !52)
!89 = !DILocation(line: 22, column: 5, scope: !52)
!90 = !DILocation(line: 23, column: 5, scope: !52)
!91 = distinct !DISubprogram(name: "cip_if_print", scope: !92, file: !92, line: 24, type: !93, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, retainedNodes: !56)
!92 = !DIFile(filename: "print-cip.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/094_print-cip.c_80_local_cpp_cwe-125-oob-read/harness", checksumkind: CSK_MD5, checksum: "d77cd0d856bd4fad478795ae540f9fc3")
!93 = !DISubroutineType(types: !94)
!94 = !{!28, !95, !101, !112}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "netdissect_options", file: !92, line: 13, baseType: !97)
!97 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !92, line: 10, size: 64, elements: !98)
!98 = !{!99, !100}
!99 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_eflag", scope: !97, file: !92, line: 11, baseType: !9, size: 32)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_suppress_default_print", scope: !97, file: !92, line: 12, baseType: !9, size: 32, offset: 32)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !103)
!103 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "pcap_pkthdr", file: !13, line: 245, size: 192, elements: !104)
!104 = !{!105, !110, !111}
!105 = !DIDerivedType(tag: DW_TAG_member, name: "ts", scope: !103, file: !13, line: 246, baseType: !106, size: 128)
!106 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !17, line: 8, size: 128, elements: !107)
!107 = !{!108, !109}
!108 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !106, file: !17, line: 14, baseType: !20, size: 64)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !106, file: !17, line: 15, baseType: !24, size: 64, offset: 64)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "caplen", scope: !103, file: !13, line: 247, baseType: !26, size: 32, offset: 128)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !103, file: !13, line: 248, baseType: !26, size: 32, offset: 160)
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !114)
!114 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !92, line: 8, baseType: !35)
!115 = !DILocalVariable(name: "ndo", arg: 1, scope: !91, file: !92, line: 24, type: !95)
!116 = !DILocation(line: 24, column: 40, scope: !91)
!117 = !DILocalVariable(name: "h", arg: 2, scope: !91, file: !92, line: 24, type: !101)
!118 = !DILocation(line: 24, column: 71, scope: !91)
!119 = !DILocalVariable(name: "p", arg: 3, scope: !91, file: !92, line: 24, type: !112)
!120 = !DILocation(line: 24, column: 88, scope: !91)
!121 = !DILocation(line: 26, column: 5, scope: !91)
!122 = !DILocalVariable(name: "caplen", scope: !91, file: !92, line: 27, type: !28)
!123 = !DILocation(line: 27, column: 11, scope: !91)
!124 = !DILocation(line: 27, column: 20, scope: !91)
!125 = !DILocation(line: 27, column: 23, scope: !91)
!126 = !DILocalVariable(name: "length", scope: !91, file: !92, line: 28, type: !28)
!127 = !DILocation(line: 28, column: 11, scope: !91)
!128 = !DILocation(line: 28, column: 20, scope: !91)
!129 = !DILocation(line: 28, column: 23, scope: !91)
!130 = !DILocalVariable(name: "cmplen", scope: !91, file: !92, line: 29, type: !131)
!131 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !132, line: 46, baseType: !133)
!132 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!133 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!134 = !DILocation(line: 29, column: 12, scope: !91)
!135 = !DILocalVariable(name: "llc_hdrlen", scope: !91, file: !92, line: 30, type: !9)
!136 = !DILocation(line: 30, column: 9, scope: !91)
!137 = !DILocation(line: 32, column: 12, scope: !91)
!138 = !DILocation(line: 33, column: 9, scope: !139)
!139 = distinct !DILexicalBlock(scope: !91, file: !92, line: 33, column: 9)
!140 = !DILocation(line: 33, column: 18, scope: !139)
!141 = !DILocation(line: 33, column: 16, scope: !139)
!142 = !DILocation(line: 33, column: 9, scope: !91)
!143 = !DILocation(line: 34, column: 18, scope: !139)
!144 = !DILocation(line: 34, column: 16, scope: !139)
!145 = !DILocation(line: 34, column: 9, scope: !139)
!146 = !DILocation(line: 35, column: 9, scope: !147)
!147 = distinct !DILexicalBlock(scope: !91, file: !92, line: 35, column: 9)
!148 = !DILocation(line: 35, column: 18, scope: !147)
!149 = !DILocation(line: 35, column: 16, scope: !147)
!150 = !DILocation(line: 35, column: 9, scope: !91)
!151 = !DILocation(line: 36, column: 18, scope: !147)
!152 = !DILocation(line: 36, column: 16, scope: !147)
!153 = !DILocation(line: 36, column: 9, scope: !147)
!154 = !DILocation(line: 38, column: 9, scope: !155)
!155 = distinct !DILexicalBlock(scope: !91, file: !92, line: 38, column: 9)
!156 = !DILocation(line: 38, column: 14, scope: !155)
!157 = !DILocation(line: 38, column: 9, scope: !91)
!158 = !DILocation(line: 39, column: 19, scope: !155)
!159 = !DILocation(line: 39, column: 24, scope: !155)
!160 = !DILocation(line: 39, column: 9, scope: !155)
!161 = !DILocation(line: 41, column: 9, scope: !162)
!162 = distinct !DILexicalBlock(scope: !91, file: !92, line: 41, column: 9)
!163 = !DILocation(line: 41, column: 16, scope: !162)
!164 = !DILocation(line: 41, column: 9, scope: !91)
!165 = !DILocation(line: 42, column: 9, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !92, line: 41, column: 22)
!167 = !DILocation(line: 42, column: 9, scope: !168)
!168 = distinct !DILexicalBlock(scope: !166, file: !92, line: 42, column: 9)
!169 = !DILocation(line: 43, column: 9, scope: !166)
!170 = !DILocation(line: 45, column: 44, scope: !171)
!171 = distinct !DILexicalBlock(scope: !91, file: !92, line: 45, column: 9)
!172 = !DILocation(line: 45, column: 47, scope: !171)
!173 = !DILocation(line: 45, column: 9, scope: !171)
!174 = !DILocation(line: 45, column: 55, scope: !171)
!175 = !DILocation(line: 45, column: 9, scope: !91)
!176 = !DILocation(line: 46, column: 32, scope: !177)
!177 = distinct !DILexicalBlock(scope: !171, file: !92, line: 45, column: 61)
!178 = !DILocation(line: 46, column: 37, scope: !177)
!179 = !DILocation(line: 46, column: 40, scope: !177)
!180 = !DILocation(line: 46, column: 48, scope: !177)
!181 = !DILocation(line: 46, column: 22, scope: !177)
!182 = !DILocation(line: 46, column: 20, scope: !177)
!183 = !DILocation(line: 47, column: 13, scope: !184)
!184 = distinct !DILexicalBlock(scope: !177, file: !92, line: 47, column: 13)
!185 = !DILocation(line: 47, column: 24, scope: !184)
!186 = !DILocation(line: 47, column: 13, scope: !177)
!187 = !DILocation(line: 48, column: 18, scope: !188)
!188 = distinct !DILexicalBlock(scope: !189, file: !92, line: 48, column: 17)
!189 = distinct !DILexicalBlock(scope: !184, file: !92, line: 47, column: 29)
!190 = !DILocation(line: 48, column: 23, scope: !188)
!191 = !DILocation(line: 48, column: 17, scope: !189)
!192 = !DILocation(line: 49, column: 17, scope: !188)
!193 = !DILocation(line: 49, column: 17, scope: !194)
!194 = distinct !DILexicalBlock(scope: !188, file: !92, line: 49, column: 17)
!195 = !DILocation(line: 50, column: 27, scope: !189)
!196 = !DILocation(line: 50, column: 26, scope: !189)
!197 = !DILocation(line: 50, column: 24, scope: !189)
!198 = !DILocation(line: 51, column: 9, scope: !189)
!199 = !DILocation(line: 52, column: 5, scope: !177)
!200 = !DILocation(line: 53, column: 20, scope: !201)
!201 = distinct !DILexicalBlock(scope: !171, file: !92, line: 52, column: 12)
!202 = !DILocation(line: 54, column: 18, scope: !201)
!203 = !DILocation(line: 54, column: 23, scope: !201)
!204 = !DILocation(line: 54, column: 26, scope: !201)
!205 = !DILocation(line: 54, column: 9, scope: !201)
!206 = !DILocation(line: 57, column: 5, scope: !91)
!207 = !DILocation(line: 58, column: 13, scope: !91)
!208 = !DILocation(line: 59, column: 1, scope: !91)
!209 = distinct !DISubprogram(name: "cip_print", scope: !92, file: !92, line: 18, type: !210, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !36, retainedNodes: !56)
!210 = !DISubroutineType(types: !211)
!211 = !{null, !95, !28}
!212 = !DILocalVariable(name: "ndo", arg: 1, scope: !209, file: !92, line: 18, type: !95)
!213 = !DILocation(line: 18, column: 43, scope: !209)
!214 = !DILocalVariable(name: "length", arg: 2, scope: !209, file: !92, line: 18, type: !28)
!215 = !DILocation(line: 18, column: 54, scope: !209)
!216 = !DILocation(line: 18, column: 70, scope: !209)
!217 = !DILocation(line: 18, column: 81, scope: !209)
!218 = !DILocation(line: 18, column: 89, scope: !209)
!219 = distinct !DISubprogram(name: "llc_print", scope: !92, file: !92, line: 19, type: !220, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !36, retainedNodes: !56)
!220 = !DISubroutineType(types: !221)
!221 = !{!9, !95, !112, !28, !28, !39, !39}
!222 = !DILocalVariable(name: "ndo", arg: 1, scope: !219, file: !92, line: 19, type: !95)
!223 = !DILocation(line: 19, column: 42, scope: !219)
!224 = !DILocalVariable(name: "p", arg: 2, scope: !219, file: !92, line: 19, type: !112)
!225 = !DILocation(line: 19, column: 61, scope: !219)
!226 = !DILocalVariable(name: "length", arg: 3, scope: !219, file: !92, line: 19, type: !28)
!227 = !DILocation(line: 19, column: 70, scope: !219)
!228 = !DILocalVariable(name: "caplen", arg: 4, scope: !219, file: !92, line: 19, type: !28)
!229 = !DILocation(line: 19, column: 84, scope: !219)
!230 = !DILocalVariable(name: "a", arg: 5, scope: !219, file: !92, line: 19, type: !39)
!231 = !DILocation(line: 19, column: 98, scope: !219)
!232 = !DILocalVariable(name: "b", arg: 6, scope: !219, file: !92, line: 19, type: !39)
!233 = !DILocation(line: 19, column: 107, scope: !219)
!234 = !DILocation(line: 20, column: 11, scope: !219)
!235 = !DILocation(line: 20, column: 22, scope: !219)
!236 = !DILocation(line: 20, column: 31, scope: !219)
!237 = !DILocation(line: 20, column: 45, scope: !219)
!238 = !DILocation(line: 20, column: 59, scope: !219)
!239 = !DILocation(line: 20, column: 68, scope: !219)
!240 = !DILocation(line: 20, column: 71, scope: !219)
!241 = distinct !DISubprogram(name: "ip_print", scope: !92, file: !92, line: 22, type: !242, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !36, retainedNodes: !56)
!242 = !DISubroutineType(types: !243)
!243 = !{null, !95, !112, !28}
!244 = !DILocalVariable(name: "ndo", arg: 1, scope: !241, file: !92, line: 22, type: !95)
!245 = !DILocation(line: 22, column: 42, scope: !241)
!246 = !DILocalVariable(name: "p", arg: 2, scope: !241, file: !92, line: 22, type: !112)
!247 = !DILocation(line: 22, column: 61, scope: !241)
!248 = !DILocalVariable(name: "length", arg: 3, scope: !241, file: !92, line: 22, type: !28)
!249 = !DILocation(line: 22, column: 70, scope: !241)
!250 = !DILocation(line: 22, column: 86, scope: !241)
!251 = !DILocation(line: 22, column: 97, scope: !241)
!252 = !DILocation(line: 22, column: 106, scope: !241)
!253 = !DILocation(line: 22, column: 114, scope: !241)
!254 = distinct !DISubprogram(name: "memcmp", scope: !255, file: !255, line: 42, type: !256, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !42, retainedNodes: !56)
!255 = !DIFile(filename: "runtime/Freestanding/memcmp.c", directory: "/opt/tools/klee", checksumkind: CSK_MD5, checksum: "5350b831de232a5be5b37d49ccbaf0ef")
!256 = !DISubroutineType(types: !257)
!257 = !{!9, !258, !258, !131}
!258 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !259, size: 64)
!259 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!260 = !DILocalVariable(name: "s1", arg: 1, scope: !254, file: !255, line: 42, type: !258)
!261 = !DILocation(line: 0, scope: !254)
!262 = !DILocalVariable(name: "s2", arg: 2, scope: !254, file: !255, line: 42, type: !258)
!263 = !DILocalVariable(name: "n", arg: 3, scope: !254, file: !255, line: 42, type: !131)
!264 = !DILocation(line: 43, column: 9, scope: !265)
!265 = distinct !DILexicalBlock(scope: !254, file: !255, line: 43, column: 7)
!266 = !DILocation(line: 43, column: 7, scope: !254)
!267 = !DILocation(line: 0, scope: !268)
!268 = distinct !DILexicalBlock(scope: !265, file: !255, line: 43, column: 15)
!269 = !DILocalVariable(name: "p2", scope: !268, file: !255, line: 44, type: !270)
!270 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !271, size: 64)
!271 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !35)
!272 = !DILocalVariable(name: "p1", scope: !268, file: !255, line: 44, type: !270)
!273 = !DILocation(line: 47, column: 11, scope: !274)
!274 = distinct !DILexicalBlock(scope: !275, file: !255, line: 47, column: 11)
!275 = distinct !DILexicalBlock(scope: !268, file: !255, line: 46, column: 8)
!276 = !DILocation(line: 47, column: 20, scope: !274)
!277 = !DILocation(line: 47, column: 17, scope: !274)
!278 = !DILocation(line: 47, column: 11, scope: !275)
!279 = !DILocation(line: 48, column: 17, scope: !280)
!280 = distinct !DILexicalBlock(scope: !274, file: !255, line: 47, column: 27)
!281 = !DILocation(line: 48, column: 25, scope: !280)
!282 = !DILocation(line: 48, column: 23, scope: !280)
!283 = !DILocation(line: 48, column: 9, scope: !280)
!284 = !DILocation(line: 47, column: 23, scope: !274)
!285 = !DILocation(line: 47, column: 14, scope: !274)
!286 = !DILocation(line: 50, column: 14, scope: !268)
!287 = !DILocation(line: 50, column: 18, scope: !268)
!288 = !DILocation(line: 50, column: 5, scope: !275)
!289 = distinct !{!289, !290, !291, !292}
!290 = !DILocation(line: 46, column: 5, scope: !268)
!291 = !DILocation(line: 50, column: 22, scope: !268)
!292 = !{!"llvm.loop.mustprogress"}
!293 = !DILocation(line: 53, column: 1, scope: !254)
