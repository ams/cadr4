-- XD -- XBUS DATA TRANSCEIVERS

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_xd is
begin
xd_0e27 : dip_26s10 port map (p2 => \-xbus7\, p3 => xdi7, p4 => bus7, p5 => bus6, p6 => xdi6, p7 => \-xbus6\, p9 => \-xbus5\, p10 => xdi5, p11 => bus5, p12 => \-xdrive\, p13 => bus4, p14 => xdi4, p15 => \-xbus4\);
xd_0e28 : dip_26s10 port map (p2 => \-xbus15\, p3 => xdi15, p4 => bus15, p5 => bus14, p6 => xdi14, p7 => \-xbus14\, p9 => \-xbus13\, p10 => xdi13, p11 => bus13, p12 => \-xdrive\, p13 => bus12, p14 => xdi12, p15 => \-xbus12\);
xd_0e29 : dip_26s10 port map (p2 => \-xbus23\, p3 => xdi23, p4 => bus23, p5 => bus22, p6 => xdi22, p7 => \-xbus22\, p9 => \-xbus21\, p10 => xdi21, p11 => bus21, p12 => \-xdrive\, p13 => bus20, p14 => xdi20, p15 => \-xbus20\);
xd_0e30 : dip_26s10 port map (p2 => \-xbus31\, p3 => xdi31, p4 => bus31, p5 => bus30, p6 => xdi30, p7 => \-xbus30\, p9 => \-xbus29\, p10 => xdi29, p11 => bus29, p12 => \-xdrive\, p13 => bus28, p14 => xdi28, p15 => \-xbus28\);
xd_0f20 : dip_26s10 port map (p2 => open, p3 => open, p4 => 'Z', p5 => gnd, p6 => \xbus ignpar in\, p7 => \-xbus ignpar\, p9 => \-xbus wr\, p10 => open, p11 => \hi 15-30\, p12 => \-xdrive\, p13 => \xbus par out\, p14 => \xbus par in\, p15 => \-xbus par\);
xd_0f27 : dip_26s10 port map (p2 => \-xbus3\, p3 => xdi3, p4 => bus3, p5 => bus2, p6 => xdi2, p7 => \-xbus2\, p9 => \-xbus1\, p10 => xdi1, p11 => bus1, p12 => \-xdrive\, p13 => bus0, p14 => xdi0, p15 => \-xbus0\);
xd_0f28 : dip_26s10 port map (p2 => \-xbus11\, p3 => xdi11, p4 => bus11, p5 => bus10, p6 => xdi10, p7 => \-xbus10\, p9 => \-xbus9\, p10 => xdi9, p11 => bus9, p12 => \-xdrive\, p13 => bus8, p14 => xdi8, p15 => \-xbus8\);
xd_0f29 : dip_26s10 port map (p2 => \-xbus19\, p3 => xdi19, p4 => bus19, p5 => bus18, p6 => xdi18, p7 => \-xbus18\, p9 => \-xbus17\, p10 => xdi17, p11 => bus17, p12 => \-xdrive\, p13 => bus16, p14 => xdi16, p15 => \-xbus16\);
xd_0f30 : dip_26s10 port map (p2 => \-xbus27\, p3 => xdi27, p4 => bus27, p5 => bus26, p6 => xdi26, p7 => \-xbus26\, p9 => \-xbus25\, p10 => xdi25, p11 => bus25, p12 => \-xdrive\, p13 => bus24, p14 => xdi24, p15 => \-xbus24\);
end architecture;
