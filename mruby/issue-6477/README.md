# issue-6477

**Project:** mruby
**Type:** Heap-buffer-overflow in the VM interpreter loop
**Vulnerable file:** `src/vm.c` → `mrb_vm_exec`
**Harness / driver:** `mruby_fuzzer.c`
**Fix commit:** `4ea55109379dd84494cf5e78c90e4bcbae297684`
**Vulnerable commit (parent of fix):** `e660e28a39655f4ca01a3a292187047c38d013b6`
**Upstream issue:** https://github.com/mruby/mruby/issues/6477

## Layout

| Path | Description |
|---|---|
| `driver/` | OSS-Fuzz fuzz harness(es) and shared helpers |
| `stubs/` | OSS-Fuzz build scripts (`build.sh`, `Dockerfile`, `project.yaml`) |
| `vulnerable/` | Pre-patch source of the vulnerable file at the parent of the fix commit |
| `patch/` | Upstream fix as a unified diff |
| `poc/` | Ground-truth PoC input (fetch instructions if not bundled) |

## Reproduce

1. Check out the upstream repo at the vulnerable commit (see `metadata.json`).
2. Build with ASAN using the OSS-Fuzz stubs in `stubs/` and the driver in `driver/`.
3. Run the fuzz target against the PoC in `poc/` (or fetch from ARVO if noted).
4. Apply `patch/fix.patch` and confirm the crash no longer reproduces.
