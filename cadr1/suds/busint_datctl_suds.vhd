-- DATCTL -- DATA PATH CONTROL

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_datctl is
signal net_00 : std_logic;
signal net_01 : std_logic;
signal net_02 : std_logic;
begin
datctl_0a05 : dip_74s02 port map (p1 => open, p2 => 'Z', p3 => 'Z', p4 => open, p5 => 'Z', p6 => 'Z', p8 => 'Z', p9 => 'Z', p10 => open, p11 => \write through\, p12 => \-ubwr\, p13 => net_01);
datctl_0b13 : dip_74s04 port map (p1 => 'Z', p2 => open, p3 => 'Z', p4 => open, p5 => net_02, p6 => \write data > ub\, p8 => open, p9 => 'Z', p10 => open, p11 => 'Z', p12 => open, p13 => 'Z');
datctl_0b17 : dip_74s02 port map (p1 => \-xaddrdrive\, p2 => \lmx grant\, p3 => \ubx grant\, p4 => \-ubadrive\, p5 => \lmub master\, p6 => \dbub master\, p8 => 'Z', p9 => 'Z', p10 => open, p11 => 'Z', p12 => 'Z', p13 => open);
datctl_0b18 : dip_74s32 port map (p1 => \ubx grant\, p2 => lmrd, p3 => \bus > lm\, p4 => \ub reg cyc t150\, p5 => \-ub write buffer\, p6 => \-wbufwe\, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
datctl_0b19 : dip_74s04 port map (p1 => \int busy\, p2 => \-lmbus enb\, p3 => \lmx grant\, p4 => \-lmadr>xbus\, p5 => \ubx grant\, p6 => \-ubaddr>xbus\, p8 => \-lmadr>ub\, p9 => \lmub master\, p10 => xwr, p11 => \-xdrive\, p12 => open, p13 => 'Z');
datctl_0b20 : dip_74s00 port map (p1 => \ubx grant\, p2 => net_01, p3 => \-ub32>bus\, p4 => \-write through\, p5 => \-write through\, p6 => \write through\, p8 => \-ubmap > udo\, p9 => ubrd, p10 => \select page\, p11 => \-udi > udo\, p12 => net_00, p13 => \-ubdrive\);
datctl_0c08 : dip_74s04 port map (p1 => wrcyc, p2 => \-lmwr\, p3 => lmrd, p4 => \-lmrd\, p5 => \c1 in\, p6 => \-ubwr\, p8 => \-ubwr a\, p9 => \c1 in\, p10 => \-ubrd\, p11 => \ubrd a\, p12 => open, p13 => 'Z');
datctl_0c13 : dip_74s10 port map (p1 => ubwr, p2 => \select page\, p3 => \-dbub master\, p4 => \-select spy\, p5 => \-select debug\, p6 => net_00, p8 => open, p9 => 'Z', p10 => 'Z', p11 => 'Z', p12 => \-ubmapwe\, p13 => \ub reg write pulse\);
datctl_0c14 : dip_74s51 port map (p1 => 'Z', p2 => \dbub master\, p3 => \debug in wr\, p4 => \lmub grant\, p5 => lmwr, p6 => net_02, p8 => open, p9 => 'Z', p10 => 'Z', p13 => 'Z');
datctl_0c15 : dip_74s64 port map (p1 => \hi 1-14\, p2 => \ubrd a\, p3 => \ub reg cyc t0\, p4 => \hi 1-14\, p5 => \hi 1-14\, p6 => \write data > ub\, p8 => \-ubdrive\, p9 => \ubrd a\, p10 => \select debug\, p11 => \ubrd a\, p12 => \ub17-14=map\, p13 => \msyn in\);
datctl_0c17 : dip_74s51 port map (p1 => lmrd, p2 => \ubx grant a\, p3 => ubwr, p4 => \lmx grant\, p5 => lmwr, p6 => \-xdrive\, p8 => \-ub16>bus\, p9 => ubwr, p10 => \write through\, p13 => \lmub grant\);
datctl_0c18 : dip_74s51 port map (p1 => lmrd, p2 => \ubx grant a\, p3 => \ubrd a\, p4 => \lmub grant\, p5 => lmwr, p6 => \-bus>ub\, p8 => \-xb>bus\, p9 => \ubx grant a\, p10 => \ubrd a\, p13 => \lmx grant a\);
end architecture;
