; ModuleID = '/app/se_runs/sailor_engine/tcpdump-4.9.2/052_print-802_11.c_1180_local_cpp_cwe-120-overflow/harness/slice.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.netdissect_options = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.pcap_pkthdr = type { %struct.timeval, i32, i32 }
%struct.timeval = type { i64, i64 }
%struct.mgmt_body_t = type { i32, %struct.tim_t }
%struct.tim_t = type { i8, i8, i8, i8, [256 x i8] }

@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@.str.3 = private unnamed_addr constant [38 x i8] c"SPINE_PROBE:ieee802_11_if_print:ENTRY\00", align 1
@.str.4 = private unnamed_addr constant [33 x i8] c"SPINE_PROBE:parse_elements:ENTRY\00", align 1
@.str.5 = private unnamed_addr constant [34 x i8] c"SPINE_PROBE:parse_elements:CASE_5\00", align 1
@.str.6 = private unnamed_addr constant [27 x i8] c"0 && \22SAILOR_SINK_REACHED\22\00", align 1
@.str.7 = private unnamed_addr constant [115 x i8] c"/app/se_runs/sailor_engine/tcpdump-4.9.2/052_print-802_11.c_1180_local_cpp_cwe-120-overflow/harness/print-802_11.c\00", align 1
@__PRETTY_FUNCTION__.parse_elements = private unnamed_addr constant [98 x i8] c"int parse_elements(struct netdissect_options *, struct mgmt_body_t *, const u_char *, int, u_int)\00", align 1

; Function Attrs: noinline noreturn nounwind optnone uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !60 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.netdissect_options*, align 8
  %3 = alloca %struct.pcap_pkthdr*, align 8
  %4 = alloca i8*, align 8
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %2, metadata !64, metadata !DIExpression()), !dbg !65
  %5 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 44) #7, !dbg !66
  %6 = bitcast i8* %5 to %struct.netdissect_options*, !dbg !67
  store %struct.netdissect_options* %6, %struct.netdissect_options** %2, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata %struct.pcap_pkthdr** %3, metadata !68, metadata !DIExpression()), !dbg !69
  %7 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 24) #7, !dbg !70
  %8 = bitcast i8* %7 to %struct.pcap_pkthdr*, !dbg !71
  store %struct.pcap_pkthdr* %8, %struct.pcap_pkthdr** %3, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata i8** %4, metadata !72, metadata !DIExpression()), !dbg !73
  %9 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 512) #7, !dbg !74
  store i8* %9, i8** %4, align 8, !dbg !73
  %10 = load i8*, i8** %4, align 8, !dbg !75
  call void @klee_make_symbolic(i8* noundef %10, i64 noundef 512, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !76
  %11 = load %struct.pcap_pkthdr*, %struct.pcap_pkthdr** %3, align 8, !dbg !77
  %12 = getelementptr inbounds %struct.pcap_pkthdr, %struct.pcap_pkthdr* %11, i32 0, i32 2, !dbg !78
  store i32 512, i32* %12, align 4, !dbg !79
  %13 = load %struct.pcap_pkthdr*, %struct.pcap_pkthdr** %3, align 8, !dbg !80
  %14 = getelementptr inbounds %struct.pcap_pkthdr, %struct.pcap_pkthdr* %13, i32 0, i32 1, !dbg !81
  store i32 512, i32* %14, align 8, !dbg !82
  %15 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !83
  %16 = load %struct.pcap_pkthdr*, %struct.pcap_pkthdr** %3, align 8, !dbg !84
  %17 = load i8*, i8** %4, align 8, !dbg !85
  call fastcc void @ieee802_11_if_print(%struct.netdissect_options* noundef %15, %struct.pcap_pkthdr* noundef %16, i8* noundef %17), !dbg !86
  unreachable
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

declare void @klee_make_symbolic(i8* noundef, i64 noundef, i8* noundef) local_unnamed_addr #3

; Function Attrs: noinline noreturn nounwind optnone uwtable
define internal fastcc void @handle_beacon(%struct.netdissect_options* noundef %0, i8* noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) unnamed_addr #0 !dbg !87 {
  %7 = alloca %struct.netdissect_options*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca %struct.mgmt_body_t, align 4
  store %struct.netdissect_options* %0, %struct.netdissect_options** %7, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %7, metadata !109, metadata !DIExpression()), !dbg !110
  store i8* %1, i8** %8, align 8
  call void @llvm.dbg.declare(metadata i8** %8, metadata !111, metadata !DIExpression()), !dbg !112
  store i32 %2, i32* %9, align 4
  call void @llvm.dbg.declare(metadata i32* %9, metadata !113, metadata !DIExpression()), !dbg !114
  store i32 %3, i32* %10, align 4
  call void @llvm.dbg.declare(metadata i32* %10, metadata !115, metadata !DIExpression()), !dbg !116
  store i32 %4, i32* %11, align 4
  call void @llvm.dbg.declare(metadata i32* %11, metadata !117, metadata !DIExpression()), !dbg !118
  store i32 %5, i32* %12, align 4
  call void @llvm.dbg.declare(metadata i32* %12, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata %struct.mgmt_body_t* %13, metadata !121, metadata !DIExpression()), !dbg !136
  %14 = bitcast %struct.mgmt_body_t* %13 to i8*, !dbg !137
  %15 = call i8* @memset(i8* %14, i32 0, i64 264), !dbg !137
  %16 = load %struct.netdissect_options*, %struct.netdissect_options** %7, align 8, !dbg !138
  %17 = load i8*, i8** %8, align 8, !dbg !139
  %18 = load i32, i32* %9, align 4, !dbg !140
  call fastcc void @parse_elements(%struct.netdissect_options* noundef %16, %struct.mgmt_body_t* noundef %13, i8* noundef %17, i32 noundef %18), !dbg !141
  unreachable
}

; Function Attrs: noinline noreturn nounwind optnone uwtable
define internal fastcc void @parse_elements(%struct.netdissect_options* noundef %0, %struct.mgmt_body_t* noundef %1, i8* noundef %2, i32 noundef %3) unnamed_addr #0 !dbg !142 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.netdissect_options*, align 8
  %7 = alloca %struct.mgmt_body_t*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca %struct.tim_t, align 1
  store %struct.netdissect_options* %0, %struct.netdissect_options** %6, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %6, metadata !146, metadata !DIExpression()), !dbg !147
  store %struct.mgmt_body_t* %1, %struct.mgmt_body_t** %7, align 8
  call void @llvm.dbg.declare(metadata %struct.mgmt_body_t** %7, metadata !148, metadata !DIExpression()), !dbg !149
  store i8* %2, i8** %8, align 8
  call void @llvm.dbg.declare(metadata i8** %8, metadata !150, metadata !DIExpression()), !dbg !151
  store i32 0, i32* %9, align 4
  call void @llvm.dbg.declare(metadata i32* %9, metadata !152, metadata !DIExpression()), !dbg !153
  store i32 %3, i32* %10, align 4
  call void @llvm.dbg.declare(metadata i32* %10, metadata !154, metadata !DIExpression()), !dbg !155
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([33 x i8], [33 x i8]* @.str.4, i64 0, i64 0)), !dbg !156
  call void @llvm.dbg.declare(metadata i32* %11, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata %struct.tim_t* %12, metadata !159, metadata !DIExpression()), !dbg !160
  br label %13, !dbg !161

