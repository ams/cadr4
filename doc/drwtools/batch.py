"""Render a list of .drw files.

    batch.py [--copy-drw] out_dir path.drw [path.drw ...]

With --copy-drw the source drawing is copied next to its PNG as
<out_dir>/<name>.drw.

A library named in a drawing (e.g. CADR;BODIES DRW) is resolved to the
newest readable copy of that file in a directory of that name anywhere on
the volume, using scan.json; that is the same file as the library
page in latest/<group>/.  Without scan.json, or when the directory is not
on the volume, the drawing's own directory, the other directories of its
tape and the fallback directories below are searched.  Writes
<out_dir>/<name>.png and prints one line per page with the libraries used
and any warnings.
"""

import glob
import json
import os
import shutil
import sys

import render

ROOT = os.environ.get("ITS_TAPES", "")   # folder holding the ITS tape dumps
SCAN = os.path.join(os.path.dirname(os.path.abspath(__file__)), "scan.json")
UNDATED_AFTER = 631152000


def newest_copies():
    """(dir basename, file name) -> path of the newest readable dated copy,
    or a readable undated copy when no dated one exists."""
    if not os.path.exists(SCAN):
        return {}
    best = {}
    for r in json.load(open(SCAN)):
        if not r["ok"]:
            continue
        key = (r["group"], r["name"])
        mt = r["mtime"] if r["mtime"] < UNDATED_AFTER else -1
        if key not in best or mt > best[key][0]:
            best[key] = (mt, os.path.join(ROOT, r["path"]))
    return {k: v[1] for k, v in best.items()}


NEWEST = newest_copies()


def resolve(spec, page_path, search):
    fn1, fn2, sdir = spec
    p = NEWEST.get((sdir.lower(), fn1.lower() + ".drw"))
    if p:
        return p
    return render.find_library(spec, page_path, search)

FALLBACK = [
    os.path.join(ROOT, "7009559/cadrio"),
    os.path.join(ROOT, "7009559/cadrtv"),
    os.path.join(ROOT, "7008261/B7/cadr"),
]


def tape_dirs(path):
    # ROOT/<tape>/... -> every directory under that tape
    rel = os.path.relpath(os.path.abspath(path), os.path.abspath(ROOT)) if ROOT else ""
    if not ROOT or rel.startswith(".."):
        return []
    tape = os.path.join(ROOT, rel.split("/")[0])
    return sorted(set(os.path.dirname(f) for f in glob.glob(tape + "/**/*.drw", recursive=True)))


def main():
    args = sys.argv[1:]
    copy = "--copy-drw" in args
    args = [a for a in args if a != "--copy-drw"]
    out_dir = args[0]
    os.makedirs(out_dir, exist_ok=True)
    for path in args[1:]:
        name = os.path.basename(path).lower().split(".drw")[0]
        out = os.path.join(out_dir, name + ".png")
        if copy:
            shutil.copyfile(path, os.path.join(out_dir, name + ".drw"))
        search = [d for d in tape_dirs(path) if d != os.path.dirname(path)] + FALLBACK
        try:
            d, used, warn = render.render_file(path, out, search, resolver=lambda spec: resolve(spec, path, search))
            print("%-60s libs=%s %s" % (path, [os.path.relpath(u, ROOT) if ROOT else u for u in used], "; ".join(sorted(warn))))
        except Exception as e:  # noqa
            print("%-60s FAILED %r" % (path, e))


if __name__ == "__main__":
    main()
