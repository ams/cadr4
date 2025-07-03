-- MDS -- MEMORY DATA SELECTOR

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_mds is
begin
mds_1a11 : dip_74s240 port map (p1 => \-memdrive.a\, p2 => \-md31\, p3 => mem24, p4 => \-md30\, p5 => mem25, p6 => \-md29\, p7 => mem26, p8 => \-md28\, p9 => mem27, p11 => \-md27\, p12 => mem28, p13 => \-md26\, p14 => mem29, p15 => \-md25\, p16 => mem30, p17 => \-md24\, p18 => mem31, p19 => \-memdrive.b\);
mds_1a15 : dip_74s240 port map (p1 => \-memdrive.a\, p2 => \-md7\, p3 => mem0, p4 => \-md6\, p5 => mem1, p6 => \-md5\, p7 => mem2, p8 => \-md4\, p9 => mem3, p11 => \-md3\, p12 => mem4, p13 => \-md2\, p14 => mem5, p15 => \-md1\, p16 => mem6, p17 => \-md0\, p18 => mem7, p19 => \-memdrive.b\);
mds_1a17 : dip_74s240 port map (p1 => \-memdrive.a\, p2 => \-md23\, p3 => mem16, p4 => \-md22\, p5 => mem17, p6 => \-md21\, p7 => mem18, p8 => \-md20\, p9 => mem19, p11 => \-md19\, p12 => mem20, p13 => \-md18\, p14 => mem21, p15 => \-md17\, p16 => mem22, p17 => \-md16\, p18 => mem23, p19 => \-memdrive.b\);
mds_1a19 : dip_74s240 port map (p1 => \-memdrive.a\, p2 => \-md15\, p3 => mem8, p4 => \-md14\, p5 => mem9, p6 => \-md13\, p7 => mem10, p8 => \-md12\, p9 => mem11, p11 => \-md11\, p12 => mem12, p13 => \-md10\, p14 => mem13, p15 => \-md9\, p16 => mem14, p17 => \-md8\, p18 => mem15, p19 => \-memdrive.b\);
mds_1a28 : dip_74s258 port map (p1 => mdsela, p2 => mem20, p3 => ob20, p4 => \-mds20\, p5 => mem21, p6 => ob21, p7 => \-mds21\, p9 => \-mds22\, p10 => ob22, p11 => mem22, p12 => \-mds23\, p13 => ob23, p14 => mem23, p15 => gnd);
mds_1a30 : dip_74s258 port map (p1 => mdsela, p2 => mem28, p3 => ob28, p4 => \-mds28\, p5 => mem29, p6 => ob29, p7 => \-mds29\, p9 => \-mds30\, p10 => ob30, p11 => mem30, p12 => \-mds31\, p13 => ob31, p14 => mem31, p15 => gnd);
mds_1b05 : dip_74s240 port map (p1 => \-memdrive.a\, p2 => 'Z', p3 => open, p4 => 'Z', p5 => open, p6 => 'Z', p7 => open, p8 => mdparodd, p9 => open, p11 => 'Z', p12 => \mempar out\, p13 => 'Z', p14 => open, p15 => 'Z', p16 => open, p17 => 'Z', p18 => open, p19 => hi11);
mds_1b27 : dip_74s258 port map (p1 => mdselb, p2 => mem12, p3 => ob12, p4 => \-mds12\, p5 => mem13, p6 => ob13, p7 => \-mds13\, p9 => \-mds14\, p10 => ob14, p11 => mem14, p12 => \-mds15\, p13 => ob15, p14 => mem15, p15 => gnd);
mds_1b30 : dip_74s258 port map (p1 => mdsela, p2 => mem16, p3 => ob16, p4 => \-mds16\, p5 => mem17, p6 => ob17, p7 => \-mds17\, p9 => \-mds18\, p10 => ob18, p11 => mem18, p12 => \-mds19\, p13 => ob19, p14 => mem19, p15 => gnd);
mds_1c26 : dip_74s258 port map (p1 => mdselb, p2 => mem8, p3 => ob8, p4 => \-mds8\, p5 => mem9, p6 => ob9, p7 => \-mds9\, p9 => \-mds10\, p10 => ob10, p11 => mem10, p12 => \-mds11\, p13 => ob11, p14 => mem11, p15 => gnd);
mds_1c29 : dip_74s258 port map (p1 => mdselb, p2 => mem0, p3 => ob0, p4 => \-mds0\, p5 => mem1, p6 => ob1, p7 => \-mds1\, p9 => \-mds2\, p10 => ob2, p11 => mem2, p12 => \-mds3\, p13 => ob3, p14 => mem3, p15 => gnd);
mds_2b02 : dip_74s258 port map (p1 => mdselb, p2 => mem4, p3 => ob4, p4 => \-mds4\, p5 => mem5, p6 => ob5, p7 => \-mds5\, p9 => \-mds6\, p10 => ob6, p11 => mem6, p12 => \-mds7\, p13 => ob7, p14 => mem7, p15 => gnd);
mds_2b05 : dip_74s258 port map (p1 => mdsela, p2 => mem24, p3 => ob24, p4 => \-mds24\, p5 => mem25, p6 => ob25, p7 => \-mds25\, p9 => \-mds26\, p10 => ob26, p11 => mem26, p12 => \-mds27\, p13 => ob27, p14 => mem27, p15 => gnd);
end architecture;
