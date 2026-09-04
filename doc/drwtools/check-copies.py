"""Check that the chaos drawings installed in doc/ai are the right copies.

The chaos tape dumps lost their ITS dates, so the copy of a page cannot be
picked by date and several undated copies of most lm* pages survive.  Some
of them are working revisions: parts moved, wires redrawn and not yet
relabelled, older symbol names.  Installing one of those silently gives a
netlist that disagrees with CADRIO;IOB WLR, the wire list the board was
built from.

This checks the properties that tell the finished revision from a working
one.  Each is false for at least one copy on the tapes, so the check fails
if the wrong copy is installed.  Run it after install.py:

    python3 check-copies.py            # from doc/drwtools

It needs cadr4's build/soap4 (make build/soap4) and reads only the
installed doc/ai, not the tape dumps.
"""

import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, "..", ".."))
SOAP = os.path.join(ROOT, "build", "soap4")
CHAOS = os.path.join(ROOT, "doc", "ai", "chaos")
# the Lisp Machine's pages; install.py files the five boards that share the
# chaos directory under a folder each (BOARD_FOLDER)
LISPM = os.path.join(CHAOS, "lispm")
LIBS = ["-e", os.path.join(ROOT, "doc", "ai", "cadrio", "bodies.drw"),
        "-e", os.path.join(CHAOS, "nbods.drw")]

# The Lisp Machine's Chaosnet pages, the Chaosnet half of the CADR I/O
# board.  The other four boards sharing chaos/ have folders of their own.
LM_PAGES = ["lmdatp", "lmdetc", "lmjpns", "lmlndr", "lmmodu", "lmmynm",
            "lmrbuf", "lmrclk", "lmrctl", "lmtbfc", "lmtbuf", "lmtclk",
            "lmturn", "lmucon"]

# lmtbfc defeats soap4 in every copy on the tapes: a reader gap, not a copy
# problem, so it is not evidence either way about which copy is installed.
UNPARSEABLE = {"lmtbfc"}

# Body definitions named by number alone.  cadrio/bodies.drw defines the
# same chips twice, as '164' and as '74LS164' and so on, and their pins come
# out in opposite order.  Only the superseded copies name the short ones.
SHORT_BODY = re.compile(r"body def name '[0-9]{2,3}'")

INSTANCE = re.compile(r"_0([a-z][0-9]{2}) : (\w+) port map \(([^;]*)\)")
PORT = re.compile(r"p(\d+) => (\\[^\\]+\\|[^,)]+)")

failures = []


def fail(page, msg):
    failures.append("%s: %s" % (page, msg))


def soap(page, debug=False):
    """(returncode, vhdl, debug) for one installed page."""
    cmd = [SOAP] + (["-d"] if debug else []) + LIBS + \
        ["-o", "vhdl", "-x", "cadr", os.path.join(LISPM, page + ".drw")]
    r = subprocess.run(cmd, capture_output=True, text=True)
    return r.returncode, r.stdout, r.stderr


def pins(vhdl, refdes):
    """{pin number: net name} for one reference designator."""
    for m in INSTANCE.finditer(vhdl):
        if m.group(1) == refdes:
            return {int(p.group(1)): p.group(2).strip().strip("\\")
                    for p in PORT.finditer(m.group(3))}
    return None


def main():
    if not os.path.exists(SOAP):
        sys.exit("check-copies.py: %s is missing; run 'make build/soap4' in %s" % (SOAP, ROOT))

    vhdl = {}
    for page in LM_PAGES:
        rc, out, err = soap(page)
        if page in UNPARSEABLE:
            continue
        if rc != 0:
            fail(page, "soap4 cannot read it (%s)" % err.strip().split("\n")[-1])
            continue
        vhdl[page] = out

    # 1. no short-named body definitions
    for page in LM_PAGES:
        if page in UNPARSEABLE:
            continue
        _, _, dbg = soap(page, debug=True)
        short = sorted(set(SHORT_BODY.findall(dbg)))
        if short:
            fail(page, "uses %s, which only the superseded copies name" % ", ".join(short))

    # 2. the 9S42s were designed out; iob.prt gives 74S51 at C08 and E05
    for page, out in vhdl.items():
        if "dip_9s42" in out:
            fail(page, "instantiates dip_9s42; iob.prt and iob.wlr say 74S51")

    # 3. lmturn: the shift registers as CADRIO;IOB WLR wires them
    if "lmturn" in vhdl:
        b18, b19 = pins(vhdl["lmturn"], "b18"), pins(vhdl["lmturn"], "b19")
        want18 = {1: "my turn diff", 2: "my turn diff"}
        want18.update({p: "host adr diff.%d" % i for i, p in enumerate([3, 4, 5, 6, 10, 11, 12, 13])})
        want19 = {1: "host adr diff.7", 2: "host adr diff.7"}
        want19.update({p: "host adr diff.%d" % i for i, p in zip(range(8, 12), [3, 4, 5, 6])})
        for refdes, got, want in (("B18", b18, want18), ("B19", b19, want19)):
            if got is None:
                fail("lmturn", "%s is missing" % refdes)
                continue
            for pin, net in sorted(want.items()):
                if got.get(pin) != net:
                    fail("lmturn", "%s pin %d is %r, iob.wlr says %r" % (refdes, pin, got.get(pin), net))
        # B19 QE..QH are spare on the built board
        for pin in (10, 11, 12, 13):
            if b19 and pin in b19:
                fail("lmturn", "B19 pin %d is wired to %r; iob.wlr lists it unconnected" % (pin, b19[pin]))

    # 4. lmmynm: D11 is the two pull-up packs the wire list and iob.wls count
    if "lmmynm" in vhdl:
        _, _, dbg = soap("lmmynm", debug=True)
        if "body def name 'P SIP1000-10'" not in dbg:
            fail("lmmynm", "D11 is not P SIP1000-10; iob.wlr and iob.wls count two of them")

    for f in failures:
        print("FAIL " + f)
    n = len(LM_PAGES) - len(UNPARSEABLE)
    if failures:
        print("\n%d check(s) failed over %d pages: doc/ai/chaos holds a superseded copy." % (len(failures), n))
        print("Re-run inventory.py and install.py; see CHAOS_UNDATED in install.py.")
        return 1
    print("ok: %d chaos lm* pages installed from the finished revision" % n)
    return 0


if __name__ == "__main__":
    sys.exit(main())
