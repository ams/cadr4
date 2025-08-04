-- LCC -- LC CONTROL

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_lcc is
signal net_0 : std_logic;
signal net_1 : std_logic;
signal net_2 : std_logic;
signal net_3 : std_logic;
signal net_4 : std_logic;
begin
lcc_1c15 : dip_74s02o port map (p1 => open, p2 => 'Z', p3 => 'Z', p4 => open, p5 => 'Z', p6 => 'Z', p8 => \lc byte mode\, p9 => \-lcinc\, p10 => net_3, p11 => 'Z', p12 => 'Z', p13 => open);
lcc_1c21 : dip_74s283 port map (p1 => lca1, p2 => gnd, p3 => lc1, p4 => lca0, p5 => lc0, p6 => net_3, p7 => lcinc, p9 => lcry3, p10 => lca3, p11 => gnd, p12 => lc3, p13 => lca2, p14 => lc2, p15 => gnd);
lcc_1c27 : dip_25s09 port map (p1 => \-destlc\, p2 => lc3, p3 => ob3, p4 => lca3, p5 => lca2, p6 => ob2, p7 => lc2, p9 => clk2a, p10 => lc1, p11 => ob1, p12 => lca1, p13 => lca0, p14 => ob0, p15 => lc0);
lcc_1e07 : dip_74s08 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => lc0b, p12 => \lc byte mode\, p13 => lc0);
lcc_2e05 : dip_74s86 port map (p1 => \inst in left half\, p2 => \-ir4\, p3 => \-sh4\, p4 => lc1, p5 => lc0b, p6 => net_1, p8 => \-sh3\, p9 => \-ir3\, p10 => \inst in 2nd or 4th quarter\, p11 => open, p12 => 'Z', p13 => 'Z');
lcc_2e30 : dip_74s02o port map (p1 => open, p2 => 'Z', p3 => 'Z', p4 => open, p5 => 'Z', p6 => 'Z', p8 => \-lc modifies mrot\, p9 => net_1, p10 => \inst in left half\, p11 => \-lc modifies mrot\, p12 => lc0, p13 => net_2);
lcc_3e05 : dip_74s08 port map (p1 => net_2, p2 => \lc byte mode\, p3 => \inst in 2nd or 4th quarter\, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
lcc_3e07 : dip_74s00 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => net_4, p9 => spc14, p10 => \-srcspcpopreal\, p11 => \-ifetch\, p12 => needfetch, p13 => lcinc);
lcc_3e09 : dip_74s32 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => needfetch, p12 => \have wrong word\, p13 => \last byte in word\);
lcc_3e11 : dip_74s00o port map (p1 => ir10, p2 => ir11, p3 => \-lc modifies mrot\, p4 => \-newlc\, p5 => \-destlc\, p6 => \have wrong word\, p8 => \-newlc.in\, p9 => \-lcinc\, p10 => \have wrong word\, p11 => open, p12 => 'Z', p13 => 'Z');
lcc_3e12 : dip_74s175 port map (p1 => \-reset\, p2 => \-newlc\, p3 => newlc, p4 => \-newlc.in\, p5 => int, p6 => open, p7 => sintr, p9 => clk3c, p10 => \next.instrd\, p11 => open, p12 => \next.instr\, p13 => 'Z', p14 => open, p15 => open);
lcc_3e17 : dip_74s02o port map (p1 => \next.instr\, p2 => \-spop\, p3 => net_4, p4 => \last byte in word\, p5 => lc1, p6 => lc0b, p8 => net_0, p9 => \next.instrd\, p10 => \-lcinc\, p11 => 'Z', p12 => 'Z', p13 => open);
lcc_3e22 : dip_74s04 port map (p1 => 'Z', p2 => open, p3 => 'Z', p4 => open, p5 => needfetch, p6 => \-needfetch\, p8 => open, p9 => 'Z', p10 => open, p11 => 'Z', p12 => open, p13 => 'Z');
lcc_4d09 : dip_74s08 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => spc14, p5 => \-needfetch\, p6 => spcmung, p8 => open, p9 => 'Z', p10 => 'Z', p11 => net_0, p12 => ir24, p13 => irdisp);
lcc_4e03 : dip_74s32 port map (p1 => spcmung, p2 => spc1, p3 => spc1a, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => lcinc, p12 => \next.instrd\, p13 => net_0);
end architecture;
