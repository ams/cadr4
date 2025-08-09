-- REQERR -- ERROR LOGIC

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_reqerr is
signal net_00 : std_logic;
signal net_01 : std_logic;
signal net_02 : std_logic;
signal net_03 : std_logic;
signal net_04 : std_logic;
signal net_05 : std_logic;
signal net_06 : std_logic;
signal net_07 : std_logic;
signal net_08 : std_logic;
begin
reqerr_0a03 : dip_74ls112 port map (p1 => 'Z', p2 => 'Z', p3 => 'Z', p4 => 'Z', p5 => open, p6 => open, p7 => open, p9 => \xb par error\, p10 => \hi 1-14\, p11 => net_04, p12 => gnd, p13 => \xbus request\, p14 => \-reset err\, p15 => 'Z');
reqerr_0b02 : dip_74276 port map (p1 => \-reset err\, p2 => net_06, p3 => \-int busy t80\, p4 => \hi 1-14\, p5 => \lm par error\, p6 => \lm adr par error\, p7 => \hi 1-14\, p8 => \-int busy t80\, p9 => net_08, p11 => \hi 1-14\, p12 => \xbus request\, p13 => \-nxm timeout\, p14 => \hi 1-14\, p15 => \xb nxm error\, p16 => \ub nxm error\, p17 => \hi 1-14\, p18 => \-nxm timeout\, p19 => \unibus request\);
reqerr_0b05 : dip_74s11 port map (p1 => 'Z', p2 => 'Z', p3 => net_05, p4 => \lmx grant a\, p5 => lmwr, p6 => net_06, p8 => net_04, p9 => \-xbus ignpar in\, p10 => xrd, p11 => net_03, p12 => open, p13 => 'Z');
reqerr_0b13 : dip_74s04 port map (p1 => 'Z', p2 => open, p3 => \xbus ignpar in\, p4 => \-xbus ignpar in\, p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => \xbus par out\, p11 => net_00, p12 => open, p13 => 'Z');
reqerr_0b15 : dip_8304 port map (p1 => \xb nxm error\, p2 => \xb par error\, p3 => \lm adr par error\, p4 => \ub nxm error\, p5 => \lm par error\, p6 => \ub map error\, p7 => \-free\, p8 => \write through enb\, p9 => \-db read status\, p11 => \hi 1-14\, p12 => dbd7, p13 => dbd6, p14 => dbd5, p15 => dbd4, p16 => dbd3, p17 => dbd2, p18 => dbd1, p19 => dbd0);
reqerr_0b16 : dip_74s08 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => net_07, p5 => \lmx grant a\, p6 => net_08, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
reqerr_0c03 : dip_74ls27 port map (p1 => 'Z', p2 => 'Z', p3 => 'Z', p4 => 'Z', p5 => 'Z', p6 => open, p8 => \-any par error\, p9 => \xb par error\, p10 => \lm adr par error\, p11 => \lm par error\, p12 => open, p13 => 'Z');
reqerr_0c06 : dip_74s51 port map (p1 => 'Z', p2 => \lmx grant a\, p3 => \mempar from lm\, p4 => \-lmx grant\, p5 => \bus par even\, p6 => net_00, p8 => open, p9 => 'Z', p10 => 'Z', p13 => 'Z');
reqerr_0c16 : dip_74ls244 port map (p1 => \-ub err drive\, p2 => \xb nxm error\, p3 => udo7, p4 => \xb par error\, p5 => udo6, p6 => \lm adr par error\, p7 => udo5, p8 => \ub nxm error\, p9 => udo4, p11 => \lm par error\, p12 => udo3, p13 => \ub map error\, p14 => udo2, p15 => \-free\, p16 => udo1, p17 => \write through enb\, p18 => udo0, p19 => \-ub err drive\);
reqerr_0d03 : dip_74ls74 port map (p1 => \hi 1-14\, p2 => net_02, p3 => \ub xbus t100\, p4 => \-reset err\, p5 => net_01, p6 => \ub map error\, p8 => open, p9 => open, p10 => 'Z', p11 => 'Z', p12 => 'Z', p13 => 'Z');
reqerr_0d20 : dip_74s86 port map (p1 => \bus par even\, p2 => \mempar from lm\, p3 => net_05, p4 => \bus par even\, p5 => \xbus par in\, p6 => net_03, p8 => net_07, p9 => \-xao par even\, p10 => \-adrpar\, p11 => open, p12 => 'Z', p13 => 'Z');
reqerr_0e02 : dip_74s08 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => net_01, p5 => \-ub invalid\, p6 => net_02, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
end architecture;
