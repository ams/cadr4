-- CLOCK2 -- MASTER CLOCK

library work;
use work.dip.all;
use work.misc.all;

architecture suds of icmem_clock2 is
signal net_00 : std_logic;
signal net_01 : std_logic;
signal net_02 : std_logic;
signal net_03 : std_logic;
begin
clock2_1c01 : dip_7428 port map (p1 => clk4, p2 => \-clk0\, p3 => gnd, p4 => mclk7, p5 => \-mclk0\, p6 => gnd, p8 => 'Z', p9 => 'Z', p10 => open, p11 => 'Z', p12 => 'Z', p13 => open);
clock2_1c02 : dip_7428 port map (p1 => \-wp1\, p2 => tpwp, p3 => gnd, p4 => \-wp2\, p5 => tpwp, p6 => gnd, p8 => gnd, p9 => tpwp, p10 => \-wp3\, p11 => gnd, p12 => tpwp, p13 => \-wp4\);
clock2_1c06 : dip_74s10 port map (p1 => \-tprend\, p2 => tpclk, p3 => \-tptse\, p4 => \-tpr25\, p5 => \-clock reset b\, p6 => tptse, p8 => net_00, p9 => \-clock reset b\, p10 => \-tpw45\, p11 => net_03, p12 => \-tpclk\, p13 => \-clock reset b\);
clock2_1c07 : dip_74s00 port map (p1 => \-tpr0\, p2 => \-tpclk\, p3 => tpclk, p4 => \-tpr5\, p5 => tptse, p6 => \-tptse\, p8 => net_03, p9 => net_00, p10 => \-tpw30\, p11 => open, p12 => 'Z', p13 => 'Z');
clock2_1c10 : dip_74s02 port map (p1 => open, p2 => 'Z', p3 => 'Z', p4 => tpwp, p5 => net_00, p6 => \-machruna\, p8 => \-machruna\, p9 => net_01, p10 => tpwpiram, p11 => 'Z', p12 => 'Z', p13 => open);
clock2_1c11 : dip_7428 port map (p1 => \-wp5\, p2 => tpwpiram, p3 => gnd, p4 => clk5, p5 => \-clk0\, p6 => gnd, p8 => gnd, p9 => \-mclk0\, p10 => mclk5, p11 => 'Z', p12 => 'Z', p13 => open);
clock2_1c13 : dip_74s10 port map (p1 => 'Z', p2 => 'Z', p3 => \-tprend\, p4 => net_01, p5 => net_01, p6 => net_02, p8 => net_01, p9 => \-tpw45\, p10 => \-clock reset b\, p11 => net_02, p12 => open, p13 => 'Z');
clock2_1d04 : dip_7428 port map (p1 => \-tse1\, p2 => tptse, p3 => gnd, p4 => \-tse2\, p5 => tptse, p6 => gnd, p8 => gnd, p9 => tptse, p10 => \-tse3\, p11 => gnd, p12 => tptse, p13 => \-tse4\);
clock2_1d05 : dip_7428 port map (p1 => clk1, p2 => \-clk0\, p3 => gnd, p4 => clk2, p5 => \-clk0\, p6 => gnd, p8 => gnd, p9 => \-clk0\, p10 => clk3, p11 => gnd, p12 => \-mclk0\, p13 => mclk1);
clock2_1d10 : dip_74s08 port map (p1 => \-tpclk\, p2 => machrun, p3 => \-clk0\, p4 => 'Z', p5 => 'Z', p6 => open, p8 => \-mclk0\, p9 => hi1, p10 => \-tpclk\, p11 => open, p12 => 'Z', p13 => 'Z');
end architecture;
