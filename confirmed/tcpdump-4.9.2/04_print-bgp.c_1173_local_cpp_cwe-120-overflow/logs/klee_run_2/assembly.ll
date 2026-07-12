; ModuleID = '/app/se_runs/sailor_engine/tcpdump-4.9.2/058_print-bgp.c_1173_local_cpp_cwe-120-overflow/harness/slice.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.netdissect_options = type { i32, i8* }
%struct.bgp = type { [16 x i8], i16, i8 }
%struct.in6_addr = type { %union.anon }
%union.anon = type { [4 x i32] }

@.str = private unnamed_addr constant [10 x i8] c"bgp_input\00", align 1
@.str.3 = private unnamed_addr constant [28 x i8] c"SPINE_PROBE:bgp_print:ENTRY\00", align 1
@__const.bgp_print.marker = private unnamed_addr constant [16 x i8] c"\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF", align 16
@.str.3.4 = private unnamed_addr constant [41 x i8] c"SPINE_PROBE:decode_labeled_prefix6:ENTRY\00", align 1
@.str.4 = private unnamed_addr constant [19 x i8] c"%s/%d, label:%u %s\00", align 1
@.str.5 = private unnamed_addr constant [34 x i8] c"(BOGUS: Bottom of Stack NOT set!)\00", align 1
@.str.6 = private unnamed_addr constant [9 x i8] c"(bottom)\00", align 1
@.str.7 = private unnamed_addr constant [27 x i8] c"0 && \22SAILOR_SINK_REACHED\22\00", align 1
@.str.8 = private unnamed_addr constant [109 x i8] c"/app/se_runs/sailor_engine/tcpdump-4.9.2/058_print-bgp.c_1173_local_cpp_cwe-120-overflow/harness/print-bgp.c\00", align 1
@__PRETTY_FUNCTION__.decode_labeled_prefix6 = private unnamed_addr constant [87 x i8] c"int decode_labeled_prefix6(netdissect_options *, const u_char *, u_int, char *, u_int)\00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"::\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !38 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.netdissect_options*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %2, metadata !43, metadata !DIExpression()), !dbg !44
  %5 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 16) #10, !dbg !45
  %6 = bitcast i8* %5 to %struct.netdissect_options*, !dbg !46
  store %struct.netdissect_options* %6, %struct.netdissect_options** %2, align 8, !dbg !44
  %7 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !47
  %8 = icmp ne %struct.netdissect_options* %7, null, !dbg !47
  br i1 %8, label %10, label %9, !dbg !49

9:                                                ; preds = %0
  store i32 0, i32* %1, align 4, !dbg !50
  br label %78, !dbg !50

10:                                               ; preds = %0
  %11 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !51
  %12 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %11, i32 0, i32 0, !dbg !52
  store i32 1, i32* %12, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata i32* %3, metadata !54, metadata !DIExpression()), !dbg !55
  store i32 64, i32* %3, align 4, !dbg !55
  call void @llvm.dbg.declare(metadata i8** %4, metadata !56, metadata !DIExpression()), !dbg !57
  %13 = load i32, i32* %3, align 4, !dbg !58
  %14 = sext i32 %13 to i64, !dbg !58
  %15 = call noalias i8* @calloc(i64 noundef 1, i64 noundef %14) #10, !dbg !59
  store i8* %15, i8** %4, align 8, !dbg !57
  %16 = load i8*, i8** %4, align 8, !dbg !60
  %17 = icmp ne i8* %16, null, !dbg !60
  br i1 %17, label %19, label %18, !dbg !62

18:                                               ; preds = %10
  store i32 0, i32* %1, align 4, !dbg !63
  br label %78, !dbg !63

