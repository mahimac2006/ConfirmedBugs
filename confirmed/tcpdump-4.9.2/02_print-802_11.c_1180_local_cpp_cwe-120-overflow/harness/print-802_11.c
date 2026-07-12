#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <pcap.h>
#include <klee/klee.h>

#ifndef MAX_MCS_INDEX
#define MAX_MCS_INDEX 76
#endif

/* Minimal types needed for the spine */
typedef unsigned char u_char;
typedef unsigned int u_int;

struct netdissect_options {
  int ndo_bflag; int ndo_eflag; int ndo_fflag; int ndo_Kflag; int ndo_nflag;
  int ndo_Nflag; int ndo_qflag; int ndo_Sflag; int ndo_tflag; int ndo_uflag;
  int ndo_vflag;
};

struct tim_t {
    u_char id;
    u_char length;
    u_char count;
    u_char period;
    u_char bitmap[256];
};

struct mgmt_body_t {
    int tim_present;
    struct tim_t tim;
};

/* AUTO-GENERATED: intermediate spine pass-through */
struct mgmt_body_t;
static int parse_elements(struct netdissect_options *ndo,
               struct mgmt_body_t *pbody, const u_char *p, int offset,
               u_int length);

void handle_beacon(struct netdissect_options *ndo, const u_char *p, u_int len, u_int caplen, int arg1, int arg2) {
    struct mgmt_body_t body;
    memset(&body, 0, sizeof(body));
    parse_elements(ndo, &body, p, 0, len);  /* AUTO-INJECTED: spine call chain */

    klee_warning_once("SPINE_PROBE:handle_beacon:ENTRY");
}

void mgmt_body_print(struct netdissect_options *ndo, const u_char *p, u_int len, u_int caplen, int arg1, int arg2) {
    handle_beacon(ndo, p, len, caplen, arg1, arg2);  /* AUTO-INJECTED: spine call chain */

    klee_warning_once("SPINE_PROBE:mgmt_body_print:ENTRY");
}


u_int ieee802_11_print(struct netdissect_options *ndo, const u_char *p, u_int len, u_int caplen, int arg1, int arg2) {
    mgmt_body_print(ndo, p, len, caplen, arg1, arg2);  /* AUTO-INJECTED: spine call chain */

    klee_warning_once("SPINE_PROBE:ieee802_11_print:ENTRY");
    return 0;
}

u_int ieee802_11_if_print(struct netdissect_options *ndo,
                    const struct pcap_pkthdr *h, const u_char *p)
{
    klee_warning_once("SPINE_PROBE:ieee802_11_if_print:ENTRY");
	return ieee802_11_print(ndo, p, h->len, h->caplen, 0, 0);
}

static int parse_elements(struct netdissect_options *ndo,
               struct mgmt_body_t *pbody, const u_char *p, int offset,
               u_int length)
{
    klee_warning_once("SPINE_PROBE:parse_elements:ENTRY");
	u_int elementlen;
	struct tim_t tim;

	while (length > 0) {
		switch (*(p + offset)) {
		default:
			offset += 2 + elementlen;
			length -= 2 + elementlen;
			break;
		case 5:
		    klee_warning_once("SPINE_PROBE:parse_elements:CASE_5");
			memcpy(&tim, p + offset, 2);
			offset += 2;
			length -= 2;
			if (tim.length <= 3) {
				offset += tim.length;
				length -= tim.length;
				break;
			}
			if (tim.length - 3 > (int)sizeof tim.bitmap)
				return 0;
			memcpy(&tim.count, p + offset, 3);
			offset += 3;
			length -= 3;

			memcpy(tim.bitmap, p + offset, tim.length - 3);
			offset += tim.length - 3;
			length -= tim.length - 3;
			if (!pbody->tim_present) {
				pbody->tim = tim;
				pbody->tim_present = 1;
			}
			break;
		}
	}
    klee_assert(0 && "SAILOR_SINK_REACHED");
	return 1;
}
