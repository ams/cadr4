-- MCTL -- M CONTROL

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_mctl is
begin
mctl_4a16 : dip_74s258 port map (p1 => clk4e, p2 => wadr4, p3 => ir30, p4 => \-madr4a\, p5 => '0', p6 => '0', p7 => open, p9 => open, p10 => '0', p11 => '0', p12 => \-madr4b\, p13 => ir30, p14 => wadr4, p15 => gnd);
mctl_4a18 : dip_74s258 port map (p1 => clk4e, p2 => wadr0, p3 => ir26, p4 => \-madr0b\, p5 => wadr1, p6 => ir27, p7 => \-madr1b\, p9 => \-madr2b\, p10 => ir28, p11 => wadr2, p12 => \-madr3b\, p13 => ir29, p14 => wadr3, p15 => gnd);
mctl_4a19 : dip_res20 port map (p2 => open, p3 => mmem15, p4 => mmem14, p5 => mmem13, p6 => mmem12, p7 => mmem11, p8 => mmem10, p9 => mmem9, p10 => open, p11 => mmem8, p12 => mmem7, p13 => mmem6, p14 => mmem5, p15 => mmem4, p16 => mmem3, p17 => mmem2, p18 => mmem1, p19 => mmem0);
mctl_4b11 : \-mpass\ <= tse4a and mpass and \-ir31\;
            srcm <= \-mpass\ and \-ir31\ and and hi2;
mctl_4b12 : \-mpass\ <= not mpass;
mctl_4b14 : \-mpassl\ <= not (mpass and tse4a and \-ir31\);
            \-mpassm\ <= not (tse4a and \-ir31\ and \-mpass\);
mctl_4b18 : dip_93s46 port map (p1 => ir26, p2 => wadr0, p3 => ir27, p4 => wadr1, p5 => ir28, p6 => wadr2, p7 => hi2, p9 => mpass, p10 => ir29, p11 => wadr3, p12 => ir30, p13 => wadr4, p14 => hi2, p15 => destmd);
mctl_4b19 : dip_74s258 port map (p1 => clk4e, p2 => wadr0, p3 => ir26, p4 => \-madr0a\, p5 => wadr1, p6 => ir27, p7 => \-madr1a\, p9 => \-madr2a\, p10 => ir28, p11 => wadr2, p12 => \-madr3a\, p13 => ir29, p14 => wadr3, p15 => gnd);
mctl_4b20 : dip_res20 port map (p2 => mmemparity, p3 => mmem31, p4 => mmem30, p5 => mmem29, p6 => mmem28, p7 => mmem27, p8 => mmem26, p9 => mmem25, p10 => open, p11 => mmem24, p12 => mmem23, p13 => mmem22, p14 => mmem21, p15 => mmem20, p16 => mmem19, p17 => mmem18, p18 => mmem17, p19 => mmem16);
mctl_4b22 : \-mwpa\  <= not (destmd and wp4b);
            \-mwpb\  <= not (destmd and wp4b);
end architecture;