19:                                               ; preds = %10
  %20 = load i8*, i8** %4, align 8, !dbg !64
  %21 = load i32, i32* %3, align 4, !dbg !65
  %22 = sext i32 %21 to i64, !dbg !65
  call void @klee_make_symbolic(i8* noundef %20, i64 noundef %22, i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !66
  %23 = load i8*, i8** %4, align 8, !dbg !67
  %24 = getelementptr inbounds i8, i8* %23, i64 0, !dbg !67
  store i8 -1, i8* %24, align 1, !dbg !68
  %25 = load i8*, i8** %4, align 8, !dbg !69
  %26 = getelementptr inbounds i8, i8* %25, i64 1, !dbg !69
  store i8 -1, i8* %26, align 1, !dbg !70
  %27 = load i8*, i8** %4, align 8, !dbg !71
  %28 = getelementptr inbounds i8, i8* %27, i64 2, !dbg !71
  store i8 -1, i8* %28, align 1, !dbg !72
  %29 = load i8*, i8** %4, align 8, !dbg !73
  %30 = getelementptr inbounds i8, i8* %29, i64 3, !dbg !73
  store i8 -1, i8* %30, align 1, !dbg !74
  %31 = load i8*, i8** %4, align 8, !dbg !75
  %32 = getelementptr inbounds i8, i8* %31, i64 4, !dbg !75
  store i8 -1, i8* %32, align 1, !dbg !76
  %33 = load i8*, i8** %4, align 8, !dbg !77
  %34 = getelementptr inbounds i8, i8* %33, i64 5, !dbg !77
  store i8 -1, i8* %34, align 1, !dbg !78
  %35 = load i8*, i8** %4, align 8, !dbg !79
  %36 = getelementptr inbounds i8, i8* %35, i64 6, !dbg !79
  store i8 -1, i8* %36, align 1, !dbg !80
  %37 = load i8*, i8** %4, align 8, !dbg !81
  %38 = getelementptr inbounds i8, i8* %37, i64 7, !dbg !81
  store i8 -1, i8* %38, align 1, !dbg !82
  %39 = load i8*, i8** %4, align 8, !dbg !83
  %40 = getelementptr inbounds i8, i8* %39, i64 8, !dbg !83
  store i8 -1, i8* %40, align 1, !dbg !84
  %41 = load i8*, i8** %4, align 8, !dbg !85
  %42 = getelementptr inbounds i8, i8* %41, i64 9, !dbg !85
  store i8 -1, i8* %42, align 1, !dbg !86
  %43 = load i8*, i8** %4, align 8, !dbg !87
  %44 = getelementptr inbounds i8, i8* %43, i64 10, !dbg !87
  store i8 -1, i8* %44, align 1, !dbg !88
  %45 = load i8*, i8** %4, align 8, !dbg !89
  %46 = getelementptr inbounds i8, i8* %45, i64 11, !dbg !89
  store i8 -1, i8* %46, align 1, !dbg !90
  %47 = load i8*, i8** %4, align 8, !dbg !91
  %48 = getelementptr inbounds i8, i8* %47, i64 12, !dbg !91
  store i8 -1, i8* %48, align 1, !dbg !92
  %49 = load i8*, i8** %4, align 8, !dbg !93
  %50 = getelementptr inbounds i8, i8* %49, i64 13, !dbg !93
  store i8 -1, i8* %50, align 1, !dbg !94
  %51 = load i8*, i8** %4, align 8, !dbg !95
  %52 = getelementptr inbounds i8, i8* %51, i64 14, !dbg !95
  store i8 -1, i8* %52, align 1, !dbg !96
  %53 = load i8*, i8** %4, align 8, !dbg !97
  %54 = getelementptr inbounds i8, i8* %53, i64 15, !dbg !97
  store i8 -1, i8* %54, align 1, !dbg !98
  %55 = load i8*, i8** %4, align 8, !dbg !99
  %56 = getelementptr inbounds i8, i8* %55, i64 16, !dbg !99
  store i8 0, i8* %56, align 1, !dbg !100
  %57 = load i8*, i8** %4, align 8, !dbg !101
  %58 = getelementptr inbounds i8, i8* %57, i64 17, !dbg !101
  store i8 32, i8* %58, align 1, !dbg !102
  %59 = load i8*, i8** %4, align 8, !dbg !103
  %60 = getelementptr inbounds i8, i8* %59, i64 18, !dbg !103
  store i8 2, i8* %60, align 1, !dbg !104
  %61 = load i8*, i8** %4, align 8, !dbg !105
  %62 = getelementptr inbounds i8, i8* %61, i64 19, !dbg !105
  store i8 24, i8* %62, align 1, !dbg !106
  %63 = load i8*, i8** %4, align 8, !dbg !107
  %64 = getelementptr inbounds i8, i8* %63, i64 20, !dbg !107
  store i8 0, i8* %64, align 1, !dbg !108
  %65 = load i8*, i8** %4, align 8, !dbg !109
  %66 = getelementptr inbounds i8, i8* %65, i64 21, !dbg !109
  store i8 0, i8* %66, align 1, !dbg !110
  %67 = load i8*, i8** %4, align 8, !dbg !111
  %68 = getelementptr inbounds i8, i8* %67, i64 22, !dbg !111
  store i8 1, i8* %68, align 1, !dbg !112
  %69 = load i8*, i8** %4, align 8, !dbg !113
  %70 = load i32, i32* %3, align 4, !dbg !114
  %71 = sext i32 %70 to i64, !dbg !115
  %72 = getelementptr inbounds i8, i8* %69, i64 %71, !dbg !115
  %73 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !116
  %74 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %73, i32 0, i32 1, !dbg !117
  store i8* %72, i8** %74, align 8, !dbg !118
  %75 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !119
  %76 = load i8*, i8** %4, align 8, !dbg !120
  %77 = load i32, i32* %3, align 4, !dbg !121
  call fastcc void @bgp_print(%struct.netdissect_options* noundef %75, i8* noundef %76, i32 noundef %77), !dbg !122
  store i32 0, i32* %1, align 4, !dbg !123
  br label %78, !dbg !123

78:                                               ; preds = %19, %18, %9
  %79 = load i32, i32* %1, align 4, !dbg !124
  ret i32 %79, !dbg !124
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

declare void @klee_make_symbolic(i8* noundef, i64 noundef, i8* noundef) local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @bgp_print(%struct.netdissect_options* noundef %0, i8* noundef %1, i32 noundef %2) unnamed_addr #0 !dbg !125 {
  %4 = alloca %struct.netdissect_options*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca [16 x i8], align 16
  %11 = alloca %struct.bgp, align 2
  %12 = alloca i16, align 2
  store %struct.netdissect_options* %0, %struct.netdissect_options** %4, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %4, metadata !138, metadata !DIExpression()), !dbg !139
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !140, metadata !DIExpression()), !dbg !141
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !142, metadata !DIExpression()), !dbg !143
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([28 x i8], [28 x i8]* @.str.3, i64 0, i64 0)), !dbg !144
  call void @llvm.dbg.declare(metadata i8** %7, metadata !145, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata i8** %8, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata i8** %9, metadata !149, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata [16 x i8]* %10, metadata !151, metadata !DIExpression()), !dbg !155
  %13 = bitcast [16 x i8]* %10 to i8*, !dbg !155
  %14 = call i8* @memcpy(i8* %13, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @__const.bgp_print.marker, i32 0, i32 0), i64 16), !dbg !155
  call void @llvm.dbg.declare(metadata %struct.bgp* %11, metadata !156, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.declare(metadata i16* %12, metadata !169, metadata !DIExpression()), !dbg !170
  %15 = load i8*, i8** %5, align 8, !dbg !171
  %16 = load i32, i32* %6, align 4, !dbg !172
  %17 = sext i32 %16 to i64, !dbg !173
  %18 = getelementptr inbounds i8, i8* %15, i64 %17, !dbg !173
  store i8* %18, i8** %8, align 8, !dbg !174
  %19 = load %struct.netdissect_options*, %struct.netdissect_options** %4, align 8, !dbg !175
  %20 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %19, i32 0, i32 1, !dbg !177
  %21 = load i8*, i8** %20, align 8, !dbg !177
  %22 = load i8*, i8** %5, align 8, !dbg !178
  %23 = load i32, i32* %6, align 4, !dbg !179
  %24 = sext i32 %23 to i64, !dbg !180
  %25 = getelementptr inbounds i8, i8* %22, i64 %24, !dbg !180
  %26 = icmp ult i8* %21, %25, !dbg !181
  br i1 %26, label %27, label %31, !dbg !182

27:                                               ; preds = %3
  %28 = load %struct.netdissect_options*, %struct.netdissect_options** %4, align 8, !dbg !183
  %29 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %28, i32 0, i32 1, !dbg !184
  %30 = load i8*, i8** %29, align 8, !dbg !184
  store i8* %30, i8** %8, align 8, !dbg !185
  br label %31, !dbg !186

31:                                               ; preds = %27, %3
  %32 = load %struct.netdissect_options*, %struct.netdissect_options** %4, align 8, !dbg !187
  %33 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %32, i32 0, i32 0, !dbg !189
  %34 = load i32, i32* %33, align 8, !dbg !189
  %35 = icmp slt i32 %34, 1, !dbg !190
  br i1 %35, label %36, label %37, !dbg !191

36:                                               ; preds = %31
  br label %78, !dbg !192

37:                                               ; preds = %31
  %38 = load i8*, i8** %5, align 8, !dbg !193
  store i8* %38, i8** %7, align 8, !dbg !194
  %39 = load i8*, i8** %7, align 8, !dbg !195
  store i8* %39, i8** %9, align 8, !dbg !196
  br label %.preheader, !dbg !197

.preheader:                                       ; preds = %37
  br label %40, !dbg !197

40:                                               ; preds = %.backedge, %.preheader
  %41 = load i8*, i8** %7, align 8, !dbg !198
  %42 = load i8*, i8** %8, align 8, !dbg !199
  %43 = icmp ult i8* %41, %42, !dbg !200
  br i1 %43, label %44, label %.loopexit, !dbg !197

44:                                               ; preds = %40
  %45 = load i8*, i8** %7, align 8, !dbg !201
  %46 = getelementptr inbounds i8, i8* %45, i64 0, !dbg !201
  %47 = load i8, i8* %46, align 1, !dbg !201
  %48 = zext i8 %47 to i32, !dbg !201
  %49 = icmp ne i32 %48, 255, !dbg !204
  br i1 %49, label %50, label %53, !dbg !205

50:                                               ; preds = %44
  %51 = load i8*, i8** %7, align 8, !dbg !206
  %52 = getelementptr inbounds i8, i8* %51, i32 1, !dbg !206
  store i8* %52, i8** %7, align 8, !dbg !206
  br label %.backedge, !dbg !208

.backedge:                                        ; preds = %50, %58
  br label %40, !dbg !198, !llvm.loop !209

53:                                               ; preds = %44
  %54 = load i8*, i8** %7, align 8, !dbg !212
  %55 = getelementptr inbounds [16 x i8], [16 x i8]* %10, i64 0, i64 0, !dbg !214
  %56 = call i32 @memcmp(i8* noundef %54, i8* noundef %55, i64 noundef 16) #11, !dbg !215
  %57 = icmp ne i32 %56, 0, !dbg !216
  br i1 %57, label %58, label %61, !dbg !217

58:                                               ; preds = %53
  %59 = load i8*, i8** %7, align 8, !dbg !218
  %60 = getelementptr inbounds i8, i8* %59, i32 1, !dbg !218
  store i8* %60, i8** %7, align 8, !dbg !218
  br label %.backedge, !dbg !220

61:                                               ; preds = %53
  %62 = bitcast %struct.bgp* %11 to i8*, !dbg !221
  %63 = load i8*, i8** %7, align 8, !dbg !222
  %64 = call i8* @memcpy(i8* %62, i8* %63, i64 19), !dbg !221
  %65 = getelementptr inbounds %struct.bgp, %struct.bgp* %11, i32 0, i32 1, !dbg !223
  %66 = load i16, i16* %65, align 2, !dbg !223
  %67 = call zeroext i16 @ntohs(i16 noundef zeroext %66) #12, !dbg !224
  store i16 %67, i16* %12, align 2, !dbg !225
  %68 = load i16, i16* %12, align 2, !dbg !226
  %69 = zext i16 %68 to i32, !dbg !226
  %70 = icmp slt i32 %69, 19, !dbg !228
  br i1 %70, label %71, label %72, !dbg !229

71:                                               ; preds = %61
  br label %77, !dbg !230

72:                                               ; preds = %61
  %73 = load %struct.netdissect_options*, %struct.netdissect_options** %4, align 8, !dbg !231
  %74 = load i8*, i8** %7, align 8, !dbg !235
  %75 = load i16, i16* %12, align 2, !dbg !236
  %76 = zext i16 %75 to i32, !dbg !236
  call fastcc void @bgp_header_print(%struct.netdissect_options* noundef %73, i8* noundef %74, i32 noundef %76), !dbg !237
  unreachable

.loopexit:                                        ; preds = %40
  br label %77, !dbg !238

77:                                               ; preds = %.loopexit, %71
  br label %78, !dbg !238

78:                                               ; preds = %77, %36
  ret void, !dbg !239
}

