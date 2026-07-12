; ModuleID = '/app/se_runs/sailor_engine/tcpdump-4.9.2/049_print-802_11.c_1150_local_cpp_cwe-120-overflow/harness/slice.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.netdissect_options = type { i32 }
%struct.pcap_pkthdr = type { i32, i32 }
%struct.mgmt_body_t = type { i32, i32, %struct.cf_t }
%struct.cf_t = type { i8, [6 x i8] }

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@.str.3 = private unnamed_addr constant [38 x i8] c"SPINE_PROBE:ieee802_11_if_print:ENTRY\00", align 1
@.str.4 = private unnamed_addr constant [33 x i8] c"SPINE_PROBE:parse_elements:ENTRY\00", align 1
@.str.5 = private unnamed_addr constant [37 x i8] c"SPINE_PROBE:parse_elements:CASE_E_CF\00", align 1
@.str.6 = private unnamed_addr constant [27 x i8] c"0 && \22SAILOR_SINK_REACHED\22\00", align 1
@.str.7 = private unnamed_addr constant [115 x i8] c"/app/se_runs/sailor_engine/tcpdump-4.9.2/049_print-802_11.c_1150_local_cpp_cwe-120-overflow/harness/print-802_11.c\00", align 1
@__PRETTY_FUNCTION__.parse_elements = private unnamed_addr constant [91 x i8] c"int parse_elements(netdissect_options *, struct mgmt_body_t *, const u_char *, int, u_int)\00", align 1

; Function Attrs: noinline noreturn nounwind optnone uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !53 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.netdissect_options*, align 8
  %3 = alloca %struct.pcap_pkthdr*, align 8
  %4 = alloca i8*, align 8
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %2, metadata !57, metadata !DIExpression()), !dbg !58
  %5 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 4) #6, !dbg !59
  %6 = bitcast i8* %5 to %struct.netdissect_options*, !dbg !60
  store %struct.netdissect_options* %6, %struct.netdissect_options** %2, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata %struct.pcap_pkthdr** %3, metadata !61, metadata !DIExpression()), !dbg !62
  %7 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 8) #6, !dbg !63
  %8 = bitcast i8* %7 to %struct.pcap_pkthdr*, !dbg !64
  store %struct.pcap_pkthdr* %8, %struct.pcap_pkthdr** %3, align 8, !dbg !62
  call void @llvm.dbg.declare(metadata i8** %4, metadata !65, metadata !DIExpression()), !dbg !66
  %9 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 512) #6, !dbg !67
  store i8* %9, i8** %4, align 8, !dbg !66
  %10 = load i8*, i8** %4, align 8, !dbg !68
  call void @klee_make_symbolic(i8* noundef %10, i64 noundef 512, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !69
  %11 = load %struct.pcap_pkthdr*, %struct.pcap_pkthdr** %3, align 8, !dbg !70
  %12 = getelementptr inbounds %struct.pcap_pkthdr, %struct.pcap_pkthdr* %11, i32 0, i32 0, !dbg !71
  store i32 512, i32* %12, align 4, !dbg !72
  %13 = load %struct.pcap_pkthdr*, %struct.pcap_pkthdr** %3, align 8, !dbg !73
  %14 = getelementptr inbounds %struct.pcap_pkthdr, %struct.pcap_pkthdr* %13, i32 0, i32 1, !dbg !74
  store i32 512, i32* %14, align 4, !dbg !75
  %15 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !76
  %16 = load %struct.pcap_pkthdr*, %struct.pcap_pkthdr** %3, align 8, !dbg !77
  %17 = load i8*, i8** %4, align 8, !dbg !78
  call fastcc void @ieee802_11_if_print(%struct.netdissect_options* noundef %15, %struct.pcap_pkthdr* noundef %16, i8* noundef %17), !dbg !79
  unreachable
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

declare void @klee_make_symbolic(i8* noundef, i64 noundef, i8* noundef) local_unnamed_addr #3

; Function Attrs: noinline noreturn nounwind optnone uwtable
define internal fastcc void @handle_beacon(%struct.netdissect_options* noundef %0, i8* noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) unnamed_addr #0 !dbg !80 {
  %7 = alloca %struct.netdissect_options*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store %struct.netdissect_options* %0, %struct.netdissect_options** %7, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %7, metadata !92, metadata !DIExpression()), !dbg !93
  store i8* %1, i8** %8, align 8
  call void @llvm.dbg.declare(metadata i8** %8, metadata !94, metadata !DIExpression()), !dbg !95
  store i32 %2, i32* %9, align 4
  call void @llvm.dbg.declare(metadata i32* %9, metadata !96, metadata !DIExpression()), !dbg !97
  store i32 %3, i32* %10, align 4
  call void @llvm.dbg.declare(metadata i32* %10, metadata !98, metadata !DIExpression()), !dbg !99
  store i32 %4, i32* %11, align 4
  call void @llvm.dbg.declare(metadata i32* %11, metadata !100, metadata !DIExpression()), !dbg !101
  store i32 %5, i32* %12, align 4
  call void @llvm.dbg.declare(metadata i32* %12, metadata !102, metadata !DIExpression()), !dbg !103
  %13 = load %struct.netdissect_options*, %struct.netdissect_options** %7, align 8, !dbg !104
  %14 = load i8*, i8** %8, align 8, !dbg !105
  call fastcc void @parse_elements(%struct.netdissect_options* noundef %13, i8* noundef %14), !dbg !106
  unreachable
}

