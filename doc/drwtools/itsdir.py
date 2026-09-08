"""Read the ITS directory blocks on the tape dumps.

Most tape directories hold a `_file_.(dir)` beside the files: the ITS
directory block for that directory.  It lists every file that was in the
directory when the tape was written, whether or not the dump captured the
file's contents, so it answers "did this file ever exist?" where `find`
can only answer "was it dumped?".  Some tapes (701440) are directory-only
dumps and hold nothing else at all.

That distinction is what lets a negative be asserted.  CADRDC;DM WLR, a
wire list for the DISK MULTIPLEXOR, is not merely undumped: no directory
block on any tape lists one, from the first CADRIO listing in June 1979 to
the last CADRDC listing in August 1982, while every other board of the set
has one.  A CADRIO;DM RAY, the SUDS wire-run list, does appear, written
06-Mar-1979 05:35:08 and gone by that August.

Format: `dumpwords` gives 18-bit halfwords; two make a 36-bit word; a word
is six SIXBIT characters (`chr(c + 32)`, so ASCII 32..95, upper case only).
Entries are five words -- name, extension, w2, date/time, w4:

    date = w3 >> 18          year = (d >> 9) + 1900
                             month = (d >> 5) & 15
                             day = d & 31
    time = w3 & 0o777777     half-seconds since midnight

verified against the timestamps dm.wls prints for its own pages (DMEDGE
04-Mar-1979 20:35:08 against "04-MAR-79 2035").

The five-word stride starts at an offset that varies between blocks, and
picking it by counting name-shaped word pairs gets it wrong by one word on
some of them, which yields each name carrying the previous entry's
extension.  Entries are in alphabetical order, so the offset is chosen by
how well the name column sorts instead.

    python3 itsdir.py DIR ...          # list one or more directory blocks
    python3 itsdir.py --find 'DM *'    # search every block on the tapes
    python3 itsdir.py --verify         # check the reader against the dumps

ITS_TAPES gives the folder holding the tape dumps.
"""

