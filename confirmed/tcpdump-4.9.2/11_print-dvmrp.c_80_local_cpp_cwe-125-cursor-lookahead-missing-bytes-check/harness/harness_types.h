/* AUTO-GENERATED from harness preamble */
#pragma once

#include <stdint.h>
#include <stdlib.h>
#include <string.h>

typedef unsigned char u_char;
typedef unsigned int u_int;

typedef struct netdissect_options {
  int ndo_bflag;
  int ndo_eflag;
  int ndo_fflag;
  int ndo_Kflag;
  int ndo_nflag;
  int ndo_Nflag;
  int ndo_qflag;
  int ndo_Sflag;
  int ndo_tflag;
  int ndo_uflag;
  int ndo_vflag;
  int ndo_xflag;
  int ndo_Xflag;
  int ndo_Aflag;
  void *ndo_snapend;
} netdissect_options;

#define DVMRP_PROBE 1
#define DVMRP_REPORT 2
#define DVMRP_ASK_NEIGHBORS 3
#define DVMRP_NEIGHBORS 4
#define DVMRP_ASK_NEIGHBORS2 5
#define DVMRP_NEIGHBORS2 6
#define DVMRP_PRUNE 7
#define DVMRP_GRAFT 8
#define DVMRP_GRAFT_ACK 9