; Function Attrs: noinline noreturn nounwind optnone uwtable
define internal fastcc void @parse_elements(%struct.netdissect_options* noundef %0, i8* noundef %1) unnamed_addr #0 !dbg !107 {
  %3 = alloca %struct.netdissect_options*, align 8
  %4 = alloca %struct.mgmt_body_t*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.netdissect_options, align 4
  %10 = alloca %struct.netdissect_options, align 4
  %11 = alloca %struct.netdissect_options, align 4
  %12 = alloca %struct.netdissect_options, align 4
  %13 = alloca %struct.cf_t, align 1
  %14 = alloca %struct.netdissect_options, align 4
  store %struct.netdissect_options* %0, %struct.netdissect_options** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %3, metadata !110, metadata !DIExpression()), !dbg !111
  store %struct.mgmt_body_t* null, %struct.mgmt_body_t** %4, align 8
  call void @llvm.dbg.declare(metadata %struct.mgmt_body_t** %4, metadata !112, metadata !DIExpression()), !dbg !113
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !114, metadata !DIExpression()), !dbg !115
  store i32 0, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !116, metadata !DIExpression()), !dbg !117
  store i32 0, i32* %7, align 4
  call void @llvm.dbg.declare(metadata i32* %7, metadata !118, metadata !DIExpression()), !dbg !119
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([33 x i8], [33 x i8]* @.str.4, i64 0, i64 0)), !dbg !120
  call void @llvm.dbg.declare(metadata i32* %8, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata %struct.netdissect_options* %9, metadata !123, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata %struct.netdissect_options* %10, metadata !128, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata %struct.netdissect_options* %11, metadata !133, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata %struct.netdissect_options* %12, metadata !138, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata %struct.cf_t* %13, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata %struct.netdissect_options* %14, metadata !145, metadata !DIExpression()), !dbg !149
  %15 = load %struct.mgmt_body_t*, %struct.mgmt_body_t** %4, align 8, !dbg !150
  %16 = getelementptr inbounds %struct.mgmt_body_t, %struct.mgmt_body_t* %15, i32 0, i32 0, !dbg !151
  %17 = load i32, i32* %16, align 4, !dbg !151
  %cond = icmp eq i32 %17, 1, !dbg !152
  br i1 %cond, label %19, label %18, !dbg !152

18:                                               ; preds = %2
  br label %70, !dbg !153

19:                                               ; preds = %2
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([37 x i8], [37 x i8]* @.str.5, i64 0, i64 0)), !dbg !155
  %20 = bitcast %struct.cf_t* %13 to i8*, !dbg !156
  %21 = load i8*, i8** %5, align 8, !dbg !157
  %22 = load i32, i32* %6, align 4, !dbg !158
  %23 = sext i32 %22 to i64, !dbg !159
  %24 = getelementptr inbounds i8, i8* %21, i64 %23, !dbg !159
  %25 = call i8* @memcpy(i8* %20, i8* %24, i64 2), !dbg !156
  %26 = load i32, i32* %6, align 4, !dbg !160
  %27 = add nsw i32 %26, 2, !dbg !160
  store i32 %27, i32* %6, align 4, !dbg !160
  %28 = load i32, i32* %7, align 4, !dbg !161
  %29 = sub i32 %28, 2, !dbg !161
  store i32 %29, i32* %7, align 4, !dbg !161
  %30 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %13, i32 0, i32 0, !dbg !162
  %31 = load i8, i8* %30, align 1, !dbg !162
  %32 = zext i8 %31 to i32, !dbg !164
  %33 = icmp ne i32 %32, 6, !dbg !165
  br i1 %33, label %34, label %45, !dbg !166

34:                                               ; preds = %19
  %35 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %13, i32 0, i32 0, !dbg !167
  %36 = load i8, i8* %35, align 1, !dbg !167
  %37 = zext i8 %36 to i32, !dbg !169
  %38 = load i32, i32* %6, align 4, !dbg !170
  %39 = add nsw i32 %38, %37, !dbg !170
  store i32 %39, i32* %6, align 4, !dbg !170
  %40 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %13, i32 0, i32 0, !dbg !171
  %41 = load i8, i8* %40, align 1, !dbg !171
  %42 = zext i8 %41 to i32, !dbg !172
  %43 = load i32, i32* %7, align 4, !dbg !173
  %44 = sub i32 %43, %42, !dbg !173
  store i32 %44, i32* %7, align 4, !dbg !173
  br label %70, !dbg !174

45:                                               ; preds = %19
  %46 = getelementptr inbounds %struct.cf_t, %struct.cf_t* %13, i32 0, i32 1, !dbg !175
  %47 = bitcast [6 x i8]* %46 to i8*, !dbg !176
  %48 = load i8*, i8** %5, align 8, !dbg !177
  %49 = load i32, i32* %6, align 4, !dbg !178
  %50 = sext i32 %49 to i64, !dbg !179
  %51 = getelementptr inbounds i8, i8* %48, i64 %50, !dbg !179
  %52 = call i8* @memcpy(i8* %47, i8* %51, i64 6), !dbg !176
  %53 = load i32, i32* %6, align 4, !dbg !180
  %54 = add nsw i32 %53, 6, !dbg !180
  store i32 %54, i32* %6, align 4, !dbg !180
  %55 = load i32, i32* %7, align 4, !dbg !181
  %56 = sub i32 %55, 6, !dbg !181
  store i32 %56, i32* %7, align 4, !dbg !181
  %57 = load %struct.mgmt_body_t*, %struct.mgmt_body_t** %4, align 8, !dbg !182
  %58 = getelementptr inbounds %struct.mgmt_body_t, %struct.mgmt_body_t* %57, i32 0, i32 1, !dbg !184
  %59 = load i32, i32* %58, align 4, !dbg !184
  %60 = icmp ne i32 %59, 0, !dbg !182
  br i1 %60, label %69, label %61, !dbg !185

