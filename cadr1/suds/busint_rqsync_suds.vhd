-- RQSYNC -- REQUEST SYNCHRONIZER

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_rqsync is
signal net_00 : std_logic;
signal net_01 : std_logic;
signal net_02 : std_logic;
signal net_03 : std_logic;
signal net_04 : std_logic;
signal net_05 : std_logic;
signal net_06 : std_logic;
begin
rqsync_0a04 : dip_74s00 port map (p1 => net_04, p2 => net_05, p3 => \-free\, p4 => clk0, p5 => free, p6 => net_02, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
rqsync_0a05 : dip_74s02 port map (p1 => \xbus extgrant out\, p2 => \-xrqs\, p3 => \-free\, p4 => net_04, p5 => \int busy\, p6 => \xbus busy in\, p8 => 'Z', p9 => 'Z', p10 => open, p11 => 'Z', p12 => 'Z', p13 => open);
rqsync_0a06 : dip_74s175 port map (p1 => \-grant reset\, p2 => \ubx grant\, p3 => \-ubx grant\, p4 => \ubx grant set\, p5 => \lmub grant set\, p6 => \-lmub grant\, p7 => \lmub grant\, p9 => net_02, p10 => \lmx grant\, p11 => \-lmx grant\, p12 => \lmx grant set\, p13 => 'Z', p14 => open, p15 => open);
rqsync_0a07 : dip_74s260 port map (p1 => \-lmubrqs\, p2 => xrqs, p3 => ubxrqs, p4 => \-lmxrq\, p5 => \lmub grant set\, p6 => \lmx grant set\, p8 => lmubrqs, p9 => \-free\, p10 => ubxrqs, p11 => xrqs, p12 => \-free\, p13 => gnd);
rqsync_0a08 : dip_74s175 port map (p1 => \-grant reset\, p2 => xrqs, p3 => \-xrqs\, p4 => \xbus extrq in\, p5 => lmubrq, p6 => \-lmubrqs\, p7 => lmubrqs, p9 => \-clk\, p10 => ubxrqs, p11 => \-ubxrqs\, p12 => ubxrq, p13 => 'Z', p14 => open, p15 => open);
rqsync_0b05 : dip_74s11 port map (p1 => net_03, p2 => \-xbus request\, p3 => 'Z', p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => 'Z', p12 => net_00, p13 => \-loadmd ack\);
rqsync_0b06 : dip_td100 port map (p1 => \int busy\, p4 => \int busy t40\, p6 => \int busy t80\, p8 => \int busy t100\, p10 => \int busy t60\, p12 => \int busy t20\);
rqsync_0b07 : dip_74s04 port map (p1 => \-free\, p2 => free, p3 => \int busy t80\, p4 => \-int busy t80\, p5 => \-lmx grant\, p6 => \lmx grant a\, p8 => \ubx grant a\, p9 => \-ubx grant\, p10 => open, p11 => 'Z', p12 => open, p13 => 'Z');
rqsync_0b08 : dip_74s74 port map (p1 => 'Z', p2 => 'Z', p3 => 'Z', p4 => 'Z', p5 => open, p6 => open, p8 => open, p9 => net_05, p10 => \hi 1-14\, p11 => \-clk\, p12 => net_04, p13 => net_06);
rqsync_0b14 : dip_74s74 port map (p1 => 'Z', p2 => 'Z', p3 => 'Z', p4 => 'Z', p5 => open, p6 => open, p8 => \-grant reset\, p9 => \grant reset\, p10 => \-hung timeout\, p11 => net_01, p12 => \hi 15-30\, p13 => \int busy t40\);
rqsync_0c07 : dip_mtd100 port map (p1 => 'Z', p3 => net_00, p5 => 'Z', p8 => open, p10 => net_01, p12 => open);
rqsync_0c12 : dip_74s260 port map (p1 => 'Z', p2 => 'Z', p3 => 'Z', p4 => \-ubxrqs\, p5 => open, p6 => \ubx grant set\, p8 => gnd, p9 => gnd, p10 => \-free\, p11 => xrqs, p12 => 'Z', p13 => 'Z');
rqsync_0c13 : dip_74s10 port map (p1 => 'Z', p2 => 'Z', p3 => 'Z', p4 => 'Z', p5 => 'Z', p6 => open, p8 => \int busy\, p9 => \-ubx grant\, p10 => \-lmx grant\, p11 => \-lmub grant\, p12 => open, p13 => 'Z');
rqsync_0d05 : dip_74s00 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => lmubrq, p5 => \lmub grant\, p6 => net_03, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
end architecture;
