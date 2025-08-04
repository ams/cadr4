-- DRAM2 -- DISPATCH RAM

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_dram2 is
begin
dram2_1f16 : dip_93425a port map (p1 => dadr10c, p2 => \-dadr0c\, p3 => \-dadr1c\, p4 => \-dadr2c\, p5 => \-dadr3c\, p6 => \-dadr4c\, p7 => dpar, p9 => \-dadr5c\, p10 => \-dadr6c\, p11 => \-dadr7c\, p12 => \-dadr8c\, p13 => \-dadr9c\, p14 => \-dwec\, p15 => aa17);
dram2_1f17 : dip_93425a port map (p1 => \-dadr10c\, p2 => \-dadr0c\, p3 => \-dadr1c\, p4 => \-dadr2c\, p5 => \-dadr3c\, p6 => \-dadr4c\, p7 => dpar, p9 => \-dadr5c\, p10 => \-dadr6c\, p11 => \-dadr7c\, p12 => \-dadr8c\, p13 => \-dadr9c\, p14 => \-dwec\, p15 => aa17);
dram2_1f18 : dip_93425a port map (p1 => dadr10c, p2 => \-dadr0c\, p3 => \-dadr1c\, p4 => \-dadr2c\, p5 => \-dadr3c\, p6 => \-dadr4c\, p7 => dr, p9 => \-dadr5c\, p10 => \-dadr6c\, p11 => \-dadr7c\, p12 => \-dadr8c\, p13 => \-dadr9c\, p14 => \-dwec\, p15 => aa16);
dram2_1f19 : dip_93425a port map (p1 => \-dadr10c\, p2 => \-dadr0c\, p3 => \-dadr1c\, p4 => \-dadr2c\, p5 => \-dadr3c\, p6 => \-dadr4c\, p7 => dr, p9 => \-dadr5c\, p10 => \-dadr6c\, p11 => \-dadr7c\, p12 => \-dadr8c\, p13 => \-dadr9c\, p14 => \-dwec\, p15 => aa16);
dram2_1f20 : dip_74s51 port map (p1 => r3, p2 => ir18b, p3 => hi11, p4 => dmask6, p5 => r6, p6 => \-dadr6c\, p8 => \-dadr3c\, p9 => ir15b, p10 => hi11, p13 => dmask3);
dram2_1f21 : dip_93425a port map (p1 => dadr10c, p2 => \-dadr0c\, p3 => \-dadr1c\, p4 => \-dadr2c\, p5 => \-dadr3c\, p6 => \-dadr4c\, p7 => dp, p9 => \-dadr5c\, p10 => \-dadr6c\, p11 => \-dadr7c\, p12 => \-dadr8c\, p13 => \-dadr9c\, p14 => \-dwec\, p15 => aa15);
dram2_1f22 : dip_93425a port map (p1 => \-dadr10c\, p2 => \-dadr0c\, p3 => \-dadr1c\, p4 => \-dadr2c\, p5 => \-dadr3c\, p6 => \-dadr4c\, p7 => dp, p9 => \-dadr5c\, p10 => \-dadr6c\, p11 => \-dadr7c\, p12 => \-dadr8c\, p13 => \-dadr9c\, p14 => \-dwec\, p15 => aa15);
dram2_1f23 : dip_93425a port map (p1 => dadr10c, p2 => \-dadr0c\, p3 => \-dadr1c\, p4 => \-dadr2c\, p5 => \-dadr3c\, p6 => \-dadr4c\, p7 => dn, p9 => \-dadr5c\, p10 => \-dadr6c\, p11 => \-dadr7c\, p12 => \-dadr8c\, p13 => \-dadr9c\, p14 => \-dwec\, p15 => aa14);
dram2_1f24 : dip_93425a port map (p1 => \-dadr10c\, p2 => \-dadr0c\, p3 => \-dadr1c\, p4 => \-dadr2c\, p5 => \-dadr3c\, p6 => \-dadr4c\, p7 => dn, p9 => \-dadr5c\, p10 => \-dadr6c\, p11 => \-dadr7c\, p12 => \-dadr8c\, p13 => \-dadr9c\, p14 => \-dwec\, p15 => aa14);
dram2_1f25 : dip_74s51 port map (p1 => r2, p2 => ir17b, p3 => hi11, p4 => dmask5, p5 => r5, p6 => \-dadr5c\, p8 => \-dadr2c\, p9 => ir14b, p10 => hi11, p13 => dmask2);
dram2_1f26 : dip_93425a port map (p1 => dadr10c, p2 => \-dadr0c\, p3 => \-dadr1c\, p4 => \-dadr2c\, p5 => \-dadr3c\, p6 => \-dadr4c\, p7 => dpc13, p9 => \-dadr5c\, p10 => \-dadr6c\, p11 => \-dadr7c\, p12 => \-dadr8c\, p13 => \-dadr9c\, p14 => \-dwec\, p15 => aa13);
dram2_1f27 : dip_93425a port map (p1 => \-dadr10c\, p2 => \-dadr0c\, p3 => \-dadr1c\, p4 => \-dadr2c\, p5 => \-dadr3c\, p6 => \-dadr4c\, p7 => dpc13, p9 => \-dadr5c\, p10 => \-dadr6c\, p11 => \-dadr7c\, p12 => \-dadr8c\, p13 => \-dadr9c\, p14 => \-dwec\, p15 => aa13);
dram2_1f28 : dip_93425a port map (p1 => dadr10c, p2 => \-dadr0c\, p3 => \-dadr1c\, p4 => \-dadr2c\, p5 => \-dadr3c\, p6 => \-dadr4c\, p7 => dpc12, p9 => \-dadr5c\, p10 => \-dadr6c\, p11 => \-dadr7c\, p12 => \-dadr8c\, p13 => \-dadr9c\, p14 => \-dwec\, p15 => aa12);
dram2_1f29 : dip_93425a port map (p1 => \-dadr10c\, p2 => \-dadr0c\, p3 => \-dadr1c\, p4 => \-dadr2c\, p5 => \-dadr3c\, p6 => \-dadr4c\, p7 => dpc12, p9 => \-dadr5c\, p10 => \-dadr6c\, p11 => \-dadr7c\, p12 => \-dadr8c\, p13 => \-dadr9c\, p14 => \-dwec\, p15 => aa12);
dram2_1f30 : dip_74s51 port map (p1 => r1, p2 => ir16b, p3 => hi11, p4 => dmask4, p5 => r4, p6 => \-dadr4c\, p8 => \-dadr1c\, p9 => ir13b, p10 => hi11, p13 => dmask1);
dram2_2f01 : dip_74s64 port map (p1 => ir12b, p2 => vmo19, p3 => ir9b, p4 => r0, p5 => dmask0, p6 => \-dmapbenb\, p8 => \-dadr0c\, p9 => vmo18, p10 => ir8b, p11 => hi6, p12 => hi6, p13 => hi6);
dram2_2f02 : dadr10c    <= not \-dadr10c\;
             \-dadr10c\ <= not ir22b;
             \-dadr9c\  <= not ir21b;
             \-dadr8c\  <= not ir20b;
             \-dadr7c\  <= not ir19b;
dram2_2f03 : \-dwec\ <= not (dispwr and wp2);
end architecture;
