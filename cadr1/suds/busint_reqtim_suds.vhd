-- REQTIM -- XBUS & UNIBUS TIMEOUT

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_reqtim is
signal net_00 : std_logic;
signal net_01 : std_logic;
signal net_02 : std_logic;
signal net_03 : std_logic;
signal net_04 : std_logic;
signal net_05 : std_logic;
signal net_06 : std_logic;
signal net_07 : std_logic;
begin
reqtim_0a01 : dip_74ls124 port map (p2 => 'Z', p3 => 'Z', p4 => \vco cap1\, p5 => \vco cap2\, p6 => net_07, p7 => net_06);
reqtim_0a02 : dip_74s288 port map (p1 => \timeout 0\, p2 => \timeout 1\, p3 => \timeout 2\, p4 => \timeout 3\, p5 => \prom nxm timeout\, p6 => \prom hung timeout\, p7 => \prom unused\, p9 => open, p10 => net_05, p11 => net_04, p12 => net_03, p13 => net_02, p14 => net_01, p15 => gnd);
reqtim_0b01 : dip_74ls273 port map (p1 => net_00, p2 => \unused timeout\, p3 => \prom unused\, p4 => \prom hung timeout\, p5 => \hung timeout\, p6 => \nxm timeout\, p7 => \prom nxm timeout\, p8 => \select debug\, p9 => net_01, p11 => net_06, p12 => net_02, p13 => \timeout 3\, p14 => \timeout 2\, p15 => net_03, p16 => net_04, p17 => \timeout 1\, p18 => \timeout 0\, p19 => net_05);
reqtim_0b03 : dip_74s04 port map (p1 => 'Z', p2 => open, p3 => 'Z', p4 => open, p5 => \nxm timeout\, p6 => \-nxm timeout\, p8 => net_07, p9 => \int busy\, p10 => \-hung timeout\, p11 => \hung timeout\, p12 => open, p13 => 'Z');
reqtim_0b04 : dip_dummy4_reqtim_b03 port map (p2 => \vco cap2\, p3 => \vco cap1\);
reqtim_0b16 : dip_74s08 port map (p1 => \int busy\, p2 => \-debug timeout inh\, p3 => net_00, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
end architecture;
