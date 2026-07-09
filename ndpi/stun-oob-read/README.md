# stun-oob-read

**Project:** ndpi
**Type:** Heap-buffer-overflow (read); STUN dissector
**Vulnerable file:** `src/lib/protocols/stun.c` → `ndpi_int_check_stun`
**Harness / driver:** `fuzz_ndpi_reader.c`
**Fix commit:** `843204299c79c55c736231c06db98def2b3a6bba`
**Vulnerable commit (parent of fix):** `09cd95d54ab5141795a0653b1f6a6149725dbbf7`
**ARVO / OSS-Fuzz local ID:** arvo:19332
**ARVO repro:** `docker run -it n132/arvo:19332-vul arvo`

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
