# doc/ai

Refreshed on 2026-09-02 from the ITS tape dumps.
For each group, the newest readable drw of every page, plus the newest
copy of every design file in the tape directories named after the group
(and in the directories the drws came from): wire lists and
wire-wrap data (wd, wls, wlr, wss, uml, stf, ray, augat, wwinfo), parts and
page lists (prt, fil, book), ECOs and board notes (eco, txt), PROM and
microcode images (bin, prom, mcr, map) and the like. Where two directories
had the same file name, the file with the newer ITS date won; of two copies
with the same date the larger one, since a truncated dump is the common
damage. Copies from dumps that lost the ITS dates (the chaos dumps) are
`undated` and rank below every dated copy; among undated copies the largest
is kept, the best guess without dates. For lmdoc only the directories
the drws came from were used; the many lmdoc directories on the tapes hold
Lisp Machine documentation of every kind. ITS
housekeeping files, dump logs, numbered text versions, mail, editor backups
and XGP plot files were not kept, except that where the number is the version
MIT printed rather than an editor's backup the highest version was kept:
`newdsk.31`, the DC board's microcode that `dc.book` prints as
`AI:CADRDC;NEWDSK >`, and `mksman.39`, the Marksman controller's, which the
`mksman.mcr` listing and the `mksman.d03`/`d04`/`d05` PROM images beside it
were assembled from, and `lmprom.3`, "LMTV Clock PROM 74S288" of 22-AUG-78,
the SIMPLE TV's D06 that `lmtv4b.prom` and `lmtv8b.prom` later replaced
(`VERSIONED` in `doc/drwtools/install.py`). Files already here that were not
overwritten were left in place. `drw-index.txt` lists every copied file with
its ITS date and source path. Each page is the newest copy on the
tapes that can be read; the end of `drw-index.txt` lists the pages that
have no readable copy at all (absent here) and would list any page where a
newer copy exists but is unreadable (there is none).

The one group with subfolders is cadrtv, which holds two boards under one
set of page names. The SIMPLE TV, the black and white display of `lmtv.stf`
(29 pages, ITS directory `MAR;RTV`), was replaced in December 1980 by the
LISPM TV of `lmtv4b.stf` / `lmtv8b.fil` (25 pages, `CAD;RTV`), which added a
colour map and 4- and 8-bit modes. Both are board type LG684 and their
backplane pages agree -- the SIMPLE TV's 100 Xbus signals are a subset of the
LISPM TV's 102, which adds `COMP VIDEO OUT` and `TTL VIDEO DRIVE` -- so the
newer board is a drop-in successor, and the two stayed in service together:
`lmtv.eco` of 18-JUN-80 patches "old TV boards" for a check "extant only on
new TV boards". Because the December 1980 sheets took the old page filenames,
newest-wins alone would install the LISPM TV page and drop the SIMPLE TV one
entirely. So each board's pages are in `cadrtv/simple-tv/` (34 drawings: the
29 pages of `lmtv.stf`, the two customising pages `gen4b` and `gen8b` that
postdate that list, one further page added after it, and two superseded
revisions) and `cadrtv/lispm-tv/` (26: the 25 of `lmtv4b.stf` plus
the 8-bit `gen8b`), each under the name MIT gave it. Body libraries and pages
belonging to neither board (`bod1`, `bod2`, `eclbod`, `lmram`) and all the
design files stay at the top of the group. Which board a drawing belongs to
is decided by its title block, not by a page list; the end of `drw-index.txt`
names every drawing whose name carries more than one title block, installed
or not. The rule is `BOARD_FOLDER` in `doc/drwtools/install.py`.

