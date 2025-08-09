-- CLM -- CABLES TO PROCESSOR

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_clm is
begin
clm_0a22 : dip_sip330_470_8 port map (p2 => wrcyc, p3 => \-mclk7\, p4 => \-memrq\, p5 => \-xbus power reset\, p6 => \hi 15-30\, p7 => \hi 15-30\);
clm_0b07 : dip_74s04 port map (p1 => 'Z', p2 => open, p3 => 'Z', p4 => open, p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => clk0, p11 => \-mclk7\, p12 => \-clk\, p13 => clk0);
end architecture;
