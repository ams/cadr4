-- CLOCKD -- CLOCK DISTRIBUTION

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_clockd is
begin
clockd_1b18 : dip_74s37 port map (p1 => \-clk1\, p2 => hi12, p3 => clk1a, p4 => reset, p5 => hi12, p6 => \-reset\, p8 => mclk1a, p9 => hi12, p10 => \-mclk1\, p11 => open, p12 => '0', p13 => '0');
clockd_1b19 : dip_74s04a port map (p1 => mclk1, p2 => \-mclk1\, p3 => clk1, p4 => \-clk1\, p5 => \-wp1\, p6 => wp1b, p8 => wp1a, p9 => \-wp1\, p10 => tse1b, p11 => \-tse1\, p12 => tse1a, p13 => \-tse1\);
clockd_1f05 : dip_74s133 port map (p1 => hi1, p2 => hi2, p3 => hi3, p4 => hi4, p5 => hi5, p6 => hi6, p7 => hi7, p9 => \-upperhighok\, p10 => hi8, p11 => hi9, p12 => hi10, p13 => hi11, p14 => hi12, p15 => hi11);
clockd_2c02 : dip_74s04a port map (p1 => lcry3, p2 => \-lcry3\, p3 => '0', p4 => open, p5 => clk2, p6 => \-clk2c\, p8 => \-clk2a\, p9 => clk2, p10 => wp2, p11 => \-wp2\, p12 => tse2, p13 => \-tse2\);
clockd_2c03 : dip_74s37 port map (p1 => \-clk2a\, p2 => hi7, p3 => clk2a, p4 => \-clk2a\, p5 => hi7, p6 => clk2b, p8 => clk2c, p9 => hi7, p10 => \-clk2c\, p11 => open, p12 => '0', p13 => '0');
clockd_3c11 : dip_74s37 port map (p1 => \-clk3a\, p2 => hi5, p3 => clk3a, p4 => \-clk3a\, p5 => hi5, p6 => clk3b, p8 => clk3c, p9 => hi5, p10 => \-clk3a\, p11 => open, p12 => '0', p13 => '0');
clockd_3c12 : dip_74s04a port map (p1 => '0', p2 => open, p3 => clk3, p4 => \-clk3g\, p5 => clk3, p6 => \-clk3d\, p8 => \-clk3a\, p9 => clk3, p10 => wp3a, p11 => \-wp3\, p12 => tse3a, p13 => \-tse3\);
clockd_3c13 : dip_74s37 port map (p1 => \-clk3d\, p2 => hi5, p3 => clk3d, p4 => \-clk3d\, p5 => hi5, p6 => clk3e, p8 => clk3f, p9 => hi5, p10 => \-clk3d\, p11 => open, p12 => '0', p13 => '0');
clockd_4c02 : dip_74s37 port map (p1 => \-clk4a\, p2 => hi5, p3 => clk4a, p4 => \-clk4a\, p5 => hi5, p6 => clk4b, p8 => clk4c, p9 => hi5, p10 => \-clk4a\, p11 => open, p12 => '0', p13 => '0');
clockd_4c06 : dip_74s04a port map (p1 => clk4, p2 => \-clk4e\, p3 => clk4, p4 => \-clk4d\, p5 => clk4, p6 => \-clk4a\, p8 => wp4c, p9 => \-wp4\, p10 => wp4b, p11 => \-wp4\, p12 => wp4a, p13 => \-wp4\);
clockd_4c07 : dip_74s37 port map (p1 => \-clk4d\, p2 => hi2, p3 => clk4d, p4 => \-clk4d\, p5 => hi2, p6 => clk4e, p8 => clk4f, p9 => hi2, p10 => \-clk4d\, p11 => open, p12 => '0', p13 => '0');
clockd_4d03 : dip_74s04a port map (p1 => '0', p2 => open, p3 => '0', p4 => open, p5 => \-tse4\, p6 => tse4b, p8 => tse4a, p9 => \-tse4\, p10 => srcpdlptr, p11 => \-srcpdlptr\, p12 => srcpdlidx, p13 => \-srcpdlidx\);
end architecture;
