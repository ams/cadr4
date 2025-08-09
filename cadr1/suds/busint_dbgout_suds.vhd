-- DBGOUT -- DEBUGER DATA PATH

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_dbgout is
signal net_00 : std_logic;
begin
dbgout_0a09 : dip_74s32 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => \select debug dlyd\, p5 => \select debug\, p6 => \debug active\, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
dbgout_0a10 : dip_mtd100 port map (p1 => \select debug\, p3 => 'Z', p5 => 'Z', p8 => open, p10 => open, p12 => \select debug dlyd\);
dbgout_0a11 : dip_74s00 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => \select debug\, p5 => \select debug dlyd\, p6 => net_00, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
dbgout_0a12 : dip_74s08 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => \debug ssyn\, p9 => \debug out ack\, p10 => \select debug\, p11 => open, p12 => 'Z', p13 => 'Z');
dbgout_0a13 : dip_74s04 port map (p1 => 'Z', p2 => open, p3 => 'Z', p4 => open, p5 => 'Z', p6 => open, p8 => \select debug\, p9 => \-select debug\, p10 => open, p11 => 'Z', p12 => open, p13 => 'Z');
dbgout_0a17 : dip_74s241 port map (p1 => gnd, p2 => uba4, p3 => \-debug out req\, p4 => uba3, p5 => \debug out wr\, p6 => uba2, p7 => \debug out a1\, p8 => uba1, p9 => \debug out a0\, p11 => uba2, p12 => \spy adr1\, p13 => uba3, p14 => \spy adr2\, p15 => ubwr, p16 => \spy adr3\, p17 => net_00, p18 => \spy adr4\, p19 => \hi 15-30\);
dbgout_0b04 : dip_74s241 port map (p1 => 'Z', p2 => 'Z', p3 => \debug in ack\, p4 => 'Z', p5 => \mempar to lm\, p6 => 'Z', p7 => open, p8 => 'Z', p9 => open, p11 => 'Z', p12 => open, p13 => 'Z', p14 => open, p15 => \xbus par in\, p16 => open, p17 => \debug ack\, p18 => open, p19 => \hi 1-14\);
dbgout_0b11 : dip_74s51 port map (p1 => \debug in wr\, p2 => 'Z', p3 => 'Z', p4 => 'Z', p5 => 'Z', p6 => open, p8 => \-debug > ud\, p9 => \debug active\, p10 => ubrd, p13 => \dbub master\);
dbgout_0b12 : dip_74s02 port map (p1 => open, p2 => 'Z', p3 => 'Z', p4 => open, p5 => 'Z', p6 => 'Z', p8 => \dbub master\, p9 => \debug active\, p10 => \-dbd enb\, p11 => 'Z', p12 => 'Z', p13 => open);
dbgout_0b21 : dip_8304 port map (p1 => udo7, p2 => udo6, p3 => udo5, p4 => udo4, p5 => udo3, p6 => udo2, p7 => udo1, p8 => udo0, p9 => \-dbd enb\, p11 => \ud > debug\, p12 => dbd0, p13 => dbd1, p14 => dbd2, p15 => dbd3, p16 => dbd4, p17 => dbd5, p18 => dbd6, p19 => dbd7);
dbgout_0b22 : dip_8304 port map (p1 => udo15, p2 => udo14, p3 => udo13, p4 => udo12, p5 => udo11, p6 => udo10, p7 => udo9, p8 => udo8, p9 => \-dbd enb\, p11 => \ud > debug\, p12 => dbd8, p13 => dbd9, p14 => dbd10, p15 => dbd11, p16 => dbd12, p17 => dbd13, p18 => dbd14, p19 => dbd15);
end architecture;
