; ModuleID = '/app/se_runs/sailor_engine/tcpdump-4.9.2/055_print-bgp.c_1248_local_cpp_cwe-120-overflow/harness/slice.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.netdissect_options = type { i32, i8* }
%struct.bgp = type { i16, i8, [16 x i8] }

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@.str.3 = private unnamed_addr constant [28 x i8] c"SPINE_PROBE:bgp_print:ENTRY\00", align 1
@__const.bgp_print.marker = private unnamed_addr constant [16 x i8] c"\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF", align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !34 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.netdissect_options*, align 8
  %3 = alloca i8*, align 8
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %2, metadata !38, metadata !DIExpression()), !dbg !39
  %4 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 16) #6, !dbg !40
  %5 = bitcast i8* %4 to %struct.netdissect_options*, !dbg !41
  store %struct.netdissect_options* %5, %struct.netdissect_options** %2, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i8** %3, metadata !42, metadata !DIExpression()), !dbg !43
  %6 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 512) #6, !dbg !44
  store i8* %6, i8** %3, align 8, !dbg !43
  %7 = load i8*, i8** %3, align 8, !dbg !45
  call void @klee_make_symbolic(i8* noundef %7, i64 noundef 512, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !46
  %8 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !47
  %9 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %8, i32 0, i32 0, !dbg !48
  store i32 1, i32* %9, align 8, !dbg !49
  %10 = load i8*, i8** %3, align 8, !dbg !50
  %11 = getelementptr inbounds i8, i8* %10, i64 512, !dbg !51
  %12 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !52
  %13 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %12, i32 0, i32 1, !dbg !53
  store i8* %11, i8** %13, align 8, !dbg !54
  %14 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !55
  %15 = load i8*, i8** %3, align 8, !dbg !56
  call fastcc void @bgp_print(%struct.netdissect_options* noundef %14, i8* noundef %15), !dbg !57
  ret i32 0, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

declare void @klee_make_symbolic(i8* noundef, i64 noundef, i8* noundef) local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @bgp_print(%struct.netdissect_options* noundef %0, i8* noundef %1) unnamed_addr #0 !dbg !59 {
  %3 = alloca %struct.netdissect_options*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca [16 x i8], align 16
  %10 = alloca %struct.bgp, align 2
  %11 = alloca i16, align 2
  store %struct.netdissect_options* %0, %struct.netdissect_options** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %3, metadata !72, metadata !DIExpression()), !dbg !73
  store i8* %1, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !74, metadata !DIExpression()), !dbg !75
  store i32 512, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !76, metadata !DIExpression()), !dbg !77
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([28 x i8], [28 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  call void @llvm.dbg.declare(metadata i8** %6, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i8** %7, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i8** %8, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [16 x i8]* %9, metadata !85, metadata !DIExpression()), !dbg !89
  %12 = bitcast [16 x i8]* %9 to i8*, !dbg !89
  %13 = call i8* @memcpy(i8* %12, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @__const.bgp_print.marker, i32 0, i32 0), i64 16), !dbg !89
  call void @llvm.dbg.declare(metadata %struct.bgp* %10, metadata !90, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i16* %11, metadata !105, metadata !DIExpression()), !dbg !106
  %14 = load i8*, i8** %4, align 8, !dbg !107
  %15 = load i32, i32* %5, align 4, !dbg !108
  %16 = sext i32 %15 to i64, !dbg !109
  %17 = getelementptr inbounds i8, i8* %14, i64 %16, !dbg !109
  store i8* %17, i8** %7, align 8, !dbg !110
  %18 = load %struct.netdissect_options*, %struct.netdissect_options** %3, align 8, !dbg !111
  %19 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %18, i32 0, i32 1, !dbg !113
  %20 = load i8*, i8** %19, align 8, !dbg !113
  %21 = load i8*, i8** %4, align 8, !dbg !114
  %22 = load i32, i32* %5, align 4, !dbg !115
  %23 = sext i32 %22 to i64, !dbg !116
  %24 = getelementptr inbounds i8, i8* %21, i64 %23, !dbg !116
  %25 = icmp ult i8* %20, %24, !dbg !117
  br i1 %25, label %26, label %30, !dbg !118

26:                                               ; preds = %2
  %27 = load %struct.netdissect_options*, %struct.netdissect_options** %3, align 8, !dbg !119
  %28 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %27, i32 0, i32 1, !dbg !120
  %29 = load i8*, i8** %28, align 8, !dbg !120
  store i8* %29, i8** %7, align 8, !dbg !121
  br label %30, !dbg !122

30:                                               ; preds = %26, %2
  %31 = load i8*, i8** %4, align 8, !dbg !123
  store i8* %31, i8** %6, align 8, !dbg !124
  %32 = load i8*, i8** %6, align 8, !dbg !125
  store i8* %32, i8** %8, align 8, !dbg !126
  br label %33, !dbg !127

33:                                               ; preds = %.backedge, %30
  %34 = load i8*, i8** %6, align 8, !dbg !128
  %35 = load i8*, i8** %7, align 8, !dbg !129
  %36 = icmp ult i8* %34, %35, !dbg !130
  br i1 %36, label %37, label %.loopexit, !dbg !127

37:                                               ; preds = %33
  %38 = load i8*, i8** %6, align 8, !dbg !131
  %39 = getelementptr inbounds i8, i8* %38, i64 0, !dbg !131
  %40 = load i8, i8* %39, align 1, !dbg !131
  %41 = zext i8 %40 to i32, !dbg !131
  %42 = icmp ne i32 %41, 255, !dbg !134
  br i1 %42, label %43, label %46, !dbg !135

43:                                               ; preds = %37
  %44 = load i8*, i8** %6, align 8, !dbg !136
  %45 = getelementptr inbounds i8, i8* %44, i32 1, !dbg !136
  store i8* %45, i8** %6, align 8, !dbg !136
  br label %.backedge, !dbg !138

.backedge:                                        ; preds = %43, %51, %80
  br label %33, !dbg !128, !llvm.loop !139

46:                                               ; preds = %37
  %47 = load i8*, i8** %6, align 8, !dbg !142
  %48 = getelementptr inbounds [16 x i8], [16 x i8]* %9, i64 0, i64 0, !dbg !144
  %49 = call i32 @memcmp(i8* noundef %47, i8* noundef %48, i64 noundef 16) #7, !dbg !145
  %50 = icmp ne i32 %49, 0, !dbg !146
  br i1 %50, label %51, label %54, !dbg !147

51:                                               ; preds = %46
  %52 = load i8*, i8** %6, align 8, !dbg !148
  %53 = getelementptr inbounds i8, i8* %52, i32 1, !dbg !148
  store i8* %53, i8** %6, align 8, !dbg !148
  br label %.backedge, !dbg !150

54:                                               ; preds = %46
  %55 = bitcast %struct.bgp* %10 to i8*, !dbg !151
  %56 = load i8*, i8** %6, align 8, !dbg !152
  %57 = call i8* @memcpy(i8* %55, i8* %56, i64 19), !dbg !151
  %58 = getelementptr inbounds %struct.bgp, %struct.bgp* %10, i32 0, i32 0, !dbg !153
  %59 = load i16, i16* %58, align 2, !dbg !153
  %60 = zext i16 %59 to i32, !dbg !154
  %61 = ashr i32 %60, 8, !dbg !155
  %62 = getelementptr inbounds %struct.bgp, %struct.bgp* %10, i32 0, i32 0, !dbg !156
  %63 = load i16, i16* %62, align 2, !dbg !156
  %64 = zext i16 %63 to i32, !dbg !157
  %65 = shl i32 %64, 8, !dbg !158
  %66 = or i32 %61, %65, !dbg !159
  %67 = trunc i32 %66 to i16, !dbg !160
  store i16 %67, i16* %11, align 2, !dbg !161
  %68 = load i16, i16* %11, align 2, !dbg !162
  %69 = zext i16 %68 to i32, !dbg !162
  %70 = icmp slt i32 %69, 19, !dbg !164
  br i1 %70, label %71, label %72, !dbg !165

71:                                               ; preds = %54
  br label %87, !dbg !166

72:                                               ; preds = %54
  %73 = load %struct.netdissect_options*, %struct.netdissect_options** %3, align 8, !dbg !167
  %74 = load i8*, i8** %6, align 8, !dbg !169
  %75 = load i16, i16* %11, align 2, !dbg !170
  %76 = zext i16 %75 to i32, !dbg !170
  %77 = call i32 @bgp_header_print(%struct.netdissect_options* noundef %73, i8* noundef %74, i32 noundef %76), !dbg !171
  %78 = icmp ne i32 %77, 0, !dbg !171
  br i1 %78, label %80, label %79, !dbg !172

79:                                               ; preds = %72
  br label %87, !dbg !173

80:                                               ; preds = %72
  %81 = load i16, i16* %11, align 2, !dbg !174
  %82 = zext i16 %81 to i32, !dbg !174
  %83 = load i8*, i8** %6, align 8, !dbg !175
  %84 = zext i32 %82 to i64
  %85 = getelementptr inbounds i8, i8* %83, i64 %84, !dbg !175
  store i8* %85, i8** %6, align 8, !dbg !175
  %86 = load i8*, i8** %6, align 8, !dbg !176
  store i8* %86, i8** %8, align 8, !dbg !177
  br label %.backedge, !dbg !127

.loopexit:                                        ; preds = %33
  br label %87, !dbg !178

87:                                               ; preds = %.loopexit, %79, %71
  ret void, !dbg !178
}

