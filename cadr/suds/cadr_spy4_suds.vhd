-- SPY4 -- PDP11 EXAMINE (OPC, FLAG1, PC)

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_spy4 is
begin
spy4_1a12 : dip_74ls244 port map (p1 => \-spy.flag1\, p2 => \-wait\, p3 => spy8, p4 => \-v1pe\, p5 => spy9, p6 => \-v0pe\, p7 => spy10, p8 => promdisable, p9 => spy11, p11 => \-stathalt\, p12 => spy12, p13 => err, p14 => spy13, p15 => ssdone, p16 => spy14, p17 => srun, p18 => spy15, p19 => \-spy.flag1\);
spy4_1a13 : dip_74ls240 port map (p1 => \-spy.flag1\, p2 => \-higherr\, p3 => spy0, p4 => \-mempe\, p5 => spy1, p6 => \-ipe\, p7 => spy2, p8 => \-dpe\, p9 => spy3, p11 => \-spe\, p12 => spy4, p13 => \-pdlpe\, p14 => spy5, p15 => \-mpe\, p16 => spy6, p17 => \-ape\, p18 => spy7, p19 => \-spy.flag1\);
spy4_1d06 : dip_74ls244 port map (p1 => \-spy.pc\, p2 => gnd, p3 => spy8, p4 => gnd, p5 => spy9, p6 => pc13, p7 => spy10, p8 => pc12, p9 => spy11, p11 => pc11, p12 => spy12, p13 => pc10, p14 => spy13, p15 => pc9, p16 => spy14, p17 => pc8, p18 => spy15, p19 => \-spy.pc\);
spy4_1d07 : dip_74ls244 port map (p1 => \-spy.pc\, p2 => pc7, p3 => spy0, p4 => pc6, p5 => spy1, p6 => pc5, p7 => spy2, p8 => pc4, p9 => spy3, p11 => pc3, p12 => spy4, p13 => pc2, p14 => spy5, p15 => pc1, p16 => spy6, p17 => pc0, p18 => spy7, p19 => \-spy.pc\);
spy4_1e06 : dip_74ls244 port map (p1 => \-spy.opc\, p2 => gnd, p3 => spy8, p4 => gnd, p5 => spy9, p6 => opc13, p7 => spy10, p8 => opc12, p9 => spy11, p11 => opc11, p12 => spy12, p13 => opc10, p14 => spy13, p15 => opc9, p16 => spy14, p17 => opc8, p18 => spy15, p19 => \-spy.opc\);
spy4_1e07 : dip_74ls244 port map (p1 => \-spy.opc\, p2 => opc7, p3 => spy0, p4 => opc6, p5 => spy1, p6 => opc5, p7 => spy2, p8 => opc4, p9 => spy3, p11 => opc3, p12 => spy4, p13 => opc2, p14 => spy5, p15 => opc1, p16 => spy6, p17 => opc0, p18 => spy7, p19 => \-spy.opc\);
end architecture;
