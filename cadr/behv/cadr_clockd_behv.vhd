-- CLOCKD -- CLOCK DISTRIBUTION

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_clockd is
begin
clockd_1b18 : clk1a <= not (\-clk1\  and hi12);
              \-reset\  <= not (reset and hi12);
              mclk1a <= not (hi12 and \-mclk1\); 
clockd_1b19 : \-mclk1\ <= not mclk1;
              \-clk1\ <= not clk1;
              wp1b <= not \-wp1\;
              wp1a <= not \-wp1\;
              tse1b <= not \-tse1\;
              tse1a <= not \-tse1\;
clockd_1f05 : dip_74s133 port map (p1 => hi1, p2 => hi2, p3 => hi3, p4 => hi4, p5 => hi5, p6 => hi6, p7 => hi7, p9 => \-upperhighok\, p10 => hi8, p11 => hi9, p12 => hi10, p13 => hi11, p14 => hi12, p15 => hi11);
clockd_2c02 : \-lcry3\ <= not lcry3;
              \-clk2c\ <= not clk2;
              \-clk2a\ <= not clk2;
              wp2 <= not \-wp2\;
              tse2 <= not \-tse2\;
clockd_2c03 : clk2a <= not (\-clk2a\  and hi7);
              clk2b <= not (\-clk2a\  and hi7);
              clk2c <= not (hi7 and \-clk2c\);
clockd_3c11 : clk3a <= not (\-clk3a\  and hi5);
              clk3b <= not (\-clk3a\  and hi5);
              clk3c <= not (hi5 and \-clk3a\);
clockd_3c12 : \-clk3g\ <= not clk3;
              \-clk3d\ <= not clk3;
              \-clk3a\ <= not clk3;
              wp3a <= not \-wp3\;
              tse3a <= not \-tse3\;
clockd_3c13 : clk3d <= not (\-clk3d\  and hi5);
              clk3e <= not (\-clk3d\  and hi5);
              clk3f <= not (hi5 and \-clk3d\);
clockd_4c02 : clk4a <= not (\-clk4a\  and hi5);
              clk4b <= not (\-clk4a\  and hi5);
              clk4c <= not (hi5 and \-clk4a\);
clockd_4c06 : \-clk4e\ <= not clk4;
              \-clk4d\ <= not clk4;
              \-clk4a\ <= not clk4;
              wp4c <= not \-wp4\;
              wp4b <= not \-wp4\;
              wp4a <= not \-wp4\;
clockd_4c07 : clk4d <= not (\-clk4d\  and hi2);
              clk4e <= not (\-clk4d\  and hi2);
              clk4f <= not (hi2 and \-clk4d\);
clockd_4d03 : tse4b <= not \-tse4\;
              tse4a <= not \-tse4\;
              srcpdlptr <= not \-srcpdlptr\;
              srcpdlidx <= not \-srcpdlidx\;
end architecture;
