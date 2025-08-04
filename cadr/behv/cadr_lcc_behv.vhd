-- LCC -- LC CONTROL

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_lcc is
signal net_0 : std_logic;
signal net_1 : std_logic;
signal net_2 : std_logic;
signal net_3 : std_logic;
signal net_4 : std_logic;
begin
lcc_1c15 : net_3 <= \lc byte mode\ nor \-lcinc\;
lcc_1c21 : dip_74s283 port map (p1 => lca1, p2 => gnd, p3 => lc1, p4 => lca0, p5 => lc0, p6 => net_3, p7 => lcinc, p9 => lcry3, p10 => lca3, p11 => gnd, p12 => lc3, p13 => lca2, p14 => lc2, p15 => gnd);
lcc_1c27 : dip_25s09 port map (p1 => \-destlc\, p2 => lc3, p3 => ob3, p4 => lca3, p5 => lca2, p6 => ob2, p7 => lc2, p9 => clk2a, p10 => lc1, p11 => ob1, p12 => lca1, p13 => lca0, p14 => ob0, p15 => lc0);
lcc_1e07 : lc0b <= \lc byte mode\ and lc0;
lcc_2e05 : dip_74s86 port map (p1 => \inst in left half\, p2 => \-ir4\, p3 => \-sh4\, p4 => lc1, p5 => lc0b, p6 => net_1, p8 => \-sh3\, p9 => \-ir3\, p10 => \inst in 2nd or 4th quarter\, p11 => open, p12 => '0', p13 => '0');
lcc_2e30 : \inst in left half\ <= \-lc modifies mrot\ nor net_1;
           net_2 <= \-lc modifies mrot\ nor lc0;
lcc_3e05 : \inst in 2nd or 4th quarter\ <= net_2 and \lc byte mode\;
lcc_3e07 : net_4     <= spc14 nand \-srcspcpopreal\;
           \-ifetch\ <= needfetch nand lcinc;
lcc_3e09 : needfetch <= \have wrong word\ or \last byte in word\;
lcc_3e11 : \-lc modifies mrot\ <= ir10 nand ir11;
           \have wrong word\   <= \-newlc\ nand \-destlc\;
           \-newlc.in\         <= \-lcinc\ nand \have wrong word\;
lcc_3e12 : dip_74s175 port map (p1 => \-reset\, p2 => \-newlc\, p3 => newlc, p4 => \-newlc.in\, p5 => int, p6 => open, p7 => sintr, p9 => clk3c, p10 => \next.instrd\, p11 => open, p12 => \next.instr\, p13 => '0', p14 => open, p15 => open);
lcc_3e17 : \next.instr\ <=  \-spop\ nor net_4;
           \last byte in word\ <= lc1 nor lc0b;
           \-lcinc\ <= net_0 nor \next.instrd\;
lcc_3e22 : \-needfetch\ <= not needfetch;
lcc_4d09 : spcmung <= spc14 and \-needfetch\;
           net_0 <= ir24 and irdisp;
lcc_4e03 : spc1a <= spcmung or spc1;
           lcinc <= \next.instrd\ or net_0;
end architecture;
