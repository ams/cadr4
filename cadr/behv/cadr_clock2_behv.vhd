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
clock2_1c01 : clk4  <= \-clk0\ nor gnd;
              mclk7 <= \-mclk0\ nor gnd;
clock2_1c02 : \-wp1\ <= tpwp nor gnd;
              \-wp2\ <= tpwp nor gnd;
              \-wp3\ <= gnd nor tpwp, 
              \-wp4\ <= gnd nor tpwp;
clock2_1c06 : \-tpclk\ <= not (\-tprend\ and tpclk and \-clock reset b\);
              tptse <= not (\-tptse\ and \-tpr25\ and \-clock reset b\);
              net_0 <= not (\-clock reset b\ and \-tpw70\ and net_1);
clock2_1c07 : tpclk    <= \-tpr0\ nand \-tpclk\;
              \-tptse\ <= \-tpr5\ nand tptse;
              net_1    <= net_0 nand \-tpw30\;
clock2_1c10 : tpwp <= net_0 nor \-machruna\;
              tpwpiram <= \-machruna\ nor net_2;
clock2_1c11 : \-wp5\ <= tpwpiram nor gnd;
              clk5   <= \-clk0\ nor gnd;
              mclk5  <= gnd nor \-mclk0\;
clock2_1c13 : net_3 <= not (\-tprend\ and net_2 and net_2);
              net_2 <= not (\-tpw45\ and \-clock reset b\ and net_3);
clock2_1d04 : \-tse1\ <= tptse nor gnd;
              \-tse2\ <= tptse nor gnd;
              \-tse3\ <= gnd nor tptse; 
              \-tse4\ <= gnd nor tptse;
clock2_1d05 : clk1 <= \-clk0\ nor gnd;
              clk2 <= \-clk0\ nor gnd;
              clk3 <= gnd nor \-clk0\;
              mclk1 <= gnd nor \-mclk0\;
clock2_1d10 : \-clk0\ <= \-tpclk\ and machrun;
              \-mclk0\ <= hi1 and \-tpclk\;
end architecture;