13:                                               ; preds = %111, %4
  %14 = load i32, i32* %10, align 4, !dbg !162
  %15 = icmp ugt i32 %14, 0, !dbg !163
  br i1 %15, label %16, label %112, !dbg !161

16:                                               ; preds = %13
  %17 = load i8*, i8** %8, align 8, !dbg !164
  %18 = load i32, i32* %9, align 4, !dbg !166
  %19 = sext i32 %18 to i64, !dbg !167
  %20 = getelementptr inbounds i8, i8* %17, i64 %19, !dbg !167
  %21 = load i8, i8* %20, align 1, !dbg !168
  %22 = zext i8 %21 to i32, !dbg !168
  %cond = icmp eq i32 %22, 5, !dbg !169
  br i1 %cond, label %32, label %23, !dbg !169

23:                                               ; preds = %16
  %24 = load i32, i32* %11, align 4, !dbg !170
  %25 = add i32 2, %24, !dbg !172
  %26 = load i32, i32* %9, align 4, !dbg !173
  %27 = add i32 %26, %25, !dbg !173
  store i32 %27, i32* %9, align 4, !dbg !173
  %28 = load i32, i32* %11, align 4, !dbg !174
  %29 = add i32 2, %28, !dbg !175
  %30 = load i32, i32* %10, align 4, !dbg !176
  %31 = sub i32 %30, %29, !dbg !176
  store i32 %31, i32* %10, align 4, !dbg !176
  br label %111, !dbg !177

32:                                               ; preds = %16
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @.str.5, i64 0, i64 0)), !dbg !178
  %33 = bitcast %struct.tim_t* %12 to i8*, !dbg !179
  %34 = load i8*, i8** %8, align 8, !dbg !180
  %35 = load i32, i32* %9, align 4, !dbg !181
  %36 = sext i32 %35 to i64, !dbg !182
  %37 = getelementptr inbounds i8, i8* %34, i64 %36, !dbg !182
  %38 = call i8* @memcpy(i8* %33, i8* %37, i64 2), !dbg !179
  %39 = load i32, i32* %9, align 4, !dbg !183
  %40 = add nsw i32 %39, 2, !dbg !183
  store i32 %40, i32* %9, align 4, !dbg !183
  %41 = load i32, i32* %10, align 4, !dbg !184
  %42 = sub i32 %41, 2, !dbg !184
  store i32 %42, i32* %10, align 4, !dbg !184
  %43 = getelementptr inbounds %struct.tim_t, %struct.tim_t* %12, i32 0, i32 1, !dbg !185
  %44 = load i8, i8* %43, align 1, !dbg !185
  %45 = zext i8 %44 to i32, !dbg !187
  %46 = icmp sle i32 %45, 3, !dbg !188
  br i1 %46, label %47, label %58, !dbg !189

47:                                               ; preds = %32
  %48 = getelementptr inbounds %struct.tim_t, %struct.tim_t* %12, i32 0, i32 1, !dbg !190
  %49 = load i8, i8* %48, align 1, !dbg !190
  %50 = zext i8 %49 to i32, !dbg !192
  %51 = load i32, i32* %9, align 4, !dbg !193
  %52 = add nsw i32 %51, %50, !dbg !193
  store i32 %52, i32* %9, align 4, !dbg !193
  %53 = getelementptr inbounds %struct.tim_t, %struct.tim_t* %12, i32 0, i32 1, !dbg !194
  %54 = load i8, i8* %53, align 1, !dbg !194
  %55 = zext i8 %54 to i32, !dbg !195
  %56 = load i32, i32* %10, align 4, !dbg !196
  %57 = sub i32 %56, %55, !dbg !196
  store i32 %57, i32* %10, align 4, !dbg !196
  br label %111, !dbg !197

58:                                               ; preds = %32
  %59 = getelementptr inbounds %struct.tim_t, %struct.tim_t* %12, i32 0, i32 1, !dbg !198
  %60 = load i8, i8* %59, align 1, !dbg !198
  %61 = zext i8 %60 to i32, !dbg !200
  %62 = sub nsw i32 %61, 3, !dbg !201
  br label %63

63:                                               ; preds = %58
  %64 = getelementptr inbounds %struct.tim_t, %struct.tim_t* %12, i32 0, i32 2, !dbg !202
  %65 = load i8*, i8** %8, align 8, !dbg !203
  %66 = load i32, i32* %9, align 4, !dbg !204
  %67 = sext i32 %66 to i64, !dbg !205
  %68 = getelementptr inbounds i8, i8* %65, i64 %67, !dbg !205
  %69 = call i8* @memcpy(i8* %64, i8* %68, i64 3), !dbg !206
  %70 = load i32, i32* %9, align 4, !dbg !207
  %71 = add nsw i32 %70, 3, !dbg !207
  store i32 %71, i32* %9, align 4, !dbg !207
  %72 = load i32, i32* %10, align 4, !dbg !208
  %73 = sub i32 %72, 3, !dbg !208
  store i32 %73, i32* %10, align 4, !dbg !208
  %74 = getelementptr inbounds %struct.tim_t, %struct.tim_t* %12, i32 0, i32 4, !dbg !209
  %75 = getelementptr inbounds [256 x i8], [256 x i8]* %74, i64 0, i64 0, !dbg !210
  %76 = load i8*, i8** %8, align 8, !dbg !211
  %77 = load i32, i32* %9, align 4, !dbg !212
  %78 = sext i32 %77 to i64, !dbg !213
  %79 = getelementptr inbounds i8, i8* %76, i64 %78, !dbg !213
  %80 = getelementptr inbounds %struct.tim_t, %struct.tim_t* %12, i32 0, i32 1, !dbg !214
  %81 = load i8, i8* %80, align 1, !dbg !214
  %82 = zext i8 %81 to i32, !dbg !215
  %83 = sub nsw i32 %82, 3, !dbg !216
  %84 = sext i32 %83 to i64, !dbg !215
  %85 = call i8* @memcpy(i8* %75, i8* %79, i64 %84), !dbg !210
  %86 = getelementptr inbounds %struct.tim_t, %struct.tim_t* %12, i32 0, i32 1, !dbg !217
  %87 = load i8, i8* %86, align 1, !dbg !217
  %88 = zext i8 %87 to i32, !dbg !218
  %89 = sub nsw i32 %88, 3, !dbg !219
  %90 = load i32, i32* %9, align 4, !dbg !220
  %91 = add nsw i32 %90, %89, !dbg !220
  store i32 %91, i32* %9, align 4, !dbg !220
  %92 = getelementptr inbounds %struct.tim_t, %struct.tim_t* %12, i32 0, i32 1, !dbg !221
  %93 = load i8, i8* %92, align 1, !dbg !221
  %94 = zext i8 %93 to i32, !dbg !222
  %95 = sub nsw i32 %94, 3, !dbg !223
  %96 = load i32, i32* %10, align 4, !dbg !224
  %97 = sub i32 %96, %95, !dbg !224
  store i32 %97, i32* %10, align 4, !dbg !224
  %98 = load %struct.mgmt_body_t*, %struct.mgmt_body_t** %7, align 8, !dbg !225
  %99 = getelementptr inbounds %struct.mgmt_body_t, %struct.mgmt_body_t* %98, i32 0, i32 0, !dbg !227
  %100 = load i32, i32* %99, align 4, !dbg !227
  %101 = icmp ne i32 %100, 0, !dbg !225
  br i1 %101, label %110, label %102, !dbg !228

