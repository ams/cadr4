# doc/schematics

Rendered on 2026-09-02 from the newest readable SUDS drawings found on the
ITS tape dumps, with the renderer in
`doc/drwtools` (see its README). `drw-index.txt` maps each png to the drw it
was rendered from, with the ITS file date printed in the title block. Each page is the newest copy on the
tapes that can be read; the end of `drw-index.txt` lists the pages that
have no readable copy at all (absent here) and would list any page where a
newer copy exists but is unreadable (there is none).

All 454 pages are here: the 323 pages that existed before (tumbleweed.nu
XGP plots) were replaced, and 125 pages were added (cadrpc, and the cadr,
cadr1, cadrdc, cadrio, cadrtv and chaos pages that had no png), plus the six
SIMPLE TV pages of cadrtv that the December 1980 LISPM TV redesign had taken
the filenames of. cadrtv is split into `simple-tv/` and `lispm-tv/`, one
folder per board, since the two boards share page names; see
`doc/ai/README.md`. For 231 of
the replaced pages the tumbleweed plot was already the newest version. For
the other 92 pages a newer drawing existed on the tapes (mostly tape
7008261, Dec 1980, for cadr1, cadrio and cadrtv; 1981 for lmdoc); the chaos
tapes carry no file dates.

The renders follow the SUDS plotter's geometry but use different fonts, so
they are not pixel-identical to the original plots.

## How they were made

With the tools in `doc/drwtools` (Python 3 with Pillow and numpy, a C
compiler, and the macOS fonts Menlo and Courier):

    cd doc/drwtools
    make                                   # builds the ITS file decoder
    export ITS_TAPES=/path/to/tape/dumps   # one subfolder per tape

    # one page (body libraries: the page's directory, then -L directories)
    python3 render.py $ITS_TAPES/7009559/cadrdc/dcbusy.drw dcbusy.png -L $ITS_TAPES/7009559/cadrio

    # this whole set: newest readable copy of every page, png + drw
    python3 scan.py scan.json              # index every drw on the tapes
    python3 inventory.py scan.json OUT     # OUT/inventory.json (+ INVENTORY.md, drw-index.txt)
    python3 render_latest.py OUT/inventory.json OUT/latest

`drw-index.txt` here is the index written by that last step. See
`doc/drwtools/README.md` for the plotter rules the renderer follows and its
known limits.

## Corrections

One page is not rendered exactly as it is drawn. `cadr1/reqlm.png` prints
`UBX GRANT A` at E09 pin 2, where the 10-DEC-80 drawing says
`LMX GRANT A`. E09 makes the Unibus master's term of XBUS REQUEST
(`UBXRQ AND grant AND -UB TO MD AND MSYN IN`), so the grant there is the
Unibus master's own; `LMX GRANT A` is the processor's, and never comes for
a Unibus master's cycle, which as drawn would leave a Unibus-to-Xbus cycle
through the map granted and never requesting the Xbus. The 3-OCT-78
revision of the page (ITS tape 7008105) draws the whole term as a single
9S42 at C14 and names that input `UBX GRANT A`; redrawing the page changed
the label by one letter. `busint.wlr` of 11-DEC-80 was generated from the
new drawing and carries the same error (E09-02 sits in its `LMX GRANT A`
block), and no ECO touches it.

The drawing itself is left alone: `doc/ai/cadr1/reqlm.drw` is the file MIT
left, and the correction is made where the drawing is read.
`doc/drwtools/corrections.py` holds the table and makes it on the rendered
page; the same correction is made on the generated VHDL by the `reqlm`
patch in cadr4's `Makefile.common`, and `cadr1/busint_reqlm_tb.vhd` is the
check that it is still there. Every correction is also listed at the end of
`drw-index.txt`.
