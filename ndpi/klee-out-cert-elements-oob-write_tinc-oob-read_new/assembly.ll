; ModuleID = 'linked_cert-elements-oob-write_tinc-oob-read_new.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ce_module = type { %struct.ce_packet }
%struct.ce_packet = type { i8*, i16 }
%struct.ce_flow = type { %struct.ce_module }
%struct.tinc_module = type { %struct.tinc_packet }
%struct.tinc_packet = type { i8*, i16, i32 }
%struct.tinc_flow = type { i8 }

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@main.existing_names = internal global [1 x i8] zeroinitializer, align 1, !dbg !0
@.str.1 = private unnamed_addr constant [58 x i8] c"0 && \22REACHED_BOTH_cert-elements-oob-write_tinc-oob-read\22\00", align 1
@.str.2 = private unnamed_addr constant [53 x i8] c"driver_cert-elements-oob-write_tinc-oob-read_final.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [15 x i8] c"int main(void)\00", align 1

; Function Attrs: nofree noinline norecurse nosync nounwind uwtable
define internal fastcc i32 @predicate_cert_elements_oob_write(%struct.ce_module* nocapture readonly %0, %struct.ce_flow* nocapture %1, i16 zeroext %2, i16 zeroext %3) unnamed_addr #0 !dbg !42 {
  call void @llvm.dbg.value(metadata %struct.ce_module* %0, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.value(metadata %struct.ce_flow* %1, metadata !72, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.value(metadata i16 %2, metadata !73, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.value(metadata i16 %3, metadata !74, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.value(metadata %struct.ce_module* %0, metadata !75, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.value(metadata i16 %2, metadata !77, metadata !DIExpression()), !dbg !71
  %5 = icmp ult i16 %2, %3, !dbg !78
  br i1 %5, label %.lr.ph17, label %.loopexit10, !dbg !81

.lr.ph17:                                         ; preds = %4
  %6 = getelementptr inbounds %struct.ce_module, %struct.ce_module* %0, i64 0, i32 0, i32 1
  %7 = getelementptr inbounds %struct.ce_module, %struct.ce_module* %0, i64 0, i32 0, i32 0
  %8 = getelementptr inbounds %struct.ce_flow, %struct.ce_flow* %1, i64 0, i32 0, i32 0, i32 0
  %9 = getelementptr inbounds %struct.ce_flow, %struct.ce_flow* %1, i64 0, i32 0, i32 0, i32 1
  %.pre = load i16, i16* %6, align 8, !dbg !82
  br label %10, !dbg !81

10:                                               ; preds = %.lr.ph17, %.loopexit
  %11 = phi i16 [ %.pre, %.lr.ph17 ], [ %101, %.loopexit ]
  %12 = phi i16 [ %.pre, %.lr.ph17 ], [ %102, %.loopexit ], !dbg !82
  %.0116 = phi i16 [ %2, %.lr.ph17 ], [ %103, %.loopexit ]
  call void @llvm.dbg.value(metadata i16 %.0116, metadata !77, metadata !DIExpression()), !dbg !71
  %13 = zext i16 %.0116 to i32, !dbg !85
  %14 = add nuw nsw i32 %13, 2, !dbg !86
  %15 = zext i16 %12 to i32, !dbg !87
  %.not = icmp ult i32 %14, %15, !dbg !88
  br i1 %.not, label %16, label %.loopexit10, !dbg !89

16:                                               ; preds = %10
  %17 = load i8*, i8** %7, align 8, !dbg !90
  %18 = zext i16 %.0116 to i64, !dbg !92
  %19 = getelementptr inbounds i8, i8* %17, i64 %18, !dbg !92
  %20 = load i8, i8* %19, align 1, !dbg !92
  %21 = icmp eq i8 %20, 85, !dbg !93
  br i1 %21, label %22, label %.loopexit, !dbg !94

22:                                               ; preds = %16
  %23 = add nuw nsw i64 %18, 1, !dbg !95
  %24 = getelementptr inbounds i8, i8* %17, i64 %23, !dbg !96
  %25 = load i8, i8* %24, align 1, !dbg !96
  %26 = icmp eq i8 %25, 29, !dbg !97
  br i1 %26, label %27, label %.loopexit, !dbg !98

27:                                               ; preds = %22
  %28 = add nuw nsw i64 %18, 2, !dbg !99
  %29 = getelementptr inbounds i8, i8* %17, i64 %28, !dbg !100
  %30 = load i8, i8* %29, align 1, !dbg !100
  %31 = icmp eq i8 %30, 17, !dbg !101
  br i1 %31, label %32, label %.loopexit, !dbg !102

32:                                               ; preds = %27
  %33 = add i16 %.0116, 3, !dbg !103
  call void @llvm.dbg.value(metadata i16 %33, metadata !77, metadata !DIExpression()), !dbg !71
  %.not2 = icmp ult i16 %33, %12, !dbg !105
  br i1 %.not2, label %34, label %.loopexit10, !dbg !107

34:                                               ; preds = %32
  %35 = zext i16 %33 to i64, !dbg !108
  %36 = getelementptr inbounds i8, i8* %17, i64 %35, !dbg !108
  %37 = load i8, i8* %36, align 1, !dbg !108
  %38 = icmp eq i8 %37, 4, !dbg !110
  %.1.v = select i1 %38, i16 4, i16 7, !dbg !111
  %.1 = add i16 %.1.v, %.0116, !dbg !111
  call void @llvm.dbg.value(metadata i16 %.1, metadata !77, metadata !DIExpression()), !dbg !71
  %.not3 = icmp ult i16 %.1, %12, !dbg !112
  br i1 %.not3, label %39, label %.loopexit10, !dbg !114

39:                                               ; preds = %34
  %40 = zext i16 %.1 to i64, !dbg !115
  %41 = getelementptr inbounds i8, i8* %17, i64 %40, !dbg !115
  %42 = load i8, i8* %41, align 1, !dbg !115
  %43 = and i8 %42, 127, !dbg !116
  %.not4.inv = icmp slt i8 %42, 0, !dbg !116
  %narrow = select i1 %.not4.inv, i8 %43, i8 0, !dbg !116
  %44 = zext i8 %narrow to i16, !dbg !116
  %45 = add i16 %.1, %44, !dbg !117
  call void @llvm.dbg.value(metadata i16 %45, metadata !77, metadata !DIExpression()), !dbg !71
  %.not5 = icmp ult i16 %45, %12, !dbg !118
  br i1 %.not5, label %46, label %.loopexit10, !dbg !120

46:                                               ; preds = %39
  %47 = add i16 %45, 2, !dbg !121
  call void @llvm.dbg.value(metadata i16 %47, metadata !77, metadata !DIExpression()), !dbg !71
  %.not6 = icmp ult i16 %47, %12, !dbg !122
  br i1 %.not6, label %48, label %.loopexit10, !dbg !124

48:                                               ; preds = %46
  %49 = zext i16 %47 to i64, !dbg !125
  %50 = getelementptr inbounds i8, i8* %17, i64 %49, !dbg !125
  %51 = load i8, i8* %50, align 1, !dbg !125
  %52 = and i8 %51, 127, !dbg !126
  %.not7.inv = icmp slt i8 %51, 0, !dbg !126
  %narrow44 = select i1 %.not7.inv, i8 %52, i8 0, !dbg !126
  %53 = zext i8 %narrow44 to i16, !dbg !126
  call void @llvm.dbg.value(metadata i16 undef, metadata !77, metadata !DIExpression()), !dbg !71
  %54 = add i16 %45, 3, !dbg !127
  %55 = add i16 %54, %53, !dbg !128
  call void @llvm.dbg.value(metadata i16 %55, metadata !77, metadata !DIExpression()), !dbg !71
  %56 = icmp ult i16 %55, %11, !dbg !129
  br i1 %56, label %.lr.ph, label %.loopexit, !dbg !130

.lr.ph:                                           ; preds = %48, %._crit_edge
  %57 = phi i8* [ %.pre25, %._crit_edge ], [ %17, %48 ], !dbg !131
  %58 = phi i16 [ %99, %._crit_edge ], [ %11, %48 ]
  %.213 = phi i16 [ %98, %._crit_edge ], [ %55, %48 ]
  call void @llvm.dbg.value(metadata i16 %.213, metadata !77, metadata !DIExpression()), !dbg !71
  %59 = zext i16 %.213 to i64, !dbg !133
  %60 = getelementptr inbounds i8, i8* %57, i64 %59, !dbg !133
  %61 = load i8, i8* %60, align 1, !dbg !133
  call void @llvm.dbg.value(metadata i8 %61, metadata !134, metadata !DIExpression()), !dbg !135
  switch i8 %61, label %.loopexit [
    i8 -127, label %62
    i8 -126, label %62
    i8 -121, label %62
  ], !dbg !136

62:                                               ; preds = %.lr.ph, %.lr.ph, %.lr.ph
  %63 = zext i16 %.213 to i32, !dbg !138
  %64 = add nuw nsw i32 %63, 1, !dbg !141
  %65 = zext i16 %58 to i32, !dbg !142
  %.not8 = icmp ult i32 %64, %65, !dbg !143
  br i1 %.not8, label %66, label %.loopexit10, !dbg !144

66:                                               ; preds = %62
  %67 = add nuw nsw i64 %59, 1, !dbg !145
  %68 = getelementptr inbounds i8, i8* %57, i64 %67, !dbg !146
  %69 = load i8, i8* %68, align 1, !dbg !146
  call void @llvm.dbg.value(metadata i8 %69, metadata !147, metadata !DIExpression()), !dbg !148
  %70 = add nsw i32 %65, -1, !dbg !149
  %71 = icmp sgt i32 %70, %63, !dbg !151
  br i1 %71, label %72, label %.loopexit10, !dbg !152

72:                                               ; preds = %66
  %73 = zext i8 %69 to i32, !dbg !153
  %74 = add nuw nsw i32 %63, 2, !dbg !154
  %75 = add nuw nsw i32 %74, %73, !dbg !155
  %76 = icmp ult i32 %75, %65, !dbg !156
  br i1 %76, label %77, label %.loopexit10, !dbg !157

77:                                               ; preds = %72
  %78 = add i16 %.213, 2, !dbg !158
  call void @llvm.dbg.value(metadata i16 %78, metadata !77, metadata !DIExpression()), !dbg !71
  %79 = icmp eq i8 %69, 0, !dbg !159
  br i1 %79, label %.loopexit10, label %80, !dbg !161

80:                                               ; preds = %77
  %81 = zext i16 %78 to i32, !dbg !162
  %82 = add nuw nsw i32 %73, %81, !dbg !164
  %83 = icmp ugt i32 %82, %65, !dbg !165
  br i1 %83, label %.loopexit10, label %84, !dbg !166

84:                                               ; preds = %80
  call void @llvm.dbg.value(metadata i8 %69, metadata !167, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !148
  %85 = load i8*, i8** %8, align 8, !dbg !168
  %.not9 = icmp eq i8* %85, null, !dbg !170
  br i1 %.not9, label %95, label %86, !dbg !171

86:                                               ; preds = %84
  %87 = load i16, i16* %9, align 8, !dbg !172
  %88 = zext i16 %87 to i32, !dbg !175
  %89 = add nuw nsw i32 %88, %73, !dbg !176
  %90 = icmp ugt i32 %89, 65534, !dbg !177
  br i1 %90, label %.loopexit10, label %91, !dbg !178

91:                                               ; preds = %86
  %92 = zext i8 %69 to i16, !dbg !179
  %93 = add nuw nsw i16 %92, 1, !dbg !180
  %94 = add i16 %93, %87, !dbg !181
  br label %97, !dbg !182

95:                                               ; preds = %84
  %96 = zext i8 %69 to i16, !dbg !183
  call void @llvm.dbg.value(metadata i16 %96, metadata !167, metadata !DIExpression()), !dbg !148
  store i8* inttoptr (i64 1 to i8*), i8** %8, align 8, !dbg !184
  br label %97

97:                                               ; preds = %95, %91
  %storemerge = phi i16 [ %94, %91 ], [ %96, %95 ], !dbg !186
  %.pre-phi = phi i16 [ %92, %91 ], [ %96, %95 ], !dbg !187
  store i16 %storemerge, i16* %9, align 8, !dbg !186
  %98 = add i16 %78, %.pre-phi, !dbg !188
  call void @llvm.dbg.value(metadata i16 %98, metadata !77, metadata !DIExpression()), !dbg !71
  %99 = load i16, i16* %6, align 8, !dbg !189
  %100 = icmp ult i16 %98, %99, !dbg !129
  br i1 %100, label %._crit_edge, label %.loopexit, !dbg !130, !llvm.loop !190

._crit_edge:                                      ; preds = %97
  %.pre25 = load i8*, i8** %7, align 8, !dbg !131
  br label %.lr.ph, !dbg !130

.loopexit:                                        ; preds = %97, %.lr.ph, %48, %16, %22, %27
  %101 = phi i16 [ %11, %27 ], [ %11, %22 ], [ %11, %16 ], [ %11, %48 ], [ %58, %.lr.ph ], [ %99, %97 ]
  %102 = phi i16 [ %12, %27 ], [ %12, %22 ], [ %12, %16 ], [ %11, %48 ], [ %58, %.lr.ph ], [ %99, %97 ]
  %.3 = phi i16 [ %.0116, %27 ], [ %.0116, %22 ], [ %.0116, %16 ], [ %55, %48 ], [ %.213, %.lr.ph ], [ %98, %97 ], !dbg !193
  call void @llvm.dbg.value(metadata i16 %.3, metadata !77, metadata !DIExpression()), !dbg !71
  %103 = add i16 %.3, 1, !dbg !194
  call void @llvm.dbg.value(metadata i16 %103, metadata !77, metadata !DIExpression()), !dbg !71
  %104 = icmp ult i16 %103, %3, !dbg !78
  br i1 %104, label %10, label %.loopexit10, !dbg !81, !llvm.loop !195

.loopexit10:                                      ; preds = %10, %32, %34, %39, %46, %.loopexit, %86, %80, %77, %66, %72, %62, %4
  %.0 = phi i32 [ 0, %4 ], [ 0, %62 ], [ 0, %72 ], [ 0, %66 ], [ 0, %77 ], [ 0, %80 ], [ 1, %86 ], [ 0, %.loopexit ], [ 0, %46 ], [ 0, %39 ], [ 0, %34 ], [ 0, %32 ], [ 0, %10 ], !dbg !71
  ret i32 %.0, !dbg !197
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree noinline norecurse nosync nounwind readonly uwtable
define internal fastcc i32 @predicate_tinc_oob_read(i8* nocapture readonly %.0.0.0.val, i16 %.0.0.1.val, i32 %.0.0.2.val, i8 %.0.0.val) unnamed_addr #2 !dbg !198 {
  call void @llvm.dbg.value(metadata %struct.tinc_module* undef, metadata !218, metadata !DIExpression()), !dbg !219
  call void @llvm.dbg.value(metadata %struct.tinc_flow* undef, metadata !220, metadata !DIExpression()), !dbg !219
  call void @llvm.dbg.value(metadata i8* %.0.0.0.val, metadata !221, metadata !DIExpression()), !dbg !219
  call void @llvm.dbg.value(metadata i16 %.0.0.1.val, metadata !222, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !219
  %.not = icmp eq i32 %.0.0.2.val, 0, !dbg !224
  %1 = icmp eq i16 %.0.0.1.val, 0
  %or.cond = select i1 %.not, i1 true, i1 %1, !dbg !226
  br i1 %or.cond, label %.critedge, label %2, !dbg !226

2:                                                ; preds = %0
  %.not5 = icmp eq i8 %.0.0.val, 2, !dbg !227
  br i1 %.not5, label %5, label %3, !dbg !229

3:                                                ; preds = %2
  %.not14 = icmp ne i8 %.0.0.val, 3, !dbg !230
  %4 = icmp ult i16 %.0.0.1.val, 12
  %or.cond15 = select i1 %.not14, i1 true, i1 %4, !dbg !231
  br i1 %or.cond15, label %.critedge, label %6, !dbg !231

5:                                                ; preds = %2
  %.old = icmp ult i16 %.0.0.1.val, 12, !dbg !232
  br i1 %.old, label %.critedge, label %6, !dbg !234

6:                                                ; preds = %3, %5
  %7 = load i8, i8* %.0.0.0.val, align 1, !dbg !235
  %.not6 = icmp eq i8 %7, 49, !dbg !237
  br i1 %.not6, label %8, label %.critedge, !dbg !238

8:                                                ; preds = %6
  %9 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 1, !dbg !239
  %10 = load i8, i8* %9, align 1, !dbg !239
  %.not7 = icmp eq i8 %10, 32, !dbg !241
  br i1 %.not7, label %11, label %.critedge, !dbg !242

11:                                               ; preds = %8
  %12 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 2, !dbg !243
  %13 = load i8, i8* %12, align 1, !dbg !243
  %14 = icmp ne i8 %13, 32, !dbg !245
  %.not1226 = icmp ugt i16 %.0.0.1.val, 3
  %or.cond49 = select i1 %14, i1 %.not1226, i1 false, !dbg !246
  call void @llvm.dbg.value(metadata i8 4, metadata !247, metadata !DIExpression()), !dbg !219
  call void @llvm.dbg.value(metadata i16 3, metadata !248, metadata !DIExpression()), !dbg !219
  call void @llvm.dbg.value(metadata i8 4, metadata !247, metadata !DIExpression()), !dbg !219
  call void @llvm.dbg.value(metadata i16 3, metadata !248, metadata !DIExpression()), !dbg !219
  call void @llvm.dbg.value(metadata i16 3, metadata !248, metadata !DIExpression()), !dbg !219
  br i1 %or.cond49, label %.lr.ph, label %.critedge, !dbg !246

.lr.ph:                                           ; preds = %11, %19
  %.127 = phi i16 [ %20, %19 ], [ 3, %11 ]
  call void @llvm.dbg.value(metadata i16 %.127, metadata !248, metadata !DIExpression()), !dbg !219
  %15 = zext i16 %.127 to i64, !dbg !249
  %16 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 %15, !dbg !249
  %17 = load i8, i8* %16, align 1, !dbg !249
  %.off = add i8 %17, -48, !dbg !253
  %18 = icmp ult i8 %.off, 10, !dbg !253
  br i1 %18, label %19, label %21, !dbg !253

19:                                               ; preds = %.lr.ph
  %20 = add nuw i16 %.127, 1, !dbg !254
  call void @llvm.dbg.value(metadata i16 %20, metadata !248, metadata !DIExpression()), !dbg !219
  %exitcond31.not = icmp eq i16 %20, %.0.0.1.val, !dbg !255
  br i1 %exitcond31.not, label %.critedge, label %.lr.ph, !dbg !257, !llvm.loop !258

21:                                               ; preds = %.lr.ph
  %.not13 = icmp ult i16 %.127, %.0.0.1.val, !dbg !261
  br i1 %.not13, label %22, label %.critedge, !dbg !263

22:                                               ; preds = %21
  %23 = add i16 %.127, 1, !dbg !264
  call void @llvm.dbg.value(metadata i16 %23, metadata !248, metadata !DIExpression()), !dbg !219
  %24 = icmp eq i8 %17, 32, !dbg !266
  call void @llvm.dbg.value(metadata i8 3, metadata !247, metadata !DIExpression()), !dbg !219
  %.not1226.1 = icmp ult i16 %23, %.0.0.1.val
  %or.cond50 = select i1 %24, i1 %.not1226.1, i1 false, !dbg !267
  call void @llvm.dbg.value(metadata i8 3, metadata !247, metadata !DIExpression()), !dbg !219
  call void @llvm.dbg.value(metadata i16 %23, metadata !248, metadata !DIExpression()), !dbg !219
  call void @llvm.dbg.value(metadata i8 3, metadata !247, metadata !DIExpression()), !dbg !219
  call void @llvm.dbg.value(metadata i16 %23, metadata !248, metadata !DIExpression()), !dbg !219
  call void @llvm.dbg.value(metadata i16 %23, metadata !248, metadata !DIExpression()), !dbg !219
  br i1 %or.cond50, label %.lr.ph.1, label %.critedge, !dbg !267

.preheader:                                       ; preds = %.thread
  %25 = zext i16 %57 to i64, !dbg !268
  %wide.trip.count = zext i16 %.0.0.1.val to i64, !dbg !269
  br label %26, !dbg !268

26:                                               ; preds = %.preheader, %.critedge1
  %indvars.iv = phi i64 [ %25, %.preheader ], [ %indvars.iv.next, %.critedge1 ], !dbg !219
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !248, metadata !DIExpression()), !dbg !219
  %27 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 %indvars.iv, !dbg !272
  %28 = load i8, i8* %27, align 1, !dbg !272
  %.off64 = add i8 %28, -48, !dbg !273
  %29 = icmp ult i8 %.off64, 10, !dbg !273
  %.off65 = add i8 %28, -65
  %30 = icmp ult i8 %.off65, 26
  %or.cond17 = or i1 %29, %30, !dbg !273
  br i1 %or.cond17, label %.critedge1, label %.critedge, !dbg !273

.critedge1:                                       ; preds = %26
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !274
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !248, metadata !DIExpression()), !dbg !219
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count, !dbg !269
  br i1 %exitcond.not, label %.critedge, label %26, !dbg !275, !llvm.loop !276

.critedge:                                        ; preds = %26, %19, %39, %49, %59, %.critedge1, %22, %21, %35, %36, %45, %46, %55, %56, %.thread, %11, %8, %6, %5, %3, %0
  %.0 = phi i32 [ 0, %0 ], [ 0, %3 ], [ 0, %5 ], [ 0, %6 ], [ 0, %8 ], [ 0, %11 ], [ 1, %.thread ], [ 0, %56 ], [ 0, %55 ], [ 0, %46 ], [ 0, %45 ], [ 0, %36 ], [ 0, %35 ], [ 0, %21 ], [ 0, %22 ], [ 1, %.critedge1 ], [ 0, %59 ], [ 0, %49 ], [ 0, %39 ], [ 0, %19 ], [ 0, %26 ], !dbg !219
  ret i32 %.0, !dbg !278

.lr.ph.1:                                         ; preds = %22, %39
  %.127.1 = phi i16 [ %40, %39 ], [ %23, %22 ]
  call void @llvm.dbg.value(metadata i16 %.127.1, metadata !248, metadata !DIExpression()), !dbg !219
  %31 = zext i16 %.127.1 to i64, !dbg !249
  %32 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 %31, !dbg !249
  %33 = load i8, i8* %32, align 1, !dbg !249
  %.off61 = add i8 %33, -48, !dbg !253
  %34 = icmp ult i8 %.off61, 10, !dbg !253
  br i1 %34, label %39, label %35, !dbg !253

35:                                               ; preds = %.lr.ph.1
  %.not13.1 = icmp ult i16 %.127.1, %.0.0.1.val, !dbg !261
  br i1 %.not13.1, label %36, label %.critedge, !dbg !263

36:                                               ; preds = %35
  %37 = add i16 %.127.1, 1, !dbg !264
  call void @llvm.dbg.value(metadata i16 %37, metadata !248, metadata !DIExpression()), !dbg !219
  %38 = icmp eq i8 %33, 32, !dbg !266
  call void @llvm.dbg.value(metadata i8 2, metadata !247, metadata !DIExpression()), !dbg !219
  %.not1226.2 = icmp ult i16 %37, %.0.0.1.val
  %or.cond43 = select i1 %38, i1 %.not1226.2, i1 false, !dbg !267
  br i1 %or.cond43, label %.lr.ph.2, label %.critedge, !dbg !267

39:                                               ; preds = %.lr.ph.1
  %40 = add nuw i16 %.127.1, 1, !dbg !254
  call void @llvm.dbg.value(metadata i16 %40, metadata !248, metadata !DIExpression()), !dbg !219
  %exitcond31.1.not = icmp eq i16 %40, %.0.0.1.val, !dbg !255
  br i1 %exitcond31.1.not, label %.critedge, label %.lr.ph.1, !dbg !257, !llvm.loop !258

.lr.ph.2:                                         ; preds = %36, %49
  %.127.2 = phi i16 [ %50, %49 ], [ %37, %36 ]
  call void @llvm.dbg.value(metadata i16 %.127.2, metadata !248, metadata !DIExpression()), !dbg !219
  %41 = zext i16 %.127.2 to i64, !dbg !249
  %42 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 %41, !dbg !249
  %43 = load i8, i8* %42, align 1, !dbg !249
  %.off62 = add i8 %43, -48, !dbg !253
  %44 = icmp ult i8 %.off62, 10, !dbg !253
  br i1 %44, label %49, label %45, !dbg !253

45:                                               ; preds = %.lr.ph.2
  %.not13.2 = icmp ult i16 %.127.2, %.0.0.1.val, !dbg !261
  br i1 %.not13.2, label %46, label %.critedge, !dbg !263

46:                                               ; preds = %45
  %47 = add i16 %.127.2, 1, !dbg !264
  call void @llvm.dbg.value(metadata i16 %47, metadata !248, metadata !DIExpression()), !dbg !219
  %48 = icmp eq i8 %43, 32, !dbg !266
  call void @llvm.dbg.value(metadata i8 1, metadata !247, metadata !DIExpression()), !dbg !219
  %.not1226.3 = icmp ult i16 %47, %.0.0.1.val
  %or.cond46 = select i1 %48, i1 %.not1226.3, i1 false, !dbg !267
  br i1 %or.cond46, label %.lr.ph.3, label %.critedge, !dbg !267

49:                                               ; preds = %.lr.ph.2
  %50 = add nuw i16 %.127.2, 1, !dbg !254
  call void @llvm.dbg.value(metadata i16 %50, metadata !248, metadata !DIExpression()), !dbg !219
  %exitcond31.2.not = icmp eq i16 %50, %.0.0.1.val, !dbg !255
  br i1 %exitcond31.2.not, label %.critedge, label %.lr.ph.2, !dbg !257, !llvm.loop !258

.lr.ph.3:                                         ; preds = %46, %59
  %.127.3 = phi i16 [ %60, %59 ], [ %47, %46 ]
  call void @llvm.dbg.value(metadata i16 %.127.3, metadata !248, metadata !DIExpression()), !dbg !219
  %51 = zext i16 %.127.3 to i64, !dbg !249
  %52 = getelementptr inbounds i8, i8* %.0.0.0.val, i64 %51, !dbg !249
  %53 = load i8, i8* %52, align 1, !dbg !249
  %.off63 = add i8 %53, -48, !dbg !253
  %54 = icmp ult i8 %.off63, 10, !dbg !253
  br i1 %54, label %59, label %55, !dbg !253

55:                                               ; preds = %.lr.ph.3
  %.not13.3 = icmp ult i16 %.127.3, %.0.0.1.val, !dbg !261
  br i1 %.not13.3, label %56, label %.critedge, !dbg !263

56:                                               ; preds = %55
  %57 = add i16 %.127.3, 1, !dbg !264
  call void @llvm.dbg.value(metadata i16 %57, metadata !248, metadata !DIExpression()), !dbg !219
  %58 = icmp eq i8 %53, 32, !dbg !266
  call void @llvm.dbg.value(metadata i8 0, metadata !247, metadata !DIExpression()), !dbg !219
  br i1 %58, label %.thread, label %.critedge, !dbg !267

.thread:                                          ; preds = %56
  call void @llvm.dbg.value(metadata i8 0, metadata !247, metadata !DIExpression()), !dbg !219
  call void @llvm.dbg.value(metadata i16 %57, metadata !248, metadata !DIExpression()), !dbg !219
  %.not10 = icmp ult i16 %57, %.0.0.1.val, !dbg !279
  br i1 %.not10, label %.preheader, label %.critedge, !dbg !281

59:                                               ; preds = %.lr.ph.3
  %60 = add nuw i16 %.127.3, 1, !dbg !254
  call void @llvm.dbg.value(metadata i16 %60, metadata !248, metadata !DIExpression()), !dbg !219
  %exitcond31.3.not = icmp eq i16 %60, %.0.0.1.val, !dbg !255
  br i1 %exitcond31.3.not, label %.critedge, label %.lr.ph.3, !dbg !257, !llvm.loop !258
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() local_unnamed_addr #3 !dbg !2 {
  %1 = alloca i32, align 4
  %2 = alloca [12 x i8], align 1
  %3 = alloca %struct.ce_module, align 8
  %4 = alloca %struct.ce_flow, align 8
  %5 = alloca i16, align 2
  %6 = alloca i16, align 2
  %7 = alloca %struct.tinc_module, align 8
  %8 = alloca %struct.tinc_flow, align 1
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [12 x i8]* %2, metadata !282, metadata !DIExpression()), !dbg !286
  %11 = getelementptr inbounds [12 x i8], [12 x i8]* %2, i64 0, i64 0, !dbg !287
  call void @klee_make_symbolic(i8* %11, i64 12, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !288
  call void @llvm.dbg.declare(metadata %struct.ce_module* %3, metadata !289, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.declare(metadata %struct.ce_flow* %4, metadata !300, metadata !DIExpression()), !dbg !311
  %12 = bitcast %struct.ce_module* %3 to i8*, !dbg !312
  %13 = call i8* @memset(i8* %12, i32 0, i64 16), !dbg !312
  %14 = bitcast %struct.ce_flow* %4 to i8*, !dbg !313
  %15 = call i8* @memset(i8* %14, i32 0, i64 16), !dbg !313
  %16 = getelementptr inbounds [12 x i8], [12 x i8]* %2, i64 0, i64 0, !dbg !314
  %17 = getelementptr inbounds %struct.ce_module, %struct.ce_module* %3, i32 0, i32 0, !dbg !315
  %18 = getelementptr inbounds %struct.ce_packet, %struct.ce_packet* %17, i32 0, i32 0, !dbg !316
  store i8* %16, i8** %18, align 8, !dbg !317
  %19 = getelementptr inbounds %struct.ce_module, %struct.ce_module* %3, i32 0, i32 0, !dbg !318
  %20 = getelementptr inbounds %struct.ce_packet, %struct.ce_packet* %19, i32 0, i32 1, !dbg !319
  store i16 12, i16* %20, align 8, !dbg !320
  %21 = getelementptr inbounds %struct.ce_flow, %struct.ce_flow* %4, i32 0, i32 0, !dbg !321
  %22 = bitcast %struct.ce_module* %21 to %struct.ce_packet*, !dbg !322
  %23 = getelementptr inbounds %struct.ce_packet, %struct.ce_packet* %22, i32 0, i32 0, !dbg !323
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @main.existing_names, i64 0, i64 0), i8** %23, align 8, !dbg !324
  %24 = getelementptr inbounds %struct.ce_flow, %struct.ce_flow* %4, i32 0, i32 0, !dbg !325
  %25 = bitcast %struct.ce_module* %24 to %struct.ce_packet*, !dbg !326
  %26 = getelementptr inbounds %struct.ce_packet, %struct.ce_packet* %25, i32 0, i32 1, !dbg !327
  store i16 -1, i16* %26, align 8, !dbg !328
  call void @llvm.dbg.declare(metadata i16* %5, metadata !329, metadata !DIExpression()), !dbg !330
  store i16 0, i16* %5, align 2, !dbg !330
  call void @llvm.dbg.declare(metadata i16* %6, metadata !331, metadata !DIExpression()), !dbg !332
  store i16 12, i16* %6, align 2, !dbg !332
  call void @llvm.dbg.declare(metadata %struct.tinc_module* %7, metadata !333, metadata !DIExpression()), !dbg !342
  call void @llvm.dbg.declare(metadata %struct.tinc_flow* %8, metadata !343, metadata !DIExpression()), !dbg !347
  %27 = bitcast %struct.tinc_module* %7 to i8*, !dbg !348
  %28 = call i8* @memset(i8* %27, i32 0, i64 16), !dbg !348
  %29 = bitcast %struct.tinc_flow* %8 to i8*, !dbg !349
  %30 = call i8* @memset(i8* %29, i32 0, i64 1), !dbg !349
  %31 = getelementptr inbounds [12 x i8], [12 x i8]* %2, i64 0, i64 0, !dbg !350
  %32 = getelementptr inbounds %struct.tinc_module, %struct.tinc_module* %7, i32 0, i32 0, !dbg !351
  %33 = getelementptr inbounds %struct.tinc_packet, %struct.tinc_packet* %32, i32 0, i32 0, !dbg !352
  store i8* %31, i8** %33, align 8, !dbg !353
  %34 = getelementptr inbounds %struct.tinc_module, %struct.tinc_module* %7, i32 0, i32 0, !dbg !354
  %35 = getelementptr inbounds %struct.tinc_packet, %struct.tinc_packet* %34, i32 0, i32 1, !dbg !355
  store i16 12, i16* %35, align 8, !dbg !356
  %36 = getelementptr inbounds %struct.tinc_module, %struct.tinc_module* %7, i32 0, i32 0, !dbg !357
  %37 = getelementptr inbounds %struct.tinc_packet, %struct.tinc_packet* %36, i32 0, i32 2, !dbg !358
  store i32 1, i32* %37, align 4, !dbg !359
  %38 = getelementptr inbounds %struct.tinc_flow, %struct.tinc_flow* %8, i32 0, i32 0, !dbg !360
  store i8 2, i8* %38, align 1, !dbg !361
  call void @llvm.dbg.declare(metadata i32* %9, metadata !362, metadata !DIExpression()), !dbg !363
  %39 = load i16, i16* %5, align 2, !dbg !364
  %40 = load i16, i16* %6, align 2, !dbg !365
  %41 = call fastcc i32 @predicate_cert_elements_oob_write(%struct.ce_module* %3, %struct.ce_flow* %4, i16 zeroext %39, i16 zeroext %40), !dbg !366
  store i32 %41, i32* %9, align 4, !dbg !363
  call void @llvm.dbg.declare(metadata i32* %10, metadata !367, metadata !DIExpression()), !dbg !368
  %.idx = getelementptr %struct.tinc_module, %struct.tinc_module* %7, i64 0, i32 0, i32 0, !dbg !369
  %.idx.val = load i8*, i8** %.idx, align 8, !dbg !369
  %.idx1 = getelementptr %struct.tinc_module, %struct.tinc_module* %7, i64 0, i32 0, i32 1, !dbg !369
  %.idx1.val = load i16, i16* %.idx1, align 8, !dbg !369
  %.idx2 = getelementptr %struct.tinc_module, %struct.tinc_module* %7, i64 0, i32 0, i32 2, !dbg !369
  %.idx2.val = load i32, i32* %.idx2, align 4, !dbg !369
  %.idx3 = getelementptr %struct.tinc_flow, %struct.tinc_flow* %8, i64 0, i32 0, !dbg !369
  %.idx3.val = load i8, i8* %.idx3, align 1, !dbg !369
  %42 = call fastcc i32 @predicate_tinc_oob_read(i8* %.idx.val, i16 %.idx1.val, i32 %.idx2.val, i8 %.idx3.val), !dbg !369
  store i32 %42, i32* %10, align 4, !dbg !368
  %43 = load i32, i32* %9, align 4, !dbg !370
  %44 = icmp eq i32 %43, 1, !dbg !371
  br i1 %44, label %45, label %48, !dbg !372

45:                                               ; preds = %0
  %46 = load i32, i32* %10, align 4, !dbg !373
  %47 = icmp eq i32 %46, 1, !dbg !374
  br label %48

48:                                               ; preds = %45, %0
  %49 = phi i1 [ false, %0 ], [ %47, %45 ], !dbg !375
  %50 = zext i1 %49 to i32, !dbg !372
  %51 = sext i32 %50 to i64, !dbg !370
  call void @klee_assume(i64 %51), !dbg !376
  %52 = call i32 (i8*, i8*, i32, i8*, ...) bitcast (i32 (...)* @__assert_fail to i32 (i8*, i8*, i32, i8*, ...)*)(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.2, i64 0, i64 0), i32 77, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)), !dbg !377
  ret i32 0, !dbg !378
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) local_unnamed_addr #4

declare dso_local void @klee_assume(i64) local_unnamed_addr #4

; Function Attrs: noreturn
declare dso_local i32 @__assert_fail(...) local_unnamed_addr #5

; Function Attrs: nofree noinline norecurse nosync nounwind uwtable writeonly
define dso_local i8* @memset(i8* returned %0, i32 %1, i64 %2) local_unnamed_addr #6 !dbg !379 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !385, metadata !DIExpression()), !dbg !386
  call void @llvm.dbg.value(metadata i32 %1, metadata !387, metadata !DIExpression()), !dbg !386
  call void @llvm.dbg.value(metadata i64 %2, metadata !388, metadata !DIExpression()), !dbg !386
  call void @llvm.dbg.value(metadata i8* %0, metadata !389, metadata !DIExpression()), !dbg !386
  call void @llvm.dbg.value(metadata i64 %2, metadata !388, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !386
  %.not2 = icmp eq i64 %2, 0, !dbg !390
  br i1 %.not2, label %._crit_edge, label %.lr.ph, !dbg !391

.lr.ph:                                           ; preds = %3
  %4 = trunc i32 %1 to i8
  br label %5, !dbg !391

5:                                                ; preds = %.lr.ph, %5
  %.04 = phi i8* [ %0, %.lr.ph ], [ %7, %5 ]
  %.013 = phi i64 [ %2, %.lr.ph ], [ %6, %5 ]
  call void @llvm.dbg.value(metadata i8* %.04, metadata !389, metadata !DIExpression()), !dbg !386
  call void @llvm.dbg.value(metadata i64 %.013, metadata !388, metadata !DIExpression()), !dbg !386
  %6 = add i64 %.013, -1, !dbg !392
  call void @llvm.dbg.value(metadata i64 %6, metadata !388, metadata !DIExpression()), !dbg !386
  %7 = getelementptr inbounds i8, i8* %.04, i64 1, !dbg !393
  call void @llvm.dbg.value(metadata i8* %7, metadata !389, metadata !DIExpression()), !dbg !386
  store i8 %4, i8* %.04, align 1, !dbg !394
  call void @llvm.dbg.value(metadata i64 %6, metadata !388, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !386
  %.not = icmp eq i64 %6, 0, !dbg !390
  br i1 %.not, label %._crit_edge, label %5, !dbg !391, !llvm.loop !395

._crit_edge:                                      ; preds = %5, %3
  ret i8* %0, !dbg !397
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nofree noinline norecurse nosync nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nofree noinline norecurse nosync nounwind readonly uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree noinline norecurse nosync nounwind uwtable writeonly "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!14, !32, !7, !34}
!llvm.ident = !{!36, !36, !36, !36}
!llvm.module.flags = !{!37, !38, !39, !40, !41}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "existing_names", scope: !2, file: !3, line: 52, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 39, type: !4, scopeLine: 39, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!3 = !DIFile(filename: "driver_cert-elements-oob-write_tinc-oob-read_final.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!4 = !DISubroutineType(types: !5)
!5 = !{!6}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, globals: !9, splitDebugInlining: false, nameTableKind: None)
!8 = !{}
!9 = !{!0}
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 8, elements: !12)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !{!13}
!13 = !DISubrange(count: 1)
!14 = distinct !DICompileUnit(language: DW_LANG_C99, file: !15, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, retainedTypes: !16, splitDebugInlining: false, nameTableKind: None)
!15 = !DIFile(filename: "predicate_cert-elements-oob-write.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!16 = !{!17, !23, !24, !28, !29}
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int32_t", file: !15, line: 28, baseType: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !19, line: 26, baseType: !20)
!19 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !21, line: 42, baseType: !22)
!21 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!22 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int16_t", file: !15, line: 27, baseType: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !19, line: 25, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !21, line: 40, baseType: !27)
!27 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !30, line: 79, baseType: !31)
!30 = !DIFile(filename: "/usr/include/stdint.h", directory: "")
!31 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!32 = distinct !DICompileUnit(language: DW_LANG_C99, file: !33, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, splitDebugInlining: false, nameTableKind: None)
!33 = !DIFile(filename: "predicate_tinc-oob-read.c", directory: "/home/wcontrerasmartinez/paper_bugs")
!34 = distinct !DICompileUnit(language: DW_LANG_C99, file: !35, producer: "Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, splitDebugInlining: false, nameTableKind: None)
!35 = !DIFile(filename: "/home/wcontrerasmartinez/klee/runtime/Freestanding/memset.c", directory: "/home/wcontrerasmartinez/klee/build/runtime/Freestanding")
!36 = !{!"Ubuntu clang version 13.0.1-++20220217091255+75e33f71c2da-1~exp1~20220217091338.8"}
!37 = !{i32 7, !"Dwarf Version", i32 4}
!38 = !{i32 2, !"Debug Info Version", i32 3}
!39 = !{i32 1, !"wchar_size", i32 4}
!40 = !{i32 7, !"uwtable", i32 1}
!41 = !{i32 7, !"frame-pointer", i32 2}
!42 = distinct !DISubprogram(name: "predicate_cert_elements_oob_write", scope: !15, file: !15, line: 49, type: !43, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !14, retainedNodes: !8)
!43 = !DISubroutineType(types: !44)
!44 = !{!6, !45, !59, !24, !24}
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_module", file: !15, line: 45, size: 128, elements: !47)
!47 = !{!48}
!48 = !DIDerivedType(tag: DW_TAG_member, name: "packet", scope: !46, file: !15, line: 46, baseType: !49, size: 128)
!49 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_packet", file: !15, line: 40, size: 128, elements: !50)
!50 = !{!51, !58}
!51 = !DIDerivedType(tag: DW_TAG_member, name: "payload", scope: !49, file: !15, line: 41, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !54)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int8_t", file: !15, line: 26, baseType: !55)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !19, line: 24, baseType: !56)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !21, line: 38, baseType: !57)
!57 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "payload_packet_len", scope: !49, file: !15, line: 42, baseType: !24, size: 16, offset: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_flow", file: !15, line: 36, size: 128, elements: !61)
!61 = !{!62}
!62 = !DIDerivedType(tag: DW_TAG_member, name: "protos", scope: !60, file: !15, line: 37, baseType: !63, size: 128)
!63 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !60, file: !15, line: 37, size: 128, elements: !64)
!64 = !{!65}
!65 = !DIDerivedType(tag: DW_TAG_member, name: "tls_quic", scope: !63, file: !15, line: 37, baseType: !66, size: 128)
!66 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_tls_quic", file: !15, line: 31, size: 128, elements: !67)
!67 = !{!68, !69}
!68 = !DIDerivedType(tag: DW_TAG_member, name: "server_names", scope: !66, file: !15, line: 32, baseType: !28, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "server_names_len", scope: !66, file: !15, line: 33, baseType: !24, size: 16, offset: 64)
!70 = !DILocalVariable(name: "ndpi_struct", arg: 1, scope: !42, file: !15, line: 50, type: !45)
!71 = !DILocation(line: 0, scope: !42)
!72 = !DILocalVariable(name: "flow", arg: 2, scope: !42, file: !15, line: 51, type: !59)
!73 = !DILocalVariable(name: "p_offset", arg: 3, scope: !42, file: !15, line: 52, type: !24)
!74 = !DILocalVariable(name: "certificate_len", arg: 4, scope: !42, file: !15, line: 53, type: !24)
!75 = !DILocalVariable(name: "packet", scope: !42, file: !15, line: 55, type: !76)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!77 = !DILocalVariable(name: "i", scope: !42, file: !15, line: 56, type: !24)
!78 = !DILocation(line: 58, column: 24, scope: !79)
!79 = distinct !DILexicalBlock(scope: !80, file: !15, line: 58, column: 3)
!80 = distinct !DILexicalBlock(scope: !42, file: !15, line: 58, column: 3)
!81 = !DILocation(line: 58, column: 3, scope: !80)
!82 = !DILocation(line: 60, column: 37, scope: !83)
!83 = distinct !DILexicalBlock(scope: !84, file: !15, line: 60, column: 9)
!84 = distinct !DILexicalBlock(scope: !79, file: !15, line: 58, column: 48)
!85 = !DILocation(line: 60, column: 9, scope: !83)
!86 = !DILocation(line: 60, column: 22, scope: !83)
!87 = !DILocation(line: 60, column: 29, scope: !83)
!88 = !DILocation(line: 60, column: 26, scope: !83)
!89 = !DILocation(line: 60, column: 9, scope: !84)
!90 = !DILocation(line: 62, column: 18, scope: !91)
!91 = distinct !DILexicalBlock(scope: !84, file: !15, line: 62, column: 9)
!92 = !DILocation(line: 62, column: 10, scope: !91)
!93 = !DILocation(line: 62, column: 31, scope: !91)
!94 = !DILocation(line: 62, column: 40, scope: !91)
!95 = !DILocation(line: 63, column: 27, scope: !91)
!96 = !DILocation(line: 63, column: 10, scope: !91)
!97 = !DILocation(line: 63, column: 31, scope: !91)
!98 = !DILocation(line: 63, column: 40, scope: !91)
!99 = !DILocation(line: 64, column: 27, scope: !91)
!100 = !DILocation(line: 64, column: 10, scope: !91)
!101 = !DILocation(line: 64, column: 31, scope: !91)
!102 = !DILocation(line: 62, column: 9, scope: !84)
!103 = !DILocation(line: 67, column: 9, scope: !104)
!104 = distinct !DILexicalBlock(scope: !91, file: !15, line: 64, column: 41)
!105 = !DILocation(line: 68, column: 13, scope: !106)
!106 = distinct !DILexicalBlock(scope: !104, file: !15, line: 68, column: 11)
!107 = !DILocation(line: 68, column: 11, scope: !104)
!108 = !DILocation(line: 71, column: 11, scope: !109)
!109 = distinct !DILexicalBlock(scope: !104, file: !15, line: 71, column: 11)
!110 = !DILocation(line: 71, column: 30, scope: !109)
!111 = !DILocation(line: 71, column: 11, scope: !104)
!112 = !DILocation(line: 73, column: 13, scope: !113)
!113 = distinct !DILexicalBlock(scope: !104, file: !15, line: 73, column: 11)
!114 = !DILocation(line: 73, column: 11, scope: !104)
!115 = !DILocation(line: 76, column: 13, scope: !104)
!116 = !DILocation(line: 76, column: 12, scope: !104)
!117 = !DILocation(line: 76, column: 9, scope: !104)
!118 = !DILocation(line: 77, column: 13, scope: !119)
!119 = distinct !DILexicalBlock(scope: !104, file: !15, line: 77, column: 11)
!120 = !DILocation(line: 77, column: 11, scope: !104)
!121 = !DILocation(line: 79, column: 9, scope: !104)
!122 = !DILocation(line: 80, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !104, file: !15, line: 80, column: 11)
!124 = !DILocation(line: 80, column: 11, scope: !104)
!125 = !DILocation(line: 83, column: 13, scope: !104)
!126 = !DILocation(line: 83, column: 12, scope: !104)
!127 = !DILocation(line: 83, column: 9, scope: !104)
!128 = !DILocation(line: 84, column: 8, scope: !104)
!129 = !DILocation(line: 86, column: 16, scope: !104)
!130 = !DILocation(line: 86, column: 7, scope: !104)
!131 = !DILocation(line: 87, column: 36, scope: !132)
!132 = distinct !DILexicalBlock(scope: !104, file: !15, line: 86, column: 46)
!133 = !DILocation(line: 87, column: 28, scope: !132)
!134 = !DILocalVariable(name: "gn_type", scope: !132, file: !15, line: 87, type: !54)
!135 = !DILocation(line: 0, scope: !132)
!136 = !DILocation(line: 89, column: 29, scope: !137)
!137 = distinct !DILexicalBlock(scope: !132, file: !15, line: 89, column: 13)
!138 = !DILocation(line: 91, column: 15, scope: !139)
!139 = distinct !DILexicalBlock(scope: !140, file: !15, line: 91, column: 15)
!140 = distinct !DILexicalBlock(scope: !137, file: !15, line: 89, column: 68)
!141 = !DILocation(line: 91, column: 17, scope: !139)
!142 = !DILocation(line: 91, column: 24, scope: !139)
!143 = !DILocation(line: 91, column: 21, scope: !139)
!144 = !DILocation(line: 91, column: 15, scope: !140)
!145 = !DILocation(line: 93, column: 50, scope: !140)
!146 = !DILocation(line: 93, column: 32, scope: !140)
!147 = !DILocalVariable(name: "len", scope: !140, file: !15, line: 93, type: !54)
!148 = !DILocation(line: 0, scope: !140)
!149 = !DILocation(line: 97, column: 50, scope: !150)
!150 = distinct !DILexicalBlock(scope: !140, file: !15, line: 97, column: 15)
!151 = !DILocation(line: 97, column: 20, scope: !150)
!152 = !DILocation(line: 97, column: 56, scope: !150)
!153 = !DILocation(line: 98, column: 34, scope: !150)
!154 = !DILocation(line: 98, column: 32, scope: !150)
!155 = !DILocation(line: 98, column: 38, scope: !150)
!156 = !DILocation(line: 98, column: 43, scope: !150)
!157 = !DILocation(line: 97, column: 15, scope: !140)
!158 = !DILocation(line: 101, column: 13, scope: !140)
!159 = !DILocation(line: 102, column: 19, scope: !160)
!160 = distinct !DILexicalBlock(scope: !140, file: !15, line: 102, column: 15)
!161 = !DILocation(line: 102, column: 15, scope: !140)
!162 = !DILocation(line: 105, column: 15, scope: !163)
!163 = distinct !DILexicalBlock(scope: !140, file: !15, line: 105, column: 15)
!164 = !DILocation(line: 105, column: 28, scope: !163)
!165 = !DILocation(line: 105, column: 34, scope: !163)
!166 = !DILocation(line: 105, column: 15, scope: !140)
!167 = !DILocalVariable(name: "dNSName_len", scope: !140, file: !15, line: 94, type: !24)
!168 = !DILocation(line: 110, column: 37, scope: !169)
!169 = distinct !DILexicalBlock(scope: !140, file: !15, line: 110, column: 15)
!170 = !DILocation(line: 110, column: 50, scope: !169)
!171 = !DILocation(line: 110, column: 15, scope: !140)
!172 = !DILocation(line: 112, column: 50, scope: !173)
!173 = distinct !DILexicalBlock(scope: !174, file: !15, line: 112, column: 17)
!174 = distinct !DILexicalBlock(scope: !169, file: !15, line: 110, column: 59)
!175 = !DILocation(line: 112, column: 17, scope: !173)
!176 = !DILocation(line: 112, column: 67, scope: !173)
!177 = !DILocation(line: 113, column: 45, scope: !173)
!178 = !DILocation(line: 112, column: 17, scope: !174)
!179 = !DILocation(line: 117, column: 68, scope: !174)
!180 = !DILocation(line: 117, column: 66, scope: !174)
!181 = !DILocation(line: 117, column: 80, scope: !174)
!182 = !DILocation(line: 118, column: 11, scope: !174)
!183 = !DILocation(line: 108, column: 25, scope: !140)
!184 = !DILocation(line: 119, column: 52, scope: !185)
!185 = distinct !DILexicalBlock(scope: !169, file: !15, line: 118, column: 18)
!186 = !DILocation(line: 0, scope: !169)
!187 = !DILocation(line: 123, column: 16, scope: !140)
!188 = !DILocation(line: 123, column: 13, scope: !140)
!189 = !DILocation(line: 86, column: 26, scope: !104)
!190 = distinct !{!190, !130, !191, !192}
!191 = !DILocation(line: 127, column: 7, scope: !104)
!192 = !{!"llvm.loop.mustprogress"}
!193 = !DILocation(line: 0, scope: !80)
!194 = !DILocation(line: 58, column: 44, scope: !79)
!195 = distinct !{!195, !81, !196, !192}
!196 = !DILocation(line: 129, column: 3, scope: !80)
!197 = !DILocation(line: 131, column: 1, scope: !42)
!198 = distinct !DISubprogram(name: "predicate_tinc_oob_read", scope: !33, file: !33, line: 41, type: !199, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !8)
!199 = !DISubroutineType(types: !200)
!200 = !{!6, !201, !214}
!201 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !202, size: 64)
!202 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tinc_module", file: !33, line: 37, size: 128, elements: !203)
!203 = !{!204}
!204 = !DIDerivedType(tag: DW_TAG_member, name: "packet", scope: !202, file: !33, line: 38, baseType: !205, size: 128)
!205 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tinc_packet", file: !33, line: 27, size: 128, elements: !206)
!206 = !{!207, !211, !213}
!207 = !DIDerivedType(tag: DW_TAG_member, name: "payload", scope: !205, file: !33, line: 28, baseType: !208, size: 64)
!208 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !209, size: 64)
!209 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !210)
!210 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int8_t", file: !33, line: 23, baseType: !55)
!211 = !DIDerivedType(tag: DW_TAG_member, name: "payload_packet_len", scope: !205, file: !33, line: 29, baseType: !212, size: 16, offset: 64)
!212 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int16_t", file: !33, line: 24, baseType: !25)
!213 = !DIDerivedType(tag: DW_TAG_member, name: "tcp_non_null", scope: !205, file: !33, line: 30, baseType: !6, size: 32, offset: 96)
!214 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !215, size: 64)
!215 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tinc_flow", file: !33, line: 33, size: 8, elements: !216)
!216 = !{!217}
!217 = !DIDerivedType(tag: DW_TAG_member, name: "tinc_state", scope: !215, file: !33, line: 34, baseType: !210, size: 8)
!218 = !DILocalVariable(name: "ndpi_struct", arg: 1, scope: !198, file: !33, line: 41, type: !201)
!219 = !DILocation(line: 0, scope: !198)
!220 = !DILocalVariable(name: "flow", arg: 2, scope: !198, file: !33, line: 42, type: !214)
!221 = !DILocalVariable(name: "packet_payload", scope: !198, file: !33, line: 44, type: !208)
!222 = !DILocalVariable(name: "payload_len", scope: !198, file: !33, line: 45, type: !223)
!223 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int32_t", file: !33, line: 25, baseType: !18)
!224 = !DILocation(line: 48, column: 8, scope: !225)
!225 = distinct !DILexicalBlock(scope: !198, file: !33, line: 48, column: 7)
!226 = !DILocation(line: 48, column: 7, scope: !198)
!227 = !DILocation(line: 51, column: 24, scope: !228)
!228 = distinct !DILexicalBlock(scope: !198, file: !33, line: 51, column: 7)
!229 = !DILocation(line: 51, column: 29, scope: !228)
!230 = !DILocation(line: 51, column: 49, scope: !228)
!231 = !DILocation(line: 51, column: 7, scope: !198)
!232 = !DILocation(line: 54, column: 19, scope: !233)
!233 = distinct !DILexicalBlock(scope: !198, file: !33, line: 54, column: 7)
!234 = !DILocation(line: 54, column: 7, scope: !198)
!235 = !DILocation(line: 55, column: 7, scope: !236)
!236 = distinct !DILexicalBlock(scope: !198, file: !33, line: 55, column: 7)
!237 = !DILocation(line: 55, column: 25, scope: !236)
!238 = !DILocation(line: 55, column: 7, scope: !198)
!239 = !DILocation(line: 56, column: 7, scope: !240)
!240 = distinct !DILexicalBlock(scope: !198, file: !33, line: 56, column: 7)
!241 = !DILocation(line: 56, column: 25, scope: !240)
!242 = !DILocation(line: 56, column: 7, scope: !198)
!243 = !DILocation(line: 57, column: 7, scope: !244)
!244 = distinct !DILexicalBlock(scope: !198, file: !33, line: 57, column: 7)
!245 = !DILocation(line: 57, column: 25, scope: !244)
!246 = !DILocation(line: 57, column: 7, scope: !198)
!247 = !DILocalVariable(name: "numbers_left", scope: !198, file: !33, line: 60, type: !210)
!248 = !DILocalVariable(name: "i", scope: !198, file: !33, line: 59, type: !212)
!249 = !DILocation(line: 66, column: 13, scope: !250)
!250 = distinct !DILexicalBlock(scope: !251, file: !33, line: 66, column: 11)
!251 = distinct !DILexicalBlock(scope: !252, file: !33, line: 64, column: 15)
!252 = distinct !DILexicalBlock(scope: !198, file: !33, line: 62, column: 24)
!253 = !DILocation(line: 66, column: 38, scope: !250)
!254 = !DILocation(line: 67, column: 8, scope: !251)
!255 = !DILocation(line: 65, column: 13, scope: !256)
!256 = distinct !DILexicalBlock(scope: !251, file: !33, line: 65, column: 11)
!257 = !DILocation(line: 65, column: 11, scope: !251)
!258 = distinct !{!258, !259, !260}
!259 = !DILocation(line: 64, column: 5, scope: !252)
!260 = !DILocation(line: 68, column: 5, scope: !252)
!261 = !DILocation(line: 70, column: 11, scope: !262)
!262 = distinct !DILexicalBlock(scope: !252, file: !33, line: 70, column: 9)
!263 = !DILocation(line: 70, column: 9, scope: !252)
!264 = !DILocation(line: 71, column: 25, scope: !265)
!265 = distinct !DILexicalBlock(scope: !252, file: !33, line: 71, column: 9)
!266 = !DILocation(line: 71, column: 29, scope: !265)
!267 = !DILocation(line: 71, column: 9, scope: !252)
!268 = !DILocation(line: 87, column: 3, scope: !198)
!269 = !DILocation(line: 93, column: 11, scope: !270)
!270 = distinct !DILexicalBlock(scope: !271, file: !33, line: 93, column: 9)
!271 = distinct !DILexicalBlock(scope: !198, file: !33, line: 89, column: 68)
!272 = !DILocation(line: 88, column: 12, scope: !198)
!273 = !DILocation(line: 88, column: 37, scope: !198)
!274 = !DILocation(line: 90, column: 6, scope: !271)
!275 = !DILocation(line: 93, column: 9, scope: !271)
!276 = distinct !{!276, !268, !277, !192}
!277 = !DILocation(line: 94, column: 3, scope: !198)
!278 = !DILocation(line: 97, column: 1, scope: !198)
!279 = !DILocation(line: 84, column: 9, scope: !280)
!280 = distinct !DILexicalBlock(scope: !198, file: !33, line: 84, column: 7)
!281 = !DILocation(line: 84, column: 7, scope: !198)
!282 = !DILocalVariable(name: "buf", scope: !2, file: !3, line: 40, type: !283)
!283 = !DICompositeType(tag: DW_TAG_array_type, baseType: !55, size: 96, elements: !284)
!284 = !{!285}
!285 = !DISubrange(count: 12)
!286 = !DILocation(line: 40, column: 11, scope: !2)
!287 = !DILocation(line: 41, column: 22, scope: !2)
!288 = !DILocation(line: 41, column: 3, scope: !2)
!289 = !DILocalVariable(name: "ce_mod", scope: !2, file: !3, line: 44, type: !290)
!290 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_module", file: !3, line: 27, size: 128, elements: !291)
!291 = !{!292}
!292 = !DIDerivedType(tag: DW_TAG_member, name: "packet", scope: !290, file: !3, line: 27, baseType: !293, size: 128)
!293 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_packet", file: !3, line: 26, size: 128, elements: !294)
!294 = !{!295, !298}
!295 = !DIDerivedType(tag: DW_TAG_member, name: "payload", scope: !293, file: !3, line: 26, baseType: !296, size: 64)
!296 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !297, size: 64)
!297 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !55)
!298 = !DIDerivedType(tag: DW_TAG_member, name: "payload_packet_len", scope: !293, file: !3, line: 26, baseType: !25, size: 16, offset: 64)
!299 = !DILocation(line: 44, column: 20, scope: !2)
!300 = !DILocalVariable(name: "ce_flow", scope: !2, file: !3, line: 45, type: !301)
!301 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_flow", file: !3, line: 25, size: 128, elements: !302)
!302 = !{!303}
!303 = !DIDerivedType(tag: DW_TAG_member, name: "protos", scope: !301, file: !3, line: 25, baseType: !304, size: 128)
!304 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !301, file: !3, line: 25, size: 128, elements: !305)
!305 = !{!306}
!306 = !DIDerivedType(tag: DW_TAG_member, name: "tls_quic", scope: !304, file: !3, line: 25, baseType: !307, size: 128)
!307 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ce_tls_quic", file: !3, line: 24, size: 128, elements: !308)
!308 = !{!309, !310}
!309 = !DIDerivedType(tag: DW_TAG_member, name: "server_names", scope: !307, file: !3, line: 24, baseType: !28, size: 64)
!310 = !DIDerivedType(tag: DW_TAG_member, name: "server_names_len", scope: !307, file: !3, line: 24, baseType: !25, size: 16, offset: 64)
!311 = !DILocation(line: 45, column: 20, scope: !2)
!312 = !DILocation(line: 46, column: 3, scope: !2)
!313 = !DILocation(line: 47, column: 3, scope: !2)
!314 = !DILocation(line: 49, column: 38, scope: !2)
!315 = !DILocation(line: 49, column: 10, scope: !2)
!316 = !DILocation(line: 49, column: 17, scope: !2)
!317 = !DILocation(line: 49, column: 36, scope: !2)
!318 = !DILocation(line: 50, column: 10, scope: !2)
!319 = !DILocation(line: 50, column: 17, scope: !2)
!320 = !DILocation(line: 50, column: 36, scope: !2)
!321 = !DILocation(line: 53, column: 11, scope: !2)
!322 = !DILocation(line: 53, column: 18, scope: !2)
!323 = !DILocation(line: 53, column: 27, scope: !2)
!324 = !DILocation(line: 53, column: 40, scope: !2)
!325 = !DILocation(line: 54, column: 11, scope: !2)
!326 = !DILocation(line: 54, column: 18, scope: !2)
!327 = !DILocation(line: 54, column: 27, scope: !2)
!328 = !DILocation(line: 54, column: 44, scope: !2)
!329 = !DILocalVariable(name: "p_offset", scope: !2, file: !3, line: 57, type: !25)
!330 = !DILocation(line: 57, column: 12, scope: !2)
!331 = !DILocalVariable(name: "cert_len", scope: !2, file: !3, line: 58, type: !25)
!332 = !DILocation(line: 58, column: 12, scope: !2)
!333 = !DILocalVariable(name: "tinc_mod", scope: !2, file: !3, line: 61, type: !334)
!334 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tinc_module", file: !3, line: 35, size: 128, elements: !335)
!335 = !{!336}
!336 = !DIDerivedType(tag: DW_TAG_member, name: "packet", scope: !334, file: !3, line: 35, baseType: !337, size: 128)
!337 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tinc_packet", file: !3, line: 32, size: 128, elements: !338)
!338 = !{!339, !340, !341}
!339 = !DIDerivedType(tag: DW_TAG_member, name: "payload", scope: !337, file: !3, line: 32, baseType: !296, size: 64)
!340 = !DIDerivedType(tag: DW_TAG_member, name: "payload_packet_len", scope: !337, file: !3, line: 32, baseType: !25, size: 16, offset: 64)
!341 = !DIDerivedType(tag: DW_TAG_member, name: "tcp_non_null", scope: !337, file: !3, line: 33, baseType: !6, size: 32, offset: 96)
!342 = !DILocation(line: 61, column: 22, scope: !2)
!343 = !DILocalVariable(name: "tinc_flow", scope: !2, file: !3, line: 62, type: !344)
!344 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tinc_flow", file: !3, line: 34, size: 8, elements: !345)
!345 = !{!346}
!346 = !DIDerivedType(tag: DW_TAG_member, name: "tinc_state", scope: !344, file: !3, line: 34, baseType: !55, size: 8)
!347 = !DILocation(line: 62, column: 22, scope: !2)
!348 = !DILocation(line: 63, column: 3, scope: !2)
!349 = !DILocation(line: 64, column: 3, scope: !2)
!350 = !DILocation(line: 66, column: 40, scope: !2)
!351 = !DILocation(line: 66, column: 12, scope: !2)
!352 = !DILocation(line: 66, column: 19, scope: !2)
!353 = !DILocation(line: 66, column: 38, scope: !2)
!354 = !DILocation(line: 67, column: 12, scope: !2)
!355 = !DILocation(line: 67, column: 19, scope: !2)
!356 = !DILocation(line: 67, column: 38, scope: !2)
!357 = !DILocation(line: 68, column: 12, scope: !2)
!358 = !DILocation(line: 68, column: 19, scope: !2)
!359 = !DILocation(line: 68, column: 38, scope: !2)
!360 = !DILocation(line: 69, column: 13, scope: !2)
!361 = !DILocation(line: 69, column: 38, scope: !2)
!362 = !DILocalVariable(name: "r_ce", scope: !2, file: !3, line: 72, type: !6)
!363 = !DILocation(line: 72, column: 7, scope: !2)
!364 = !DILocation(line: 73, column: 51, scope: !2)
!365 = !DILocation(line: 73, column: 61, scope: !2)
!366 = !DILocation(line: 72, column: 16, scope: !2)
!367 = !DILocalVariable(name: "r_tinc", scope: !2, file: !3, line: 74, type: !6)
!368 = !DILocation(line: 74, column: 7, scope: !2)
!369 = !DILocation(line: 74, column: 16, scope: !2)
!370 = !DILocation(line: 76, column: 15, scope: !2)
!371 = !DILocation(line: 76, column: 20, scope: !2)
!372 = !DILocation(line: 76, column: 25, scope: !2)
!373 = !DILocation(line: 76, column: 28, scope: !2)
!374 = !DILocation(line: 76, column: 35, scope: !2)
!375 = !DILocation(line: 0, scope: !2)
!376 = !DILocation(line: 76, column: 3, scope: !2)
!377 = !DILocation(line: 77, column: 3, scope: !2)
!378 = !DILocation(line: 78, column: 3, scope: !2)
!379 = distinct !DISubprogram(name: "memset", scope: !380, file: !380, line: 12, type: !381, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !34, retainedNodes: !8)
!380 = !DIFile(filename: "runtime/Freestanding/memset.c", directory: "/home/wcontrerasmartinez/klee")
!381 = !DISubroutineType(types: !382)
!382 = !{!23, !23, !6, !383}
!383 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !384, line: 46, baseType: !31)
!384 = !DIFile(filename: "/usr/lib/llvm-13/lib/clang/13.0.1/include/stddef.h", directory: "")
!385 = !DILocalVariable(name: "dst", arg: 1, scope: !379, file: !380, line: 12, type: !23)
!386 = !DILocation(line: 0, scope: !379)
!387 = !DILocalVariable(name: "s", arg: 2, scope: !379, file: !380, line: 12, type: !6)
!388 = !DILocalVariable(name: "count", arg: 3, scope: !379, file: !380, line: 12, type: !383)
!389 = !DILocalVariable(name: "a", scope: !379, file: !380, line: 13, type: !28)
!390 = !DILocation(line: 14, column: 18, scope: !379)
!391 = !DILocation(line: 14, column: 3, scope: !379)
!392 = !DILocation(line: 14, column: 15, scope: !379)
!393 = !DILocation(line: 15, column: 7, scope: !379)
!394 = !DILocation(line: 15, column: 10, scope: !379)
!395 = distinct !{!395, !391, !396, !192}
!396 = !DILocation(line: 15, column: 12, scope: !379)
!397 = !DILocation(line: 16, column: 3, scope: !379)
