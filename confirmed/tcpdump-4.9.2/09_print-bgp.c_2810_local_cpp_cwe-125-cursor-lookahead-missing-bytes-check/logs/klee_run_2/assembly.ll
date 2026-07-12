; ModuleID = '/app/se_runs/sailor_engine/tcpdump-4.9.2/171_print-bgp.c_2810_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness/slice.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.netdissect_options = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8* }
%struct.bgp = type { i16, i8, i8, [15 x i8] }

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@.str.3 = private unnamed_addr constant [28 x i8] c"SPINE_PROBE:bgp_print:ENTRY\00", align 1
@__const.bgp_print.marker = private unnamed_addr constant [16 x i8] c"\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF", align 16
@.str.1 = private unnamed_addr constant [27 x i8] c"0 && \22SAILOR_SINK_REACHED\22\00", align 1
@.str.2 = private unnamed_addr constant [137 x i8] c"/app/se_runs/sailor_engine/tcpdump-4.9.2/171_print-bgp.c_2810_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness/print-bgp.c\00", align 1
@__PRETTY_FUNCTION__.bgp_print = private unnamed_addr constant [65 x i8] c"void bgp_print(struct netdissect_options *, const u_char *, int)\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !50 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.netdissect_options*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %2, metadata !55, metadata !DIExpression()), !dbg !56
  %5 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 80) #8, !dbg !57
  %6 = bitcast i8* %5 to %struct.netdissect_options*, !dbg !58
  store %struct.netdissect_options* %6, %struct.netdissect_options** %2, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata i8** %3, metadata !59, metadata !DIExpression()), !dbg !60
  %7 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 64) #8, !dbg !61
  store i8* %7, i8** %3, align 8, !dbg !60
  call void @llvm.dbg.declare(metadata i32* %4, metadata !62, metadata !DIExpression()), !dbg !63
  store i32 64, i32* %4, align 4, !dbg !63
  %8 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !64
  %9 = icmp ne %struct.netdissect_options* %8, null, !dbg !64
  br i1 %9, label %10, label %13, !dbg !66

10:                                               ; preds = %0
  %11 = load i8*, i8** %3, align 8, !dbg !67
  %12 = icmp ne i8* %11, null, !dbg !67
  br i1 %12, label %14, label %13, !dbg !68

13:                                               ; preds = %10, %0
  store i32 0, i32* %1, align 4, !dbg !69
  br label %37, !dbg !69

14:                                               ; preds = %10
  %15 = load i8*, i8** %3, align 8, !dbg !70
  %16 = load i32, i32* %4, align 4, !dbg !71
  %17 = sext i32 %16 to i64, !dbg !71
  call void @klee_make_symbolic(i8* noundef %15, i64 noundef %17, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !72
  %18 = load i8*, i8** %3, align 8, !dbg !73
  %19 = getelementptr inbounds i8, i8* %18, i64 0, !dbg !73
  store i8 -1, i8* %19, align 1, !dbg !74
  %20 = load i8*, i8** %3, align 8, !dbg !75
  %21 = getelementptr inbounds i8, i8* %20, i64 1, !dbg !75
  store i8 -1, i8* %21, align 1, !dbg !76
  %22 = load i8*, i8** %3, align 8, !dbg !77
  %23 = getelementptr inbounds i8, i8* %22, i64 2, !dbg !77
  store i8 -1, i8* %23, align 1, !dbg !78
  %24 = load i8*, i8** %3, align 8, !dbg !79
  %25 = getelementptr inbounds i8, i8* %24, i64 3, !dbg !79
  store i8 -1, i8* %25, align 1, !dbg !80
  %26 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !81
  %27 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %26, i32 0, i32 10, !dbg !82
  store i32 1, i32* %27, align 8, !dbg !83
  %28 = load i8*, i8** %3, align 8, !dbg !84
  %29 = load i32, i32* %4, align 4, !dbg !85
  %30 = sext i32 %29 to i64, !dbg !86
  %31 = getelementptr inbounds i8, i8* %28, i64 %30, !dbg !86
  %32 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !87
  %33 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %32, i32 0, i32 17, !dbg !88
  store i8* %31, i8** %33, align 8, !dbg !89
  %34 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !90
  %35 = load i8*, i8** %3, align 8, !dbg !91
  %36 = load i32, i32* %4, align 4, !dbg !92
  call fastcc void @bgp_print(%struct.netdissect_options* noundef %34, i8* noundef %35, i32 noundef %36), !dbg !93
  store i32 0, i32* %1, align 4, !dbg !94
  br label %37, !dbg !94

37:                                               ; preds = %14, %13
  %38 = load i32, i32* %1, align 4, !dbg !95
  ret i32 %38, !dbg !95
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

declare void @klee_make_symbolic(i8* noundef, i64 noundef, i8* noundef) local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @bgp_print(%struct.netdissect_options* noundef %0, i8* noundef %1, i32 noundef %2) unnamed_addr #0 !dbg !96 {
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
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %4, metadata !123, metadata !DIExpression()), !dbg !124
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !125, metadata !DIExpression()), !dbg !126
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !127, metadata !DIExpression()), !dbg !128
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([28 x i8], [28 x i8]* @.str.3, i64 0, i64 0)), !dbg !129
  call void @llvm.dbg.declare(metadata i8** %7, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata i8** %8, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i8** %9, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata [16 x i8]* %10, metadata !136, metadata !DIExpression()), !dbg !140
  %13 = bitcast [16 x i8]* %10 to i8*, !dbg !140
  %14 = call i8* @memcpy(i8* %13, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @__const.bgp_print.marker, i32 0, i32 0), i64 16), !dbg !140
  call void @llvm.dbg.declare(metadata %struct.bgp* %11, metadata !141, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata i16* %12, metadata !157, metadata !DIExpression()), !dbg !160
  %15 = load i8*, i8** %5, align 8, !dbg !161
  %16 = load i32, i32* %6, align 4, !dbg !162
  %17 = sext i32 %16 to i64, !dbg !163
  %18 = getelementptr inbounds i8, i8* %15, i64 %17, !dbg !163
  store i8* %18, i8** %8, align 8, !dbg !164
  %19 = load %struct.netdissect_options*, %struct.netdissect_options** %4, align 8, !dbg !165
  %20 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %19, i32 0, i32 17, !dbg !167
  %21 = load i8*, i8** %20, align 8, !dbg !167
  %22 = load i8*, i8** %5, align 8, !dbg !168
  %23 = load i32, i32* %6, align 4, !dbg !169
  %24 = sext i32 %23 to i64, !dbg !170
  %25 = getelementptr inbounds i8, i8* %22, i64 %24, !dbg !170
  %26 = icmp ult i8* %21, %25, !dbg !171
  br i1 %26, label %27, label %31, !dbg !172

