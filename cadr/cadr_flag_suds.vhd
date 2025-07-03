-- FLAG -- FLAGS,CONDITIONALS

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_flag is
signal net_0 : std_logic;
begin
flag_3e07 : dip_74s00 port map (p1 => ir45, p2 => \-nopa\, p3 => \-ilong\, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
flag_3e08 : dip_25ls2519 port map (p1 => ob29, p2 => open, p3 => \lc byte mode\, p4 => ob28, p5 => open, p6 => \prog.unibus.reset\, p7 => hi4, p8 => gnd, p9 => clk3c, p11 => \int.enable\, p12 => open, p13 => ob27, p14 => \sequence.break\, p15 => open, p16 => ob26, p17 => \-destintctl\, p18 => hi4, p19 => \-reset\);
flag_3e11 : dip_74s00 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => \-statbit\, p12 => \-nopa\, p13 => ir46);
flag_3e13 : dip_74s151 port map (p1 => \a=m\, p2 => alu32, p3 => aluneg, p4 => r0, p5 => jcond, p6 => \-jcond\, p7 => gnd, p9 => conds2, p10 => conds1, p11 => conds0, p12 => hi4, p13 => \pgf.or.int.or.sb\, p14 => \pgf.or.int\, p15 => \-vmaok\);
flag_3e14 : dip_74s08 port map (p1 => ir2, p2 => ir5, p3 => conds2, p4 => ir1, p5 => ir5, p6 => conds1, p8 => conds0, p9 => ir5, p10 => ir0, p11 => open, p12 => 'Z', p13 => 'Z');
flag_3e17 : dip_74s02o port map (p1 => open, p2 => 'Z', p3 => 'Z', p4 => open, p5 => 'Z', p6 => 'Z', p8 => 'Z', p9 => 'Z', p10 => open, p11 => \-alu32\, p12 => \a=m\, p13 => aluneg);
flag_3e18 : dip_74s32 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => \-vmaok\, p5 => sint, p6 => \pgf.or.int\, p8 => net_0, p9 => \sequence.break\, p10 => sint, p11 => \pgf.or.int.or.sb\, p12 => net_0, p13 => \-vmaok\);
flag_3e22 : dip_74s04 port map (p1 => 'Z', p2 => open, p3 => 'Z', p4 => open, p5 => 'Z', p6 => open, p8 => \-alu32\, p9 => alu32, p10 => open, p11 => 'Z', p12 => open, p13 => 'Z');
flag_4d09 : dip_74s08 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => sint, p9 => \int.enable\, p10 => sintr, p11 => open, p12 => 'Z', p13 => 'Z');
end architecture;
