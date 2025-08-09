-- UBCYC -- UNIBUS SLAVE RESPONSE

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_ubcyc is
signal net_00 : std_logic;
signal net_01 : std_logic;
signal net_02 : std_logic;
signal net_03 : std_logic;
begin
ubcyc_0b08 : dip_74s74 port map (p1 => \hi 1-14\, p2 => udi7, p3 => \-reset err\, p4 => \hi 1-14\, p5 => \write through enb\, p6 => \-write through enb\, p8 => open, p9 => open, p10 => 'Z', p11 => 'Z', p12 => 'Z', p13 => 'Z');
ubcyc_0b18 : dip_74s32 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => \-write through\, p12 => \-ub write buffer\, p13 => net_00);
ubcyc_0c04 : dip_74s11 port map (p1 => 'Z', p2 => 'Z', p3 => \-write through\, p4 => \-ub wr xbus\, p5 => \hi 1-14\, p6 => \-ub write xbus\, p8 => open, p9 => 'Z', p10 => 'Z', p11 => 'Z', p12 => open, p13 => 'Z');
ubcyc_0e02 : dip_74s08 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => \ub reg write pulse\, p9 => \-ub reg cyc t150\, p10 => \ub reg cyc t50\, p11 => open, p12 => 'Z', p13 => 'Z');
ubcyc_0e03 : dip_74s138 port map (p1 => uba1, p2 => uba2, p3 => ubwr, p4 => net_03, p5 => \-select interrupt\, p6 => \hi 1-14\, p7 => open, p9 => \-reset err\, p10 => \-load int ctl2 reg\, p11 => \-load int ctl reg\, p12 => open, p13 => \-ub err drive\, p14 => open, p15 => \-intc drive\);
ubcyc_0e04 : dip_74s32 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => net_00, p12 => \-ubpn3a\, p13 => \-write through enb\);
ubcyc_0e05 : dip_74s04 port map (p1 => \-select page\, p2 => \select page\, p3 => \ub reg cyc t150\, p4 => \-ub reg cyc t150\, p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => open, p11 => 'Z', p12 => open, p13 => 'Z');
ubcyc_0e06 : dip_74s260 port map (p1 => 'Z', p2 => 'Z', p3 => 'Z', p4 => uba17, p5 => open, p6 => \ub17-14=map\, p8 => \-uba14\, p9 => gnd, p10 => \-uba15\, p11 => uba16, p12 => 'Z', p13 => 'Z');
ubcyc_0e07 : dip_74s139 port map (p1 => net_01, p2 => uba5, p3 => uba6, p4 => \-select spy\, p5 => \-select interrupt\, p6 => \-select debug\, p7 => \-select page\, p9 => \-ub wr xbus\, p10 => \-ub write buffer\, p11 => \-ub read buffer\, p12 => \-ub read xbus\, p13 => \c1 in\, p14 => uba1, p15 => net_02);
ubcyc_0e08 : dip_74s133 port map (p1 => uba17, p2 => uba16, p3 => uba15, p4 => uba14, p5 => uba13, p6 => \-uba12\, p7 => uba11, p9 => net_01, p10 => uba10, p11 => \-uba9\, p12 => \-uba8\, p13 => \-uba7\, p14 => \msyn in\, p15 => \hi 1-14\);
ubcyc_0f02 : dip_74s02 port map (p1 => net_03, p2 => ubrd, p3 => \ub reg write pulse\, p4 => open, p5 => 'Z', p6 => 'Z', p8 => 'Z', p9 => 'Z', p10 => open, p11 => 'Z', p12 => 'Z', p13 => open);
ubcyc_0f03 : dip_74s00 port map (p1 => \msyn in\, p2 => \ub17-14=map\, p3 => net_02, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
ubcyc_0f04 : dip_td250 port map (p1 => \ub reg cyc t0\, p4 => \ub reg cyc t100\, p6 => \ub reg cyc t200\, p8 => \ub reg cyc t250\, p10 => \ub reg cyc t150\, p12 => \ub reg cyc t50\);
ubcyc_0f05 : dip_74s133 port map (p1 => \-select spy\, p2 => \-select interrupt\, p3 => \-select page\, p4 => \-ub read buffer\, p5 => \-ub write buffer\, p6 => \hi 1-14\, p7 => \hi 1-14\, p9 => \ub reg cyc t0\, p10 => \hi 1-14\, p11 => \hi 1-14\, p12 => \hi 1-14\, p13 => \hi 1-14\, p14 => \hi 1-14\, p15 => \hi 1-14\);
end architecture;