102:                                              ; preds = %63
  %103 = load %struct.mgmt_body_t*, %struct.mgmt_body_t** %7, align 8, !dbg !229
  %104 = getelementptr inbounds %struct.mgmt_body_t, %struct.mgmt_body_t* %103, i32 0, i32 1, !dbg !231
  %105 = bitcast %struct.tim_t* %104 to i8*, !dbg !232
  %106 = bitcast %struct.tim_t* %12 to i8*, !dbg !232
  %107 = call i8* @memcpy(i8* %105, i8* %106, i64 260), !dbg !232
  %108 = load %struct.mgmt_body_t*, %struct.mgmt_body_t** %7, align 8, !dbg !233
  %109 = getelementptr inbounds %struct.mgmt_body_t, %struct.mgmt_body_t* %108, i32 0, i32 0, !dbg !234
  store i32 1, i32* %109, align 4, !dbg !235
  br label %110, !dbg !236

110:                                              ; preds = %102, %63
  br label %111, !dbg !237

111:                                              ; preds = %110, %47, %23
  br label %13, !dbg !161, !llvm.loop !238

112:                                              ; preds = %13
  %113 = call i32 (i8*, i8*, i32, i8*, ...) bitcast (i32 (...)* @__assert_fail to i32 (i8*, i8*, i32, i8*, ...)*)(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.6, i64 0, i64 0), i8* noundef getelementptr inbounds ([115 x i8], [115 x i8]* @.str.7, i64 0, i64 0), i32 noundef 109, i8* noundef getelementptr inbounds ([98 x i8], [98 x i8]* @__PRETTY_FUNCTION__.parse_elements, i64 0, i64 0)), !dbg !241
  unreachable, !dbg !242
}

declare void @klee_warning_once(i8* noundef) local_unnamed_addr #3

; Function Attrs: noreturn
declare i32 @__assert_fail(...) local_unnamed_addr #4

; Function Attrs: noinline noreturn nounwind optnone uwtable
define internal fastcc void @mgmt_body_print(%struct.netdissect_options* noundef %0, i8* noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) unnamed_addr #0 !dbg !243 {
  %7 = alloca %struct.netdissect_options*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store %struct.netdissect_options* %0, %struct.netdissect_options** %7, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %7, metadata !244, metadata !DIExpression()), !dbg !245
  store i8* %1, i8** %8, align 8
  call void @llvm.dbg.declare(metadata i8** %8, metadata !246, metadata !DIExpression()), !dbg !247
  store i32 %2, i32* %9, align 4
  call void @llvm.dbg.declare(metadata i32* %9, metadata !248, metadata !DIExpression()), !dbg !249
  store i32 %3, i32* %10, align 4
  call void @llvm.dbg.declare(metadata i32* %10, metadata !250, metadata !DIExpression()), !dbg !251
  store i32 %4, i32* %11, align 4
  call void @llvm.dbg.declare(metadata i32* %11, metadata !252, metadata !DIExpression()), !dbg !253
  store i32 %5, i32* %12, align 4
  call void @llvm.dbg.declare(metadata i32* %12, metadata !254, metadata !DIExpression()), !dbg !255
  %13 = load %struct.netdissect_options*, %struct.netdissect_options** %7, align 8, !dbg !256
  %14 = load i8*, i8** %8, align 8, !dbg !257
  %15 = load i32, i32* %9, align 4, !dbg !258
  %16 = load i32, i32* %10, align 4, !dbg !259
  %17 = load i32, i32* %11, align 4, !dbg !260
  %18 = load i32, i32* %12, align 4, !dbg !261
  call fastcc void @handle_beacon(%struct.netdissect_options* noundef %13, i8* noundef %14, i32 noundef %15, i32 noundef %16, i32 noundef %17, i32 noundef %18), !dbg !262
  unreachable
}

; Function Attrs: noinline noreturn nounwind optnone uwtable
define internal fastcc void @ieee802_11_print(%struct.netdissect_options* noundef %0, i8* noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #0 !dbg !263 {
  %5 = alloca %struct.netdissect_options*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store %struct.netdissect_options* %0, %struct.netdissect_options** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %5, metadata !266, metadata !DIExpression()), !dbg !267
  store i8* %1, i8** %6, align 8
  call void @llvm.dbg.declare(metadata i8** %6, metadata !268, metadata !DIExpression()), !dbg !269
  store i32 %2, i32* %7, align 4
  call void @llvm.dbg.declare(metadata i32* %7, metadata !270, metadata !DIExpression()), !dbg !271
  store i32 %3, i32* %8, align 4
  call void @llvm.dbg.declare(metadata i32* %8, metadata !272, metadata !DIExpression()), !dbg !273
  store i32 0, i32* %9, align 4
  call void @llvm.dbg.declare(metadata i32* %9, metadata !274, metadata !DIExpression()), !dbg !275
  store i32 0, i32* %10, align 4
  call void @llvm.dbg.declare(metadata i32* %10, metadata !276, metadata !DIExpression()), !dbg !277
  %11 = load %struct.netdissect_options*, %struct.netdissect_options** %5, align 8, !dbg !278
  %12 = load i8*, i8** %6, align 8, !dbg !279
  %13 = load i32, i32* %7, align 4, !dbg !280
  %14 = load i32, i32* %8, align 4, !dbg !281
  %15 = load i32, i32* %9, align 4, !dbg !282
  %16 = load i32, i32* %10, align 4, !dbg !283
  call fastcc void @mgmt_body_print(%struct.netdissect_options* noundef %11, i8* noundef %12, i32 noundef %13, i32 noundef %14, i32 noundef %15, i32 noundef %16), !dbg !284
  unreachable
}

