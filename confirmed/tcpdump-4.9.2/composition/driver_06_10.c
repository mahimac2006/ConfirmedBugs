/* Composition driver for tcpdump-4.9.2 bugs 06 & 10.
 *
 * One SHARED symbolic packet (buf + len) is handed to BOTH non-crashing predicates. Each predicate
 * returns 1 iff its bug's vulnerable path is reached. When BOTH return 1 the assertion fires and
 * KLEE emits a .ktest witness — one packet reaching BOTH bugs ("BOTH_REACHABLE_06_10"). If no such
 * packet exists the assertion is never reached (UNSAT) and KLEE completes with 0 errors.
 *
 * The both-reached condition is checked with an `if`, not klee_assume: each predicate returns a
 * concrete 0/1 per path, so klee_assume(rX==1 && rY==1) would be a provably-false assume on every
 * non-matching path (KLEE would flag it as an error). The `if` prunes those paths silently while
 * still firing the assertion on the satisfying path. The klee_assume on `len` is fine (it constrains
 * the symbolic input and is always feasible).
 *
 * Build (predicates live in this same folder):
 *   clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone predicate_06.c -o p06.bc
 *   clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone predicate_10.c -o p10.bc
 *   clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone -I$KLEE_SRC/include driver_06_10.c -o d.bc
 *   llvm-link d.bc p06.bc p10.bc -o linked.bc && klee --max-time=300 linked.bc
 */
#include <klee/klee.h>
#include <assert.h>

#define N 64   /* shared symbolic packet-buffer size (adjust as needed) */

int predicate_06(const unsigned char *buf, unsigned int len);
int predicate_10(const unsigned char *buf, unsigned int len);

int main(void) {
    unsigned char buf[N];
    unsigned int len;

    /* single shared symbolic packet */
    klee_make_symbolic(buf, sizeof(buf), "buf");
    klee_make_symbolic(&len, sizeof(len), "len");
    klee_assume(len >= 1 && len <= N);

    /* both predicates consume the SAME buf + len */
    int r06 = predicate_06(buf, len);
    int r10 = predicate_10(buf, len);

    if (r06 == 1 && r10 == 1)
        klee_assert(0 && "BOTH_REACHABLE_06_10");

    return 0;
}
