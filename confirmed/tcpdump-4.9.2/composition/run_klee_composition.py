#!/usr/bin/env python3
"""KLEE composition-reachability runner for composition/driver_NN_MM.c pairs."""
import argparse
import concurrent.futures
import csv
import glob
import os
import re
import shutil
import sqlite3
import subprocess
import sys
import time

HOME = os.path.expanduser("~")
LLVM_BIN = os.path.join(HOME, "toolchains", "llvm13", "bin")
COMPAT_LIBS = os.path.join(HOME, "toolchains", "compat_libs")
KLEE_INCLUDE = "/snap/klee/20/usr/local/include"

CLANG = os.path.join(LLVM_BIN, "clang")
LLVM_LINK = os.path.join(LLVM_BIN, "llvm-link")
KLEE = "klee"
KTEST_TOOL = "klee.ktest-tool"

ENV = dict(os.environ)
ENV["LD_LIBRARY_PATH"] = COMPAT_LIBS + ":" + ENV.get("LD_LIBRARY_PATH", "")
ENV["PATH"] = ENV.get("PATH", "") + ":/snap/bin"

DONE_RE = {
    "instructions": re.compile(r"KLEE: done: total instructions = (\d+)"),
    "completed_paths": re.compile(r"KLEE: done: completed paths = (\d+)"),
    "partial_paths": re.compile(r"KLEE: done: partially completed paths = (\d+)"),
    "generated_tests": re.compile(r"KLEE: done: generated tests = (\d+)"),
}


def run(cmd, cwd=None, log=None, timeout=None):
    proc = subprocess.run(cmd, cwd=cwd, env=ENV, stdout=subprocess.PIPE,
                           stderr=subprocess.STDOUT, timeout=timeout, text=True)
    if log is not None:
        with open(log, "a") as f:
            f.write("$ " + " ".join(cmd) + "\n")
            f.write(proc.stdout or "")
            f.write("\n")
    return proc.returncode, proc.stdout or ""


def compile_predicates(comp_dir, results_dir, log):
    os.makedirs(results_dir, exist_ok=True)
    for i in range(1, 13):
        nn = f"{i:02d}"
        src = os.path.join(comp_dir, f"predicate_{nn}.c")
        out = os.path.join(results_dir, f"p{nn}.bc")
        if os.path.exists(out):
            continue
        rc, _ = run([CLANG, "-emit-llvm", "-c", "-g", "-O0",
                     "-Xclang", "-disable-O0-optnone", src, "-o", out], log=log)
        if rc != 0:
            raise RuntimeError(f"predicate {nn} compile failed, see {log}")


def parse_info(info_path):
    metrics = {k: None for k in DONE_RE}
    if not os.path.exists(info_path):
        return metrics
    with open(info_path, errors="replace") as f:
        text = f.read()
    for key, pat in DONE_RE.items():
        m = pat.search(text)
        if m:
            metrics[key] = int(m.group(1))
    return metrics


def parse_solver_time(run_stats_path):
    if not os.path.exists(run_stats_path):
        return None
    try:
        con = sqlite3.connect(run_stats_path)
        cur = con.cursor()
        cur.execute("SELECT SolverTime FROM stats ORDER BY rowid DESC LIMIT 1")
        row = cur.fetchone()
        con.close()
        if row is None or row[0] is None:
            return None
        return row[0] / 1e6  # microseconds -> seconds
    except sqlite3.Error:
        return None


def find_witness_ktest(klee_out_dir):
    """Return path to the .ktest paired with the earliest assert.err, or None if UNSAT."""
    errs = sorted(glob.glob(os.path.join(klee_out_dir, "test*.assert.err")))
    if not errs:
        return None
    base = os.path.basename(errs[0]).split(".")[0]  # testNNNNNN
    ktest = os.path.join(klee_out_dir, base + ".ktest")
    return ktest if os.path.exists(ktest) else None


def parse_ktest(ktest_path, log):
    rc, out = run([KTEST_TOOL, ktest_path], log=log)
    if rc != 0:
        return None, None
    buf_hex, length = None, None
    cur_name = None
    for line in out.splitlines():
        m = re.match(r"object \d+: name: '(\w+)'", line)
        if m:
            cur_name = m.group(1)
            continue
        if cur_name == "buf":
            m = re.match(r"object \d+: hex\s*: (0x[0-9a-fA-F]+)", line)
            if m:
                buf_hex = m.group(1)
        if cur_name == "len":
            m = re.match(r"object \d+: uint: (\d+)", line)
            if m:
                length = int(m.group(1))
    return buf_hex, length