27:                                               ; preds = %3
  %28 = load %struct.netdissect_options*, %struct.netdissect_options** %4, align 8, !dbg !173
  %29 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %28, i32 0, i32 17, !dbg !174
  %30 = load i8*, i8** %29, align 8, !dbg !174
  store i8* %30, i8** %8, align 8, !dbg !175
  br label %31, !dbg !176

31:                                               ; preds = %27, %3
  %32 = load i8*, i8** %5, align 8, !dbg !177
  store i8* %32, i8** %7, align 8, !dbg !178
  %33 = load i8*, i8** %7, align 8, !dbg !179
  store i8* %33, i8** %9, align 8, !dbg !180
  %34 = load %struct.netdissect_options*, %struct.netdissect_options** %4, align 8, !dbg !181
  %35 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %34, i32 0, i32 10, !dbg !183
  %36 = load i32, i32* %35, align 8, !dbg !183
  %37 = icmp slt i32 %36, 1, !dbg !184
  br i1 %37, label %38, label %39, !dbg !185

38:                                               ; preds = %31
  br label %91, !dbg !186

39:                                               ; preds = %31
  br label %40, !dbg !187

40:                                               ; preds = %.backedge, %39
  %41 = load i8*, i8** %7, align 8, !dbg !188
  %42 = load i8*, i8** %8, align 8, !dbg !189
  %43 = icmp ult i8* %41, %42, !dbg !190
  br i1 %43, label %44, label %.loopexit, !dbg !187

44:                                               ; preds = %40
  %45 = load i8*, i8** %7, align 8, !dbg !191
  %46 = getelementptr inbounds i8, i8* %45, i64 0, !dbg !191
  %47 = load i8, i8* %46, align 1, !dbg !191
  %48 = zext i8 %47 to i32, !dbg !191
  %49 = icmp ne i32 %48, 255, !dbg !194
  br i1 %49, label %50, label %53, !dbg !195

50:                                               ; preds = %44
  %51 = load i8*, i8** %7, align 8, !dbg !196
  %52 = getelementptr inbounds i8, i8* %51, i32 1, !dbg !196
  store i8* %52, i8** %7, align 8, !dbg !196
  br label %.backedge, !dbg !198

.backedge:                                        ; preds = %50, %58, %88
  br label %40, !dbg !188, !llvm.loop !199

53:                                               ; preds = %44
  %54 = load i8*, i8** %7, align 8, !dbg !202
  %55 = getelementptr inbounds [16 x i8], [16 x i8]* %10, i64 0, i64 0, !dbg !204
  %56 = call i32 @memcmp(i8* noundef %54, i8* noundef %55, i64 noundef 16) #9, !dbg !205
  %57 = icmp ne i32 %56, 0, !dbg !206
  br i1 %57, label %58, label %61, !dbg !207

58:                                               ; preds = %53
  %59 = load i8*, i8** %7, align 8, !dbg !208
  %60 = getelementptr inbounds i8, i8* %59, i32 1, !dbg !208
  store i8* %60, i8** %7, align 8, !dbg !208
  br label %.backedge, !dbg !210

61:                                               ; preds = %53
  %62 = bitcast %struct.bgp* %11 to i8*, !dbg !211
  %63 = load i8*, i8** %7, align 8, !dbg !212
  %64 = call i8* @memcpy(i8* %62, i8* %63, i64 19), !dbg !211
  %65 = getelementptr inbounds %struct.bgp, %struct.bgp* %11, i32 0, i32 0, !dbg !213
  %66 = load i16, i16* %65, align 2, !dbg !213
  %67 = call zeroext i16 @ntohs(i16 noundef zeroext %66) #10, !dbg !214
  store i16 %67, i16* %12, align 2, !dbg !215
  %68 = load i16, i16* %12, align 2, !dbg !216
  %69 = zext i16 %68 to i32, !dbg !216
  %70 = icmp slt i32 %69, 19, !dbg !218
  br i1 %70, label %71, label %72, !dbg !219

