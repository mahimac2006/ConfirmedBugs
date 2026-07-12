#include <stdint.h>
#include <stdlib.h>
#include <klee/klee.h>
// NO_HARNESS_TYPES

#ifndef ND_PRINT
#define ND_PRINT(x) ((void)0)
#endif

int PRINT_BA_ACTION(int v) { int r; klee_make_symbolic(&r, sizeof(r), "PRINT_BA_ACTION_r"); return r; }
int PRINT_HT_ACTION(int v) { int r; klee_make_symbolic(&r, sizeof(r), "PRINT_HT_ACTION_r"); return r; }
int PRINT_MESH_ACTION(int v) { int r; klee_make_symbolic(&r, sizeof(r), "PRINT_MESH_ACTION_r"); return r; }
int PRINT_MULTIHOP_ACTION(int v) { int r; klee_make_symbolic(&r, sizeof(r), "PRINT_MULTIHOP_ACTION_r"); return r; }
int PRINT_SELFPROT_ACTION(int v) { int r; klee_make_symbolic(&r, sizeof(r), "PRINT_SELFPROT_ACTION_r"); return r; }
