"""SUDS .drw parser.

Port of the parser in cadr4/soap/soap4.c (after Brad Parker's soap.c),
which follows the SUDS data-structure notes in soap/suds.txt.

The 36-bit words are obtained from the ITS evacuated 8-bit file with the
`dumpwords` helper (John Wilson's unpack.c), one 18-bit halfword per line.
"""

import os
import subprocess

HERE = os.path.dirname(os.path.abspath(__file__))
DUMPWORDS = os.path.join(HERE, "dumpwords")


def int18(n):
    n &= 0o777777
    return n - 0o1000000 if n & 0o400000 else n


class Reader:
    def __init__(self, halfwords):
        self.w = halfwords
        self.i = 0

    def half(self):
        v = self.w[self.i] & 0o777777
        self.i += 1
        return v

    def word(self):
        a = self.half()
        b = self.half()
        return (a << 18) | b

    def pair(self):
        return (self.half(), self.half())

    def spair(self):
        return (int18(self.half()), int18(self.half()))

    def peek_word(self):
        return ((self.w[self.i] & 0o777777) << 18) | (self.w[self.i + 1] & 0o777777)

    def next_word_is(self, v):
        if self.peek_word() == v:
            self.i += 2
            return True
        return False

    def string(self, bits):
        per = {6: 6, 7: 5, 9: 4}[bits]
        mask = (1 << bits) - 1
        out = []
        while True:
            word = self.word()
            for k in range(per):
                c = (word >> (36 - bits * (k + 1))) & mask
                if c == 0:
                    return "".join(out)
                if bits == 6:
                    c += 32
                out.append(chr(c & 0x7F))

    def s7(self):
        return self.string(7)

    def s6(self):
        return self.string(6)


class Prop:
    __slots__ = ("value", "name", "text_size", "text_loc", "const_offset")

    def __init__(self, r):
        self.value = r.s7()
        self.name = r.s7()
        self.text_size = r.word()
        self.text_loc = r.spair()
        self.const_offset = r.spair()


class Pin:
    __slots__ = ("loc", "bits", "id", "pos", "name")

    def __init__(self, r):
        self.loc = r.spair()
        self.bits = r.half()
        self.id = r.half()
        self.pos = r.half()
        self.name = r.half()


class BodyDef:
    def __init__(self, r):
        self.name = r.s7()
        self.name2 = r.s7()  # not in suds.txt; soap.c reads it too
        self.bits = r.half()
        r.half()  # unused
        self.loc_offset = r.spair()
        self.loc_char_offset = r.spair()
        self.pins = []
        while not r.next_word_is(0o400000):
            self.pins.append(Pin(r))
        # points describing lines; low bit of the word = 1 means an
        # invisible move to this point
        self.lines = []
        while not r.next_word_is(0o400000):
            x = int18(r.half())
            y = r.half()
            self.lines.append((x, int18(y & ~1), bool(y & 1)))
        self.props = []
        while not r.next_word_is(0):
            self.props.append(Prop(r))


class Body:
    def __init__(self, r):
        self.loc = r.spair()
        self.orientation = r.word()
        self.card_loc = 0
        self.body_loc = 0
        self.const_offset = (0, 0)
        self.char_offset = (0, 0)
        self.refdes = ""
        if self.orientation >= 0o400000:
            self.card_loc = r.half()
            self.body_loc = r.half()
            self.refdes = "%d%s%02d" % (
                (self.body_loc >> 15) & 7,
                chr(ord("A") - 1 + ((self.body_loc >> 12) & 7)),
                (self.body_loc >> 6) & 0o77,
            )
            self.const_offset = r.spair()
            self.char_offset = r.spair()
        self.orient = self.orientation & 0o377777
        self.bits = r.half()
        self.id = r.half()
        self.name_of_body_def = r.s7()
        self.props = []
        while not r.next_word_is(0):
            self.props.append(Prop(r))


class Point:
    def __init__(self, r):
        self.loc = r.spair()
        self.id = r.pair()
        self.down = r.pair()
        self.up = r.pair()
        self.left = r.pair()
        self.right = r.pair()
        self.bits = r.half()
        self.pin_name = r.half()
        self.size_of_text = r.word()
        self.text_offset = (0, 0)
        self.name = None
        self.card_loc = 0
        self.io_loc = 0
        self.const_offset = (0, 0)
        if self.size_of_text != 0:
            self.text_offset = r.spair()
            self.name = r.s7()
        if self.bits & 0o1000:  # CPIN
            self.card_loc = r.half()
            self.io_loc = r.half()
            self.const_offset = r.spair()


