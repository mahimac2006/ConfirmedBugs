#!/usr/bin/env python3
"""Populate per-bug subfolders with driver, stubs, vulnerable code, and patches."""

from __future__ import annotations

import json
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

BUGS = [
    # libxml2
    {
        "project": "libxml2",
        "id": "CVE-2017-9047",
        "type": "Stack buffer overflow (write); malformed DTD element-content decl",
        "file": "valid.c",
        "function": "xmlSnprintfElementContent",
        "harness": "valid.c",
        "fix_commit": "932cc9896ab41475d4aa429c27d9afd175959d74",
        "arvo_id": "1972",
        "repo": "GNOME/libxml2",
        "repo_url": "https://gitlab.gnome.org/GNOME/libxml2",
    },
    {
        "project": "libxml2",
        "id": "CVE-2017-9048",
        "type": "Stack buffer overflow (companion strcat without length check)",
        "file": "valid.c",
        "function": "xmlSnprintfElementContent",
        "harness": "valid.c",
        "fix_commit": "932cc9896ab41475d4aa429c27d9afd175959d74",
        "arvo_id": "2124",
        "repo": "GNOME/libxml2",
        "repo_url": "https://gitlab.gnome.org/GNOME/libxml2",
    },
    {
        "project": "libxml2",
        "id": "CVE-2016-1762",
        "type": "Heap buffer over-read after parse error",
        "file": "parser.c",
        "function": "xmlNextChar",
        "harness": "xml.c",
        "fix_commit": "a7a94612aa3b16779e2c74e1fa353b5d9786c602",
        "arvo_id": None,
        "repo": "GNOME/libxml2",
        "repo_url": "https://gitlab.gnome.org/GNOME/libxml2",
    },
    {
        "project": "libxml2",
        "id": "CVE-2016-5131",
        "type": "Use-after-free via XPointer range-to",
        "file": "xpointer.c",
        "function": "xmlXPtrRangeToFunction",
        "harness": "xpath.c",
        "fix_commit": "9ab01a277d71f54d3143c2cf333c5c2e9aaedd9e",
        "arvo_id": None,
        "repo": "GNOME/libxml2",
        "repo_url": "https://gitlab.gnome.org/GNOME/libxml2",
    },
    {
        "project": "libxml2",
        "id": "CVE-2017-8872",
        "type": "Heap buffer over-read in progressive HTML push parse",
        "file": "HTMLparser.c",
        "function": "htmlParseTryOrFinish",
        "harness": "html.c",
        "fix_commit": "123234f2cfcd9e9b9f83047eee1dc17b4c3f4407",
        "arvo_id": None,
        "repo": "GNOME/libxml2",
        "repo_url": "https://gitlab.gnome.org/GNOME/libxml2",
    },
    {
        "project": "libxml2",
        "id": "CVE-2020-24977",
        "type": "Global/heap over-read; truncated UTF-8 in error formatting (xmllint CLI)",
        "file": "xmllint.c",
        "function": "xmlHTMLEncodeSend",
        "harness": "xmllint",
        "fix_commit": "50f06b3efb638efb0abd95dc62dca05ae67882c2",
        "arvo_id": None,
        "repo": "GNOME/libxml2",
        "repo_url": "https://gitlab.gnome.org/GNOME/libxml2",
        "notes": "CLI path via xmllint --htmlout, not a fuzz/*.c harness.",
    },
    {
        "project": "libxml2",
        "id": "CVE-2021-3517",
        "type": "Heap-buffer-overflow (read); invalid UTF-8 attribute content",
        "file": "entities.c",
        "function": "xmlEncodeEntitiesInternal",
        "harness": "xml.c",
        "fix_commit": "bf22713507fe1fc3a2c4b525cf0a88c2dc87a3a2",
        "arvo_id": None,
        "repo": "GNOME/libxml2",
        "repo_url": "https://gitlab.gnome.org/GNOME/libxml2",
    },
    {
        "project": "libxml2",
        "id": "CVE-2021-3518",
        "type": "Use-after-free processing crafted XInclude",
        "file": "xinclude.c",
        "function": "xmlXIncludeDoProcess",
        "harness": "xml.c",
        "fix_commit": "1098c30a040e72a4654968547f415be4e4c40fe7",
        "arvo_id": None,
        "repo": "GNOME/libxml2",
        "repo_url": "https://gitlab.gnome.org/GNOME/libxml2",
    },
    {
        "project": "libxml2",
        "id": "CVE-2021-3537",
        "type": "NULL-deref (DoS); errors not propagated in mixed content",
        "file": "valid.c",
        "function": "xmlValidBuildAContentModel",
        "harness": "xml.c",
        "fix_commit": "babe75030c7f64a37826bb3342317134568bef61",
        "arvo_id": None,
        "repo": "GNOME/libxml2",
        "repo_url": "https://gitlab.gnome.org/GNOME/libxml2",
    },
    {
        "project": "libxml2",
        "id": "CVE-2022-29824",
        "type": "Integer overflow -> OOB write in buffer grow",
        "file": "buf.c",
        "function": "xmlBufAdd",
        "harness": "xml.c",
        "fix_commit": "2554a2408e09f13652049e5ffb0d26196b02ebab",
        "arvo_id": None,
        "repo": "GNOME/libxml2",
        "repo_url": "https://gitlab.gnome.org/GNOME/libxml2",
    },
    {
        "project": "libxml2",
        "id": "CVE-2022-40303",
        "type": "Integer overflow with XML_PARSE_HUGE on >2^32 char names",
        "file": "parser.c",
        "function": "xmlParseNameComplex",
        "harness": "xml.c",
        "fix_commit": "c846986356fc149915a74972bf198abc266bc2c0",
        "arvo_id": None,
        "repo": "GNOME/libxml2",
        "repo_url": "https://gitlab.gnome.org/GNOME/libxml2",
        "parse_options": "XML_PARSE_HUGE",
    },
    {
        "project": "libxml2",
        "id": "CVE-2022-40304",
        "type": "UAF / double-free; bad hash for empty dict strings",
        "file": "dict.c",
        "function": "xmlDictComputeFastKey",
        "harness": "xml.c",
        "fix_commit": "1b41ec4e9433b05bb0376be4725804c54ef1d80b",
        "arvo_id": None,
        "repo": "GNOME/libxml2",
        "repo_url": "https://gitlab.gnome.org/GNOME/libxml2",
    },
    {
        "project": "libxml2",
        "id": "CVE-2023-28484",
        "type": "NULL-deref (DoS) parsing invalid XSD schema",
        "file": "xmlschemas.c",
        "function": "xmlSchemaFixupComplexType",
        "harness": "schema.c",
        "fix_commit": "647e072ea0a2f12687fa05c172f4c4713fdb0c4f",
        "arvo_id": None,
        "repo": "GNOME/libxml2",
        "repo_url": "https://gitlab.gnome.org/GNOME/libxml2",
    },
    # ndpi (replaces mruby): 12 CyberGym nDPI tasks, each a self-contained
    # protocol dissector parsing a flat packet buffer with explicit bounds
    # checks -- the tcpdump-style, KLEE-tractable shape. arvo_id, crash_line,
    # version and version_describe are all backfilled from CyberGym + ARVO-Meta.
    {
        "project": "ndpi",
        "id": "bittorrent-oob-read",
        "type": "Heap-buffer-overflow (read); BitTorrent dissector",
        "file": "src/lib/protocols/bittorrent.c",
        "function": "ndpi_search_bittorrent",
        "harness": "fuzz_ndpi_reader.c",
        "fix_commit": "f95bdaf625a540cbd040508bfbb8808223f97aed",
        "arvo_id": "55218",
        "repo": "ntop/nDPI",
        "repo_url": "https://github.com/ntop/nDPI",
        "crash_line": 498,
        "crash_line_confidence": "high",
        "version": "4.4",
        "version_describe": "3.4-1188-gedb8165ab",
    },
    {
        "project": "ndpi",
        "id": "raknet-oob-read",
        "type": "Heap-buffer-overflow (read); RakNet dissector",
        "file": "src/lib/protocols/raknet.c",
        "function": "ndpi_search_raknet",
        "harness": "fuzz_ndpi_reader.c",
        "fix_commit": "d5005f584c4baf67e084e3bc8b052ca27004550e",
        "arvo_id": "47000",
        "repo": "ntop/nDPI",
        "repo_url": "https://github.com/ntop/nDPI",
        "crash_line": 152,
        "crash_line_confidence": "high",
        "version": "4.2",
        "version_describe": "3.4-777-gbc2ad3407",
    },
    {
        "project": "ndpi",
        "id": "openvpn-oob-read",
        "type": "Heap-buffer-overflow (read); OpenVPN dissector",
        "file": "src/lib/protocols/openvpn.c",
        "function": "ndpi_search_openvpn",
        "harness": "fuzz_ndpi_reader.c",
        "fix_commit": "8e7b1ea7a136cc4e4aa9880072ec2d69900a825e",
        "arvo_id": "22244",
        "repo": "ntop/nDPI",
        "repo_url": "https://github.com/ntop/nDPI",
        "crash_line": 125,
        "crash_line_confidence": "high",
        "version": "3.2",
        "version_describe": "1.8-1965-ge90c5c7c3",
    },
    {
        "project": "ndpi",
        "id": "amazon-video-oob-read",
        "type": "Heap-buffer-overflow (read); Amazon Video dissector",
        "file": "src/lib/protocols/amazon_video.c",
        "function": "ndpi_check_amazon_video",
        "harness": "fuzz_ndpi_reader.c",
        "fix_commit": "c7efd0892f1f9299360956b740044a798123a773",
        "arvo_id": "19100",
        "repo": "ntop/nDPI",
        "repo_url": "https://github.com/ntop/nDPI",
        "crash_line": 39,
        "crash_line_confidence": "high",
        "version": "3.0",
        "version_describe": "1.8-1577-gae9429408",
    },
    {
        "project": "ndpi",
        "id": "netbios-oob-read",
        "type": "Heap-buffer-overflow (read); NetBIOS name parse",
        "file": "src/lib/protocols/netbios.c",
        "function": "ndpi_netbios_name_interpret",
        "harness": "fuzz_ndpi_reader.c",
        "fix_commit": "7a2bcd9c395f9fe554109e04add33e9e65564d82",
        "arvo_id": "20823",
        "repo": "ntop/nDPI",
        "repo_url": "https://github.com/ntop/nDPI",
        "crash_line": 50,
        "crash_line_confidence": "high",
        "version": "3.2",
        "version_describe": "1.8-1796-gfe513014a",
    },
    {
        "project": "ndpi",
        "id": "kerberos-oob-read",
        "type": "Heap-buffer-overflow (read); Kerberos dissector",
        "file": "src/lib/protocols/kerberos.c",
        "function": "ndpi_search_kerberos",
        "harness": "fuzz_ndpi_reader.c",
        "fix_commit": "7051acc0b5b8046b6415a454a2eff4fffa18396b",
        "arvo_id": "23021",
        "repo": "ntop/nDPI",
        "repo_url": "https://github.com/ntop/nDPI",
        "crash_line": 291,
        "crash_line_confidence": "high",
        "version": "3.2",
        "version_describe": "1.8-2294-g580859a47",
    },
    {
        "project": "ndpi",
        "id": "capwap-oob-read",
        "type": "Heap-buffer-overflow (read); CAPWAP dissector",
        "file": "src/lib/protocols/capwap.c",
        "function": "ndpi_search_setup_capwap",
        "harness": "fuzz_ndpi_reader.c",
        "fix_commit": "4976d93d4e7ce5e63cb562fb7f0f916c3103e2de",
        "arvo_id": "21000",
        "repo": "ntop/nDPI",
        "repo_url": "https://github.com/ntop/nDPI",
        "crash_line": 69,
        "crash_line_confidence": "high",
        "version": "3.2",
        "version_describe": "1.8-1793-g1e933e8b0",
    },
    {
        "project": "ndpi",
        "id": "stun-oob-read",
        "type": "Heap-buffer-overflow (read); STUN dissector",
        "file": "src/lib/protocols/stun.c",
        "function": "ndpi_int_check_stun",
        "harness": "fuzz_ndpi_reader.c",
        "fix_commit": "843204299c79c55c736231c06db98def2b3a6bba",
        "arvo_id": "19332",
        "repo": "ntop/nDPI",
        "repo_url": "https://github.com/ntop/nDPI",
        "crash_line": 319,
        "crash_line_confidence": "high",
        "version": "3.0",
        "version_describe": "1.8-1617-g09cd95d54",
    },
    {
        "project": "ndpi",
        "id": "tinc-oob-read",
        "type": "Heap-buffer-overflow (read); TINC dissector",
        "file": "src/lib/protocols/tinc.c",
        "function": "ndpi_check_tinc",
        "harness": "fuzz_ndpi_reader.c",
        "fix_commit": "06a0abb6fdf8fb7a446ef5aafdf2c7d24608977f",
        "arvo_id": "46499",
        "repo": "ntop/nDPI",
        "repo_url": "https://github.com/ntop/nDPI",
        "crash_line": 105,
        "crash_line_confidence": "high",
        "version": "4.2",
        "version_describe": "3.4-756-ge3faecf9d",
    },
    {
        "project": "ndpi",
        "id": "imap-index-oob",
        "type": "Index-out-of-bounds (read); IMAP dissector",
        "file": "src/lib/protocols/mail_imap.c",
        "function": "ndpi_search_mail_imap_tcp",
        "harness": "fuzz_ndpi_reader.c",
        "fix_commit": "933351840dbed3646aeb4f75a359649434b001eb",
        "arvo_id": "20830",
        "repo": "ntop/nDPI",
        "repo_url": "https://github.com/ntop/nDPI",
        "crash_line": 167,
        "crash_line_confidence": "high",
        "version": "3.2",
        "version_describe": "1.8-1784-g83fdfe24d",
    },
    {
        "project": "ndpi",
        "id": "softether-oob-read",
        "type": "Heap-buffer-overflow (read); SoftEther dissector",
        "file": "src/lib/protocols/softether.c",
        "function": "dissect_softether_ip_port",
        "harness": "fuzz_ndpi_reader.c",
        "fix_commit": "8b6a00f84bff9c998643d823502ae9f924fce528",
        "arvo_id": "49638",
        "repo": "ntop/nDPI",
        "repo_url": "https://github.com/ntop/nDPI",
        "crash_line": 301,
        "crash_line_confidence": "high",
        "version": "4.4",
        "version_describe": "3.4-982-gd54d5083b",
    },
    {
        "project": "ndpi",
        "id": "tls-clienthello-oob-read",
        "type": "Heap-buffer-overflow (read); TLS ClientHello parse",
        "file": "src/lib/protocols/tls.c",
        "function": "processClientServerHello",
        "harness": "fuzz_ndpi_reader.c",
        "fix_commit": "308f71a6e80751eae09f08cdfdc996a77510e5a5",
        "arvo_id": "65362",
        "repo": "ntop/nDPI",
        "repo_url": "https://github.com/ntop/nDPI",
        "crash_line": 2391,
        "crash_line_confidence": "high",
        "version": "4.8",
        "version_describe": "3.4-1632-gd886a6107",
    },
]

