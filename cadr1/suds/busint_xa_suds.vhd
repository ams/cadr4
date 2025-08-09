-- XA -- XBUS ADDRESS TRANSCEIVERS

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_xa is
begin
xa_0b13 : dip_74s04 port map (p1 => \-lm power reset\, p2 => \lm power reset\, p3 => 'Z', p4 => open, p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => open, p11 => 'Z', p12 => open, p13 => 'Z');
xa_0e25 : dip_26s10 port map (p2 => \-xaddr15\, p3 => open, p4 => xao15, p5 => xao14, p6 => open, p7 => \-xaddr14\, p9 => \-xaddr13\, p10 => open, p11 => xao13, p12 => \-xaddrdrive\, p13 => xao12, p14 => open, p15 => \-xaddr12\);
xa_0e26 : dip_26s10 port map (p2 => \-xbus rq\, p3 => open, p4 => \xbus request\, p5 => \xaddr par out\, p6 => open, p7 => \-xaddr par\, p9 => \-xaddr21\, p10 => open, p11 => xao21, p12 => \-xaddrdrive\, p13 => xao20, p14 => open, p15 => \-xaddr20\);
xa_0f21 : dip_26s10 port map (p2 => \-xbus init\, p3 => open, p4 => reset, p5 => clk0, p6 => open, p7 => \-xbus sync\, p9 => \-xbus ack\, p10 => \xbus ack in\, p11 => gnd, p12 => gnd, p13 => \lm power reset\, p14 => open, p15 => \-xbus power reset\);
xa_0f22 : dip_26s10 port map (p2 => \-xbus busy\, p3 => \xbus busy in\, p4 => gnd, p5 => gnd, p6 => \xbus extrq in\, p7 => \-xbus extrq\, p9 => \-xbus extgrant out\, p10 => open, p11 => \xbus extgrant out\, p12 => gnd, p13 => gnd, p14 => \xbus intr in\, p15 => \-xbus intr\);
xa_0f23 : dip_26s10 port map (p2 => \-xaddr3\, p3 => open, p4 => xao3, p5 => xao2, p6 => open, p7 => \-xaddr2\, p9 => \-xaddr1\, p10 => open, p11 => xao1, p12 => \-xaddrdrive\, p13 => xao0, p14 => open, p15 => \-xaddr0\);
xa_0f24 : dip_26s10 port map (p2 => \-xaddr7\, p3 => open, p4 => xao7, p5 => xao6, p6 => open, p7 => \-xaddr6\, p9 => \-xaddr5\, p10 => open, p11 => xao5, p12 => \-xaddrdrive\, p13 => xao4, p14 => open, p15 => \-xaddr4\);
xa_0f25 : dip_26s10 port map (p2 => \-xaddr11\, p3 => open, p4 => xao11, p5 => xao10, p6 => open, p7 => \-xaddr10\, p9 => \-xaddr9\, p10 => open, p11 => xao9, p12 => \-xaddrdrive\, p13 => xao8, p14 => open, p15 => \-xaddr8\);
xa_0f26 : dip_26s10 port map (p2 => \-xaddr19\, p3 => open, p4 => xao19, p5 => xao18, p6 => open, p7 => \-xaddr18\, p9 => \-xaddr17\, p10 => open, p11 => xao17, p12 => \-xaddrdrive\, p13 => xao16, p14 => open, p15 => \-xaddr16\);
end architecture;
