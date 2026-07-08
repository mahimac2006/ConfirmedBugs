# OSS-Fuzz-30886

**Project:** mruby
**Type:** Heap-buffer-overflow (read); crafted heredoc indentation
**Vulnerable file:** `mrbgems/mruby-compiler/core/parse.y` → `heredoc_remove_indent`
**Harness / driver:** `mruby_fuzzer.c`
**Fix commit:** `94fb86f89b131814201596d301f584dfe4547526`
**Vulnerable commit (parent of fix):** `adb50df71a4e5c45cdf9c626fb90f95ef2d10b13`
**ARVO / OSS-Fuzz local ID:** arvo:30886
**ARVO repro:** `docker run -it n132/arvo:30886-vul arvo`

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
