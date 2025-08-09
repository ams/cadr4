-- ICTL -- I RAM CONTROL

library work;
use work.dip.all;
use work.misc.all;

architecture suds of icmem_ictl is
begin
ictl_1a15 : dip_9s42 port map (p1 => 'Z', p2 => 'Z', p3 => 'Z', p4 => 'Z', p5 => 'Z', p6 => 'Z', p7 => open, p9 => ramdisable, p10 => hi1, p11 => hi1, p12 => \-iwriteda\, p13 => \-promdisabled\, p14 => hi1, p15 => idebug);
ictl_1c16 : dip_74s04 port map (p1 => iwriteda, p2 => \-iwriteda\, p3 => promdisabled, p4 => \-promdisabled\, p5 => \-wp5\, p6 => wp5d, p8 => wp5c, p9 => \-wp5\, p10 => wp5b, p11 => \-wp5\, p12 => wp5a, p13 => \-wp5\);
ictl_1c21 : dip_74s04 port map (p1 => pc0, p2 => \-pcb0\, p3 => pc1, p4 => \-pcb1\, p5 => pc2, p6 => \-pcb2\, p8 => \-pcb3\, p9 => pc3, p10 => \-pcb4\, p11 => pc4, p12 => \-pcb5\, p13 => pc5);
ictl_1c26 : dip_74s37 port map (p1 => wp5a, p2 => iwriteda, p3 => \-iwea\, p4 => wp5a, p5 => iwriteda, p6 => \-iweb\, p8 => \-iwei\, p9 => iwriteda, p10 => wp5a, p11 => \-iwej\, p12 => iwriteda, p13 => wp5a);
ictl_1d20 : dip_74s04 port map (p1 => pc13, p2 => \-pc13b\, p3 => pc12, p4 => \-pc12b\, p5 => \-iwrited\, p6 => iwritedd, p8 => iwritedc, p9 => \-iwrited\, p10 => iwritedb, p11 => \-iwrited\, p12 => iwriteda, p13 => \-iwrited\);
ictl_1d25 : dip_74s04 port map (p1 => pc6, p2 => \-pcb6\, p3 => pc7, p4 => \-pcb7\, p5 => pc8, p6 => \-pcb8\, p8 => \-pcb9\, p9 => pc9, p10 => \-pcb10\, p11 => pc10, p12 => \-pcb11\, p13 => pc11);
ictl_1d30 : dip_74s139 port map (p1 => ramdisable, p2 => \-pc12b\, p3 => \-pc13b\, p4 => \-ice3a\, p5 => \-ice2a\, p6 => \-ice1a\, p7 => \-ice0a\, p9 => \-ice0b\, p10 => \-ice1b\, p11 => \-ice2b\, p12 => \-ice3b\, p13 => \-pc13b\, p14 => \-pc12b\, p15 => ramdisable);
ictl_2c01 : dip_74s37 port map (p1 => wp5b, p2 => iwritedb, p3 => \-iwec\, p4 => wp5b, p5 => iwritedb, p6 => \-iwed\, p8 => \-iwek\, p9 => iwritedb, p10 => wp5b, p11 => \-iwel\, p12 => iwritedb, p13 => wp5b);
ictl_2c06 : dip_74s04 port map (p1 => pc0, p2 => \-pcc0\, p3 => pc1, p4 => \-pcc1\, p5 => pc2, p6 => \-pcc2\, p8 => \-pcc3\, p9 => pc3, p10 => \-pcc4\, p11 => pc4, p12 => \-pcc5\, p13 => pc5);
ictl_2d10 : dip_74s04 port map (p1 => pc6, p2 => \-pcc6\, p3 => pc7, p4 => \-pcc7\, p5 => pc8, p6 => \-pcc8\, p8 => \-pcc9\, p9 => pc9, p10 => \-pcc10\, p11 => pc10, p12 => \-pcc11\, p13 => pc11);
ictl_2d15 : dip_74s37 port map (p1 => wp5c, p2 => iwritedc, p3 => \-iwee\, p4 => wp5c, p5 => iwritedc, p6 => \-iwef\, p8 => \-iwem\, p9 => iwritedc, p10 => wp5c, p11 => \-iwen\, p12 => iwritedc, p13 => wp5c);
ictl_2d25 : dip_74s139 port map (p1 => ramdisable, p2 => \-pc12b\, p3 => \-pc13b\, p4 => \-ice3c\, p5 => \-ice2c\, p6 => \-ice1c\, p7 => \-ice0c\, p9 => \-ice0d\, p10 => \-ice1d\, p11 => \-ice2d\, p12 => \-ice3d\, p13 => \-pc13b\, p14 => \-pc12b\, p15 => ramdisable);
ictl_2d30 : dip_74s37 port map (p1 => wp5d, p2 => iwritedd, p3 => \-iweg\, p4 => wp5d, p5 => iwritedd, p6 => \-iweh\, p8 => \-iweo\, p9 => iwritedd, p10 => wp5d, p11 => \-iwep\, p12 => iwritedd, p13 => wp5d);
end architecture;
