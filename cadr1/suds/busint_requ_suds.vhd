-- REQU -- XBUS REQUEST FROM UNIBUS

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_requ is
signal net_00 : std_logic;
signal net_01 : std_logic;
signal net_02 : std_logic;
signal net_03 : std_logic;
signal net_04 : std_logic;
signal net_05 : std_logic;
signal net_06 : std_logic;
signal net_07 : std_logic;
signal net_08 : std_logic;
signal net_09 : std_logic;
signal net_10 : std_logic;
signal net_11 : std_logic;
signal net_12 : std_logic;
signal net_13 : std_logic;
begin
requ_0a04 : dip_74s00 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => net_00, p9 => \ub reg cyc t250\, p10 => \-write through\, p11 => open, p12 => 'Z', p13 => 'Z');
requ_0b03 : dip_74s04 port map (p1 => 'Z', p2 => open, p3 => 'Z', p4 => open, p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => open, p11 => 'Z', p12 => net_01, p13 => net_00);
requ_0c05 : dip_74s20 port map (p1 => net_06, p2 => \msyn in\, p4 => \ub xbus t0\, p5 => \ub xbus t100\, p6 => \-ubxrq\, p8 => open, p9 => 'Z', p10 => 'Z', p12 => 'Z', p13 => 'Z');
requ_0c07 : dip_mtd100 port map (p1 => 'Z', p3 => 'Z', p5 => \ub xbus t0\, p8 => \ub xbus t100\, p10 => open, p12 => open);
requ_0d03 : dip_74ls74 port map (p1 => 'Z', p2 => 'Z', p3 => 'Z', p4 => 'Z', p5 => open, p6 => open, p8 => open, p9 => net_13, p10 => \hi 1-14\, p11 => net_02, p12 => \hi 1-14\, p13 => net_08);
requ_0d12 : dip_74s133 port map (p1 => ubma21, p2 => ubma20, p3 => ubma19, p4 => ubma18, p5 => ubma17, p6 => ubxrq, p7 => ubwr, p9 => \-ub to md\, p10 => \msyn in\, p11 => \hi 15-30\, p12 => \hi 15-30\, p13 => \hi 15-30\, p14 => \hi 15-30\, p15 => \hi 15-30\);
requ_0e02 : dip_74s08 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => \-ub invalid\, p12 => mapvalid, p13 => net_07);
requ_0e04 : dip_74s32 port map (p1 => \-ubwr\, p2 => writeok, p3 => net_07, p4 => net_13, p5 => \intr ssyn\, p6 => \ssyn out\, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
requ_0e05 : dip_74s04 port map (p1 => 'Z', p2 => open, p3 => 'Z', p4 => open, p5 => \-ubxrq\, p6 => ubxrq, p8 => net_02, p9 => net_03, p10 => open, p11 => 'Z', p12 => open, p13 => 'Z');
requ_0e06 : dip_74s260 port map (p1 => net_05, p2 => net_04, p3 => \loadmd ack\, p4 => 'Z', p5 => net_03, p6 => open, p8 => 'Z', p9 => 'Z', p10 => 'Z', p11 => 'Z', p12 => \debug ssyn\, p13 => net_01);
requ_0f01 : dip_td100 port map (p1 => \-uback\, p4 => open, p6 => open, p8 => net_11, p10 => net_09, p12 => open);
requ_0f02 : dip_74s02 port map (p1 => open, p2 => 'Z', p3 => 'Z', p4 => net_12, p5 => \-uback\, p6 => \-ub read xbus\, p8 => \-ub read xbus\, p9 => net_11, p10 => net_05, p11 => \-uback\, p12 => \-ub write xbus\, p13 => net_04);
requ_0f03 : dip_74s00 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => \ubx grant a\, p5 => xack, p6 => \-uback\, p8 => \-rbufwe\, p9 => net_10, p10 => net_12, p11 => \ub xbus t0\, p12 => \-ub write xbus\, p13 => \-ub read xbus\);
end architecture;
