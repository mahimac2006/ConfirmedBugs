# imap-index-oob

**Project:** ndpi
**Type:** Index-out-of-bounds (read); IMAP dissector
**Vulnerable file:** `src/lib/protocols/mail_imap.c` → `ndpi_search_mail_imap_tcp`
**Harness / driver:** `fuzz_ndpi_reader.c`
**Fix commit:** `933351840dbed3646aeb4f75a359649434b001eb`
**Vulnerable commit (parent of fix):** `83fdfe24d09396f293f6e78ecd341526f339a995`
**ARVO / OSS-Fuzz local ID:** arvo:20830
**ARVO repro:** `docker run -it n132/arvo:20830-vul arvo`

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
