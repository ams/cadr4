-- FLAG -- FLAGS,CONDITIONALS

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_flag is
signal net_0 : std_logic;
begin
flag_3e07 : \-ilong\ <= ir45 nand \-nopa\;
flag_3e08 : dip_25ls2519 port map (p1 => ob29, p2 => open, p3 => \lc byte mode\, p4 => ob28, p5 => open, p6 => \prog.unibus.reset\, p7 => hi4, p8 => gnd, p9 => clk3c, p11 => \int.enable\, p12 => open, p13 => ob27, p14 => \sequence.break\, p15 => open, p16 => ob26, p17 => \-destintctl\, p18 => hi4, p19 => \-reset\);
flag_3e11 : \-statbit\ <= \-nopa\ nand ir46;
flag_3e13 : dip_74s151 port map (p1 => \a=m\, p2 => alu32, p3 => aluneg, p4 => r0, p5 => jcond, p6 => \-jcond\, p7 => gnd, p9 => conds2, p10 => conds1, p11 => conds0, p12 => hi4, p13 => \pgf.or.int.or.sb\, p14 => \pgf.or.int\, p15 => \-vmaok\);
flag_3e14 : conds2 <= ir2 and ir5;
            conds1 <= ir1 and ir5;
            conds0 <= ir5 and ir0;
flag_3e17 : dip_74s02o port map (p1 => open, p2 => '0', p3 => '0', p4 => open, p5 => '0', p6 => '0', p8 => '0', p9 => '0', p10 => open, p11 => \-alu32\, p12 => \a=m\, p13 => aluneg);
flag_3e18 : dip_74s32 port map (p1 => '0', p2 => '0', p3 => open, p4 => \-vmaok\, p5 => sint, p6 => \pgf.or.int\, p8 => net_0, p9 => \sequence.break\, p10 => sint, p11 => \pgf.or.int.or.sb\, p12 => net_0, p13 => \-vmaok\);
flag_3e22 : \-alu32\ <= not alu32;
flag_4d09 : sint <= \int.enable\ and sintr;
end architecture;
