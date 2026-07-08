# issue-4027

**Project:** mruby
**Type:** SEGV / uninitialized-pointer deref; Hash prepend Enumerable dup
**Vulnerable file:** `src/hash.c` → `mrb_hash_keys`
**Harness / driver:** `mruby_fuzzer.c`
**Fix commit:** `b64ce17852b180dfeea81cf458660be41a78974d`
**Vulnerable commit (parent of fix):** `1dddc2f712f774b22a8f65432299cebb3b26361b`
**Upstream issue:** https://github.com/mruby/mruby/issues/4027

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
