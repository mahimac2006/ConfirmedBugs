# nDPI — confirmed vulnerabilities

Source project: <https://github.com/ntop/nDPI> · CyberGym count: **34** · Documented here: **12**

Every bug below is a real **CyberGym** nDPI task (keyed `arvo:<id>`), selected from CyberGym's
34-bug nDPI set. nDPI replaces mruby in this collection: unlike mruby (whose crashes sit deep in
the VM interpreter, reachable only after full lex→parse→compile→execute and thus intractable for
symbolic execution), each of these lives in a **self-contained protocol dissector** that parses a
*flat packet byte buffer* with explicit bounds checks — the same shape as the tcpdump `print-*.c`
functions, and the right shape for predicate extraction + KLEE.

Each bug lives in its own subfolder with **`driver/`**, **`stubs/`**, **`vulnerable/`**, **`patch/`**, and **`poc/`**.

## Per-bug folder layout
```
ndpi/<bug-id>/
├── README.md          # summary + reproduce steps
├── metadata.json      # arvo_id, fix/vulnerable commit, file/function, crash_line, version, …
├── driver/            # fuzz_ndpi_reader.c harness + fuzz_common_code.c
├── stubs/             # OSS-Fuzz build.sh, Dockerfile, project.yaml
├── vulnerable/        # pre-patch source of the crashing dissector file
├── patch/fix.patch    # upstream fix as a unified diff
└── poc/               # ground-truth crash input (or fetch instructions)
```

Re-populate or refresh from upstream with `python3 scripts/populate_bugs.py`.

## Driver / harness (common to all)
OSS-Fuzz project `ndpi`, fuzz target **`fuzz_ndpi_reader`** (`fuzz/fuzz_ndpi_reader.c`). It feeds
fuzzed packets through `ndpi_detection_process_packet()`, which dispatches to the per-protocol
dissectors below — so each dissector is reached with attacker-controlled packet bytes.

- Harness source: <https://github.com/ntop/nDPI/tree/master/fuzz>
- OSS-Fuzz project dir: <https://github.com/google/oss-fuzz/tree/master/projects/ndpi>

## Vulnerabilities

| # | Bug ID | CyberGym task | Type / trigger | Vulnerable file → function | Crash line |
|---|---|---|---|---|---|
| 1 | bittorrent-oob-read | `arvo:55218` | Heap-buffer-overflow (read); BitTorrent dissector | `src/lib/protocols/bittorrent.c` → `ndpi_search_bittorrent` | :498 |
| 2 | raknet-oob-read | `arvo:47000` | Heap-buffer-overflow (read); RakNet dissector | `src/lib/protocols/raknet.c` → `ndpi_search_raknet` | :152 |
| 3 | openvpn-oob-read | `arvo:22244` | Heap-buffer-overflow (read); OpenVPN dissector | `src/lib/protocols/openvpn.c` → `ndpi_search_openvpn` | :125 |
| 4 | amazon-video-oob-read | `arvo:19100` | Heap-buffer-overflow (read); Amazon Video dissector | `src/lib/protocols/amazon_video.c` → `ndpi_check_amazon_video` | :39 |
| 5 | netbios-oob-read | `arvo:20823` | Heap-buffer-overflow (read); NetBIOS name parse | `src/lib/protocols/netbios.c` → `ndpi_netbios_name_interpret` | :50 |
| 6 | kerberos-oob-read | `arvo:23021` | Heap-buffer-overflow (read); Kerberos dissector | `src/lib/protocols/kerberos.c` → `ndpi_search_kerberos` | :291 |
| 7 | capwap-oob-read | `arvo:21000` | Heap-buffer-overflow (read); CAPWAP dissector | `src/lib/protocols/capwap.c` → `ndpi_search_setup_capwap` | :69 |
| 8 | stun-oob-read | `arvo:19332` | Heap-buffer-overflow (read); STUN dissector | `src/lib/protocols/stun.c` → `ndpi_int_check_stun` | :319 |
| 9 | tinc-oob-read | `arvo:46499` | Heap-buffer-overflow (read); TINC dissector | `src/lib/protocols/tinc.c` → `ndpi_check_tinc` | :105 |
| 10 | imap-index-oob | `arvo:20830` | Index-out-of-bounds (read); IMAP dissector | `src/lib/protocols/mail_imap.c` → `ndpi_search_mail_imap_tcp` | :167 |
| 11 | softether-oob-read | `arvo:49638` | Heap-buffer-overflow (read); SoftEther dissector | `src/lib/protocols/softether.c` → `dissect_softether_ip_port` | :301 |
| 12 | tls-clienthello-oob-read | `arvo:65362` | Heap-buffer-overflow (read); TLS ClientHello parse | `src/lib/protocols/tls.c` → `processClientServerHello` | :2391 |

## Notes
- All 12 are per-protocol dissectors in `src/lib/protocols/` — the cleanest flat-buffer,
  bounds-check targets, all reached through the single `fuzz_ndpi_reader` harness.
- **Crash lines are authoritative:** each is the top dissector frame (`#N <file>:<line>`) taken
  verbatim from CyberGym's own reproduced ASAN trace (`data/arvo/<id>/error.txt`) — hence all
  `crash_line_confidence: high`. Line numbers reference the ARVO/CyberGym reproduced vulnerable
  tree; the shipped `vulnerable/<file>` is fetched from the upstream parent-of-fix commit and may
  differ by a few lines.
- `version` is the last nDPI release still vulnerable (the release before the one the fix landed
  in, via `git describe --contains` on the fix commit). `version_describe` is
  `git describe --tags <vulnerable_commit>`.
- `arvo_id` is the CyberGym/ARVO local id; `fix_commit` + `vulnerable_commit` cross-check it
  against `n132/ARVO-Meta`.
