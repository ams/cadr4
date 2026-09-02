"""Render a SUDS .drw drawing to a PNG that mimics the SUDS XGP plots at
tumbleweed.nu/lm-3/schematics (2112x1700, 1-bit, 200 dpi landscape).

Geometry rules were derived by comparing the parsed data of
CADRDC;DCBUSY with the reference PNG:

- 1 SUDS unit = 2 px, y up.
- Body outline points and pin locations are relative to the body location
  (no offset).  The reference designator is centred at
  body.loc + body.const_offset.
- Text: SUDS positions text on an 8x16-unit character grid; the plotter
  draws it with a narrower font (9 px per char).  The text is right-,
  left- or centre-justified depending on where the 8-unit box lies
  relative to the location it belongs to.
- The plot is centred: the bounding box of all ink is centred in the
  drawing area of the frame.
"""

import datetime
import os
import sys
import zoneinfo

from PIL import Image, ImageDraw, ImageFont

import suds

UNIT = 2                      # px per SUDS unit
PAGE_W, PAGE_H = 2112, 1700
FRAME_L, FRAME_T, FRAME_R, FRAME_B = 20, 59, 2110, 1669
STRIP_T = 1609
DIVIDERS = (660, 1310, 1710)  # 660 is not drawn
AREA_CX, AREA_CY = (FRAME_L + FRAME_R) / 2, (FRAME_T + STRIP_T) / 2

# fonts: a monospace text font (9 px pitch at 15 px) and a bold typewriter
# title font; override with DRW_FONT / DRW_TITLE_FONT, else the first of
# these that exists is used
FONT_CANDIDATES = [
    "/System/Library/Fonts/Menlo.ttc",                             # macOS
    "/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf",         # Debian/Ubuntu
    "/usr/share/fonts/dejavu/DejaVuSansMono.ttf",                  # Fedora
]
TITLE_FONT_CANDIDATES = [
    "/System/Library/Fonts/Courier.ttc",
    "/usr/share/fonts/truetype/liberation/LiberationMono-Bold.ttf",
    "/usr/share/fonts/liberation-mono/LiberationMono-Bold.ttf",
    "/usr/share/fonts/truetype/dejavu/DejaVuSansMono-Bold.ttf",
]


def pick_font(env, candidates):
    p = os.environ.get(env)
    if p:
        return p
    for c in candidates:
        if os.path.exists(c):
            return c
    raise SystemExit("no font found; set %s to a TrueType font file" % env)


FONT_FILE = pick_font("DRW_FONT", FONT_CANDIDATES)
TITLE_FONT_FILE = pick_font("DRW_TITLE_FONT", TITLE_FONT_CANDIDATES)
CHAR_PX = 9.0                 # reference: 9 px per character
LINE_WIDTH = 2
ITS_TZ = zoneinfo.ZoneInfo("America/New_York")

# Stanford/SAIL character set as printed by the XGP.  0x17 is used by
# SUDS as a line break inside property text and is handled separately.
SAIL = {
    0x01: "↓", 0x02: "α", 0x03: "β", 0x04: "∧",
    0x05: "¬", 0x06: "ε", 0x07: "π", 0x08: "λ",
    0x0e: "∞", 0x0f: "∂", 0x10: "⊂", 0x11: "⊃",
    0x12: "∩", 0x13: "∪", 0x14: "∀", 0x15: "∃",
    0x16: "⊗", 0x18: "_", 0x19: "→", 0x1a: "~",
    0x1b: "≠", 0x1c: "≤", 0x1d: "≥", 0x1e: "≡",
    0x1f: "∨", 0x5e: "↑", 0x5f: "←", 0x7f: "∫",
}

# connector pin letters skip G, I, O and Q
CPIN_LETTERS = " ABCDEFHJKLMNPRSTUV"


def sail(s):
    return "".join(SAIL.get(ord(c), c) for c in s)


