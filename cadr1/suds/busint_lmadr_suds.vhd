-- LMADR -- ADDRESS FROM LISP MACHINE

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_lmadr is
begin
lmadr_0a23 : dip_74ls240 port map (p1 => \-lmadr>ub\, p2 => \-adr15\, p3 => xao12, p4 => \-adr14\, p5 => xao13, p6 => \-adr13\, p7 => xao14, p8 => \-adr12\, p9 => xao15, p11 => \-adr15\, p12 => uao13, p13 => \-adr14\, p14 => uao14, p15 => \-adr13\, p16 => uao15, p17 => \-adr12\, p18 => uao16, p19 => \-lmadr>xbus\);
lmadr_0a24 : dip_74ls240 port map (p1 => \-lmadr>ub\, p2 => gnd, p3 => xao16, p4 => gnd, p5 => xao17, p6 => gnd, p7 => xao18, p8 => \-adr16\, p9 => xao19, p11 => \-adr19\, p12 => uao17, p13 => \-adr18\, p14 => open, p15 => \-adr17\, p16 => open, p17 => \-adr16\, p18 => open, p19 => \-lmadr>xbus\);
lmadr_0a25 : dip_74ls240 port map (p1 => \-lmadr>ub\, p2 => \-adr3\, p3 => xao0, p4 => \-adr2\, p5 => xao1, p6 => \-adr1\, p7 => xao2, p8 => \-adr0\, p9 => xao3, p11 => \-adr3\, p12 => uao1, p13 => \-adr2\, p14 => uao2, p15 => \-adr1\, p16 => uao3, p17 => \-adr0\, p18 => uao4, p19 => \-lmadr>xbus\);
lmadr_0a26 : dip_74ls240 port map (p1 => \-lmadr>ub\, p2 => \-adr7\, p3 => xao4, p4 => \-adr6\, p5 => xao5, p6 => \-adr5\, p7 => xao6, p8 => \-adr4\, p9 => xao7, p11 => \-adr7\, p12 => uao5, p13 => \-adr6\, p14 => uao6, p15 => \-adr5\, p16 => uao7, p17 => \-adr4\, p18 => uao8, p19 => \-lmadr>xbus\);
lmadr_0a27 : dip_74ls240 port map (p1 => \-lmadr>ub\, p2 => \-adr11\, p3 => xao8, p4 => \-adr10\, p5 => xao9, p6 => \-adr9\, p7 => xao10, p8 => \-adr8\, p9 => xao11, p11 => \-adr11\, p12 => uao9, p13 => \-adr10\, p14 => uao10, p15 => \-adr9\, p16 => uao11, p17 => \-adr8\, p18 => uao12, p19 => \-lmadr>xbus\);
end architecture;
