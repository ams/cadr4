-- BCTERM -- BUSINT CABLE TERMINATION

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_bcterm is
begin
bcterm_1b15_1 : dip_sip220_330_8 port map (p2 => mem0, p3 => mem1, p4 => mem2, p5 => mem3, p6 => mem4, p7 => mem5);
bcterm_1b15_2 : dip_sip220_330_8 port map (p2 => mem6, p3 => mem7, p4 => mem8, p5 => mem9, p6 => mem10, p7 => mem11);
bcterm_1b20_1 : dip_sip220_330_8 port map (p2 => mem12, p3 => mem13, p4 => mem14, p5 => mem15, p6 => mem16, p7 => mem17);
bcterm_1b20_2 : dip_sip220_330_8 port map (p2 => mem18, p3 => mem19, p4 => mem20, p5 => mem21, p6 => mem22, p7 => mem23);
bcterm_1b25_1 : dip_sip220_330_8 port map (p2 => mem24, p3 => mem25, p4 => mem26, p5 => mem27, p6 => mem28, p7 => mem29);
bcterm_1b25_2 : dip_sip220_330_8 port map (p2 => mem30, p3 => mem31, p4 => \mempar in\, p5 => open, p6 => open, p7 => open);
bcterm_2c25 : dip_sip330_470_8 port map (p2 => \-memgrant\, p3 => int, p4 => \-loadmd\, p5 => \-ignpar\, p6 => \-memack\, p7 => open);
end architecture;