71:                                               ; preds = %61
  br label %89, !dbg !220

72:                                               ; preds = %61
  %73 = load i8*, i8** %7, align 8, !dbg !222
  %74 = load i16, i16* %12, align 2, !dbg !224
  %75 = zext i16 %74 to i32, !dbg !224
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds i8, i8* %73, i64 %76, !dbg !225
  %78 = load i8*, i8** %8, align 8, !dbg !226
  %79 = icmp ule i8* %77, %78, !dbg !227
  br i1 %79, label %80, label %87, !dbg !228

80:                                               ; preds = %72
  %81 = load i16, i16* %12, align 2, !dbg !229
  %82 = zext i16 %81 to i32, !dbg !229
  %83 = load i8*, i8** %7, align 8, !dbg !231
  %84 = zext i32 %82 to i64
  %85 = getelementptr inbounds i8, i8* %83, i64 %84, !dbg !231
  store i8* %85, i8** %7, align 8, !dbg !231
  %86 = load i8*, i8** %7, align 8, !dbg !232
  store i8* %86, i8** %9, align 8, !dbg !233
  br label %88, !dbg !234

87:                                               ; preds = %72
  br label %89, !dbg !235

88:                                               ; preds = %80
  br label %.backedge, !dbg !187

.loopexit:                                        ; preds = %40
  br label %89, !dbg !237

89:                                               ; preds = %.loopexit, %87, %71
  %90 = call i32 (i8*, i8*, i32, i8*, ...) bitcast (i32 (...)* @__assert_fail to i32 (i8*, i8*, i32, i8*, ...)*)(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1, i64 0, i64 0), i8* noundef getelementptr inbounds ([137 x i8], [137 x i8]* @.str.2, i64 0, i64 0), i32 noundef 78, i8* noundef getelementptr inbounds ([65 x i8], [65 x i8]* @__PRETTY_FUNCTION__.bgp_print, i64 0, i64 0)), !dbg !237
  unreachable, !dbg !238

91:                                               ; preds = %38
  ret void, !dbg !239
}

