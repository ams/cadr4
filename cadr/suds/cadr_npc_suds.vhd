-- NPC -- NPC,IPC,PC

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_npc is
begin
npc_3f26 : dip_74s283 port map (p1 => ipc13, p2 => gnd, p3 => pc13, p4 => ipc12, p5 => pc12, p6 => gnd, p7 => pccry11, p9 => open, p10 => open, p11 => gnd, p12 => 'Z', p13 => open, p14 => 'Z', p15 => gnd);
npc_3f27 : dip_74s283 port map (p1 => ipc9, p2 => gnd, p3 => pc9, p4 => ipc8, p5 => pc8, p6 => gnd, p7 => pccry7, p9 => pccry11, p10 => ipc11, p11 => gnd, p12 => pc11, p13 => ipc10, p14 => pc10, p15 => gnd);
npc_3f28 : dip_74s283 port map (p1 => ipc5, p2 => gnd, p3 => pc5, p4 => ipc4, p5 => pc4, p6 => gnd, p7 => pccry3, p9 => pccry7, p10 => ipc7, p11 => gnd, p12 => pc7, p13 => ipc6, p14 => pc6, p15 => gnd);
npc_3f29 : dip_74s283 port map (p1 => ipc1, p2 => gnd, p3 => pc1, p4 => ipc0, p5 => pc0, p6 => gnd, p7 => hi4, p9 => pccry3, p10 => ipc3, p11 => gnd, p12 => pc3, p13 => ipc2, p14 => pc2, p15 => gnd);
npc_4e01 : dip_74s153 port map (p1 => trapb, p2 => pcs1, p3 => ipc3, p4 => dpc3, p5 => ir15, p6 => spc3, p7 => npc3, p9 => npc2, p10 => spc2, p11 => ir14, p12 => dpc2, p13 => ipc2, p14 => pcs0, p15 => trapb);
npc_4e02 : dip_74s153 port map (p1 => trapb, p2 => pcs1, p3 => ipc1, p4 => dpc1, p5 => ir13, p6 => spc1a, p7 => npc1, p9 => npc0, p10 => spc0, p11 => ir12, p12 => dpc0, p13 => ipc0, p14 => pcs0, p15 => trapb);
npc_4e04 : dip_74s374 port map (p1 => gnd, p2 => open, p3 => 'Z', p4 => 'Z', p5 => open, p6 => pc13, p7 => npc13, p8 => npc12, p9 => pc12, p11 => clk4b, p12 => pc11, p13 => npc11, p14 => npc10, p15 => pc10, p16 => pc9, p17 => npc9, p18 => npc8, p19 => pc8);
npc_4e05 : dip_74s374 port map (p1 => gnd, p2 => pc7, p3 => npc7, p4 => npc6, p5 => pc6, p6 => pc5, p7 => npc5, p8 => npc4, p9 => pc4, p11 => clk4b, p12 => pc3, p13 => npc3, p14 => npc2, p15 => pc2, p16 => pc1, p17 => npc1, p18 => npc0, p19 => pc0);
npc_4f01 : dip_74s153 port map (p1 => trapa, p2 => pcs1, p3 => ipc13, p4 => dpc13, p5 => ir25, p6 => spc13, p7 => npc13, p9 => npc12, p10 => spc12, p11 => ir24, p12 => dpc12, p13 => ipc12, p14 => pcs0, p15 => trapa);
npc_4f02 : dip_74s153 port map (p1 => trapa, p2 => pcs1, p3 => ipc11, p4 => dpc11, p5 => ir23, p6 => spc11, p7 => npc11, p9 => npc10, p10 => spc10, p11 => ir22, p12 => dpc10, p13 => ipc10, p14 => pcs0, p15 => trapa);
npc_4f03 : dip_74s153 port map (p1 => trapa, p2 => pcs1, p3 => ipc9, p4 => dpc9, p5 => ir21, p6 => spc9, p7 => npc9, p9 => npc8, p10 => spc8, p11 => ir20, p12 => dpc8, p13 => ipc8, p14 => pcs0, p15 => trapa);
npc_4f04 : dip_74s153 port map (p1 => trapa, p2 => pcs1, p3 => ipc7, p4 => dpc7, p5 => ir19, p6 => spc7, p7 => npc7, p9 => npc6, p10 => spc6, p11 => ir18, p12 => dpc6, p13 => ipc6, p14 => pcs0, p15 => trapb);
npc_4f05 : dip_74s153 port map (p1 => trapb, p2 => pcs1, p3 => ipc5, p4 => dpc5, p5 => ir17, p6 => spc5, p7 => npc5, p9 => npc4, p10 => spc4, p11 => ir16, p12 => dpc4, p13 => ipc4, p14 => pcs0, p15 => trapb);
end architecture;