class Drawing:
    @staticmethod
    def sixbit(word):
        return "".join(chr(((word >> (30 - 6 * k)) & 0o77) + 32) for k in range(6)).rstrip()

    def __init__(self, path):
        self.path = path
        out = subprocess.run([DUMPWORDS, path], capture_output=True, text=True, check=True).stdout
        r = Reader([int(x, 8) for x in out.split()])
        self.r = r
        # header
        self.version = r.word()
        self.nomenclature_type = r.s7()
        self.board_type = r.s7()
        self.type_names = []
        while not r.next_word_is(0):
            self.type_names.append(r.s7())
        # each library filespec is three SIXBIT words (FN1, FN2, DIR); there
        # is no "library bits" word in these version-23 files.  soap4 reads
        # the filespec as a NUL-terminated string and then a bits word, which
        # only lands right when FN1 is exactly 6 chars long (BODIES DRW).
        self.library_file_specs = []
        while not r.next_word_is(0):
            fn1, fn2, sdir = (self.sixbit(r.word()) for _ in range(3))
            self.library_file_specs.append((fn1, fn2, sdir))
        # body definitions
        self.body_defs = {}
        while not r.next_word_is(0):
            bd = BodyDef(r)
            self.body_defs[bd.name] = bd
        # macros
        self.macros = []
        while not r.next_word_is(0):
            name = r.s7()
            self.macros.append(name)
            while True:  # 9-bit bytes until a 0 byte
                word = r.word()
                if any(((word >> (36 - 9 * (k + 1))) & 0o777) == 0 for k in range(4)):
                    break
        # bodies
        self.bodies = []
        while not r.next_word_is(0o400000):
            self.bodies.append(Body(r))
        # points
        self.points = []
        while not r.next_word_is(0o400000):
            self.points.append(Point(r))
        self.point_by_id = {p.id: p for p in self.points}
        # set centers
        self.set_centers = []
        while not r.next_word_is(0o400000):
            loc = r.spair()
            body_ids = []
            while not r.next_word_is(0):
                body_ids.append(r.pair())
            point_ids = []
            while not r.next_word_is(0):
                point_ids.append(r.pair())
            self.set_centers.append((loc, body_ids, point_ids))
        # trailer
        t = {}
        t["drawn_by"] = r.s7()
        t["title1"] = r.s7()
        t["title2"] = r.s7()
        t["card_loc"] = r.word()
        for k in ("revision", "module", "variable", "prefix", "project", "page",
                  "of", "drawing_code", "site1", "site2", "next_higher_assembly"):
            t[k] = r.s7()
        for k in ("drawn_by_filespec", "checked_by_filespec", "engineered_by_filespec"):
            t[k] = r.s6()
        self.trailer = t
        self.end_index = r.i
        self.total_halfwords = len(r.w)


def dump(d):
    print("file", d.path)
    print("version", d.version, "nomenclature", repr(d.nomenclature_type), "board", repr(d.board_type))
    print("type names", d.type_names)
    print("library file specs", d.library_file_specs)
    print("macros", d.macros)
    print("trailer", d.trailer)
    print("halfwords parsed %d of %d" % (d.end_index, d.total_halfwords))
    for bd in d.body_defs.values():
        print("BODYDEF %r name2=%r bits=%o loc_offset=%s loc_char_offset=%s lines=%d" % (
            bd.name, bd.name2, bd.bits, bd.loc_offset, bd.loc_char_offset, len(bd.lines)))
        for p in bd.pins:
            print("   pin loc=%s bits=%o id=%d pos=%o name=%d" % (p.loc, p.bits, p.id, p.pos, p.name))
        for p in bd.props:
            print("   prop %r=%r size=%d loc=%s off=%s" % (p.name, p.value, p.text_size, p.text_loc, p.const_offset))
    for b in d.bodies:
        print("BODY id=%d %r refdes=%r loc=%s orient=%o (raw %o) bits=%o const_off=%s char_off=%s" % (
            b.id, b.name_of_body_def, b.refdes, b.loc, b.orient, b.orientation, b.bits, b.const_offset, b.char_offset))
        for p in b.props:
            print("   prop %r=%r size=%d loc=%s off=%s" % (p.name, p.value, p.text_size, p.text_loc, p.const_offset))
    for p in d.points:
        print("POINT id=%s loc=%s d=%s u=%s l=%s r=%s bits=%o pin=%d size=%o off=%s name=%r cpin=%o/%o coff=%s" % (
            p.id, p.loc, p.down, p.up, p.left, p.right, p.bits, p.pin_name, p.size_of_text,
            p.text_offset, p.name, p.card_loc, p.io_loc, p.const_offset))
    for sc in d.set_centers:
        print("SETCENTER", sc)


if __name__ == "__main__":
    import sys
    dump(Drawing(sys.argv[1]))
