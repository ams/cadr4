-- UBD -- UNIBUS DATA TRANSCEIVERS

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_ubd is
begin
ubd_0e18 : dip_74ls244 port map (p1 => \-udi > udo\, p2 => udi7, p3 => udo0, p4 => udi6, p5 => udo1, p6 => udi5, p7 => udo2, p8 => udi4, p9 => udo3, p11 => udi3, p12 => udo4, p13 => udi2, p14 => udo5, p15 => udi1, p16 => udo6, p17 => udi0, p18 => udo7, p19 => \-udi > udo\);
ubd_0e19 : dip_74ls244 port map (p1 => \-udi > udo\, p2 => udi15, p3 => udo8, p4 => udi14, p5 => udo9, p6 => udi13, p7 => udo10, p8 => udi12, p9 => udo11, p11 => udi11, p12 => udo12, p13 => udi10, p14 => udo13, p15 => udi9, p16 => udo14, p17 => udi8, p18 => udo15, p19 => \-udi > udo\);
ubd_0f16 : dip_dm8838 port map (p1 => \-ubd2\, p2 => udo2, p3 => udi2, p4 => \-ubd3\, p5 => udo3, p6 => udi3, p7 => gnd, p9 => \-ubdrive\, p10 => udi1, p11 => udo1, p12 => \-ubd1\, p13 => udi0, p14 => udo0, p15 => \-ubd0\);
ubd_0f17 : dip_dm8838 port map (p1 => \-ubd6\, p2 => udo6, p3 => udi6, p4 => \-ubd7\, p5 => udo7, p6 => udi7, p7 => gnd, p9 => \-ubdrive\, p10 => udi5, p11 => udo5, p12 => \-ubd5\, p13 => udi4, p14 => udo4, p15 => \-ubd4\);
ubd_0f18 : dip_dm8838 port map (p1 => \-ubd10\, p2 => udo10, p3 => udi10, p4 => \-ubd11\, p5 => udo11, p6 => udi11, p7 => gnd, p9 => \-ubdrive\, p10 => udi9, p11 => udo9, p12 => \-ubd9\, p13 => udi8, p14 => udo8, p15 => \-ubd8\);
ubd_0f19 : dip_dm8838 port map (p1 => \-ubd14\, p2 => udo14, p3 => udi14, p4 => \-ubd15\, p5 => udo15, p6 => udi15, p7 => gnd, p9 => \-ubdrive\, p10 => udi13, p11 => udo13, p12 => \-ubd13\, p13 => udi12, p14 => udo12, p15 => \-ubd12\);
end architecture;
