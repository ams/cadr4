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
olord2_1a06 : mclk5a              <= not (\-mclk5\ and \-mclk5\);
              clk5a               <= not (\-clk5\ and \-clk5\);
              \-reset\            <= not (hi1 and reset);
              \bus.power.reset_l\ <= not (\power_reset_a\ and \power_reset_a\);
olord2_1a07 : highok       <= \-upperhighok\ nor \-lowerhighok\;
              \-boot\      <= net_0 nor net_2;
              \-bus.reset\ <= \power reset a\ nor \prog.bus.reset\;
olord2_1a11 : \-clock reset b\ <= \power reset a\ nor net_3;
              \-clock reset a\ <= \power reset a\ nor net_3;
              \power reset a\  <= \-power nor gnd reset\;
olord2_1a18 : dip_74ls109 port map (p1 => \-boot\, p2 => srun, p3 => hi1, p4 => mclk5a, p5 => \-clock reset a\, p6 => open, p7 => \boot.trap\, p9 => open, p10 => open, p11 => '0', p12 => '0', p13 => '0', p14 => '0', p15 => '0');
olord2_1a19 : dip_16dummy port map (p12 => \-power reset\, p13 => \-boot2\, p14 => \-boot1\, p15 => hi2, p16 => hi1);
olord2_1a20 : dip_74ls14 port map (p1 => '0', p2 => open, p3 => \-boot1\, p4 => net_0, p5 => \-boot2\, p6 => net_1, p8 => open, p9 => '0', p10 => open, p11 => '0', p12 => open, p13 => '0');
olord2_1b10 : ldmode   <= not \-ldmode\;
              \-mclk5\ <= not mclk5;
              \-clk5\  <= not clk5;
              net_3    <= not \-busint.lm.reset\;
olord2_1c07 : \-lowerhighok\ <= hi2 nand hi1;
olord2_1c08 : reset <= not (\-boot\ and \-clock reset b\ and \-prog.reset\);
olord2_1c09 : \-prog.reset\ <= ldmode nand spy6;
              \-errhalt\    <= errstop nand err;
olord2_1c18 : net_2 <= net_1 or \prog.boot\;
olord2_1d10 : \prog.boot\ <= ldmode and spy7;
end architecture;
