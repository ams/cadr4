# doc/ai

Refreshed on 2026-09-02 from the ITS tape dumps.
For each group, the newest readable drw of every page, plus the design
files from the tape directories those drws came from: wire lists and
wire-wrap data (wd, wls, wlr, wss, uml, stf, ray, augat, wwinfo), parts and
page lists (prt, fil, book), ECOs and board notes (eco, txt), PROM and
microcode images (bin, prom, mcr, map) and the like. Where two source
directories of a group had the same file name, the newer file won. ITS
housekeeping files, dump logs, numbered text versions, mail, editor backups
and XGP plot files were not kept. Files already here that were not
overwritten were left in place. `drw-index.txt` lists every copied file with
its ITS date and source path. Each page is the newest copy on the
tapes that can be read; the end of `drw-index.txt` lists the pages that
have no readable copy at all (absent here) and would list any page where a
newer copy exists but is unreadable (there is none).

| group | drw | other files | main sources |
|---|---|---|---|
| cadr | 127 | 61 | 7008261/B7/cadr, plus 1891, 9004365, 2100233, 701395 |
| cadr1 | 48 | 77 | 7008261/B7/cadr1, 7009559 |
| cadrdc | 49 | 95 | 7009559, 7008261, 2100233 |
| cadrio | 22 | 100 | 7008261/B7/cadrio, 7009559 |
| cadrm | 29 | 14 | 7009559, 7008105 |
| cadrmw | 24 | 48 | 7009559, 3100085, 701298 |
| cadrpc | 19 | 21 | 7009559 |
| cadrtv | 56 | 31 | 7009559, 7008261 |
| chaos | 66 | 142 | tots-chaos-dirs-its (undated) |
| lmdoc | 8 | 49 | 90108/lmdoc |

Because a few groups pull one or two old pages from 1970s directories (for
example cadr from `9004365/E/cons`), some CONS-era wire lists came along;
the index shows where each file came from if they should be pruned.

The full inventory of every copy of every drawing on the tapes is in
`doc/drwtools/INVENTORY.md`; the renderer and scan tools are in `doc/drwtools`.
