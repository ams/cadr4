-- SPC -- SPC MEMORY AND POINTER

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_spc is
begin
spc_4e21 : dip_82s21 port map (p1 => \-swpa\, p2 => gnd, p3 => spcw14, p4 => spcptr4, p5 => hi1, p6 => hi1, p7 => spco14, p9 => spco15, p10 => spcptr3, p11 => spcptr2, p12 => spcptr1, p13 => spcptr0, p14 => spcw15, p15 => gnd);
spc_4e22 : dip_82s21 port map (p1 => \-swpa\, p2 => gnd, p3 => spcw12, p4 => spcptr4, p5 => hi1, p6 => hi1, p7 => spco12, p9 => spco13, p10 => spcptr3, p11 => spcptr2, p12 => spcptr1, p13 => spcptr0, p14 => spcw13, p15 => gnd);
spc_4e23 : dip_82s21 port map (p1 => \-swpa\, p2 => gnd, p3 => spcw10, p4 => spcptr4, p5 => hi1, p6 => hi1, p7 => spco10, p9 => spco11, p10 => spcptr3, p11 => spcptr2, p12 => spcptr1, p13 => spcptr0, p14 => spcw11, p15 => gnd);
spc_4e24 : dip_res20 port map (p2 => spcopar, p3 => spco18, p4 => spco17, p5 => spco16, p6 => spco15, p7 => hi1, p8 => hi2, p9 => hi3, p10 => open, p11 => hi4, p12 => hi5, p13 => hi6, p14 => hi7, p15 => spco14, p16 => spco13, p17 => spco12, p18 => spco11, p19 => spco10);
spc_4e26 : dip_82s21 port map (p1 => \-swpb\, p2 => gnd, p3 => spcw4, p4 => spcptr4, p5 => hi1, p6 => hi1, p7 => spco4, p9 => spco5, p10 => spcptr3, p11 => spcptr2, p12 => spcptr1, p13 => spcptr0, p14 => spcw5, p15 => gnd);
spc_4e27 : dip_82s21 port map (p1 => \-swpb\, p2 => gnd, p3 => spcw2, p4 => spcptr4, p5 => hi1, p6 => hi1, p7 => spco2, p9 => spco3, p10 => spcptr3, p11 => spcptr2, p12 => spcptr1, p13 => spcptr0, p14 => spcw3, p15 => gnd);
spc_4e28 : dip_82s21 port map (p1 => \-swpb\, p2 => gnd, p3 => spcw0, p4 => spcptr4, p5 => hi1, p6 => hi1, p7 => spco0, p9 => spco1, p10 => spcptr3, p11 => spcptr2, p12 => spcptr1, p13 => spcptr0, p14 => spcw1, p15 => gnd);
spc_4e29 : dip_res20 port map (p2 => spco9, p3 => spco8, p4 => spco7, p5 => spco6, p6 => spco5, p7 => hi8, p8 => hi9, p9 => hi10, p10 => open, p11 => hi11, p12 => hi12, p13 => open, p14 => open, p15 => spco4, p16 => spco3, p17 => spco2, p18 => spco1, p19 => spco0);
spc_4f23 : dip_74s169 port map (p1 => spush, p2 => clk4f, p3 => '0', p4 => '0', p5 => '0', p6 => '0', p7 => gnd, p9 => hi1, p10 => \-spcnt\, p11 => spcptr3, p12 => spcptr2, p13 => spcptr1, p14 => spcptr0, p15 => \-spccry\);
spc_4f24 : dip_82s21 port map (p1 => \-swpa\, p2 => gnd, p3 => spcw18, p4 => spcptr4, p5 => hi1, p6 => hi1, p7 => spco18, p9 => spcopar, p10 => spcptr3, p11 => spcptr2, p12 => spcptr1, p13 => spcptr0, p14 => spcwpar, p15 => gnd);
spc_4f25 : dip_82s21 port map (p1 => \-swpa\, p2 => gnd, p3 => spcw16, p4 => spcptr4, p5 => hi1, p6 => hi1, p7 => spco16, p9 => spco17, p10 => spcptr3, p11 => spcptr2, p12 => spcptr1, p13 => spcptr0, p14 => spcw17, p15 => gnd);
spc_4f28 : dip_74s169 port map (p1 => spush, p2 => clk4f, p3 => '0', p4 => '0', p5 => '0', p6 => '0', p7 => gnd, p9 => hi1, p10 => \-spccry\, p11 => open, p12 => open, p13 => open, p14 => spcptr4, p15 => open);
spc_4f29 : dip_82s21 port map (p1 => \-swpb\, p2 => gnd, p3 => spcw8, p4 => spcptr4, p5 => hi1, p6 => hi1, p7 => spco8, p9 => spco9, p10 => spcptr3, p11 => spcptr2, p12 => spcptr1, p13 => spcptr0, p14 => spcw9, p15 => gnd);
spc_4f30 : dip_82s21 port map (p1 => \-swpb\, p2 => gnd, p3 => spcw6, p4 => spcptr4, p5 => hi1, p6 => hi1, p7 => spco6, p9 => spco7, p10 => spcptr3, p11 => spcptr2, p12 => spcptr1, p13 => spcptr0, p14 => spcw7, p15 => gnd);
end architecture;
