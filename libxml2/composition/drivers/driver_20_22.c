/* Composition driver for libxml2 bugs 20 & 22 (both vulnerable in 2.10.4).
 *
 * One SHARED symbolic input (buf + len) is handed to BOTH non-crashing predicates. Each predicate
 * returns 1 iff its bug's vulnerable path is reached. Constraining both to 1 and asserting makes
 * KLEE search for a single concrete input that reaches BOTH bugs; if SAT, KLEE emits a .ktest
 * witness and the assertion fires ("BOTH_REACHABLE_20_22"). If UNSAT, no shared input reaches both.
 *
 * Build (example):
 *   clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone ../predicates/predicate_20.c -o p20.bc
 *   clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone ../predicates/predicate_22.c -o p22.bc
 *   clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone -I$KLEE_SRC/include driver_20_22.c -o d.bc
 *   llvm-link d.bc p20.bc p22.bc -o linked.bc && klee --max-time=300 linked.bc
 */
#include <klee/klee.h>
#include <assert.h>

#define N 32   /* shared symbolic buffer size (adjust as needed) */

int predicate_20(const unsigned char *buf, unsigned int len);
int predicate_22(const unsigned char *buf, unsigned int len);

int main(void) {
    unsigned char buf[N];
    unsigned int len;

    /* single shared symbolic input */
    klee_make_symbolic(buf, sizeof(buf), "buf");
    klee_make_symbolic(&len, sizeof(len), "len");
    klee_assume(len >= 1 && len <= N);

    /* both predicates consume the SAME buf + len */
    int r20 = predicate_20(buf, len);
    int r22 = predicate_22(buf, len);

    klee_assume(r20 == 1 && r22 == 1);
    klee_assert(0 && "BOTH_REACHABLE_20_22");
    return 0;
}