declare void @klee_warning_once(i8* noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare zeroext i16 @ntohs(i16 noundef zeroext) local_unnamed_addr #4

; Function Attrs: noinline noreturn nounwind optnone uwtable
define internal fastcc void @bgp_header_print(%struct.netdissect_options* noundef %0, i8* noundef %1, i32 noundef %2) unnamed_addr #5 !dbg !240 {
  %4 = alloca %struct.netdissect_options*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca [256 x i8], align 16
  store %struct.netdissect_options* %0, %struct.netdissect_options** %4, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %4, metadata !246, metadata !DIExpression()), !dbg !247
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !248, metadata !DIExpression()), !dbg !249
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !250, metadata !DIExpression()), !dbg !251
  %8 = load %struct.netdissect_options*, %struct.netdissect_options** %4, align 8, !dbg !252
  %9 = load i8*, i8** %5, align 8, !dbg !253
  %10 = load i32, i32* %6, align 4, !dbg !254
  call fastcc void @bgp_update_print(%struct.netdissect_options* noundef %8, i8* noundef %9, i32 noundef %10), !dbg !255
  unreachable
}

; Function Attrs: noinline noreturn nounwind optnone uwtable
define internal fastcc void @bgp_update_print(%struct.netdissect_options* noundef %0, i8* noundef %1, i32 noundef %2) unnamed_addr #5 !dbg !256 {
  %4 = alloca %struct.netdissect_options*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  store %struct.netdissect_options* %0, %struct.netdissect_options** %4, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %4, metadata !259, metadata !DIExpression()), !dbg !260
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !261, metadata !DIExpression()), !dbg !262
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !263, metadata !DIExpression()), !dbg !264
  %7 = load %struct.netdissect_options*, %struct.netdissect_options** %4, align 8, !dbg !265
  %8 = load i8*, i8** %5, align 8, !dbg !266
  %9 = load i32, i32* %6, align 4, !dbg !267
  call fastcc void @bgp_attr_print(%struct.netdissect_options* noundef %7, i8* noundef %8, i32 noundef %9), !dbg !268
  unreachable
}

; Function Attrs: noinline noreturn nounwind optnone uwtable
define internal fastcc void @decode_labeled_prefix6(%struct.netdissect_options* noundef %0) unnamed_addr #5 !dbg !269 {
  %2 = alloca %struct.netdissect_options*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.in6_addr, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store %struct.netdissect_options* %0, %struct.netdissect_options** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %2, metadata !274, metadata !DIExpression()), !dbg !275
  store i8* null, i8** %3, align 8
  call void @llvm.dbg.declare(metadata i8** %3, metadata !276, metadata !DIExpression()), !dbg !277
  store i32 0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !278, metadata !DIExpression()), !dbg !279
  store i8* null, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !280, metadata !DIExpression()), !dbg !281
  store i32 0, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !282, metadata !DIExpression()), !dbg !283
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([41 x i8], [41 x i8]* @.str.3.4, i64 0, i64 0)), !dbg !284
  call void @llvm.dbg.declare(metadata %struct.in6_addr* %7, metadata !285, metadata !DIExpression()), !dbg !306
  call void @llvm.dbg.declare(metadata i32* %8, metadata !307, metadata !DIExpression()), !dbg !308
  call void @llvm.dbg.declare(metadata i32* %9, metadata !309, metadata !DIExpression()), !dbg !310
  %10 = load i8*, i8** %3, align 8, !dbg !311
  %11 = getelementptr inbounds i8, i8* %10, i64 0, !dbg !311
  %12 = load i8, i8* %11, align 1, !dbg !311
  %13 = zext i8 %12 to i32, !dbg !311
  store i32 %13, i32* %8, align 4, !dbg !312
  %14 = load i32, i32* %8, align 4, !dbg !313
  %15 = sub i32 %14, 24, !dbg !313
  store i32 %15, i32* %8, align 4, !dbg !313
  %16 = load i32, i32* %4, align 4, !dbg !314
  %17 = sub i32 %16, 4, !dbg !314
  store i32 %17, i32* %4, align 4, !dbg !314
  %18 = bitcast %struct.in6_addr* %7 to i8*, !dbg !315
  %19 = call i8* @memset(i8* %18, i32 0, i64 16), !dbg !315
  %20 = load i32, i32* %8, align 4, !dbg !316
  %21 = add i32 %20, 7, !dbg !317
  %22 = udiv i32 %21, 8, !dbg !318
  store i32 %22, i32* %9, align 4, !dbg !319
  %23 = bitcast %struct.in6_addr* %7 to i8*, !dbg !320
  %24 = load i8*, i8** %3, align 8, !dbg !321
  %25 = getelementptr inbounds i8, i8* %24, i64 4, !dbg !321
  %26 = load i32, i32* %9, align 4, !dbg !322
  %27 = zext i32 %26 to i64, !dbg !322
  %28 = call i8* @memcpy(i8* %23, i8* %25, i64 %27), !dbg !320
  %29 = load i8*, i8** %5, align 8, !dbg !323
  %30 = load i32, i32* %6, align 4, !dbg !324
  %31 = zext i32 %30 to i64, !dbg !324
  %32 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !325
  %33 = bitcast %struct.in6_addr* %7 to i8*, !dbg !326
  call fastcc void @ip6addr_string.6(%struct.netdissect_options* noundef %32, i8* noundef %33), !dbg !327
  %34 = load i32, i32* %8, align 4, !dbg !328
  %35 = load i8*, i8** %3, align 8, !dbg !329
  %36 = getelementptr inbounds i8, i8* %35, i64 1, !dbg !329
  %37 = load i8, i8* %36, align 1, !dbg !329
  %38 = zext i8 %37 to i32, !dbg !329
  %39 = shl i32 %38, 16, !dbg !330
  %40 = load i8*, i8** %3, align 8, !dbg !331
  %41 = getelementptr inbounds i8, i8* %40, i64 2, !dbg !331
  %42 = load i8, i8* %41, align 1, !dbg !331
  %43 = zext i8 %42 to i32, !dbg !331
  %44 = shl i32 %43, 8, !dbg !332
  %45 = or i32 %39, %44, !dbg !333
  %46 = load i8*, i8** %3, align 8, !dbg !334
  %47 = getelementptr inbounds i8, i8* %46, i64 3, !dbg !334
  %48 = load i8, i8* %47, align 1, !dbg !334
  %49 = zext i8 %48 to i32, !dbg !334
  %50 = or i32 %45, %49, !dbg !335
  %51 = lshr i32 %50, 4, !dbg !336
  %52 = load i8*, i8** %3, align 8, !dbg !337
  %53 = getelementptr inbounds i8, i8* %52, i64 3, !dbg !337
  %54 = load i8, i8* %53, align 1, !dbg !337
  %55 = zext i8 %54 to i32, !dbg !337
  %56 = and i32 %55, 1, !dbg !338
  %57 = icmp eq i32 %56, 0, !dbg !339
  %58 = zext i1 %57 to i64, !dbg !340
  %59 = select i1 %57, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.6, i64 0, i64 0), !dbg !340
  %60 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* noundef %29, i64 noundef %31, i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i64 0, i64 0), i32 noundef %34, i32 noundef %51, i8* noundef %59) #10, !dbg !341
  %61 = call i32 (i8*, i8*, i32, i8*, ...) bitcast (i32 (...)* @__assert_fail to i32 (i8*, i8*, i32, i8*, ...)*)(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.7, i64 0, i64 0), i8* noundef getelementptr inbounds ([109 x i8], [109 x i8]* @.str.8, i64 0, i64 0), i32 noundef 97, i8* noundef getelementptr inbounds ([87 x i8], [87 x i8]* @__PRETTY_FUNCTION__.decode_labeled_prefix6, i64 0, i64 0)), !dbg !342
  unreachable, !dbg !343
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @ip6addr_string.6(%struct.netdissect_options* noundef %0, i8* noundef %1) unnamed_addr #0 !dbg !344 {
  %3 = alloca %struct.netdissect_options*, align 8
  %4 = alloca i8*, align 8
  store %struct.netdissect_options* %0, %struct.netdissect_options** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %3, metadata !351, metadata !DIExpression()), !dbg !352
  store i8* %1, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !353, metadata !DIExpression()), !dbg !354
  ret void, !dbg !355
}

; Function Attrs: nounwind
declare i32 @snprintf(i8* noundef, i64 noundef, i8* noundef, ...) local_unnamed_addr #2

; Function Attrs: noreturn
declare i32 @__assert_fail(...) local_unnamed_addr #6

