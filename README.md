# ConfirmedBugs

A curated set of **confirmed, real-world vulnerabilities** selected from the
[CyberGym](https://www.cybergym.io/cybergym/) benchmark (Berkeley/Sunblaze) for use in
vulnerability-chaining research experiments.

CyberGym contains **1,507 vulnerabilities across 188 projects**, drawn largely from the
[ARVO](https://github.com/n132/ARVO-Meta) reproducible-vulnerability dataset, which is itself
built on [OSS-Fuzz](https://github.com/google/oss-fuzz). Every task is keyed by an
`arvo:<id>` or `oss-fuzz:<id>` identifier and ships the pre-patch codebase, post-patch
codebase, the ground-truth OSS-Fuzz PoC, and the ground-truth patch.

## Selected projects

Two projects were selected. Both are compact,
self-contained C codebases with a small number of well-defined fuzz harnesses, public
per-bug crash reports, and upstream fix commits — the properties that make them practical
for building reproducible exploit chains.

| Project | Bugs in CyberGym | Bugs documented here | Index |
|---|---|---|---|
| ndpi    | 34 | 12 | [`ndpi/vulnerabilities.md`](./ndpi/vulnerabilities.md) — one subfolder per bug |
| libxml2 | 38 | 13 | [`libxml2/vulnerabilities.md`](./libxml2/vulnerabilities.md) — one subfolder per bug |

Each bug folder contains the fuzz **driver**, OSS-Fuzz **stubs**, pre-patch **vulnerable** source,
the upstream **patch**, and PoC fetch instructions. Run `python3 scripts/populate_bugs.py` to
refresh from upstream.

### Why these two

Excluding Binutils (103 bugs), CyberGym's leaders are Ghostscript (88), FFmpeg (69),
OpenSC (59), Wireshark (51), librawspeed (46), mruby (42), **libxml2 (38)**,
Harfbuzz (35), MuPDF (35), **ndpi (34)**…

- **ndpi** — a compact, self-contained C deep-packet-inspection library. The 12 documented bugs
  are all real **CyberGym** nDPI tasks (`arvo:<id>`), selected from CyberGym's 34-bug nDPI set.
  Each lives in a **per-protocol dissector** (`ndpi_search_*` / `dissect_*`) reached through one
  harness (`fuzz_ndpi_reader` → `ndpi_detection_process_packet`), parsing a *flat packet byte
  buffer* with explicit bounds checks — so the vulnerable code extracts cleanly into a predicate
  operating on a symbolic buffer (the tcpdump-style, KLEE-tractable shape). Crash lines are taken
  verbatim from CyberGym's own reproduced ASAN traces. (mruby was dropped: its crashes sit deep in
  the VM interpreter, reachable only after full lex→parse→compile→execute, which does not extract
  into a tractable predicate.)
- **libxml2** — a compact, self-contained, widely-embedded C library. Its bugs span distinct
  code paths (parser, DTD validation, XPath/XPointer, XInclude, schema) reachable through a
  small set of focused harnesses, giving a diverse set of multi-stage primitives with real
  downstream targets.

Both are single-language, single-binary, with publicly documented crash reports and fix
commits, so every entry is independently reproducible.

## Reproducibility

For each bug: pull the ARVO/CyberGym task by its `oss-fuzz:<id>` / `arvo:<id>` identifier
(`tasks.json` in the CyberGym data on HuggingFace `sunblaze-ucb/cybergym`), which bundles the
pre-patch tree, the fuzz target, the ground-truth PoC, and the patch. ARVO's
[`n132/ARVO-Meta`](https://github.com/n132/ARVO-Meta) per-bug JSON gives the OSS-Fuzz local ID
→ fix-commit mapping and the exact fuzz-target name, which cross-checks the file/function/commit
columns in each project file.

## Sources

- [CyberGym paper (arXiv 2506.02548)](https://arxiv.org/html/2506.02548v2)
- [CyberGym site](https://www.cybergym.io/cybergym/) · [Berkeley RDI blog](https://rdi.berkeley.edu/blog/cybergym/)
- [CyberGym GitHub](https://github.com/sunblaze-ucb/cybergym) · [ARVO-Meta](https://github.com/n132/ARVO-Meta) · [OSS-Fuzz](https://github.com/google/oss-fuzz)
- [nDPI](https://github.com/ntop/nDPI) · [libxml2](https://gitlab.gnome.org/GNOME/libxml2)
