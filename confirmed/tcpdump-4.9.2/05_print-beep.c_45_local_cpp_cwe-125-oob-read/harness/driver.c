#define NO_HARNESS_TYPES
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <klee/klee.h>

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
    int ndo_Hflag;
    int ndo_packet_number;
    int ndo_suppress_default_print;
    int ndo_tstamp_precision;
    const char *program_name;
    char *ndo_espsecret;
    void *ndo_sa_list_head;
    void *ndo_sa_default;
    char *ndo_sigsecret;
    int ndo_packettype;
    int ndo_snaplen;
    const u_char *ndo_packetp;
    const u_char *ndo_snapend;
    void *ndo_if_printer;
} netdissect_options;

extern void beep_print(netdissect_options *ndo, const u_char *bp, u_int length);

int main(void) {
    netdissect_options *ndo = (netdissect_options *)calloc(1, sizeof(*ndo));
    u_int length = 2;
    u_char *bp = (u_char *)calloc(1, length);
    klee_make_symbolic(bp, length, "bp");
    memcpy(bp, "MSGX", 2);
    ndo->ndo_packetp = bp;
    ndo->ndo_snapend = bp + length;
    ndo->ndo_snaplen = (int)length;
    beep_print(ndo, bp, length);
    return 0;
}
