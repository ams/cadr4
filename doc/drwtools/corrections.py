"""Drawing errors corrected while a page is rendered.

The drawing on the tape is the source and is never edited.  A page whose
label is wrong is corrected on the way out, the same way cadr4's
Makefile.common corrects it on the way into VHDL, so the png and the VHDL
say the same thing.  Every correction is listed in doc/schematics/README.md
and in the note block at the end of doc/schematics/drw-index.txt.

CORRECTIONS[(group, page)] is a tuple of

    (refdes, dip pin, label as drawn, corrected label, why)

The label is found through the body pin, not by name, so a correction can
only touch the one input it is about, and a copy of the page that does not
have that body or that label is left alone and reported as skipped.
"""

CORRECTIONS = {
    ("cadr1", "reqlm"): (
        ("0E09", 2, "LMX GRANT A", "UBX GRANT A",
         "E09 makes the Unibus master's term of XBUS REQUEST (UBXRQ AND grant"
         " AND -UB TO MD AND MSYN IN), so the grant is the Unibus master's."
         "  LMX GRANT A is the processor's own and never comes for a Unibus"
         " master's cycle, which would leave a Unibus-to-Xbus cycle through"
         " the map granted and never requesting.  The 3-OCT-78 revision of"
         " the page (ITS tape 7008105) draws the whole term as one 9S42 at"
         " C14 and names that input UBX GRANT A; the label was changed by one"
         " letter when the page was redrawn on 10-DEC-80.  busint.wlr of"
         " 11-DEC-80 was generated from the new drawing and carries the same"
         " error, and no ECO touches it."),
    ),
}


def page_key(path):
    """(group, page) for a drawing path: the directory it sits in and its
    file name, as the tape spells them."""
    import os
    return (os.path.basename(os.path.dirname(path)).lower(),
            os.path.splitext(os.path.basename(path))[0].lower())


def pin_point(d, refdes, pin):
    """The point of body <refdes> pin <pin>, or None.  A refdes can name
    more than one body on a page (one per gate of a chip); only one of them
    carries a given pin."""
    for b in d.bodies:
        if b.refdes.lstrip("0") != refdes.lstrip("0"):
            continue
        for p in d.points:
            if p.bits & 0o200000 and p.id[1] == b.id and p.pin_name == pin:
                return p
    return None


def apply(d, path):
    """Rename the labels listed for this page.  Returns one note per entry,
    saying whether it was applied or skipped."""
    notes = []
    for refdes, pin, old, new, why in CORRECTIONS.get(page_key(path), ()):
        where = "%s-%d" % (refdes.lstrip("0"), pin)
        p = pin_point(d, refdes, pin)
        label = None
        if p is not None:
            for link in (p.down, p.up, p.left, p.right):
                q = d.point_by_id.get(link)
                if q is not None and q.name == old:
                    label = q
                    break
        if label is None:
            notes.append("correction not applied at %s: %s" % (
                where, "this copy has no such pin" if p is None
                else "that pin is not labelled %r here" % old))
            continue
        label.name = new
        notes.append("corrected %s: %r drawn, rendered as %r" % (where, old, new))
    return notes
