-- CLOCK2 -- MASTER CLOCK

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_clock2 is
signal net_0 : std_logic;
signal net_1 : std_logic;
signal net_2 : std_logic;
signal net_3 : std_logic;
begin
clock2_1c01 : dip_7428 port map (p1 => clk4, p2 => \-clk0\, p3 => gnd, p4 => mclk7, p5 => \-mclk0\, p6 => gnd, p8 => '0', p9 => '0', p10 => open, p11 => '0', p12 => '0', p13 => open);
clock2_1c02 : dip_7428 port map (p1 => \-wp1\, p2 => tpwp, p3 => gnd, p4 => \-wp2\, p5 => tpwp, p6 => gnd, p8 => gnd, p9 => tpwp, p10 => \-wp3\, p11 => gnd, p12 => tpwp, p13 => \-wp4\);
clock2_1c06 : dip_74s10 port map (p1 => \-tprend\, p2 => tpclk, p3 => \-tptse\, p4 => \-tpr25\, p5 => \-clock reset b\, p6 => tptse, p8 => net_0, p9 => \-clock reset b\, p10 => \-tpw70\, p11 => net_1, p12 => \-tpclk\, p13 => \-clock reset b\);
clock2_1c07 : tpclk    <= \-tpr0\ nand \-tpclk\;
              \-tptse\ <= \-tpr5\ nand tptse;
              net_1    <= net_0 nand \-tpw30\;
clock2_1c10 : tpwp <= net_0 nor \-machruna\;
              tpwpiram <= \-machruna\ nor net_2;
clock2_1c11 : dip_7428 port map (p1 => \-wp5\, p2 => tpwpiram, p3 => gnd, p4 => clk5, p5 => \-clk0\, p6 => gnd, p8 => gnd, p9 => \-mclk0\, p10 => mclk5, p11 => '0', p12 => '0', p13 => open);
clock2_1c13 : dip_74s10 port map (p1 => '0', p2 => '0', p3 => \-tprend\, p4 => net_2, p5 => net_2, p6 => net_3, p8 => net_2, p9 => \-tpw45\, p10 => \-clock reset b\, p11 => net_3, p12 => open, p13 => '0');
clock2_1d04 : dip_7428 port map (p1 => \-tse1\, p2 => tptse, p3 => gnd, p4 => \-tse2\, p5 => tptse, p6 => gnd, p8 => gnd, p9 => tptse, p10 => \-tse3\, p11 => gnd, p12 => tptse, p13 => \-tse4\);
clock2_1d05 : dip_7428 port map (p1 => clk1, p2 => \-clk0\, p3 => gnd, p4 => clk2, p5 => \-clk0\, p6 => gnd, p8 => gnd, p9 => \-clk0\, p10 => clk3, p11 => gnd, p12 => \-mclk0\, p13 => mclk1);
clock2_1d10 : \-clk0\ <= \-tpclk\ and machrun;
              \-mclk0\ <= hi1 and \-tpclk\;
end architecture;
