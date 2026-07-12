; ModuleID = '/app/se_runs/sailor_engine/tcpdump-4.9.2/233_print-802_11.c_1596_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness/slice.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.netdissect_options = type { i32, i8*, i32, i32 }
%struct.pcap_pkthdr = type { i32, i32 }
%struct.lladdr_info = type { i8* }

@.str = private unnamed_addr constant [4 x i8] c"pkt\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"instate\00", align 1
@.str.2 = private unnamed_addr constant [32 x i8] c"SPINE_PROBE:handle_action:ENTRY\00", align 1
@.str.1.3 = private unnamed_addr constant [34 x i8] c"SPINE_PROBE:handle_action:CASE_14\00", align 1
@.str.2.4 = private unnamed_addr constant [34 x i8] c"SPINE_PROBE:handle_action:CASE_15\00", align 1
@.str.3 = private unnamed_addr constant [27 x i8] c"0 && \22SAILOR_SINK_REACHED\22\00", align 1
@.str.4 = private unnamed_addr constant [143 x i8] c"/app/se_runs/sailor_engine/tcpdump-4.9.2/233_print-802_11.c_1596_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness/print-802_11.c\00", align 1
@__PRETTY_FUNCTION__.handle_action = private unnamed_addr constant [80 x i8] c"int handle_action(netdissect_options *, const uint8_t *, const u_char *, u_int)\00", align 1
@.str.5 = private unnamed_addr constant [35 x i8] c"SPINE_PROBE:ieee802_11_print:ENTRY\00", align 1
@.str.6 = private unnamed_addr constant [38 x i8] c"SPINE_PROBE:ieee802_11_if_print:ENTRY\00", align 1
@.str.7 = private unnamed_addr constant [34 x i8] c"SPINE_PROBE:mgmt_body_print:ENTRY\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !37 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.netdissect_options*, align 8
  %3 = alloca %struct.pcap_pkthdr*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %2, metadata !41, metadata !DIExpression()), !dbg !42
  %6 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 24) #6, !dbg !43
  %7 = bitcast i8* %6 to %struct.netdissect_options*, !dbg !44
  store %struct.netdissect_options* %7, %struct.netdissect_options** %2, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata %struct.pcap_pkthdr** %3, metadata !45, metadata !DIExpression()), !dbg !46
  %8 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 8) #6, !dbg !47
  %9 = bitcast i8* %8 to %struct.pcap_pkthdr*, !dbg !48
  store %struct.pcap_pkthdr* %9, %struct.pcap_pkthdr** %3, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i8** %4, metadata !49, metadata !DIExpression()), !dbg !50
  %10 = call noalias i8* @calloc(i64 noundef 4, i64 noundef 1) #6, !dbg !51
  store i8* %10, i8** %4, align 8, !dbg !50
  %11 = load i8*, i8** %4, align 8, !dbg !52
  call void @klee_make_symbolic(i8* noundef %11, i64 noundef 4, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !53
  %12 = load i8*, i8** %4, align 8, !dbg !54
  %13 = getelementptr inbounds i8, i8* %12, i64 0, !dbg !54
  store i8 3, i8* %13, align 1, !dbg !55
  %14 = load %struct.pcap_pkthdr*, %struct.pcap_pkthdr** %3, align 8, !dbg !56
  %15 = getelementptr inbounds %struct.pcap_pkthdr, %struct.pcap_pkthdr* %14, i32 0, i32 0, !dbg !57
  store i32 4, i32* %15, align 4, !dbg !58
  %16 = load %struct.pcap_pkthdr*, %struct.pcap_pkthdr** %3, align 8, !dbg !59
  %17 = getelementptr inbounds %struct.pcap_pkthdr, %struct.pcap_pkthdr* %16, i32 0, i32 1, !dbg !60
  store i32 4, i32* %17, align 4, !dbg !61
  call void @llvm.dbg.declare(metadata i32* %5, metadata !62, metadata !DIExpression()), !dbg !63
  %18 = bitcast i32* %5 to i8*, !dbg !64
  call void @klee_make_symbolic(i8* noundef %18, i64 noundef 4, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  %19 = load i32, i32* %5, align 4, !dbg !66
  %20 = icmp eq i32 %19, 3, !dbg !67
  %21 = zext i1 %20 to i32, !dbg !67
  %22 = zext i32 %21 to i64
  call void @klee_assume(i64 noundef %22), !dbg !68
  %23 = load i32, i32* %5, align 4, !dbg !69
  %24 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !70
  %25 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %24, i32 0, i32 0, !dbg !71
  store i32 %23, i32* %25, align 8, !dbg !72
  %26 = load i8*, i8** %4, align 8, !dbg !73
  %27 = getelementptr inbounds i8, i8* %26, i64 4, !dbg !74
  %28 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !75
  %29 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %28, i32 0, i32 1, !dbg !76
  store i8* %27, i8** %29, align 8, !dbg !77
  %30 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !78
  %31 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %30, i32 0, i32 2, !dbg !79
  store i32 0, i32* %31, align 8, !dbg !80
  %32 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !81
  %33 = getelementptr inbounds %struct.netdissect_options, %struct.netdissect_options* %32, i32 0, i32 3, !dbg !82
  store i32 0, i32* %33, align 4, !dbg !83
  %34 = load %struct.netdissect_options*, %struct.netdissect_options** %2, align 8, !dbg !84
  %35 = load %struct.pcap_pkthdr*, %struct.pcap_pkthdr** %3, align 8, !dbg !85
  %36 = load i8*, i8** %4, align 8, !dbg !86
  %37 = call i32 (%struct.netdissect_options*, %struct.pcap_pkthdr*, i8*, ...) bitcast (i32 (%struct.netdissect_options*, %struct.pcap_pkthdr*, i8*)* @ieee802_11_if_print to i32 (%struct.netdissect_options*, %struct.pcap_pkthdr*, i8*, ...)*)(%struct.netdissect_options* noundef %34, %struct.pcap_pkthdr* noundef %35, i8* noundef %36), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

declare void @klee_make_symbolic(i8* noundef, i64 noundef, i8* noundef) local_unnamed_addr #3

declare void @klee_assume(i64 noundef) local_unnamed_addr #3

; Function Attrs: noinline noreturn nounwind optnone uwtable
define internal fastcc void @handle_action(%struct.netdissect_options* noundef %0, i8* noundef %1, i8* noundef %2, i32 noundef %3) unnamed_addr #4 !dbg !89 {
  %5 = alloca %struct.netdissect_options*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  store %struct.netdissect_options* %0, %struct.netdissect_options** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %5, metadata !112, metadata !DIExpression()), !dbg !113
  store i8* %1, i8** %6, align 8
  call void @llvm.dbg.declare(metadata i8** %6, metadata !114, metadata !DIExpression()), !dbg !115
  store i8* %2, i8** %7, align 8
  call void @llvm.dbg.declare(metadata i8** %7, metadata !116, metadata !DIExpression()), !dbg !117
  store i32 %3, i32* %8, align 4
  call void @llvm.dbg.declare(metadata i32* %8, metadata !118, metadata !DIExpression()), !dbg !119
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0)), !dbg !120
  %9 = load i8*, i8** %6, align 8, !dbg !121
  %10 = getelementptr inbounds i8, i8* %9, i64 0, !dbg !121
  %11 = load i8, i8* %10, align 1, !dbg !121
  %12 = zext i8 %11 to i32, !dbg !121
  switch i32 %12, label %19 [
    i32 3, label %13
    i32 7, label %14
    i32 13, label %15
    i32 14, label %16
    i32 15, label %17
    i32 127, label %18
  ], !dbg !122

