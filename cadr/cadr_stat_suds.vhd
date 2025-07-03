-- STAT -- STATISTICS COUNTER

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_stat is
begin
stat_1b01 : dip_74s169 port map (p1 => hi1, p2 => clk5a, p3 => iwr12, p4 => iwr13, p5 => iwr14, p6 => iwr15, p7 => gnd, p9 => \-ldstat\, p10 => \-stc12\, p11 => st15, p12 => st14, p13 => st13, p14 => st12, p15 => \-stc16\);
stat_1b02 : dip_74s169 port map (p1 => hi1, p2 => clk5a, p3 => iwr16, p4 => iwr17, p5 => iwr18, p6 => iwr19, p7 => gnd, p9 => \-ldstat\, p10 => \-stc16\, p11 => st19, p12 => st18, p13 => st17, p14 => st16, p15 => \-stc20\);
stat_1b03 : dip_74s169 port map (p1 => hi1, p2 => clk5a, p3 => iwr20, p4 => iwr21, p5 => iwr22, p6 => iwr23, p7 => gnd, p9 => \-ldstat\, p10 => \-stc20\, p11 => st23, p12 => st22, p13 => st21, p14 => st20, p15 => \-stc24\);
stat_1b04 : dip_74s169 port map (p1 => hi1, p2 => clk5a, p3 => iwr24, p4 => iwr25, p5 => iwr26, p6 => iwr27, p7 => gnd, p9 => \-ldstat\, p10 => \-stc24\, p11 => st27, p12 => st26, p13 => st25, p14 => st24, p15 => \-stc28\);
stat_1b05 : dip_74s169 port map (p1 => hi1, p2 => clk5a, p3 => iwr28, p4 => iwr29, p5 => iwr30, p6 => iwr31, p7 => gnd, p9 => \-ldstat\, p10 => \-stc28\, p11 => st31, p12 => st30, p13 => st29, p14 => st28, p15 => \-stc32\);
stat_1b06 : dip_74ls244 port map (p1 => \-spy.sth\, p2 => st31, p3 => spy8, p4 => st30, p5 => spy9, p6 => st29, p7 => spy10, p8 => st28, p9 => spy11, p11 => st27, p12 => spy12, p13 => st26, p14 => spy13, p15 => st25, p16 => spy14, p17 => st24, p18 => spy15, p19 => \-spy.sth\);
stat_1b07 : dip_74ls244 port map (p1 => \-spy.sth\, p2 => st23, p3 => spy0, p4 => st22, p5 => spy1, p6 => st21, p7 => spy2, p8 => st20, p9 => spy3, p11 => st19, p12 => spy4, p13 => st18, p14 => spy5, p15 => st17, p16 => spy6, p17 => st16, p18 => spy7, p19 => \-spy.sth\);
stat_1b08 : dip_74ls244 port map (p1 => \-spy.stl\, p2 => st15, p3 => spy8, p4 => st14, p5 => spy9, p6 => st13, p7 => spy10, p8 => st12, p9 => spy11, p11 => st11, p12 => spy12, p13 => st10, p14 => spy13, p15 => st9, p16 => spy14, p17 => st8, p18 => spy15, p19 => \-spy.stl\);
stat_1b09 : dip_74ls244 port map (p1 => \-spy.stl\, p2 => st7, p3 => spy0, p4 => st6, p5 => spy1, p6 => st5, p7 => spy2, p8 => st4, p9 => spy3, p11 => st3, p12 => spy4, p13 => st2, p14 => spy5, p15 => st1, p16 => spy6, p17 => st0, p18 => spy7, p19 => \-spy.stl\);
stat_1c03 : dip_74s169 port map (p1 => hi1, p2 => clk5a, p3 => iwr0, p4 => iwr1, p5 => iwr2, p6 => iwr3, p7 => gnd, p9 => \-ldstat\, p10 => \-statbit\, p11 => st3, p12 => st2, p13 => st1, p14 => st0, p15 => \-stc4\);
stat_1c04 : dip_74s169 port map (p1 => hi1, p2 => clk5a, p3 => iwr4, p4 => iwr5, p5 => iwr6, p6 => iwr7, p7 => gnd, p9 => \-ldstat\, p10 => \-stc4\, p11 => st7, p12 => st6, p13 => st5, p14 => st4, p15 => \-stc8\);
stat_1c05 : dip_74s169 port map (p1 => hi1, p2 => clk5a, p3 => iwr8, p4 => iwr9, p5 => iwr10, p6 => iwr11, p7 => gnd, p9 => \-ldstat\, p10 => \-stc8\, p11 => st11, p12 => st10, p13 => st9, p14 => st8, p15 => \-stc12\);
end architecture;
