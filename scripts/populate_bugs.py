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
    # mruby
    {
        "project": "mruby",
        "id": "CVE-2018-10191",
        "type": "Use-after-free from integer overflow in env/upvar stack",
        "file": "src/vm.c",
        "function": "mrb_vm_exec",
        "harness": "mruby_fuzzer.c",
        "fix_commit": "1905091634a6a2925c911484434448e568330626",
        "issue": "3995",
        "arvo_id": None,
        "repo": "mruby/mruby",
        "repo_url": "https://github.com/mruby/mruby",
    },
    {
        "project": "mruby",
        "id": "CVE-2018-12248",
        "type": "Heap-buffer-overflow (read); Fiber block + many transfer() args",
        "file": "src/vm.c",
        "function": "mrb_vm_exec",
        "harness": "mruby_fuzzer.c",
        "fix_commit": "778500563a9f7ceba996937dc886bd8cde29b42b",
        "issue": "4038",
        "arvo_id": None,
        "repo": "mruby/mruby",
        "repo_url": "https://github.com/mruby/mruby",
    },
    {
        "project": "mruby",
        "id": "CVE-2020-15866",
        "type": "Heap-buffer-overflow from incorrect VM stack handling",
        "file": "src/vm.c",
        "function": "mrb_yield_with_class",
        "harness": "mruby_fuzzer.c",
        "fix_commit": "6334949ba69363cb909a57d6871895bd6d98bb6b",
        "issue": "5042",
        "arvo_id": None,
        "repo": "mruby/mruby",
        "repo_url": "https://github.com/mruby/mruby",
    },
    {
        "project": "mruby",
        "id": "CVE-2025-7207",
        "type": "Heap-buffer-overflow (write past register buffer); nregs uninitialized",
        "file": "mrbgems/mruby-compiler/core/codegen.c",
        "function": "scope_new",
        "harness": "mruby_fuzzer.c",
        "fix_commit": "1fdd96104180cc0fb5d3cb086b05ab6458911bb9",
        "issue": "6509",
        "arvo_id": None,
        "repo": "mruby/mruby",
        "repo_url": "https://github.com/mruby/mruby",
    },
    {
        "project": "mruby",
        "id": "CVE-2025-13120",
        "type": "Use-after-realloc / UAF; comparator block reallocs array during sort",
        "file": "src/array.c",
        "function": "mrb_ary_sort_bang",
        "harness": "mruby_fuzzer.c",
        "fix_commit": "eb398971bfb43c38db3e04528b68ac9a7ce509bc",
        "issue": "6649",
        "arvo_id": None,
        "repo": "mruby/mruby",
        "repo_url": "https://github.com/mruby/mruby",
    },
    {
        "project": "mruby",
        "id": "issue-3926",
        "type": "Stack-overflow via unbounded recursion; nested Struct.new",
        "file": "src/class.c",
        "function": "mrb_class_path",
        "harness": "mruby_fuzzer.c",
        "fix_commit": "e5fb21b6d281e76ed1aadf488706600739b7f787",
        "issue": "3926",
        "arvo_id": None,
        "repo": "mruby/mruby",
        "repo_url": "https://github.com/mruby/mruby",
    },
    {
        "project": "mruby",
        "id": "issue-4027",
        "type": "SEGV / uninitialized-pointer deref; Hash prepend Enumerable dup",
        "file": "src/hash.c",
        "function": "mrb_hash_keys",
        "harness": "mruby_fuzzer.c",
        "fix_commit": "b64ce17852b180dfeea81cf458660be41a78974d",
        "issue": "4027",
        "arvo_id": None,
        "repo": "mruby/mruby",
        "repo_url": "https://github.com/mruby/mruby",
    },
    {
        "project": "mruby",
        "id": "OSS-Fuzz-30886",
        "type": "Heap-buffer-overflow (read); crafted heredoc indentation",
        "file": "mrbgems/mruby-compiler/core/parse.y",
        "function": "heredoc_remove_indent",
        "harness": "mruby_fuzzer.c",
        "fix_commit": "94fb86f89b131814201596d301f584dfe4547526",
        "arvo_id": "30886",
        "repo": "mruby/mruby",
        "repo_url": "https://github.com/mruby/mruby",
    },
    {
        "project": "mruby",
        "id": "OSS-Fuzz-49255",
        "type": "Heap-buffer-overflow (read 8B); bitwise XOR on big integers",
        "file": "mrbgems/mruby-bigint/core/bigint.c",
        "function": "mrb_bint_xor",
        "harness": "mruby_fuzzer.c",
        "fix_commit": "b84bca666fdc4fe94286b49b6f6b9a64e4c3a534",
        "arvo_id": "49255",
        "repo": "mruby/mruby",
        "repo_url": "https://github.com/mruby/mruby",
    },
    {
        "project": "mruby",
        "id": "issue-6158",
        "type": "Heap-buffer-overflow (misaligned read 8B) in string search",
        "file": "src/string.c",
        "function": "mrb_memsearch_ss",
        "harness": "mruby_fuzzer.c",
        "fix_commit": "e61a2881a7c9adc895416fdd409e7362130198d3",
        "issue": "6158",
        "arvo_id": "66208",
        "repo": "mruby/mruby",
        "repo_url": "https://github.com/mruby/mruby",
    },
    {
        "project": "mruby",
        "id": "issue-6477",
        "type": "Heap-buffer-overflow in the VM interpreter loop",
        "file": "src/vm.c",
        "function": "mrb_vm_exec",
        "harness": "mruby_fuzzer.c",
        "fix_commit": "4ea55109379dd84494cf5e78c90e4bcbae297684",
        "issue": "6477",
        "arvo_id": None,
        "repo": "mruby/mruby",
        "repo_url": "https://github.com/mruby/mruby",
    },
    {
        "project": "mruby",
        "id": "issue-6701",
        "type": "Heap-UAF (read 4B); memory freed in bigint GCD then reused by VM",
        "file": "src/vm.c",
        "function": "mrb_vm_exec",
        "harness": "mruby_fuzzer.c",
        "fix_commit": "e50f15c1c6e131fa7934355eb02b8173b13df415",
        "issue": "6701",
        "arvo_id": None,
        "repo": "mruby/mruby",
        "repo_url": "https://github.com/mruby/mruby",
    },
    {
        "project": "mruby",
        "id": "issue-6704",
        "type": "Heap-buffer-overflow (read); non-ASCII source under-allocates VM stack",
        "file": "src/vm.c",
        "function": "mrb_vm_exec",
        "harness": "mruby_fuzzer.c",
        "fix_commit": "e50f15c1c6e131fa7934355eb02b8173b13df415",
        "issue": "6704",
        "arvo_id": None,
        "repo": "mruby/mruby",
        "repo_url": "https://github.com/mruby/mruby",
    },
]

LIBXML2_DRIVER_FILES = ["fuzz/fuzz.c", "fuzz/fuzz.h", "fuzz/oss-fuzz-build.sh"]
MRUBY_DRIVER_FILES = [
    "oss-fuzz/mruby_fuzzer.c",
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
        for rel in MRUBY_DRIVER_FILES:
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
