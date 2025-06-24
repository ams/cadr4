-- DRAM1 -- DISPATCH RAM

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_dram1 is
begin
dram1_2f03 : dip_74s37 port map (p1 => '0', p2 => '0', p3 => open, p4 => wp2, p5 => dispwr, p6 => \-dweb\, p8 => open, p9 => '0', p10 => '0', p11 => open, p12 => '0', p13 => '0');
dram1_2f04 : vmo19 <= not \-vmo19\;
             vmo18 <= not \-vmo18\;
             \-dadr9b\ <= not ir21b;
             \-dadr8b\ <= not ir20b;
             \-dadr7b\ <= not ir19b;
dram1_2f05 : dip_74s64 port map (p1 => ir12b, p2 => vmo19, p3 => ir9b, p4 => r0, p5 => dmask0, p6 => \-dmapbenb\, p8 => \-dadr0b\, p9 => vmo18, p10 => ir8b, p11 => hi6, p12 => hi6, p13 => hi6);
dram1_2f06 : dip_93425a port map (p1 => dadr10a, p2 => \-dadr0b\, p3 => \-dadr1b\, p4 => \-dadr2b\, p5 => \-dadr3b\, p6 => \-dadr4b\, p7 => dpc11, p9 => \-dadr5b\, p10 => \-dadr6b\, p11 => \-dadr7b\, p12 => \-dadr8b\, p13 => \-dadr9b\, p14 => \-dweb\, p15 => aa11);
dram1_2f07 : dip_93425a port map (p1 => \-dadr10a\, p2 => \-dadr0b\, p3 => \-dadr1b\, p4 => \-dadr2b\, p5 => \-dadr3b\, p6 => \-dadr4b\, p7 => dpc11, p9 => \-dadr5b\, p10 => \-dadr6b\, p11 => \-dadr7b\, p12 => \-dadr8b\, p13 => \-dadr9b\, p14 => \-dweb\, p15 => aa11);
dram1_2f08 : dip_93425a port map (p1 => dadr10a, p2 => \-dadr0b\, p3 => \-dadr1b\, p4 => \-dadr2b\, p5 => \-dadr3b\, p6 => \-dadr4b\, p7 => dpc10, p9 => \-dadr5b\, p10 => \-dadr6b\, p11 => \-dadr7b\, p12 => \-dadr8b\, p13 => \-dadr9b\, p14 => \-dweb\, p15 => aa10);
dram1_2f09 : dip_93425a port map (p1 => \-dadr10a\, p2 => \-dadr0b\, p3 => \-dadr1b\, p4 => \-dadr2b\, p5 => \-dadr3b\, p6 => \-dadr4b\, p7 => dpc10, p9 => \-dadr5b\, p10 => \-dadr6b\, p11 => \-dadr7b\, p12 => \-dadr8b\, p13 => \-dadr9b\, p14 => \-dweb\, p15 => aa10);
dram1_2f10 : dip_74s51 port map (p1 => r3, p2 => ir18b, p3 => hi6, p4 => dmask6, p5 => r6, p6 => \-dadr6b\, p8 => \-dadr3b\, p9 => ir15b, p10 => hi6, p13 => dmask3);
dram1_2f11 : dip_93425a port map (p1 => dadr10a, p2 => \-dadr0b\, p3 => \-dadr1b\, p4 => \-dadr2b\, p5 => \-dadr3b\, p6 => \-dadr4b\, p7 => dpc9, p9 => \-dadr5b\, p10 => \-dadr6b\, p11 => \-dadr7b\, p12 => \-dadr8b\, p13 => \-dadr9b\, p14 => \-dweb\, p15 => aa9);
dram1_2f12 : dip_93425a port map (p1 => \-dadr10a\, p2 => \-dadr0b\, p3 => \-dadr1b\, p4 => \-dadr2b\, p5 => \-dadr3b\, p6 => \-dadr4b\, p7 => dpc9, p9 => \-dadr5b\, p10 => \-dadr6b\, p11 => \-dadr7b\, p12 => \-dadr8b\, p13 => \-dadr9b\, p14 => \-dweb\, p15 => aa9);
dram1_2f13 : dip_93425a port map (p1 => dadr10c, p2 => \-dadr0b\, p3 => \-dadr1b\, p4 => \-dadr2b\, p5 => \-dadr3b\, p6 => \-dadr4b\, p7 => dpc8, p9 => \-dadr5b\, p10 => \-dadr6b\, p11 => \-dadr7b\, p12 => \-dadr8b\, p13 => \-dadr9b\, p14 => \-dweb\, p15 => aa8);
dram1_2f14 : dip_93425a port map (p1 => \-dadr10c\, p2 => \-dadr0b\, p3 => \-dadr1b\, p4 => \-dadr2b\, p5 => \-dadr3b\, p6 => \-dadr4b\, p7 => dpc8, p9 => \-dadr5b\, p10 => \-dadr6b\, p11 => \-dadr7b\, p12 => \-dadr8b\, p13 => \-dadr9b\, p14 => \-dweb\, p15 => aa8);
dram1_2f15 : dip_74s51 port map (p1 => r2, p2 => ir17b, p3 => hi6, p4 => dmask5, p5 => r5, p6 => \-dadr5b\, p8 => \-dadr2b\, p9 => ir14b, p10 => hi6, p13 => dmask2);
dram1_2f16 : dip_93425a port map (p1 => dadr10c, p2 => \-dadr0b\, p3 => \-dadr1b\, p4 => \-dadr2b\, p5 => \-dadr3b\, p6 => \-dadr4b\, p7 => dpc7, p9 => \-dadr5b\, p10 => \-dadr6b\, p11 => \-dadr7b\, p12 => \-dadr8b\, p13 => \-dadr9b\, p14 => \-dweb\, p15 => aa7);
dram1_2f17 : dip_93425a port map (p1 => \-dadr10c\, p2 => \-dadr0b\, p3 => \-dadr1b\, p4 => \-dadr2b\, p5 => \-dadr3b\, p6 => \-dadr4b\, p7 => dpc7, p9 => \-dadr5b\, p10 => \-dadr6b\, p11 => \-dadr7b\, p12 => \-dadr8b\, p13 => \-dadr9b\, p14 => \-dweb\, p15 => aa7);
dram1_2f18 : dip_93425a port map (p1 => dadr10c, p2 => \-dadr0b\, p3 => \-dadr1b\, p4 => \-dadr2b\, p5 => \-dadr3b\, p6 => \-dadr4b\, p7 => dpc6, p9 => \-dadr5b\, p10 => \-dadr6b\, p11 => \-dadr7b\, p12 => \-dadr8b\, p13 => \-dadr9b\, p14 => \-dweb\, p15 => aa6);
dram1_2f19 : dip_93425a port map (p1 => \-dadr10c\, p2 => \-dadr0b\, p3 => \-dadr1b\, p4 => \-dadr2b\, p5 => \-dadr3b\, p6 => \-dadr4b\, p7 => dpc6, p9 => \-dadr5b\, p10 => \-dadr6b\, p11 => \-dadr7b\, p12 => \-dadr8b\, p13 => \-dadr9b\, p14 => \-dweb\, p15 => aa6);
dram1_2f20 : dip_74s51 port map (p1 => r1, p2 => ir16b, p3 => hi6, p4 => dmask4, p5 => r4, p6 => \-dadr4b\, p8 => \-dadr1b\, p9 => ir13b, p10 => hi6, p13 => dmask1);
dram1_2f23 : dip_74s241 port map (p1 => gnd, p2 => ir20, p3 => open, p4 => ir21, p5 => open, p6 => ir22, p7 => open, p8 => ir8, p9 => ir9b, p11 => ir9, p12 => ir8b, p13 => '0', p14 => ir22b, p15 => '0', p16 => ir21b, p17 => '0', p18 => ir20b, p19 => hi6);
end architecture;
