-- OLORD2 -- OVERLORD

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_olord2 is
signal net_0 : std_logic;
signal net_1 : std_logic;
signal net_2 : std_logic;
signal net_3 : std_logic;
begin
olord2_1a02 : dip_74s133o port map (p1 => \-ape\, p2 => \-mpe\, p3 => \-pdlpe\, p4 => \-dpe\, p5 => \-ipe\, p6 => \-spe\, p7 => \-higherr\, p9 => err, p10 => \-mempe\, p11 => \-v0pe\, p12 => \-v1pe\, p13 => \-halted\, p14 => hi1, p15 => hi1);
olord2_1a03 : dip_74s374 port map (p1 => gnd, p2 => \-ape\, p3 => aparok, p4 => mmemparok, p5 => \-mpe\, p6 => \-pdlpe\, p7 => pdlparok, p8 => dparok, p9 => \-dpe\, p11 => clk5a, p12 => \-ipe\, p13 => iparok, p14 => spcparok, p15 => \-spe\, p16 => \-higherr\, p17 => highok, p18 => memparok, p19 => \-mempe\);
olord2_1a05 : dip_74s374 port map (p1 => gnd, p2 => \-v0pe\, p3 => v0parok, p4 => vmoparok, p5 => \-v1pe\, p6 => statstop, p7 => \stat.ovf\, p8 => \-halt\, p9 => \-halted\, p11 => clk5a, p12 => open, p13 => '0', p14 => '0', p15 => open, p16 => open, p17 => '0', p18 => '0', p19 => open);
olord2_1a06 : dip_74s37 port map (p1 => \-mclk5\, p2 => \-mclk5\, p3 => mclk5a, p4 => \-clk5\, p5 => \-clk5\, p6 => clk5a, p8 => \-reset\, p9 => hi1, p10 => reset, p11 => \bus.power.reset l\, p12 => \power reset a\, p13 => \power reset a\);
olord2_1a07 : dip_74s02o port map (p1 => highok, p2 => \-upperhighok\, p3 => \-lowerhighok\, p4 => \-boot\, p5 => net_0, p6 => net_2, p8 => \power reset a\, p9 => \prog.bus.reset\, p10 => \-bus.reset\, p11 => '0', p12 => '0', p13 => open);
olord2_1a11 : dip_74s02 port map (p1 => \-clock reset b\, p2 => \power reset a\, p3 => net_3, p4 => \-clock reset a\, p5 => \power reset a\, p6 => net_3, p8 => gnd, p9 => \-power reset\, p10 => \power reset a\, p11 => '0', p12 => '0', p13 => open);
olord2_1a18 : dip_74ls109 port map (p1 => \-boot\, p2 => srun, p3 => hi1, p4 => mclk5a, p5 => \-clock reset a\, p6 => open, p7 => \boot.trap\, p9 => open, p10 => open, p11 => '0', p12 => '0', p13 => '0', p14 => '0', p15 => '0');
olord2_1a19 : dip_16dummy port map (p12 => \-power reset\, p13 => \-boot2\, p14 => \-boot1\, p15 => hi2, p16 => hi1);
olord2_1a20 : dip_74ls14 port map (p1 => '0', p2 => open, p3 => \-boot1\, p4 => net_0, p5 => \-boot2\, p6 => net_1, p8 => open, p9 => '0', p10 => open, p11 => '0', p12 => open, p13 => '0');
olord2_1b10 : dip_74s04 port map (p1 => \-ldmode\, p2 => ldmode, p3 => '0', p4 => open, p5 => mclk5, p6 => \-mclk5\, p8 => \-clk5\, p9 => clk5, p10 => open, p11 => '0', p12 => net_3, p13 => \-busint.lm.reset\);
olord2_1c07 : dip_74s00o port map (p1 => '0', p2 => '0', p3 => open, p4 => '0', p5 => '0', p6 => open, p8 => open, p9 => '0', p10 => '0', p11 => \-lowerhighok\, p12 => hi2, p13 => hi1);
olord2_1c08 : dip_74s10o port map (p1 => '0', p2 => '0', p3 => '0', p4 => '0', p5 => '0', p6 => open, p8 => reset, p9 => \-boot\, p10 => \-clock reset b\, p11 => \-prog.reset\, p12 => open, p13 => '0');
olord2_1c09 : dip_74s00 port map (p1 => '0', p2 => '0', p3 => open, p4 => ldmode, p5 => spy6, p6 => \-prog.reset\, p8 => open, p9 => '0', p10 => '0', p11 => \-errhalt\, p12 => errstop, p13 => err);
olord2_1c18 : dip_74s32 port map (p1 => '0', p2 => '0', p3 => open, p4 => '0', p5 => '0', p6 => open, p8 => net_2, p9 => net_1, p10 => \prog.boot\, p11 => open, p12 => '0', p13 => '0');
olord2_1d10 : dip_74s08 port map (p1 => '0', p2 => '0', p3 => open, p4 => ldmode, p5 => spy7, p6 => \prog.boot\, p8 => open, p9 => '0', p10 => '0', p11 => open, p12 => '0', p13 => '0');
end architecture;
