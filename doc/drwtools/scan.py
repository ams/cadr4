"""Scan every .drw file on the ITS tape dumps and record what it is.

The folder holding the tape dumps is taken from the ITS_TAPES environment
variable (or the second argument).

Output: JSON list of records {path, size, mtime, date, md5, ok, title1,
title2, version, libs, words} where `words` is a hash of the parsed
36-bit word stream (so two dumps of the same ITS file compare equal even
if the 8-bit encodings differ).
"""

import datetime
import hashlib
import json
import os
import re
import subprocess
import sys
import zoneinfo

import suds

ROOT = os.environ.get("ITS_TAPES", "")
TZ = zoneinfo.ZoneInfo("America/New_York")


def scan(root, out):
    recs = []
    for dirpath, dirs, files in os.walk(root):
        for fn in files:
            m = re.match(r"(.*\.drw)(\|\d+)?$", fn.lower())
            if not m:
                continue
            p = os.path.join(dirpath, fn)
            st = os.stat(p)
            rec = {
                "path": os.path.relpath(p, root),
                "name": m.group(1),
                "group": os.path.basename(dirpath).lower(),
                "tape": os.path.relpath(p, root).split("/")[0],
                "size": st.st_size,
                "mtime": st.st_mtime,
                "date": datetime.datetime.fromtimestamp(st.st_mtime, TZ).strftime("%d-%b-%y %H:%M").upper(),
                "md5": hashlib.md5(open(p, "rb").read()).hexdigest()[:10],
                "ok": False,
            }
            try:
                words = subprocess.run([suds.DUMPWORDS, p], capture_output=True, text=True, timeout=60).stdout
                rec["words"] = hashlib.md5(words.encode()).hexdigest()[:10]
                rec["nwords"] = len(words.split())
                d = suds.Drawing(p)
                rec.update(version=d.version, title1=d.trailer["title1"], title2=d.trailer["title2"],
                           libs=d.library_file_specs, bodies=len(d.bodies), points=len(d.points),
                           parsed=d.end_index, total=d.total_halfwords)
                # sanity: SUDS versions 21 and 23 are understood (19 is not),
                # and a SUDS page never reaches beyond +-2048 units; damaged
                # dumps (bit errors, files with junk appended) show up as wild
                # coordinates
                coords = [v for b in d.bodies for v in b.loc] + [v for pt in d.points for v in pt.loc]
                wild = max((abs(v) for v in coords), default=0)
                rec["wild"] = wild
                # a damaged dump (junk from another file appended, single bit
                # errors) also shows as duplicate point ids, links to points
                # that do not exist, or pins of bodies that do not exist.
                # Duplicate ids mark the copy unreadable; dangling links and
                # orphan pins are counted as "defects" and only decide between
                # copies of the same date (some genuine drawings have a few).
                ids = set(pt.id for pt in d.points)
                bodies = set(b.id for b in d.bodies)
                dangling = sum(1 for pt in d.points for l in (pt.down, pt.up, pt.left, pt.right) if l != (0, 0) and l not in ids)
                badpin = sum(1 for pt in d.points if pt.id[0] != 0 and pt.id[1] not in bodies)
                dup = len(d.points) - len(ids)
                rec["defects"] = dangling + badpin
                if d.version not in (21, 23):
                    rec["error"] = "SUDS version %d not supported" % d.version
                elif wild > 2048:
                    rec["error"] = "damaged: coordinate %d out of range" % wild
                elif dup:
                    rec["error"] = "damaged: %d duplicate point ids" % dup
                else:
                    rec["ok"] = True
            except Exception as e:  # noqa
                rec["error"] = repr(e)[:80]
            recs.append(rec)
            print(len(recs), rec["path"], rec["date"], rec.get("title1", rec.get("error")), file=sys.stderr)
    json.dump(recs, open(out, "w"), indent=0)


if __name__ == "__main__":
    scan(sys.argv[2] if len(sys.argv) > 2 else ROOT, sys.argv[1])
