# drwtools

Renders MIT CADR SUDS drawings (`.drw`, as recovered from the ITS tape
dumps) to PNG pages that look like the SUDS XGP plots on
tumbleweed.nu/lm-3 (2112 x 1700, 1-bit, landscape, 200 dpi), and builds an
inventory of every drawing on the tape dumps.

No PDP-10 emulator is needed. The output is not pixel-identical to the
original plots (different fonts), but geometry, text placement, pin
numbers, connector flags, title block and page scaling follow the
measured rules of the SUDS plotter, so a rendered page can be laid over
the original.

## Files

| file | what |
|---|---|
| `unpack.c` | John Wilson's decoder for ITS "evacuated" 36-bit files (from Brad Parker's cpus-cadr/suds) |
| `dumpwords.c` | tiny main around `unpack.c`: prints one 18-bit halfword per line |
| `suds.py` | SUDS `.drw` parser (port of cadr4/soap/soap4.c, with the library filespec fix) |
| `render.py` | the renderer: `render.py page.drw out.png -L libdir [-L libdir]` |
| `batch.py` | renders many pages: `batch.py [--copy-drw] outdir a.drw b.drw ...`. A library named in a page (e.g. `CADR;BODIES DRW`) is the newest readable copy of that file in a directory of that name on the volume (from `data/scan.json`), i.e. the library page in the same `latest/<group>/` folder |
| `compare.py` | side-by-side and red/blue overlay of a reference PNG and a rendered one |
| `scan.py` | scans every `.drw` on the ITS tape dumps into `scan.json`: date, size, content hash, title, and whether the copy is readable |
| `install.py` | copies the rendered pngs into `doc/schematics` and the drws plus the newest copy of the design files in each group's tape directories into `doc/ai`, writing a `drw-index.txt` in each |
| `inventory.py` | builds `INVENTORY.md`, `inventory.json` and `drw-index.txt` from the scan |
| `render_latest.py` | renders the latest readable version of every page in `inventory.json`, copying the drw next to the png |
| `scan.json` | the scan as run on 2026-09-02 (regenerable from the tape dumps in two minutes) |
| `INVENTORY.md`, `inventory.json`, `drw-index.txt` | the inventory as built on 2026-09-02: every copy of every drawing on the tape dumps and the newest readable one per page |

Requires Python 3.9 or later with Pillow and numpy
(`pip install -r requirements.txt`), a C compiler, and two TrueType
fonts: a monospace text font and a bold typewriter title font (Menlo and
Courier on macOS, DejaVu Sans Mono and Liberation Mono Bold on Linux; see
the candidate list at the top of `render.py`, or set `DRW_FONT` and
`DRW_TITLE_FONT`). Set `ITS_TAPES`
to the folder holding the ITS tape dumps (one subfolder per tape); the
scripts read the drawings and their libraries from there.

## Recreating the PNGs

    make                                         # builds ./dumpwords

    # one page; libraries: the page's directory, then the -L directories
    python3 render.py $ITS_TAPES/7009559/cadrdc/dcbusy.drw dcbusy.png \
        -L $ITS_TAPES/7009559/cadrio

    # many pages, the source drw copied next to each png
    python3 batch.py --copy-drw out $ITS_TAPES/7009559/cadrdc/*.drw

    # compare with another plot of the same page, e.g. a tumbleweed.nu XGP plot:
    # writes x-side.png (side by side) and x-overlay.png (reference red, rendered blue)
    python3 compare.py reference.png dcbusy.png x

## Recreating the inventory

    python3 scan.py scan.json                                    # ~2 min, all tapes
    python3 inventory.py scan.json .                             # INVENTORY.md, inventory.json, drw-index.txt
    python3 render_latest.py inventory.json OUT                  # OUT/<group>/: latest version of every page, png + drw

## Which copy of a drawing is used

The newest copy by ITS file date, nothing else. A copy is passed over only
when it cannot be read: the parse fails (mostly 1974-77 files in an older
SUDS format), the SUDS version is not 21 or 23, a page coordinate is beyond
+-2048 units, or point ids are duplicated; both of the latter come from
damaged dumps (junk from another file appended, single bit errors). Copies
of the same date are the same ITS file; when they differ, the one with the
fewest dangling links is used, since a bit error or truncation breaks
links. Tapes 701395 and 701298 have many such copies, but 7008261 has a
truncated ictl too. Copies from dumps that did not keep the ITS dates
(the chaos dumps) are "undated" and cannot be ranked; they inherit the date
of a dated copy with identical content when one exists.

The other design files (wire lists, ECOs, PROM images, ...) that `install.py`
puts next to the drws follow the same rule across every tape directory
named after the group: newest ITS date wins; of copies with the same date
the larger one, since a truncated dump is the common damage; undated
copies rank below every dated copy and among themselves by size.

## What the renderer knows about the plotter

Derived by overlaying renders on the tumbleweed plots (dcbusy, dcclk,
xbus, dctmot, mkcmd, nrama, eclvid, cpins):

- 1 SUDS unit = 2 px, y up; the ink bounding box is centred in the frame's
  drawing area; drawings that do not fit are shrunk in steps of 1/8
  (text keeps its size). The plotter's exact fit rule is not known: of the
  71 reference pages rendered from the same file, 66 come out at the
  same size; NCAPA-D and LMDOC;FIG3 were plotted at 7/8 although they
  fit, and LMDOC;CHOD1 at 2x. `render.py -s 2` forces a scale.
- Body outline and pin locations are relative to the body location; the
  reference designator is centred at location + constant offset, with a
  `#nn` suffix when the low 6 bits of the body location (the socket
  position) are set; pin numbers then print as `pin(socket)`, otherwise
  as `pin≡`.
- Actual pin numbers come from the pin points, not the library default.
- Text is placed on SUDS's 8 x 16 unit character grid but drawn with a
  9 px pitch font, right/left/centre justified according to where the
  grid box lies relative to its location; vertical offsets are halved.
  Size 2 text: 11.5 px pitch, 24 px line spacing. `^W` breaks lines.
- Connector pins (CPIN bit) get a pointed flag with the label decoded
  from the I/O location word (`CB1`, `2FJ1-7`, `J05-41` layouts).
- Title strip: title line 1, title line 2, file date (ITS file date in
  Boston time), `DIRECTORY; NAME`.

Only body orientations 0, 2 and 3 occur in the CADR drawings; 2 is
handled as a 180 degree turn, which matched dcclk.
