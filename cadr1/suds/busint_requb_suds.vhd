-- REQUB -- LM & DEBUG TO UNIBUS

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_requb is
signal net_00 : std_logic;
signal net_01 : std_logic;
signal net_02 : std_logic;
begin
requb_0a09 : dip_74s32 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => \ssyn t0\, p9 => \nxm timeout\, p10 => \ssyn in\, p11 => open, p12 => 'Z', p13 => 'Z');
requb_0a12 : dip_74s08 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => \lmub rq\, p12 => \lm need ub\, p13 => \lm ub master\);
requb_0b09 : dip_td250 port map (p1 => \ssyn t0\, p4 => \ssyn t100\, p6 => \ssyn t200\, p8 => \ssyn t250\, p10 => \ssyn t150\, p12 => \ssyn t50\);
requb_0b10 : dip_74s74 port map (p1 => \lmneedub (early)\, p2 => \lmneedub (early)\, p3 => \-clk\, p4 => \hi 1-14\, p5 => \lm need ub\, p6 => \-lm need ub\, p8 => \-unibus request\, p9 => \unibus request\, p10 => \hi 1-14\, p11 => \int busy t100\, p12 => \lmub grant\, p13 => net_02);
requb_0b12 : dip_74s02 port map (p1 => open, p2 => 'Z', p3 => 'Z', p4 => open, p5 => 'Z', p6 => 'Z', p8 => 'Z', p9 => 'Z', p10 => open, p11 => reset, p12 => \ssyn t100\, p13 => net_02);
requb_0c06 : dip_74s51 port map (p1 => net_01, p2 => 'Z', p3 => 'Z', p4 => 'Z', p5 => 'Z', p6 => open, p8 => net_00, p9 => \unibus request\, p10 => \hi 1-14\, p13 => \db need ub\);
requb_0c07 : dip_mtd100 port map (p1 => \dbub master\, p3 => 'Z', p5 => 'Z', p8 => open, p10 => open, p12 => net_01);
requb_0d20 : dip_74s86 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => \msyn out\, p12 => net_00, p13 => \hi 1-14\);
end architecture;