**Do not use `lmtv.stf` as the SIMPLE TV's parts list.** It is 28-MAY-79, and
it describes the board as it was before its own revision of January and May
1980: it names the pages by their pre-rename names and dates them accordingly
(`SYNRAM.DRW 05-AUG-78`, `XBCTL.DRW 09-OCT-78`), with no entry under `NSYRAM`,
`NXBCTL` or any other `n` name. `lmtv.fil` and `lmtv.txt` of 13-NOV-78 list the
same 29 pre-rename pages. So for the SIMPLE TV as it stands in `simple-tv/`
there is no parts list, no wire list and no census on the tapes at all --
`lmtv4b.stf`, `.wls`, `.wlr` and `.prt` are the LISPM TV's, same-day with its
07/08-DEC-80 drawings. Where the older list and the revised sheets disagree the
sheets win: `lmtv.stf` puts a 74LS244 in 0C05 and has no 74S472 anywhere,
while `nsyram.drw` of 24-JAN-80 has the 74S472 in 0C05 and the 74LS244 moved
to 0D05. (`lmtv.wwinfo`, whose 24-JAN-80 and 17-MAY-80 dates match the
revision, is bare-board wire-wrap preparation for the Augat LG684, not a
netlist.)

The drawings are therefore the only census of the revised SIMPLE TV, and they
give one -- 174 ICs against the LISPM TV's 175, differing where the two boards
are known to differ:

| | SIMPLE TV (`simple-tv/`) | LISPM TV (`lispm-tv/`) |
|---|---|---|
| video buffer | 64 x 4116VG | 64 x 2118 |
| sync RAM | 8 x 2147 | 8 x 2141 |
| video shift | 8 x 74S299 | 8 x 74LS299 |
| sync PROM | 1 x 74S472, 0C05 | 1 x 74S472, 0C05 |
| clock PROM | 1 x 74S288, 0D06 | 1 x 74S288, 0D06 |

Both boards carry the sync PROM; see `rom/README.md` for which image belongs in
it and why it is the program the board runs at power-up.

The two customising pages `gen4b` and `gen8b` carry no parts, only straps, so
anything reading a netlist by walking components drops them silently. `gen4b`
is what ties `ADR n` to `RAM ADR IN n-1` -- the shift that makes the video RAM
address -- and for the LISPM TV there is a second, independent record of those
joins: `lmtv4b.wlr` describes the board as wrapped, so a strapped wire appears
there under both its names, the alias alone on one line and the pins under the
other:

    ADR 1
    RAM ADR IN 0
        A11-03(05)  74S253   RAMADR      <- the multiplexer input
        F18-16      74LS240  XBADR       <- the driver

(A net with one name carries its first pin on the header line, so the bare
second line is unambiguous.) `ADR 15`/`ADR BANK SEL` and `MAPADR 15`/`MAPADR
BANK` appear the same way. The revised SIMPLE TV has no wire list, so its
sheet is the only record of its straps -- which is why installing its own
`gen4b` matters and not just the LISPM TV's.

| group | drw | other files | main sources |
|---|---|---|---|
| cadr | 126 | 16 | 7008261/B7/cadr, plus 1891, 9004365, 2100233, 701395 |
| cadr1 | 47 | 53 | 7008261/B7/cadr1, 701395, 7009559, ai_ka_arch_2of9 (1982) |
| cadrdc | 49 | 91 | 7009559, 2100233, 7008261, ai_ka_arch_2of9 (1982) |
| cadrio | 21 | 95 | 2100233, 7008261/B7/cadrio, 701395 |
| cadrm | 29 | 28 | 7008105, 701395, 7009559 |
| cadrmw | 24 | 13 | 7009559, 701298, 3100085, 7008105 |
| cadrpc | 19 | 12 | 7009559, 7005736 |
| cadrtv | 64 | 27 | 7009559, 7008261, ai_ka_arch_2of9 (1982) |
| chaos | 69 | 127 | tots-chaos-dirs-its (undated) |
| lmdoc | 8 | 1 | 90108/lmdoc |

Because a few groups pull one or two old pages from 1970s directories (for
example cadr from `9004365/E/cons`), some CONS-era wire lists came along;
the index shows where each file came from if they should be pruned.

The full inventory of every copy of every drawing on the tapes is in
`doc/drwtools/INVENTORY.md`; the renderer and scan tools are in `doc/drwtools`.