def cpin_label(io_loc):
    """Connector pin label.  Two layouts were found in the drawings:
    backplane pins (CADRDC;XBUS) "CB1" = row letter, column letter, side;
    cable connectors (CADR;CPINS, BCPINS) "2FJ1-7" = slot, column letter,
    J<n>, pin, and with slot 0 (CADRDC;DCTMOT) "J05-41"."""
    slot = (io_loc >> 15) & 7
    letter = (io_loc >> 12) & 7
    if letter == 0:
        a = (io_loc >> 9) & 7
        b = (io_loc >> 1) & 0o37
        la = CPIN_LETTERS[a] if a < len(CPIN_LETTERS) else "?"
        lb = CPIN_LETTERS[b] if b < len(CPIN_LETTERS) else "?"
        return "%s%s%d" % (la, lb, (io_loc & 1) + 1)
    conn = (io_loc >> 9) & 7
    pin = io_loc & 0o77
    if slot == 0:
        return "J%02d-%d" % (conn, pin)
    return "%d%sJ%d-%d" % (slot, chr(ord("A") - 1 + letter), conn + 1, pin)


class Fonts:
    def __init__(self):
        self.cache = {}

    def get(self, px, bold=False, title=False):
        key = (px, bold, title)
        if key not in self.cache:
            # .ttc collections: face 1 of Courier is Bold, face 0 of Menlo is Regular
            if title:
                self.cache[key] = ImageFont.truetype(TITLE_FONT_FILE, px, index=1 if TITLE_FONT_FILE.endswith(".ttc") else 0)
            else:
                self.cache[key] = ImageFont.truetype(FONT_FILE, px, index=(1 if bold else 0) if FONT_FILE.endswith(".ttc") else 0)
        return self.cache[key]


FONTS = Fonts()


# SUDS text size -> (font px, SUDS cell width, SUDS cell height, plotter line
# spacing px, plotter half-height in SUDS units).  Size 1 measured on DCBUSY,
# size 2 on ECLVID (11.5 px pitch, 14 px caps, 24 px lines).
SIZES = {1: (15, 8, 16, 16, 4), 2: (19, 12, 24, 24, 6)}


class Text:
    """A text item in page pixel space, before the centring translation.

    x, y is the centre of the text.  scale 1 is normal drawing text.
    """

    def __init__(self, x, y, s, scale=1.0, title=False):
        self.x, self.y, self.s, self.scale, self.title = x, y, s, scale, title
        self.sbox = None            # (left, top, right, bottom) px of the SUDS text box
        if title:
            self.font = FONTS.get(38, title=True)
            self.sx = 1.0
        else:
            # Menlo at 15 px: 11 px cap height, 9 px pitch, like the XGP font
            base = SIZES.get(int(scale), SIZES[1])[0] if scale >= 1 else int(round(15 * scale))
            self.font = FONTS.get(base)
            self.sx = 1.0
        self.w = self.font.getlength(s) * self.sx
        self.h = self.font.size

    def bbox(self):
        return (self.x - self.w / 2, self.y - self.h / 2, self.x + self.w / 2, self.y + self.h / 2)

    def draw(self, page, dx, dy):
        font = self.font
        asc, desc = font.getmetrics()
        w = int(font.getlength(self.s)) + 4
        h = asc + desc
        tmp = Image.new("L", (w, h), 255)
        ImageDraw.Draw(tmp).text((2, 0), self.s, font=font, fill=0)
        if self.sx != 1.0:
            tmp = tmp.resize((max(1, int(round(w * self.sx))), h), Image.LANCZOS)
        # vertical centre on the cap height (capitals dominate)
        capb = font.getbbox("H")
        cap_mid = (capb[1] + capb[3]) / 2
        left = int(round(self.x + dx - tmp.width / 2))
        top = int(round(self.y + dy - cap_mid))
        page.paste(tmp, (left, top), Image.eval(tmp, lambda v: 255 - v))


