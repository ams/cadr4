"""Render the latest readable version of every page listed in
inventory.json into <out>/<dir>/<name>.png, with the source drawing copied
next to it as <name>.drw.  <dir> is what install.py will file the page
under: the group, or <group>/<board> in a group holding more than one
board (install.BOARD_FOLDER).  The pages of a superseded board
(install.ALSO_INSTALL) are rendered as well, each from its own tape path so
that the title strip still prints the page name and date MIT gave it."""
import json, os, subprocess, sys

import install

ROOT = os.environ.get("ITS_TAPES", "")   # folder holding the ITS tape dumps
BATCH = os.path.join(os.path.dirname(os.path.abspath(__file__)), "batch.py")
inv = [e for e in json.load(open(sys.argv[1])) if e["group"] in install.GROUPS]
out = sys.argv[2]
pages = sorted([e for e in inv if e["latest"]["ok"]] + install.superseded(inv),
               key=lambda e: (install.page_dir(e), e["name"]))
by_dir = {}
for e in pages:
    by_dir.setdefault(install.page_dir(e), []).append(os.path.join(ROOT, e["latest"]["path"]))
os.makedirs(out, exist_ok=True)
with open(os.path.join(out, "drw-index.txt"), "w") as ix:
    ix.write("# <dir>/<name>.drw here = this file on the ITS tape dumps (ITS file date, Boston time)\n")
    for e in pages:
        ix.write("%-29s %-15s %s\n" % (install.page_dir(e) + "/" + e["name"], e["latest"]["date"], e["latest"]["path"]))
for d, paths in sorted(by_dir.items()):
    # a page name is unique within a board, so batch.py naming each png after
    # its drw cannot collide here
    os.makedirs(os.path.join(out, d), exist_ok=True)
    subprocess.run([sys.executable, BATCH, "--copy-drw", os.path.join(out, d)] + paths)
