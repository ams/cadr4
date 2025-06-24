-- OPCS -- OLD PC SAVE SHIFTER

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_opcs is
begin
opcs_1f06 : dip_9328 port map (p1 => hi2, p2 => open, p3 => opc13, p4 => gnd, p5 => '0', p6 => pc13, p7 => opcinha, p9 => opcclka, p10 => opcinha, p11 => pc12, p12 => '0', p13 => gnd, p14 => opc12, p15 => open);
opcs_1f07 : dip_9328 port map (p1 => hi2, p2 => open, p3 => opc11, p4 => gnd, p5 => '0', p6 => pc11, p7 => opcinha, p9 => opcclka, p10 => opcinha, p11 => pc10, p12 => '0', p13 => gnd, p14 => opc10, p15 => open);
opcs_1f08 : dip_9328 port map (p1 => hi2, p2 => open, p3 => opc9, p4 => gnd, p5 => '0', p6 => pc9, p7 => opcinha, p9 => opcclkc, p10 => opcinha, p11 => pc8, p12 => '0', p13 => gnd, p14 => opc8, p15 => open);
opcs_1f09 : dip_9328 port map (p1 => hi2, p2 => open, p3 => opc7, p4 => gnd, p5 => '0', p6 => pc7, p7 => opcinha, p9 => opcclkc, p10 => opcinha, p11 => pc6, p12 => '0', p13 => gnd, p14 => opc6, p15 => open);
opcs_1f10 : opcinha <= not \-opcinh\;
             opcinhb <= not \-opcinh\;
opcs_1f11 : dip_9328 port map (p1 => hi2, p2 => open, p3 => opc5, p4 => gnd, p5 => '0', p6 => pc5, p7 => opcinhb, p9 => opcclkb, p10 => opcinhb, p11 => pc4, p12 => '0', p13 => gnd, p14 => opc4, p15 => open);
opcs_1f12 : dip_9328 port map (p1 => hi2, p2 => open, p3 => opc3, p4 => gnd, p5 => '0', p6 => pc3, p7 => opcinhb, p9 => opcclkb, p10 => opcinhb, p11 => pc2, p12 => '0', p13 => gnd, p14 => opc2, p15 => open);
opcs_1f13 : dip_9328 port map (p1 => hi2, p2 => open, p3 => opc1, p4 => gnd, p5 => '0', p6 => pc1, p7 => opcinhb, p9 => opcclkb, p10 => opcinhb, p11 => pc0, p12 => '0', p13 => gnd, p14 => opc0, p15 => open);
opcs_1f14 : opcclka <=  \-clk5\ nor opcclk;
            opcclkb <= \-clk5\ nor opcclk;
            opcclkc <= opcclk nor \-clk5\;
end architecture;
