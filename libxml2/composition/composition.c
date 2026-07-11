/* Pairwise reachability composition — libxml2 2.10.4 bugs 18–22, single file.
 *
 * Contains all 5 non-crashing predicates AND the shared-symbolic-input driver in one translation
 * unit. Pick which pair to test at compile time with -DA=<x> -DB=<y> (defaults 18 & 20):
 *
 *   clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone \
 *         -I$KLEE_SRC/include -DA=18 -DB=20 composition.c -o composition.bc
 *   klee --max-time=300 composition.bc
 *
 * SAT -> "KLEE: ERROR: ... ASSERTION FAIL: 0 && \"BOTH_REACHABLE\"" + a testNNN.ktest witness
 *        (one concrete buf+len reaching BOTH selected bugs). UNSAT -> no shared input reaches both.
 *
 * Run all 10 pairs:
 *   for p in 18_19 18_20 18_21 18_22 19_20 19_21 19_22 20_21 20_22 21_22; do
 *     A=${p%_*}; B=${p#*_};
 *     clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone -I$KLEE_SRC/include \
 *           -DA=$A -DB=$B composition.c -o c_$p.bc && klee --output-dir=out_$p c_$p.bc;
 *   done
 *
 * Bug map (all vulnerable in libxml2 2.10.4):
 *   18 htmlCurrentChar          HTMLparser.c:474    global-buffer-overflow read
 *   19 htmlParseSystemLiteral   HTMLparser.c:3004   global-buffer-overflow read
 *   20 htmlParseHTMLAttribute   HTMLparser.c:2843   uninitialized/over-read
 *   21 xmlParseTryOrFinish      parser.c:12168      heap-buffer-overflow read
 *   22 xmlSwitchInputEncodingInt parserInternals.c:1124  over-read root cause
 */
#include <klee/klee.h>
#include <assert.h>

#ifndef N
#define N 32          /* shared symbolic buffer size (adjust as needed) */
#endif
#ifndef A
#define A 18          /* first bug of the pair  */
#endif
#ifndef B
#define B 20          /* second bug of the pair */
#endif

/* ==========================================================================================
 * Non-crashing predicates. `end = buf + len` is the libxml2 input->end (snapend) analog.
 * Each replicates its function's bounds logic and returns 1 at the exact crash sink (no real
 * out-of-bounds access), 0 on every non-vulnerable exit.
 * ======================================================================================== */

/* Bug 18 — htmlCurrentChar (HTMLparser.c:474): UTF-8 lead byte reads continuation bytes
 * cur[1..seqlen-1] past input->end when a multi-byte char is truncated at end-of-input. */
int predicate_18(const unsigned char *buf, unsigned int len) {
    const unsigned char *end = buf + len;
    const unsigned char *cur = buf;
    while (cur < end) {
        unsigned int c = cur[0];
        if (c < 0x80) { cur += 1; continue; }
        int seqlen = (c < 0xE0) ? 2 : (c < 0xF0) ? 3 : 4;
        if (cur + seqlen > end) return 1;              /* SINK: cur[1..seqlen-1] past end */
        cur += seqlen;
    }
    return 0;
}

/* Bug 19 — htmlParseSystemLiteral (HTMLparser.c:3004): an unterminated quoted SYSTEM literal
 * makes cur run to end and xmlStrndup(start, cur-start) over-read. */
int predicate_19(const unsigned char *buf, unsigned int len) {
    const unsigned char *end = buf + len;
    const unsigned char *cur = buf;
    if (cur >= end) return 0;
    unsigned char q = cur[0];
    if (q != '"' && q != '\'') return 0;               /* must open a literal */
    cur += 1;
    while (cur < end && cur[0] != q) cur += 1;          /* scan for the closing quote */
    if (cur >= end) return 1;                           /* SINK: unterminated -> over-read */
    return 0;
}

/* Bug 20 — htmlParseHTMLAttribute (HTMLparser.c:2843): an unterminated attribute value keeps
 * calling CUR_CHAR (= htmlCurrentChar) past end -> bug 18's sink via the attribute path. */
int predicate_20(const unsigned char *buf, unsigned int len) {
    const unsigned char *end = buf + len;
    const unsigned char *cur = buf;
    if (cur >= end) return 0;
    unsigned char q = cur[0];
    if (q != '"' && q != '\'') return 0;               /* attribute value opens with a quote */
    cur += 1;
    while (cur < end && cur[0] != q) {
        unsigned int c = cur[0];
        int seqlen = (c < 0x80) ? 1 : (c < 0xE0) ? 2 : (c < 0xF0) ? 3 : 4;
        if (cur + seqlen > end) return 1;              /* SINK: htmlCurrentChar reads past end */
        cur += seqlen;
    }
    return 0;
}

/* Bug 21 — xmlParseTryOrFinish (parser.c:12168): on an invalid byte the `encoding_error` label
 * snprintf's cur[0..3] without checking >=4 bytes remain -> over-read if <4 bytes left. */
int predicate_21(const unsigned char *buf, unsigned int len) {
    const unsigned char *end = buf + len;
    const unsigned char *cur = buf;
    while (cur < end) {
        unsigned int c = cur[0];
        if (c >= 0x80) {                               /* invalid char -> goto encoding_error */
            if (end - cur < 4) return 1;               /* SINK: cur[1..3] read past end */
            return 0;
        }
        cur += 1;
    }
    return 0;
}

/* Bug 22 — xmlSwitchInputEncodingInt (parserInternals.c:1124): on a failed encoding conversion
 * (nbchars<0) the parser is not halted, enabling a later over-read. Modelled: a UTF-16 BOM
 * (0xFE/0xFF) with a malformed (odd) raw length fails to convert. Most abstracted predicate. */
int predicate_22(const unsigned char *buf, unsigned int len) {
    if (len < 1) return 0;
    unsigned char c0 = buf[0];
    if (c0 != 0xFE && c0 != 0xFF) return 0;            /* no BOM -> no encoding switch */
    if ((len % 2) == 1) return 1;                      /* SINK: nbchars<0, parser not halted */
    return 0;
}

/* ==========================================================================================
 * Driver: one shared symbolic input handed to BOTH selected predicates.
 * ======================================================================================== */
#define _PRED(x) predicate_##x
#define PRED(x)  _PRED(x)

int main(void) {
    unsigned char buf[N];
    unsigned int len;

    klee_make_symbolic(buf, sizeof(buf), "buf");
    klee_make_symbolic(&len, sizeof(len), "len");
    klee_assume(len >= 1 && len <= N);

    int rA = PRED(A)(buf, len);
    int rB = PRED(B)(buf, len);        /* SAME shared buf + len */

    klee_assume(rA == 1 && rB == 1);
    klee_assert(0 && "BOTH_REACHABLE");  /* fires iff one input reaches both bugs A and B */
    return 0;
}
