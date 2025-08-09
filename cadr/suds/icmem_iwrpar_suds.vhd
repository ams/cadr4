-- IWRPAR -- IWR PARITY

library work;
use work.dip.all;
use work.misc.all;

architecture suds of icmem_iwrpar is
begin
iwrpar_1b11 : dip_93s48 port map (p1 => iwr41, p2 => iwr42, p3 => iwr43, p4 => iwr44, p5 => iwr45, p6 => iwr46, p7 => iwr47, p9 => iwrp4, p10 => open, p11 => iwr36, p12 => iwr37, p13 => iwr38, p14 => iwr39, p15 => iwr40);
iwrpar_1b12 : dip_93s48 port map (p1 => iwr29, p2 => iwr30, p3 => iwr31, p4 => iwr32, p5 => iwr33, p6 => iwr34, p7 => iwr35, p9 => iwrp3, p10 => open, p11 => iwr24, p12 => iwr25, p13 => iwr26, p14 => iwr27, p15 => iwr28);
iwrpar_1b13 : dip_93s48 port map (p1 => iwr17, p2 => iwr18, p3 => iwr19, p4 => iwr20, p5 => iwr21, p6 => iwr22, p7 => iwr23, p9 => iwrp2, p10 => open, p11 => iwr12, p12 => iwr13, p13 => iwr14, p14 => iwr15, p15 => iwr16);
iwrpar_1b14 : dip_93s48 port map (p1 => iwr5, p2 => iwr6, p3 => iwr7, p4 => iwr8, p5 => iwr9, p6 => iwr10, p7 => iwr11, p9 => iwrp1, p10 => open, p11 => iwr0, p12 => iwr1, p13 => iwr2, p14 => iwr3, p15 => iwr4);
iwrpar_1b15 : dip_93s48 port map (p1 => gnd, p2 => gnd, p3 => gnd, p4 => gnd, p5 => gnd, p6 => gnd, p7 => gnd, p9 => open, p10 => iwr48, p11 => iwrp1, p12 => iwrp2, p13 => iwrp3, p14 => iwrp4, p15 => gnd);
end architecture;