; Function Attrs: noinline noreturn nounwind optnone uwtable
define internal fastcc void @ieee802_11_if_print(%struct.netdissect_options* noundef %0, %struct.pcap_pkthdr* noundef %1, i8* noundef %2) unnamed_addr #0 !dbg !285 {
  %4 = alloca %struct.netdissect_options*, align 8
  %5 = alloca %struct.pcap_pkthdr*, align 8
  %6 = alloca i8*, align 8
  store %struct.netdissect_options* %0, %struct.netdissect_options** %4, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %4, metadata !299, metadata !DIExpression()), !dbg !300
  store %struct.pcap_pkthdr* %1, %struct.pcap_pkthdr** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.pcap_pkthdr** %5, metadata !301, metadata !DIExpression()), !dbg !302
  store i8* %2, i8** %6, align 8
  call void @llvm.dbg.declare(metadata i8** %6, metadata !303, metadata !DIExpression()), !dbg !304
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([38 x i8], [38 x i8]* @.str.3, i64 0, i64 0)), !dbg !305
  %7 = load %struct.netdissect_options*, %struct.netdissect_options** %4, align 8, !dbg !306
  %8 = load i8*, i8** %6, align 8, !dbg !307
  %9 = load %struct.pcap_pkthdr*, %struct.pcap_pkthdr** %5, align 8, !dbg !308
  %10 = getelementptr inbounds %struct.pcap_pkthdr, %struct.pcap_pkthdr* %9, i32 0, i32 2, !dbg !309
  %11 = load i32, i32* %10, align 4, !dbg !309
  %12 = load %struct.pcap_pkthdr*, %struct.pcap_pkthdr** %5, align 8, !dbg !310
  %13 = getelementptr inbounds %struct.pcap_pkthdr, %struct.pcap_pkthdr* %12, i32 0, i32 1, !dbg !311
  %14 = load i32, i32* %13, align 8, !dbg !311
  call fastcc void @ieee802_11_print(%struct.netdissect_options* noundef %7, i8* noundef %8, i32 noundef %11, i32 noundef %14), !dbg !312
  unreachable
}

