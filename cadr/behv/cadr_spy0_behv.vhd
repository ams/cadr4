-- SPY0 -- PDP11 EXAMINE CONTROL

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_spy0 is
begin
spy0_1f01 : dip_74s138 port map (p1 => eadr0, p2 => eadr1, p3 => eadr2, p4 => \-dbread\, p5 => eadr3, p6 => hi1, p7 => \-spy.obh\, p9 => \-spy.obl\, p10 => \-spy.pc\, p11 => \-spy.opc\, p12 => open, p13 => \-spy.irh\, p14 => \-spy.irm\, p15 => \-spy.irl\);
spy0_1f02 : dip_74s138 port map (p1 => eadr0, p2 => eadr1, p3 => eadr2, p4 => \-dbread\, p5 => gnd, p6 => eadr3, p7 => \-spy.sth\, p9 => \-spy.stl\, p10 => \-spy.ah\, p11 => \-spy.al\, p12 => \-spy.mh\, p13 => \-spy.ml\, p14 => \-spy.flag2\, p15 => \-spy.flag1\);
spy0_1f03 : dip_74s138 port map (p1 => eadr0, p2 => eadr1, p3 => eadr2, p4 => \-dbwrite\, p5 => gnd, p6 => hi1, p7 => open, p9 => open, p10 => \-ldmode\, p11 => \-ldopc\, p12 => \-ldclk\, p13 => \-lddbirh\, p14 => \-lddbirm\, p15 => \-lddbirl\);
end architecture;