class Plot:
    def __init__(self):
        self.lines = []     # (x1, y1, x2, y2) in px (y down), untranslated
        self.polys = []     # list of point lists
        self.dots = []      # (x, y, r)
        self.texts = []

    # SUDS units -> page px (y down), untranslated
    @staticmethod
    def px(x, y):
        return x * UNIT, -y * UNIT

    def line(self, x1, y1, x2, y2):
        self.lines.append((*self.px(x1, y1), *self.px(x2, y2)))

    def polyline(self, pts):
        for (x1, y1), (x2, y2) in zip(pts, pts[1:]):
            self.line(x1, y1, x2, y2)

    def polygon(self, pts):
        self.polys.append([self.px(x, y) for x, y in pts])

    def dot(self, x, y, r):
        self.dots.append((*self.px(x, y), r))

    def text_box(self, ax, ay, n, rx, ry, s, scale=1.0):
        """Place text whose SUDS character box has lower-left corner
        (ax, ay) and n characters, belonging to reference location (rx, ry).
        s may contain ^W (0x17) line breaks: the box then covers the whole
        block, and the lines are left-aligned within it."""
        if not s:
            return
        font_px, cw, ch, line_px, half = SIZES.get(int(scale), SIZES[1])
        lines = s.split("\x17")
        if len(lines) > 1:
            n = max(len(ln) for ln in lines)
        left, right = ax, ax + n * cw
        # the plotter halves SUDS's vertical text offset (measured on
        # labels above, beside and below a body)
        cy_px = -(ry + (ay - ry) / 2 + half) * UNIT
        texts = [Text(0, 0, sail(ln), scale) for ln in lines]
        c = (left + right) / 2 - rx     # box centre relative to the location
        # the SUDS cell is 12 or 16 units wide for size 2 depending on the
        # file's vintage; accept either as "centred"
        centred = abs(c) <= n * cw / 4 or (scale == 2 and abs(ax + n * 8 - rx) <= n * 4)
        sbox = (left * UNIT, cy_px - ch * UNIT / 2, right * UNIT, cy_px + ch * UNIT / 2 + (len(lines) - 1) * line_px)
        if len(lines) == 1:
            t = texts[0]
            if centred:
                t.x = rx * UNIT
            elif c < 0:                 # right-justified at the box end
                t.x = right * UNIT - t.w / 2
            else:                       # left-justified at the box start
                t.x = left * UNIT + t.w / 2
            t.y = cy_px
            t.sbox = sbox
            self.texts.append(t)
            return
        wmax = max(t.w for t in texts)
        if centred:
            block_left = rx * UNIT - wmax / 2
        elif c < 0:
            block_left = right * UNIT - wmax
        else:
            block_left = left * UNIT
        for i, t in enumerate(texts):
            if not t.s:
                continue
            t.x = block_left + t.w / 2
            t.y = cy_px + i * line_px
            t.sbox = sbox
            self.texts.append(t)

    def pin_number(self, x, y, pos, digits, socket=None):
        """Pin number with the plotter's "≡" mark, or "(socket)" when the
        chip sits offset in a wire-wrap socket.  pos is the octant of the
        text around the pin: 0=NE 1=N 2=NW 3=W 4=SW 5=S 6=SE 7=E.
        Measured: baseline 2 px above the wire, 3 px clear of the pin."""
        if socket is not None:
            digits = "%s(%d)" % (digits, socket)
        t = Text(0, 0, digits)
        w = t.w + (CHAR_PX if socket is None else 0)
        cx, cy = self.px(x, y)
        dy = {0: -7.5, 1: -7.5, 2: -7.5, 3: 0, 4: 7.5, 5: 7.5, 6: 7.5, 7: 0}[pos]
        if pos in (0, 6, 7):       # text to the right of the pin
            left = cx + 3
        elif pos in (2, 3, 4):     # text to the left of the pin
            left = cx - 3 - w
        else:
            left = cx - w / 2
        t.x, t.y = left + t.w / 2, cy + dy
        self.texts.append(t)
        if socket is None:
            mx = left + t.w + 1    # the mark: three 7 px strokes
            for k in (-3, 0, 3):
                self.lines.append((mx, cy + dy + k, mx + 7, cy + dy + k))

    def text_center(self, x, y, s, scale=1.0):
        t = Text(*self.px(x, y), s, scale)
        self.texts.append(t)

    def bbox_suds(self):
        """Bounding box as SUDS itself would see it: text occupies 8x16
        unit character cells."""
        xs, ys = [], []
        for x1, y1, x2, y2 in self.lines:
            xs += [x1, x2]
            ys += [y1, y2]
        for p in self.polys:
            xs += [q[0] for q in p]
            ys += [q[1] for q in p]
        for t in self.texts:
            if t.sbox:
                xs += [t.sbox[0], t.sbox[2]]
                ys += [t.sbox[1], t.sbox[3]]
            else:
                n = len(t.s) * 8 * UNIT * t.scale
                xs += [t.x - n / 2, t.x + n / 2]
                ys += [t.y - 16 * UNIT * t.scale / 2, t.y + 16 * UNIT * t.scale / 2]
        if not xs:
            return (0, 0, 0, 0)
        return (min(xs), min(ys), max(xs), max(ys))

    def plot_scale(self):
        """The plotter shrinks drawings that do not fit the drawing area,
        in steps of 1/8 (CADRTV;NRAMA is plotted at 7/8).  Deciding on
        the rendered ink extent reproduces 66 of 71 reference pages; the
        plotter also shrank NCAPA-D and LMDOC;FIG3, which fit here, and
        doubled LMDOC;CHOD1.  Use --scale to force those."""
        x1, y1, x2, y2 = self.bbox()
        w, h = x2 - x1, y2 - y1
        if w <= 0 or h <= 0:
            return 1.0
        fit = min((FRAME_R - FRAME_L) / w, (STRIP_T - FRAME_T) / h)
        return max(1, int(min(1.0, fit) * 8)) / 8

    def bbox(self):
        xs, ys = [], []
        for x1, y1, x2, y2 in self.lines:
            xs += [x1, x2]
            ys += [y1, y2]
        for p in self.polys:
            xs += [q[0] for q in p]
            ys += [q[1] for q in p]
        for x, y, r in self.dots:
            xs += [x - r, x + r]
            ys += [y - r, y + r]
        for t in self.texts:
            b = t.bbox()
            xs += [b[0], b[2]]
            ys += [b[1], b[3]]
        if not xs:
            return (0, 0, 0, 0)
        return (min(xs), min(ys), max(xs), max(ys))

    def render(self, title1, title2, date_str, name_str, scale=None):
        page = Image.new("L", (PAGE_W, PAGE_H), 255)
        d = ImageDraw.Draw(page)
        # frame and title strip
        d.rectangle((FRAME_L, FRAME_T, FRAME_R, FRAME_B), outline=0, width=1)
        d.line((FRAME_L, STRIP_T, FRAME_R, STRIP_T), fill=0, width=1)
        for x in DIVIDERS[1:]:
            d.line((x, STRIP_T, x, FRAME_B), fill=0, width=1)
        cells = [FRAME_L] + list(DIVIDERS) + [FRAME_R]
        ty = STRIP_T + 18
        for (a, b), s in zip(zip(cells, cells[1:]), (title1, title2, date_str, name_str)):
            if s:
                Text((a + b) / 2, ty, s, title=True).draw(page, 0, 0)
        # shrink to fit if needed, then centre the drawing
        f = scale or self.plot_scale()
        if f != 1.0:
            self.lines = [(a * f, b * f, c * f, e * f) for a, b, c, e in self.lines]
            self.polys = [[(x * f, y * f) for x, y in p] for p in self.polys]
            self.dots = [(x * f, y * f, r) for x, y, r in self.dots]
            for t in self.texts:
                t.x *= f
                t.y *= f
        self.scale_used = f
        x1, y1, x2, y2 = self.bbox()
        dx = AREA_CX - (x1 + x2) / 2
        dy = AREA_CY - (y1 + y2) / 2
        for xa, ya, xb, yb in self.lines:
            d.line((xa + dx, ya + dy, xb + dx, yb + dy), fill=0, width=LINE_WIDTH)
        for p in self.polys:
            d.polygon([(x + dx, y + dy) for x, y in p], outline=0, width=LINE_WIDTH)
        for x, y, r in self.dots:
            d.ellipse((x + dx - r, y + dy - r, x + dx + r, y + dy + r), fill=0)
        for t in self.texts:
            t.draw(page, dx, dy)
        return page.convert("1")


