-- ICTL -- I RAM CONTROL

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_ictl is
begin
ictl_1a15 : dip_9s42_1 port map (p1 => '0', p2 => '0', p3 => '0', p4 => '0', p5 => '0', p6 => '0', p7 => open, p9 => ramdisable, p10 => hi1, p11 => hi1, p12 => \-iwriteda\, p13 => \-promdisabled\, p14 => hi1, p15 => idebug);
ictl_1c16 : \-iwriteda\ <= not iwriteda;
            \-promdisabled\ <= not promdisabled;
            wp5d <= not \-wp5\;
            wp5c <= not \-wp5\;
            wp5b <= not \-wp5\;
            wp5a <= not \-wp5\;
ictl_1c21 : \-pcb0\ <= not pc0;
            \-pcb1\ <= not pc1;
            \-pcb2\ <= not pc2;
            \-pcb3\ <= not pc3;
            \-pcb4\ <= not pc4;
            \-pcb5\ <= not pc5;
ictl_1c26 : dip_74s37 port map (p1 => wp5a, p2 => iwriteda, p3 => \-iwea\, p4 => wp5a, p5 => iwriteda, p6 => \-iweb\, p8 => \-iwei\, p9 => iwriteda, p10 => wp5a, p11 => \-iwej\, p12 => iwriteda, p13 => wp5a);
ictl_1d20 : \-pc13b\ <= not pc13;
            \-pc12b\ <= not pc12;
            iwritedd <= not \-iwrited\;
            iwritedc <= not \-iwrited\;
            iwritedb <= not \-iwrited\;
            iwriteda <= not \-iwrited\;
ictl_1d25 : \-pcb6\ <= not pc6;
            \-pcb7\ <= not pc7;
            \-pcb8\ <= not pc8;
            \-pcb9\ <= not pc9;
            \-pcb10\ <= not pc10;
            \-pcb11\ <= not pc11;
ictl_1d30 : dip_74s139 port map (p1 => ramdisable, p2 => \-pc12b\, p3 => \-pc13b\, p4 => \-ice3a\, p5 => \-ice2a\, p6 => \-ice1a\, p7 => \-ice0a\, p9 => \-ice0b\, p10 => \-ice1b\, p11 => \-ice2b\, p12 => \-ice3b\, p13 => \-pc13b\, p14 => \-pc12b\, p15 => ramdisable);
ictl_2c01 : dip_74s37 port map (p1 => wp5b, p2 => iwritedb, p3 => \-iwec\, p4 => wp5b, p5 => iwritedb, p6 => \-iwed\, p8 => \-iwek\, p9 => iwritedb, p10 => wp5b, p11 => \-iwel\, p12 => iwritedb, p13 => wp5b);
ictl_2c06 : \-pcc0\ <= not pc0;
            \-pcc1\ <= not pc1;
            \-pcc2\ <= not pc2;
            \-pcc3\ <= not pc3;
            \-pcc4\ <= not pc4;
            \-pcc5\ <= not pc5;
ictl_2d10 : \-pcc6\ <= not pc6;
            \-pcc7\ <= not pc7;
            \-pcc8\ <= not pc8;
            \-pcc9\ <= not pc9;
            \-pcc10\ <= not pc10;
            \-pcc11\ <= not pc11;
ictl_2d15 : dip_74s37 port map (p1 => wp5c, p2 => iwritedc, p3 => \-iwee\, p4 => wp5c, p5 => iwritedc, p6 => \-iwef\, p8 => \-iwem\, p9 => iwritedc, p10 => wp5c, p11 => \-iwen\, p12 => iwritedc, p13 => wp5c);
ictl_2d25 : dip_74s139 port map (p1 => ramdisable, p2 => \-pc12b\, p3 => \-pc13b\, p4 => \-ice3c\, p5 => \-ice2c\, p6 => \-ice1c\, p7 => \-ice0c\, p9 => \-ice0d\, p10 => \-ice1d\, p11 => \-ice2d\, p12 => \-ice3d\, p13 => \-pc13b\, p14 => \-pc12b\, p15 => ramdisable);
ictl_2d30 : dip_74s37 port map (p1 => wp5d, p2 => iwritedd, p3 => \-iweg\, p4 => wp5d, p5 => iwritedd, p6 => \-iweh\, p8 => \-iweo\, p9 => iwritedd, p10 => wp5d, p11 => \-iwep\, p12 => iwritedd, p13 => wp5d);
end architecture;
