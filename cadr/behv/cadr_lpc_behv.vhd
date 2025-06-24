-- LPC -- LAST PC

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_lpc is
signal net_0 : std_logic;
begin
lpc_4d01 : dip_74s241 port map (p1 => gnd, p2 => pc8, p3 => open, p4 => pc9, p5 => open, p6 => pc10, p7 => pc13b, p8 => pc11, p9 => pc12b, p11 => pc12, p12 => pc11b, p13 => pc13, p14 => pc10b, p15 => '0', p16 => pc9b, p17 => '0', p18 => pc8b, p19 => hi5);
lpc_4d02 : dip_74s241 port map (p1 => gnd, p2 => pc0, p3 => pc7b, p4 => pc1, p5 => pc6b, p6 => pc2, p7 => pc5b, p8 => pc3, p9 => pc4b, p11 => pc4, p12 => pc3b, p13 => pc5, p14 => pc2b, p15 => pc6, p16 => pc1b, p17 => pc7, p18 => pc0b, p19 => hi5);
lpc_4d06 : dip_74s08 port map (p1 => irdisp, p2 => ir25, p3 => net_0, p4 => '0', p5 => '0', p6 => open, p8 => open, p9 => '0', p10 => '0', p11 => open, p12 => '0', p13 => '0');
lpc_4e06 : dip_74s157 port map (p1 => net_0, p2 => pc12, p3 => lpc12, p4 => wpc12, p5 => pc13, p6 => lpc13, p7 => wpc13, p9 => open, p10 => '0', p11 => '0', p12 => open, p13 => '0', p14 => '0', p15 => gnd);
lpc_4e07 : dip_74s157 port map (p1 => net_0, p2 => pc8, p3 => lpc8, p4 => wpc8, p5 => pc9, p6 => lpc9, p7 => wpc9, p9 => wpc10, p10 => lpc10, p11 => pc10, p12 => wpc11, p13 => lpc11, p14 => pc11, p15 => gnd);
lpc_4e08 : dip_74s157 port map (p1 => net_0, p2 => pc4, p3 => lpc4, p4 => wpc4, p5 => pc5, p6 => lpc5, p7 => wpc5, p9 => wpc6, p10 => lpc6, p11 => pc6, p12 => wpc7, p13 => lpc7, p14 => pc7, p15 => gnd);
lpc_4e09 : dip_74s157 port map (p1 => net_0, p2 => pc0, p3 => lpc0, p4 => wpc0, p5 => pc1, p6 => lpc1, p7 => wpc1, p9 => wpc2, p10 => lpc2, p11 => pc2, p12 => wpc3, p13 => lpc3, p14 => pc3, p15 => gnd);
lpc_4f06 : dip_25s07 port map (p1 => \lpc.hold\, p2 => lpc5, p3 => pc5, p4 => pc4, p5 => lpc4, p6 => pc3, p7 => lpc3, p9 => clk4b, p10 => lpc2, p11 => pc2, p12 => lpc1, p13 => pc1, p14 => pc0, p15 => lpc0);
lpc_4f07 : dip_25s07 port map (p1 => \lpc.hold\, p2 => lpc11, p3 => pc11, p4 => pc10, p5 => lpc10, p6 => pc9, p7 => lpc9, p9 => clk4b, p10 => lpc8, p11 => pc8, p12 => lpc7, p13 => pc7, p14 => pc6, p15 => lpc6);
lpc_4f08 : dip_25s07 port map (p1 => \lpc.hold\, p2 => open, p3 => '0', p4 => '0', p5 => open, p6 => '0', p7 => open, p9 => clk4b, p10 => open, p11 => '0', p12 => lpc13, p13 => pc13, p14 => pc12, p15 => lpc12);
end architecture;
