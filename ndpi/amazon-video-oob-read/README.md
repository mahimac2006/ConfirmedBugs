# amazon-video-oob-read

**Project:** ndpi
**Type:** Heap-buffer-overflow (read); Amazon Video dissector
**Vulnerable file:** `src/lib/protocols/amazon_video.c` → `ndpi_check_amazon_video`
**Harness / driver:** `fuzz_ndpi_reader.c`
**Fix commit:** `c7efd0892f1f9299360956b740044a798123a773`
**Vulnerable commit (parent of fix):** `ae9429408bded48ad71bb15df28745cc484d23f2`
**ARVO / OSS-Fuzz local ID:** arvo:19100
**ARVO repro:** `docker run -it n132/arvo:19100-vul arvo`

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
