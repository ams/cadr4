"""Build the inventory of drawings across all tape dumps.

Input: scan.json (first argument), every .drw on the tape dumps as
written by scan.py.

Output: INVENTORY.md, inventory.json and drw-index.txt in the output
directory given as the second argument.
"""

import json
import os
import re
import sys
from collections import defaultdict

SCAN = sys.argv[1]
OUT = sys.argv[2]

recs = json.load(open(SCAN))

# --- group normalisation: old tapes kept the disk-control pages in cadrio
DC_TITLES = {"DISK CONTROL", "MARKSMAN CONTROL", "MARKSMAN", "DISK MULTIPLEXOR"}


def group_of(r):
    g = r["group"]
    if g == "cadrio" and r.get("title1") in DC_TITLES:
        return "cadrdc"
    if g == "default":
        return r["path"].split("/")[-2]
    return g



# --- collect copies per (group, name)
pages = defaultdict(list)
for r in recs:
    pages[(group_of(r), r["name"])].append(r)

# CADR drawings grew out of the CONS drawings with the same names, and the
# bus interface pages started in cons1/conswd: attach those same-named
# files to the cadr / cadr1 page as its earlier history.  Only done for
# names that exist in the later group, so CONS-only pages stay in cons.
FAMILY = {"cadr": ("cons", "conswd", "cons1"), "cadr1": ("cons1", "conswd", "cons")}
for (g, name) in list(pages):
    for older in FAMILY.get(g, ()):
        if (older, name) in pages:
            for r in pages.pop((older, name)):
                r["from_group"] = older
                pages[(g, name)].append(r)

UNDATED_AFTER = 631152000  # 1990-01-01: no ITS drawing is that recent

# The chaos dumps lost their ITS dates, so the several surviving copies of
# most lm* pages cannot be ordered by date, and their mtimes are only when
# the tape was unpacked in 2025 -- two of the directories share one to the
# second.  Sorting on that picked a working revision of twelve of the
# fourteen Lisp Machine Chaosnet pages: parts moved, wires redrawn and not
# relabelled, chips named by the short body definitions ('164' for
# '74LS164', whose pins come out in the opposite order), and the 9S42s that
# the finished drawings have already replaced with 74S51s.  Nothing in the
# file says which revision it is, so the directories are ranked here by
# which one agrees with CADRIO;IOB WLR, the wire list the board was built
# from: extracting all 27 I/O board pages in this order and comparing
# against it leaves no net split and none merged, where the copies picked
# by mtime left 39 split and 14 merged.  doc/drwtools/check-copies.py
# checks the result.  install.py keeps the same list for the per-page dumps
# that come out of the same directories.
#
# Only the lm* pages: the wire list covers those and the cadrio pages, and
# nothing here says which copy of the other two page sets in chaos/ -- the
# CAIOS board's n* pages and the PDP-10's plain-named ones -- is the right
# one.  Ordering those by this list moves chaos/myturn.drw from the PDP-10's
# page to the CAIOS board's, a page of a different machine under the same
# name, so they keep the old size-among-undated rule.
CHAOS_UNDATED = ["701417", "7008261", "701373", "7007319", "2100233"]


def undated_rank(r):
    """Order undated copies: for a Lisp Machine Chaosnet page the directory
    that agrees with the wire list first, then the larger, since a truncated
    dump is the common damage."""
    d = r["path"].split("/")[1] if "/" in r["path"] else ""
    lm = r["name"].startswith("lm")
    at = CHAOS_UNDATED.index(d) if lm and d in CHAOS_UNDATED else len(CHAOS_UNDATED)
    return (r["ok"], -at, r["size"])


by_words = defaultdict(list)
for r in recs:
    by_words[r["words"]].append(r)
for r in recs:
    r["dated"] = r["mtime"] < UNDATED_AFTER
    if not r["dated"]:
        # inherit the date of a dated copy with identical content
        twins = [t for t in by_words[r["words"]] if t["mtime"] < UNDATED_AFTER]
        if twins:
            r["mtime"], r["date"], r["dated"] = twins[0]["mtime"], twins[0]["date"], True
            r["date_from"] = twins[0]["path"]
        else:
            r["date"] = "undated"