# orientation codes: 3 bits, low two bits rotate counter-clockwise by
# 90 degrees, bit 2 mirrors.  Only 0, 2 and 3 occur in the CADR drawings.
def orient(code, x, y):
    if code & 4:
        x = -x
    r = code & 3
    for _ in range(r):
        x, y = -y, x
    return x, y


def socket_pin(pin, b, bd):
    """Socket pin for a chip pin when the body sits at socket position
    k = body_loc & 077 in a 20-position socket (measured on NRAMA and
    ECLVID: 16-pin chip at #12 -> 1..8 => 12..19, 9..16 => 2..9)."""
    k = b.body_loc & 0o77
    if not k:
        return None
    m = None
    if bd.name2 and bd.name2.split()[0].isdigit():
        m = int(bd.name2.split()[0])
    if m is None:
        m = max([p.name for p in bd.pins] + [pin])
    n = 20
    sock = k + pin - 1 if pin <= m // 2 else n + 1 - k - m + pin
    if not 1 <= sock <= n:      # not a 20-position socket (chaos boards use #nn differently)
        return None
    return sock


def draw_body(plot, d, b, libs, warn):
    bd = d.body_defs.get(b.name_of_body_def)
    if bd is None:
        for lib in libs:
            bd = lib.get(b.name_of_body_def)
            if bd is not None:
                break
    if bd is None:
        warn.add("no body definition for %r" % b.name_of_body_def)
        return
    bx, by = b.loc

    def T(x, y):
        x, y = orient(b.orient, x, y)
        return bx + x, by + y

    # outline; points beyond +-2048 units are marker values from older
    # libraries or damaged dumps and are treated as pen-up
    cur = None
    for x, y, invisible in bd.lines:
        if abs(x) > 2048 or abs(y) > 2048:
            cur = None
            continue
        p = T(x, y)
        if cur is not None and not invisible:
            plot.line(*cur, *p)
        cur = p
    # pin numbers: the actual number is on the pin point of this body
    # instance; the definition only carries a default
    for pin in bd.pins:
        if pin.bits & 0o400000 or abs(pin.loc[0]) > 2048 or abs(pin.loc[1]) > 2048:
            continue
        px, py = T(*pin.loc)
        pt = d.point_by_id.get((pin.id, b.id))
        num = pt.pin_name if pt is not None and pt.pin_name else pin.name
        plot.pin_number(px, py, pin.pos & 7, str(num), socket_pin(num, b, bd))
    # property text from the definition and the instance
    for prop in list(bd.props) + list(b.props):
        if prop.text_size <= 0 or max(abs(v) for v in prop.text_loc + prop.const_offset) > 2048:
            continue
        scale = float(prop.text_size)
        lx, ly = T(*prop.text_loc)
        ax, ay = lx + prop.const_offset[0], ly + prop.const_offset[1]
        # a body prop value of '*' means "use the body-def value"
        plot.text_box(ax, ay, len(prop.value), lx, ly, prop.value, scale)
    # reference designator; the low 6 bits of the body location give the
    # socket position of pin 1, printed as "#nn" (RAM and ECL pages)
    if b.refdes and b.body_loc:
        s = b.refdes[1:] if b.refdes[0] == "0" else b.refdes
        if b.body_loc & 0o77:
            s += "#%d" % (b.body_loc & 0o77)
        rx, ry = bx + b.const_offset[0], by + b.const_offset[1]
        plot.text_center(rx, ry, s)


