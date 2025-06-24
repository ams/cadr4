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
clock2_1c06 : \-tpclk\ <= not (\-tprend\ and tpclk and \-clock reset b\);
              tptse <= not (\-tptse\ and \-tpr25\ and \-clock reset b\);
              net_0 <= not (\-clock reset b\ and \-tpw70\ and net_1);
clock2_1c07 : tpclk    <= \-tpr0\ nand \-tpclk\;
              \-tptse\ <= \-tpr5\ nand tptse;
              net_1    <= net_0 nand \-tpw30\;
clock2_1c10 : tpwp <= net_0 nor \-machruna\;
              tpwpiram <= \-machruna\ nor net_2;
clock2_1c11 : dip_7428 port map (p1 => \-wp5\, p2 => tpwpiram, p3 => gnd, p4 => clk5, p5 => \-clk0\, p6 => gnd, p8 => gnd, p9 => \-mclk0\, p10 => mclk5, p11 => '0', p12 => '0', p13 => open);
clock2_1c13 : net_3 <= not (\-tprend\ and net_2 and net_2);
              net_2 <= not (\-tpw45\ and \-clock reset b\ and net_3);
clock2_1d04 : dip_7428 port map (p1 => \-tse1\, p2 => tptse, p3 => gnd, p4 => \-tse2\, p5 => tptse, p6 => gnd, p8 => gnd, p9 => tptse, p10 => \-tse3\, p11 => gnd, p12 => tptse, p13 => \-tse4\);
clock2_1d05 : dip_7428 port map (p1 => clk1, p2 => \-clk0\, p3 => gnd, p4 => clk2, p5 => \-clk0\, p6 => gnd, p8 => gnd, p9 => \-clk0\, p10 => clk3, p11 => gnd, p12 => \-mclk0\, p13 => mclk1);
clock2_1d10 : \-clk0\ <= \-tpclk\ and machrun;
              \-mclk0\ <= hi1 and \-tpclk\;
end architecture;