61:                                               ; preds = %45
  %62 = load %struct.mgmt_body_t*, %struct.mgmt_body_t** %4, align 8, !dbg !186
  %63 = getelementptr inbounds %struct.mgmt_body_t, %struct.mgmt_body_t* %62, i32 0, i32 2, !dbg !188
  %64 = bitcast %struct.cf_t* %63 to i8*, !dbg !189
  %65 = bitcast %struct.cf_t* %13 to i8*, !dbg !189
  %66 = call i8* @memcpy(i8* %64, i8* %65, i64 7), !dbg !189
  %67 = load %struct.mgmt_body_t*, %struct.mgmt_body_t** %4, align 8, !dbg !190
  %68 = getelementptr inbounds %struct.mgmt_body_t, %struct.mgmt_body_t* %67, i32 0, i32 1, !dbg !191
  store i32 1, i32* %68, align 4, !dbg !192
  br label %69, !dbg !193

69:                                               ; preds = %61, %45
  br label %70, !dbg !194

70:                                               ; preds = %69, %34, %18
  %71 = call i32 (i8*, i8*, i32, i8*, ...) bitcast (i32 (...)* @__assert_fail to i32 (i8*, i8*, i32, i8*, ...)*)(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.6, i64 0, i64 0), i8* noundef getelementptr inbounds ([115 x i8], [115 x i8]* @.str.7, i64 0, i64 0), i32 noundef 69, i8* noundef getelementptr inbounds ([91 x i8], [91 x i8]* @__PRETTY_FUNCTION__.parse_elements, i64 0, i64 0)), !dbg !195
  unreachable, !dbg !196
}

declare void @klee_warning_once(i8* noundef) local_unnamed_addr #3

; Function Attrs: noreturn
declare i32 @__assert_fail(...) local_unnamed_addr #4

; Function Attrs: noinline noreturn nounwind optnone uwtable
define internal fastcc void @mgmt_body_print(%struct.netdissect_options* noundef %0, i8* noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) unnamed_addr #0 !dbg !197 {
  %7 = alloca %struct.netdissect_options*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store %struct.netdissect_options* %0, %struct.netdissect_options** %7, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %7, metadata !198, metadata !DIExpression()), !dbg !199
  store i8* %1, i8** %8, align 8
  call void @llvm.dbg.declare(metadata i8** %8, metadata !200, metadata !DIExpression()), !dbg !201
  store i32 %2, i32* %9, align 4
  call void @llvm.dbg.declare(metadata i32* %9, metadata !202, metadata !DIExpression()), !dbg !203
  store i32 %3, i32* %10, align 4
  call void @llvm.dbg.declare(metadata i32* %10, metadata !204, metadata !DIExpression()), !dbg !205
  store i32 %4, i32* %11, align 4
  call void @llvm.dbg.declare(metadata i32* %11, metadata !206, metadata !DIExpression()), !dbg !207
  store i32 %5, i32* %12, align 4
  call void @llvm.dbg.declare(metadata i32* %12, metadata !208, metadata !DIExpression()), !dbg !209
  %13 = load %struct.netdissect_options*, %struct.netdissect_options** %7, align 8, !dbg !210
  %14 = load i8*, i8** %8, align 8, !dbg !211
  %15 = load i32, i32* %9, align 4, !dbg !212
  %16 = load i32, i32* %10, align 4, !dbg !213
  %17 = load i32, i32* %11, align 4, !dbg !214
  %18 = load i32, i32* %12, align 4, !dbg !215
  call fastcc void @handle_beacon(%struct.netdissect_options* noundef %13, i8* noundef %14, i32 noundef %15, i32 noundef %16, i32 noundef %17, i32 noundef %18), !dbg !216
  unreachable
}

; Function Attrs: noinline noreturn nounwind optnone uwtable
define internal fastcc void @ieee802_11_print(%struct.netdissect_options* noundef %0, i8* noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #0 !dbg !217 {
  %5 = alloca %struct.netdissect_options*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.mgmt_body_t*, align 8
  store %struct.netdissect_options* %0, %struct.netdissect_options** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %5, metadata !220, metadata !DIExpression()), !dbg !221
  store i8* %1, i8** %6, align 8
  call void @llvm.dbg.declare(metadata i8** %6, metadata !222, metadata !DIExpression()), !dbg !223
  store i32 %2, i32* %7, align 4
  call void @llvm.dbg.declare(metadata i32* %7, metadata !224, metadata !DIExpression()), !dbg !225
  store i32 %3, i32* %8, align 4
  call void @llvm.dbg.declare(metadata i32* %8, metadata !226, metadata !DIExpression()), !dbg !227
  store i32 0, i32* %9, align 4
  call void @llvm.dbg.declare(metadata i32* %9, metadata !228, metadata !DIExpression()), !dbg !229
  store i32 0, i32* %10, align 4
  call void @llvm.dbg.declare(metadata i32* %10, metadata !230, metadata !DIExpression()), !dbg !231
  %12 = load %struct.netdissect_options*, %struct.netdissect_options** %5, align 8, !dbg !232
  %13 = load i8*, i8** %6, align 8, !dbg !233
  %14 = load i32, i32* %7, align 4, !dbg !234
  %15 = load i32, i32* %8, align 4, !dbg !235
  %16 = load i32, i32* %9, align 4, !dbg !236
  %17 = load i32, i32* %10, align 4, !dbg !237
  call fastcc void @mgmt_body_print(%struct.netdissect_options* noundef %12, i8* noundef %13, i32 noundef %14, i32 noundef %15, i32 noundef %16, i32 noundef %17), !dbg !238
  unreachable
}

