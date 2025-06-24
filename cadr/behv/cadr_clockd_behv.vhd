-- CLOCKD -- CLOCK DISTRIBUTION

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_clockd is
begin
clockd_1b18 : dip_74s37 port map (p1 => \-clk1\, p2 => hi12, p3 => clk1a, p4 => reset, p5 => hi12, p6 => \-reset\, p8 => mclk1a, p9 => hi12, p10 => \-mclk1\, p11 => open, p12 => '0', p13 => '0');
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
clockd_2c03 : dip_74s37 port map (p1 => \-clk2a\, p2 => hi7, p3 => clk2a, p4 => \-clk2a\, p5 => hi7, p6 => clk2b, p8 => clk2c, p9 => hi7, p10 => \-clk2c\, p11 => open, p12 => '0', p13 => '0');
clockd_3c11 : dip_74s37 port map (p1 => \-clk3a\, p2 => hi5, p3 => clk3a, p4 => \-clk3a\, p5 => hi5, p6 => clk3b, p8 => clk3c, p9 => hi5, p10 => \-clk3a\, p11 => open, p12 => '0', p13 => '0');
clockd_3c12 : \-clk3g\ <= not clk3;
              \-clk3d\ <= not clk3;
              \-clk3a\ <= not clk3;
              wp3a <= not \-wp3\;
              tse3a <= not \-tse3\;
clockd_3c13 : dip_74s37 port map (p1 => \-clk3d\, p2 => hi5, p3 => clk3d, p4 => \-clk3d\, p5 => hi5, p6 => clk3e, p8 => clk3f, p9 => hi5, p10 => \-clk3d\, p11 => open, p12 => '0', p13 => '0');
clockd_4c02 : dip_74s37 port map (p1 => \-clk4a\, p2 => hi5, p3 => clk4a, p4 => \-clk4a\, p5 => hi5, p6 => clk4b, p8 => clk4c, p9 => hi5, p10 => \-clk4a\, p11 => open, p12 => '0', p13 => '0');
clockd_4c06 : \-clk4e\ <= not clk4;
              \-clk4d\ <= not clk4;
              \-clk4a\ <= not clk4;
              wp4c <= not \-wp4\;
              wp4b <= not \-wp4\;
              wp4a <= not \-wp4\;
clockd_4c07 : dip_74s37 port map (p1 => \-clk4d\, p2 => hi2, p3 => clk4d, p4 => \-clk4d\, p5 => hi2, p6 => clk4e, p8 => clk4f, p9 => hi2, p10 => \-clk4d\, p11 => open, p12 => '0', p13 => '0');
clockd_4d03 : tse4b <= not \-tse4\;
              tse4a <= not \-tse4\;
              srcpdlptr <= not \-srcpdlptr\;
              srcpdlidx <= not \-srcpdlidx\;
end architecture;
