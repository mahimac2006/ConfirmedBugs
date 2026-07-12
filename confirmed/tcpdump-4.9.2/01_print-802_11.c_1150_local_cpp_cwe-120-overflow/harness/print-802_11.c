#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <stddef.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <klee/klee.h>

typedef unsigned char u_char;
typedef unsigned int u_int;

typedef struct pcap_pkthdr {
    uint32_t len;
    uint32_t caplen;
} pcap_pkthdr;

typedef struct netdissect_options {
    int dummy;
} netdissect_options;

struct cf_t { unsigned char length; unsigned char count[6]; };
struct mgmt_body_t { int element; int cf_present; struct cf_t cf; };
struct ssid_t { int dummy; };
struct challenge_t { int dummy; };
struct rates_t { int dummy; };
struct ds_t { int dummy; };
struct tim_t { int dummy; };

#ifndef E_CF
#define E_CF 1
#endif

static int parse_elements(netdissect_options *ndo,
               struct mgmt_body_t *pbody, const u_char *p, int offset,
               u_int length)
{
    klee_warning_once("SPINE_PROBE:parse_elements:ENTRY");
	u_int elementlen;
	struct ssid_t ssid;
	struct challenge_t challenge;
	struct rates_t rates;
	struct ds_t ds;
	struct cf_t cf;
	struct tim_t tim;

	switch (pbody->element) {
	default:
		break;
	case E_CF:
	    klee_warning_once("SPINE_PROBE:parse_elements:CASE_E_CF");
		memcpy(&cf, p + offset, 2);
		offset += 2;
		length -= 2;
		if (cf.length != 6) {
			offset += cf.length;
			length -= cf.length;
			break;
		}
		memcpy(&cf.count, p + offset, 6);
		offset += 6;
		length -= 6;
		if (!pbody->cf_present) {
			pbody->cf = cf;
			pbody->cf_present = 1;
		}
		break;
	}
    klee_assert(0 && "SAILOR_SINK_REACHED");
	return 1;
}

/* AUTO-GENERATED: intermediate spine pass-through */

/* AUTO-GENERATED: intermediate spine pass-through */
void handle_beacon(netdissect_options *ndo, const u_char *p, u_int len, u_int caplen, int a, int b) {
    klee_warning_once("SPINE_PROBE:handle_beacon:ENTRY");
    struct mgmt_body_t *pbody = (struct mgmt_body_t *)calloc(1, sizeof(struct mgmt_body_t));
    pbody->element = E_CF;
    parse_elements(ndo, pbody, p, 0, 2);
}

void mgmt_body_print(netdissect_options *ndo, const u_char *p, u_int len, u_int caplen, int a, int b) {
    handle_beacon(ndo, p, len, caplen, a, b);  /* AUTO-INJECTED: spine call chain */

    klee_warning_once("SPINE_PROBE:mgmt_body_print:ENTRY");
}


u_int ieee802_11_print(netdissect_options *ndo, const u_char *p, u_int len, u_int caplen, int a, int b)
{
    mgmt_body_print(ndo, p, len, caplen, a, b);  /* AUTO-INJECTED: spine call chain */

    klee_warning_once("SPINE_PROBE:ieee802_11_print:ENTRY");
	struct mgmt_body_t *pbody = (struct mgmt_body_t *)calloc(1, sizeof(struct mgmt_body_t));
	pbody->element = E_CF;
	return parse_elements(ndo, pbody, p, 0, len);
}

u_int ieee802_11_if_print(netdissect_options *ndo,
                    const struct pcap_pkthdr *h, const u_char *p)
{
    klee_warning_once("SPINE_PROBE:ieee802_11_if_print:ENTRY");
	return ieee802_11_print(ndo, p, h->len, h->caplen, 0, 0);
}
