-- UBXA -- UNIBUS ADDRESS TO XBUS

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_ubxa is
begin
ubxa_0e20 : dip_74ls244 port map (p1 => \-ubaddr>xbus\, p2 => uba9, p3 => xao0, p4 => uba8, p5 => xao1, p6 => uba7, p7 => xao2, p8 => uba6, p9 => xao3, p11 => uba5, p12 => xao4, p13 => uba4, p14 => xao5, p15 => uba3, p16 => xao6, p17 => uba2, p18 => xao7, p19 => \-ubaddr>xbus\);
ubxa_0e21 : dip_74ls244 port map (p1 => \-ubaddr>xbus\, p2 => ubma15, p3 => xao8, p4 => ubma14, p5 => xao9, p6 => ubma13, p7 => xao10, p8 => ubma12, p9 => xao11, p11 => ubma11, p12 => xao12, p13 => ubma10, p14 => xao13, p15 => ubma9, p16 => xao14, p17 => ubma8, p18 => xao15, p19 => \-ubaddr>xbus\);
ubxa_0e22 : dip_74ls244 port map (p1 => \-ubaddr>xbus\, p2 => gnd, p3 => xao16, p4 => gnd, p5 => xao17, p6 => ubma21, p7 => xao18, p8 => ubma20, p9 => xao19, p11 => ubma19, p12 => xao20, p13 => ubma18, p14 => xao21, p15 => ubma17, p16 => open, p17 => ubma16, p18 => open, p19 => \-ubaddr>xbus\);
end architecture;