13:                                               ; preds = %4
  br label %20, !dbg !123

14:                                               ; preds = %4
  br label %20, !dbg !125

15:                                               ; preds = %4
  br label %20, !dbg !126

16:                                               ; preds = %4
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @.str.1.3, i64 0, i64 0)), !dbg !127
  br label %20, !dbg !128

17:                                               ; preds = %4
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2.4, i64 0, i64 0)), !dbg !129
  br label %20, !dbg !130

18:                                               ; preds = %4
  br label %20, !dbg !131

19:                                               ; preds = %4
  br label %20, !dbg !132

20:                                               ; preds = %19, %18, %17, %16, %15, %14, %13
  %21 = call i32 (i8*, i8*, i32, i8*, ...) bitcast (i32 (...)* @__assert_fail to i32 (i8*, i8*, i32, i8*, ...)*)(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.3, i64 0, i64 0), i8* noundef getelementptr inbounds ([143 x i8], [143 x i8]* @.str.4, i64 0, i64 0), i32 noundef 73, i8* noundef getelementptr inbounds ([80 x i8], [80 x i8]* @__PRETTY_FUNCTION__.handle_action, i64 0, i64 0)), !dbg !133
  unreachable, !dbg !134
}

declare void @klee_warning_once(i8* noundef) local_unnamed_addr #3