; Function Attrs: noinline noreturn nounwind optnone uwtable
define internal fastcc void @ieee802_11_if_print(%struct.netdissect_options* noundef %0, %struct.pcap_pkthdr* noundef %1, i8* noundef %2) unnamed_addr #0 !dbg !239 {
  %4 = alloca %struct.netdissect_options*, align 8
  %5 = alloca %struct.pcap_pkthdr*, align 8
  %6 = alloca i8*, align 8
  store %struct.netdissect_options* %0, %struct.netdissect_options** %4, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %4, metadata !248, metadata !DIExpression()), !dbg !249
  store %struct.pcap_pkthdr* %1, %struct.pcap_pkthdr** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.pcap_pkthdr** %5, metadata !250, metadata !DIExpression()), !dbg !251
  store i8* %2, i8** %6, align 8
  call void @llvm.dbg.declare(metadata i8** %6, metadata !252, metadata !DIExpression()), !dbg !253
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([38 x i8], [38 x i8]* @.str.3, i64 0, i64 0)), !dbg !254
  %7 = load %struct.netdissect_options*, %struct.netdissect_options** %4, align 8, !dbg !255
  %8 = load i8*, i8** %6, align 8, !dbg !256
  %9 = load %struct.pcap_pkthdr*, %struct.pcap_pkthdr** %5, align 8, !dbg !257
  %10 = getelementptr inbounds %struct.pcap_pkthdr, %struct.pcap_pkthdr* %9, i32 0, i32 0, !dbg !258
  %11 = load i32, i32* %10, align 4, !dbg !258
  %12 = load %struct.pcap_pkthdr*, %struct.pcap_pkthdr** %5, align 8, !dbg !259
  %13 = getelementptr inbounds %struct.pcap_pkthdr, %struct.pcap_pkthdr* %12, i32 0, i32 1, !dbg !260
  %14 = load i32, i32* %13, align 4, !dbg !260
  call fastcc void @ieee802_11_print(%struct.netdissect_options* noundef %7, i8* noundef %8, i32 noundef %11, i32 noundef %14), !dbg !261
  unreachable
}

; Function Attrs: nofree noinline norecurse nosync nounwind uwtable
define dso_local i8* @memcpy(i8* noundef returned writeonly %0, i8* nocapture noundef readonly %1, i64 noundef %2) local_unnamed_addr #5 !dbg !262 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !272, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata i8* %1, metadata !274, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata i64 %2, metadata !275, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata i8* %0, metadata !276, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata i8* %1, metadata !279, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata i64 %2, metadata !275, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !273
  %.not3 = icmp eq i64 %2, 0, !dbg !282
  br i1 %.not3, label %._crit_edge, label %.lr.ph, !dbg !283

