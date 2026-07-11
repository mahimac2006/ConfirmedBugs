/* Composition driver for libxml2 bugs 23 & 25 (both vulnerable in 2.10.4).
 *
 * One SHARED symbolic input (buf + len) is handed to BOTH non-crashing predicates. Each predicate
 * returns 1 iff its bug's vulnerable path is reached. Constraining both to 1 and asserting makes
 * KLEE search for a single concrete input that reaches BOTH bugs; if SAT, KLEE emits a .ktest
 * witness and the assertion fires ("BOTH_REACHABLE_23_25"). If UNSAT, no shared input reaches both.
 *
 * Build (example):
 *   clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone ../predicates/predicate_23.c -o p23.bc
 *   clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone ../predicates/predicate_25.c -o p25.bc
 *   clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone -I$KLEE_SRC/include driver_23_25.c -o d.bc
 *   llvm-link d.bc p23.bc p25.bc -o linked.bc && klee --max-time=300 linked.bc
 */
#include <klee/klee.h>
#include <assert.h>

#define N 32   /* shared symbolic buffer size (adjust as needed) */

int predicate_23(const unsigned char *buf, unsigned int len);
int predicate_25(const unsigned char *buf, unsigned int len);

int main(void) {
    unsigned char buf[N];
    unsigned int len;

    /* single shared symbolic input */
    klee_make_symbolic(buf, sizeof(buf), "buf");
    klee_make_symbolic(&len, sizeof(len), "len");
    klee_assume(len >= 1 && len <= N);

    /* both predicates consume the SAME buf + len */
    int r23 = predicate_23(buf, len);
    int r25 = predicate_25(buf, len);

    klee_assume(r23 == 1 && r25 == 1);
    klee_assert(0 && "BOTH_REACHABLE_23_25");
    return 0;
}
