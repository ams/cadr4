-- UBMAST -- UNIBUS MASTERSHIP

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_ubmast is
signal net_00 : std_logic;
signal net_01 : std_logic;
signal net_02 : std_logic;
signal net_03 : std_logic;
signal net_04 : std_logic;
begin
ubmast_0a09 : dip_74s32 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => net_04, p12 => \sack in\, p13 => \-local enable\);
ubmast_0b03 : dip_74s04 port map (p1 => \-npg1 out\, p2 => \npg1 out\, p3 => \npg2 out\, p4 => \-npg out\, p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => open, p11 => 'Z', p12 => open, p13 => 'Z');
ubmast_0b16 : dip_74s08 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => \-lm reset\, p9 => lmneedub, p10 => \-lm ub master\, p11 => \-db reset\, p12 => \db need ub\, p13 => \-db ub master\);
ubmast_0c02 : dip_74ls74 port map (p1 => \hi 1-14\, p2 => \-lm bus req\, p3 => \npg2 in\, p4 => \-lm reset\, p5 => \-lm ub granted\, p6 => \lm ub granted\, p8 => \-lm ub selected\, p9 => \lm ub selected\, p10 => \hi 1-14\, p11 => \npg2 in t100\, p12 => \lm ub granted\, p13 => \-lm reset\);
ubmast_0c03 : dip_74ls27 port map (p1 => \bbsy in\, p2 => \ssyn in\, p3 => 'Z', p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => 'Z', p12 => \bus ready\, p13 => \npg in\);
ubmast_0c04 : dip_74s11 port map (p1 => \npg2 in t100\, p2 => \npg2 in\, p3 => 'Z', p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => 'Z', p12 => \npg2 out\, p13 => \-lmub granted\);
ubmast_0d01 : dip_mtd100 port map (p1 => \npg1 out\, p3 => \npg in\, p5 => \-db need ub\, p8 => net_00, p10 => \npg1 in t100\, p12 => \npg2 in t100\);
ubmast_0d02 : dip_74ls74 port map (p1 => \hi 1-14\, p2 => \-db bus req\, p3 => \npg1 in\, p4 => \-db reset\, p5 => \-db ub granted\, p6 => \db ub granted\, p8 => \-db ub selected\, p9 => \db ub selected\, p10 => \hi 1-14\, p11 => \npg1 in t100\, p12 => \db ub granted\, p13 => \-db reset\);
ubmast_0d04 : dip_74s74 port map (p1 => net_03, p2 => 'Z', p3 => gnd, p4 => \-lm ub set master\, p5 => \lm ub master\, p6 => \-lm ub master\, p8 => \-db ub master\, p9 => \db ub master\, p10 => \-db ub set master\, p11 => net_00, p12 => gnd, p13 => \-debug reset\);
ubmast_0d05 : dip_74s00 port map (p1 => \-lm bus req\, p2 => \-db bus req\, p3 => \bus req\, p4 => 'Z', p5 => 'Z', p6 => open, p8 => net_03, p9 => \-lm need ub\, p10 => net_04, p11 => open, p12 => 'Z', p13 => 'Z');
ubmast_0d06 : dip_74s10 port map (p1 => \-lm ub selected\, p2 => lmneedub, p3 => \db need ub\, p4 => \-db ub selected\, p5 => \-db ub master\, p6 => \-db bus req\, p8 => \-npg1 out\, p9 => \-dbub granted\, p10 => \npg1 in t100\, p11 => \npg1 in\, p12 => \-lm bus req\, p13 => \-lm ub master\);
ubmast_0e01 : dip_74s00 port map (p1 => \bus ready\, p2 => \db ub selected\, p3 => \-db ub set master\, p4 => \bus ready\, p5 => \lm ub selected\, p6 => \-lm ub set master\, p8 => net_02, p9 => \-db ub selected\, p10 => \-lm ub selected\, p11 => net_01, p12 => \-db ub master\, p13 => \-lm ub master\);
ubmast_0e05 : dip_74s04 port map (p1 => 'Z', p2 => open, p3 => 'Z', p4 => open, p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => open, p11 => 'Z', p12 => \npg in\, p13 => \-npg in\);
ubmast_0f07 : dip_dm8838 port map (p1 => \-ub bbsy\, p2 => net_01, p3 => \bbsy in\, p4 => \-ub sack\, p5 => net_02, p6 => \sack in\, p7 => gnd, p9 => gnd, p10 => \msyn in\, p11 => \msyn out\, p12 => \-ub msyn\, p13 => \ssyn in\, p14 => \ssyn out\, p15 => \-ub ssyn\);
end architecture;
