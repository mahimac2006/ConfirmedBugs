/* Composition driver for libxml2 bugs 21 & 24 (both vulnerable in 2.10.4).
 *
 * One SHARED symbolic input (buf + len) is handed to BOTH non-crashing predicates. Each predicate
 * returns 1 iff its bug's vulnerable path is reached. Constraining both to 1 and asserting makes
 * KLEE search for a single concrete input that reaches BOTH bugs; if SAT, KLEE emits a .ktest
 * witness and the assertion fires ("BOTH_REACHABLE_21_24"). If UNSAT, no shared input reaches both.
 *
 * Build (example):
 *   clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone ../predicates/predicate_21.c -o p21.bc
 *   clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone ../predicates/predicate_24.c -o p24.bc
 *   clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone -I$KLEE_SRC/include driver_21_24.c -o d.bc
 *   llvm-link d.bc p21.bc p24.bc -o linked.bc && klee --max-time=300 linked.bc
 */
#include <klee/klee.h>
#include <assert.h>

#define N 32   /* shared symbolic buffer size (adjust as needed) */

int predicate_21(const unsigned char *buf, unsigned int len);
int predicate_24(const unsigned char *buf, unsigned int len);

int main(void) {
    unsigned char buf[N];
    unsigned int len;

    /* single shared symbolic input */
    klee_make_symbolic(buf, sizeof(buf), "buf");
    klee_make_symbolic(&len, sizeof(len), "len");
    klee_assume(len >= 1 && len <= N);

    /* both predicates consume the SAME buf + len */
    int r21 = predicate_21(buf, len);
    int r24 = predicate_24(buf, len);

    klee_assume(r21 == 1 && r24 == 1);
    klee_assert(0 && "BOTH_REACHABLE_21_24");
    return 0;
}
