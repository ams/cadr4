-- PCTL -- PROM CONTROL

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_pctl is
begin
pctl_1a16 : dip_74ls244 port map (p1 => \-promenable\, p2 => gnd, p3 => open, p4 => '0', p5 => open, p6 => '0', p7 => open, p8 => '0', p9 => open, p11 => '0', p12 => open, p13 => '0', p14 => open, p15 => '0', p16 => open, p17 => '0', p18 => i46, p19 => hi2);
pctl_1c17 : \-prompc0\ <= not pc0;
            \-prompc1\ <= not pc1;
            \-prompc2\ <= not pc2;
            \-prompc3\ <= not pc3;
            \-prompc4\ <= not pc4;
pctl_1c18 : dip_74s32o port map (p1 => \-promenable\, p2 => pc9, p3 => \-promce0\, p4 => \-prompc9\, p5 => \-promenable\, p6 => \-promce1\, p8 => open, p9 => '0', p10 => '0', p11 => open, p12 => '0', p13 => '0');
pctl_1c19 : dip_74s20 port map (p1 => \bottom.1k\, p2 => \-idebug\, p4 => \-promdisabled\, p5 => \-iwriteda\, p6 => \-promenable\, p8 => open, p9 => '0', p10 => '0', p12 => '0', p13 => '0');
pctl_1d18 : dip_74s260 port map (p1 => gnd, p2 => pc13, p3 => pc12, p4 => '0', p5 => \bottom.1k\, p6 => open, p8 => '0', p9 => '0', p10 => '0', p11 => '0', p12 => pc11, p13 => pc10);
pctl_1d19 : \-prompc5\ <= not pc5;
            \-prompc6\ <= not pc6;
            \-prompc7\ <= not pc7;
            \-prompc8\ <= not pc8;
            \-prompc9\ <= not pc9;
pctl_1e16 : dip_74s20o port map (p1 => \-ape\, p2 => \-pdlpe\, p4 => \-spe\, p5 => \-mpe\, p6 => tilt1, p8 => tilt0, p9 => hi2, p10 => \-mempe\, p12 => \-v1pe\, p13 => \-v0pe\);
pctl_1f10 : promenable <= not \-promenable\;
            dpe <= not \-dpe\;
            ipe <= not \-ipe\;
pctl_5x_til309 : dip_5x_til309 port map (p1 => pc0, p2 => pc1, p3 => pc2, p4 => pc3, p5 => pc4, p6 => pc5, p7 => pc6, p8 => pc7, p9 => pc8, p10 => pc9, p11 => pc10, p12 => pc11, p13 => pc12, p14 => pc13, p15 => promenable, p16 => ipe, p17 => dpe, p18 => tilt0, p19 => tilt1);
end architecture;
