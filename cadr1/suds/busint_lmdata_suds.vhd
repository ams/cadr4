-- LMDATA -- PROCESSOR DATA XCVR

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_lmdata is
begin
lmdata_0a28 : dip_sip180_390_8 port map (p2 => mem24, p3 => mem25, p4 => mem26, p5 => mem27, p6 => mem28, p7 => mem29);
lmdata_0a29 : dip_sip180_390_8 port map (p2 => mem12, p3 => mem13, p4 => mem14, p5 => mem15, p6 => mem16, p7 => mem17);
lmdata_0a30 : dip_sip180_390_8 port map (p2 => mem0, p3 => mem1, p4 => mem2, p5 => mem3, p6 => mem4, p7 => mem5);
lmdata_0b27 : dip_8304 port map (p1 => bus7, p2 => bus6, p3 => bus5, p4 => bus4, p5 => bus3, p6 => bus2, p7 => bus1, p8 => bus0, p9 => \-lmbus enb\, p11 => \bus > lm\, p12 => mem0, p13 => mem1, p14 => mem2, p15 => mem3, p16 => mem4, p17 => mem5, p18 => mem6, p19 => mem7);
lmdata_0b28 : dip_8304 port map (p1 => bus15, p2 => bus14, p3 => bus13, p4 => bus12, p5 => bus11, p6 => bus10, p7 => bus9, p8 => bus8, p9 => \-lmbus enb\, p11 => \bus > lm\, p12 => mem8, p13 => mem9, p14 => mem10, p15 => mem11, p16 => mem12, p17 => mem13, p18 => mem14, p19 => mem15);
lmdata_0b29 : dip_8304 port map (p1 => bus23, p2 => bus22, p3 => bus21, p4 => bus20, p5 => bus19, p6 => bus18, p7 => bus17, p8 => bus16, p9 => \-lmbus enb\, p11 => \bus > lm\, p12 => mem16, p13 => mem17, p14 => mem18, p15 => mem19, p16 => mem20, p17 => mem21, p18 => mem22, p19 => mem23);
lmdata_0b30 : dip_8304 port map (p1 => bus31, p2 => bus30, p3 => bus29, p4 => bus28, p5 => bus27, p6 => bus26, p7 => bus25, p8 => bus24, p9 => \-lmbus enb\, p11 => \bus > lm\, p12 => mem24, p13 => mem25, p14 => mem26, p15 => mem27, p16 => mem28, p17 => mem29, p18 => mem30, p19 => mem31);
end architecture;
