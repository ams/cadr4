-- DSPCTL -- DISPATCH CONTROL

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_dspctl is
begin
dspctl_2f22 : dip_5610 generic map (fn => "rom/dspctl.2f22.hex") port map (p1 => dmask0, p2 => dmask1, p3 => dmask2, p4 => dmask3, p5 => dmask4, p6 => dmask5, p7 => dmask6, p9 => open, p10 => ir5, p11 => ir6, p12 => ir7, p13 => gnd, p14 => gnd, p15 => gnd);
dspctl_3c14 : dip_25s07 port map (p1 => \-irdisp\, p2 => dc6, p3 => ir38, p4 => ir39, p5 => dc7, p6 => ir40, p7 => dc8, p9 => clk3e, p10 => dc9, p11 => ir41, p12 => open, p13 => '0', p14 => '0', p15 => open);
dspctl_3c15 : dip_25s07 port map (p1 => \-irdisp\, p2 => dc0, p3 => ir32, p4 => ir33, p5 => dc1, p6 => ir34, p7 => dc2, p9 => clk3e, p10 => dc3, p11 => ir35, p12 => dc4, p13 => ir36, p14 => ir37, p15 => dc5);
dspctl_3d02 : dparok <= dpareven nand dispenb;
dspctl_3e19 : dip_74s86 port map (p1 => '0', p2 => '0', p3 => open, p4 => '0', p5 => '0', p6 => open, p8 => dpareven, p9 => \-dparh\, p10 => dparl, p11 => open, p12 => '0', p13 => '0');
dspctl_3f11 : dip_74s241 port map (p1 => hi4, p2 => '0', p3 => aa16, p4 => '0', p5 => aa17, p6 => '0', p7 => open, p8 => '0', p9 => open, p11 => '0', p12 => open, p13 => '0', p14 => open, p15 => a17, p16 => open, p17 => a16, p18 => open, p19 => hi4);
dspctl_3f12 : dip_74s241 port map (p1 => gnd, p2 => a15, p3 => aa8, p4 => a14, p5 => aa9, p6 => a13, p7 => aa10, p8 => a12, p9 => aa11, p11 => a11, p12 => aa12, p13 => a10, p14 => aa13, p15 => a9, p16 => aa14, p17 => a8, p18 => aa15, p19 => hi4);
dspctl_3f13 : dip_74s241 port map (p1 => gnd, p2 => a7, p3 => aa0, p4 => a6, p5 => aa1, p6 => a5, p7 => aa2, p8 => a4, p9 => aa3, p11 => a3, p12 => aa4, p13 => a2, p14 => aa5, p15 => a1, p16 => aa6, p17 => a0, p18 => aa7, p19 => hi4);
dspctl_3f14 : \-dmapbenb\ <=  ir8 nor ir9;
              dispwr      <= \-irdisp\ nor \-funct2\;
dspctl_4f09 : dip_74s280 port map (p1 => dpc9, p2 => dpc10, p4 => dpc11, p5 => \-dparh\, p6 => open, p8 => dpc12, p9 => dpc13, p10 => dn, p11 => dp, p12 => dr, p13 => dpar);
dspctl_4f10 : dip_74s280 port map (p1 => dpc0, p2 => dpc1, p4 => dpc2, p5 => open, p6 => dparl, p8 => dpc3, p9 => dpc4, p10 => dpc5, p11 => dpc6, p12 => dpc7, p13 => dpc8);
end architecture;