import fnmatch
import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
DUMPWORDS = os.path.join(HERE, "dumpwords")
ROOT = os.environ.get("ITS_TAPES", "")
BLOCK = "_file_.(dir)"
MONTHS = ("Jan", "Feb", "Mar", "Apr", "May", "Jun",
          "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
# SIXBIT is ASCII 32..95; a name is the printable part of that, no space
NAME_CHARS = frozenset(chr(c) for c in range(33, 96))


def sixbit(word):
    return "".join(chr(((word >> (6 * i)) & 0o77) + 32) for i in range(5, -1, -1))


def words(path):
    """The file as 36-bit words, via John Wilson's evacuated-file decoder."""
    out = subprocess.run([DUMPWORDS, path], capture_output=True, text=True).stdout
    half = [int(w, 8) for w in out.split()]
    return [(half[i] << 18) | half[i + 1] for i in range(0, len(half) - 1, 2)]


def is_name(s):
    t = s.rstrip()
    return bool(t) and all(c in NAME_CHARS for c in t)


def when(w3):
    """The date/time word as a string, or None if it is not a plausible date."""
    d, t = w3 >> 18, w3 & 0o777777
    year, month, day = (d >> 9) + 1900, (d >> 5) & 15, d & 31
    if not (1 <= month <= 12 and 1 <= day <= 31 and 1960 <= year <= 1990):
        return None
    sec = t // 2
    return "%02d-%s-%d %02d:%02d:%02d" % (day, MONTHS[month - 1], year,
                                          sec // 3600, (sec // 60) % 60, sec % 60)


def entries(path):
    """[(name, extension, date-or-None)] for one `_file_.(dir)`."""
    raw = words(path)
    text = [sixbit(w) for w in raw]
    best, best_score = None, -1
    for start in range(5):
        at = [i for i in range(start, len(text) - 4, 5)
              if is_name(text[i]) and is_name(text[i + 1])]
        if len(at) < 3:
            continue
        names = [text[i].rstrip() for i in at]
        # alphabetical order is what tells the name column from its neighbours
        sorted_pairs = sum(1 for a, b in zip(names, names[1:]) if a <= b)
        score = sorted_pairs * 1000 + len(at)
        if score > best_score:
            best, best_score = at, score
    if best is None:
        return []
    return [(text[i].rstrip(), text[i + 1].rstrip(), when(raw[i + 3])) for i in best]


def blocks(root):
    for dirpath, dirs, files in os.walk(root):
        if BLOCK in files:
            yield os.path.join(dirpath, BLOCK)


def show(path):
    print("#### %s" % path)
    for name, ext, date in entries(path):
        print("  %-8s %-7s %s" % (name, ext, date or ""))


def find(pattern, root):
    """Every entry on the tapes whose "NAME EXT" matches a glob."""
    pattern = pattern.upper()
    hits = 0
    for path in sorted(blocks(root)):
        for name, ext, date in entries(path):
            if fnmatch.fnmatch("%s %s" % (name, ext), pattern):
                print("%-8s %-7s %-22s %s" % (name, ext, date or "",
                                              os.path.relpath(os.path.dirname(path), root)))
                hits += 1
    print("\n%d entries matching %r" % (hits, pattern))
    return hits


def verify(root):
    """Check the reader: every dumped file should appear in its own listing.

    A file the reader misses is a file it could have hidden, so the misses
    have to be explainable.  The ones that remain are names ITS could hold
    but SIXBIT cannot spell -- lower case, or characters outside ASCII
    32..95 such as ~ and } -- which no reader of this format can recover.

    An ITS name may itself contain a dot (LMMAN;FD.ARR 116), which the
    unpacker turns into an underscore so it does not read as the extension
    separator: FD.ARR 116 is on disk as fd_arr.116, and M.F.D. (FILE) as
    m_f_d_.(file).  Both spellings are compared here.
    """
    dirs = files = spellable = unspellable = 0
    unalignable = []
    for path in sorted(blocks(root)):
        d = os.path.dirname(path)
        dumped = {f for f in os.listdir(d) if f != BLOCK and not os.path.isdir(os.path.join(d, f))
                  # M.F.D. (FILE) is ITS's master file directory, which sits
                  # beside a directory rather than being an entry in it
                  and f != "m_f_d_.(file)"}
        if not dumped:
            continue
        dirs += 1
        listed = set()
        got = entries(path)
        if not got:
            unalignable.append((os.path.relpath(d, root), len(dumped)))
            continue
        for name, ext, date in got:
            # a dot inside an ITS name reaches the dump as an underscore
            name, ext = name.replace(".", "_"), ext.replace(".", "_")
            listed.add(("%s.%s" % (name, ext)).lower())
            listed.add(name.lower())
        for f in sorted(dumped):
            files += 1
            # the dumps append |<n> to a name that collided when unpacked,
            # and wrap some names in #...#
            stem = re.sub(r"\|\d+$", "", f).strip("#")
            if stem in listed:
                continue
            if all(c.upper() in NAME_CHARS or c == "." for c in stem):
                spellable += 1
                print("MISS  %s  %s" % (os.path.relpath(d, root), f))
            else:
                unspellable += 1
    for d, n in unalignable:
        print("SHORT %s  (%d files, block has too few entries to align)" % (d, n))
    print("\n%d directories, %d dumped files" % (dirs, files))
    print("%d not listed and spellable in SIXBIT  <- must be 0" % spellable)
    print("%d not listed, unspellable in SIXBIT (lower case, ~ } and the like)"
          % unspellable)
    print("%d blocks with fewer than 3 entries, which cannot be aligned" % len(unalignable))
    return spellable == 0


def main(argv):
    if not argv:
        print(__doc__)
        return 2
    if argv[0] in ("--find", "--verify") and not ROOT:
        sys.exit("set ITS_TAPES to the folder holding the tape dumps")
    if argv[0] == "--verify":
        return 0 if verify(ROOT) else 1
    if argv[0] == "--find":
        return 0 if find(argv[1], ROOT) else 1
    for path in argv:
        if os.path.isdir(path):
            path = os.path.join(path, BLOCK)
        show(path)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
