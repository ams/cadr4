"""Make comparison images: reference PNG vs rendered PNG.

    compare.py ref.png mine.png out_prefix [x y w h]

Writes out_prefix-side.png (both at half size, side by side) and
out_prefix-overlay.png (reference in red, rendered in blue, common in
black; optionally cropped to x y w h in page pixels).
"""

import sys

from PIL import Image, ImageChops

ref = Image.open(sys.argv[1]).convert("L")
mine = Image.open(sys.argv[2]).convert("L")
prefix = sys.argv[3]
crop = tuple(int(v) for v in sys.argv[4:8]) if len(sys.argv) >= 8 else None

w, h = ref.size
side = Image.new("L", (w, h * 2 // 2 + h // 2), 255)
side = Image.new("L", (w // 2 * 2 + 10, h // 2), 255)
side.paste(ref.resize((w // 2, h // 2)), (0, 0))
side.paste(mine.resize((w // 2, h // 2)), (w // 2 + 10, 0))
side.save(prefix + "-side.png")

r = ref.point(lambda v: 255 if v < 128 else 0)
m = mine.point(lambda v: 255 if v < 128 else 0)
white = Image.new("L", ref.size, 255)
# red = ref only, blue = mine only, black = both
red = ImageChops.subtract(white, m)     # 0 where mine has ink
green = ImageChops.subtract(white, ImageChops.lighter(r, m))
blue = ImageChops.subtract(white, r)    # 0 where ref has ink
overlay = Image.merge("RGB", (ImageChops.lighter(red, ImageChops.subtract(white, ImageChops.lighter(r, m))) if False else ImageChops.subtract(white, m),
                              ImageChops.subtract(white, ImageChops.lighter(r, m)),
                              ImageChops.subtract(white, r)))
if crop:
    x, y, cw, ch = crop
    overlay = overlay.crop((x, y, x + cw, y + ch))
overlay.save(prefix + "-overlay.png")
