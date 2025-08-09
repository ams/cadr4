-- UPRIOR -- UNIBUS BUS GRANT

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_uprior is
begin
uprior_0c01 : dip_74ls163 port map (p1 => \any grant\, p2 => \-clk\, p3 => 'Z', p4 => 'Z', p5 => 'Z', p6 => 'Z', p7 => \hi 1-14\, p9 => \hi 1-14\, p10 => \hi 1-14\, p11 => open, p12 => open, p13 => open, p14 => open, p15 => \grant timeout\);
uprior_0c03 : dip_74ls27 port map (p1 => 'Z', p2 => 'Z', p3 => sackd, p4 => gnd, p5 => \grant timeout\, p6 => \-clear grant\, p8 => open, p9 => 'Z', p10 => 'Z', p11 => 'Z', p12 => open, p13 => 'Z');
uprior_0d07 : dip_25ls2519 port map (p1 => 'Z', p2 => open, p3 => open, p4 => 'Z', p5 => open, p6 => open, p7 => gnd, p8 => gnd, p9 => \-clk\, p11 => \any grant dlyd\, p12 => \-any grant dlyd\, p13 => \any grant\, p14 => npgo, p15 => \-npgo\, p16 => npgp, p17 => \any grant dlyd\, p18 => \hi 1-14\, p19 => \-clear grant\);
uprior_0d08 : dip_25ls2519 port map (p1 => bg4p, p2 => \-bg4o\, p3 => bg4o, p4 => bg5p, p5 => \-bg5o\, p6 => bg5o, p7 => gnd, p8 => gnd, p9 => \-clk\, p11 => bg6o, p12 => \-bg6o\, p13 => bg6p, p14 => bg7o, p15 => \-bg7o\, p16 => bg7p, p17 => \any grant dlyd\, p18 => \hi 1-14\, p19 => \-clear grant\);
uprior_0d09 : dip_74s472 port map (p1 => nprd, p2 => br7d, p3 => br6d, p4 => br5d, p5 => br4d, p6 => npgp, p7 => bg7p, p8 => bg6p, p9 => bg5p, p11 => bg4p, p12 => \any grant\, p13 => \any int grant\, p14 => open, p15 => gnd, p16 => level0, p17 => level1, p18 => \-clear grant\, p19 => \-disable int grant\);
uprior_0d10 : dip_74s174 port map (p1 => \hi 1-14\, p2 => sackd, p3 => \sack in\, p4 => npr, p5 => nprd, p6 => br7, p7 => br7d, p9 => \-clk\, p10 => br6d, p11 => br6, p12 => br5d, p13 => br5, p14 => br4, p15 => br4d);
uprior_0f06 : dip_dm8838 port map (p1 => \ub npg in\, p2 => gnd, p3 => \-npg in\, p4 => \-ub br4\, p5 => gnd, p6 => br4, p7 => gnd, p9 => \-local enable\, p10 => \unibus init in\, p11 => reset, p12 => \-ub init\, p13 => \unibus intr in\, p14 => gnd, p15 => \-ub intr\);
uprior_0f13 : dip_74s38 port map (p1 => \local enable\, p2 => \-bg4o\, p3 => \ub bg4 in\, p4 => \local enable\, p5 => \-bg5o\, p6 => \ub bg5 in\, p8 => \ub bg6 in\, p9 => \-bg6o\, p10 => \local enable\, p11 => \ub bg7 in\, p12 => \-bg7o\, p13 => \local enable\);
uprior_0f14 : dip_74s38 port map (p1 => \local enable\, p2 => \-npgo\, p3 => \ub npg in\, p4 => \-npg out\, p5 => \-npg out\, p6 => \ub npg out\, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
uprior_0f15 : dip_dm8838 port map (p1 => \-ub br7\, p2 => gnd, p3 => br7, p4 => \-ub npr\, p5 => \bus req\, p6 => npr, p7 => gnd, p9 => gnd, p10 => br6, p11 => gnd, p12 => \-ub br6\, p13 => br5, p14 => gnd, p15 => \-ub br5\);
uprior_0f17 : dip_dummy4_uprior_f13 port map (p1 => \ub npg out\, p2 => gnd, p3 => \ub npg in\);
uprior_0f18 : dip_dummy4_uprior_f14 port map (p1 => \hi 1-14\);
end architecture;