def draw_points(plot, d):
    drawn = set()
    for p in d.points:
        links = [l for l in (p.down, p.up, p.left, p.right) if l != (0, 0)]
        for l in links:
            q = d.point_by_id.get(l)
            if q is None:
                continue
            key = (min(p.id, q.id), max(p.id, q.id))
            if key in drawn:
                continue
            drawn.add(key)
            plot.line(*p.loc, *q.loc)
        if len(links) >= 3:
            plot.dot(*p.loc, 4)
        if p.name:
            plot.text_box(p.loc[0] + p.text_offset[0], p.loc[1] + p.text_offset[1],
                          len(p.name), p.loc[0], p.loc[1], p.name,
                          float(p.size_of_text or 1))
        if p.bits & 0o1000:  # connector pin flag
            label = cpin_label(p.io_loc)
            x, y = p.loc
            w = 8 + 3.5 * len(label)   # flag length in units (26 for "CB1")
            if p.left != (0, 0) and p.right == (0, 0):
                pts = [(x, y), (x + 4, y + 4), (x + w - 4, y + 4), (x + w, y), (x + w - 4, y - 4), (x + 4, y - 4)]
                cx = x + w / 2
            else:
                pts = [(x, y), (x - 4, y + 4), (x - w + 4, y + 4), (x - w, y), (x - w + 4, y - 4), (x - 4, y - 4)]
                cx = x - w / 2
            plot.polygon(pts)
            plot.text_center(cx, y, label, 0.75)


