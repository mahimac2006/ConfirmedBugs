# capwap-oob-read

**Project:** ndpi
**Type:** Heap-buffer-overflow (read); CAPWAP dissector
**Vulnerable file:** `src/lib/protocols/capwap.c` → `ndpi_search_setup_capwap`
**Harness / driver:** `fuzz_ndpi_reader.c`
**Fix commit:** `4976d93d4e7ce5e63cb562fb7f0f916c3103e2de`
**Vulnerable commit (parent of fix):** `1e933e8b026f6f88f27d64ec2260013f38d268d0`
**ARVO / OSS-Fuzz local ID:** arvo:21000
**ARVO repro:** `docker run -it n132/arvo:21000-vul arvo`

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
