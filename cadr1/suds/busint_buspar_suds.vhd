-- BUSPAR -- BUS PARITY

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_buspar is
begin
buspar_0c28 : dip_93s48 port map (p1 => bus30, p2 => bus29, p3 => bus28, p4 => bus27, p5 => bus26, p6 => bus25, p7 => bus24, p9 => \bus par odd\, p10 => \bus par even\, p11 => gnd, p12 => gnd, p13 => \bus 12-23 par odd\, p14 => \bus 0-11 par odd\, p15 => bus31);
buspar_0c29 : dip_93s48 port map (p1 => bus18, p2 => bus17, p3 => bus16, p4 => bus15, p5 => bus14, p6 => bus13, p7 => bus12, p9 => \bus 12-23 par odd\, p10 => open, p11 => bus23, p12 => bus22, p13 => bus21, p14 => bus20, p15 => bus19);
buspar_0c30 : dip_93s48 port map (p1 => bus6, p2 => bus5, p3 => bus4, p4 => bus3, p5 => bus2, p6 => bus1, p7 => bus0, p9 => \bus 0-11 par odd\, p10 => open, p11 => bus11, p12 => bus10, p13 => bus9, p14 => bus8, p15 => bus7);
end architecture;