; Function Attrs: noinline noreturn nounwind optnone uwtable
define internal fastcc void @bgp_attr_print(%struct.netdissect_options* noundef %0, i8* noundef %1, i32 noundef %2) unnamed_addr #5 !dbg !356 {
  %4 = alloca %struct.netdissect_options*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  store %struct.netdissect_options* %0, %struct.netdissect_options** %4, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %4, metadata !357, metadata !DIExpression()), !dbg !358
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !359, metadata !DIExpression()), !dbg !360
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !361, metadata !DIExpression()), !dbg !362
  %7 = load %struct.netdissect_options*, %struct.netdissect_options** %4, align 8, !dbg !363
  call fastcc void @decode_labeled_prefix6(%struct.netdissect_options* noundef %7), !dbg !364
  unreachable
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readonly uwtable willreturn
define dso_local i32 @memcmp(i8* nocapture noundef nonnull readonly %0, i8* nocapture noundef nonnull readonly %1, i64 noundef %2) local_unnamed_addr #7 !dbg !365 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !372, metadata !DIExpression()), !dbg !373
  call void @llvm.dbg.value(metadata i8* %1, metadata !374, metadata !DIExpression()), !dbg !373
  call void @llvm.dbg.value(metadata i64 %2, metadata !375, metadata !DIExpression()), !dbg !373
  %.not = icmp eq i64 %2, 0, !dbg !376
  br i1 %.not, label %.loopexit, label %.preheader, !dbg !378