declare void @klee_warning_once(i8* noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare zeroext i16 @ntohs(i16 noundef zeroext) local_unnamed_addr #4

; Function Attrs: noreturn
declare i32 @__assert_fail(...) local_unnamed_addr #5

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readonly uwtable willreturn
define dso_local i32 @memcmp(i8* nocapture noundef nonnull readonly %0, i8* nocapture noundef nonnull readonly %1, i64 noundef %2) local_unnamed_addr #6 !dbg !240 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !249, metadata !DIExpression()), !dbg !250
  call void @llvm.dbg.value(metadata i8* %1, metadata !251, metadata !DIExpression()), !dbg !250
  call void @llvm.dbg.value(metadata i64 %2, metadata !252, metadata !DIExpression()), !dbg !250
  %.not = icmp eq i64 %2, 0, !dbg !253
  br i1 %.not, label %.loopexit, label %.preheader, !dbg !255

.preheader:                                       ; preds = %3, %10
  %.03 = phi i64 [ %13, %10 ], [ %2, %3 ]
  %.02 = phi i8* [ %12, %10 ], [ %0, %3 ], !dbg !256
  %.01 = phi i8* [ %11, %10 ], [ %1, %3 ], !dbg !256
  call void @llvm.dbg.value(metadata i8* %.01, metadata !258, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata i8* %.02, metadata !259, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata i64 %.03, metadata !252, metadata !DIExpression()), !dbg !250
  call void @llvm.dbg.value(metadata i8* %.02, metadata !259, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !256
  %4 = load i8, i8* %.02, align 1, !dbg !260
  call void @llvm.dbg.value(metadata i8* %.01, metadata !258, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !256
  %5 = load i8, i8* %.01, align 1, !dbg !263
  %.not4 = icmp eq i8 %4, %5, !dbg !264
  br i1 %.not4, label %10, label %6, !dbg !265

6:                                                ; preds = %.preheader
  call void @llvm.dbg.value(metadata i8* %.02, metadata !259, metadata !DIExpression()), !dbg !256
  %7 = zext i8 %4 to i32, !dbg !266
  call void @llvm.dbg.value(metadata i8* %.01, metadata !258, metadata !DIExpression()), !dbg !256
  %8 = zext i8 %5 to i32, !dbg !268
  %9 = sub nsw i32 %7, %8, !dbg !269
  br label %.loopexit, !dbg !270

10:                                               ; preds = %.preheader
  %11 = getelementptr inbounds i8, i8* %.01, i64 1, !dbg !271
  call void @llvm.dbg.value(metadata i8* %11, metadata !258, metadata !DIExpression()), !dbg !256
  %12 = getelementptr inbounds i8, i8* %.02, i64 1, !dbg !272
  call void @llvm.dbg.value(metadata i8* %12, metadata !259, metadata !DIExpression()), !dbg !256
  %13 = add i64 %.03, -1, !dbg !273
  call void @llvm.dbg.value(metadata i64 %13, metadata !252, metadata !DIExpression()), !dbg !250
  %.not5 = icmp eq i64 %13, 0, !dbg !274
  br i1 %.not5, label %.loopexit, label %.preheader, !dbg !275, !llvm.loop !276

.loopexit:                                        ; preds = %10, %3, %6
  %.0 = phi i32 [ %9, %6 ], [ 0, %3 ], [ 0, %10 ], !dbg !250
  ret i32 %.0, !dbg !279
}

; Function Attrs: nofree noinline norecurse nosync nounwind uwtable
define dso_local i8* @memcpy(i8* noundef returned writeonly %0, i8* nocapture noundef readonly %1, i64 noundef %2) local_unnamed_addr #7 !dbg !280 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !285, metadata !DIExpression()), !dbg !286
  call void @llvm.dbg.value(metadata i8* %1, metadata !287, metadata !DIExpression()), !dbg !286
  call void @llvm.dbg.value(metadata i64 %2, metadata !288, metadata !DIExpression()), !dbg !286
  call void @llvm.dbg.value(metadata i8* %0, metadata !289, metadata !DIExpression()), !dbg !286
  call void @llvm.dbg.value(metadata i8* %1, metadata !292, metadata !DIExpression()), !dbg !286
  call void @llvm.dbg.value(metadata i64 %2, metadata !288, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !286
  %.not3 = icmp eq i64 %2, 0, !dbg !295
  br i1 %.not3, label %._crit_edge, label %.lr.ph, !dbg !296

.lr.ph:                                           ; preds = %3, %.lr.ph
  %.06 = phi i8* [ %5, %.lr.ph ], [ %1, %3 ]
  %.015 = phi i8* [ %7, %.lr.ph ], [ %0, %3 ]
  %.024 = phi i64 [ %4, %.lr.ph ], [ %2, %3 ]
  call void @llvm.dbg.value(metadata i8* %.06, metadata !292, metadata !DIExpression()), !dbg !286
  call void @llvm.dbg.value(metadata i8* %.015, metadata !289, metadata !DIExpression()), !dbg !286
  call void @llvm.dbg.value(metadata i64 %.024, metadata !288, metadata !DIExpression()), !dbg !286
  %4 = add i64 %.024, -1, !dbg !297
  call void @llvm.dbg.value(metadata i64 %4, metadata !288, metadata !DIExpression()), !dbg !286
  %5 = getelementptr inbounds i8, i8* %.06, i64 1, !dbg !298
  call void @llvm.dbg.value(metadata i8* %5, metadata !292, metadata !DIExpression()), !dbg !286
  %6 = load i8, i8* %.06, align 1, !dbg !299
  %7 = getelementptr inbounds i8, i8* %.015, i64 1, !dbg !300
  call void @llvm.dbg.value(metadata i8* %7, metadata !289, metadata !DIExpression()), !dbg !286
  store i8 %6, i8* %.015, align 1, !dbg !301
  call void @llvm.dbg.value(metadata i64 %4, metadata !288, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !286
  %.not = icmp eq i64 %4, 0, !dbg !295
  br i1 %.not, label %._crit_edge, label %.lr.ph, !dbg !296, !llvm.loop !302

._crit_edge:                                      ; preds = %.lr.ph, %3
  ret i8* %0, !dbg !303
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree nosync nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree noinline norecurse nosync nounwind readonly uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree noinline norecurse nosync nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { nounwind readonly willreturn }
attributes #10 = { nounwind readnone willreturn }

!llvm.dbg.cu = !{!0, !34, !36, !38, !40}
!llvm.ident = !{!42, !42, !42, !42, !42}
!llvm.module.flags = !{!43, !44, !45, !46, !47, !48, !49}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/171_print-bgp.c_2810_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness/driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/171_print-bgp.c_2810_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "4bd73935948326141543b90eb4525d48")
!2 = !{!3, !29}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !5, line: 13, size: 640, elements: !6)
!5 = !DIFile(filename: "harness_types.h", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/171_print-bgp.c_2810_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "3eb9575f803e5b75f44d50f554ae8ac0")
!6 = !{!7, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25}
!7 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_bflag", scope: !4, file: !5, line: 14, baseType: !8, size: 32)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_eflag", scope: !4, file: !5, line: 15, baseType: !8, size: 32, offset: 32)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_fflag", scope: !4, file: !5, line: 16, baseType: !8, size: 32, offset: 64)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Kflag", scope: !4, file: !5, line: 17, baseType: !8, size: 32, offset: 96)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_nflag", scope: !4, file: !5, line: 18, baseType: !8, size: 32, offset: 128)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Nflag", scope: !4, file: !5, line: 19, baseType: !8, size: 32, offset: 160)
!14 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_qflag", scope: !4, file: !5, line: 20, baseType: !8, size: 32, offset: 192)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Sflag", scope: !4, file: !5, line: 21, baseType: !8, size: 32, offset: 224)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_tflag", scope: !4, file: !5, line: 22, baseType: !8, size: 32, offset: 256)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_uflag", scope: !4, file: !5, line: 23, baseType: !8, size: 32, offset: 288)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_vflag", scope: !4, file: !5, line: 24, baseType: !8, size: 32, offset: 320)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_xflag", scope: !4, file: !5, line: 25, baseType: !8, size: 32, offset: 352)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Xflag", scope: !4, file: !5, line: 26, baseType: !8, size: 32, offset: 384)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Aflag", scope: !4, file: !5, line: 27, baseType: !8, size: 32, offset: 416)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Hflag", scope: !4, file: !5, line: 28, baseType: !8, size: 32, offset: 448)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_packet_number", scope: !4, file: !5, line: 29, baseType: !8, size: 32, offset: 480)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_suppress_default_print", scope: !4, file: !5, line: 30, baseType: !8, size: 32, offset: 512)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_snapend", scope: !4, file: !5, line: 31, baseType: !26, size: 64, offset: 576)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !28)
!28 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !31, line: 33, baseType: !32)
!31 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "", checksumkind: CSK_MD5, checksum: "e62424071ad3f1b4d088c139fd9ccfd1")
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u_char", file: !33, line: 31, baseType: !28)
!33 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!34 = distinct !DICompileUnit(language: DW_LANG_C99, file: !35, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!35 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/171_print-bgp.c_2810_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness/print-bgp.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/171_print-bgp.c_2810_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "981504fc984f260149ba7e29d98aebde")
!36 = distinct !DICompileUnit(language: DW_LANG_C99, file: !37, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!37 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/171_print-bgp.c_2810_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness/smart_stubs.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/171_print-bgp.c_2810_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "bcda1acd1a733c696e028616d9d6f3b5")
!38 = distinct !DICompileUnit(language: DW_LANG_C99, file: !39, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!39 = !DIFile(filename: "/opt/tools/klee/runtime/Freestanding/memcmp.c", directory: "/opt/tools/klee/build/runtime/Freestanding", checksumkind: CSK_MD5, checksum: "5350b831de232a5be5b37d49ccbaf0ef")
!40 = distinct !DICompileUnit(language: DW_LANG_C99, file: !41, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!41 = !DIFile(filename: "/opt/tools/klee/runtime/Freestanding/memcpy.c", directory: "/opt/tools/klee/build/runtime/Freestanding", checksumkind: CSK_MD5, checksum: "8fb9a7164e167db005d7d002570068bc")
!42 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!43 = !{i32 7, !"Dwarf Version", i32 5}
!44 = !{i32 2, !"Debug Info Version", i32 3}
!45 = !{i32 1, !"wchar_size", i32 4}
!46 = !{i32 7, !"PIC Level", i32 2}
!47 = !{i32 7, !"PIE Level", i32 2}
!48 = !{i32 7, !"uwtable", i32 1}
!49 = !{i32 7, !"frame-pointer", i32 2}
!50 = distinct !DISubprogram(name: "main", scope: !51, file: !51, line: 13, type: !52, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !54)
!51 = !DIFile(filename: "driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/171_print-bgp.c_2810_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "4bd73935948326141543b90eb4525d48")
!52 = !DISubroutineType(types: !53)
!53 = !{!8}
!54 = !{}
!55 = !DILocalVariable(name: "ndo", scope: !50, file: !51, line: 14, type: !3)
!56 = !DILocation(line: 14, column: 32, scope: !50)
!57 = !DILocation(line: 14, column: 67, scope: !50)
!58 = !DILocation(line: 14, column: 38, scope: !50)
!59 = !DILocalVariable(name: "buf", scope: !50, file: !51, line: 15, type: !29)
!60 = !DILocation(line: 15, column: 13, scope: !50)
!61 = !DILocation(line: 15, column: 29, scope: !50)
!62 = !DILocalVariable(name: "length", scope: !50, file: !51, line: 16, type: !8)
!63 = !DILocation(line: 16, column: 9, scope: !50)
!64 = !DILocation(line: 18, column: 10, scope: !65)
!65 = distinct !DILexicalBlock(scope: !50, file: !51, line: 18, column: 9)
!66 = !DILocation(line: 18, column: 14, scope: !65)
!67 = !DILocation(line: 18, column: 18, scope: !65)
!68 = !DILocation(line: 18, column: 9, scope: !50)
!69 = !DILocation(line: 18, column: 23, scope: !65)
!70 = !DILocation(line: 20, column: 24, scope: !50)
!71 = !DILocation(line: 20, column: 29, scope: !50)
!72 = !DILocation(line: 20, column: 5, scope: !50)
!73 = !DILocation(line: 21, column: 5, scope: !50)
!74 = !DILocation(line: 21, column: 12, scope: !50)
!75 = !DILocation(line: 22, column: 5, scope: !50)
!76 = !DILocation(line: 22, column: 12, scope: !50)
!77 = !DILocation(line: 23, column: 5, scope: !50)
!78 = !DILocation(line: 23, column: 12, scope: !50)
!79 = !DILocation(line: 24, column: 5, scope: !50)
!80 = !DILocation(line: 24, column: 12, scope: !50)
!81 = !DILocation(line: 26, column: 5, scope: !50)
!82 = !DILocation(line: 26, column: 10, scope: !50)
!83 = !DILocation(line: 26, column: 20, scope: !50)
!84 = !DILocation(line: 27, column: 24, scope: !50)
!85 = !DILocation(line: 27, column: 30, scope: !50)
!86 = !DILocation(line: 27, column: 28, scope: !50)
!87 = !DILocation(line: 27, column: 5, scope: !50)
!88 = !DILocation(line: 27, column: 10, scope: !50)
!89 = !DILocation(line: 27, column: 22, scope: !50)
!90 = !DILocation(line: 29, column: 15, scope: !50)
!91 = !DILocation(line: 29, column: 20, scope: !50)
!92 = !DILocation(line: 29, column: 25, scope: !50)
!93 = !DILocation(line: 29, column: 5, scope: !50)
!94 = !DILocation(line: 30, column: 5, scope: !50)
!95 = !DILocation(line: 31, column: 1, scope: !50)
!96 = distinct !DISubprogram(name: "bgp_print", scope: !97, file: !97, line: 32, type: !98, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !34, retainedNodes: !54)
!97 = !DIFile(filename: "print-bgp.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/171_print-bgp.c_2810_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "981504fc984f260149ba7e29d98aebde")
!98 = !DISubroutineType(types: !99)
!99 = !{null, !100, !121, !8}
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !97, line: 11, size: 640, elements: !102)
!102 = !{!103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120}
!103 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_bflag", scope: !101, file: !97, line: 12, baseType: !8, size: 32)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_eflag", scope: !101, file: !97, line: 13, baseType: !8, size: 32, offset: 32)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_fflag", scope: !101, file: !97, line: 14, baseType: !8, size: 32, offset: 64)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Kflag", scope: !101, file: !97, line: 15, baseType: !8, size: 32, offset: 96)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_nflag", scope: !101, file: !97, line: 16, baseType: !8, size: 32, offset: 128)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Nflag", scope: !101, file: !97, line: 17, baseType: !8, size: 32, offset: 160)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_qflag", scope: !101, file: !97, line: 18, baseType: !8, size: 32, offset: 192)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Sflag", scope: !101, file: !97, line: 19, baseType: !8, size: 32, offset: 224)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_tflag", scope: !101, file: !97, line: 20, baseType: !8, size: 32, offset: 256)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_uflag", scope: !101, file: !97, line: 21, baseType: !8, size: 32, offset: 288)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_vflag", scope: !101, file: !97, line: 22, baseType: !8, size: 32, offset: 320)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_xflag", scope: !101, file: !97, line: 23, baseType: !8, size: 32, offset: 352)
!115 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Xflag", scope: !101, file: !97, line: 24, baseType: !8, size: 32, offset: 384)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Aflag", scope: !101, file: !97, line: 25, baseType: !8, size: 32, offset: 416)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Hflag", scope: !101, file: !97, line: 26, baseType: !8, size: 32, offset: 448)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_packet_number", scope: !101, file: !97, line: 27, baseType: !8, size: 32, offset: 480)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_suppress_default_print", scope: !101, file: !97, line: 28, baseType: !8, size: 32, offset: 512)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_snapend", scope: !101, file: !97, line: 29, baseType: !26, size: 64, offset: 576)
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !122, size: 64)
!122 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !30)
!123 = !DILocalVariable(name: "ndo", arg: 1, scope: !96, file: !97, line: 32, type: !100)
!124 = !DILocation(line: 32, column: 43, scope: !96)
!125 = !DILocalVariable(name: "dat", arg: 2, scope: !96, file: !97, line: 32, type: !121)
!126 = !DILocation(line: 32, column: 62, scope: !96)
!127 = !DILocalVariable(name: "length", arg: 3, scope: !96, file: !97, line: 32, type: !8)
!128 = !DILocation(line: 32, column: 71, scope: !96)
!129 = !DILocation(line: 34, column: 5, scope: !96)
!130 = !DILocalVariable(name: "p", scope: !96, file: !97, line: 35, type: !121)
!131 = !DILocation(line: 35, column: 16, scope: !96)
!132 = !DILocalVariable(name: "ep", scope: !96, file: !97, line: 36, type: !121)
!133 = !DILocation(line: 36, column: 16, scope: !96)
!134 = !DILocalVariable(name: "start", scope: !96, file: !97, line: 37, type: !121)
!135 = !DILocation(line: 37, column: 16, scope: !96)
!136 = !DILocalVariable(name: "marker", scope: !96, file: !97, line: 38, type: !137)
!137 = !DICompositeType(tag: DW_TAG_array_type, baseType: !122, size: 128, elements: !138)
!138 = !{!139}
!139 = !DISubrange(count: 16)
!140 = !DILocation(line: 38, column: 15, scope: !96)
!141 = !DILocalVariable(name: "bgp", scope: !96, file: !97, line: 42, type: !142)
!142 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bgp", scope: !96, file: !97, line: 42, size: 160, elements: !143)
!143 = !{!144, !148, !151, !152}
!144 = !DIDerivedType(tag: DW_TAG_member, name: "bgp_len", scope: !142, file: !97, line: 42, baseType: !145, size: 16)
!145 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int16_t", file: !31, line: 159, baseType: !146)
!146 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !33, line: 40, baseType: !147)
!147 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "bgp_type", scope: !142, file: !97, line: 42, baseType: !149, size: 8, offset: 16)
!149 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int8_t", file: !31, line: 158, baseType: !150)
!150 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !33, line: 38, baseType: !28)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "pad", scope: !142, file: !97, line: 42, baseType: !149, size: 8, offset: 24)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "rest", scope: !142, file: !97, line: 42, baseType: !153, size: 120, offset: 32)
!153 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 120, elements: !154)
!154 = !{!155}
!155 = !DISubrange(count: 15)
!156 = !DILocation(line: 42, column: 93, scope: !96)
!157 = !DILocalVariable(name: "hlen", scope: !96, file: !97, line: 43, type: !158)
!158 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !159, line: 25, baseType: !146)
!159 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "2bf2ae53c58c01b1a1b9383b5195125c")
!160 = !DILocation(line: 43, column: 11, scope: !96)
!161 = !DILocation(line: 45, column: 7, scope: !96)
!162 = !DILocation(line: 45, column: 13, scope: !96)
!163 = !DILocation(line: 45, column: 11, scope: !96)
!164 = !DILocation(line: 45, column: 5, scope: !96)
!165 = !DILocation(line: 46, column: 6, scope: !166)
!166 = distinct !DILexicalBlock(scope: !96, file: !97, line: 46, column: 6)
!167 = !DILocation(line: 46, column: 11, scope: !166)
!168 = !DILocation(line: 46, column: 25, scope: !166)
!169 = !DILocation(line: 46, column: 31, scope: !166)
!170 = !DILocation(line: 46, column: 29, scope: !166)
!171 = !DILocation(line: 46, column: 23, scope: !166)
!172 = !DILocation(line: 46, column: 6, scope: !96)
!173 = !DILocation(line: 47, column: 8, scope: !166)
!174 = !DILocation(line: 47, column: 13, scope: !166)
!175 = !DILocation(line: 47, column: 6, scope: !166)
!176 = !DILocation(line: 47, column: 3, scope: !166)
!177 = !DILocation(line: 49, column: 6, scope: !96)
!178 = !DILocation(line: 49, column: 4, scope: !96)
!179 = !DILocation(line: 50, column: 10, scope: !96)
!180 = !DILocation(line: 50, column: 8, scope: !96)
!181 = !DILocation(line: 51, column: 6, scope: !182)
!182 = distinct !DILexicalBlock(scope: !96, file: !97, line: 51, column: 6)
!183 = !DILocation(line: 51, column: 11, scope: !182)
!184 = !DILocation(line: 51, column: 21, scope: !182)
!185 = !DILocation(line: 51, column: 6, scope: !96)
!186 = !DILocation(line: 52, column: 3, scope: !182)
!187 = !DILocation(line: 54, column: 2, scope: !96)
!188 = !DILocation(line: 54, column: 9, scope: !96)
!189 = !DILocation(line: 54, column: 13, scope: !96)
!190 = !DILocation(line: 54, column: 11, scope: !96)
!191 = !DILocation(line: 55, column: 7, scope: !192)
!192 = distinct !DILexicalBlock(scope: !193, file: !97, line: 55, column: 7)
!193 = distinct !DILexicalBlock(scope: !96, file: !97, line: 54, column: 17)
!194 = !DILocation(line: 55, column: 12, scope: !192)
!195 = !DILocation(line: 55, column: 7, scope: !193)
!196 = !DILocation(line: 56, column: 5, scope: !197)
!197 = distinct !DILexicalBlock(scope: !192, file: !97, line: 55, column: 21)
!198 = !DILocation(line: 57, column: 4, scope: !197)
!199 = distinct !{!199, !187, !200, !201}
!200 = !DILocation(line: 77, column: 2, scope: !96)
!201 = !{!"llvm.loop.mustprogress"}
!202 = !DILocation(line: 60, column: 14, scope: !203)
!203 = distinct !DILexicalBlock(scope: !193, file: !97, line: 60, column: 7)
!204 = !DILocation(line: 60, column: 17, scope: !203)
!205 = !DILocation(line: 60, column: 7, scope: !203)
!206 = !DILocation(line: 60, column: 41, scope: !203)
!207 = !DILocation(line: 60, column: 7, scope: !193)
!208 = !DILocation(line: 61, column: 5, scope: !209)
!209 = distinct !DILexicalBlock(scope: !203, file: !97, line: 60, column: 47)
!210 = !DILocation(line: 62, column: 4, scope: !209)
!211 = !DILocation(line: 65, column: 3, scope: !193)
!212 = !DILocation(line: 65, column: 16, scope: !193)
!213 = !DILocation(line: 66, column: 20, scope: !193)
!214 = !DILocation(line: 66, column: 10, scope: !193)
!215 = !DILocation(line: 66, column: 8, scope: !193)
!216 = !DILocation(line: 67, column: 7, scope: !217)
!217 = distinct !DILexicalBlock(scope: !193, file: !97, line: 67, column: 7)
!218 = !DILocation(line: 67, column: 12, scope: !217)
!219 = !DILocation(line: 67, column: 7, scope: !193)
!220 = !DILocation(line: 68, column: 4, scope: !221)
!221 = distinct !DILexicalBlock(scope: !217, file: !97, line: 67, column: 24)
!222 = !DILocation(line: 71, column: 7, scope: !223)
!223 = distinct !DILexicalBlock(scope: !193, file: !97, line: 71, column: 7)
!224 = !DILocation(line: 71, column: 11, scope: !223)
!225 = !DILocation(line: 71, column: 9, scope: !223)
!226 = !DILocation(line: 71, column: 19, scope: !223)
!227 = !DILocation(line: 71, column: 16, scope: !223)
!228 = !DILocation(line: 71, column: 7, scope: !193)
!229 = !DILocation(line: 72, column: 9, scope: !230)
!230 = distinct !DILexicalBlock(scope: !223, file: !97, line: 71, column: 23)
!231 = !DILocation(line: 72, column: 6, scope: !230)
!232 = !DILocation(line: 73, column: 12, scope: !230)
!233 = !DILocation(line: 73, column: 10, scope: !230)
!234 = !DILocation(line: 74, column: 3, scope: !230)
!235 = !DILocation(line: 75, column: 4, scope: !236)
!236 = distinct !DILexicalBlock(scope: !223, file: !97, line: 74, column: 10)
!237 = !DILocation(line: 78, column: 5, scope: !96)
!238 = !DILocation(line: 79, column: 2, scope: !96)
!239 = !DILocation(line: 80, column: 1, scope: !96)
!240 = distinct !DISubprogram(name: "memcmp", scope: !241, file: !241, line: 42, type: !242, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !54)
!241 = !DIFile(filename: "runtime/Freestanding/memcmp.c", directory: "/opt/tools/klee", checksumkind: CSK_MD5, checksum: "5350b831de232a5be5b37d49ccbaf0ef")
!242 = !DISubroutineType(types: !243)
!243 = !{!8, !244, !244, !246}
!244 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !245, size: 64)
!245 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!246 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !247, line: 46, baseType: !248)
!247 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!248 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!249 = !DILocalVariable(name: "s1", arg: 1, scope: !240, file: !241, line: 42, type: !244)
!250 = !DILocation(line: 0, scope: !240)
!251 = !DILocalVariable(name: "s2", arg: 2, scope: !240, file: !241, line: 42, type: !244)
!252 = !DILocalVariable(name: "n", arg: 3, scope: !240, file: !241, line: 42, type: !246)
!253 = !DILocation(line: 43, column: 9, scope: !254)
!254 = distinct !DILexicalBlock(scope: !240, file: !241, line: 43, column: 7)
!255 = !DILocation(line: 43, column: 7, scope: !240)
!256 = !DILocation(line: 0, scope: !257)
!257 = distinct !DILexicalBlock(scope: !254, file: !241, line: 43, column: 15)
!258 = !DILocalVariable(name: "p2", scope: !257, file: !241, line: 44, type: !26)
!259 = !DILocalVariable(name: "p1", scope: !257, file: !241, line: 44, type: !26)
!260 = !DILocation(line: 47, column: 11, scope: !261)
!261 = distinct !DILexicalBlock(scope: !262, file: !241, line: 47, column: 11)
!262 = distinct !DILexicalBlock(scope: !257, file: !241, line: 46, column: 8)
!263 = !DILocation(line: 47, column: 20, scope: !261)
!264 = !DILocation(line: 47, column: 17, scope: !261)
!265 = !DILocation(line: 47, column: 11, scope: !262)
!266 = !DILocation(line: 48, column: 17, scope: !267)
!267 = distinct !DILexicalBlock(scope: !261, file: !241, line: 47, column: 27)
!268 = !DILocation(line: 48, column: 25, scope: !267)
!269 = !DILocation(line: 48, column: 23, scope: !267)
!270 = !DILocation(line: 48, column: 9, scope: !267)
!271 = !DILocation(line: 47, column: 23, scope: !261)
!272 = !DILocation(line: 47, column: 14, scope: !261)
!273 = !DILocation(line: 50, column: 14, scope: !257)
!274 = !DILocation(line: 50, column: 18, scope: !257)
!275 = !DILocation(line: 50, column: 5, scope: !262)
!276 = distinct !{!276, !277, !278, !201}
!277 = !DILocation(line: 46, column: 5, scope: !257)
!278 = !DILocation(line: 50, column: 22, scope: !257)
!279 = !DILocation(line: 53, column: 1, scope: !240)
!280 = distinct !DISubprogram(name: "memcpy", scope: !281, file: !281, line: 12, type: !282, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !40, retainedNodes: !54)
!281 = !DIFile(filename: "runtime/Freestanding/memcpy.c", directory: "/opt/tools/klee", checksumkind: CSK_MD5, checksum: "8fb9a7164e167db005d7d002570068bc")
!282 = !DISubroutineType(types: !283)
!283 = !{!284, !284, !244, !246}
!284 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!285 = !DILocalVariable(name: "destaddr", arg: 1, scope: !280, file: !281, line: 12, type: !284)
!286 = !DILocation(line: 0, scope: !280)
!287 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !280, file: !281, line: 12, type: !244)
!288 = !DILocalVariable(name: "len", arg: 3, scope: !280, file: !281, line: 12, type: !246)
!289 = !DILocalVariable(name: "dest", scope: !280, file: !281, line: 13, type: !290)
!290 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !291, size: 64)
!291 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!292 = !DILocalVariable(name: "src", scope: !280, file: !281, line: 14, type: !293)
!293 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !294, size: 64)
!294 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !291)
!295 = !DILocation(line: 16, column: 16, scope: !280)
!296 = !DILocation(line: 16, column: 3, scope: !280)
!297 = !DILocation(line: 16, column: 13, scope: !280)
!298 = !DILocation(line: 17, column: 19, scope: !280)
!299 = !DILocation(line: 17, column: 15, scope: !280)
!300 = !DILocation(line: 17, column: 10, scope: !280)
!301 = !DILocation(line: 17, column: 13, scope: !280)
!302 = distinct !{!302, !296, !298, !201}
!303 = !DILocation(line: 18, column: 3, scope: !280)
