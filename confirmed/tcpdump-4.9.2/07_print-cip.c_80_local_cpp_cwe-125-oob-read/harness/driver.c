#include "harness_types.h"
#include <stdlib.h>
#include <string.h>
#include <klee/klee.h>

int cip_if_print(netdissect_options *ndo, const struct pcap_pkthdr *h, const u_char *p);

int main(void) {
    netdissect_options *ndo = (netdissect_options *)calloc(1, sizeof(*ndo));
    struct pcap_pkthdr *h = (struct pcap_pkthdr *)calloc(1, sizeof(*h));
    u_char *p = (u_char *)malloc(4);

    klee_make_symbolic(ndo, sizeof(*ndo), "ndo");
    klee_make_symbolic(h, sizeof(*h), "h");
    klee_make_symbolic(p, 4, "p");

    ndo->ndo_eflag = 0;
    ndo->ndo_suppress_default_print = 1;
    h->caplen = 6;
    h->len = 6;

    cip_if_print(ndo, h, p);
    return 0;
}
