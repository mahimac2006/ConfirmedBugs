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

Two projects were selected. Both are compact, self-contained C codebases with well-defined fuzz
harnesses, public per-bug crash reports, and upstream fix commits. For each project we document
**5 CyberGym vulnerabilities that all coexist in one identical vulnerable release** — everything
needed for an LLM to build a non-crashing predicate and a shared symbolic composition driver.

| Project | Fixed version documented | Bugs | Index |
|---|---|---|---|
| ndpi    | **4.2** (all fixed in 4.4)      | 5 | [`ndpi/vulnerabilities.md`](./ndpi/vulnerabilities.md) |
| libxml2 | **2.10.4** (all fixed in 2.11.0) | 5 | [`libxml2/vulnerabilities.md`](./libxml2/vulnerabilities.md) |

Each bug folder contains **`metadata.json`** (project/version, arvo id, file/function, vulnerable
line, crash sink, fix commit, signature, harness call chain), **`BUG.md`** (the full dossier),
**`vulnerable/<function>.c`** (the complete pre-patch function plus the macros/structs/typedefs/
globals/helpers needed to reason about it standalone), and **`patch/fix.patch`** (the upstream fix).

Each bug's vulnerable code was verified **present and unfixed at the exact release tag** — candidates
whose crashing file/function did not yet exist there, or whose bug was a later master-only
regression, were dropped (see each `vulnerabilities.md` for the honest per-bug caveats).

### Why these two

Excluding Binutils (103 bugs), CyberGym's leaders are Ghostscript (88), FFmpeg (69),
OpenSC (59), Wireshark (51), librawspeed (46), mruby (42), **libxml2 (38)**,
Harfbuzz (35), MuPDF (35), **ndpi (34)**…

- **ndpi 4.2** — a compact deep-packet-inspection library. The 5 documented bugs are CyberGym nDPI
  tasks (`arvo:<id>`) all vulnerable in release 4.2 (fixed in 4.4): over-reads and over-writes in a
  protocol dissector (`ndpi_check_tinc`), string helpers (`ndpi_strncasestr`,
  `ndpi_is_printable_string`), the CSV serializer (`ndpi_serialize_string_int32`), and TLS
  certificate parsing (`processCertificateElements`).
- **libxml2 2.10.4** — a widely-embedded XML library. The 5 documented bugs are CyberGym tasks all
  vulnerable in release 2.10.4 (fixed in 2.11.0): input-buffer over-reads in the HTML/XML parser
  (`htmlCurrentChar`, `htmlParseSystemLiteral`, `htmlParseHTMLAttribute`, `xmlParseTryOrFinish`) plus
  the encoding-switch root cause (`xmlSwitchInputEncodingInt`).

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