def its_date(path):
    """The ITS file date as the title block prints it; blank when the dump
    did not keep the dates (a modern timestamp)."""
    mtime = os.stat(path).st_mtime
    if mtime >= 631152000:  # 1990
        return ""
    t = datetime.datetime.fromtimestamp(mtime, ITS_TZ)
    return t.strftime("%d-%b-%y %H:%M").upper()


def find_library(spec, page_path, search_dirs):
    fn1 = spec[0].lower() + ".drw"
    page_dir = os.path.dirname(page_path)
    for base in [page_dir] + search_dirs:
        cand = os.path.join(base, fn1)
        if os.path.exists(cand):
            return cand
    return None


LIB_CACHE = {}


def load_library(path):
    if path not in LIB_CACHE:
        LIB_CACHE[path] = suds.Drawing(path).body_defs
    return LIB_CACHE[path]


def render_file(path, out_path, search_dirs, name_str=None, scale=None, resolver=None):
    d = suds.Drawing(path)
    warn = set()
    libs = []
    used = []
    for spec in d.library_file_specs:
        lp = resolver(spec) if resolver else find_library(spec, path, search_dirs)
        if lp is None:
            warn.add("library %s not found" % (spec,))
            continue
        try:
            libs.append(load_library(lp))
            used.append(lp)
        except Exception as e:  # noqa - old format or damaged dump
            warn.add("library %s unreadable: %s" % (lp, repr(e)[:60]))
    # last resort libraries
    for extra in search_dirs:
        for fn in ("bodies.drw", "bod2.drw", "bod1.drw", "eclbod.drw", "sips.drw"):
            cand = os.path.join(extra, fn)
            if os.path.isfile(cand) and cand not in used:
                try:
                    libs.append(load_library(cand))
                except Exception:  # noqa
                    pass
    plot = Plot()
    for b in d.bodies:
        if b.id == 0:
            continue
        draw_body(plot, d, b, libs, warn)
    draw_points(plot, d)
    if name_str is None:
        name_str = "%s; %s" % (os.path.basename(os.path.dirname(path)).upper(),
                               os.path.splitext(os.path.basename(path))[0].upper())
    page = plot.render(sail(d.trailer["title1"]), sail(d.trailer["title2"]), its_date(path), name_str, scale)
    page.save(out_path)
    if plot.scale_used != 1.0:
        warn.add("plotted at scale %g" % plot.scale_used)
    return d, used, warn


if __name__ == "__main__":
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument("drw")
    ap.add_argument("out")
    ap.add_argument("-L", "--libdir", action="append", default=[])
    ap.add_argument("-s", "--scale", type=float, help="force the plot scale (e.g. 2, 0.875)")
    a = ap.parse_args()
    d, used, warn = render_file(a.drw, a.out, a.libdir, scale=a.scale)
    print("libraries:", used)
    for w in sorted(warn):
        print("warning:", w)