LIBXML2_DRIVER_FILES = ["fuzz/fuzz.c", "fuzz/fuzz.h", "fuzz/oss-fuzz-build.sh"]
MRUBY_DRIVER_FILES = [
    "oss-fuzz/mruby_fuzzer.c",
]
NDPI_DRIVER_FILES = [
    "fuzz/fuzz_ndpi_reader.c",
    "fuzz/fuzz_common_code.c",
]

OSSFUZZ_STUBS = {
    "libxml2": [
        "projects/libxml2/build.sh",
        "projects/libxml2/Dockerfile",
        "projects/libxml2/project.yaml",
    ],
    "mruby": [
        "projects/mruby/build.sh",
        "projects/mruby/Dockerfile",
        "projects/mruby/project.yaml",
    ],
    "ndpi": [
        "projects/ndpi/build.sh",
        "projects/ndpi/Dockerfile",
        "projects/ndpi/project.yaml",
    ],
}

# non-libxml2 projects: OSS-Fuzz driver/harness files fetched from the project repo
DRIVER_FILES = {
    "mruby": MRUBY_DRIVER_FILES,
    "ndpi": NDPI_DRIVER_FILES,
}


def fetch(url: str, retries: int = 3) -> bytes | None:
    for attempt in range(retries):
        result = subprocess.run(
            ["curl", "-sfL", "--max-time", "30", url],
            capture_output=True,
        )
        if result.returncode == 0:
            return result.stdout
        if attempt == retries - 1:
            print(f"  WARN: curl failed ({result.returncode}) for {url}", file=sys.stderr)
    return None


