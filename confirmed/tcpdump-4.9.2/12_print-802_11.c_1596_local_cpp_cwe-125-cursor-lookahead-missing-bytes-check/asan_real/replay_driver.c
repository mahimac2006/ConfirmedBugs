// NO_HARNESS_TYPES
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
// klee removed for replay

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

    { static const unsigned char pkt_data[] = {0x00, 0x00, 0x00, 0x00}; memcpy(pkt, pkt_data, (4 < sizeof(pkt_data)) ? 4 : sizeof(pkt_data)); };
    pkt[0] = 3;

    h->len = 4;
4;
    h->caplen = 4;

    int sym_instate;
    { static const unsigned char instate_data[] = {0x03, 0x00, 0x00, 0x00}; memcpy(&sym_instate, instate_data, (sizeof(sym_instate) < sizeof(instate_data)) ? sizeof(sym_instate) : sizeof(instate_data)); };
    /* klee_assume removed */
    ndo->instate = sym_instate;
    ndo->ndo_snapend = pkt + 4;
    ndo->ndo_eflag = 0;
    ndo->ndo_Hflag = 0;

    ieee802_11_if_print(ndo, h, pkt);
    return 0;
}
