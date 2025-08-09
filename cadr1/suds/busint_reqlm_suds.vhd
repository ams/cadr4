-- REQLM -- XBUS REQ & ACK

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_reqlm is
signal net_00 : std_logic;
signal net_01 : std_logic;
signal net_02 : std_logic;
signal net_03 : std_logic;
signal net_04 : std_logic;
signal net_05 : std_logic;
signal net_06 : std_logic;
signal net_07 : std_logic;
begin
reqlm_0a04 : dip_74s00 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => net_07, p12 => net_04, p13 => net_04);
reqlm_0a05 : dip_74s02 port map (p1 => open, p2 => 'Z', p3 => 'Z', p4 => open, p5 => 'Z', p6 => 'Z', p8 => \-lm ub master\, p9 => \-lmub grant\, p10 => net_00, p11 => 'Z', p12 => 'Z', p13 => open);
reqlm_0a11 : dip_74s00 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => \-loadmd ack\, p12 => \int busy t100\, p13 => \ub md load\);
reqlm_0a13 : dip_74s04 port map (p1 => 'Z', p2 => open, p3 => 'Z', p4 => open, p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => open, p11 => 'Z', p12 => \loadmd ack\, p13 => \-loadmd ack\);
reqlm_0b11 : dip_74s51 port map (p1 => 'Z', p2 => \lmx grant a\, p3 => xack, p4 => \lmub grant\, p5 => \ssyn t150\, p6 => \-lmack\, p8 => open, p9 => 'Z', p10 => 'Z', p13 => 'Z');
reqlm_0b12 : dip_74s02 port map (p1 => \-lm ignpar\, p2 => \xbus ignpar in\, p3 => \lmub grant\, p4 => \-lm grant\, p5 => net_00, p6 => \lmx grant\, p8 => 'Z', p9 => 'Z', p10 => open, p11 => 'Z', p12 => 'Z', p13 => open);
reqlm_0b13 : dip_74s04 port map (p1 => 'Z', p2 => open, p3 => 'Z', p4 => open, p5 => 'Z', p6 => open, p8 => lmxrq, p9 => \-lmxrq\, p10 => open, p11 => 'Z', p12 => \lm memdrive enb\, p13 => \ubx grant\);
reqlm_0b14 : dip_74s74 port map (p1 => net_07, p2 => net_07, p3 => \int busy t80\, p4 => \hi 1-14\, p5 => \xbus request\, p6 => \-xbus request\, p8 => open, p9 => open, p10 => 'Z', p11 => 'Z', p12 => 'Z', p13 => 'Z');
reqlm_0b17 : dip_74s02 port map (p1 => open, p2 => 'Z', p3 => 'Z', p4 => open, p5 => 'Z', p6 => 'Z', p8 => \-memrq\, p9 => net_02, p10 => \lmneedub (early)\, p11 => \-ub to md\, p12 => \-ubx grant\, p13 => \ub md load\);
reqlm_0b18 : dip_74s32 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => \-lmxrq\, p9 => \-memrq\, p10 => net_01, p11 => open, p12 => 'Z', p13 => 'Z');
reqlm_0b19 : dip_74s04 port map (p1 => 'Z', p2 => open, p3 => 'Z', p4 => open, p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => open, p11 => 'Z', p12 => net_02, p13 => \adr=unibus\);
reqlm_0c08 : dip_74s04 port map (p1 => 'Z', p2 => open, p3 => 'Z', p4 => open, p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => open, p11 => 'Z', p12 => xack, p13 => \-xack\);
reqlm_0c09 : dip_td100 port map (p1 => \xbus ack in\, p4 => open, p6 => open, p8 => open, p10 => net_03, p12 => open);
reqlm_0c10 : dip_74s64 port map (p1 => \xbus request\, p2 => \-loadmd ack\, p3 => \ub md load\, p4 => \unibus request\, p5 => lmrd, p6 => \lmub grant\, p8 => \-loadmd\, p9 => 'Z', p10 => gnd, p11 => \-xack\, p12 => lmrd, p13 => \lmx grant a\);
reqlm_0c11 : dip_74s64 port map (p1 => 'Z', p2 => \xbus ack in\, p3 => xwr, p4 => net_03, p5 => xrd, p6 => \xbus ack in\, p8 => \-xack\, p9 => \nxm timeout\, p10 => \xbus request\, p11 => 'Z', p12 => 'Z', p13 => gnd);
reqlm_0c12 : dip_74s260 port map (p1 => \-adr21\, p2 => \-adr20\, p3 => \-adr19\, p4 => 'Z', p5 => \adr=unibus\, p6 => open, p8 => 'Z', p9 => 'Z', p10 => 'Z', p11 => 'Z', p12 => \-adr18\, p13 => \-adr17\);
reqlm_0c14 : dip_74s51 port map (p1 => net_05, p2 => 'Z', p3 => 'Z', p4 => 'Z', p5 => 'Z', p6 => open, p8 => net_04, p9 => lmxrq, p10 => \lmx grant a\, p13 => net_06);
reqlm_0e09 : dip_74s08 port map (p1 => ubxrq, p2 => \lmx grant a\, p3 => net_06, p4 => \-ub to md\, p5 => \msyn in\, p6 => net_05, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
end architecture;