def github_raw(repo: str, path: str, ref: str = "master") -> str:
    return f"https://raw.githubusercontent.com/{repo}/{ref}/{path}"


def get_parent_commit(repo: str, fix_commit: str) -> str | None:
    url = f"https://api.github.com/repos/{repo}/commits/{fix_commit}"
    data = fetch(url)
    if not data:
        return None
    commit = json.loads(data)
    parents = commit.get("parents", [])
    return parents[0]["sha"] if parents else None


def write_if_fetched(dest: Path, url: str) -> bool:
    content = fetch(url)
    if content is None:
        return False
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(content)
    return True


def make_readme(bug: dict, bug_dir: Path, vuln_commit: str | None) -> str:
    lines = [
        f"# {bug['id']}",
        "",
        f"**Project:** {bug['project']}",
        f"**Type:** {bug['type']}",
        f"**Vulnerable file:** `{bug['file']}` → `{bug['function']}`",
        f"**Harness / driver:** `{bug['harness']}`",
        f"**Fix commit:** `{bug['fix_commit']}`",
    ]
    if vuln_commit:
        lines.append(f"**Vulnerable commit (parent of fix):** `{vuln_commit}`")
    if bug.get("issue"):
        lines.append(f"**Upstream issue:** {bug['repo_url']}/issues/{bug['issue']}")
    if bug.get("arvo_id"):
        lines.append(f"**ARVO / OSS-Fuzz local ID:** arvo:{bug['arvo_id']}")
        lines.append(f"**ARVO repro:** `docker run -it n132/arvo:{bug['arvo_id']}-vul arvo`")
    if bug.get("notes"):
        lines.append(f"\n**Note:** {bug['notes']}")
    if bug.get("parse_options"):
        lines.append(f"**Parse options:** `{bug['parse_options']}`")

    lines.extend(
        [
            "",
            "## Layout",
            "",
            "| Path | Description |",
            "|---|---|",
            "| `driver/` | OSS-Fuzz fuzz harness(es) and shared helpers |",
            "| `stubs/` | OSS-Fuzz build scripts (`build.sh`, `Dockerfile`, `project.yaml`) |",
            "| `vulnerable/` | Pre-patch source of the vulnerable file at the parent of the fix commit |",
            "| `patch/` | Upstream fix as a unified diff |",
            "| `poc/` | Ground-truth PoC input (fetch instructions if not bundled) |",
            "",
            "## Reproduce",
            "",
            "1. Check out the upstream repo at the vulnerable commit (see `metadata.json`).",
            "2. Build with ASAN using the OSS-Fuzz stubs in `stubs/` and the driver in `driver/`.",
            "3. Run the fuzz target against the PoC in `poc/` (or fetch from ARVO if noted).",
            "4. Apply `patch/fix.patch` and confirm the crash no longer reproduces.",
            "",
        ]
    )
    return "\n".join(lines)