; Function Attrs: noreturn
declare i32 @__assert_fail(...) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc i32 @ieee802_11_print(%struct.netdissect_options* noundef %0, i8* noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #0 !dbg !135 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.netdissect_options*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i16, align 2
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca %struct.lladdr_info, align 8
  %17 = alloca %struct.lladdr_info, align 8
  %18 = alloca i32, align 4
  store %struct.netdissect_options* %0, %struct.netdissect_options** %6, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %6, metadata !138, metadata !DIExpression()), !dbg !139
  store i8* %1, i8** %7, align 8
  call void @llvm.dbg.declare(metadata i8** %7, metadata !140, metadata !DIExpression()), !dbg !141
  store i32 %2, i32* %8, align 4
  call void @llvm.dbg.declare(metadata i32* %8, metadata !142, metadata !DIExpression()), !dbg !143
  store i32 %3, i32* %9, align 4
  call void @llvm.dbg.declare(metadata i32* %9, metadata !144, metadata !DIExpression()), !dbg !145
  store i32 0, i32* %10, align 4
  call void @llvm.dbg.declare(metadata i32* %10, metadata !146, metadata !DIExpression()), !dbg !147
  store i32 0, i32* %11, align 4
  call void @llvm.dbg.declare(metadata i32* %11, metadata !148, metadata !DIExpression()), !dbg !149
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([35 x i8], [35 x i8]* @.str.5, i64 0, i64 0)), !dbg !150
  call void @llvm.dbg.declare(metadata i16* %12, metadata !151, metadata !DIExpression()), !dbg !155
  store i16 0, i16* %12, align 2, !dbg !155
  call void @llvm.dbg.declare(metadata i32* %13, metadata !156, metadata !DIExpression()), !dbg !157
  %19 = load i32, i32* %9, align 4, !dbg !158
  store i32 %19, i32* %13, align 4, !dbg !157
  call void @llvm.dbg.declare(metadata i32* %14, metadata !159, metadata !DIExpression()), !dbg !160
  store i32 0, i32* %14, align 4, !dbg !160
  call void @llvm.dbg.declare(metadata i32* %15, metadata !161, metadata !DIExpression()), !dbg !162
  store i32 0, i32* %15, align 4, !dbg !162
  call void @llvm.dbg.declare(metadata %struct.lladdr_info* %16, metadata !163, metadata !DIExpression()), !dbg !167
  call void @llvm.dbg.declare(metadata %struct.lladdr_info* %17, metadata !168, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.declare(metadata i32* %18, metadata !170, metadata !DIExpression()), !dbg !171
  %20 = load i32, i32* %13, align 4, !dbg !172
  %21 = icmp ult i32 %20, 2, !dbg !174
  br i1 %21, label %22, label %24, !dbg !175

22:                                               ; preds = %4
  %23 = load i32, i32* %9, align 4, !dbg !176
  store i32 %23, i32* %5, align 4, !dbg !177
  br label %43, !dbg !177

24:                                               ; preds = %4
  %25 = load i32, i32* %14, align 4, !dbg !178
  %26 = load i8*, i8** %7, align 8, !dbg !179
  %27 = zext i32 %25 to i64, !dbg !179
  %28 = getelementptr inbounds i8, i8* %26, i64 %27, !dbg !179
  store i8* %28, i8** %7, align 8, !dbg !179
  %29 = load i8*, i8** %7, align 8, !dbg !180
  %30 = load i32, i32* %14, align 4, !dbg !181
  %31 = zext i32 %30 to i64, !dbg !182
  %32 = sub i64 0, %31, !dbg !182
  %33 = getelementptr inbounds i8, i8* %29, i64 %32, !dbg !182
  %34 = bitcast %struct.lladdr_info* %16 to %struct.lladdr_info*, !dbg !183
  %35 = getelementptr inbounds %struct.lladdr_info, %struct.lladdr_info* %17, i32 0, i32 0, !dbg !184
  %36 = bitcast i8** %35 to %struct.lladdr_info*, !dbg !185
  call fastcc void @get_mgmt_src_dst_mac(i8* noundef %33, %struct.lladdr_info* noundef %34, %struct.lladdr_info* noundef %36), !dbg !186
  %37 = load %struct.netdissect_options*, %struct.netdissect_options** %6, align 8, !dbg !187
  %38 = load i16, i16* %12, align 2, !dbg !189
  %39 = getelementptr inbounds %struct.lladdr_info, %struct.lladdr_info* %16, i32 0, i32 0, !dbg !190
  %40 = load i8*, i8** %39, align 8, !dbg !190
  %41 = load i8*, i8** %7, align 8, !dbg !191
  %42 = load i32, i32* %8, align 4, !dbg !192
  call fastcc void @mgmt_body_print(%struct.netdissect_options* noundef %37, i16 noundef zeroext %38, i8* noundef %40, i8* noundef %41, i32 noundef %42), !dbg !193
  unreachable

43:                                               ; preds = %22
  %44 = load i32, i32* %5, align 4, !dbg !194
  ret i32 %44, !dbg !194
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @get_mgmt_src_dst_mac(i8* noundef %0, %struct.lladdr_info* noundef %1, %struct.lladdr_info* noundef %2) unnamed_addr #0 !dbg !195 {
  %4 = alloca i8*, align 8
  %5 = alloca %struct.lladdr_info*, align 8
  %6 = alloca %struct.lladdr_info*, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !202, metadata !DIExpression()), !dbg !203
  store %struct.lladdr_info* %1, %struct.lladdr_info** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.lladdr_info** %5, metadata !204, metadata !DIExpression()), !dbg !205
  store %struct.lladdr_info* %2, %struct.lladdr_info** %6, align 8
  call void @llvm.dbg.declare(metadata %struct.lladdr_info** %6, metadata !206, metadata !DIExpression()), !dbg !207
  ret void, !dbg !208
}

