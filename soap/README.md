
# soap

soap utility reads a X.drw file and generates cadr_X_suds.vhd architecture implementing cadr_X entity (given in cadr_X.vhd).

unpack.c provides the unpack function that decodes 36-bit words from 8-bit bytes.

# soap4

Original soap.c was written by Brad Parker and unpack.c was written by John Wilson. These are modified to improve readability and to have a better compatibility with cadr4. The modified files are soap4.c and unpack4.c.

The new utility is built with `make build/soap4`.

## unpack4.c 

The new unpack4.c splits the combined process in the previous code into two:

- reading the bytes from a 8-bit file
- actually assembling the 36-bit words from these bytes

It also eliminates the use of global variables and accepts the buffer as a parameter. It also uses the fixed width types (such as uint32_t).

The new parsing code assumes the file is in correct format, so it only uses asserts when an unexpected issue happens.

It also comes with unpack4.h for the unpack function.

## soap4.c

The new soap4.c has some features removed and some features added comparing to original soap.c. SUDS and netlist dump features are removed, but it has the following new features:

- raw 18-bit word output in wide format (8 half-words in one line)
- extensive debug output including parser debug flag
- VHDL output

The main and actually only purpose of soap4 is to output a VHDL file given a drw (SUDS) file. All features that are not directly related to this are removed.

It also comes with soap4.h for the struct definitions.

It has hacks in `apply_hacks()` for three pages that come out with duplicate reference designators: BUSINT CABLE TERMINATION (bcterm, 1B15/1B20/1B25 renamed to 1B16/1B21/1B26), XBUS & UNIBUS TIMEOUT (reqtim, 0B03 renamed to 0B04) and UNIBUS BUS GRANT (uprior, 0F13/0F14 renamed to 0F17/0F18). These drawings are **not** in error, and each replacement designator is itself a real location holding a different part elsewhere in the same book; see the known issue below.

The differences from soap are:

- soap4 uses DIPTYPE prop, hence there is no need for aliases in dip.vhd.

- soap4 handles the internal signals (one pin of a component is connected to another pin of a component) automatically. It creates an internal signal with a random name starting with `net_` and connects the pins to this internal signal. Basically `net_` becomes the net name for unnamed nets.

- soap4 handles merging bodies belonging to a single reference designator. It only outputs one component instantiation.

- soap4 reads a library filespec in the header as three SIXBIT words (file name, extension in the left half with the library bits in the right half, directory) and not as the 6-bit ASCIZ string plus BITS word suds.txt describes. 6-bit ASCIZ stops at the first space, which is SIXBIT's pad character, so soap reads any library name shorter than six characters (`CADRTV;BOD2 DRW`, `CADR;SIPS DRW`) out of step and then misparses the rest of the page. `CADR;BODIES DRW` and `CADRIO;BODIES DRW` fill their word, which is why the cadr and cadr1 books never showed it.

- soap4 accepts `-e` more than once, because a page can name more than one library: `cadrdc/dctrsg.drw` names `CADR;SIPS DRW` and `CADRIO;BODIES DRW`.

Some cases not handled are:

- Another name for the same net (for example -TPW60 = -TPDONE in CLOCK1) is not handled, this should be an alias but it also depends on which of these are driving or which is declared as port.

## Known issue: soap4 discards the field that separates two parts at one card location

A SUDS body carries `CARD LOC (OPT),,BODY LOC` (suds.txt). soap4 builds the
reference designator from BODY LOC bits 17-15 (digit), 14-12 (letter) and 11-6
(number), and drops bits 5-0. `doc/drwtools/suds.py` drops them too.

Those low six bits are what MIT's own stuffing lists and parts lists print as an
`@nn` suffix on a card location: `dm.stf` has `B06@03` and `B06@20` for two
SIP100-8 packs at one location, and `dc.prt`'s 75452 row reads
`A02, A02@03, B01`. Parsing the DM drawings and taking `body_loc & 0o77`
reproduces every one of `dm.stf`'s 30 `@nn` entries, so the field is carried per
body in the drawing and the listing program only prints it. Bodies with no
suffix have low6 = 0.

So a drawing that appears to have "duplicate reference designators" usually does
not: it has two physical parts at one card location, which SUDS distinguishes and
soap4 cannot, because soap4 merges all bodies sharing a designator into one
component instantiation. `bcterm`'s 1B15 is the clearest case -- the board really
holds a 93S48 there, drawn on `iwrpar` with low6 = 0, plus two SIP220/330-8
terminators at low6 3 and 20 drawn on `bcterm`.

The three `apply_hacks()` renames are that collision, patched by relabelling a
body rather than by keeping the field, and the labels chosen are not free: 1B16
is a 74S472 on `prom1` and a 74S374 on `md`, 1B21 is used by `iram20`/`ram20`,
1B26 by `iram21`/`ram21`/`vmas`, 0B04 is a 74S241 on `dbgout`, and 0F17 and 0F18
are both 8838s on `ubd`. So each rename asserts that a terminator pack or a
DUMMY4 is the same package as an unrelated real device somewhere else in the
book. Nothing currently breaks, because a designator is only an instance label
within one page architecture and `build/cadr_tb.vhd` wires the pages by signal
name rather than by designator -- but anything that later keys on designators
across pages would inherit a false identity.

**The meaning of the number is not documented.** suds.txt names BODY LOC but
never defines its sub-fields, and no SUDS manual found so far does either. Only
seven values occur across every `.stf` and `.prt` on the tape dumps -- @01 @02
@03 @10 @11 @12 @20 -- and half-width parts pair as {3,20}. That is suggestive of
a position within the location, but it is unsourced; treat the field as an opaque
discriminator, which is all that package identity needs.

Scope, measured over the 456 installed pages: 314 card locations hold more than
one distinct low6 value, but most are capacitor and resistor pages, and on
`cadrpc` and `chaos/caios` the designator decode degenerates entirely (one
"location" holding an 8748, a 6810 and a 2716). Locations where two genuinely
modelled parts coexist: 56 over all boards, and within `cadr/` and `cadr1/`,
which is all cadr4 builds from, only four pages -- the three hacked above plus
`lmdata.drw` 0A28/0A29/0A30, three more {3,20} SIP180/390-8 pairs that are not
patched. Every affected body is a resistor pack or a DUMMY, never a modelled TTL
entity, so the simulation is not wrong; the designators are.

To revisit: carrying the low six bits into the designator would remove all three
hacks and the false labels, but it changes every generated designator in
every page architecture, so it needs `make check` on both ghdl and nvc and a
careful look at `git diff` over the generated files. A smaller step is to make
soap4 fail loudly when it merges two bodies whose low6 differ, so the next
occurrence surfaces instead of needing a hand-written rename.

## resources

- suds.txt: downloaded from https://github.com/lisper/cpus-cadr/blob/master/suds/suds.txt