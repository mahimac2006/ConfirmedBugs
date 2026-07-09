# raknet-oob-read

**Project:** ndpi
**Type:** Heap-buffer-overflow (read); RakNet dissector
**Vulnerable file:** `src/lib/protocols/raknet.c` → `ndpi_search_raknet`
**Harness / driver:** `fuzz_ndpi_reader.c`
**Fix commit:** `d5005f584c4baf67e084e3bc8b052ca27004550e`
**Vulnerable commit (parent of fix):** `bc2ad3407a1cf7f6d2913f113df31dfbf735c6f6`
**ARVO / OSS-Fuzz local ID:** arvo:47000
**ARVO repro:** `docker run -it n132/arvo:47000-vul arvo`

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
