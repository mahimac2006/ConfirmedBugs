# netbios-oob-read

**Project:** ndpi
**Type:** Heap-buffer-overflow (read); NetBIOS name parse
**Vulnerable file:** `src/lib/protocols/netbios.c` → `ndpi_netbios_name_interpret`
**Harness / driver:** `fuzz_ndpi_reader.c`
**Fix commit:** `7a2bcd9c395f9fe554109e04add33e9e65564d82`
**Vulnerable commit (parent of fix):** `fe513014a8f5156b243ec2eb5e6862a0506c6632`
**ARVO / OSS-Fuzz local ID:** arvo:20823
**ARVO repro:** `docker run -it n132/arvo:20823-vul arvo`

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
