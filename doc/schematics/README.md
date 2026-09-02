# doc/schematics

Rendered on 2026-09-02 from the newest readable SUDS drawings found on the
ITS tape dumps, with the renderer in
`doc/drwtools` (see its README). `drw-index.txt` maps each png to the drw it
was rendered from, with the ITS file date printed in the title block. Each page is the newest copy on the
tapes that can be read; the end of `drw-index.txt` lists the pages that
have no readable copy at all (absent here) and would list any page where a
newer copy exists but is unreadable (there is none).

All 448 pages are here: the 323 pages that existed before (tumbleweed.nu
XGP plots) were replaced, and 125 pages were added (cadrpc, and the cadr,
cadr1, cadrdc, cadrio, cadrtv and chaos pages that had no png). For 231 of
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
