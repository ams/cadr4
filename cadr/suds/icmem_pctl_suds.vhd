-- PCTL -- PROM CONTROL

library work;
use work.dip.all;
use work.misc.all;

architecture suds of icmem_pctl is
begin
pctl_1a16 : dip_74ls244 port map (p1 => \-promenable\, p2 => gnd, p3 => open, p4 => 'Z', p5 => open, p6 => 'Z', p7 => open, p8 => 'Z', p9 => open, p11 => 'Z', p12 => open, p13 => 'Z', p14 => open, p15 => 'Z', p16 => open, p17 => 'Z', p18 => i46, p19 => hi2);
pctl_1c17 : dip_74s04 port map (p1 => pc0, p2 => \-prompc0\, p3 => pc1, p4 => \-prompc1\, p5 => pc2, p6 => \-prompc2\, p8 => \-prompc3\, p9 => pc3, p10 => \-prompc4\, p11 => pc4, p12 => open, p13 => 'Z');
pctl_1c18 : dip_74s32 port map (p1 => \-promenable\, p2 => pc9, p3 => \-promce0\, p4 => \-prompc9\, p5 => \-promenable\, p6 => \-promce1\, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
pctl_1c19 : dip_74s20 port map (p1 => \bottom.1k\, p2 => \-idebug\, p4 => \-promdisabled\, p5 => \-iwriteda\, p6 => \-promenable\, p8 => open, p9 => 'Z', p10 => 'Z', p12 => 'Z', p13 => 'Z');
pctl_1d18 : dip_74s260 port map (p1 => gnd, p2 => pc13, p3 => pc12, p4 => 'Z', p5 => \bottom.1k\, p6 => open, p8 => 'Z', p9 => 'Z', p10 => 'Z', p11 => 'Z', p12 => pc11, p13 => pc10);
pctl_1d19 : dip_74s04 port map (p1 => pc5, p2 => \-prompc5\, p3 => pc6, p4 => \-prompc6\, p5 => pc7, p6 => \-prompc7\, p8 => \-prompc8\, p9 => pc8, p10 => \-prompc9\, p11 => pc9, p12 => open, p13 => 'Z');
pctl_1e16 : dip_74s20 port map (p1 => \-ape\, p2 => \-pdlpe\, p4 => \-spe\, p5 => \-mpe\, p6 => tilt1, p8 => tilt0, p9 => hi2, p10 => \-mempe\, p12 => \-v1pe\, p13 => \-v0pe\);
pctl_1f10 : dip_74s04 port map (p1 => 'Z', p2 => open, p3 => 'Z', p4 => open, p5 => \-promenable\, p6 => promenable, p8 => open, p9 => 'Z', p10 => dpe, p11 => \-dpe\, p12 => ipe, p13 => \-ipe\);
pctl_1f16 : dip_til309 port map (p1 => open, p2 => open, p3 => open, p4 => open, p5 => gnd, p6 => pc2, p7 => gnd, p12 => pc1, p13 => hi2, p14 => tilt1, p15 => hi2, p16 => 'Z', p17 => pc0);
pctl_1f17 : dip_til309 port map (p1 => open, p2 => open, p3 => open, p4 => open, p5 => gnd, p6 => pc5, p7 => gnd, p12 => pc4, p13 => hi2, p14 => tilt0, p15 => hi2, p16 => 'Z', p17 => pc3);
pctl_1f18 : dip_til309 port map (p1 => open, p2 => open, p3 => open, p4 => open, p5 => gnd, p6 => pc8, p7 => gnd, p12 => pc7, p13 => hi2, p14 => dpe, p15 => hi2, p16 => 'Z', p17 => pc6);
pctl_1f19 : dip_til309 port map (p1 => open, p2 => open, p3 => open, p4 => open, p5 => gnd, p6 => pc11, p7 => gnd, p12 => pc10, p13 => hi2, p14 => ipe, p15 => hi2, p16 => 'Z', p17 => pc9);
pctl_1f20 : dip_til309 port map (p1 => open, p2 => open, p3 => open, p4 => open, p5 => gnd, p6 => gnd, p7 => gnd, p12 => pc13, p13 => hi2, p14 => promenable, p15 => hi2, p16 => 'Z', p17 => pc12);
end architecture;