declare void @klee_warning_once(i8* noundef) local_unnamed_addr #3

declare i32 @bgp_header_print(%struct.netdissect_options* noundef, i8* noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readonly uwtable willreturn
define dso_local i32 @memcmp(i8* nocapture noundef nonnull readonly %0, i8* nocapture noundef nonnull readonly %1, i64 noundef %2) local_unnamed_addr #4 !dbg !179 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !188, metadata !DIExpression()), !dbg !189
  call void @llvm.dbg.value(metadata i8* %1, metadata !190, metadata !DIExpression()), !dbg !189
  call void @llvm.dbg.value(metadata i64 %2, metadata !191, metadata !DIExpression()), !dbg !189
  %.not = icmp eq i64 %2, 0, !dbg !192
  br i1 %.not, label %.loopexit, label %.preheader, !dbg !194

.preheader:                                       ; preds = %3, %10
  %.03 = phi i64 [ %13, %10 ], [ %2, %3 ]
  %.02 = phi i8* [ %12, %10 ], [ %0, %3 ], !dbg !195
  %.01 = phi i8* [ %11, %10 ], [ %1, %3 ], !dbg !195
  call void @llvm.dbg.value(metadata i8* %.01, metadata !197, metadata !DIExpression()), !dbg !195
  call void @llvm.dbg.value(metadata i8* %.02, metadata !200, metadata !DIExpression()), !dbg !195
  call void @llvm.dbg.value(metadata i64 %.03, metadata !191, metadata !DIExpression()), !dbg !189
  call void @llvm.dbg.value(metadata i8* %.02, metadata !200, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !195
  %4 = load i8, i8* %.02, align 1, !dbg !201
  call void @llvm.dbg.value(metadata i8* %.01, metadata !197, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !195
  %5 = load i8, i8* %.01, align 1, !dbg !204
  %.not4 = icmp eq i8 %4, %5, !dbg !205
  br i1 %.not4, label %10, label %6, !dbg !206

6:                                                ; preds = %.preheader
  call void @llvm.dbg.value(metadata i8* %.02, metadata !200, metadata !DIExpression()), !dbg !195
  %7 = zext i8 %4 to i32, !dbg !207
  call void @llvm.dbg.value(metadata i8* %.01, metadata !197, metadata !DIExpression()), !dbg !195
  %8 = zext i8 %5 to i32, !dbg !209
  %9 = sub nsw i32 %7, %8, !dbg !210
  br label %.loopexit, !dbg !211

10:                                               ; preds = %.preheader
  %11 = getelementptr inbounds i8, i8* %.01, i64 1, !dbg !212
  call void @llvm.dbg.value(metadata i8* %11, metadata !197, metadata !DIExpression()), !dbg !195
  %12 = getelementptr inbounds i8, i8* %.02, i64 1, !dbg !213
  call void @llvm.dbg.value(metadata i8* %12, metadata !200, metadata !DIExpression()), !dbg !195
  %13 = add i64 %.03, -1, !dbg !214
  call void @llvm.dbg.value(metadata i64 %13, metadata !191, metadata !DIExpression()), !dbg !189
  %.not5 = icmp eq i64 %13, 0, !dbg !215
  br i1 %.not5, label %.loopexit, label %.preheader, !dbg !216, !llvm.loop !217

.loopexit:                                        ; preds = %10, %3, %6
  %.0 = phi i32 [ %9, %6 ], [ 0, %3 ], [ 0, %10 ], !dbg !189
  ret i32 %.0, !dbg !220
}

; Function Attrs: nofree noinline norecurse nosync nounwind uwtable
define dso_local i8* @memcpy(i8* noundef returned writeonly %0, i8* nocapture noundef readonly %1, i64 noundef %2) local_unnamed_addr #5 !dbg !221 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !226, metadata !DIExpression()), !dbg !227
  call void @llvm.dbg.value(metadata i8* %1, metadata !228, metadata !DIExpression()), !dbg !227
  call void @llvm.dbg.value(metadata i64 %2, metadata !229, metadata !DIExpression()), !dbg !227
  call void @llvm.dbg.value(metadata i8* %0, metadata !230, metadata !DIExpression()), !dbg !227
  call void @llvm.dbg.value(metadata i8* %1, metadata !233, metadata !DIExpression()), !dbg !227
  call void @llvm.dbg.value(metadata i64 %2, metadata !229, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !227
  %.not3 = icmp eq i64 %2, 0, !dbg !236
  br i1 %.not3, label %._crit_edge, label %.lr.ph, !dbg !237

.lr.ph:                                           ; preds = %3, %.lr.ph
  %.06 = phi i8* [ %5, %.lr.ph ], [ %1, %3 ]
  %.015 = phi i8* [ %7, %.lr.ph ], [ %0, %3 ]
  %.024 = phi i64 [ %4, %.lr.ph ], [ %2, %3 ]
  call void @llvm.dbg.value(metadata i8* %.06, metadata !233, metadata !DIExpression()), !dbg !227
  call void @llvm.dbg.value(metadata i8* %.015, metadata !230, metadata !DIExpression()), !dbg !227
  call void @llvm.dbg.value(metadata i64 %.024, metadata !229, metadata !DIExpression()), !dbg !227
  %4 = add i64 %.024, -1, !dbg !238
  call void @llvm.dbg.value(metadata i64 %4, metadata !229, metadata !DIExpression()), !dbg !227
  %5 = getelementptr inbounds i8, i8* %.06, i64 1, !dbg !239
  call void @llvm.dbg.value(metadata i8* %5, metadata !233, metadata !DIExpression()), !dbg !227
  %6 = load i8, i8* %.06, align 1, !dbg !240
  %7 = getelementptr inbounds i8, i8* %.015, i64 1, !dbg !241
  call void @llvm.dbg.value(metadata i8* %7, metadata !230, metadata !DIExpression()), !dbg !227
  store i8 %6, i8* %.015, align 1, !dbg !242
  call void @llvm.dbg.value(metadata i64 %4, metadata !229, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !227
  %.not = icmp eq i64 %4, 0, !dbg !236
  br i1 %.not, label %._crit_edge, label %.lr.ph, !dbg !237, !llvm.loop !243

._crit_edge:                                      ; preds = %.lr.ph, %3
  ret i8* %0, !dbg !244
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree noinline norecurse nosync nounwind readonly uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree noinline norecurse nosync nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0, !16, !18, !20, !22, !24}
!llvm.ident = !{!26, !26, !26, !26, !26, !26}
!llvm.module.flags = !{!27, !28, !29, !30, !31, !32, !33}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/055_print-bgp.c_1248_local_cpp_cwe-120-overflow/harness/driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/055_print-bgp.c_1248_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "ab2775562fd5025020be9f3cc2a375ae")
!2 = !{!3, !15}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "netdissect_options", file: !5, line: 11, baseType: !6)
!5 = !DIFile(filename: "driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/055_print-bgp.c_1248_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "ab2775562fd5025020be9f3cc2a375ae")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !5, line: 8, size: 128, elements: !7)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_vflag", scope: !6, file: !5, line: 9, baseType: !9, size: 32)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_snapend", scope: !6, file: !5, line: 10, baseType: !11, size: 64, offset: 64)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !5, line: 6, baseType: !14)
!14 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!16 = distinct !DICompileUnit(language: DW_LANG_C99, file: !17, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!17 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/055_print-bgp.c_1248_local_cpp_cwe-120-overflow/harness/print-bgp.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/055_print-bgp.c_1248_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "26d636e88c22fd0400db7050309291a7")
!18 = distinct !DICompileUnit(language: DW_LANG_C99, file: !19, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!19 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/055_print-bgp.c_1248_local_cpp_cwe-120-overflow/harness/smart_stubs.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/055_print-bgp.c_1248_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "bcda1acd1a733c696e028616d9d6f3b5")
!20 = distinct !DICompileUnit(language: DW_LANG_C99, file: !21, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!21 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/055_print-bgp.c_1248_local_cpp_cwe-120-overflow/harness/stubs.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/055_print-bgp.c_1248_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "15b61067481157a77e9dbe0fbca2cfb7")
!22 = distinct !DICompileUnit(language: DW_LANG_C99, file: !23, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!23 = !DIFile(filename: "/opt/tools/klee/runtime/Freestanding/memcmp.c", directory: "/opt/tools/klee/build/runtime/Freestanding", checksumkind: CSK_MD5, checksum: "5350b831de232a5be5b37d49ccbaf0ef")
!24 = distinct !DICompileUnit(language: DW_LANG_C99, file: !25, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!25 = !DIFile(filename: "/opt/tools/klee/runtime/Freestanding/memcpy.c", directory: "/opt/tools/klee/build/runtime/Freestanding", checksumkind: CSK_MD5, checksum: "8fb9a7164e167db005d7d002570068bc")
!26 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!27 = !{i32 7, !"Dwarf Version", i32 5}
!28 = !{i32 2, !"Debug Info Version", i32 3}
!29 = !{i32 1, !"wchar_size", i32 4}
!30 = !{i32 7, !"PIC Level", i32 2}
!31 = !{i32 7, !"PIE Level", i32 2}
!32 = !{i32 7, !"uwtable", i32 1}
!33 = !{i32 7, !"frame-pointer", i32 2}
!34 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 15, type: !35, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !37)
!35 = !DISubroutineType(types: !36)
!36 = !{!9}
!37 = !{}
!38 = !DILocalVariable(name: "ndo", scope: !34, file: !5, line: 16, type: !3)
!39 = !DILocation(line: 16, column: 25, scope: !34)
!40 = !DILocation(line: 16, column: 53, scope: !34)
!41 = !DILocation(line: 16, column: 31, scope: !34)
!42 = !DILocalVariable(name: "buf", scope: !34, file: !5, line: 17, type: !15)
!43 = !DILocation(line: 17, column: 13, scope: !34)
!44 = !DILocation(line: 17, column: 29, scope: !34)
!45 = !DILocation(line: 18, column: 24, scope: !34)
!46 = !DILocation(line: 18, column: 5, scope: !34)
!47 = !DILocation(line: 19, column: 5, scope: !34)
!48 = !DILocation(line: 19, column: 10, scope: !34)
!49 = !DILocation(line: 19, column: 20, scope: !34)
!50 = !DILocation(line: 20, column: 24, scope: !34)
!51 = !DILocation(line: 20, column: 28, scope: !34)
!52 = !DILocation(line: 20, column: 5, scope: !34)
!53 = !DILocation(line: 20, column: 10, scope: !34)
!54 = !DILocation(line: 20, column: 22, scope: !34)
!55 = !DILocation(line: 21, column: 15, scope: !34)
!56 = !DILocation(line: 21, column: 20, scope: !34)
!57 = !DILocation(line: 21, column: 5, scope: !34)
!58 = !DILocation(line: 22, column: 5, scope: !34)
!59 = distinct !DISubprogram(name: "bgp_print", scope: !60, file: !60, line: 23, type: !61, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !37)
!60 = !DIFile(filename: "print-bgp.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/055_print-bgp.c_1248_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "26d636e88c22fd0400db7050309291a7")
!61 = !DISubroutineType(types: !62)
!62 = !{null, !63, !69, !9}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_typedef, name: "netdissect_options", file: !60, line: 13, baseType: !65)
!65 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !60, line: 10, size: 128, elements: !66)
!66 = !{!67, !68}
!67 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_vflag", scope: !65, file: !60, line: 11, baseType: !9, size: 32)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_snapend", scope: !65, file: !60, line: 12, baseType: !69, size: 64, offset: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !71)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !60, line: 7, baseType: !14)
!72 = !DILocalVariable(name: "ndo", arg: 1, scope: !59, file: !60, line: 23, type: !63)
!73 = !DILocation(line: 23, column: 36, scope: !59)
!74 = !DILocalVariable(name: "dat", arg: 2, scope: !59, file: !60, line: 24, type: !69)
!75 = !DILocation(line: 24, column: 25, scope: !59)
!76 = !DILocalVariable(name: "length", arg: 3, scope: !59, file: !60, line: 24, type: !9)
!77 = !DILocation(line: 24, column: 34, scope: !59)
!78 = !DILocation(line: 26, column: 5, scope: !59)
!79 = !DILocalVariable(name: "p", scope: !59, file: !60, line: 27, type: !69)
!80 = !DILocation(line: 27, column: 16, scope: !59)
!81 = !DILocalVariable(name: "ep", scope: !59, file: !60, line: 28, type: !69)
!82 = !DILocation(line: 28, column: 16, scope: !59)
!83 = !DILocalVariable(name: "start", scope: !59, file: !60, line: 29, type: !69)
!84 = !DILocation(line: 29, column: 16, scope: !59)
!85 = !DILocalVariable(name: "marker", scope: !59, file: !60, line: 30, type: !86)
!86 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 128, elements: !87)
!87 = !{!88}
!88 = !DISubrange(count: 16)
!89 = !DILocation(line: 30, column: 15, scope: !59)
!90 = !DILocalVariable(name: "bgp", scope: !59, file: !60, line: 34, type: !91)
!91 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bgp", scope: !59, file: !60, line: 34, size: 160, elements: !92)
!92 = !{!93, !99, !102}
!93 = !DIDerivedType(tag: DW_TAG_member, name: "bgp_len", scope: !91, file: !60, line: 34, baseType: !94, size: 16)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !95, line: 25, baseType: !96)
!95 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "2bf2ae53c58c01b1a1b9383b5195125c")
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !97, line: 40, baseType: !98)
!97 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!98 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "bgp_type", scope: !91, file: !60, line: 34, baseType: !100, size: 8, offset: 16)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !95, line: 24, baseType: !101)
!101 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !97, line: 38, baseType: !14)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "pad", scope: !91, file: !60, line: 34, baseType: !103, size: 128, offset: 24)
!103 = !DICompositeType(tag: DW_TAG_array_type, baseType: !100, size: 128, elements: !87)
!104 = !DILocation(line: 34, column: 78, scope: !59)
!105 = !DILocalVariable(name: "hlen", scope: !59, file: !60, line: 35, type: !94)
!106 = !DILocation(line: 35, column: 11, scope: !59)
!107 = !DILocation(line: 37, column: 7, scope: !59)
!108 = !DILocation(line: 37, column: 13, scope: !59)
!109 = !DILocation(line: 37, column: 11, scope: !59)
!110 = !DILocation(line: 37, column: 5, scope: !59)
!111 = !DILocation(line: 38, column: 6, scope: !112)
!112 = distinct !DILexicalBlock(scope: !59, file: !60, line: 38, column: 6)
!113 = !DILocation(line: 38, column: 11, scope: !112)
!114 = !DILocation(line: 38, column: 25, scope: !112)
!115 = !DILocation(line: 38, column: 31, scope: !112)
!116 = !DILocation(line: 38, column: 29, scope: !112)
!117 = !DILocation(line: 38, column: 23, scope: !112)
!118 = !DILocation(line: 38, column: 6, scope: !59)
!119 = !DILocation(line: 39, column: 8, scope: !112)
!120 = !DILocation(line: 39, column: 13, scope: !112)
!121 = !DILocation(line: 39, column: 6, scope: !112)
!122 = !DILocation(line: 39, column: 3, scope: !112)
!123 = !DILocation(line: 41, column: 6, scope: !59)
!124 = !DILocation(line: 41, column: 4, scope: !59)
!125 = !DILocation(line: 42, column: 10, scope: !59)
!126 = !DILocation(line: 42, column: 8, scope: !59)
!127 = !DILocation(line: 43, column: 2, scope: !59)
!128 = !DILocation(line: 43, column: 9, scope: !59)
!129 = !DILocation(line: 43, column: 13, scope: !59)
!130 = !DILocation(line: 43, column: 11, scope: !59)
!131 = !DILocation(line: 44, column: 7, scope: !132)
!132 = distinct !DILexicalBlock(scope: !133, file: !60, line: 44, column: 7)
!133 = distinct !DILexicalBlock(scope: !59, file: !60, line: 43, column: 17)
!134 = !DILocation(line: 44, column: 12, scope: !132)
!135 = !DILocation(line: 44, column: 7, scope: !133)
!136 = !DILocation(line: 45, column: 5, scope: !137)
!137 = distinct !DILexicalBlock(scope: !132, file: !60, line: 44, column: 21)
!138 = !DILocation(line: 46, column: 4, scope: !137)
!139 = distinct !{!139, !127, !140, !141}
!140 = !DILocation(line: 60, column: 2, scope: !59)
!141 = !{!"llvm.loop.mustprogress"}
!142 = !DILocation(line: 48, column: 14, scope: !143)
!143 = distinct !DILexicalBlock(scope: !133, file: !60, line: 48, column: 7)
!144 = !DILocation(line: 48, column: 17, scope: !143)
!145 = !DILocation(line: 48, column: 7, scope: !143)
!146 = !DILocation(line: 48, column: 41, scope: !143)
!147 = !DILocation(line: 48, column: 7, scope: !133)
!148 = !DILocation(line: 49, column: 5, scope: !149)
!149 = distinct !DILexicalBlock(scope: !143, file: !60, line: 48, column: 47)
!150 = !DILocation(line: 50, column: 4, scope: !149)
!151 = !DILocation(line: 52, column: 3, scope: !133)
!152 = !DILocation(line: 52, column: 16, scope: !133)
!153 = !DILocation(line: 53, column: 15, scope: !133)
!154 = !DILocation(line: 53, column: 11, scope: !133)
!155 = !DILocation(line: 53, column: 23, scope: !133)
!156 = !DILocation(line: 53, column: 36, scope: !133)
!157 = !DILocation(line: 53, column: 32, scope: !133)
!158 = !DILocation(line: 53, column: 44, scope: !133)
!159 = !DILocation(line: 53, column: 29, scope: !133)
!160 = !DILocation(line: 53, column: 10, scope: !133)
!161 = !DILocation(line: 53, column: 8, scope: !133)
!162 = !DILocation(line: 54, column: 7, scope: !163)
!163 = distinct !DILexicalBlock(scope: !133, file: !60, line: 54, column: 7)
!164 = !DILocation(line: 54, column: 12, scope: !163)
!165 = !DILocation(line: 54, column: 7, scope: !133)
!166 = !DILocation(line: 55, column: 4, scope: !163)
!167 = !DILocation(line: 56, column: 25, scope: !168)
!168 = distinct !DILexicalBlock(scope: !133, file: !60, line: 56, column: 7)
!169 = !DILocation(line: 56, column: 30, scope: !168)
!170 = !DILocation(line: 56, column: 33, scope: !168)
!171 = !DILocation(line: 56, column: 8, scope: !168)
!172 = !DILocation(line: 56, column: 7, scope: !133)
!173 = !DILocation(line: 57, column: 4, scope: !168)
!174 = !DILocation(line: 58, column: 8, scope: !133)
!175 = !DILocation(line: 58, column: 5, scope: !133)
!176 = !DILocation(line: 59, column: 11, scope: !133)
!177 = !DILocation(line: 59, column: 9, scope: !133)
!178 = !DILocation(line: 61, column: 1, scope: !59)
!179 = distinct !DISubprogram(name: "memcmp", scope: !180, file: !180, line: 42, type: !181, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !22, retainedNodes: !37)
!180 = !DIFile(filename: "runtime/Freestanding/memcmp.c", directory: "/opt/tools/klee", checksumkind: CSK_MD5, checksum: "5350b831de232a5be5b37d49ccbaf0ef")
!181 = !DISubroutineType(types: !182)
!182 = !{!9, !183, !183, !185}
!183 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !184, size: 64)
!184 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!185 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !186, line: 46, baseType: !187)
!186 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!187 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!188 = !DILocalVariable(name: "s1", arg: 1, scope: !179, file: !180, line: 42, type: !183)
!189 = !DILocation(line: 0, scope: !179)
!190 = !DILocalVariable(name: "s2", arg: 2, scope: !179, file: !180, line: 42, type: !183)
!191 = !DILocalVariable(name: "n", arg: 3, scope: !179, file: !180, line: 42, type: !185)
!192 = !DILocation(line: 43, column: 9, scope: !193)
!193 = distinct !DILexicalBlock(scope: !179, file: !180, line: 43, column: 7)
!194 = !DILocation(line: 43, column: 7, scope: !179)
!195 = !DILocation(line: 0, scope: !196)
!196 = distinct !DILexicalBlock(scope: !193, file: !180, line: 43, column: 15)
!197 = !DILocalVariable(name: "p2", scope: !196, file: !180, line: 44, type: !198)
!198 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !199, size: 64)
!199 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !14)
!200 = !DILocalVariable(name: "p1", scope: !196, file: !180, line: 44, type: !198)
!201 = !DILocation(line: 47, column: 11, scope: !202)
!202 = distinct !DILexicalBlock(scope: !203, file: !180, line: 47, column: 11)
!203 = distinct !DILexicalBlock(scope: !196, file: !180, line: 46, column: 8)
!204 = !DILocation(line: 47, column: 20, scope: !202)
!205 = !DILocation(line: 47, column: 17, scope: !202)
!206 = !DILocation(line: 47, column: 11, scope: !203)
!207 = !DILocation(line: 48, column: 17, scope: !208)
!208 = distinct !DILexicalBlock(scope: !202, file: !180, line: 47, column: 27)
!209 = !DILocation(line: 48, column: 25, scope: !208)
!210 = !DILocation(line: 48, column: 23, scope: !208)
!211 = !DILocation(line: 48, column: 9, scope: !208)
!212 = !DILocation(line: 47, column: 23, scope: !202)
!213 = !DILocation(line: 47, column: 14, scope: !202)
!214 = !DILocation(line: 50, column: 14, scope: !196)
!215 = !DILocation(line: 50, column: 18, scope: !196)
!216 = !DILocation(line: 50, column: 5, scope: !203)
!217 = distinct !{!217, !218, !219, !141}
!218 = !DILocation(line: 46, column: 5, scope: !196)
!219 = !DILocation(line: 50, column: 22, scope: !196)
!220 = !DILocation(line: 53, column: 1, scope: !179)
!221 = distinct !DISubprogram(name: "memcpy", scope: !222, file: !222, line: 12, type: !223, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !24, retainedNodes: !37)
!222 = !DIFile(filename: "runtime/Freestanding/memcpy.c", directory: "/opt/tools/klee", checksumkind: CSK_MD5, checksum: "8fb9a7164e167db005d7d002570068bc")
!223 = !DISubroutineType(types: !224)
!224 = !{!225, !225, !183, !185}
!225 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!226 = !DILocalVariable(name: "destaddr", arg: 1, scope: !221, file: !222, line: 12, type: !225)
!227 = !DILocation(line: 0, scope: !221)
!228 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !221, file: !222, line: 12, type: !183)
!229 = !DILocalVariable(name: "len", arg: 3, scope: !221, file: !222, line: 12, type: !185)
!230 = !DILocalVariable(name: "dest", scope: !221, file: !222, line: 13, type: !231)
!231 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !232, size: 64)
!232 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!233 = !DILocalVariable(name: "src", scope: !221, file: !222, line: 14, type: !234)
!234 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !235, size: 64)
!235 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !232)
!236 = !DILocation(line: 16, column: 16, scope: !221)
!237 = !DILocation(line: 16, column: 3, scope: !221)
!238 = !DILocation(line: 16, column: 13, scope: !221)
!239 = !DILocation(line: 17, column: 19, scope: !221)
!240 = !DILocation(line: 17, column: 15, scope: !221)
!241 = !DILocation(line: 17, column: 10, scope: !221)
!242 = !DILocation(line: 17, column: 13, scope: !221)
!243 = distinct !{!243, !237, !239, !141}
!244 = !DILocation(line: 18, column: 3, scope: !221)