.preheader:                                       ; preds = %3, %10
  %.03 = phi i64 [ %13, %10 ], [ %2, %3 ]
  %.02 = phi i8* [ %12, %10 ], [ %0, %3 ], !dbg !379
  %.01 = phi i8* [ %11, %10 ], [ %1, %3 ], !dbg !379
  call void @llvm.dbg.value(metadata i8* %.01, metadata !381, metadata !DIExpression()), !dbg !379
  call void @llvm.dbg.value(metadata i8* %.02, metadata !384, metadata !DIExpression()), !dbg !379
  call void @llvm.dbg.value(metadata i64 %.03, metadata !375, metadata !DIExpression()), !dbg !373
  call void @llvm.dbg.value(metadata i8* %.02, metadata !384, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !379
  %4 = load i8, i8* %.02, align 1, !dbg !385
  call void @llvm.dbg.value(metadata i8* %.01, metadata !381, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !379
  %5 = load i8, i8* %.01, align 1, !dbg !388
  %.not4 = icmp eq i8 %4, %5, !dbg !389
  br i1 %.not4, label %10, label %6, !dbg !390

6:                                                ; preds = %.preheader
  call void @llvm.dbg.value(metadata i8* %.02, metadata !384, metadata !DIExpression()), !dbg !379
  %7 = zext i8 %4 to i32, !dbg !391
  call void @llvm.dbg.value(metadata i8* %.01, metadata !381, metadata !DIExpression()), !dbg !379
  %8 = zext i8 %5 to i32, !dbg !393
  %9 = sub nsw i32 %7, %8, !dbg !394
  br label %.loopexit, !dbg !395

10:                                               ; preds = %.preheader
  %11 = getelementptr inbounds i8, i8* %.01, i64 1, !dbg !396
  call void @llvm.dbg.value(metadata i8* %11, metadata !381, metadata !DIExpression()), !dbg !379
  %12 = getelementptr inbounds i8, i8* %.02, i64 1, !dbg !397
  call void @llvm.dbg.value(metadata i8* %12, metadata !384, metadata !DIExpression()), !dbg !379
  %13 = add i64 %.03, -1, !dbg !398
  call void @llvm.dbg.value(metadata i64 %13, metadata !375, metadata !DIExpression()), !dbg !373
  %.not5 = icmp eq i64 %13, 0, !dbg !399
  br i1 %.not5, label %.loopexit, label %.preheader, !dbg !400, !llvm.loop !401

.loopexit:                                        ; preds = %10, %3, %6
  %.0 = phi i32 [ %9, %6 ], [ 0, %3 ], [ 0, %10 ], !dbg !373
  ret i32 %.0, !dbg !404
}

; Function Attrs: nofree noinline norecurse nosync nounwind uwtable
define dso_local i8* @memcpy(i8* noundef returned writeonly %0, i8* nocapture noundef readonly %1, i64 noundef %2) local_unnamed_addr #8 !dbg !405 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !410, metadata !DIExpression()), !dbg !411
  call void @llvm.dbg.value(metadata i8* %1, metadata !412, metadata !DIExpression()), !dbg !411
  call void @llvm.dbg.value(metadata i64 %2, metadata !413, metadata !DIExpression()), !dbg !411
  call void @llvm.dbg.value(metadata i8* %0, metadata !414, metadata !DIExpression()), !dbg !411
  call void @llvm.dbg.value(metadata i8* %1, metadata !415, metadata !DIExpression()), !dbg !411
  call void @llvm.dbg.value(metadata i64 %2, metadata !413, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !411
  %.not3 = icmp eq i64 %2, 0, !dbg !416
  br i1 %.not3, label %._crit_edge, label %.lr.ph, !dbg !417

.lr.ph:                                           ; preds = %3, %.lr.ph
  %.06 = phi i8* [ %5, %.lr.ph ], [ %1, %3 ]
  %.015 = phi i8* [ %7, %.lr.ph ], [ %0, %3 ]
  %.024 = phi i64 [ %4, %.lr.ph ], [ %2, %3 ]
  call void @llvm.dbg.value(metadata i8* %.06, metadata !415, metadata !DIExpression()), !dbg !411
  call void @llvm.dbg.value(metadata i8* %.015, metadata !414, metadata !DIExpression()), !dbg !411
  call void @llvm.dbg.value(metadata i64 %.024, metadata !413, metadata !DIExpression()), !dbg !411
  %4 = add i64 %.024, -1, !dbg !418
  call void @llvm.dbg.value(metadata i64 %4, metadata !413, metadata !DIExpression()), !dbg !411
  %5 = getelementptr inbounds i8, i8* %.06, i64 1, !dbg !419
  call void @llvm.dbg.value(metadata i8* %5, metadata !415, metadata !DIExpression()), !dbg !411
  %6 = load i8, i8* %.06, align 1, !dbg !420
  %7 = getelementptr inbounds i8, i8* %.015, i64 1, !dbg !421
  call void @llvm.dbg.value(metadata i8* %7, metadata !414, metadata !DIExpression()), !dbg !411
  store i8 %6, i8* %.015, align 1, !dbg !422
  call void @llvm.dbg.value(metadata i64 %4, metadata !413, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !411
  %.not = icmp eq i64 %4, 0, !dbg !416
  br i1 %.not, label %._crit_edge, label %.lr.ph, !dbg !417, !llvm.loop !423

._crit_edge:                                      ; preds = %.lr.ph, %3
  ret i8* %0, !dbg !424
}

; Function Attrs: nofree noinline norecurse nosync nounwind uwtable writeonly
define dso_local i8* @memset(i8* noundef returned writeonly %0, i32 noundef %1, i64 noundef %2) local_unnamed_addr #9 !dbg !425 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !429, metadata !DIExpression()), !dbg !430
  call void @llvm.dbg.value(metadata i32 %1, metadata !431, metadata !DIExpression()), !dbg !430
  call void @llvm.dbg.value(metadata i64 %2, metadata !432, metadata !DIExpression()), !dbg !430
  call void @llvm.dbg.value(metadata i8* %0, metadata !433, metadata !DIExpression()), !dbg !430
  call void @llvm.dbg.value(metadata i64 %2, metadata !432, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !430
  %.not2 = icmp eq i64 %2, 0, !dbg !434
  br i1 %.not2, label %._crit_edge, label %.lr.ph, !dbg !435

.lr.ph:                                           ; preds = %3
  %4 = trunc i32 %1 to i8
  br label %5, !dbg !435

5:                                                ; preds = %.lr.ph, %5
  %.04 = phi i8* [ %0, %.lr.ph ], [ %7, %5 ]
  %.013 = phi i64 [ %2, %.lr.ph ], [ %6, %5 ]
  call void @llvm.dbg.value(metadata i8* %.04, metadata !433, metadata !DIExpression()), !dbg !430
  call void @llvm.dbg.value(metadata i64 %.013, metadata !432, metadata !DIExpression()), !dbg !430
  %6 = add i64 %.013, -1, !dbg !436
  call void @llvm.dbg.value(metadata i64 %6, metadata !432, metadata !DIExpression()), !dbg !430
  %7 = getelementptr inbounds i8, i8* %.04, i64 1, !dbg !437
  call void @llvm.dbg.value(metadata i8* %7, metadata !433, metadata !DIExpression()), !dbg !430
  store i8 %4, i8* %.04, align 1, !dbg !438
  call void @llvm.dbg.value(metadata i64 %6, metadata !432, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !430
  %.not = icmp eq i64 %6, 0, !dbg !434
  br i1 %.not, label %._crit_edge, label %5, !dbg !435, !llvm.loop !439

._crit_edge:                                      ; preds = %5, %3
  ret i8* %0, !dbg !441
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree nosync nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noinline noreturn nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nofree noinline norecurse nosync nounwind readonly uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nofree noinline norecurse nosync nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nofree noinline norecurse nosync nounwind uwtable writeonly "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nounwind }
attributes #11 = { nounwind readonly willreturn }
attributes #12 = { nounwind readnone willreturn }

!llvm.dbg.cu = !{!0, !16, !20, !22, !24, !26, !28}
!llvm.ident = !{!30, !30, !30, !30, !30, !30, !30}
!llvm.module.flags = !{!31, !32, !33, !34, !35, !36, !37}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/058_print-bgp.c_1173_local_cpp_cwe-120-overflow/harness/driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/058_print-bgp.c_1173_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "85c1a30f8ff45a54cd004268bd54842f")
!2 = !{!3, !15}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "netdissect_options", file: !5, line: 23, baseType: !6)
!5 = !DIFile(filename: "harness_types.h", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/058_print-bgp.c_1173_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "ce431b198c80e5fe0e9426b1b9742f56")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !5, line: 20, size: 128, elements: !7)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_vflag", scope: !6, file: !5, line: 21, baseType: !9, size: 32)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_snapend", scope: !6, file: !5, line: 22, baseType: !11, size: 64, offset: 64)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !5, line: 13, baseType: !14)
!14 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!16 = distinct !DICompileUnit(language: DW_LANG_C99, file: !17, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !18, splitDebugInlining: false, nameTableKind: None)
!17 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/058_print-bgp.c_1173_local_cpp_cwe-120-overflow/harness/print-bgp.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/058_print-bgp.c_1173_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "2afd2ff60fb587599e6b02ce07920e25")
!18 = !{!19}
!19 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!20 = distinct !DICompileUnit(language: DW_LANG_C99, file: !21, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!21 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/058_print-bgp.c_1173_local_cpp_cwe-120-overflow/harness/smart_stubs.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/058_print-bgp.c_1173_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "bcda1acd1a733c696e028616d9d6f3b5")
!22 = distinct !DICompileUnit(language: DW_LANG_C99, file: !23, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!23 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/058_print-bgp.c_1173_local_cpp_cwe-120-overflow/harness/stubs.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/058_print-bgp.c_1173_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "d9e236e5fdbc5e9ecaf3391321ab999b")
!24 = distinct !DICompileUnit(language: DW_LANG_C99, file: !25, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!25 = !DIFile(filename: "/opt/tools/klee/runtime/Freestanding/memcmp.c", directory: "/opt/tools/klee/build/runtime/Freestanding", checksumkind: CSK_MD5, checksum: "5350b831de232a5be5b37d49ccbaf0ef")
!26 = distinct !DICompileUnit(language: DW_LANG_C99, file: !27, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!27 = !DIFile(filename: "/opt/tools/klee/runtime/Freestanding/memcpy.c", directory: "/opt/tools/klee/build/runtime/Freestanding", checksumkind: CSK_MD5, checksum: "8fb9a7164e167db005d7d002570068bc")
!28 = distinct !DICompileUnit(language: DW_LANG_C99, file: !29, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!29 = !DIFile(filename: "/opt/tools/klee/runtime/Freestanding/memset.c", directory: "/opt/tools/klee/build/runtime/Freestanding", checksumkind: CSK_MD5, checksum: "72c61b3d8150747c019c191df9708e2b")
!30 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!31 = !{i32 7, !"Dwarf Version", i32 5}
!32 = !{i32 2, !"Debug Info Version", i32 3}
!33 = !{i32 1, !"wchar_size", i32 4}
!34 = !{i32 7, !"PIC Level", i32 2}
!35 = !{i32 7, !"PIE Level", i32 2}
!36 = !{i32 7, !"uwtable", i32 1}
!37 = !{i32 7, !"frame-pointer", i32 2}
!38 = distinct !DISubprogram(name: "main", scope: !39, file: !39, line: 9, type: !40, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !42)
!39 = !DIFile(filename: "driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/058_print-bgp.c_1173_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "85c1a30f8ff45a54cd004268bd54842f")
!40 = !DISubroutineType(types: !41)
!41 = !{!9}
!42 = !{}
!43 = !DILocalVariable(name: "ndo", scope: !38, file: !39, line: 10, type: !3)
!44 = !DILocation(line: 10, column: 25, scope: !38)
!45 = !DILocation(line: 10, column: 53, scope: !38)
!46 = !DILocation(line: 10, column: 31, scope: !38)
!47 = !DILocation(line: 11, column: 10, scope: !48)
!48 = distinct !DILexicalBlock(scope: !38, file: !39, line: 11, column: 9)
!49 = !DILocation(line: 11, column: 9, scope: !38)
!50 = !DILocation(line: 11, column: 15, scope: !48)
!51 = !DILocation(line: 13, column: 5, scope: !38)
!52 = !DILocation(line: 13, column: 10, scope: !38)
!53 = !DILocation(line: 13, column: 20, scope: !38)
!54 = !DILocalVariable(name: "len", scope: !38, file: !39, line: 15, type: !9)
!55 = !DILocation(line: 15, column: 9, scope: !38)
!56 = !DILocalVariable(name: "buf", scope: !38, file: !39, line: 16, type: !15)
!57 = !DILocation(line: 16, column: 13, scope: !38)
!58 = !DILocation(line: 16, column: 39, scope: !38)
!59 = !DILocation(line: 16, column: 29, scope: !38)
!60 = !DILocation(line: 17, column: 10, scope: !61)
!61 = distinct !DILexicalBlock(scope: !38, file: !39, line: 17, column: 9)
!62 = !DILocation(line: 17, column: 9, scope: !38)
!63 = !DILocation(line: 17, column: 15, scope: !61)
!64 = !DILocation(line: 18, column: 24, scope: !38)
!65 = !DILocation(line: 18, column: 29, scope: !38)
!66 = !DILocation(line: 18, column: 5, scope: !38)
!67 = !DILocation(line: 20, column: 5, scope: !38)
!68 = !DILocation(line: 20, column: 12, scope: !38)
!69 = !DILocation(line: 20, column: 20, scope: !38)
!70 = !DILocation(line: 20, column: 27, scope: !38)
!71 = !DILocation(line: 20, column: 35, scope: !38)
!72 = !DILocation(line: 20, column: 42, scope: !38)
!73 = !DILocation(line: 20, column: 50, scope: !38)
!74 = !DILocation(line: 20, column: 57, scope: !38)
!75 = !DILocation(line: 21, column: 5, scope: !38)
!76 = !DILocation(line: 21, column: 12, scope: !38)
!77 = !DILocation(line: 21, column: 20, scope: !38)
!78 = !DILocation(line: 21, column: 27, scope: !38)
!79 = !DILocation(line: 21, column: 35, scope: !38)
!80 = !DILocation(line: 21, column: 42, scope: !38)
!81 = !DILocation(line: 21, column: 50, scope: !38)
!82 = !DILocation(line: 21, column: 57, scope: !38)
!83 = !DILocation(line: 22, column: 5, scope: !38)
!84 = !DILocation(line: 22, column: 12, scope: !38)
!85 = !DILocation(line: 22, column: 20, scope: !38)
!86 = !DILocation(line: 22, column: 27, scope: !38)
!87 = !DILocation(line: 22, column: 35, scope: !38)
!88 = !DILocation(line: 22, column: 43, scope: !38)
!89 = !DILocation(line: 22, column: 51, scope: !38)
!90 = !DILocation(line: 22, column: 59, scope: !38)
!91 = !DILocation(line: 23, column: 5, scope: !38)
!92 = !DILocation(line: 23, column: 13, scope: !38)
!93 = !DILocation(line: 23, column: 21, scope: !38)
!94 = !DILocation(line: 23, column: 29, scope: !38)
!95 = !DILocation(line: 23, column: 37, scope: !38)
!96 = !DILocation(line: 23, column: 45, scope: !38)
!97 = !DILocation(line: 23, column: 53, scope: !38)
!98 = !DILocation(line: 23, column: 61, scope: !38)
!99 = !DILocation(line: 24, column: 5, scope: !38)
!100 = !DILocation(line: 24, column: 13, scope: !38)
!101 = !DILocation(line: 25, column: 5, scope: !38)
!102 = !DILocation(line: 25, column: 13, scope: !38)
!103 = !DILocation(line: 26, column: 5, scope: !38)
!104 = !DILocation(line: 26, column: 13, scope: !38)
!105 = !DILocation(line: 27, column: 5, scope: !38)
!106 = !DILocation(line: 27, column: 13, scope: !38)
!107 = !DILocation(line: 28, column: 5, scope: !38)
!108 = !DILocation(line: 28, column: 13, scope: !38)
!109 = !DILocation(line: 29, column: 5, scope: !38)
!110 = !DILocation(line: 29, column: 13, scope: !38)
!111 = !DILocation(line: 30, column: 5, scope: !38)
!112 = !DILocation(line: 30, column: 13, scope: !38)
!113 = !DILocation(line: 32, column: 24, scope: !38)
!114 = !DILocation(line: 32, column: 30, scope: !38)
!115 = !DILocation(line: 32, column: 28, scope: !38)
!116 = !DILocation(line: 32, column: 5, scope: !38)
!117 = !DILocation(line: 32, column: 10, scope: !38)
!118 = !DILocation(line: 32, column: 22, scope: !38)
!119 = !DILocation(line: 33, column: 15, scope: !38)
!120 = !DILocation(line: 33, column: 20, scope: !38)
!121 = !DILocation(line: 33, column: 25, scope: !38)
!122 = !DILocation(line: 33, column: 5, scope: !38)
!123 = !DILocation(line: 34, column: 5, scope: !38)
!124 = !DILocation(line: 35, column: 1, scope: !38)
!125 = distinct !DISubprogram(name: "bgp_print", scope: !126, file: !126, line: 32, type: !127, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !42)
!126 = !DIFile(filename: "print-bgp.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/058_print-bgp.c_1173_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "2afd2ff60fb587599e6b02ce07920e25")
!127 = !DISubroutineType(types: !128)
!128 = !{null, !129, !135, !9}
!129 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !130, size: 64)
!130 = !DIDerivedType(tag: DW_TAG_typedef, name: "netdissect_options", file: !126, line: 21, baseType: !131)
!131 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !126, line: 18, size: 128, elements: !132)
!132 = !{!133, !134}
!133 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_vflag", scope: !131, file: !126, line: 19, baseType: !9, size: 32)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_snapend", scope: !131, file: !126, line: 20, baseType: !135, size: 64, offset: 64)
!135 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !136, size: 64)
!136 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !137)
!137 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !126, line: 11, baseType: !14)
!138 = !DILocalVariable(name: "ndo", arg: 1, scope: !125, file: !126, line: 32, type: !129)
!139 = !DILocation(line: 32, column: 36, scope: !125)
!140 = !DILocalVariable(name: "dat", arg: 2, scope: !125, file: !126, line: 32, type: !135)
!141 = !DILocation(line: 32, column: 55, scope: !125)
!142 = !DILocalVariable(name: "length", arg: 3, scope: !125, file: !126, line: 32, type: !9)
!143 = !DILocation(line: 32, column: 64, scope: !125)
!144 = !DILocation(line: 34, column: 5, scope: !125)
!145 = !DILocalVariable(name: "p", scope: !125, file: !126, line: 35, type: !135)
!146 = !DILocation(line: 35, column: 16, scope: !125)
!147 = !DILocalVariable(name: "ep", scope: !125, file: !126, line: 36, type: !135)
!148 = !DILocation(line: 36, column: 16, scope: !125)
!149 = !DILocalVariable(name: "start", scope: !125, file: !126, line: 37, type: !135)
!150 = !DILocation(line: 37, column: 16, scope: !125)
!151 = !DILocalVariable(name: "marker", scope: !125, file: !126, line: 38, type: !152)
!152 = !DICompositeType(tag: DW_TAG_array_type, baseType: !136, size: 128, elements: !153)
!153 = !{!154}
!154 = !DISubrange(count: 16)
!155 = !DILocation(line: 38, column: 15, scope: !125)
!156 = !DILocalVariable(name: "bgp", scope: !125, file: !126, line: 42, type: !157)
!157 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bgp", file: !126, line: 23, size: 160, elements: !158)
!158 = !{!159, !161, !167}
!159 = !DIDerivedType(tag: DW_TAG_member, name: "bgp_marker", scope: !157, file: !126, line: 24, baseType: !160, size: 128)
!160 = !DICompositeType(tag: DW_TAG_array_type, baseType: !137, size: 128, elements: !153)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "bgp_len", scope: !157, file: !126, line: 25, baseType: !162, size: 16, offset: 128)
!162 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !163, line: 25, baseType: !164)
!163 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "2bf2ae53c58c01b1a1b9383b5195125c")
!164 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !165, line: 40, baseType: !166)
!165 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!166 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!167 = !DIDerivedType(tag: DW_TAG_member, name: "bgp_type", scope: !157, file: !126, line: 26, baseType: !137, size: 8, offset: 144)
!168 = !DILocation(line: 42, column: 13, scope: !125)
!169 = !DILocalVariable(name: "hlen", scope: !125, file: !126, line: 43, type: !162)
!170 = !DILocation(line: 43, column: 11, scope: !125)
!171 = !DILocation(line: 45, column: 7, scope: !125)
!172 = !DILocation(line: 45, column: 13, scope: !125)
!173 = !DILocation(line: 45, column: 11, scope: !125)
!174 = !DILocation(line: 45, column: 5, scope: !125)
!175 = !DILocation(line: 46, column: 6, scope: !176)
!176 = distinct !DILexicalBlock(scope: !125, file: !126, line: 46, column: 6)
!177 = !DILocation(line: 46, column: 11, scope: !176)
!178 = !DILocation(line: 46, column: 25, scope: !176)
!179 = !DILocation(line: 46, column: 31, scope: !176)
!180 = !DILocation(line: 46, column: 29, scope: !176)
!181 = !DILocation(line: 46, column: 23, scope: !176)
!182 = !DILocation(line: 46, column: 6, scope: !125)
!183 = !DILocation(line: 47, column: 8, scope: !176)
!184 = !DILocation(line: 47, column: 13, scope: !176)
!185 = !DILocation(line: 47, column: 6, scope: !176)
!186 = !DILocation(line: 47, column: 3, scope: !176)
!187 = !DILocation(line: 49, column: 6, scope: !188)
!188 = distinct !DILexicalBlock(scope: !125, file: !126, line: 49, column: 6)
!189 = !DILocation(line: 49, column: 11, scope: !188)
!190 = !DILocation(line: 49, column: 21, scope: !188)
!191 = !DILocation(line: 49, column: 6, scope: !125)
!192 = !DILocation(line: 50, column: 10, scope: !188)
!193 = !DILocation(line: 52, column: 6, scope: !125)
!194 = !DILocation(line: 52, column: 4, scope: !125)
!195 = !DILocation(line: 53, column: 10, scope: !125)
!196 = !DILocation(line: 53, column: 8, scope: !125)
!197 = !DILocation(line: 54, column: 2, scope: !125)
!198 = !DILocation(line: 54, column: 9, scope: !125)
!199 = !DILocation(line: 54, column: 13, scope: !125)
!200 = !DILocation(line: 54, column: 11, scope: !125)
!201 = !DILocation(line: 55, column: 7, scope: !202)
!202 = distinct !DILexicalBlock(scope: !203, file: !126, line: 55, column: 7)
!203 = distinct !DILexicalBlock(scope: !125, file: !126, line: 54, column: 17)
!204 = !DILocation(line: 55, column: 12, scope: !202)
!205 = !DILocation(line: 55, column: 7, scope: !203)
!206 = !DILocation(line: 56, column: 5, scope: !207)
!207 = distinct !DILexicalBlock(scope: !202, file: !126, line: 55, column: 21)
!208 = !DILocation(line: 57, column: 4, scope: !207)
!209 = distinct !{!209, !197, !210, !211}
!210 = !DILocation(line: 75, column: 2, scope: !125)
!211 = !{!"llvm.loop.mustprogress"}
!212 = !DILocation(line: 59, column: 14, scope: !213)
!213 = distinct !DILexicalBlock(scope: !203, file: !126, line: 59, column: 7)
!214 = !DILocation(line: 59, column: 17, scope: !213)
!215 = !DILocation(line: 59, column: 7, scope: !213)
!216 = !DILocation(line: 59, column: 41, scope: !213)
!217 = !DILocation(line: 59, column: 7, scope: !203)
!218 = !DILocation(line: 60, column: 5, scope: !219)
!219 = distinct !DILexicalBlock(scope: !213, file: !126, line: 59, column: 47)
!220 = !DILocation(line: 61, column: 4, scope: !219)
!221 = !DILocation(line: 63, column: 3, scope: !203)
!222 = !DILocation(line: 63, column: 16, scope: !203)
!223 = !DILocation(line: 64, column: 20, scope: !203)
!224 = !DILocation(line: 64, column: 10, scope: !203)
!225 = !DILocation(line: 64, column: 8, scope: !203)
!226 = !DILocation(line: 65, column: 7, scope: !227)
!227 = distinct !DILexicalBlock(scope: !203, file: !126, line: 65, column: 7)
!228 = !DILocation(line: 65, column: 12, scope: !227)
!229 = !DILocation(line: 65, column: 7, scope: !203)
!230 = !DILocation(line: 66, column: 4, scope: !227)
!231 = !DILocation(line: 68, column: 26, scope: !232)
!232 = distinct !DILexicalBlock(scope: !233, file: !126, line: 68, column: 8)
!233 = distinct !DILexicalBlock(scope: !234, file: !126, line: 67, column: 10)
!234 = distinct !DILexicalBlock(scope: !203, file: !126, line: 67, column: 7)
!235 = !DILocation(line: 68, column: 31, scope: !232)
!236 = !DILocation(line: 68, column: 34, scope: !232)
!237 = !DILocation(line: 68, column: 9, scope: !232)
!238 = !DILocation(line: 76, column: 2, scope: !125)
!239 = !DILocation(line: 77, column: 1, scope: !125)
!240 = distinct !DISubprogram(name: "bgp_header_print", scope: !126, file: !126, line: 117, type: !241, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !16, retainedNodes: !42)
!241 = !DISubroutineType(types: !242)
!242 = !{!9, !129, !135, !243}
!243 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !244, line: 35, baseType: !245)
!244 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "", checksumkind: CSK_MD5, checksum: "e62424071ad3f1b4d088c139fd9ccfd1")
!245 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u_int", file: !165, line: 33, baseType: !19)
!246 = !DILocalVariable(name: "ndo", arg: 1, scope: !240, file: !126, line: 117, type: !129)
!247 = !DILocation(line: 117, column: 49, scope: !240)
!248 = !DILocalVariable(name: "p", arg: 2, scope: !240, file: !126, line: 117, type: !135)
!249 = !DILocation(line: 117, column: 68, scope: !240)
!250 = !DILocalVariable(name: "hlen", arg: 3, scope: !240, file: !126, line: 117, type: !243)
!251 = !DILocation(line: 117, column: 77, scope: !240)
!252 = !DILocation(line: 118, column: 22, scope: !240)
!253 = !DILocation(line: 118, column: 27, scope: !240)
!254 = !DILocation(line: 118, column: 30, scope: !240)
!255 = !DILocation(line: 118, column: 5, scope: !240)
!256 = distinct !DISubprogram(name: "bgp_update_print", scope: !126, file: !126, line: 110, type: !257, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !42)
!257 = !DISubroutineType(types: !258)
!258 = !{null, !129, !135, !243}
!259 = !DILocalVariable(name: "ndo", arg: 1, scope: !256, file: !126, line: 110, type: !129)
!260 = !DILocation(line: 110, column: 43, scope: !256)
!261 = !DILocalVariable(name: "p", arg: 2, scope: !256, file: !126, line: 110, type: !135)
!262 = !DILocation(line: 110, column: 62, scope: !256)
!263 = !DILocalVariable(name: "hlen", arg: 3, scope: !256, file: !126, line: 110, type: !243)
!264 = !DILocation(line: 110, column: 71, scope: !256)
!265 = !DILocation(line: 111, column: 20, scope: !256)
!266 = !DILocation(line: 111, column: 25, scope: !256)
!267 = !DILocation(line: 111, column: 28, scope: !256)
!268 = !DILocation(line: 111, column: 5, scope: !256)
!269 = distinct !DISubprogram(name: "decode_labeled_prefix6", scope: !126, file: !126, line: 79, type: !270, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !16, retainedNodes: !42)
!270 = !DISubroutineType(types: !271)
!271 = !{!9, !129, !135, !243, !272, !243}
!272 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !273, size: 64)
!273 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!274 = !DILocalVariable(name: "ndo", arg: 1, scope: !269, file: !126, line: 79, type: !129)
!275 = !DILocation(line: 79, column: 55, scope: !269)
!276 = !DILocalVariable(name: "pptr", arg: 2, scope: !269, file: !126, line: 80, type: !135)
!277 = !DILocation(line: 80, column: 38, scope: !269)
!278 = !DILocalVariable(name: "itemlen", arg: 3, scope: !269, file: !126, line: 80, type: !243)
!279 = !DILocation(line: 80, column: 50, scope: !269)
!280 = !DILocalVariable(name: "buf", arg: 4, scope: !269, file: !126, line: 80, type: !272)
!281 = !DILocation(line: 80, column: 65, scope: !269)
!282 = !DILocalVariable(name: "buflen", arg: 5, scope: !269, file: !126, line: 80, type: !243)
!283 = !DILocation(line: 80, column: 76, scope: !269)
!284 = !DILocation(line: 82, column: 5, scope: !269)
!285 = !DILocalVariable(name: "addr", scope: !269, file: !126, line: 83, type: !286)
!286 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !287, line: 219, size: 128, elements: !288)
!287 = !DIFile(filename: "/usr/include/netinet/in.h", directory: "", checksumkind: CSK_MD5, checksum: "eb6560f10d4cfe9f30fea2c92b9da0fd")
!288 = !{!289}
!289 = !DIDerivedType(tag: DW_TAG_member, name: "__in6_u", scope: !286, file: !287, line: 226, baseType: !290, size: 128)
!290 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !286, file: !287, line: 221, size: 128, elements: !291)
!291 = !{!292, !296, !300}
!292 = !DIDerivedType(tag: DW_TAG_member, name: "__u6_addr8", scope: !290, file: !287, line: 223, baseType: !293, size: 128)
!293 = !DICompositeType(tag: DW_TAG_array_type, baseType: !294, size: 128, elements: !153)
!294 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !163, line: 24, baseType: !295)
!295 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !165, line: 38, baseType: !14)
!296 = !DIDerivedType(tag: DW_TAG_member, name: "__u6_addr16", scope: !290, file: !287, line: 224, baseType: !297, size: 128)
!297 = !DICompositeType(tag: DW_TAG_array_type, baseType: !162, size: 128, elements: !298)
!298 = !{!299}
!299 = !DISubrange(count: 8)
!300 = !DIDerivedType(tag: DW_TAG_member, name: "__u6_addr32", scope: !290, file: !287, line: 225, baseType: !301, size: 128)
!301 = !DICompositeType(tag: DW_TAG_array_type, baseType: !302, size: 128, elements: !304)
!302 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !163, line: 26, baseType: !303)
!303 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !165, line: 42, baseType: !19)
!304 = !{!305}
!305 = !DISubrange(count: 4)
!306 = !DILocation(line: 83, column: 18, scope: !269)
!307 = !DILocalVariable(name: "plen", scope: !269, file: !126, line: 84, type: !243)
!308 = !DILocation(line: 84, column: 8, scope: !269)
!309 = !DILocalVariable(name: "plenbytes", scope: !269, file: !126, line: 84, type: !243)
!310 = !DILocation(line: 84, column: 14, scope: !269)
!311 = !DILocation(line: 86, column: 9, scope: !269)
!312 = !DILocation(line: 86, column: 7, scope: !269)
!313 = !DILocation(line: 87, column: 13, scope: !269)
!314 = !DILocation(line: 88, column: 10, scope: !269)
!315 = !DILocation(line: 89, column: 2, scope: !269)
!316 = !DILocation(line: 90, column: 15, scope: !269)
!317 = !DILocation(line: 90, column: 20, scope: !269)
!318 = !DILocation(line: 90, column: 25, scope: !269)
!319 = !DILocation(line: 90, column: 12, scope: !269)
!320 = !DILocation(line: 91, column: 2, scope: !269)
!321 = !DILocation(line: 91, column: 17, scope: !269)
!322 = !DILocation(line: 91, column: 26, scope: !269)
!323 = !DILocation(line: 92, column: 11, scope: !269)
!324 = !DILocation(line: 92, column: 16, scope: !269)
!325 = !DILocation(line: 93, column: 33, scope: !269)
!326 = !DILocation(line: 93, column: 38, scope: !269)
!327 = !DILocation(line: 93, column: 18, scope: !269)
!328 = !DILocation(line: 94, column: 18, scope: !269)
!329 = !DILocation(line: 95, column: 30, scope: !269)
!330 = !DILocation(line: 95, column: 38, scope: !269)
!331 = !DILocation(line: 95, column: 48, scope: !269)
!332 = !DILocation(line: 95, column: 56, scope: !269)
!333 = !DILocation(line: 95, column: 45, scope: !269)
!334 = !DILocation(line: 95, column: 64, scope: !269)
!335 = !DILocation(line: 95, column: 62, scope: !269)
!336 = !DILocation(line: 95, column: 72, scope: !269)
!337 = !DILocation(line: 96, column: 20, scope: !269)
!338 = !DILocation(line: 96, column: 27, scope: !269)
!339 = !DILocation(line: 96, column: 30, scope: !269)
!340 = !DILocation(line: 96, column: 18, scope: !269)
!341 = !DILocation(line: 92, column: 2, scope: !269)
!342 = !DILocation(line: 97, column: 2, scope: !269)
!343 = !DILocation(line: 98, column: 13, scope: !269)
!344 = distinct !DISubprogram(name: "ip6addr_string", scope: !126, file: !126, line: 125, type: !345, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !16, retainedNodes: !42)
!345 = !DISubroutineType(types: !346)
!346 = !{!347, !129, !349}
!347 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !348, size: 64)
!348 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !273)
!349 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !350, size: 64)
!350 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!351 = !DILocalVariable(name: "ndo", arg: 1, scope: !344, file: !126, line: 125, type: !129)
!352 = !DILocation(line: 125, column: 55, scope: !344)
!353 = !DILocalVariable(name: "addr", arg: 2, scope: !344, file: !126, line: 125, type: !349)
!354 = !DILocation(line: 125, column: 72, scope: !344)
!355 = !DILocation(line: 125, column: 80, scope: !344)
!356 = distinct !DISubprogram(name: "bgp_attr_print", scope: !126, file: !126, line: 104, type: !257, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !42)
!357 = !DILocalVariable(name: "ndo", arg: 1, scope: !356, file: !126, line: 104, type: !129)
!358 = !DILocation(line: 104, column: 41, scope: !356)
!359 = !DILocalVariable(name: "p", arg: 2, scope: !356, file: !126, line: 104, type: !135)
!360 = !DILocation(line: 104, column: 60, scope: !356)
!361 = !DILocalVariable(name: "hlen", arg: 3, scope: !356, file: !126, line: 104, type: !243)
!362 = !DILocation(line: 104, column: 69, scope: !356)
!363 = !DILocation(line: 105, column: 28, scope: !356)
!364 = !DILocation(line: 105, column: 5, scope: !356)
!365 = distinct !DISubprogram(name: "memcmp", scope: !366, file: !366, line: 42, type: !367, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !24, retainedNodes: !42)
!366 = !DIFile(filename: "runtime/Freestanding/memcmp.c", directory: "/opt/tools/klee", checksumkind: CSK_MD5, checksum: "5350b831de232a5be5b37d49ccbaf0ef")
!367 = !DISubroutineType(types: !368)
!368 = !{!9, !349, !349, !369}
!369 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !370, line: 46, baseType: !371)
!370 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!371 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!372 = !DILocalVariable(name: "s1", arg: 1, scope: !365, file: !366, line: 42, type: !349)
!373 = !DILocation(line: 0, scope: !365)
!374 = !DILocalVariable(name: "s2", arg: 2, scope: !365, file: !366, line: 42, type: !349)
!375 = !DILocalVariable(name: "n", arg: 3, scope: !365, file: !366, line: 42, type: !369)
!376 = !DILocation(line: 43, column: 9, scope: !377)
!377 = distinct !DILexicalBlock(scope: !365, file: !366, line: 43, column: 7)
!378 = !DILocation(line: 43, column: 7, scope: !365)
!379 = !DILocation(line: 0, scope: !380)
!380 = distinct !DILexicalBlock(scope: !377, file: !366, line: 43, column: 15)
!381 = !DILocalVariable(name: "p2", scope: !380, file: !366, line: 44, type: !382)
!382 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !383, size: 64)
!383 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !14)
!384 = !DILocalVariable(name: "p1", scope: !380, file: !366, line: 44, type: !382)
!385 = !DILocation(line: 47, column: 11, scope: !386)
!386 = distinct !DILexicalBlock(scope: !387, file: !366, line: 47, column: 11)
!387 = distinct !DILexicalBlock(scope: !380, file: !366, line: 46, column: 8)
!388 = !DILocation(line: 47, column: 20, scope: !386)
!389 = !DILocation(line: 47, column: 17, scope: !386)
!390 = !DILocation(line: 47, column: 11, scope: !387)
!391 = !DILocation(line: 48, column: 17, scope: !392)
!392 = distinct !DILexicalBlock(scope: !386, file: !366, line: 47, column: 27)
!393 = !DILocation(line: 48, column: 25, scope: !392)
!394 = !DILocation(line: 48, column: 23, scope: !392)
!395 = !DILocation(line: 48, column: 9, scope: !392)
!396 = !DILocation(line: 47, column: 23, scope: !386)
!397 = !DILocation(line: 47, column: 14, scope: !386)
!398 = !DILocation(line: 50, column: 14, scope: !380)
!399 = !DILocation(line: 50, column: 18, scope: !380)
!400 = !DILocation(line: 50, column: 5, scope: !387)
!401 = distinct !{!401, !402, !403, !211}
!402 = !DILocation(line: 46, column: 5, scope: !380)
!403 = !DILocation(line: 50, column: 22, scope: !380)
!404 = !DILocation(line: 53, column: 1, scope: !365)
!405 = distinct !DISubprogram(name: "memcpy", scope: !406, file: !406, line: 12, type: !407, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !26, retainedNodes: !42)
!406 = !DIFile(filename: "runtime/Freestanding/memcpy.c", directory: "/opt/tools/klee", checksumkind: CSK_MD5, checksum: "8fb9a7164e167db005d7d002570068bc")
!407 = !DISubroutineType(types: !408)
!408 = !{!409, !409, !349, !369}
!409 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!410 = !DILocalVariable(name: "destaddr", arg: 1, scope: !405, file: !406, line: 12, type: !409)
!411 = !DILocation(line: 0, scope: !405)
!412 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !405, file: !406, line: 12, type: !349)
!413 = !DILocalVariable(name: "len", arg: 3, scope: !405, file: !406, line: 12, type: !369)
!414 = !DILocalVariable(name: "dest", scope: !405, file: !406, line: 13, type: !272)
!415 = !DILocalVariable(name: "src", scope: !405, file: !406, line: 14, type: !347)
!416 = !DILocation(line: 16, column: 16, scope: !405)
!417 = !DILocation(line: 16, column: 3, scope: !405)
!418 = !DILocation(line: 16, column: 13, scope: !405)
!419 = !DILocation(line: 17, column: 19, scope: !405)
!420 = !DILocation(line: 17, column: 15, scope: !405)
!421 = !DILocation(line: 17, column: 10, scope: !405)
!422 = !DILocation(line: 17, column: 13, scope: !405)
!423 = distinct !{!423, !417, !419, !211}
!424 = !DILocation(line: 18, column: 3, scope: !405)
!425 = distinct !DISubprogram(name: "memset", scope: !426, file: !426, line: 12, type: !427, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !42)
!426 = !DIFile(filename: "runtime/Freestanding/memset.c", directory: "/opt/tools/klee", checksumkind: CSK_MD5, checksum: "72c61b3d8150747c019c191df9708e2b")
!427 = !DISubroutineType(types: !428)
!428 = !{!409, !409, !9, !369}
!429 = !DILocalVariable(name: "dst", arg: 1, scope: !425, file: !426, line: 12, type: !409)
!430 = !DILocation(line: 0, scope: !425)
!431 = !DILocalVariable(name: "s", arg: 2, scope: !425, file: !426, line: 12, type: !9)
!432 = !DILocalVariable(name: "count", arg: 3, scope: !425, file: !426, line: 12, type: !369)
!433 = !DILocalVariable(name: "a", scope: !425, file: !426, line: 13, type: !272)
!434 = !DILocation(line: 14, column: 18, scope: !425)
!435 = !DILocation(line: 14, column: 3, scope: !425)
!436 = !DILocation(line: 14, column: 15, scope: !425)
!437 = !DILocation(line: 15, column: 7, scope: !425)
!438 = !DILocation(line: 15, column: 10, scope: !425)
!439 = distinct !{!439, !435, !440, !211}
!440 = !DILocation(line: 15, column: 12, scope: !425)
!441 = !DILocation(line: 16, column: 3, scope: !425)
