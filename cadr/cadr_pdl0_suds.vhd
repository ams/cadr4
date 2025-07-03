-- PDL0 -- PDL BUFFER LEFT

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_pdl0 is
begin
pdl0_4c10 : dip_93425a generic map (fn => ":1") port map (p1 => gnd, p2 => \-pdla0b\, p3 => \-pdla1b\, p4 => \-pdla2b\, p5 => \-pdla3b\, p6 => \-pdla4b\, p7 => pdlparity, p9 => \-pdla5b\, p10 => \-pdla6b\, p11 => \-pdla7b\, p12 => \-pdla8b\, p13 => \-pdla9b\, p14 => \-pwpa\, p15 => lparity);
pdl0_4c13 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => \-pdla0b\, p3 => \-pdla1b\, p4 => \-pdla2b\, p5 => \-pdla3b\, p6 => \-pdla4b\, p7 => pdl28, p9 => \-pdla5b\, p10 => \-pdla6b\, p11 => \-pdla7b\, p12 => \-pdla8b\, p13 => \-pdla9b\, p14 => \-pwpa\, p15 => l28);
pdl0_4c14 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => \-pdla0b\, p3 => \-pdla1b\, p4 => \-pdla2b\, p5 => \-pdla3b\, p6 => \-pdla4b\, p7 => pdl27, p9 => \-pdla5b\, p10 => \-pdla6b\, p11 => \-pdla7b\, p12 => \-pdla8b\, p13 => \-pdla9b\, p14 => \-pwpa\, p15 => l27);
pdl0_4c15 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => \-pdla0b\, p3 => \-pdla1b\, p4 => \-pdla2b\, p5 => \-pdla3b\, p6 => \-pdla4b\, p7 => pdl26, p9 => \-pdla5b\, p10 => \-pdla6b\, p11 => \-pdla7b\, p12 => \-pdla8b\, p13 => \-pdla9b\, p14 => \-pwpa\, p15 => l26);
pdl0_4c17 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => \-pdla0b\, p3 => \-pdla1b\, p4 => \-pdla2b\, p5 => \-pdla3b\, p6 => \-pdla4b\, p7 => pdl21, p9 => \-pdla5b\, p10 => \-pdla6b\, p11 => \-pdla7b\, p12 => \-pdla8b\, p13 => \-pdla9b\, p14 => \-pwpb\, p15 => l21);
pdl0_4c18 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => \-pdla0b\, p3 => \-pdla1b\, p4 => \-pdla2b\, p5 => \-pdla3b\, p6 => \-pdla4b\, p7 => pdl20, p9 => \-pdla5b\, p10 => \-pdla6b\, p11 => \-pdla7b\, p12 => \-pdla8b\, p13 => \-pdla9b\, p14 => \-pwpb\, p15 => l20);
pdl0_4c19 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => \-pdla0b\, p3 => \-pdla1b\, p4 => \-pdla2b\, p5 => \-pdla3b\, p6 => \-pdla4b\, p7 => pdl19, p9 => \-pdla5b\, p10 => \-pdla6b\, p11 => \-pdla7b\, p12 => \-pdla8b\, p13 => \-pdla9b\, p14 => \-pwpb\, p15 => l19);
pdl0_4c20 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => \-pdla0b\, p3 => \-pdla1b\, p4 => \-pdla2b\, p5 => \-pdla3b\, p6 => \-pdla4b\, p7 => pdl18, p9 => \-pdla5b\, p10 => \-pdla6b\, p11 => \-pdla7b\, p12 => \-pdla8b\, p13 => \-pdla9b\, p14 => \-pwpb\, p15 => l18);
pdl0_4d11 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => \-pdla0b\, p3 => \-pdla1b\, p4 => \-pdla2b\, p5 => \-pdla3b\, p6 => \-pdla4b\, p7 => pdl31, p9 => \-pdla5b\, p10 => \-pdla6b\, p11 => \-pdla7b\, p12 => \-pdla8b\, p13 => \-pdla9b\, p14 => \-pwpa\, p15 => l31);
pdl0_4d12 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => \-pdla0b\, p3 => \-pdla1b\, p4 => \-pdla2b\, p5 => \-pdla3b\, p6 => \-pdla4b\, p7 => pdl30, p9 => \-pdla5b\, p10 => \-pdla6b\, p11 => \-pdla7b\, p12 => \-pdla8b\, p13 => \-pdla9b\, p14 => \-pwpa\, p15 => l30);
pdl0_4d13 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => \-pdla0b\, p3 => \-pdla1b\, p4 => \-pdla2b\, p5 => \-pdla3b\, p6 => \-pdla4b\, p7 => pdl29, p9 => \-pdla5b\, p10 => \-pdla6b\, p11 => \-pdla7b\, p12 => \-pdla8b\, p13 => \-pdla9b\, p14 => \-pwpa\, p15 => l29);
pdl0_4d16 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => \-pdla0b\, p3 => \-pdla1b\, p4 => \-pdla2b\, p5 => \-pdla3b\, p6 => \-pdla4b\, p7 => pdl25, p9 => \-pdla5b\, p10 => \-pdla6b\, p11 => \-pdla7b\, p12 => \-pdla8b\, p13 => \-pdla9b\, p14 => \-pwpa\, p15 => l25);
pdl0_4d17 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => \-pdla0b\, p3 => \-pdla1b\, p4 => \-pdla2b\, p5 => \-pdla3b\, p6 => \-pdla4b\, p7 => pdl24, p9 => \-pdla5b\, p10 => \-pdla6b\, p11 => \-pdla7b\, p12 => \-pdla8b\, p13 => \-pdla9b\, p14 => \-pwpa\, p15 => l24);
pdl0_4d18 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => \-pdla0b\, p3 => \-pdla1b\, p4 => \-pdla2b\, p5 => \-pdla3b\, p6 => \-pdla4b\, p7 => pdl23, p9 => \-pdla5b\, p10 => \-pdla6b\, p11 => \-pdla7b\, p12 => \-pdla8b\, p13 => \-pdla9b\, p14 => \-pwpa\, p15 => l23);
pdl0_4d19 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => \-pdla0b\, p3 => \-pdla1b\, p4 => \-pdla2b\, p5 => \-pdla3b\, p6 => \-pdla4b\, p7 => pdl22, p9 => \-pdla5b\, p10 => \-pdla6b\, p11 => \-pdla7b\, p12 => \-pdla8b\, p13 => \-pdla9b\, p14 => \-pwpa\, p15 => l22);
pdl0_4d21 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => \-pdla0b\, p3 => \-pdla1b\, p4 => \-pdla2b\, p5 => \-pdla3b\, p6 => \-pdla4b\, p7 => pdl17, p9 => \-pdla5b\, p10 => \-pdla6b\, p11 => \-pdla7b\, p12 => \-pdla8b\, p13 => \-pdla9b\, p14 => \-pwpb\, p15 => l17);
pdl0_4d22 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => \-pdla0b\, p3 => \-pdla1b\, p4 => \-pdla2b\, p5 => \-pdla3b\, p6 => \-pdla4b\, p7 => pdl16, p9 => \-pdla5b\, p10 => \-pdla6b\, p11 => \-pdla7b\, p12 => \-pdla8b\, p13 => \-pdla9b\, p14 => \-pwpb\, p15 => l16);
end architecture;
