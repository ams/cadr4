-- ACTL -- A CONTROL

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_actl is
begin
actl_3a06 : dip_74s258 port map (p1 => clk3e, p2 => wadr0, p3 => ir32, p4 => \-aadr0b\, p5 => wadr1, p6 => ir33, p7 => \-aadr1b\, p9 => \-aadr2b\, p10 => ir34, p11 => wadr2, p12 => \-aadr3b\, p13 => ir35, p14 => wadr3, p15 => gnd);
actl_3a12 : dip_74s258 port map (p1 => clk3d, p2 => wadr4, p3 => ir36, p4 => \-aadr4b\, p5 => wadr5, p6 => ir37, p7 => \-aadr5b\, p9 => \-aadr6b\, p10 => ir38, p11 => wadr6, p12 => \-aadr7b\, p13 => ir39, p14 => wadr7, p15 => gnd);
actl_3a16 : dip_74s258 port map (p1 => clk3d, p2 => wadr0, p3 => ir32, p4 => \-aadr0a\, p5 => wadr1, p6 => ir33, p7 => \-aadr1a\, p9 => \-aadr2a\, p10 => ir34, p11 => wadr2, p12 => \-aadr3a\, p13 => ir35, p14 => wadr3, p15 => gnd);
actl_3a21 : dip_74s258 port map (p1 => clk3d, p2 => wadr4, p3 => ir36, p4 => \-aadr4a\, p5 => wadr5, p6 => ir37, p7 => \-aadr5a\, p9 => \-aadr6a\, p10 => ir38, p11 => wadr6, p12 => \-aadr7a\, p13 => ir39, p14 => wadr7, p15 => gnd);
actl_3b15 : dip_74s258 port map (p1 => clk3d, p2 => wadr8, p3 => ir40, p4 => \-aadr8a\, p5 => wadr9, p6 => ir41, p7 => \-aadr9a\, p9 => \-aadr8b\, p10 => ir40, p11 => wadr8, p12 => \-aadr9b\, p13 => ir41, p14 => wadr9, p15 => gnd);
actl_3b16 : \-apass\   <= apass1 nand apass2;
            \-amemenb\ <= \-apass\ nand tse3a;
actl_3b21 : dip_93s46 port map (p1 => ir32, p2 => wadr0, p3 => ir33, p4 => wadr1, p5 => ir34, p6 => wadr2, p7 => hi3, p9 => apass1, p10 => ir35, p11 => wadr3, p12 => ir36, p13 => wadr4, p14 => ir37, p15 => wadr5);
actl_3b26 : dip_74s174 port map (p1 => \-reset\, p2 => wadr0, p3 => ir14, p4 => ir15, p5 => wadr1, p6 => ir16, p7 => wadr2, p9 => clk3d, p10 => wadr3, p11 => ir17, p12 => destmd, p13 => destm, p14 => dest, p15 => destd);
actl_3b27 : dip_93s46 port map (p1 => ir38, p2 => wadr6, p3 => ir39, p4 => wadr7, p5 => ir40, p6 => wadr8, p7 => hi3, p9 => apass2, p10 => ir41, p11 => wadr9, p12 => hi3, p13 => destd, p14 => gnd, p15 => gnd);
actl_3b28 : dip_25s09 port map (p1 => destm, p2 => wadr7, p3 => ir21, p4 => gnd, p5 => gnd, p6 => ir20, p7 => wadr6, p9 => clk3d, p10 => wadr5, p11 => ir19, p12 => gnd, p13 => ir18, p14 => ir18, p15 => wadr4);
actl_3b29 : dip_25s09 port map (p1 => destm, p2 => open, p3 => '0', p4 => '0', p5 => '0', p6 => '0', p7 => open, p9 => clk3d, p10 => wadr9, p11 => ir23, p12 => gnd, p13 => gnd, p14 => ir22, p15 => wadr8);
actl_3b30 : dip_74s37 port map (p1 => wp3a, p2 => destd, p3 => \-awpa\, p4 => wp3a, p5 => destd, p6 => \-awpb\, p8 => \-awpc\, p9 => destd, p10 => wp3a, p11 => open, p12 => '0', p13 => '0');
actl_4b11 : dip_74s11 port map (p1 => '0', p2 => '0', p3 => apass1, p4 => apass2, p5 => tse4a, p6 => apassenb, p8 => open, p9 => '0', p10 => '0', p11 => '0', p12 => open, p13 => '0');
actl_4b14 : dip_74s10 port map (p1 => '0', p2 => '0', p3 => '0', p4 => '0', p5 => '0', p6 => open, p8 => \-apassenb\, p9 => tse4a, p10 => apass2, p11 => apass1, p12 => open, p13 => '0');
end architecture;
