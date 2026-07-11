/* Composition driver for libxml2 bugs 19 & 20 (both vulnerable in 2.10.4).
 *
 * One SHARED symbolic input (buf + len) is handed to BOTH non-crashing predicates. Each predicate
 * returns 1 iff its bug's vulnerable path is reached. Constraining both to 1 and asserting makes
 * KLEE search for a single concrete input that reaches BOTH bugs; if SAT, KLEE emits a .ktest
 * witness and the assertion fires ("BOTH_REACHABLE_19_20"). If UNSAT, no shared input reaches both.
 *
 * Build (example):
 *   clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone ../predicates/predicate_19.c -o p19.bc
 *   clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone ../predicates/predicate_20.c -o p20.bc
 *   clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone -I$KLEE_SRC/include driver_19_20.c -o d.bc
 *   llvm-link d.bc p19.bc p20.bc -o linked.bc && klee --max-time=300 linked.bc
 */
#include <klee/klee.h>
#include <assert.h>

#define N 32   /* shared symbolic buffer size (adjust as needed) */

int predicate_19(const unsigned char *buf, unsigned int len);
int predicate_20(const unsigned char *buf, unsigned int len);

int main(void) {
    unsigned char buf[N];
    unsigned int len;

    /* single shared symbolic input */
    klee_make_symbolic(buf, sizeof(buf), "buf");
    klee_make_symbolic(&len, sizeof(len), "len");
    klee_assume(len >= 1 && len <= N);

    /* both predicates consume the SAME buf + len */
    int r19 = predicate_19(buf, len);
    int r20 = predicate_20(buf, len);

    klee_assume(r19 == 1 && r20 == 1);
    klee_assert(0 && "BOTH_REACHABLE_19_20");
    return 0;
}
