-- XBD -- XBUS TO BUS

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_xbd is
begin
xbd_0d27 : dip_74ls244 port map (p1 => \-xb>bus\, p2 => xdi7, p3 => bus0, p4 => xdi6, p5 => bus1, p6 => xdi5, p7 => bus2, p8 => xdi4, p9 => bus3, p11 => xdi3, p12 => bus4, p13 => xdi2, p14 => bus5, p15 => xdi1, p16 => bus6, p17 => xdi0, p18 => bus7, p19 => \-xb>bus\);
xbd_0d28 : dip_74ls244 port map (p1 => \-xb>bus\, p2 => xdi15, p3 => bus8, p4 => xdi14, p5 => bus9, p6 => xdi13, p7 => bus10, p8 => xdi12, p9 => bus11, p11 => xdi11, p12 => bus12, p13 => xdi10, p14 => bus13, p15 => xdi9, p16 => bus14, p17 => xdi8, p18 => bus15, p19 => \-xb>bus\);
xbd_0d29 : dip_74ls244 port map (p1 => \-xb>bus\, p2 => xdi23, p3 => bus16, p4 => xdi22, p5 => bus17, p6 => xdi21, p7 => bus18, p8 => xdi20, p9 => bus19, p11 => xdi19, p12 => bus20, p13 => xdi18, p14 => bus21, p15 => xdi17, p16 => bus22, p17 => xdi16, p18 => bus23, p19 => \-xb>bus\);
xbd_0d30 : dip_74ls244 port map (p1 => \-xb>bus\, p2 => xdi31, p3 => bus24, p4 => xdi30, p5 => bus25, p6 => xdi29, p7 => bus26, p8 => xdi28, p9 => bus27, p11 => xdi27, p12 => bus28, p13 => xdi26, p14 => bus29, p15 => xdi25, p16 => bus30, p17 => xdi24, p18 => bus31, p19 => \-xb>bus\);
end architecture;
