-- OLORD1 -- OVERLORD

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_olord1 is
begin
olord1_1a01 : dip_74s174 port map (p1 => \-clock reset a\, p2 => open, p3 => '0', p4 => '0', p5 => open, p6 => speed1a, p7 => sspeed1, p9 => speedclk, p10 => sspeed0, p11 => speed0a, p12 => speed1a, p13 => speed1, p14 => speed0, p15 => speed0a);
olord1_1a04 : dip_74s174 port map (p1 => \-reset\, p2 => speed0, p3 => spy0, p4 => spy1, p5 => speed1, p6 => spy2, p7 => errstop, p9 => \-ldmode\, p10 => stathenb, p11 => spy3, p12 => trapenb, p13 => spy4, p14 => spy5, p15 => promdisable);
olord1_1a08 : dip_74s175 port map (p1 => \-reset\, p2 => open, p3 => open, p4 => spy3, p5 => spy2, p6 => \-opcinh\, p7 => opcinh, p9 => \-ldopc\, p10 => opcclk, p11 => \-opcclk\, p12 => spy1, p13 => spy0, p14 => \-lpc.hold\, p15 => \lpc.hold\);
olord1_1a09 : dip_74s175 port map (p1 => \-reset\, p2 => ldstat, p3 => \-ldstat\, p4 => spy4, p5 => spy3, p6 => \-idebug\, p7 => idebug, p9 => \-ldclk\, p10 => nop11, p11 => \-nop11\, p12 => spy2, p13 => spy1, p14 => \-step\, p15 => step);
olord1_1a10 : dip_74s174 port map (p1 => \-clock reset a\, p2 => promdisabled, p3 => promdisable, p4 => sstep, p5 => ssdone, p6 => step, p7 => sstep, p9 => mclk5a, p10 => srun, p11 => run, p12 => open, p13 => '0', p14 => '0', p15 => open);
olord1_1a14 : dip_74s74 port map (p1 => \-clock reset a\, p2 => spy0, p3 => \-ldclk\, p4 => \-boot\, p5 => run, p6 => \-run\, p8 => open, p9 => open, p10 => '0', p11 => '0', p12 => '0', p13 => '0');
olord1_1a15 : dip_9s42_1 port map (p1 => sstep, p2 => \-ssdone\, p3 => srun, p4 => \-errhalt\, p5 => \-wait\, p6 => \-stathalt\, p7 => machrun, p9 => open, p10 => '0', p11 => '0', p12 => '0', p13 => '0', p14 => '0', p15 => '0');
olord1_1b10 : \-ssdone\ <= not ssdone;
              \stat.ovf\ <= not \-stc32\;
olord1_1c01 : dip_7428 port map (p1 => open, p2 => '0', p3 => '0', p4 => open, p5 => '0', p6 => '0', p8 => \-tpr60\, p9 => gnd, p10 => speedclk, p11 => '0', p12 => '0', p13 => open);
olord1_1c09 : \-stathalt\ <= stathenb nand statstop;
olord1_1c10 : \-machruna\ <=  gnd nor machrun;
olord1_1f10 : \-machrun\ <= not machrun;
end architecture;
