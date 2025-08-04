-- MD -- MEMORY DATA REGISTER

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_md is
begin
md_1a02 : dip_74s240 port map (p1 => \-mddrive\, p2 => \-md31\, p3 => mf24, p4 => \-md30\, p5 => mf25, p6 => \-md29\, p7 => mf26, p8 => \-md28\, p9 => mf27, p11 => \-md27\, p12 => mf28, p13 => \-md26\, p14 => mf29, p15 => \-md25\, p16 => mf30, p17 => \-md24\, p18 => mf31, p19 => \-mddrive\);
md_1a04 : dip_74s240 port map (p1 => \-mddrive\, p2 => \-md23\, p3 => mf16, p4 => \-md22\, p5 => mf17, p6 => \-md21\, p7 => mf18, p8 => \-md20\, p9 => mf19, p11 => \-md19\, p12 => mf20, p13 => \-md18\, p14 => mf21, p15 => \-md17\, p16 => mf22, p17 => \-md16\, p18 => mf23, p19 => \-mddrive\);
md_1a05 : dip_74s240 port map (p1 => \-mddrive\, p2 => \-md7\, p3 => mf0, p4 => \-md6\, p5 => mf1, p6 => \-md5\, p7 => mf2, p8 => \-md4\, p9 => mf3, p11 => \-md3\, p12 => mf4, p13 => \-md2\, p14 => mf5, p15 => \-md1\, p16 => mf6, p17 => \-md0\, p18 => mf7, p19 => \-mddrive\);
md_1a08 : dip_74s00 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => srcmd, p5 => tse2, p6 => \-mddrive\, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
md_1a09 : dip_74s240 port map (p1 => \-mddrive\, p2 => \-md15\, p3 => mf8, p4 => \-md14\, p5 => mf9, p6 => \-md13\, p7 => mf10, p8 => \-md12\, p9 => mf11, p11 => \-md11\, p12 => mf12, p13 => \-md10\, p14 => mf13, p15 => \-md9\, p16 => mf14, p17 => \-md8\, p18 => mf15, p19 => \-mddrive\);
md_1b16 : dip_74s374 port map (p1 => gnd, p2 => \-md31\, p3 => \-mds31\, p4 => \-mds30\, p5 => \-md30\, p6 => \-md29\, p7 => \-mds29\, p8 => \-mds28\, p9 => \-md28\, p11 => mdclk, p12 => \-md27\, p13 => \-mds27\, p14 => \-mds26\, p15 => \-md26\, p16 => \-md25\, p17 => \-mds25\, p18 => \-mds24\, p19 => \-md24\);
md_1c17 : dip_74s374 port map (p1 => gnd, p2 => \-md7\, p3 => \-mds7\, p4 => \-mds6\, p5 => \-md6\, p6 => \-md5\, p7 => \-mds5\, p8 => \-mds4\, p9 => \-md4\, p11 => mdclk, p12 => \-md3\, p13 => \-mds3\, p14 => \-mds2\, p15 => \-md2\, p16 => \-md1\, p17 => \-mds1\, p18 => \-mds0\, p19 => \-md0\);
md_1c19 : dip_74s374 port map (p1 => gnd, p2 => \-md23\, p3 => \-mds23\, p4 => \-mds22\, p5 => \-md22\, p6 => \-md21\, p7 => \-mds21\, p8 => \-mds20\, p9 => \-md20\, p11 => mdclk, p12 => \-md19\, p13 => \-mds19\, p14 => \-mds18\, p15 => \-md18\, p16 => \-md17\, p17 => \-mds17\, p18 => \-mds16\, p19 => \-md16\);
md_1d16 : dip_74s51 port map (p1 => 'Z', p2 => destmdr, p3 => \-clk2c\, p4 => loadmd, p5 => loadmd, p6 => mdclk, p8 => open, p9 => 'Z', p10 => 'Z', p13 => 'Z');
md_1d18 : dip_74s04 port map (p1 => 'Z', p2 => open, p3 => 'Z', p4 => open, p5 => 'Z', p6 => open, p8 => loadmd, p9 => \-loadmd\, p10 => destmdr, p11 => \-destmdr\, p12 => open, p13 => 'Z');
md_1d20 : dip_74s374 port map (p1 => gnd, p2 => \-md15\, p3 => \-mds15\, p4 => \-mds14\, p5 => \-md14\, p6 => \-md13\, p7 => \-mds13\, p8 => \-mds12\, p9 => \-md12\, p11 => mdclk, p12 => \-md11\, p13 => \-mds11\, p14 => \-mds10\, p15 => \-md10\, p16 => \-md9\, p17 => \-mds9\, p18 => \-mds8\, p19 => \-md8\);
md_1e07 : dip_74s08 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => mdgetspar, p9 => \-destmdr\, p10 => \-ignpar\, p11 => open, p12 => 'Z', p13 => 'Z');
md_1e19 : dip_74s374 port map (p1 => gnd, p2 => open, p3 => 'Z', p4 => 'Z', p5 => open, p6 => open, p7 => 'Z', p8 => 'Z', p9 => open, p11 => mdclk, p12 => open, p13 => 'Z', p14 => 'Z', p15 => open, p16 => mdhaspar, p17 => mdgetspar, p18 => \mempar in\, p19 => mdpar);
md_2a05 : dip_74s04 port map (p1 => 'Z', p2 => open, p3 => \-srcmd\, p4 => srcmd, p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => open, p11 => 'Z', p12 => open, p13 => 'Z');
end architecture;
