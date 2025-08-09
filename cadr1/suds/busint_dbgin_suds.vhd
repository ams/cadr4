-- DBGIN -- DEBUGEE DATA PATH

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_dbgin is
signal net_00 : std_logic;
signal net_01 : std_logic;
signal net_02 : std_logic;
begin
dbgin_0a09 : dip_74s32 port map (p1 => net_01, p2 => net_02, p3 => \debug ack\, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
dbgin_0a11 : dip_74s00 port map (p1 => \-local enable\, p2 => \unibus init in\, p3 => net_00, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
dbgin_0a12 : dip_74s08 port map (p1 => \dbub master\, p2 => \ssyn t0\, p3 => net_01, p4 => \-lm power reset\, p5 => net_00, p6 => \-debug reset\, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
dbgin_0a13 : dip_74s04 port map (p1 => \local enable\, p2 => \-local enable\, p3 => \-db need ub\, p4 => \db need ub\, p5 => reset, p6 => \-reset\, p8 => open, p9 => 'Z', p10 => open, p11 => 'Z', p12 => open, p13 => 'Z');
dbgin_0a14 : dip_74s10 port map (p1 => \-db adr1 clk\, p2 => \-db adr0 clk\, p3 => 'Z', p4 => 'Z', p5 => 'Z', p6 => open, p8 => reset, p9 => net_00, p10 => \-lm unibus reset\, p11 => \-debugee reset\, p12 => net_02, p13 => \-db read status\);
dbgin_0a15 : dip_74s139 port map (p1 => \-debug in req\, p2 => \debug in a0\, p3 => \debug in a1\, p4 => \-db need ub\, p5 => \-db read status\, p6 => \-db adr1 clk\, p7 => \-db adr0 clk\, p9 => open, p10 => open, p11 => open, p12 => open, p13 => 'Z', p14 => 'Z', p15 => 'Z');
dbgin_0a16 : dip_25ls2519 port map (p1 => dbd3, p2 => open, p3 => open, p4 => dbd2, p5 => \-debug timeout inh\, p6 => open, p7 => gnd, p8 => \-dbub master\, p9 => \-db adr1 clk\, p11 => open, p12 => \-debugee reset\, p13 => dbd1, p14 => uao17, p15 => open, p16 => dbd0, p17 => gnd, p18 => \hi 15-30\, p19 => \-debug reset\);
dbgin_0a18 : dip_74ls374 port map (p1 => \-dbub master\, p2 => uao8, p3 => dbd7, p4 => dbd6, p5 => uao7, p6 => uao6, p7 => dbd5, p8 => dbd4, p9 => uao5, p11 => \-db adr0 clk\, p12 => uao4, p13 => dbd3, p14 => dbd2, p15 => uao3, p16 => uao2, p17 => dbd1, p18 => dbd0, p19 => uao1);
dbgin_0a19 : dip_74ls374 port map (p1 => \-dbub master\, p2 => uao16, p3 => dbd15, p4 => dbd14, p5 => uao15, p6 => uao14, p7 => dbd13, p8 => dbd12, p9 => uao13, p11 => \-db adr0 clk\, p12 => uao12, p13 => dbd11, p14 => dbd10, p15 => uao11, p16 => uao10, p17 => dbd9, p18 => dbd8, p19 => uao9);
dbgin_0a22 : dip_sip180_390_8 port map (p2 => \debug in a1\, p3 => \debug in a0\, p4 => \debug in wr\, p5 => \-debug in req\, p6 => \debug out ack\, p7 => \local enable\);
dbgin_0c04 : dip_74s11 port map (p1 => 'Z', p2 => 'Z', p3 => 'Z', p4 => 'Z', p5 => 'Z', p6 => open, p8 => \-busint lm reset\, p9 => \hi 1-14\, p10 => \-debugee reset\, p11 => net_00, p12 => open, p13 => 'Z');
end architecture;
