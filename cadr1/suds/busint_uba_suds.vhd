-- UBA -- UNIBUS ADDRESS TRANSCEIVERS

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_uba is
begin
uba_0d11 : dip_74s04 port map (p1 => uba7, p2 => \-uba 7\, p3 => uba8, p4 => \-uba 8\, p5 => uba9, p6 => \-uba 9\, p8 => \-uba 12\, p9 => uba12, p10 => \-uba 14\, p11 => uba14, p12 => \-uba 15\, p13 => uba15);
uba_0f08 : dip_dm8838 port map (p1 => \-ub adr2\, p2 => uao2, p3 => uba2, p4 => \-ub adr3\, p5 => uao3, p6 => uba3, p7 => gnd, p9 => \-ubadrive\, p10 => uba1, p11 => uao1, p12 => \-ub adr1\, p13 => uba0, p14 => gnd, p15 => \-ub adr0\);
uba_0f09 : dip_dm8838 port map (p1 => \-ub adr6\, p2 => uao6, p3 => uba6, p4 => \-ub adr7\, p5 => uao7, p6 => uba7, p7 => gnd, p9 => \-ubadrive\, p10 => uba5, p11 => uao5, p12 => \-ub adr5\, p13 => uba4, p14 => uao4, p15 => \-ub adr4\);
uba_0f10 : dip_dm8838 port map (p1 => \-ub adr10\, p2 => uao10, p3 => uba10, p4 => \-ub adr11\, p5 => uao11, p6 => uba11, p7 => gnd, p9 => \-ubadrive\, p10 => uba9, p11 => uao9, p12 => \-ub adr9\, p13 => uba8, p14 => uao8, p15 => \-ub adr8\);
uba_0f11 : dip_dm8838 port map (p1 => \-ub adr14\, p2 => uao14, p3 => uba14, p4 => \-ub adr15\, p5 => uao15, p6 => uba15, p7 => gnd, p9 => \-ubadrive\, p10 => uba13, p11 => uao13, p12 => \-ub adr13\, p13 => uba12, p14 => uao12, p15 => \-ub adr12\);
uba_0f12 : dip_dm8838 port map (p1 => \-ub c1\, p2 => \c1 out\, p3 => \c1 in\, p4 => open, p5 => 'Z', p6 => open, p7 => gnd, p9 => \-ubadrive\, p10 => uba17, p11 => uao17, p12 => \-ub adr17\, p13 => uba16, p14 => uao16, p15 => \-ub adr16\);
end architecture;
