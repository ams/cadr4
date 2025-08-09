-- UBMAP -- UNIBUS MAP

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_ubmap is
begin
ubmap_0e10 : dip_74s258 port map (p1 => \select page\, p2 => uba10, p3 => uba1, p4 => \-ubpn0b\, p5 => uba11, p6 => uba2, p7 => \-ubpn1b\, p9 => \-ubpn2b\, p10 => uba3, p11 => uba12, p12 => \-ubpn3b\, p13 => uba4, p14 => uba13, p15 => gnd);
ubmap_0e11 : dip_74s258 port map (p1 => \select page\, p2 => uba10, p3 => uba1, p4 => \-ubpn0a\, p5 => uba11, p6 => uba2, p7 => \-ubpn1a\, p9 => \-ubpn2a\, p10 => uba3, p11 => uba12, p12 => \-ubpn3a\, p13 => uba4, p14 => uba13, p15 => gnd);
ubmap_0e12 : dip_29701 port map (p1 => \-ubpn3a\, p2 => gnd, p3 => \-ubmapwe\, p4 => udi3, p5 => ubma11, p6 => udi2, p7 => ubma10, p9 => ubma9, p10 => udi1, p11 => ubma8, p12 => udi0, p13 => \-ubpn0a\, p14 => \-ubpn1a\, p15 => \-ubpn2a\);
ubmap_0e13 : dip_29701 port map (p1 => \-ubpn3a\, p2 => gnd, p3 => \-ubmapwe\, p4 => udi7, p5 => ubma15, p6 => udi6, p7 => ubma14, p9 => ubma13, p10 => udi5, p11 => ubma12, p12 => udi4, p13 => \-ubpn0a\, p14 => \-ubpn1a\, p15 => \-ubpn2a\);
ubmap_0e14 : dip_29701 port map (p1 => \-ubpn3a\, p2 => gnd, p3 => \-ubmapwe\, p4 => udi11, p5 => ubma19, p6 => udi10, p7 => ubma18, p9 => ubma17, p10 => udi9, p11 => ubma16, p12 => udi8, p13 => \-ubpn0a\, p14 => \-ubpn1a\, p15 => \-ubpn2a\);
ubmap_0e15 : dip_29701 port map (p1 => \-ubpn3a\, p2 => gnd, p3 => \-ubmapwe\, p4 => udi15, p5 => mapvalid, p6 => udi14, p7 => writeok, p9 => ubma21, p10 => udi13, p11 => ubma20, p12 => udi12, p13 => \-ubpn0a\, p14 => \-ubpn1a\, p15 => \-ubpn2a\);
ubmap_0e16 : dip_74ls244 port map (p1 => \-ubmap > udo\, p2 => ubma15, p3 => udo0, p4 => ubma14, p5 => udo1, p6 => ubma13, p7 => udo2, p8 => ubma12, p9 => udo3, p11 => ubma11, p12 => udo4, p13 => ubma10, p14 => udo5, p15 => ubma9, p16 => udo6, p17 => ubma8, p18 => udo7, p19 => \-ubmap > udo\);
ubmap_0e17 : dip_74ls244 port map (p1 => \-ubmap > udo\, p2 => mapvalid, p3 => udo8, p4 => writeok, p5 => udo9, p6 => ubma21, p7 => udo10, p8 => ubma20, p9 => udo11, p11 => ubma19, p12 => udo12, p13 => ubma18, p14 => udo13, p15 => ubma17, p16 => udo14, p17 => ubma16, p18 => udo15, p19 => \-ubmap > udo\);
end architecture;
