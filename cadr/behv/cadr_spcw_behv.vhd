-- SPCW -- SPC WRITE DATA SEL

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_spcw is
begin
spcw_4e11 : dip_74s157 port map (p1 => destspcd, p2 => reta12, p3 => l12, p4 => spcw12, p5 => reta13, p6 => l13, p7 => spcw13, p9 => spcw14, p10 => l14, p11 => gnd, p12 => spcw15, p13 => l15, p14 => gnd, p15 => gnd);
spcw_4e12 : dip_74s157 port map (p1 => destspcd, p2 => reta8, p3 => l8, p4 => spcw8, p5 => reta9, p6 => l9, p7 => spcw9, p9 => spcw10, p10 => l10, p11 => reta10, p12 => spcw11, p13 => l11, p14 => reta11, p15 => gnd);
spcw_4e13 : dip_74s157 port map (p1 => destspcd, p2 => reta4, p3 => l4, p4 => spcw4, p5 => reta5, p6 => l5, p7 => spcw5, p9 => spcw6, p10 => l6, p11 => reta6, p12 => spcw7, p13 => l7, p14 => reta7, p15 => gnd);
spcw_4e14 : dip_74s157 port map (p1 => destspcd, p2 => reta0, p3 => l0, p4 => spcw0, p5 => reta1, p6 => l1, p7 => spcw1, p9 => spcw2, p10 => l2, p11 => reta2, p12 => spcw3, p13 => l3, p14 => reta3, p15 => gnd);
spcw_4f11 : dip_25s09 port map (p1 => n, p2 => reta12, p3 => ipc12, p4 => wpc12, p5 => wpc13, p6 => ipc13, p7 => reta13, p9 => clk4d, p10 => open, p11 => '0', p12 => '0', p13 => '0', p14 => '0', p15 => open);
spcw_4f12 : dip_25s09 port map (p1 => n, p2 => reta8, p3 => ipc8, p4 => wpc8, p5 => wpc9, p6 => ipc9, p7 => reta9, p9 => clk4d, p10 => reta10, p11 => ipc10, p12 => wpc10, p13 => wpc11, p14 => ipc11, p15 => reta11);
spcw_4f13 : dip_25s09 port map (p1 => n, p2 => reta4, p3 => ipc4, p4 => wpc4, p5 => wpc5, p6 => ipc5, p7 => reta5, p9 => clk4d, p10 => reta6, p11 => ipc6, p12 => wpc6, p13 => wpc7, p14 => ipc7, p15 => reta7);
spcw_4f14 : dip_25s09 port map (p1 => n, p2 => reta0, p3 => ipc0, p4 => wpc0, p5 => wpc1, p6 => ipc1, p7 => reta1, p9 => clk4d, p10 => reta2, p11 => ipc2, p12 => wpc2, p13 => wpc3, p14 => ipc3, p15 => reta3);
spcw_4f15 : dip_74s157 port map (p1 => destspcd, p2 => gnd, p3 => l16, p4 => spcw16, p5 => gnd, p6 => l17, p7 => spcw17, p9 => spcw18, p10 => l18, p11 => gnd, p12 => open, p13 => '0', p14 => '0', p15 => gnd);
end architecture;
