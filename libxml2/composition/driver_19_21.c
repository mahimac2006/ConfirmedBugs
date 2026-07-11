/* Composition driver for libxml2 bugs 19 & 21 (both vulnerable in 2.10.4).
 *
 * One SHARED symbolic input (buf + len) is handed to BOTH non-crashing predicates. Each predicate
 * returns 1 iff its bug's vulnerable path is reached. When BOTH return 1, the assertion fires and
 * KLEE emits a .ktest witness — one concrete input reaching BOTH bugs ("BOTH_REACHABLE_19_21").
 * If no such input exists the assertion is never reached (UNSAT) and KLEE completes with 0 errors.
 *
 * NOTE: the both-reached condition is checked with an `if`, not klee_assume. Because each predicate
 * returns a CONCRETE 0/1 on a given path, `klee_assume(rX==1 && rY==1)` would be a provably-false
 * assume on every non-matching path and KLEE would report it as an error. The `if` prunes those
 * paths silently while still firing the assertion on the satisfying path. (The klee_assume on `len`
 * is fine — it constrains the symbolic input and is always feasible.)
 *
 * Build (predicates live in this same folder):
 *   clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone predicate_19.c -o p19.bc
 *   clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone predicate_21.c -o p21.bc
 *   clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone -I$KLEE_SRC/include driver_19_21.c -o d.bc
 *   llvm-link d.bc p19.bc p21.bc -o linked.bc && klee --max-time=300 linked.bc
 */
#include <klee/klee.h>
#include <assert.h>

#define N 32   /* shared symbolic buffer size (adjust as needed) */

int predicate_19(const unsigned char *buf, unsigned int len);
int predicate_21(const unsigned char *buf, unsigned int len);

int main(void) {
    unsigned char buf[N];
    unsigned int len;

    /* single shared symbolic input */
    klee_make_symbolic(buf, sizeof(buf), "buf");
    klee_make_symbolic(&len, sizeof(len), "len");
    klee_assume(len >= 1 && len <= N);

    /* both predicates consume the SAME buf + len */
    int r19 = predicate_19(buf, len);
    int r21 = predicate_21(buf, len);

    if (r19 == 1 && r21 == 1)
        klee_assert(0 && "BOTH_REACHABLE_19_21");   /* fires iff one input reaches both bugs */

    return 0;
}
