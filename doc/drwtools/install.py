"""Install the latest drawings into the doc folders.

    install.py inventory.json rendered_dir schematics_dir ai_dir

- schematics_dir/<dir>/<page>.png     <- rendered_dir/<dir>/<page>.png
- ai_dir/<dir>/<page>.drw             <- the newest readable drw on the tapes,
  plus the older readable drw of a board that was superseded in place by
  another one reusing its page names (ALSO_INSTALL)
- ai_dir/<group>/<other files>        <- the design files (wire lists,
  ECOs, PROM images, ...) from every tape directory named after the group
  and from the directories the drws came from; the newest copy of each
  file name wins (see rank).  ITS housekeeping files, dump logs, numbered
  text versions, mail, editor backups and XGP plot files are skipped.

<dir> is the group, or <group>/<board> in a group that holds more than one
board under the same page names (BOARD_FOLDER); the design files stay at the
top of the group.

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
# groups whose other files are taken from every tape directory of that name,
# not only from the directories the drws came from (newer wire lists sit in
# directories that hold no drw).  Not lmdoc: those directories hold Lisp
# Machine documentation of every kind, only the figures belong here.
WIDE = GROUPS - {"lmdoc"}
UNDATED_AFTER = 631152000  # 1990-01-01: no ITS file is that recent; a later mtime is the dump's copy time

# Groups holding more than one board.  When a board is redesigned in place
# the new sheets take the old page filenames, and "newest wins" (see rank)
# then installs the successor board's page and drops the older board's
# altogether.  The title block (title1 in the SUDS trailer) is what says
# which board a drawing belongs to, so each board's pages go in a subfolder
# of the group named here, and both copies of a reused name can be kept.
# Drawings whose title block names neither board -- body libraries, pages
# inherited from an earlier machine -- stay at the top of the group.
#
# cadrtv holds two.  The SIMPLE TV, the black and white display of lmtv.stf
# (29 pages, ITS directory MAR;RTV), was replaced in December 1980 by the
# LISPM TV of lmtv4b.stf / lmtv8b.fil (25 pages, CAD;RTV), which added a
# colour map and 4- and 8-bit modes.  Both are board type LG684 and their
# backplane pages agree: the SIMPLE TV's 100 Xbus signals are a subset of
# the LISPM TV's 102, which adds COMP VIDEO OUT and TTL VIDEO DRIVE.  They
# stayed in service together -- lmtv.eco of 18-JUN-80 patches "old TV
# boards" for a check that is "extant only on new TV boards".
BOARD_FOLDER = {
    "cadrtv": {"SIMPLE TV": "simple-tv", "XBUS": "simple-tv", "LISPM TV": "lispm-tv"},
}

# Pages whose older board's copy is installed as well.  In its own revision
# of January and May 1980 MIT saved most SIMPLE TV pages under a new "n"
# name (ramadr -> nraadr, synreg -> nsyreg, xbctl -> nxbctl), and in
# December 1980 the LISPM TV took the names those had vacated.  These six
# never got an "n" name, so the LISPM TV sheet is the newest copy of each
# and the SIMPLE TV would otherwise be 23 of its 29 pages.  Both copies keep
# the name MIT gave them; the board folder is what separates them.
ALSO_INSTALL = {
    # (group, page name, title1 of the older board)
    ("cadrtv", "eclvid.drw", "SIMPLE TV"),
    ("cadrtv", "ramcas.drw", "SIMPLE TV"),
    ("cadrtv", "ramreg.drw", "SIMPLE TV"),
    ("cadrtv", "tvma.drw", "SIMPLE TV"),
    ("cadrtv", "xbadr.drw", "SIMPLE TV"),
    ("cadrtv", "xbdata.drw", "SIMPLE TV"),
}


def page_dir(e):
    """<group>, or <group>/<board> in a group that holds more than one."""
    folder = BOARD_FOLDER.get(e["group"], {}).get((e.get("title1") or "").strip())
    return "%s/%s" % (e["group"], folder) if folder else e["group"]


SKIP_EXT = {
    "(init)", "(file)", "(dir)", "mail", "bak", "old", "emacs", "msg", "tags", "log", "login", "logout",
    "answer", "output", "notinf", "newsys", "kbd", "flavor", "fixes", "lights", "lispm", "lispm1",
    "lispm9", "lspm10", "lspm11", "lspm12", "lspm13", "let", "let1", "let2", "let3", "let4", "let5",
    "dover", "dplots", "direct", "compar", "patch", "patxy", "patape", "mwtape", "mwt1", "mwt2",
    "mwt3", "nocr1", "nocr2", "nocr3", "xan1", "xan2", "xan3", "pfiles", "pc", "tem", "plt", "inp",
    "setup", "sai", "plans", "caios", "i{o", "decks", "xylogi", "scrbin", "doc", "scn",
}


def skip(fn):
    ext = fn.rsplit(".", 1)[-1] if "." in fn else ""
    return (fn.startswith("-") or fn.startswith("_") or "|" in fn or fn.endswith("#")
            or re.search(r"\.\d+$", fn) is not None or ext in SKIP_EXT or fn == ".DS_Store")


def date_of(p):
    mt = os.stat(p).st_mtime
    if mt >= UNDATED_AFTER:
        return "undated"
    return datetime.datetime.fromtimestamp(mt, TZ).strftime("%d-%b-%y %H:%M").upper()


def rank(p):
    """Order of the copies of a file: the newest ITS date wins.  Copies of
    the same minute are the same ITS file; the larger one is kept, since a
    truncated dump is the common damage.  Copies from dumps that lost the
    ITS dates rank below every dated copy and among themselves by size."""
    st = os.stat(p)
    dated = st.st_mtime < UNDATED_AFTER
    return (dated, round(st.st_mtime / 60) if dated else 0, st.st_size)


def superseded(entries):
    """The ALSO_INSTALL pages as inventory entries of their own: the newest
    readable copy carrying the older board's title block, under the same page
    name, so that page_dir files it under that board.  inventory.py writes
    copies in ascending date order, so the last match is the newest one."""
    out = []
    for (g, name, title1) in sorted(ALSO_INSTALL):
        src = [e for e in entries if e["group"] == g and e["name"] == name]
        if not src:
            raise SystemExit("install.py: ALSO_INSTALL names %s/%s, which is not in the inventory" % (g, name))
        copies = [c for c in src[0]["copies"] if c["ok"] and c["date"] != "undated" and c.get("title1") == title1]
        if not copies:
            raise SystemExit("install.py: no readable %r copy of %s/%s on the tapes" % (title1, g, name))
        c = copies[-1]
        e = {"group": g, "name": name, "title1": title1, "title2": None, "superseded_by": src[0]["title1"],
             "latest": {"date": c["date"], "path": c["path"], "size": c["size"], "ok": True},
             "copies": [], "newer_unreadable": [], "undated_distinct": 0, "distinct_contents": 1}
        if page_dir(e) == page_dir(src[0]):
            raise SystemExit("install.py: %s/%s and its %r copy would both go in %s; BOARD_FOLDER needs a folder for %r"
                             % (g, name, title1, page_dir(e), title1))
        out.append(e)
    return out


def previous(index_path):
    if not os.path.exists(index_path):
        return set()
    return set(l.split()[0] for l in open(index_path) if l.strip() and not l.startswith("#"))


def other_title_blocks(all_entries):
    """(entry, copy) for every readable copy that is passed over and whose
    title block names something other than the installed copy's.  Usually the
    title block was rewritten between revisions of one drawing; where a board
    was superseded in place it is the older board's page (ALSO_INSTALL).  The
    newest copy per differing title block is reported."""
    out = {}
    for e in all_entries:
        if not e["latest"]["ok"] or not e.get("title1"):
            continue
        for c in e["copies"]:
            t = c.get("title1")
            if c["ok"] and t and t != e["title1"] and c["path"] != e["latest"]["path"]:
                out[(e["group"], e["name"], t)] = (e, c)   # copies ascend by date
    return [out[k] for k in sorted(out)]


def notes(all_entries):
    """Comment lines for the indexes: pages that could not be installed
    because no copy on the tapes is readable, pages where a newer copy exists
    but is unreadable (the older readable one is installed), and names that
    carry more than one title block."""
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
    other = other_title_blocks(all_entries)
    if other:
        out.append("#")
        out.append("# names carrying more than one title block: an older readable copy names a different")
        out.append("# drawing in its title strip.  Usually the title block was rewritten between revisions")
        out.append("# of one drawing; where a board was redesigned in place and the new sheets took the old")
        out.append("# filenames it is the older board's page, and is installed under that board's folder")
        out.append("# (BOARD_FOLDER and ALSO_INSTALL in drwtools/install.py).  \"not installed\" is about")
        out.append("# this copy, not about the page: a later revision of it is usually installed under")
        out.append("# another name (the SIMPLE TV xbctl of 09-OCT-78 below became nxbctl of 17-MAY-80):")
        for e, c in other:
            also = (e["group"], e["name"], c["title1"]) in ALSO_INSTALL
            out.append("#   %-7s %-12s installed: %-13s %s; also on the tapes: %-13s %s, %s" % (
                e["group"], e["name"], e["title1"], e["latest"]["date"], c["title1"], c["date"],
                ("installed in " + page_dir(dict(e, title1=c["title1"]))) if also else "not installed"))
    return "\n".join(out) + "\n"


def main(inv_path, rendered, schem, ai):
    all_entries = sorted((e for e in json.load(open(inv_path)) if e["group"] in GROUPS), key=lambda e: (e["group"], e["name"]))
    extra = superseded(all_entries)
    inv = sorted([e for e in all_entries if e["latest"]["ok"]] + extra, key=lambda e: (e["group"], e["name"]))
    for e in extra:
        print("also installing %s/%s: the %s of %s, superseded in place by the %s" % (
            page_dir(e), e["name"], e["title1"], e["latest"]["date"], e["superseded_by"]))

    # --- pngs
    old = previous(os.path.join(schem, "drw-index.txt"))
    new = set()
    with open(os.path.join(schem, "drw-index.txt"), "w") as ix:
        ix.write("# <group>[/<board>]/<page>.png rendered (doc/drwtools) from this drw on the ITS tape dumps (ITS file date, Boston time)\n")
        for e in inv:
            rel = "%s/%s.png" % (page_dir(e), e["name"][:-4])
            src = os.path.join(rendered, rel)
            if not os.path.exists(src):
                continue
            os.makedirs(os.path.dirname(os.path.join(schem, rel)), exist_ok=True)
            shutil.copy2(src, os.path.join(schem, rel))
            new.add(rel)
            ix.write("%-29s %-15s %s\n" % (rel, e["latest"]["date"], e["latest"]["path"]))
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
        src = os.path.join(ROOT, e["latest"]["path"])
        plan[(page_dir(e), e["name"])] = (float("inf"), src)
        src_dirs.setdefault(e["group"], set()).add(os.path.dirname(src))
    for dirpath, _, _ in os.walk(ROOT):
        g = os.path.basename(dirpath).lower()
        # a group directory inside a tape; ROOT/cadr itself is not a tape
        if g in WIDE and "/" in os.path.relpath(dirpath, ROOT):
            src_dirs.setdefault(g, set()).add(dirpath)
    for g, dirs in src_dirs.items():
        for d in sorted(dirs):
            for fn in os.listdir(d):
                if ".drw" in fn.lower() or skip(fn):
                    continue
                p = os.path.join(d, fn)
                if not os.path.isfile(p):
                    continue
                key = (g, fn.lower())
                r = rank(p)
                if key not in plan or r > plan[key][0]:
                    plan[key] = (r, p)
    old = previous(os.path.join(ai, "drw-index.txt"))
    new = set()
    counts = {}
    with open(os.path.join(ai, "drw-index.txt"), "w") as ix:
        ix.write("# <group>[/<board>]/<file> = this file on the ITS tape dumps (ITS file date, Boston time); drw = newest readable copy, other files = newest copy in any tape directory of the group\n")
        for (d, fn), (mt, src) in sorted(plan.items()):
            rel = "%s/%s" % (d, fn)
            os.makedirs(os.path.join(ai, d), exist_ok=True)
            shutil.copy2(src, os.path.join(ai, rel))
            new.add(rel)
            g = d.split("/")[0]
            counts[g] = counts.get(g, 0) + 1
            ix.write("%-33s %-15s %s\n" % (rel, date_of(src), os.path.relpath(src, ROOT)))
        ix.write(notes(all_entries))
    for rel in old - new:
        p = os.path.join(ai, rel)
        if os.path.exists(p):
            os.remove(p)
    print("ai: %d files installed (%s), %d stale removed" % (len(new), ", ".join("%s %d" % kv for kv in sorted(counts.items())), len(old - new)))
    for e, c in other_title_blocks(all_entries):
        also = (e["group"], e["name"], c["title1"]) in ALSO_INSTALL
        print("%s title block: %s/%s installed as %r %s, tapes also hold %r %s, %s" % (
            "superseded" if also else "DIFFERENT", e["group"], e["name"], e["title1"], e["latest"]["date"],
            c["title1"], c["date"],
            ("installed in " + page_dir(dict(e, title1=c["title1"]))) if also else "NOT INSTALLED"))


if __name__ == "__main__":
    main(*sys.argv[1:5])