; Function Attrs: noinline noreturn nounwind optnone uwtable
define internal fastcc void @mgmt_body_print(%struct.netdissect_options* noundef %0, i16 noundef zeroext %1, i8* noundef %2, i8* noundef %3, i32 noundef %4) unnamed_addr #4 !dbg !209 {
  %6 = alloca %struct.netdissect_options*, align 8
  %7 = alloca i16, align 2
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  store %struct.netdissect_options* %0, %struct.netdissect_options** %6, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %6, metadata !212, metadata !DIExpression()), !dbg !213
  store i16 %1, i16* %7, align 2
  call void @llvm.dbg.declare(metadata i16* %7, metadata !214, metadata !DIExpression()), !dbg !215
  store i8* %2, i8** %8, align 8
  call void @llvm.dbg.declare(metadata i8** %8, metadata !216, metadata !DIExpression()), !dbg !217
  store i8* %3, i8** %9, align 8
  call void @llvm.dbg.declare(metadata i8** %9, metadata !218, metadata !DIExpression()), !dbg !219
  store i32 %4, i32* %10, align 4
  call void @llvm.dbg.declare(metadata i32* %10, metadata !220, metadata !DIExpression()), !dbg !221
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @.str.7, i64 0, i64 0)), !dbg !222
  %11 = load %struct.netdissect_options*, %struct.netdissect_options** %6, align 8, !dbg !223
  %12 = load i8*, i8** %8, align 8, !dbg !224
  %13 = load i8*, i8** %9, align 8, !dbg !225
  %14 = load i32, i32* %10, align 4, !dbg !226
  call fastcc void @handle_action(%struct.netdissect_options* noundef %11, i8* noundef %12, i8* noundef %13, i32 noundef %14), !dbg !227
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @ieee802_11_if_print(%struct.netdissect_options* noundef %0, %struct.pcap_pkthdr* noundef %1, i8* noundef %2) unnamed_addr #0 !dbg !228 {
  %4 = alloca %struct.netdissect_options*, align 8
  %5 = alloca %struct.pcap_pkthdr*, align 8
  %6 = alloca i8*, align 8
  store %struct.netdissect_options* %0, %struct.netdissect_options** %4, align 8
  call void @llvm.dbg.declare(metadata %struct.netdissect_options** %4, metadata !237, metadata !DIExpression()), !dbg !238
  store %struct.pcap_pkthdr* %1, %struct.pcap_pkthdr** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.pcap_pkthdr** %5, metadata !239, metadata !DIExpression()), !dbg !240
  store i8* %2, i8** %6, align 8
  call void @llvm.dbg.declare(metadata i8** %6, metadata !241, metadata !DIExpression()), !dbg !242
  call void @klee_warning_once(i8* noundef getelementptr inbounds ([38 x i8], [38 x i8]* @.str.6, i64 0, i64 0)), !dbg !243
  %7 = load %struct.netdissect_options*, %struct.netdissect_options** %4, align 8, !dbg !244
  %8 = load i8*, i8** %6, align 8, !dbg !245
  %9 = load %struct.pcap_pkthdr*, %struct.pcap_pkthdr** %5, align 8, !dbg !246
  %10 = getelementptr inbounds %struct.pcap_pkthdr, %struct.pcap_pkthdr* %9, i32 0, i32 0, !dbg !247
  %11 = load i32, i32* %10, align 4, !dbg !247
  %12 = load %struct.pcap_pkthdr*, %struct.pcap_pkthdr** %5, align 8, !dbg !248
  %13 = getelementptr inbounds %struct.pcap_pkthdr, %struct.pcap_pkthdr* %12, i32 0, i32 1, !dbg !249
  %14 = load i32, i32* %13, align 4, !dbg !249
  %15 = call fastcc i32 @ieee802_11_print(%struct.netdissect_options* noundef %7, i8* noundef %8, i32 noundef %11, i32 noundef %14), !dbg !250
  ret i32 %15, !dbg !251
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noinline noreturn nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0, !23, !25, !27}
!llvm.ident = !{!29, !29, !29, !29}
!llvm.module.flags = !{!30, !31, !32, !33, !34, !35, !36}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/233_print-802_11.c_1596_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness/driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/233_print-802_11.c_1596_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "070bfc42be12eb2b0a165a03c895226f")
!2 = !{!3, !16, !11}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "netdissect_options", file: !5, line: 15, baseType: !6)
!5 = !DIFile(filename: "driver.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/233_print-802_11.c_1596_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "070bfc42be12eb2b0a165a03c895226f")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !5, line: 10, size: 192, elements: !7)
!7 = !{!8, !10, !14, !15}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "instate", scope: !6, file: !5, line: 11, baseType: !9, size: 32)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_snapend", scope: !6, file: !5, line: 12, baseType: !11, size: 64, offset: 64)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !5, line: 7, baseType: !13)
!13 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!14 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_eflag", scope: !6, file: !5, line: 13, baseType: !9, size: 32, offset: 128)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Hflag", scope: !6, file: !5, line: 14, baseType: !9, size: 32, offset: 160)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "pcap_pkthdr", file: !5, line: 9, size: 64, elements: !18)
!18 = !{!19, !22}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !17, file: !5, line: 9, baseType: !20, size: 32)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !5, line: 8, baseType: !21)
!21 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "caplen", scope: !17, file: !5, line: 9, baseType: !20, size: 32, offset: 32)
!23 = distinct !DICompileUnit(language: DW_LANG_C99, file: !24, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!24 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/233_print-802_11.c_1596_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness/print-802_11.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/233_print-802_11.c_1596_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "70b62eb9bcbd8fa00439a7a7784f5977")
!25 = distinct !DICompileUnit(language: DW_LANG_C99, file: !26, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!26 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/233_print-802_11.c_1596_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness/smart_stubs.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/233_print-802_11.c_1596_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "08f22e7eb5d6082b235bd73c018c96db")
!27 = distinct !DICompileUnit(language: DW_LANG_C99, file: !28, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!28 = !DIFile(filename: "/app/se_runs/sailor_engine/tcpdump-4.9.2/233_print-802_11.c_1596_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness/stubs.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/233_print-802_11.c_1596_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "4dd5b3a61f7ecf65c4d9328cbad2eace")
!29 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!30 = !{i32 7, !"Dwarf Version", i32 5}
!31 = !{i32 2, !"Debug Info Version", i32 3}
!32 = !{i32 1, !"wchar_size", i32 4}
!33 = !{i32 7, !"PIC Level", i32 2}
!34 = !{i32 7, !"PIE Level", i32 2}
!35 = !{i32 7, !"uwtable", i32 1}
!36 = !{i32 7, !"frame-pointer", i32 2}
!37 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 17, type: !38, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !40)
!38 = !DISubroutineType(types: !39)
!39 = !{!9}
!40 = !{}
!41 = !DILocalVariable(name: "ndo", scope: !37, file: !5, line: 18, type: !3)
!42 = !DILocation(line: 18, column: 25, scope: !37)
!43 = !DILocation(line: 18, column: 53, scope: !37)
!44 = !DILocation(line: 18, column: 31, scope: !37)
!45 = !DILocalVariable(name: "h", scope: !37, file: !5, line: 19, type: !16)
!46 = !DILocation(line: 19, column: 25, scope: !37)
!47 = !DILocation(line: 19, column: 51, scope: !37)
!48 = !DILocation(line: 19, column: 29, scope: !37)
!49 = !DILocalVariable(name: "pkt", scope: !37, file: !5, line: 20, type: !11)
!50 = !DILocation(line: 20, column: 13, scope: !37)
!51 = !DILocation(line: 20, column: 29, scope: !37)
!52 = !DILocation(line: 22, column: 24, scope: !37)
!53 = !DILocation(line: 22, column: 5, scope: !37)
!54 = !DILocation(line: 23, column: 5, scope: !37)
!55 = !DILocation(line: 23, column: 12, scope: !37)
!56 = !DILocation(line: 25, column: 5, scope: !37)
!57 = !DILocation(line: 25, column: 8, scope: !37)
!58 = !DILocation(line: 25, column: 12, scope: !37)
!59 = !DILocation(line: 26, column: 5, scope: !37)
!60 = !DILocation(line: 26, column: 8, scope: !37)
!61 = !DILocation(line: 26, column: 15, scope: !37)
!62 = !DILocalVariable(name: "sym_instate", scope: !37, file: !5, line: 28, type: !9)
!63 = !DILocation(line: 28, column: 9, scope: !37)
!64 = !DILocation(line: 29, column: 24, scope: !37)
!65 = !DILocation(line: 29, column: 5, scope: !37)
!66 = !DILocation(line: 30, column: 17, scope: !37)
!67 = !DILocation(line: 30, column: 29, scope: !37)
!68 = !DILocation(line: 30, column: 5, scope: !37)
!69 = !DILocation(line: 31, column: 20, scope: !37)
!70 = !DILocation(line: 31, column: 5, scope: !37)
!71 = !DILocation(line: 31, column: 10, scope: !37)
!72 = !DILocation(line: 31, column: 18, scope: !37)
!73 = !DILocation(line: 32, column: 24, scope: !37)
!74 = !DILocation(line: 32, column: 28, scope: !37)
!75 = !DILocation(line: 32, column: 5, scope: !37)
!76 = !DILocation(line: 32, column: 10, scope: !37)
!77 = !DILocation(line: 32, column: 22, scope: !37)
!78 = !DILocation(line: 33, column: 5, scope: !37)
!79 = !DILocation(line: 33, column: 10, scope: !37)
!80 = !DILocation(line: 33, column: 20, scope: !37)
!81 = !DILocation(line: 34, column: 5, scope: !37)
!82 = !DILocation(line: 34, column: 10, scope: !37)
!83 = !DILocation(line: 34, column: 20, scope: !37)
!84 = !DILocation(line: 36, column: 25, scope: !37)
!85 = !DILocation(line: 36, column: 30, scope: !37)
!86 = !DILocation(line: 36, column: 33, scope: !37)
!87 = !DILocation(line: 36, column: 5, scope: !37)
!88 = !DILocation(line: 37, column: 5, scope: !37)
!89 = distinct !DISubprogram(name: "handle_action", scope: !90, file: !90, line: 50, type: !91, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !23, retainedNodes: !40)
!90 = !DIFile(filename: "print-802_11.c", directory: "/app/se_runs/sailor_engine/tcpdump-4.9.2/233_print-802_11.c_1596_local_cpp_cwe-125-cursor-lookahead-missing-bytes-check/harness", checksumkind: CSK_MD5, checksum: "70b62eb9bcbd8fa00439a7a7784f5977")
!91 = !DISubroutineType(types: !92)
!92 = !{!9, !93, !103, !109, !111}
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "netdissect_options", file: !90, line: 17, baseType: !95)
!95 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "netdissect_options", file: !90, line: 17, size: 192, elements: !96)
!96 = !{!97, !98, !101, !102}
!97 = !DIDerivedType(tag: DW_TAG_member, name: "instate", scope: !95, file: !90, line: 17, baseType: !9, size: 32)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_snapend", scope: !95, file: !90, line: 17, baseType: !99, size: 64, offset: 64)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_char", file: !90, line: 12, baseType: !13)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_eflag", scope: !95, file: !90, line: 17, baseType: !9, size: 32, offset: 128)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "ndo_Hflag", scope: !95, file: !90, line: 17, baseType: !9, size: 32, offset: 160)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !105)
!105 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !106, line: 24, baseType: !107)
!106 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "2bf2ae53c58c01b1a1b9383b5195125c")
!107 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !108, line: 38, baseType: !13)
!108 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!110 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !100)
!111 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int", file: !90, line: 13, baseType: !21)
!112 = !DILocalVariable(name: "ndo", arg: 1, scope: !89, file: !90, line: 50, type: !93)
!113 = !DILocation(line: 50, column: 39, scope: !89)
!114 = !DILocalVariable(name: "src", arg: 2, scope: !89, file: !90, line: 50, type: !103)
!115 = !DILocation(line: 50, column: 59, scope: !89)
!116 = !DILocalVariable(name: "p", arg: 3, scope: !89, file: !90, line: 50, type: !109)
!117 = !DILocation(line: 50, column: 78, scope: !89)
!118 = !DILocalVariable(name: "length", arg: 4, scope: !89, file: !90, line: 50, type: !111)
!119 = !DILocation(line: 50, column: 87, scope: !89)
!120 = !DILocation(line: 51, column: 5, scope: !89)
!121 = !DILocation(line: 52, column: 13, scope: !89)
!122 = !DILocation(line: 52, column: 5, scope: !89)
!123 = !DILocation(line: 53, column: 60, scope: !124)
!124 = distinct !DILexicalBlock(scope: !89, file: !90, line: 52, column: 21)
!125 = !DILocation(line: 55, column: 60, scope: !124)
!126 = !DILocation(line: 57, column: 71, scope: !124)
!127 = !DILocation(line: 60, column: 9, scope: !124)
!128 = !DILocation(line: 62, column: 38, scope: !124)
!129 = !DILocation(line: 64, column: 9, scope: !124)
!130 = !DILocation(line: 66, column: 38, scope: !124)
!131 = !DILocation(line: 67, column: 55, scope: !124)
!132 = !DILocation(line: 71, column: 9, scope: !124)
!133 = !DILocation(line: 73, column: 5, scope: !89)
!134 = !DILocation(line: 74, column: 5, scope: !89)
!135 = distinct !DISubprogram(name: "ieee802_11_print", scope: !90, file: !90, line: 77, type: !136, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !23, retainedNodes: !40)
!136 = !DISubroutineType(types: !137)
!137 = !{!111, !93, !109, !111, !111, !9, !111}
!138 = !DILocalVariable(name: "ndo", arg: 1, scope: !135, file: !90, line: 77, type: !93)
!139 = !DILocation(line: 77, column: 44, scope: !135)
!140 = !DILocalVariable(name: "p", arg: 2, scope: !135, file: !90, line: 78, type: !109)
!141 = !DILocation(line: 78, column: 32, scope: !135)
!142 = !DILocalVariable(name: "length", arg: 3, scope: !135, file: !90, line: 78, type: !111)
!143 = !DILocation(line: 78, column: 41, scope: !135)
!144 = !DILocalVariable(name: "orig_caplen", arg: 4, scope: !135, file: !90, line: 78, type: !111)
!145 = !DILocation(line: 78, column: 55, scope: !135)
!146 = !DILocalVariable(name: "pad", arg: 5, scope: !135, file: !90, line: 78, type: !9)
!147 = !DILocation(line: 78, column: 72, scope: !135)
!148 = !DILocalVariable(name: "fcslen", arg: 6, scope: !135, file: !90, line: 79, type: !111)
!149 = !DILocation(line: 79, column: 24, scope: !135)
!150 = !DILocation(line: 81, column: 5, scope: !135)
!151 = !DILocalVariable(name: "fc", scope: !135, file: !90, line: 82, type: !152)
!152 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !106, line: 25, baseType: !153)
!153 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !108, line: 40, baseType: !154)
!154 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!155 = !DILocation(line: 82, column: 14, scope: !135)
!156 = !DILocalVariable(name: "caplen", scope: !135, file: !90, line: 83, type: !111)
!157 = !DILocation(line: 83, column: 11, scope: !135)
!158 = !DILocation(line: 83, column: 20, scope: !135)
!159 = !DILocalVariable(name: "hdrlen", scope: !135, file: !90, line: 83, type: !111)
!160 = !DILocation(line: 83, column: 33, scope: !135)
!161 = !DILocalVariable(name: "meshdrlen", scope: !135, file: !90, line: 83, type: !111)
!162 = !DILocation(line: 83, column: 45, scope: !135)
!163 = !DILocalVariable(name: "src", scope: !135, file: !90, line: 84, type: !164)
!164 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "lladdr_info", file: !90, line: 15, size: 64, elements: !165)
!165 = !{!166}
!166 = !DIDerivedType(tag: DW_TAG_member, name: "addr", scope: !164, file: !90, line: 15, baseType: !109, size: 64)
!167 = !DILocation(line: 84, column: 24, scope: !135)
!168 = !DILocalVariable(name: "dst", scope: !135, file: !90, line: 84, type: !164)
!169 = !DILocation(line: 84, column: 29, scope: !135)
!170 = !DILocalVariable(name: "llc_hdrlen", scope: !135, file: !90, line: 85, type: !9)
!171 = !DILocation(line: 85, column: 9, scope: !135)
!172 = !DILocation(line: 86, column: 9, scope: !173)
!173 = distinct !DILexicalBlock(scope: !135, file: !90, line: 86, column: 9)
!174 = !DILocation(line: 86, column: 16, scope: !173)
!175 = !DILocation(line: 86, column: 9, scope: !135)
!176 = !DILocation(line: 86, column: 28, scope: !173)
!177 = !DILocation(line: 86, column: 21, scope: !173)
!178 = !DILocation(line: 87, column: 10, scope: !135)
!179 = !DILocation(line: 87, column: 7, scope: !135)
!180 = !DILocation(line: 88, column: 26, scope: !135)
!181 = !DILocation(line: 88, column: 30, scope: !135)
!182 = !DILocation(line: 88, column: 28, scope: !135)
!183 = !DILocation(line: 88, column: 38, scope: !135)
!184 = !DILocation(line: 88, column: 49, scope: !135)
!185 = !DILocation(line: 88, column: 44, scope: !135)
!186 = !DILocation(line: 88, column: 5, scope: !135)
!187 = !DILocation(line: 89, column: 26, scope: !188)
!188 = distinct !DILexicalBlock(scope: !135, file: !90, line: 89, column: 9)
!189 = !DILocation(line: 89, column: 31, scope: !188)
!190 = !DILocation(line: 89, column: 39, scope: !188)
!191 = !DILocation(line: 89, column: 45, scope: !188)
!192 = !DILocation(line: 89, column: 48, scope: !188)
!193 = !DILocation(line: 89, column: 10, scope: !188)
!194 = !DILocation(line: 91, column: 1, scope: !135)
!195 = distinct !DISubprogram(name: "get_mgmt_src_dst_mac", scope: !90, file: !90, line: 37, type: !196, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !23, retainedNodes: !40)
!196 = !DISubroutineType(types: !197)
!197 = !{null, !109, !198, !198}
!198 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !199, size: 64)
!199 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "lladdr", file: !90, line: 14, size: 64, elements: !200)
!200 = !{!201}
!201 = !DIDerivedType(tag: DW_TAG_member, name: "addr", scope: !199, file: !90, line: 14, baseType: !103, size: 64)
!202 = !DILocalVariable(name: "p", arg: 1, scope: !195, file: !90, line: 37, type: !109)
!203 = !DILocation(line: 37, column: 48, scope: !195)
!204 = !DILocalVariable(name: "src", arg: 2, scope: !195, file: !90, line: 37, type: !198)
!205 = !DILocation(line: 37, column: 66, scope: !195)
!206 = !DILocalVariable(name: "dst", arg: 3, scope: !195, file: !90, line: 37, type: !198)
!207 = !DILocation(line: 37, column: 86, scope: !195)
!208 = !DILocation(line: 37, column: 93, scope: !195)
!209 = distinct !DISubprogram(name: "mgmt_body_print", scope: !90, file: !90, line: 44, type: !210, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !23, retainedNodes: !40)
!210 = !DISubroutineType(types: !211)
!211 = !{!9, !93, !152, !109, !109, !111}
!212 = !DILocalVariable(name: "ndo", arg: 1, scope: !209, file: !90, line: 44, type: !93)
!213 = !DILocation(line: 44, column: 48, scope: !209)
!214 = !DILocalVariable(name: "fc", arg: 2, scope: !209, file: !90, line: 44, type: !152)
!215 = !DILocation(line: 44, column: 62, scope: !209)
!216 = !DILocalVariable(name: "src", arg: 3, scope: !209, file: !90, line: 44, type: !109)
!217 = !DILocation(line: 44, column: 80, scope: !209)
!218 = !DILocalVariable(name: "p", arg: 4, scope: !209, file: !90, line: 44, type: !109)
!219 = !DILocation(line: 44, column: 99, scope: !209)
!220 = !DILocalVariable(name: "length", arg: 5, scope: !209, file: !90, line: 44, type: !111)
!221 = !DILocation(line: 44, column: 108, scope: !209)
!222 = !DILocation(line: 45, column: 5, scope: !209)
!223 = !DILocation(line: 46, column: 19, scope: !209)
!224 = !DILocation(line: 46, column: 24, scope: !209)
!225 = !DILocation(line: 46, column: 29, scope: !209)
!226 = !DILocation(line: 46, column: 32, scope: !209)
!227 = !DILocation(line: 46, column: 5, scope: !209)
!228 = distinct !DISubprogram(name: "ieee802_11_if_print", scope: !90, file: !90, line: 93, type: !229, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !23, retainedNodes: !40)
!229 = !DISubroutineType(types: !230)
!230 = !{!111, !93, !231, !109}
!231 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !232, size: 64)
!232 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !233)
!233 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "pcap_pkthdr", file: !90, line: 16, size: 64, elements: !234)
!234 = !{!235, !236}
!235 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !233, file: !90, line: 16, baseType: !111, size: 32)
!236 = !DIDerivedType(tag: DW_TAG_member, name: "caplen", scope: !233, file: !90, line: 16, baseType: !111, size: 32, offset: 32)
!237 = !DILocalVariable(name: "ndo", arg: 1, scope: !228, file: !90, line: 93, type: !93)
!238 = !DILocation(line: 93, column: 47, scope: !228)
!239 = !DILocalVariable(name: "h", arg: 2, scope: !228, file: !90, line: 94, type: !231)
!240 = !DILocation(line: 94, column: 47, scope: !228)
!241 = !DILocalVariable(name: "p", arg: 3, scope: !228, file: !90, line: 94, type: !109)
!242 = !DILocation(line: 94, column: 64, scope: !228)
!243 = !DILocation(line: 96, column: 5, scope: !228)
!244 = !DILocation(line: 97, column: 26, scope: !228)
!245 = !DILocation(line: 97, column: 31, scope: !228)
!246 = !DILocation(line: 97, column: 34, scope: !228)
!247 = !DILocation(line: 97, column: 37, scope: !228)
!248 = !DILocation(line: 97, column: 42, scope: !228)
!249 = !DILocation(line: 97, column: 45, scope: !228)
!250 = !DILocation(line: 97, column: 9, scope: !228)
!251 = !DILocation(line: 97, column: 2, scope: !228)
