"""Install the latest drawings into the doc folders.

    install.py inventory.json rendered_dir schematics_dir ai_dir

- schematics_dir/<group>/<page>.png   <- rendered_dir/<group>/<page>.png
- ai_dir/<group>/<page>.drw           <- the newest readable drw on the tapes
- ai_dir/<group>/<other files>        <- the design files from the tape
  directories those drws came from (wire lists, ECOs, PROM images, ...);
  where two directories of a group have the same file name the newer
  file wins.  ITS housekeeping files, dump logs, numbered text versions,
  mail, editor backups and XGP plot files are skipped.

Both folders get a drw-index.txt naming the source of every file.  Files
listed in a previous drw-index.txt that are no longer selected are removed;
files that were never installed by this script are left alone.
"""

import datetime
import json
import os
import re
import shutil
import sys
import zoneinfo

ROOT = os.environ.get("ITS_TAPES", "")
TZ = zoneinfo.ZoneInfo("America/New_York")
GROUPS = {"cadr", "cadr1", "cadrdc", "cadrio", "cadrm", "cadrmw", "cadrtv", "chaos", "lmdoc", "cadrpc"}

SKIP_EXT = {
    "(init)", "(file)", "(dir)", "mail", "bak", "old", "emacs", "msg", "tags", "log", "login", "logout",
    "answer", "output", "notinf", "newsys", "kbd", "flavor", "fixes", "lights", "lispm", "lispm1",
    "lispm9", "lspm10", "lspm11", "lspm12", "lspm13", "let", "let1", "let2", "let3", "let4", "let5",
    "dover", "dplots", "direct", "compar", "patch", "patxy", "patape", "mwtape", "mwt1", "mwt2",
    "mwt3", "nocr1", "nocr2", "nocr3", "xan1", "xan2", "xan3", "pfiles", "pc", "tem", "plt", "inp",
    "setup", "sai", "plans", "caios", "i{o", "decks", "xylogi", "scrbin", "doc",
}


def skip(fn):
    ext = fn.rsplit(".", 1)[-1] if "." in fn else ""
    return (fn.startswith("-") or fn.startswith("_") or "|" in fn or fn.endswith("#")
            or re.search(r"\.\d+$", fn) is not None or ext in SKIP_EXT or fn == ".DS_Store")


def date_of(p):
    return datetime.datetime.fromtimestamp(os.stat(p).st_mtime, TZ).strftime("%d-%b-%y %H:%M").upper()


def previous(index_path):
    if not os.path.exists(index_path):
        return set()
    return set(l.split()[0] for l in open(index_path) if l.strip() and not l.startswith("#"))


def notes(all_entries):
    """Comment lines for the indexes: pages that could not be installed
    because no copy on the tapes is readable, and pages where a newer copy
    exists but is unreadable (the older readable one is installed)."""
    out = []
    missing = [e for e in all_entries if not e["latest"]["ok"]]
    if missing:
        out.append("#")
        out.append("# pages with no readable copy on the tapes, not installed (newest copy; see drwtools/drw-index.txt for why it is unreadable):")
        for e in missing:
            out.append("#   %-7s %-12s %s %s" % (e["group"], e["name"], e["latest"]["date"], e["latest"]["path"]))
    newer = [e for e in all_entries if e["latest"]["ok"] and e["newer_unreadable"]]
    out.append("#")
    if newer:
        out.append("# pages where a NEWER copy exists but is unreadable; the older readable copy is installed:")
        for e in newer:
            out.append("#   %-7s %-12s installed %s; unreadable newer: %s" % (e["group"], e["name"], e["latest"]["date"], ", ".join(e["newer_unreadable"])))
    else:
        out.append("# no page has a newer copy that is unreadable: every installed page is the newest copy on the tapes")
    return "\n".join(out) + "\n"


def main(inv_path, rendered, schem, ai):
    all_entries = sorted((e for e in json.load(open(inv_path)) if e["group"] in GROUPS), key=lambda e: (e["group"], e["name"]))
    inv = [e for e in all_entries if e["latest"]["ok"]]

    # --- pngs
    old = previous(os.path.join(schem, "drw-index.txt"))
    new = set()
    with open(os.path.join(schem, "drw-index.txt"), "w") as ix:
        ix.write("# <group>/<page>.png rendered (doc/drwtools) from this drw on the ITS tape dumps (ITS file date, Boston time)\n")
        for e in inv:
            g, n = e["group"], e["name"][:-4]
            rel = "%s/%s.png" % (g, n)
            src = os.path.join(rendered, rel)
            if not os.path.exists(src):
                continue
            os.makedirs(os.path.join(schem, g), exist_ok=True)
            shutil.copy2(src, os.path.join(schem, rel))
            new.add(rel)
            ix.write("%-20s %-15s %s\n" % (rel, e["latest"]["date"], e["latest"]["path"]))
        ix.write(notes(all_entries))
    for rel in old - new:
        p = os.path.join(schem, rel)
        if os.path.exists(p):
            os.remove(p)
    print("schematics: %d png installed, %d stale removed" % (len(new), len(old - new)))

    # --- drw and associated files
    plan = {}
    src_dirs = {}
    for e in inv:
        g = e["group"]
        src = os.path.join(ROOT, e["latest"]["path"])
        plan[(g, e["name"])] = (float("inf"), src)
        src_dirs.setdefault(g, set()).add(os.path.dirname(src))
    for g, dirs in src_dirs.items():
        for d in sorted(dirs):
            for fn in os.listdir(d):
                if ".drw" in fn.lower() or skip(fn):
                    continue
                p = os.path.join(d, fn)
                if not os.path.isfile(p):
                    continue
                key = (g, fn.lower())
                mt = os.stat(p).st_mtime
                if key not in plan or mt > plan[key][0]:
                    plan[key] = (mt, p)
    old = previous(os.path.join(ai, "drw-index.txt"))
    new = set()
    counts = {}
    with open(os.path.join(ai, "drw-index.txt"), "w") as ix:
        ix.write("# <group>/<file> = this file on the ITS tape dumps (ITS file date, Boston time); drw = newest readable copy, other files from the same tape directories\n")
        for (g, fn), (mt, src) in sorted(plan.items()):
            rel = "%s/%s" % (g, fn)
            os.makedirs(os.path.join(ai, g), exist_ok=True)
            shutil.copy2(src, os.path.join(ai, rel))
            new.add(rel)
            counts[g] = counts.get(g, 0) + 1
            ix.write("%-24s %-15s %s\n" % (rel, date_of(src), os.path.relpath(src, ROOT)))
        ix.write(notes(all_entries))
    for rel in old - new:
        p = os.path.join(ai, rel)
        if os.path.exists(p):
            os.remove(p)
    print("ai: %d files installed (%s), %d stale removed" % (len(new), ", ".join("%s %d" % kv for kv in sorted(counts.items())), len(old - new)))


if __name__ == "__main__":
    main(*sys.argv[1:5])
