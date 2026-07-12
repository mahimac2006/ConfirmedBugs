#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <klee/klee.h>

#define CDP_HEADER_LEN 4
#define CDP_TLV_HEADER_LEN 4
#define CDP_HEADER_VERSION_OFFSET 0
#define CDP_HEADER_TTL_OFFSET 1
#define CDP_HEADER_CHECKSUM_OFFSET 2
#define CDP_TLV_TYPE_OFFSET 0
#define CDP_TLV_LEN_OFFSET 2

#ifndef u_char
typedef unsigned char u_char;
#endif
#ifndef u_int
typedef unsigned int u_int;
#endif

typedef struct netdissect_options {
    int ndo_vflag;
} netdissect_options;

static const char *tstr = "truncated";

#define ND_PRINT(x) do { } while (0)
#define ND_TCHECK2(p, l) do { } while (0)
#define EXTRACT_16BITS(p) ((unsigned int)(((const u_char *)(p))[0] << 8 | ((const u_char *)(p))[1]))
#define EXTRACT_32BITS(p) ((unsigned int)(((const u_char *)(p))[0] << 24 | ((const u_char *)(p))[1] << 16 | ((const u_char *)(p))[2] << 8 | ((const u_char *)(p))[3]))
#define PLURAL_SUFFIX(x) ((x) == 1 ? "" : "s")

static const char *tok2str(const void *table, const char *def, int v) { (void)table; (void)v; return def; }
static const char *bittok2str(const void *table, const char *def, unsigned int v) { (void)table; (void)v; return def; }
static int fn_printn(netdissect_options *ndo, const u_char *p, int len, const u_char *end) { (void)ndo; (void)p; (void)len; (void)end; return 0; }
static const char *ipaddr_string(netdissect_options *ndo, const u_char *p) { (void)ndo; (void)p; return "0.0.0.0"; }
static const char *ip6addr_string(netdissect_options *ndo, const u_char *p) { (void)ndo; (void)p; return "::"; }

static int cdp_print_addr(netdissect_options *ndo, const u_char * p, int l) {
    klee_warning_once("SPINE_PROBE:cdp_print_addr:ENTRY");
    const u_char *endp = p + l;
    const u_char *p0 = p;
    unsigned int pt, pl, al, num;
    (void)ndo;
    if (l < 10) return -1;
    pt = EXTRACT_16BITS(p0);
    pl = EXTRACT_16BITS(p0 + 2);
    al = EXTRACT_16BITS(p0 + 4);
    num = EXTRACT_16BITS(p0 + 6);
    p = p0;
    if (pt == 0 && pl == 0 && al == 0 && num == 0) {
        p += 10;
        if (p + 4 > endp) return -1;
        ND_PRINT((ndo, "IPv4 (%u) %s", num, ipaddr_string(ndo, p)));
        p += 4;
    }
    if (klee_get_obj_size((void*)p) < (size_t)(8)) klee_report_error(__FILE__, 0, "SAILOR OOB: buffer too small", "sailor.ptr.err");
    else if (pt == 1 && pl == 8 && memcmp(p, "\x00\x00\x00\x00\x00\x00\x00\x00", 8) == 0 && al == 16) {
        p += 10;
        if (p + al > endp) return -1;
        ND_PRINT((ndo, "IPv6 (%u) %s", num, ip6addr_string(ndo, p)));
        p += al;
    }
    else {
        ND_TCHECK2(*p, pl);
    }
    klee_assert(0 && "SAILOR_SINK_REACHED");
    return 0;
}

void cdp_print(netdissect_options *ndo, const u_char *pptr, u_int length, u_int caplen) {
    klee_warning_once("SPINE_PROBE:cdp_print:ENTRY");
    int type, len, i, j;
    const u_char *tptr;
    if (caplen < CDP_HEADER_LEN) { ND_PRINT((ndo, "%s", tstr)); return; }
    tptr = pptr;
    ND_TCHECK2(*tptr, CDP_HEADER_LEN);
    ND_PRINT((ndo, "CDPv%u, ttl: %us", *(tptr + CDP_HEADER_VERSION_OFFSET), *(tptr + CDP_HEADER_TTL_OFFSET)));
    if (ndo->ndo_vflag) ND_PRINT((ndo, ", checksum: 0x%04x (unverified), length %u", EXTRACT_16BITS(tptr+CDP_HEADER_CHECKSUM_OFFSET), length));
    tptr += CDP_HEADER_LEN;
    while (tptr < (pptr+length)) {
        ND_TCHECK2(*tptr, CDP_TLV_HEADER_LEN);
        type = EXTRACT_16BITS(tptr+CDP_TLV_TYPE_OFFSET);
        len  = EXTRACT_16BITS(tptr+CDP_TLV_LEN_OFFSET);
        if (len < CDP_TLV_HEADER_LEN) break;
        tptr += CDP_TLV_HEADER_LEN;
        len -= CDP_TLV_HEADER_LEN;
        ND_TCHECK2(*tptr, len);
        if (ndo->ndo_vflag || type == 1) {
            switch (type) {
            case 0x01: ND_PRINT((ndo, "'")); (void)fn_printn(ndo, tptr, len, NULL); ND_PRINT((ndo, "'")); break;
                klee_warning_once("SPINE_PROBE:cdp_print:CASE_0x01");
            case 0x02: if (cdp_print_addr(ndo, tptr, len) < 0) goto trunc; break;
                klee_warning_once("SPINE_PROBE:cdp_print:CASE_0x02");
            default: break;
            }
        }
        tptr += len;
    }
trunc:
    klee_warning_once("SPINE_PROBE:cdp_print:LABEL_trunc");
    return;
}
