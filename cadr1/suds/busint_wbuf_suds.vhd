-- WBUF -- WRITE BUFFER

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_wbuf is
begin
wbuf_0c24 : dip_29701 port map (p1 => \-ubpn3b\, p2 => gnd, p3 => \-wbufwe\, p4 => udi3, p5 => wbuf3, p6 => udi2, p7 => wbuf2, p9 => wbuf1, p10 => udi1, p11 => wbuf0, p12 => udi0, p13 => \-ubpn0b\, p14 => \-ubpn1b\, p15 => \-ubpn2b\);
wbuf_0c25 : dip_29701 port map (p1 => \-ubpn3b\, p2 => gnd, p3 => \-wbufwe\, p4 => udi7, p5 => wbuf7, p6 => udi6, p7 => wbuf6, p9 => wbuf5, p10 => udi5, p11 => wbuf4, p12 => udi4, p13 => \-ubpn0b\, p14 => \-ubpn1b\, p15 => \-ubpn2b\);
wbuf_0c26 : dip_29701 port map (p1 => \-ubpn3a\, p2 => gnd, p3 => \-wbufwe\, p4 => udi11, p5 => wbuf11, p6 => udi10, p7 => wbuf10, p9 => wbuf9, p10 => udi9, p11 => wbuf8, p12 => udi8, p13 => \-ubpn0a\, p14 => \-ubpn1a\, p15 => \-ubpn2a\);
wbuf_0c27 : dip_29701 port map (p1 => \-ubpn3a\, p2 => gnd, p3 => \-wbufwe\, p4 => udi15, p5 => wbuf15, p6 => udi14, p7 => wbuf14, p9 => wbuf13, p10 => udi13, p11 => wbuf12, p12 => udi12, p13 => \-ubpn0a\, p14 => \-ubpn1a\, p15 => \-ubpn2a\);
end architecture;
