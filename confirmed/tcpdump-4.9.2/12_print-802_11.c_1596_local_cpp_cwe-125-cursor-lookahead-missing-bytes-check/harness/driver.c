// NO_HARNESS_TYPES
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <klee/klee.h>

typedef unsigned char u_char;
typedef unsigned int u_int;
struct pcap_pkthdr { u_int len; u_int caplen; };
typedef struct netdissect_options {
    int instate;
    u_char *ndo_snapend;
    int ndo_eflag;
    int ndo_Hflag;
} netdissect_options;

int main(void) {
    netdissect_options *ndo = (netdissect_options *)calloc(1, sizeof(*ndo));
    struct pcap_pkthdr *h = (struct pcap_pkthdr *)calloc(1, sizeof(*h));
    u_char *pkt = (u_char *)calloc(4, sizeof(u_char));

    klee_make_symbolic(pkt, 4, "pkt");
    pkt[0] = 3;

    h->len = 4;
4;
    h->caplen = 4;

    int sym_instate;
    klee_make_symbolic(&sym_instate, sizeof(sym_instate), "instate");
    klee_assume(sym_instate == 3);
    ndo->instate = sym_instate;
    ndo->ndo_snapend = pkt + 4;
    ndo->ndo_eflag = 0;
    ndo->ndo_Hflag = 0;

    ieee802_11_if_print(ndo, h, pkt);
    return 0;
}
