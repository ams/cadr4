-- SPCPAR -- SPC MEMORY PARITY

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_spcpar is
begin
spcpar_3e19 : dip_74s86 port map (p1 => '0', p2 => '0', p3 => open, p4 => spcwparh, p5 => \-spcwparl\, p6 => spcwpar, p8 => open, p9 => '0', p10 => '0', p11 => open, p12 => '0', p13 => '0');
spcpar_4f16 : dip_93s48 port map (p1 => spcw17, p2 => spcw18, p3 => gnd, p4 => gnd, p5 => gnd, p6 => gnd, p7 => gnd, p9 => spcwparh, p10 => open, p11 => spcw12, p12 => spcw13, p13 => spcw14, p14 => spcw15, p15 => spcw16);
spcpar_4f17 : dip_93s48 port map (p1 => spcw5, p2 => spcw6, p3 => spcw7, p4 => spcw8, p5 => spcw9, p6 => spcw10, p7 => spcw11, p9 => open, p10 => \-spcwparl\, p11 => spcw0, p12 => spcw1, p13 => spcw2, p14 => spcw3, p15 => spcw4);
spcpar_4f21 : dip_93s48 port map (p1 => spc16, p2 => spc17, p3 => spc18, p4 => spcpar, p5 => gnd, p6 => gnd, p7 => gnd, p9 => spcparh, p10 => open, p11 => spc11, p12 => spc12, p13 => spc13, p14 => spc14, p15 => spc15);
spcpar_4f26 : dip_93s48 port map (p1 => spc5, p2 => spc6, p3 => spc7, p4 => spc8, p5 => spc9, p6 => spc10, p7 => spcparh, p9 => spcparok, p10 => open, p11 => spc0, p12 => spc1, p13 => spc2, p14 => spc3, p15 => spc4);
end architecture;
