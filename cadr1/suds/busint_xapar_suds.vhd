-- XAPAR -- XBUS ADDRESS PARITY

library work;
use work.dip.all;
use work.misc.all;

architecture suds of busint_xapar is
signal net_00 : std_logic;
begin
xapar_0e23 : dip_93s48 port map (p1 => xao18, p2 => xao17, p3 => xao16, p4 => xao15, p5 => xao14, p6 => xao13, p7 => xao12, p9 => \xao par odd\, p10 => \xao par even\, p11 => net_00, p12 => gnd, p13 => xao21, p14 => xao20, p15 => xao19);
xapar_0e24 : dip_93s48 port map (p1 => xao6, p2 => xao5, p3 => xao4, p4 => xao3, p5 => xao2, p6 => xao1, p7 => xao0, p9 => net_00, p10 => open, p11 => xao11, p12 => xao10, p13 => xao9, p14 => xao8, p15 => xao7);
end architecture;
