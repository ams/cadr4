"""Render the latest readable version of every page listed in
inventory.json into <out>/<group>/<name>.png, with the source drawing
copied next to it as <name>.drw."""
import json, os, subprocess, sys
ROOT = os.environ.get("ITS_TAPES", "")   # folder holding the ITS tape dumps
inv = json.load(open(sys.argv[1]))
out = sys.argv[2]
groups = {"cadr", "cadr1", "cadrdc", "cadrio", "cadrm", "cadrmw", "cadrtv", "chaos", "lmdoc", "cadrpc"}
by_group = {}
for e in inv:
    if e["group"] in groups and e["latest"]["ok"]:
        by_group.setdefault(e["group"], []).append(os.path.join(ROOT, e["latest"]["path"]))
os.makedirs(out, exist_ok=True)
with open(os.path.join(out, "drw-index.txt"), "w") as ix:
    ix.write("# <group>/<name>.drw here = this file on the ITS tape dumps (ITS file date, Boston time)\n")
    for e in sorted(inv, key=lambda e: (e["group"], e["name"])):
        if e["group"] in groups and e["latest"]["ok"]:
            ix.write("%-20s %-15s %s\n" % (e["group"] + "/" + e["name"], e["latest"]["date"], e["latest"]["path"]))
for g, paths in sorted(by_group.items()):
    os.makedirs(os.path.join(out, g), exist_ok=True)
    subprocess.run([sys.executable, os.path.join(os.path.dirname(__file__), "batch.py"), "--copy-drw", os.path.join(out, g)] + paths)