.lr.ph:                                           ; preds = %3, %.lr.ph
  %.06 = phi i8* [ %5, %.lr.ph ], [ %1, %3 ]
  %.015 = phi i8* [ %7, %.lr.ph ], [ %0, %3 ]
  %.024 = phi i64 [ %4, %.lr.ph ], [ %2, %3 ]
  call void @llvm.dbg.value(metadata i8* %.06, metadata !279, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata i8* %.015, metadata !276, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata i64 %.024, metadata !275, metadata !DIExpression()), !dbg !273
  %4 = add i64 %.024, -1, !dbg !284
  call void @llvm.dbg.value(metadata i64 %4, metadata !275, metadata !DIExpression()), !dbg !273
  %5 = getelementptr inbounds i8, i8* %.06, i64 1, !dbg !285
  call void @llvm.dbg.value(metadata i8* %5, metadata !279, metadata !DIExpression()), !dbg !273
  %6 = load i8, i8* %.06, align 1, !dbg !286
  %7 = getelementptr inbounds i8, i8* %.015, i64 1, !dbg !287
  call void @llvm.dbg.value(metadata i8* %7, metadata !276, metadata !DIExpression()), !dbg !273
  store i8 %6, i8* %.015, align 1, !dbg !288
  call void @llvm.dbg.value(metadata i64 %4, metadata !275, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !273
  %.not = icmp eq i64 %4, 0, !dbg !282
  br i1 %.not, label %._crit_edge, label %.lr.ph, !dbg !283, !llvm.loop !289

._crit_edge:                                      ; preds = %.lr.ph, %3
  ret i8* %0, !dbg !291
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline noreturn nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree noinline norecurse nosync nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0, !22, !39, !41, !43}
!llvm.ident = !{!45, !45, !45, !45, !45}
!llvm.module.flags = !{!46, !47, !48, !49, !50, !51, !52}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/049_print-802_11.c_1150_local_cpp_cwe-120-overflow/harness/driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/049_print-802_11.c_1150_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "29011223436d6c36a2fff62a86b5693d")
!2 = !{!3, !10, !20}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "netdissect_options", file: !5, line: 17, baseType: !6)
!5 = !DIFile(filename: "driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/049_print-802_11.c_1150_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "29011223436d6c36a2fff62a86b5693d")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !5, line: 15, size: 32, elements: !7)
!7 = !{!8}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "dummy", scope: !6, file: !5, line: 16, baseType: !9, size: 32)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "pcap_pkthdr", file: !5, line: 10, size: 64, elements: !12)
!12 = !{!13, !19}
!13 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !11, file: !5, line: 11, baseType: !14, size: 32)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !15, line: 26, baseType: !16)
!15 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "2bf2ae53c58c01b1a1b9383b5195125c")
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !17, line: 42, baseType: !18)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!18 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "caplen", scope: !11, file: !5, line: 12, baseType: !14, size: 32, offset: 32)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!22 = distinct !DICompileUnit(language: DW_LANG_C99, file: !23, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !24, splitDebugInlining: false, nameTableKind: None)
!23 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/049_print-802_11.c_1150_local_cpp_cwe-120-overflow/harness/print-802_11.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/049_print-802_11.c_1150_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "3a6d4e67b134d171dd5bf70a91c86c2f")
!24 = !{!25}
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "mgmt_body_t", file: !27, line: 23, size: 128, elements: !28)
!27 = !DIFile(filename: "print-802_11.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/049_print-802_11.c_1150_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "3a6d4e67b134d171dd5bf70a91c86c2f")
!28 = !{!29, !30, !31}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "element", scope: !26, file: !27, line: 23, baseType: !9, size: 32)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "cf_present", scope: !26, file: !27, line: 23, baseType: !9, size: 32, offset: 32)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "cf", scope: !26, file: !27, line: 23, baseType: !32, size: 56, offset: 64)
!32 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "cf_t", file: !27, line: 22, size: 56, elements: !33)
!33 = !{!34, !35}
!34 = !DIDerivedType(tag: DW_TAG_member, name: "length", scope: !32, file: !27, line: 22, baseType: !21, size: 8)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !32, file: !27, line: 22, baseType: !36, size: 48, offset: 8)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 48, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 6)
!39 = distinct !DICompileUnit(language: DW_LANG_C99, file: !40, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!40 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/049_print-802_11.c_1150_local_cpp_cwe-120-overflow/harness/smart_stubs.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/049_print-802_11.c_1150_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "bcda1acd1a733c696e028616d9d6f3b5")
!41 = distinct !DICompileUnit(language: DW_LANG_C99, file: !42, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!42 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/049_print-802_11.c_1150_local_cpp_cwe-120-overflow/harness/stubs.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/049_print-802_11.c_1150_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "7d0e6b6ae0b6b73532b1bd7610ab6fc3")
!43 = distinct !DICompileUnit(language: DW_LANG_C99, file: !44, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!44 = !DIFile(filename: "/opt/tools/klee/runtime/Freestanding/memcpy.c", directory: "/opt/tools/klee/build/runtime/Freestanding", checksumkind: CSK_MD5, checksum: "8fb9a7164e167db005d7d002570068bc")
!45 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!46 = !{i32 7, !"Dwarf Version", i32 5}
!47 = !{i32 2, !"Debug Info Version", i32 3}
!48 = !{i32 1, !"wchar_size", i32 4}
!49 = !{i32 7, !"PIC Level", i32 2}
!50 = !{i32 7, !"PIE Level", i32 2}
!51 = !{i32 7, !"uwtable", i32 1}
!52 = !{i32 7, !"frame-pointer", i32 2}
!53 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 21, type: !54, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !56)
!54 = !DISubroutineType(types: !55)
!55 = !{!9}
!56 = !{}
!57 = !DILocalVariable(name: "ndo", scope: !53, file: !5, line: 22, type: !3)
!58 = !DILocation(line: 22, column: 25, scope: !53)
!59 = !DILocation(line: 22, column: 53, scope: !53)
!60 = !DILocation(line: 22, column: 31, scope: !53)
!61 = !DILocalVariable(name: "h", scope: !53, file: !5, line: 23, type: !10)
!62 = !DILocation(line: 23, column: 25, scope: !53)
!63 = !DILocation(line: 23, column: 51, scope: !53)
!64 = !DILocation(line: 23, column: 29, scope: !53)
!65 = !DILocalVariable(name: "buf", scope: !53, file: !5, line: 24, type: !20)
!66 = !DILocation(line: 24, column: 20, scope: !53)
!67 = !DILocation(line: 24, column: 43, scope: !53)
!68 = !DILocation(line: 25, column: 24, scope: !53)
!69 = !DILocation(line: 25, column: 5, scope: !53)
!70 = !DILocation(line: 26, column: 5, scope: !53)
!71 = !DILocation(line: 26, column: 8, scope: !53)
!72 = !DILocation(line: 26, column: 12, scope: !53)
!73 = !DILocation(line: 27, column: 5, scope: !53)
!74 = !DILocation(line: 27, column: 8, scope: !53)
!75 = !DILocation(line: 27, column: 15, scope: !53)
!76 = !DILocation(line: 28, column: 25, scope: !53)
!77 = !DILocation(line: 28, column: 30, scope: !53)
!78 = !DILocation(line: 28, column: 33, scope: !53)
!79 = !DILocation(line: 28, column: 5, scope: !53)
!80 = distinct !DISubprogram(name: "handle_beacon", scope: !27, file: !27, line: 76, type: !81, scopeLine: 76, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !22, retainedNodes: !56)
!81 = !DISubroutineType(types: !82)
!82 = !{null, !83, !88, !91, !91, !9, !9}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_typedef, name: "netdissect_options", file: !27, line: 20, baseType: !85)
!85 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !27, line: 18, size: 32, elements: !86)
!86 = !{!87}
!87 = !DIDerivedType(tag: DW_TAG_member, name: "dummy", scope: !85, file: !27, line: 19, baseType: !9, size: 32)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !90)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !27, line: 10, baseType: !21)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !27, line: 11, baseType: !18)
!92 = !DILocalVariable(name: "ndo", arg: 1, scope: !80, file: !27, line: 76, type: !83)
!93 = !DILocation(line: 76, column: 40, scope: !80)
!94 = !DILocalVariable(name: "p", arg: 2, scope: !80, file: !27, line: 76, type: !88)
!95 = !DILocation(line: 76, column: 59, scope: !80)
!96 = !DILocalVariable(name: "len", arg: 3, scope: !80, file: !27, line: 76, type: !91)
!97 = !DILocation(line: 76, column: 68, scope: !80)
!98 = !DILocalVariable(name: "caplen", arg: 4, scope: !80, file: !27, line: 76, type: !91)
!99 = !DILocation(line: 76, column: 79, scope: !80)
!100 = !DILocalVariable(name: "a", arg: 5, scope: !80, file: !27, line: 76, type: !9)
!101 = !DILocation(line: 76, column: 91, scope: !80)
!102 = !DILocalVariable(name: "b", arg: 6, scope: !80, file: !27, line: 76, type: !9)
!103 = !DILocation(line: 76, column: 98, scope: !80)
!104 = !DILocation(line: 77, column: 20, scope: !80)
!105 = !DILocation(line: 77, column: 28, scope: !80)
!106 = !DILocation(line: 77, column: 5, scope: !80)
!107 = distinct !DISubprogram(name: "parse_elements", scope: !27, file: !27, line: 34, type: !108, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !22, retainedNodes: !56)
!108 = !DISubroutineType(types: !109)
!109 = !{!9, !83, !25, !88, !9, !91}
!110 = !DILocalVariable(name: "ndo", arg: 1, scope: !107, file: !27, line: 34, type: !83)
!111 = !DILocation(line: 34, column: 47, scope: !107)
!112 = !DILocalVariable(name: "pbody", arg: 2, scope: !107, file: !27, line: 35, type: !25)
!113 = !DILocation(line: 35, column: 36, scope: !107)
!114 = !DILocalVariable(name: "p", arg: 3, scope: !107, file: !27, line: 35, type: !88)
!115 = !DILocation(line: 35, column: 57, scope: !107)
!116 = !DILocalVariable(name: "offset", arg: 4, scope: !107, file: !27, line: 35, type: !9)
!117 = !DILocation(line: 35, column: 64, scope: !107)
!118 = !DILocalVariable(name: "length", arg: 5, scope: !107, file: !27, line: 36, type: !91)
!119 = !DILocation(line: 36, column: 22, scope: !107)
!120 = !DILocation(line: 38, column: 5, scope: !107)
!121 = !DILocalVariable(name: "elementlen", scope: !107, file: !27, line: 39, type: !91)
!122 = !DILocation(line: 39, column: 8, scope: !107)
!123 = !DILocalVariable(name: "ssid", scope: !107, file: !27, line: 40, type: !124)
!124 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ssid_t", file: !27, line: 24, size: 32, elements: !125)
!125 = !{!126}
!126 = !DIDerivedType(tag: DW_TAG_member, name: "dummy", scope: !124, file: !27, line: 24, baseType: !9, size: 32)
!127 = !DILocation(line: 40, column: 16, scope: !107)
!128 = !DILocalVariable(name: "challenge", scope: !107, file: !27, line: 41, type: !129)
!129 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "challenge_t", file: !27, line: 25, size: 32, elements: !130)
!130 = !{!131}
!131 = !DIDerivedType(tag: DW_TAG_member, name: "dummy", scope: !129, file: !27, line: 25, baseType: !9, size: 32)
!132 = !DILocation(line: 41, column: 21, scope: !107)
!133 = !DILocalVariable(name: "rates", scope: !107, file: !27, line: 42, type: !134)
!134 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rates_t", file: !27, line: 26, size: 32, elements: !135)
!135 = !{!136}
!136 = !DIDerivedType(tag: DW_TAG_member, name: "dummy", scope: !134, file: !27, line: 26, baseType: !9, size: 32)
!137 = !DILocation(line: 42, column: 17, scope: !107)
!138 = !DILocalVariable(name: "ds", scope: !107, file: !27, line: 43, type: !139)
!139 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ds_t", file: !27, line: 27, size: 32, elements: !140)
!140 = !{!141}
!141 = !DIDerivedType(tag: DW_TAG_member, name: "dummy", scope: !139, file: !27, line: 27, baseType: !9, size: 32)
!142 = !DILocation(line: 43, column: 14, scope: !107)
!143 = !DILocalVariable(name: "cf", scope: !107, file: !27, line: 44, type: !32)
!144 = !DILocation(line: 44, column: 14, scope: !107)
!145 = !DILocalVariable(name: "tim", scope: !107, file: !27, line: 45, type: !146)
!146 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tim_t", file: !27, line: 28, size: 32, elements: !147)
!147 = !{!148}
!148 = !DIDerivedType(tag: DW_TAG_member, name: "dummy", scope: !146, file: !27, line: 28, baseType: !9, size: 32)
!149 = !DILocation(line: 45, column: 15, scope: !107)
!150 = !DILocation(line: 47, column: 10, scope: !107)
!151 = !DILocation(line: 47, column: 17, scope: !107)
!152 = !DILocation(line: 47, column: 2, scope: !107)
!153 = !DILocation(line: 49, column: 3, scope: !154)
!154 = distinct !DILexicalBlock(scope: !107, file: !27, line: 47, column: 26)
!155 = !DILocation(line: 51, column: 6, scope: !154)
!156 = !DILocation(line: 52, column: 3, scope: !154)
!157 = !DILocation(line: 52, column: 15, scope: !154)
!158 = !DILocation(line: 52, column: 19, scope: !154)
!159 = !DILocation(line: 52, column: 17, scope: !154)
!160 = !DILocation(line: 53, column: 10, scope: !154)
!161 = !DILocation(line: 54, column: 10, scope: !154)
!162 = !DILocation(line: 55, column: 10, scope: !163)
!163 = distinct !DILexicalBlock(scope: !154, file: !27, line: 55, column: 7)
!164 = !DILocation(line: 55, column: 7, scope: !163)
!165 = !DILocation(line: 55, column: 17, scope: !163)
!166 = !DILocation(line: 55, column: 7, scope: !154)
!167 = !DILocation(line: 56, column: 17, scope: !168)
!168 = distinct !DILexicalBlock(scope: !163, file: !27, line: 55, column: 23)
!169 = !DILocation(line: 56, column: 14, scope: !168)
!170 = !DILocation(line: 56, column: 11, scope: !168)
!171 = !DILocation(line: 57, column: 17, scope: !168)
!172 = !DILocation(line: 57, column: 14, scope: !168)
!173 = !DILocation(line: 57, column: 11, scope: !168)
!174 = !DILocation(line: 58, column: 4, scope: !168)
!175 = !DILocation(line: 60, column: 14, scope: !154)
!176 = !DILocation(line: 60, column: 3, scope: !154)
!177 = !DILocation(line: 60, column: 21, scope: !154)
!178 = !DILocation(line: 60, column: 25, scope: !154)
!179 = !DILocation(line: 60, column: 23, scope: !154)
!180 = !DILocation(line: 61, column: 10, scope: !154)
!181 = !DILocation(line: 62, column: 10, scope: !154)
!182 = !DILocation(line: 63, column: 8, scope: !183)
!183 = distinct !DILexicalBlock(scope: !154, file: !27, line: 63, column: 7)
!184 = !DILocation(line: 63, column: 15, scope: !183)
!185 = !DILocation(line: 63, column: 7, scope: !154)
!186 = !DILocation(line: 64, column: 4, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !27, line: 63, column: 27)
!188 = !DILocation(line: 64, column: 11, scope: !187)
!189 = !DILocation(line: 64, column: 16, scope: !187)
!190 = !DILocation(line: 65, column: 4, scope: !187)
!191 = !DILocation(line: 65, column: 11, scope: !187)
!192 = !DILocation(line: 65, column: 22, scope: !187)
!193 = !DILocation(line: 66, column: 3, scope: !187)
!194 = !DILocation(line: 67, column: 3, scope: !154)
!195 = !DILocation(line: 69, column: 5, scope: !107)
!196 = !DILocation(line: 70, column: 2, scope: !107)
!197 = distinct !DISubprogram(name: "mgmt_body_print", scope: !27, file: !27, line: 82, type: !81, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !22, retainedNodes: !56)
!198 = !DILocalVariable(name: "ndo", arg: 1, scope: !197, file: !27, line: 82, type: !83)
!199 = !DILocation(line: 82, column: 42, scope: !197)
!200 = !DILocalVariable(name: "p", arg: 2, scope: !197, file: !27, line: 82, type: !88)
!201 = !DILocation(line: 82, column: 61, scope: !197)
!202 = !DILocalVariable(name: "len", arg: 3, scope: !197, file: !27, line: 82, type: !91)
!203 = !DILocation(line: 82, column: 70, scope: !197)
!204 = !DILocalVariable(name: "caplen", arg: 4, scope: !197, file: !27, line: 82, type: !91)
!205 = !DILocation(line: 82, column: 81, scope: !197)
!206 = !DILocalVariable(name: "a", arg: 5, scope: !197, file: !27, line: 82, type: !9)
!207 = !DILocation(line: 82, column: 93, scope: !197)
!208 = !DILocalVariable(name: "b", arg: 6, scope: !197, file: !27, line: 82, type: !9)
!209 = !DILocation(line: 82, column: 100, scope: !197)
!210 = !DILocation(line: 83, column: 19, scope: !197)
!211 = !DILocation(line: 83, column: 24, scope: !197)
!212 = !DILocation(line: 83, column: 27, scope: !197)
!213 = !DILocation(line: 83, column: 32, scope: !197)
!214 = !DILocation(line: 83, column: 40, scope: !197)
!215 = !DILocation(line: 83, column: 43, scope: !197)
!216 = !DILocation(line: 83, column: 5, scope: !197)
!217 = distinct !DISubprogram(name: "ieee802_11_print", scope: !27, file: !27, line: 89, type: !218, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !22, retainedNodes: !56)
!218 = !DISubroutineType(types: !219)
!219 = !{!91, !83, !88, !91, !91, !9, !9}
!220 = !DILocalVariable(name: "ndo", arg: 1, scope: !217, file: !27, line: 89, type: !83)
!221 = !DILocation(line: 89, column: 44, scope: !217)
!222 = !DILocalVariable(name: "p", arg: 2, scope: !217, file: !27, line: 89, type: !88)
!223 = !DILocation(line: 89, column: 63, scope: !217)
!224 = !DILocalVariable(name: "len", arg: 3, scope: !217, file: !27, line: 89, type: !91)
!225 = !DILocation(line: 89, column: 72, scope: !217)
!226 = !DILocalVariable(name: "caplen", arg: 4, scope: !217, file: !27, line: 89, type: !91)
!227 = !DILocation(line: 89, column: 83, scope: !217)
!228 = !DILocalVariable(name: "a", arg: 5, scope: !217, file: !27, line: 89, type: !9)
!229 = !DILocation(line: 89, column: 95, scope: !217)
!230 = !DILocalVariable(name: "b", arg: 6, scope: !217, file: !27, line: 89, type: !9)
!231 = !DILocation(line: 89, column: 102, scope: !217)
!232 = !DILocation(line: 91, column: 21, scope: !217)
!233 = !DILocation(line: 91, column: 26, scope: !217)
!234 = !DILocation(line: 91, column: 29, scope: !217)
!235 = !DILocation(line: 91, column: 34, scope: !217)
!236 = !DILocation(line: 91, column: 42, scope: !217)
!237 = !DILocation(line: 91, column: 45, scope: !217)
!238 = !DILocation(line: 91, column: 5, scope: !217)
!239 = distinct !DISubprogram(name: "ieee802_11_if_print", scope: !27, file: !27, line: 99, type: !240, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !22, retainedNodes: !56)
!240 = !DISubroutineType(types: !241)
!241 = !{!91, !83, !242, !88}
!242 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !243, size: 64)
!243 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !244)
!244 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "pcap_pkthdr", file: !27, line: 13, size: 64, elements: !245)
!245 = !{!246, !247}
!246 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !244, file: !27, line: 14, baseType: !14, size: 32)
!247 = !DIDerivedType(tag: DW_TAG_member, name: "caplen", scope: !244, file: !27, line: 15, baseType: !14, size: 32, offset: 32)
!248 = !DILocalVariable(name: "ndo", arg: 1, scope: !239, file: !27, line: 99, type: !83)
!249 = !DILocation(line: 99, column: 47, scope: !239)
!250 = !DILocalVariable(name: "h", arg: 2, scope: !239, file: !27, line: 100, type: !242)
!251 = !DILocation(line: 100, column: 47, scope: !239)
!252 = !DILocalVariable(name: "p", arg: 3, scope: !239, file: !27, line: 100, type: !88)
!253 = !DILocation(line: 100, column: 64, scope: !239)
!254 = !DILocation(line: 102, column: 5, scope: !239)
!255 = !DILocation(line: 103, column: 26, scope: !239)
!256 = !DILocation(line: 103, column: 31, scope: !239)
!257 = !DILocation(line: 103, column: 34, scope: !239)
!258 = !DILocation(line: 103, column: 37, scope: !239)
!259 = !DILocation(line: 103, column: 42, scope: !239)
!260 = !DILocation(line: 103, column: 45, scope: !239)
!261 = !DILocation(line: 103, column: 9, scope: !239)
!262 = distinct !DISubprogram(name: "memcpy", scope: !263, file: !263, line: 12, type: !264, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !56)
!263 = !DIFile(filename: "runtime/Freestanding/memcpy.c", directory: "/opt/tools/klee", checksumkind: CSK_MD5, checksum: "8fb9a7164e167db005d7d002570068bc")
!264 = !DISubroutineType(types: !265)
!265 = !{!266, !266, !267, !269}
!266 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!267 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !268, size: 64)
!268 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!269 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !270, line: 46, baseType: !271)
!270 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!271 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!272 = !DILocalVariable(name: "destaddr", arg: 1, scope: !262, file: !263, line: 12, type: !266)
!273 = !DILocation(line: 0, scope: !262)
!274 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !262, file: !263, line: 12, type: !267)
!275 = !DILocalVariable(name: "len", arg: 3, scope: !262, file: !263, line: 12, type: !269)
!276 = !DILocalVariable(name: "dest", scope: !262, file: !263, line: 13, type: !277)
!277 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !278, size: 64)
!278 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!279 = !DILocalVariable(name: "src", scope: !262, file: !263, line: 14, type: !280)
!280 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !281, size: 64)
!281 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !278)
!282 = !DILocation(line: 16, column: 16, scope: !262)
!283 = !DILocation(line: 16, column: 3, scope: !262)
!284 = !DILocation(line: 16, column: 13, scope: !262)
!285 = !DILocation(line: 17, column: 19, scope: !262)
!286 = !DILocation(line: 17, column: 15, scope: !262)
!287 = !DILocation(line: 17, column: 10, scope: !262)
!288 = !DILocation(line: 17, column: 13, scope: !262)
!289 = distinct !{!289, !283, !285, !290}
!290 = !{!"llvm.loop.mustprogress"}
!291 = !DILocation(line: 18, column: 3, scope: !262)