def make_poc_readme(bug: dict) -> str:
    lines = [
        "# PoC",
        "",
        "Ground-truth crash input for this bug.",
        "",
    ]
    if bug.get("arvo_id"):
        lines.extend(
            [
                f"Fetch from ARVO (recommended):",
                "",
                "```bash",
                f"docker run -it n132/arvo:{bug['arvo_id']}-vul arvo",
                "```",
                "",
                f"Or download metadata: https://github.com/n132/ARVO-Meta/blob/master/archive_data/meta/{bug['arvo_id']}.json",
                "",
            ]
        )
    else:
        lines.extend(
            [
                "No ARVO local ID mapped for this bug. Options:",
                "",
                f"- Search OSS-Fuzz issues for fix commit `{bug['fix_commit'][:12]}`",
                f"- Check CyberGym `tasks.json` for `{bug['project']}` entries matching this CVE/issue",
                f"- Build at the vulnerable commit and fuzz with the driver in `../driver/`",
                "",
            ]
        )
    return "\n".join(lines)


def populate_bug(bug: dict) -> None:
    project = bug["project"]
    bug_id = bug["id"]
    bug_dir = ROOT / project / bug_id
    print(f"Populating {project}/{bug_id}...")

    for sub in ("driver", "stubs", "vulnerable", "patch", "poc"):
        (bug_dir / sub).mkdir(parents=True, exist_ok=True)

    repo = bug["repo"]
    fix = bug["fix_commit"]
    vuln_commit = get_parent_commit(repo, fix)

    # metadata.json
    metadata = {**bug, "vulnerable_commit": vuln_commit}
    (bug_dir / "metadata.json").write_text(json.dumps(metadata, indent=2) + "\n")

    # README
    (bug_dir / "README.md").write_text(make_readme(bug, bug_dir, vuln_commit))

    # patch
    patch_url = f"https://github.com/{repo}/commit/{fix}.patch"
    write_if_fetched(bug_dir / "patch" / "fix.patch", patch_url)

    # vulnerable source at parent commit
    if vuln_commit:
        src_path = bug["file"]
        url = github_raw(repo, src_path, vuln_commit)
        dest = bug_dir / "vulnerable" / Path(src_path).name
        if not write_if_fetched(dest, url):
            print(f"  WARN: could not fetch vulnerable/{Path(src_path).name}")

    # driver files
    if project == "libxml2":
        harness = bug["harness"]
        if harness != "xmllint":
            for rel in LIBXML2_DRIVER_FILES + [f"fuzz/{harness}"]:
                name = Path(rel).name
                write_if_fetched(bug_dir / "driver" / name, github_raw(repo, rel))
        else:
            (bug_dir / "driver" / "README.md").write_text(
                "# Driver\n\nThis bug is reached via the **xmllint** CLI (`--htmlout`), "
                "not a libFuzzer harness. See `../vulnerable/xmllint.c` and build xmllint "
                "from the vulnerable libxml2 tree.\n"
            )
            if vuln_commit:
                write_if_fetched(
                    bug_dir / "driver" / "xmllint.c",
                    github_raw(repo, "xmllint.c", vuln_commit),
                )
    else:
        for rel in DRIVER_FILES[project]:
            write_if_fetched(bug_dir / "driver" / Path(rel).name, github_raw(repo, rel))

    # OSS-Fuzz stubs
    for rel in OSSFUZZ_STUBS[project]:
        name = Path(rel).name
        write_if_fetched(
            bug_dir / "stubs" / name,
            github_raw("google/oss-fuzz", rel, "master"),
        )

    # poc placeholder
    (bug_dir / "poc" / "README.md").write_text(make_poc_readme(bug))


def main() -> None:
    for bug in BUGS:
        populate_bug(bug)
    print(f"\nDone. Populated {len(BUGS)} bug folders under {ROOT}.")


if __name__ == "__main__":
    main()
