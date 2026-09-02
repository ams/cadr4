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
and XGP plot files were not kept. Files already here that were not
overwritten were left in place. `drw-index.txt` lists every copied file with
its ITS date and source path. Each page is the newest copy on the
tapes that can be read; the end of `drw-index.txt` lists the pages that
have no readable copy at all (absent here) and would list any page where a
newer copy exists but is unreadable (there is none).

| group | drw | other files | main sources |
|---|---|---|---|
| cadr | 126 | 16 | 7008261/B7/cadr, plus 1891, 9004365, 2100233, 701395 |
| cadr1 | 47 | 53 | 7008261/B7/cadr1, 701395, 7009559, ai_ka_arch_2of9 (1982) |
| cadrdc | 49 | 89 | 7009559, 2100233, 7008261, ai_ka_arch_2of9 (1982) |
| cadrio | 21 | 95 | 2100233, 7008261/B7/cadrio, 701395 |
| cadrm | 29 | 28 | 7008105, 701395, 7009559 |
| cadrmw | 24 | 13 | 7009559, 701298, 3100085, 7008105 |
| cadrpc | 19 | 12 | 7009559, 7005736 |
| cadrtv | 56 | 26 | 7009559, 7008261, ai_ka_arch_2of9 (1982) |
| chaos | 69 | 127 | tots-chaos-dirs-its (undated) |
| lmdoc | 8 | 1 | 90108/lmdoc |

Because a few groups pull one or two old pages from 1970s directories (for
example cadr from `9004365/E/cons`), some CONS-era wire lists came along;
the index shows where each file came from if they should be pruned.

The full inventory of every copy of every drawing on the tapes is in
`doc/drwtools/INVENTORY.md`; the renderer and scan tools are in `doc/drwtools`.
