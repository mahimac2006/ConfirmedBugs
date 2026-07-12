#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <arpa/inet.h>
#include <klee/klee.h>

#ifndef BGP_SIZE
#define BGP_SIZE 19
#endif

struct netdissect_options {
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
    const unsigned char *ndo_snapend;
};

void bgp_print(struct netdissect_options *ndo, const u_char *dat, int length)
{
    klee_warning_once("SPINE_PROBE:bgp_print:ENTRY");
	const u_char *p;
	const u_char *ep;
	const u_char *start;
	const u_char marker[] = {
		0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
		0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	};
	struct bgp { u_int16_t bgp_len; u_int8_t bgp_type; u_int8_t pad; unsigned char rest[15]; } bgp;
	uint16_t hlen;

	ep = dat + length;
	if (ndo->ndo_snapend < dat + length)
		ep = ndo->ndo_snapend;

	p = dat;
	start = p;
	if (ndo->ndo_vflag < 1)
		return;

	while (p < ep) {
		if (p[0] != 0xff) {
			p++;
			continue;
		}

		if (memcmp(p, marker, sizeof(marker)) != 0) {
			p++;
			continue;
		}

		memcpy(&bgp, p, BGP_SIZE);
		hlen = ntohs(bgp.bgp_len);
		if (hlen < BGP_SIZE) {
			break;
		}

		if (p + hlen <= ep) {
			p += hlen;
			start = p;
		} else {
			break;
		}
	}
    klee_assert(0 && "SAILOR_SINK_REACHED");
	return;
}