; Function Attrs: nofree noinline norecurse nosync nounwind uwtable
define dso_local i8* @memcpy(i8* noundef returned writeonly %0, i8* nocapture noundef readonly %1, i64 noundef %2) local_unnamed_addr #5 !dbg !313 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !323, metadata !DIExpression()), !dbg !324
  call void @llvm.dbg.value(metadata i8* %1, metadata !325, metadata !DIExpression()), !dbg !324
  call void @llvm.dbg.value(metadata i64 %2, metadata !326, metadata !DIExpression()), !dbg !324
  call void @llvm.dbg.value(metadata i8* %0, metadata !327, metadata !DIExpression()), !dbg !324
  call void @llvm.dbg.value(metadata i8* %1, metadata !330, metadata !DIExpression()), !dbg !324
  call void @llvm.dbg.value(metadata i64 %2, metadata !326, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !324
  %.not3 = icmp eq i64 %2, 0, !dbg !333
  br i1 %.not3, label %._crit_edge, label %.lr.ph, !dbg !334

.lr.ph:                                           ; preds = %3, %.lr.ph
  %.06 = phi i8* [ %5, %.lr.ph ], [ %1, %3 ]
  %.015 = phi i8* [ %7, %.lr.ph ], [ %0, %3 ]
  %.024 = phi i64 [ %4, %.lr.ph ], [ %2, %3 ]
  call void @llvm.dbg.value(metadata i8* %.06, metadata !330, metadata !DIExpression()), !dbg !324
  call void @llvm.dbg.value(metadata i8* %.015, metadata !327, metadata !DIExpression()), !dbg !324
  call void @llvm.dbg.value(metadata i64 %.024, metadata !326, metadata !DIExpression()), !dbg !324
  %4 = add i64 %.024, -1, !dbg !335
  call void @llvm.dbg.value(metadata i64 %4, metadata !326, metadata !DIExpression()), !dbg !324
  %5 = getelementptr inbounds i8, i8* %.06, i64 1, !dbg !336
  call void @llvm.dbg.value(metadata i8* %5, metadata !330, metadata !DIExpression()), !dbg !324
  %6 = load i8, i8* %.06, align 1, !dbg !337
  %7 = getelementptr inbounds i8, i8* %.015, i64 1, !dbg !338
  call void @llvm.dbg.value(metadata i8* %7, metadata !327, metadata !DIExpression()), !dbg !324
  store i8 %6, i8* %.015, align 1, !dbg !339
  call void @llvm.dbg.value(metadata i64 %4, metadata !326, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !324
  %.not = icmp eq i64 %4, 0, !dbg !333
  br i1 %.not, label %._crit_edge, label %.lr.ph, !dbg !334, !llvm.loop !340

._crit_edge:                                      ; preds = %.lr.ph, %3
  ret i8* %0, !dbg !341
}

; Function Attrs: nofree noinline norecurse nosync nounwind uwtable writeonly
define dso_local i8* @memset(i8* noundef returned writeonly %0, i32 noundef %1, i64 noundef %2) local_unnamed_addr #6 !dbg !342 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !346, metadata !DIExpression()), !dbg !347
  call void @llvm.dbg.value(metadata i32 %1, metadata !348, metadata !DIExpression()), !dbg !347
  call void @llvm.dbg.value(metadata i64 %2, metadata !349, metadata !DIExpression()), !dbg !347
  call void @llvm.dbg.value(metadata i8* %0, metadata !350, metadata !DIExpression()), !dbg !347
  call void @llvm.dbg.value(metadata i64 %2, metadata !349, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !347
  %.not2 = icmp eq i64 %2, 0, !dbg !351
  br i1 %.not2, label %._crit_edge, label %.lr.ph, !dbg !352

.lr.ph:                                           ; preds = %3
  %4 = trunc i32 %1 to i8
  br label %5, !dbg !352

5:                                                ; preds = %.lr.ph, %5
  %.04 = phi i8* [ %0, %.lr.ph ], [ %7, %5 ]
  %.013 = phi i64 [ %2, %.lr.ph ], [ %6, %5 ]
  call void @llvm.dbg.value(metadata i8* %.04, metadata !350, metadata !DIExpression()), !dbg !347
  call void @llvm.dbg.value(metadata i64 %.013, metadata !349, metadata !DIExpression()), !dbg !347
  %6 = add i64 %.013, -1, !dbg !353
  call void @llvm.dbg.value(metadata i64 %6, metadata !349, metadata !DIExpression()), !dbg !347
  %7 = getelementptr inbounds i8, i8* %.04, i64 1, !dbg !354
  call void @llvm.dbg.value(metadata i8* %7, metadata !350, metadata !DIExpression()), !dbg !347
  store i8 %4, i8* %.04, align 1, !dbg !355
  call void @llvm.dbg.value(metadata i64 %6, metadata !349, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !347
  %.not = icmp eq i64 %6, 0, !dbg !351
  br i1 %.not, label %._crit_edge, label %5, !dbg !352, !llvm.loop !356

._crit_edge:                                      ; preds = %5, %3
  ret i8* %0, !dbg !358
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline noreturn nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree noinline norecurse nosync nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree noinline norecurse nosync nounwind uwtable writeonly "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0, !43, !46, !48, !50}
!llvm.ident = !{!52, !52, !52, !52, !52}
!llvm.module.flags = !{!53, !54, !55, !56, !57, !58, !59}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/052_print-802_11.c_1180_local_cpp_cwe-120-overflow/harness/driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/052_print-802_11.c_1180_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "b14a3ce1717def79190b92c2b0731d7d")
!2 = !{!3, !19, !41}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !5, line: 17, size: 352, elements: !6)
!5 = !DIFile(filename: "harness_types.h", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/052_print-802_11.c_1180_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "20fe568f1f850f50f8a9a881a1efa289")
!6 = !{!7, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18}
!7 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_bflag", scope: !4, file: !5, line: 18, baseType: !8, size: 32)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_eflag", scope: !4, file: !5, line: 18, baseType: !8, size: 32, offset: 32)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_fflag", scope: !4, file: !5, line: 18, baseType: !8, size: 32, offset: 64)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Kflag", scope: !4, file: !5, line: 18, baseType: !8, size: 32, offset: 96)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_nflag", scope: !4, file: !5, line: 18, baseType: !8, size: 32, offset: 128)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Nflag", scope: !4, file: !5, line: 19, baseType: !8, size: 32, offset: 160)
!14 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_qflag", scope: !4, file: !5, line: 19, baseType: !8, size: 32, offset: 192)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Sflag", scope: !4, file: !5, line: 19, baseType: !8, size: 32, offset: 224)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_tflag", scope: !4, file: !5, line: 19, baseType: !8, size: 32, offset: 256)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_uflag", scope: !4, file: !5, line: 19, baseType: !8, size: 32, offset: 288)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_vflag", scope: !4, file: !5, line: 20, baseType: !8, size: 32, offset: 320)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "pcap_pkthdr", file: !21, line: 245, size: 192, elements: !22)
!21 = !DIFile(filename: "/usr/include/pcap/pcap.h", directory: "", checksumkind: CSK_MD5, checksum: "df342b11dea7ddce117571532923c631")
!22 = !{!23, !33, !40}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "ts", scope: !20, file: !21, line: 246, baseType: !24, size: 128)
!24 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !25, line: 8, size: 128, elements: !26)
!25 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h", directory: "", checksumkind: CSK_MD5, checksum: "9b45d950050c215f216850b27bd1e8f3")
!26 = !{!27, !31}
!27 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !24, file: !25, line: 14, baseType: !28, size: 64)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !29, line: 160, baseType: !30)
!29 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!30 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !24, file: !25, line: 15, baseType: !32, size: 64, offset: 64)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !29, line: 162, baseType: !30)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "caplen", scope: !20, file: !21, line: 247, baseType: !34, size: 32, offset: 128)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "bpf_u_int32", file: !35, line: 98, baseType: !36)
!35 = !DIFile(filename: "/usr/include/pcap/bpf.h", directory: "", checksumkind: CSK_MD5, checksum: "e736341f781a19c2dd15abe08571efa1")
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !37, line: 35, baseType: !38)
!37 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "", checksumkind: CSK_MD5, checksum: "e62424071ad3f1b4d088c139fd9ccfd1")
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u_int", file: !29, line: 33, baseType: !39)
!39 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !20, file: !21, line: 248, baseType: !34, size: 32, offset: 160)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!43 = distinct !DICompileUnit(language: DW_LANG_C99, file: !44, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!44 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/052_print-802_11.c_1180_local_cpp_cwe-120-overflow/harness/print-802_11.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/052_print-802_11.c_1180_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "c173399a32f086e4ebd6fb4ed99f3a8d")
!45 = !{!8}
!46 = distinct !DICompileUnit(language: DW_LANG_C99, file: !47, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!47 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/052_print-802_11.c_1180_local_cpp_cwe-120-overflow/harness/smart_stubs.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/052_print-802_11.c_1180_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "bcda1acd1a733c696e028616d9d6f3b5")
!48 = distinct !DICompileUnit(language: DW_LANG_C99, file: !49, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!49 = !DIFile(filename: "/opt/tools/klee/runtime/Freestanding/memcpy.c", directory: "/opt/tools/klee/build/runtime/Freestanding", checksumkind: CSK_MD5, checksum: "8fb9a7164e167db005d7d002570068bc")
!50 = distinct !DICompileUnit(language: DW_LANG_C99, file: !51, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!51 = !DIFile(filename: "/opt/tools/klee/runtime/Freestanding/memset.c", directory: "/opt/tools/klee/build/runtime/Freestanding", checksumkind: CSK_MD5, checksum: "72c61b3d8150747c019c191df9708e2b")
!52 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!53 = !{i32 7, !"Dwarf Version", i32 5}
!54 = !{i32 2, !"Debug Info Version", i32 3}
!55 = !{i32 1, !"wchar_size", i32 4}
!56 = !{i32 7, !"PIC Level", i32 2}
!57 = !{i32 7, !"PIE Level", i32 2}
!58 = !{i32 7, !"uwtable", i32 1}
!59 = !{i32 7, !"frame-pointer", i32 2}
!60 = distinct !DISubprogram(name: "main", scope: !61, file: !61, line: 14, type: !62, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !63)
!61 = !DIFile(filename: "driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/052_print-802_11.c_1180_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "b14a3ce1717def79190b92c2b0731d7d")
!62 = !DISubroutineType(types: !45)
!63 = !{}
!64 = !DILocalVariable(name: "ndo", scope: !60, file: !61, line: 15, type: !3)
!65 = !DILocation(line: 15, column: 32, scope: !60)
!66 = !DILocation(line: 15, column: 67, scope: !60)
!67 = !DILocation(line: 15, column: 38, scope: !60)
!68 = !DILocalVariable(name: "h", scope: !60, file: !61, line: 16, type: !19)
!69 = !DILocation(line: 16, column: 25, scope: !60)
!70 = !DILocation(line: 16, column: 51, scope: !60)
!71 = !DILocation(line: 16, column: 29, scope: !60)
!72 = !DILocalVariable(name: "buf", scope: !60, file: !61, line: 17, type: !41)
!73 = !DILocation(line: 17, column: 20, scope: !60)
!74 = !DILocation(line: 17, column: 43, scope: !60)
!75 = !DILocation(line: 18, column: 24, scope: !60)
!76 = !DILocation(line: 18, column: 5, scope: !60)
!77 = !DILocation(line: 19, column: 5, scope: !60)
!78 = !DILocation(line: 19, column: 8, scope: !60)
!79 = !DILocation(line: 19, column: 12, scope: !60)
!80 = !DILocation(line: 20, column: 5, scope: !60)
!81 = !DILocation(line: 20, column: 8, scope: !60)
!82 = !DILocation(line: 20, column: 15, scope: !60)
!83 = !DILocation(line: 21, column: 25, scope: !60)
!84 = !DILocation(line: 21, column: 30, scope: !60)
!85 = !DILocation(line: 21, column: 33, scope: !60)
!86 = !DILocation(line: 21, column: 5, scope: !60)
!87 = distinct !DISubprogram(name: "handle_beacon", scope: !88, file: !88, line: 40, type: !89, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !63)
!88 = !DIFile(filename: "print-802_11.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/052_print-802_11.c_1180_local_cpp_cwe-120-overflow/harness", checksumkind: CSK_MD5, checksum: "c173399a32f086e4ebd6fb4ed99f3a8d")
!89 = !DISubroutineType(types: !90)
!90 = !{null, !91, !105, !108, !108, !8, !8}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !88, line: 15, size: 352, elements: !93)
!93 = !{!94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104}
!94 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_bflag", scope: !92, file: !88, line: 16, baseType: !8, size: 32)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_eflag", scope: !92, file: !88, line: 16, baseType: !8, size: 32, offset: 32)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_fflag", scope: !92, file: !88, line: 16, baseType: !8, size: 32, offset: 64)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Kflag", scope: !92, file: !88, line: 16, baseType: !8, size: 32, offset: 96)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_nflag", scope: !92, file: !88, line: 16, baseType: !8, size: 32, offset: 128)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Nflag", scope: !92, file: !88, line: 17, baseType: !8, size: 32, offset: 160)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_qflag", scope: !92, file: !88, line: 17, baseType: !8, size: 32, offset: 192)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Sflag", scope: !92, file: !88, line: 17, baseType: !8, size: 32, offset: 224)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_tflag", scope: !92, file: !88, line: 17, baseType: !8, size: 32, offset: 256)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_uflag", scope: !92, file: !88, line: 17, baseType: !8, size: 32, offset: 288)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_vflag", scope: !92, file: !88, line: 18, baseType: !8, size: 32, offset: 320)
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !107)
!107 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !88, line: 12, baseType: !42)
!108 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !88, line: 13, baseType: !39)
!109 = !DILocalVariable(name: "ndo", arg: 1, scope: !87, file: !88, line: 40, type: !91)
!110 = !DILocation(line: 40, column: 47, scope: !87)
!111 = !DILocalVariable(name: "p", arg: 2, scope: !87, file: !88, line: 40, type: !105)
!112 = !DILocation(line: 40, column: 66, scope: !87)
!113 = !DILocalVariable(name: "len", arg: 3, scope: !87, file: !88, line: 40, type: !108)
!114 = !DILocation(line: 40, column: 75, scope: !87)
!115 = !DILocalVariable(name: "caplen", arg: 4, scope: !87, file: !88, line: 40, type: !108)
!116 = !DILocation(line: 40, column: 86, scope: !87)
!117 = !DILocalVariable(name: "arg1", arg: 5, scope: !87, file: !88, line: 40, type: !8)
!118 = !DILocation(line: 40, column: 98, scope: !87)
!119 = !DILocalVariable(name: "arg2", arg: 6, scope: !87, file: !88, line: 40, type: !8)
!120 = !DILocation(line: 40, column: 108, scope: !87)
!121 = !DILocalVariable(name: "body", scope: !87, file: !88, line: 41, type: !122)
!122 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "mgmt_body_t", file: !88, line: 29, size: 2112, elements: !123)
!123 = !{!124, !125}
!124 = !DIDerivedType(tag: DW_TAG_member, name: "tim_present", scope: !122, file: !88, line: 30, baseType: !8, size: 32)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "tim", scope: !122, file: !88, line: 31, baseType: !126, size: 2080, offset: 32)
!126 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tim_t", file: !88, line: 21, size: 2080, elements: !127)
!127 = !{!128, !129, !130, !131, !132}
!128 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !126, file: !88, line: 22, baseType: !107, size: 8)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "length", scope: !126, file: !88, line: 23, baseType: !107, size: 8, offset: 8)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !126, file: !88, line: 24, baseType: !107, size: 8, offset: 16)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "period", scope: !126, file: !88, line: 25, baseType: !107, size: 8, offset: 24)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "bitmap", scope: !126, file: !88, line: 26, baseType: !133, size: 2048, offset: 32)
!133 = !DICompositeType(tag: DW_TAG_array_type, baseType: !107, size: 2048, elements: !134)
!134 = !{!135}
!135 = !DISubrange(count: 256)
!136 = !DILocation(line: 41, column: 24, scope: !87)
!137 = !DILocation(line: 42, column: 5, scope: !87)
!138 = !DILocation(line: 43, column: 20, scope: !87)
!139 = !DILocation(line: 43, column: 32, scope: !87)
!140 = !DILocation(line: 43, column: 38, scope: !87)
!141 = !DILocation(line: 43, column: 5, scope: !87)
!142 = distinct !DISubprogram(name: "parse_elements", scope: !88, file: !88, line: 69, type: !143, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !63)
!143 = !DISubroutineType(types: !144)
!144 = !{!8, !91, !145, !105, !8, !108}
!145 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !122, size: 64)
!146 = !DILocalVariable(name: "ndo", arg: 1, scope: !142, file: !88, line: 69, type: !91)
!147 = !DILocation(line: 69, column: 54, scope: !142)
!148 = !DILocalVariable(name: "pbody", arg: 2, scope: !142, file: !88, line: 70, type: !145)
!149 = !DILocation(line: 70, column: 36, scope: !142)
!150 = !DILocalVariable(name: "p", arg: 3, scope: !142, file: !88, line: 70, type: !105)
!151 = !DILocation(line: 70, column: 57, scope: !142)
!152 = !DILocalVariable(name: "offset", arg: 4, scope: !142, file: !88, line: 70, type: !8)
!153 = !DILocation(line: 70, column: 64, scope: !142)
!154 = !DILocalVariable(name: "length", arg: 5, scope: !142, file: !88, line: 71, type: !108)
!155 = !DILocation(line: 71, column: 22, scope: !142)
!156 = !DILocation(line: 73, column: 5, scope: !142)
!157 = !DILocalVariable(name: "elementlen", scope: !142, file: !88, line: 74, type: !108)
!158 = !DILocation(line: 74, column: 8, scope: !142)
!159 = !DILocalVariable(name: "tim", scope: !142, file: !88, line: 75, type: !126)
!160 = !DILocation(line: 75, column: 15, scope: !142)
!161 = !DILocation(line: 77, column: 2, scope: !142)
!162 = !DILocation(line: 77, column: 9, scope: !142)
!163 = !DILocation(line: 77, column: 16, scope: !142)
!164 = !DILocation(line: 78, column: 13, scope: !165)
!165 = distinct !DILexicalBlock(scope: !142, file: !88, line: 77, column: 21)
!166 = !DILocation(line: 78, column: 17, scope: !165)
!167 = !DILocation(line: 78, column: 15, scope: !165)
!168 = !DILocation(line: 78, column: 11, scope: !165)
!169 = !DILocation(line: 78, column: 3, scope: !165)
!170 = !DILocation(line: 80, column: 18, scope: !171)
!171 = distinct !DILexicalBlock(scope: !165, file: !88, line: 78, column: 26)
!172 = !DILocation(line: 80, column: 16, scope: !171)
!173 = !DILocation(line: 80, column: 11, scope: !171)
!174 = !DILocation(line: 81, column: 18, scope: !171)
!175 = !DILocation(line: 81, column: 16, scope: !171)
!176 = !DILocation(line: 81, column: 11, scope: !171)
!177 = !DILocation(line: 82, column: 4, scope: !171)
!178 = !DILocation(line: 84, column: 7, scope: !171)
!179 = !DILocation(line: 85, column: 4, scope: !171)
!180 = !DILocation(line: 85, column: 17, scope: !171)
!181 = !DILocation(line: 85, column: 21, scope: !171)
!182 = !DILocation(line: 85, column: 19, scope: !171)
!183 = !DILocation(line: 86, column: 11, scope: !171)
!184 = !DILocation(line: 87, column: 11, scope: !171)
!185 = !DILocation(line: 88, column: 12, scope: !186)
!186 = distinct !DILexicalBlock(scope: !171, file: !88, line: 88, column: 8)
!187 = !DILocation(line: 88, column: 8, scope: !186)
!188 = !DILocation(line: 88, column: 19, scope: !186)
!189 = !DILocation(line: 88, column: 8, scope: !171)
!190 = !DILocation(line: 89, column: 19, scope: !191)
!191 = distinct !DILexicalBlock(scope: !186, file: !88, line: 88, column: 25)
!192 = !DILocation(line: 89, column: 15, scope: !191)
!193 = !DILocation(line: 89, column: 12, scope: !191)
!194 = !DILocation(line: 90, column: 19, scope: !191)
!195 = !DILocation(line: 90, column: 15, scope: !191)
!196 = !DILocation(line: 90, column: 12, scope: !191)
!197 = !DILocation(line: 91, column: 5, scope: !191)
!198 = !DILocation(line: 93, column: 12, scope: !199)
!199 = distinct !DILexicalBlock(scope: !171, file: !88, line: 93, column: 8)
!200 = !DILocation(line: 93, column: 8, scope: !199)
!201 = !DILocation(line: 93, column: 19, scope: !199)
!202 = !DILocation(line: 95, column: 16, scope: !171)
!203 = !DILocation(line: 95, column: 23, scope: !171)
!204 = !DILocation(line: 95, column: 27, scope: !171)
!205 = !DILocation(line: 95, column: 25, scope: !171)
!206 = !DILocation(line: 95, column: 4, scope: !171)
!207 = !DILocation(line: 96, column: 11, scope: !171)
!208 = !DILocation(line: 97, column: 11, scope: !171)
!209 = !DILocation(line: 99, column: 15, scope: !171)
!210 = !DILocation(line: 99, column: 4, scope: !171)
!211 = !DILocation(line: 99, column: 23, scope: !171)
!212 = !DILocation(line: 99, column: 27, scope: !171)
!213 = !DILocation(line: 99, column: 25, scope: !171)
!214 = !DILocation(line: 99, column: 39, scope: !171)
!215 = !DILocation(line: 99, column: 35, scope: !171)
!216 = !DILocation(line: 99, column: 46, scope: !171)
!217 = !DILocation(line: 100, column: 18, scope: !171)
!218 = !DILocation(line: 100, column: 14, scope: !171)
!219 = !DILocation(line: 100, column: 25, scope: !171)
!220 = !DILocation(line: 100, column: 11, scope: !171)
!221 = !DILocation(line: 101, column: 18, scope: !171)
!222 = !DILocation(line: 101, column: 14, scope: !171)
!223 = !DILocation(line: 101, column: 25, scope: !171)
!224 = !DILocation(line: 101, column: 11, scope: !171)
!225 = !DILocation(line: 102, column: 9, scope: !226)
!226 = distinct !DILexicalBlock(scope: !171, file: !88, line: 102, column: 8)
!227 = !DILocation(line: 102, column: 16, scope: !226)
!228 = !DILocation(line: 102, column: 8, scope: !171)
!229 = !DILocation(line: 103, column: 5, scope: !230)
!230 = distinct !DILexicalBlock(scope: !226, file: !88, line: 102, column: 29)
!231 = !DILocation(line: 103, column: 12, scope: !230)
!232 = !DILocation(line: 103, column: 18, scope: !230)
!233 = !DILocation(line: 104, column: 5, scope: !230)
!234 = !DILocation(line: 104, column: 12, scope: !230)
!235 = !DILocation(line: 104, column: 24, scope: !230)
!236 = !DILocation(line: 105, column: 4, scope: !230)
!237 = !DILocation(line: 106, column: 4, scope: !171)
!238 = distinct !{!238, !161, !239, !240}
!239 = !DILocation(line: 108, column: 2, scope: !142)
!240 = !{!"llvm.loop.mustprogress"}
!241 = !DILocation(line: 109, column: 5, scope: !142)
!242 = !DILocation(line: 110, column: 2, scope: !142)
!243 = distinct !DISubprogram(name: "mgmt_body_print", scope: !88, file: !88, line: 48, type: !89, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !63)
!244 = !DILocalVariable(name: "ndo", arg: 1, scope: !243, file: !88, line: 48, type: !91)
!245 = !DILocation(line: 48, column: 49, scope: !243)
!246 = !DILocalVariable(name: "p", arg: 2, scope: !243, file: !88, line: 48, type: !105)
!247 = !DILocation(line: 48, column: 68, scope: !243)
!248 = !DILocalVariable(name: "len", arg: 3, scope: !243, file: !88, line: 48, type: !108)
!249 = !DILocation(line: 48, column: 77, scope: !243)
!250 = !DILocalVariable(name: "caplen", arg: 4, scope: !243, file: !88, line: 48, type: !108)
!251 = !DILocation(line: 48, column: 88, scope: !243)
!252 = !DILocalVariable(name: "arg1", arg: 5, scope: !243, file: !88, line: 48, type: !8)
!253 = !DILocation(line: 48, column: 100, scope: !243)
!254 = !DILocalVariable(name: "arg2", arg: 6, scope: !243, file: !88, line: 48, type: !8)
!255 = !DILocation(line: 48, column: 110, scope: !243)
!256 = !DILocation(line: 49, column: 19, scope: !243)
!257 = !DILocation(line: 49, column: 24, scope: !243)
!258 = !DILocation(line: 49, column: 27, scope: !243)
!259 = !DILocation(line: 49, column: 32, scope: !243)
!260 = !DILocation(line: 49, column: 40, scope: !243)
!261 = !DILocation(line: 49, column: 46, scope: !243)
!262 = !DILocation(line: 49, column: 5, scope: !243)
!263 = distinct !DISubprogram(name: "ieee802_11_print", scope: !88, file: !88, line: 55, type: !264, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !63)
!264 = !DISubroutineType(types: !265)
!265 = !{!108, !91, !105, !108, !108, !8, !8}
!266 = !DILocalVariable(name: "ndo", arg: 1, scope: !263, file: !88, line: 55, type: !91)
!267 = !DILocation(line: 55, column: 51, scope: !263)
!268 = !DILocalVariable(name: "p", arg: 2, scope: !263, file: !88, line: 55, type: !105)
!269 = !DILocation(line: 55, column: 70, scope: !263)
!270 = !DILocalVariable(name: "len", arg: 3, scope: !263, file: !88, line: 55, type: !108)
!271 = !DILocation(line: 55, column: 79, scope: !263)
!272 = !DILocalVariable(name: "caplen", arg: 4, scope: !263, file: !88, line: 55, type: !108)
!273 = !DILocation(line: 55, column: 90, scope: !263)
!274 = !DILocalVariable(name: "arg1", arg: 5, scope: !263, file: !88, line: 55, type: !8)
!275 = !DILocation(line: 55, column: 102, scope: !263)
!276 = !DILocalVariable(name: "arg2", arg: 6, scope: !263, file: !88, line: 55, type: !8)
!277 = !DILocation(line: 55, column: 112, scope: !263)
!278 = !DILocation(line: 56, column: 21, scope: !263)
!279 = !DILocation(line: 56, column: 26, scope: !263)
!280 = !DILocation(line: 56, column: 29, scope: !263)
!281 = !DILocation(line: 56, column: 34, scope: !263)
!282 = !DILocation(line: 56, column: 42, scope: !263)
!283 = !DILocation(line: 56, column: 48, scope: !263)
!284 = !DILocation(line: 56, column: 5, scope: !263)
!285 = distinct !DISubprogram(name: "ieee802_11_if_print", scope: !88, file: !88, line: 62, type: !286, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !63)
!286 = !DISubroutineType(types: !287)
!287 = !{!108, !91, !288, !105}
!288 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !289, size: 64)
!289 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !290)
!290 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "pcap_pkthdr", file: !21, line: 245, size: 192, elements: !291)
!291 = !{!292, !297, !298}
!292 = !DIDerivedType(tag: DW_TAG_member, name: "ts", scope: !290, file: !21, line: 246, baseType: !293, size: 128)
!293 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !25, line: 8, size: 128, elements: !294)
!294 = !{!295, !296}
!295 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !293, file: !25, line: 14, baseType: !28, size: 64)
!296 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !293, file: !25, line: 15, baseType: !32, size: 64, offset: 64)
!297 = !DIDerivedType(tag: DW_TAG_member, name: "caplen", scope: !290, file: !21, line: 247, baseType: !34, size: 32, offset: 128)
!298 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !290, file: !21, line: 248, baseType: !34, size: 32, offset: 160)
!299 = !DILocalVariable(name: "ndo", arg: 1, scope: !285, file: !88, line: 62, type: !91)
!300 = !DILocation(line: 62, column: 54, scope: !285)
!301 = !DILocalVariable(name: "h", arg: 2, scope: !285, file: !88, line: 63, type: !288)
!302 = !DILocation(line: 63, column: 47, scope: !285)
!303 = !DILocalVariable(name: "p", arg: 3, scope: !285, file: !88, line: 63, type: !105)
!304 = !DILocation(line: 63, column: 64, scope: !285)
!305 = !DILocation(line: 65, column: 5, scope: !285)
!306 = !DILocation(line: 66, column: 26, scope: !285)
!307 = !DILocation(line: 66, column: 31, scope: !285)
!308 = !DILocation(line: 66, column: 34, scope: !285)
!309 = !DILocation(line: 66, column: 37, scope: !285)
!310 = !DILocation(line: 66, column: 42, scope: !285)
!311 = !DILocation(line: 66, column: 45, scope: !285)
!312 = !DILocation(line: 66, column: 9, scope: !285)
!313 = distinct !DISubprogram(name: "memcpy", scope: !314, file: !314, line: 12, type: !315, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !63)
!314 = !DIFile(filename: "runtime/Freestanding/memcpy.c", directory: "/opt/tools/klee", checksumkind: CSK_MD5, checksum: "8fb9a7164e167db005d7d002570068bc")
!315 = !DISubroutineType(types: !316)
!316 = !{!317, !317, !318, !320}
!317 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!318 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !319, size: 64)
!319 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!320 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !321, line: 46, baseType: !322)
!321 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!322 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!323 = !DILocalVariable(name: "destaddr", arg: 1, scope: !313, file: !314, line: 12, type: !317)
!324 = !DILocation(line: 0, scope: !313)
!325 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !313, file: !314, line: 12, type: !318)
!326 = !DILocalVariable(name: "len", arg: 3, scope: !313, file: !314, line: 12, type: !320)
!327 = !DILocalVariable(name: "dest", scope: !313, file: !314, line: 13, type: !328)
!328 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !329, size: 64)
!329 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!330 = !DILocalVariable(name: "src", scope: !313, file: !314, line: 14, type: !331)
!331 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !332, size: 64)
!332 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !329)
!333 = !DILocation(line: 16, column: 16, scope: !313)
!334 = !DILocation(line: 16, column: 3, scope: !313)
!335 = !DILocation(line: 16, column: 13, scope: !313)
!336 = !DILocation(line: 17, column: 19, scope: !313)
!337 = !DILocation(line: 17, column: 15, scope: !313)
!338 = !DILocation(line: 17, column: 10, scope: !313)
!339 = !DILocation(line: 17, column: 13, scope: !313)
!340 = distinct !{!340, !334, !336, !240}
!341 = !DILocation(line: 18, column: 3, scope: !313)
!342 = distinct !DISubprogram(name: "memset", scope: !343, file: !343, line: 12, type: !344, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !63)
!343 = !DIFile(filename: "runtime/Freestanding/memset.c", directory: "/opt/tools/klee", checksumkind: CSK_MD5, checksum: "72c61b3d8150747c019c191df9708e2b")
!344 = !DISubroutineType(types: !345)
!345 = !{!317, !317, !8, !320}
!346 = !DILocalVariable(name: "dst", arg: 1, scope: !342, file: !343, line: 12, type: !317)
!347 = !DILocation(line: 0, scope: !342)
!348 = !DILocalVariable(name: "s", arg: 2, scope: !342, file: !343, line: 12, type: !8)
!349 = !DILocalVariable(name: "count", arg: 3, scope: !342, file: !343, line: 12, type: !320)
!350 = !DILocalVariable(name: "a", scope: !342, file: !343, line: 13, type: !328)
!351 = !DILocation(line: 14, column: 18, scope: !342)
!352 = !DILocation(line: 14, column: 3, scope: !342)
!353 = !DILocation(line: 14, column: 15, scope: !342)
!354 = !DILocation(line: 15, column: 7, scope: !342)
!355 = !DILocation(line: 15, column: 10, scope: !342)
!356 = distinct !{!356, !352, !357, !240}
!357 = !DILocation(line: 15, column: 12, scope: !342)
!358 = !DILocation(line: 16, column: 3, scope: !342)
