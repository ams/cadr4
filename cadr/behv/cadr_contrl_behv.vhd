-- CONTRL -- PC, SPC CONTROL

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_contrl is
signal net_0 : std_logic;
signal net_1 : std_logic;
begin
contrl_3d21 : dip_74s08o port map (p1 => spushd, p2 => tse3a, p3 => spcwpass, p4 => \-ipopj\, p5 => \-iwrited\, p6 => \-popj\, p8 => spcdrive, p9 => spcenb, p10 => tse3a, p11 => open, p12 => '0', p13 => '0');
contrl_3d26 : dip_74s175 port map (p1 => \-reset\, p2 => inop, p3 => \-inop\, p4 => n, p5 => '0', p6 => open, p7 => open, p9 => clk3c, p10 => spushd, p11 => \-spushd\, p12 => spush, p13 => iwrite, p14 => \-iwrited\, p15 => iwrited);
contrl_3d28 : spcenb      <= \-srcspc\ nand \-srcspcpop\;
              \-spcdrive\ <= spcenb nand tse3a;
              \-spcpass\  <= tse3a nand \-spushd\;
              \-spcwpass\ <= tse3a nand spushd;
contrl_3e07 : \-ipopj\    <= ir42 nand \-nop\;
contrl_3e09 : dip_74s32o port map (p1 => \-srcspcpop\, p2 => nop, p3 => \-srcspcpopreal\, p4 => '0', p5 => '0', p6 => open, p8 => open, p9 => '0', p10 => '0', p11 => open, p12 => '0', p13 => '0');
contrl_3e14 : dip_74s08o port map (p1 => '0', p2 => '0', p3 => open, p4 => '0', p5 => '0', p6 => open, p8 => open, p9 => '0', p10 => '0', p11 => \-nopa\, p12 => \-nop11\, p13 => \-inop\);
contrl_3e18 : dip_74s32o port map (p1 => \-irdisp\, p2 => dr, p3 => \-ignpopj\, p4 => '0', p5 => '0', p6 => open, p8 => open, p9 => '0', p10 => '0', p11 => open, p12 => '0', p13 => '0');
contrl_3e22 : dip_74s04 port map (p1 => \-destspc\, p2 => destspc, p3 => nop, p4 => \-nop\, p5 => '0', p6 => open, p8 => open, p9 => '0', p10 => open, p11 => '0', p12 => open, p13 => '0');
contrl_3e23 : \-dfall\ <= dr nand dp;
              n        <= \-trap\ nand net_0;
              net_1    <= \-popj\ nand \-srcspcpopreal\;
              nop      <= \-trap\ nand \-nopa\;
contrl_3e24 : dip_74s08 port map (p1 => irdisp, p2 => \-funct2\, p3 => dispenb, p4 => irjump, p5 => ir6, p6 => jfalse, p8 => jcalf, p9 => ir8, p10 => jfalse, p11 => jretf, p12 => ir6, p13 => jret);
contrl_3e25 : dip_74s64 port map (p1 => ir7, p2 => dn, p3 => dispenb, p4 => ir7, p5 => \-jcond\, p6 => jfalse, p8 => net_0, p9 => hi4, p10 => iwrited, p11 => jcond, p12 => \-ir6\, p13 => irjump);
contrl_3e26 : dip_74s64 port map (p1 => jcond, p2 => \-jcond\, p3 => jcalf, p4 => \-dr\, p5 => dp, p6 => dispenb, p8 => \-spush\, p9 => hi4, p10 => destspc, p11 => ir8, p12 => \-ir6\, p13 => irjump);
contrl_3e27 : dip_74s64 port map (p1 => hi4, p2 => \-jcond\, p3 => jfalse, p4 => jcond, p5 => \-ir6\, p6 => irjump, p8 => pcs1, p9 => \-ignpopj\, p10 => popj, p11 => \-dp\, p12 => dr, p13 => dispenb);
contrl_3e28 : dip_74s64 port map (p1 => hi4, p2 => \-jcond\, p3 => jretf, p4 => jcond, p5 => \-ir6\, p6 => jret, p8 => \-spop\, p9 => \-ignpopj\, p10 => net_1, p11 => \-dp\, p12 => dr, p13 => dispenb);
contrl_3e29 : dip_74s11 port map (p1 => \-ir8\, p2 => irjump, p3 => irjump, p4 => ir8, p5 => ir9, p6 => iwrite, p8 => open, p9 => '0', p10 => '0', p11 => '0', p12 => jret, p13 => ir9);
contrl_3f20 : dip_74s04a port map (p1 => \-popj\, p2 => popj, p3 => ir8, p4 => \-ir8\, p5 => ir6, p6 => \-ir6\, p8 => spush, p9 => \-spush\, p10 => \-dp\, p11 => dp, p12 => \-dr\, p13 => dr);
contrl_3f30 : dip_74s64 port map (p1 => hi4, p2 => \-dfall\, p3 => dispenb, p4 => hi4, p5 => \-jcond\, p6 => jretf, p8 => pcs0, p9 => hi4, p10 => popj, p11 => jcond, p12 => \-ir6\, p13 => jret);
contrl_4d09 : dip_74s08o port map (p1 => \-spush\, p2 => \-spop\, p3 => \-spcnt\, p4 => '0', p5 => '0', p6 => open, p8 => open, p9 => '0', p10 => '0', p11 => open, p12 => '0', p13 => '0');
contrl_4e30 : dip_74s37 port map (p1 => \-destspcd\, p2 => \-destspcd\, p3 => destspcd, p4 => wp4c, p5 => spushd, p6 => \-swpb\, p8 => \-swpa\, p9 => spushd, p10 => wp4c, p11 => open, p12 => '0', p13 => '0');
end architecture;
