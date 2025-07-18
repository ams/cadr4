-- VCTL1 -- VMEMORY CONTROL

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_vctl1 is
signal net_0 : std_logic;
signal net_1 : std_logic;
begin
vctl1_1c23 : dip_74s175 port map (p1 => \-reset\, p2 => open, p3 => open, p4 => '0', p5 => net_1, p6 => rdcyc, p7 => wrcyc, p9 => clk2a, p10 => open, p11 => open, p12 => '0', p13 => wmap, p14 => \-wmapd\, p15 => wmapd);
vctl1_1d16 : dip_74s51 port map (p1 => rdcyc, p2 => '0', p3 => '0', p4 => '0', p5 => '0', p6 => open, p8 => net_1, p9 => memprepare, p10 => \-memwr\, p13 => \-memprepare\);
vctl1_1d17 : \-pfw\   <= \-lvmo22\ nand wrcyc;
             \-vmaok\ <= \-pfr\ nand \-pfw\;
vctl1_1d21 : dip_74s74 port map (p1 => \-mfinishd\, p2 => memrq, p3 => mclk1a, p4 => hi11, p5 => mbusy, p6 => open, p8 => open, p9 => \rd.in.progress\, p10 => hi11, p11 => mclk1a, p12 => \set.rd.in.progress\, p13 => \-rdfinish\);
vctl1_1d22 : dip_td250 port map (p1 => net_0, p4 => \-rdfinish\, p6 => open, p8 => open, p10 => open, p12 => open);
vctl1_1d23 : dip_td50 port map (p1 => \-mfinish\, p4 => open, p6 => net_0, p8 => open, p10 => \-mfinishd\, p12 => open);
vctl1_1d27 : memprepare <= clk2c nor \-memop\;
vctl1_1d28 : \-mfinish\ <= \-reset\ and \-memack\;
vctl1_1e16 : \-memop\ <= \-memrd\ and  \-memwr\ and \-ifetch\;
vctl1_1e20 : dip_74s175 port map (p1 => \-reset\, p2 => memstart, p3 => \-memstart\, p4 => memprepare, p5 => memrq, p6 => \-mbusy.sync\, p7 => \mbusy.sync\, p9 => mclk1a, p10 => open, p11 => open, p12 => '0', p13 => '0', p14 => open, p15 => open);
vctl1_1e25 : dip_9s42_1 port map (p1 => mbusy, p2 => hi11, p3 => memstart, p4 => \-pfr\, p5 => \-pfw\, p6 => hi11, p7 => memrq, p9 => \set.rd.in.progress\, p10 => hi11, p11 => rdcyc, p12 => \-pfr\, p13 => memstart, p14 => hi11, p15 => \rd.in.progress\);
vctl1_3f16 : dip_74s64 port map (p1 => hi4, p2 => \mbusy.sync\, p3 => destmem, p4 => \-memgrant\, p5 => mbusy, p6 => \use.md\, p8 => \-wait\, p9 => gnd, p10 => gnd, p11 => \mbusy.sync\, p12 => needfetch, p13 => lcinc);
vctl1_3f17 : \-hang\ <= not (\rd.in.progress\ and \use.md\ and \-clk3g\);
end architecture;