inventory = []
for (g, name), copies in sorted(pages.items()):
    # newest by date only; a copy is passed over only when it is unreadable
    # (damaged dump or unsupported format).  Same-date readable copies are
    # the same ITS file; among them the one with the fewest link defects
    # (single bit errors in a dump break links) is used.
    copies.sort(key=lambda r: (r["dated"], round(r["mtime"] / 60), r["ok"], -r.get("defects", 0)))
    dated = [c for c in copies if c["dated"]]
    readable = [c for c in dated if c["ok"]]
    latest = readable[-1] if readable else (dated[-1] if dated else None)
    newer_unreadable = [c for c in dated if latest and not c["ok"] and c["mtime"] > latest["mtime"] + 60]
    undated = [c for c in copies if not c["dated"]]
    contents = {}
    for c in copies:
        contents.setdefault(c["words"], []).append(c)
    # pages with only undated copies: no date orders them, so rank them by
    # the tape directory the finished revisions came from (CHAOS_UNDATED)
    if latest is None:
        und_ok = [c for c in undated if c["ok"]]
        latest = max(und_ok, key=undated_rank) if und_ok else None
    ref = latest or copies[-1]
    inventory.append({
        "group": g, "name": name, "title1": ref.get("title1"), "title2": ref.get("title2"),
        "board": ref.get("board"),
        "latest": {"date": ref["date"], "path": ref["path"], "size": ref["size"], "ok": ref["ok"]},
        "undated_distinct": len(set(c["words"] for c in undated) - set(c["words"] for c in dated)),
        "newer_unreadable": [c["path"] for c in newer_unreadable],
        # ascending by date, so copies[-1] of a selection is its newest;
        # title1 tells apart two boards that reused the same page names
        "copies": [{"date": c["date"], "path": c["path"], "size": c["size"], "words": c["words"], "ok": c["ok"], "tape": c["tape"], "from_group": c.get("from_group"), "title1": c.get("title1"), "board": c.get("board")} for c in copies],
        "distinct_contents": len(contents),
    })

json.dump(inventory, open(os.path.join(OUT, "inventory.json"), "w"), indent=1)


with open(os.path.join(OUT, "INVENTORY.md"), "w") as md:
    md.write("# SUDS drawings on the ITS tape dumps: latest version per page\n\n")
    md.write("Source: every `.drw` on the ITS tape dumps (%d files). Dates are the ITS file dates preserved in the dumps, "
             "shown in Boston local time, which is what the SUDS title block prints. Per page: the newest readable copy, "
             "and the other copies found (older versions, unreadable copies, undated copies).\n\n" % len(recs))
    for g in sorted(set(e["group"] for e in inventory)):
        entries = [e for e in inventory if e["group"] == g]
        n_bad = sum(1 for e in entries if not e["latest"]["ok"])
        md.write("## %s (%d pages, %d without a readable copy)\n\n" % (g, len(entries), n_bad))
        md.write("| page | title | latest readable drw | tape path | copies (other versions) |\n|---|---|---|---|---|\n")
        for e in entries:
            older = ", ".join(sorted(set(c["date"][:9] + (" (%s)" % c["from_group"] if c["from_group"] else "") + ("" if c["ok"] else " unreadable")
                                         for c in e["copies"] if c["date"] != "undated" and c["path"] != e["latest"]["path"])))
            if e["undated_distinct"]:
                older += "%s%d undated variant(s)" % (", " if older else "", e["undated_distinct"])
            if e["newer_unreadable"]:
                older += "; NEWER BUT UNREADABLE: " + ", ".join(e["newer_unreadable"])
            title = " / ".join(x for x in (e["title1"], e["title2"]) if x)
            md.write("| %s | %s | %s%s | %s | %d%s |\n" % (
                e["name"][:-4], title, e["latest"]["date"], "" if e["latest"]["ok"] else " (NO READABLE COPY)",
                e["latest"]["path"], len(e["copies"]), (" (older: %s)" % older) if older else ""))
        md.write("\n")
# flat index: one line per drw file on the volume
with open(os.path.join(OUT, "drw-index.txt"), "w") as ix:
    ix.write("# every .drw on the ITS tape dumps: group name date size content-hash tape path [latest]\n")
    ix.write("# date = ITS file date (Boston time) as printed in the SUDS title block; 'undated' = dump did not keep dates\n")
    ix.write("# content-hash = md5 of the decoded 36-bit words, so identical drawings match across dump formats\n")
    for e in inventory:
        for c in e["copies"]:
            mark = "LATEST" if e["latest"] and c["path"] == e["latest"]["path"] else ""
            ix.write("%-7s %-12s %-15s %7d %s %-45s %s %s%s\n" % (
                e["group"], e["name"], c["date"], c["size"], c["words"], c["tape"], c["path"], mark,
                "" if c["ok"] else " UNREADABLE"))
print("pages", len(inventory))