def process_pair(pair, comp_dir, results_dir, predicates_dir, max_time, timeout_margin, force=False):
    nn, mm = pair
    name = f"{nn}_{mm}"
    pair_dir = os.path.join(results_dir, name)
    os.makedirs(pair_dir, exist_ok=True)
    log = os.path.join(pair_dir, "build_run.log")

    driver_src = os.path.join(comp_dir, f"driver_{name}.c")
    d_bc = os.path.join(pair_dir, "d.bc")
    linked_bc = os.path.join(pair_dir, "linked.bc")
    klee_out = os.path.join(pair_dir, "klee-out")

    row = {"Bug_Pair": name, "SAT_UNSAT": "ERROR", "Solver_Time_s": None,
           "Instructions": None, "Completed_Paths": None, "Partial_Paths": None,
           "Test_Cases": None}

    already_done = (not force and os.path.exists(os.path.join(klee_out, "info"))
                     and "KLEE: done: generated tests" in
                     open(os.path.join(klee_out, "info"), errors="replace").read())

    try:
        if not already_done:
            open(log, "w").close()
            rc, _ = run([CLANG, "-emit-llvm", "-c", "-g", "-O0", "-Xclang",
                         "-disable-O0-optnone", "-I", KLEE_INCLUDE, driver_src,
                         "-o", d_bc], log=log)
            if rc != 0:
                return row

            p_nn = os.path.join(predicates_dir, f"p{nn}.bc")
            p_mm = os.path.join(predicates_dir, f"p{mm}.bc")
            rc, _ = run([LLVM_LINK, d_bc, p_nn, p_mm, "-o", linked_bc], log=log)
            if rc != 0:
                return row

            if os.path.exists(klee_out):
                shutil.rmtree(klee_out)

            try:
                run([KLEE, f"--max-time={max_time}", f"--output-dir={klee_out}",
                     "--only-output-states-covering-new", "--max-memory=1500",
                     linked_bc], cwd=pair_dir, log=log, timeout=max_time + timeout_margin)
            except subprocess.TimeoutExpired:
                with open(log, "a") as f:
                    f.write(f"\n[driver timed out past max-time+{timeout_margin}s external guard]\n")

        info_metrics = parse_info(os.path.join(klee_out, "info"))
        solver_time = parse_solver_time(os.path.join(klee_out, "run.stats"))
        witness = find_witness_ktest(klee_out)

        row.update({
            "SAT_UNSAT": "SAT" if witness else "UNSAT",
            "Solver_Time_s": round(solver_time, 3) if solver_time is not None else None,
            "Instructions": info_metrics["instructions"],
            "Completed_Paths": info_metrics["completed_paths"],
            "Partial_Paths": info_metrics["partial_paths"],
            "Test_Cases": info_metrics["generated_tests"],
        })

        if witness:
            buf_hex, length = parse_ktest(witness, log)
            if buf_hex is not None and length is not None:
                body = buf_hex[2:]  # strip "0x"
                buf_hex = "0x" + body[: 2 * length]
            row["_buf_hex"] = buf_hex
            row["_length"] = length
            row["_witness"] = witness

    except Exception as e:
        with open(log, "a") as f:
            f.write(f"\n[EXCEPTION] {e!r}\n")

    return row


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--comp-dir", default=os.getcwd())
    ap.add_argument("--jobs", type=int, default=4)
    ap.add_argument("--max-time", type=int, default=300)
    ap.add_argument("--timeout-margin", type=int, default=60)
    ap.add_argument("--only", nargs="*", default=None,
                     help="restrict to these pair names e.g. 01_02 03_04")
    ap.add_argument("--force", action="store_true",
                     help="re-run KLEE even if a completed klee-out/info already exists")
    args = ap.parse_args()

    comp_dir = os.path.abspath(args.comp_dir)
    results_dir = os.path.join(comp_dir, "klee_results")
    predicates_dir = os.path.join(results_dir, "predicates")

    print(f"[+] compiling predicates -> {predicates_dir}", flush=True)
    compile_predicates(comp_dir, predicates_dir, os.path.join(results_dir, "predicates_build.log"))

    drivers = sorted(glob.glob(os.path.join(comp_dir, "driver_*_*.c")))
    pairs = []
    for d in drivers:
        m = re.match(r"driver_(\d+)_(\d+)\.c$", os.path.basename(d))
        if m:
            pairs.append((m.group(1), m.group(2)))

    if args.only:
        wanted = set(args.only)
        pairs = [p for p in pairs if f"{p[0]}_{p[1]}" in wanted]

    print(f"[+] {len(pairs)} driver pairs queued, jobs={args.jobs}", flush=True)

    rows = []
    t0 = time.time()
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs) as ex:
        futs = {ex.submit(process_pair, p, comp_dir, results_dir, predicates_dir,
                           args.max_time, args.timeout_margin, args.force): p for p in pairs}
        done_count = 0
        for fut in concurrent.futures.as_completed(futs):
            p = futs[fut]
            row = fut.result()
            rows.append(row)
            done_count += 1
            elapsed = time.time() - t0
            print(f"[{done_count}/{len(pairs)}] {row['Bug_Pair']}: {row['SAT_UNSAT']} "
                  f"(instr={row['Instructions']} tests={row['Test_Cases']}) "
                  f"[{elapsed:.0f}s elapsed]", flush=True)

    rows.sort(key=lambda r: tuple(map(int, r["Bug_Pair"].split("_"))))

    metrics_csv = os.path.join(comp_dir, "metrics.csv")
    with open(metrics_csv, "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=["Bug_Pair", "SAT_UNSAT", "Solver_Time_s",
                                           "Instructions", "Completed_Paths",
                                           "Partial_Paths", "Test_Cases"])
        w.writeheader()
        for r in rows:
            w.writerow({k: r.get(k) for k in w.fieldnames})

    shared_csv = os.path.join(comp_dir, "shared_inputs.csv")
    with open(shared_csv, "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["bug_pair", "buffer_hex", "length"])
        for r in rows:
            if r["SAT_UNSAT"] == "SAT":
                w.writerow([r["Bug_Pair"], r.get("_buf_hex"), r.get("_length")])

    print(f"[+] wrote {metrics_csv}", flush=True)
    print(f"[+] wrote {shared_csv}", flush=True)
    print(f"[+] total elapsed: {time.time()-t0:.0f}s", flush=True)


if __name__ == "__main__":
    main()
