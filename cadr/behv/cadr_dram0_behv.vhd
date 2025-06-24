-- DRAM0 -- DISPATCH RAM

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_dram0 is
begin
dram0_2f03 : dip_74s37 port map (p1 => wp2, p2 => dispwr, p3 => \-dwea\, p4 => '0', p5 => '0', p6 => open, p8 => open, p9 => '0', p10 => '0', p11 => open, p12 => '0', p13 => '0');
dram0_2f21 : dadr10a <= not \-dadr10a\;
             \-dadr10a\ <= not ir22b;
             \-dadr9a\ <= not ir21b;
             \-dadr8a\ <= not ir20b;
             \-dadr7a\ <= not ir19b;
dram0_2f24 : dip_74s64 port map (p1 => ir12b, p2 => vmo19, p3 => ir9b, p4 => r0, p5 => dmask0, p6 => \-dmapbenb\, p8 => \-dadr0a\, p9 => vmo18, p10 => ir8b, p11 => hi6, p12 => hi6, p13 => hi6);
dram0_2f25 : dip_74s241 port map (p1 => gnd, p2 => ir12, p3 => ir19b, p4 => ir13, p5 => ir18b, p6 => ir14, p7 => ir17b, p8 => ir15, p9 => ir16b, p11 => ir16, p12 => ir15b, p13 => ir17, p14 => ir14b, p15 => ir18, p16 => ir13b, p17 => ir19, p18 => ir12b, p19 => hi6);
dram0_2f26 : dip_93425a port map (p1 => dadr10a, p2 => \-dadr0a\, p3 => \-dadr1a\, p4 => \-dadr2a\, p5 => \-dadr3a\, p6 => \-dadr4a\, p7 => dpc5, p9 => \-dadr5a\, p10 => \-dadr6a\, p11 => \-dadr7a\, p12 => \-dadr8a\, p13 => \-dadr9a\, p14 => \-dwea\, p15 => aa5);
dram0_2f27 : dip_93425a port map (p1 => \-dadr10a\, p2 => \-dadr0a\, p3 => \-dadr1a\, p4 => \-dadr2a\, p5 => \-dadr3a\, p6 => \-dadr4a\, p7 => dpc5, p9 => \-dadr5a\, p10 => \-dadr6a\, p11 => \-dadr7a\, p12 => \-dadr8a\, p13 => \-dadr9a\, p14 => \-dwea\, p15 => aa5);
dram0_2f28 : dip_93425a port map (p1 => dadr10a, p2 => \-dadr0a\, p3 => \-dadr1a\, p4 => \-dadr2a\, p5 => \-dadr3a\, p6 => \-dadr4a\, p7 => dpc4, p9 => \-dadr5a\, p10 => \-dadr6a\, p11 => \-dadr7a\, p12 => \-dadr8a\, p13 => \-dadr9a\, p14 => \-dwea\, p15 => aa4);
dram0_2f29 : dip_93425a port map (p1 => \-dadr10a\, p2 => \-dadr0a\, p3 => \-dadr1a\, p4 => \-dadr2a\, p5 => \-dadr3a\, p6 => \-dadr4a\, p7 => dpc4, p9 => \-dadr5a\, p10 => \-dadr6a\, p11 => \-dadr7a\, p12 => \-dadr8a\, p13 => \-dadr9a\, p14 => \-dwea\, p15 => aa4);
dram0_2f30 : dip_74s51 port map (p1 => r3, p2 => ir18b, p3 => hi6, p4 => dmask6, p5 => r6, p6 => \-dadr6a\, p8 => \-dadr3a\, p9 => ir15b, p10 => hi6, p13 => dmask3);
dram0_3f01 : dip_93425a port map (p1 => dadr10a, p2 => \-dadr0a\, p3 => \-dadr1a\, p4 => \-dadr2a\, p5 => \-dadr3a\, p6 => \-dadr4a\, p7 => dpc3, p9 => \-dadr5a\, p10 => \-dadr6a\, p11 => \-dadr7a\, p12 => \-dadr8a\, p13 => \-dadr9a\, p14 => \-dwea\, p15 => aa3);
dram0_3f02 : dip_93425a port map (p1 => \-dadr10a\, p2 => \-dadr0a\, p3 => \-dadr1a\, p4 => \-dadr2a\, p5 => \-dadr3a\, p6 => \-dadr4a\, p7 => dpc3, p9 => \-dadr5a\, p10 => \-dadr6a\, p11 => \-dadr7a\, p12 => \-dadr8a\, p13 => \-dadr9a\, p14 => \-dwea\, p15 => aa3);
dram0_3f03 : dip_93425a port map (p1 => dadr10a, p2 => \-dadr0a\, p3 => \-dadr1a\, p4 => \-dadr2a\, p5 => \-dadr3a\, p6 => \-dadr4a\, p7 => dpc2, p9 => \-dadr5a\, p10 => \-dadr6a\, p11 => \-dadr7a\, p12 => \-dadr8a\, p13 => \-dadr9a\, p14 => \-dwea\, p15 => aa2);
dram0_3f04 : dip_93425a port map (p1 => \-dadr10a\, p2 => \-dadr0a\, p3 => \-dadr1a\, p4 => \-dadr2a\, p5 => \-dadr3a\, p6 => \-dadr4a\, p7 => dpc2, p9 => \-dadr5a\, p10 => \-dadr6a\, p11 => \-dadr7a\, p12 => \-dadr8a\, p13 => \-dadr9a\, p14 => \-dwea\, p15 => aa2);
dram0_3f05 : dip_74s51 port map (p1 => r2, p2 => ir17b, p3 => hi4, p4 => dmask5, p5 => r5, p6 => \-dadr5a\, p8 => \-dadr2a\, p9 => ir14b, p10 => hi4, p13 => dmask2);
dram0_3f06 : dip_93425a port map (p1 => dadr10a, p2 => \-dadr0a\, p3 => \-dadr1a\, p4 => \-dadr2a\, p5 => \-dadr3a\, p6 => \-dadr4a\, p7 => dpc1, p9 => \-dadr5a\, p10 => \-dadr6a\, p11 => \-dadr7a\, p12 => \-dadr8a\, p13 => \-dadr9a\, p14 => \-dwea\, p15 => aa1);
dram0_3f07 : dip_93425a port map (p1 => \-dadr10a\, p2 => \-dadr0a\, p3 => \-dadr1a\, p4 => \-dadr2a\, p5 => \-dadr3a\, p6 => \-dadr4a\, p7 => dpc1, p9 => \-dadr5a\, p10 => \-dadr6a\, p11 => \-dadr7a\, p12 => \-dadr8a\, p13 => \-dadr9a\, p14 => \-dwea\, p15 => aa1);
dram0_3f08 : dip_93425a port map (p1 => dadr10a, p2 => \-dadr0a\, p3 => \-dadr1a\, p4 => \-dadr2a\, p5 => \-dadr3a\, p6 => \-dadr4a\, p7 => dpc0, p9 => \-dadr5a\, p10 => \-dadr6a\, p11 => \-dadr7a\, p12 => \-dadr8a\, p13 => \-dadr9a\, p14 => \-dwea\, p15 => aa0);
dram0_3f09 : dip_93425a port map (p1 => \-dadr10a\, p2 => \-dadr0a\, p3 => \-dadr1a\, p4 => \-dadr2a\, p5 => \-dadr3a\, p6 => \-dadr4a\, p7 => dpc0, p9 => \-dadr5a\, p10 => \-dadr6a\, p11 => \-dadr7a\, p12 => \-dadr8a\, p13 => \-dadr9a\, p14 => \-dwea\, p15 => aa0);
dram0_3f10 : dip_74s51 port map (p1 => r1, p2 => ir16b, p3 => hi4, p4 => dmask4, p5 => r4, p6 => \-dadr4a\, p8 => \-dadr1a\, p9 => ir13b, p10 => hi4, p13 => dmask1);
end architecture;
