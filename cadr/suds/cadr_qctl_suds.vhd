-- QCTL -- Q REGISTER CONTROL

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_qctl is
begin
qctl_1a18 : dip_74s00 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => \-qdrive\, p9 => tse2, p10 => srcq, p11 => open, p12 => 'Z', p13 => 'Z');
qctl_1e12 : dip_74s241 port map (p1 => \-qdrive\, p2 => q7, p3 => mf0, p4 => q6, p5 => mf1, p6 => q5, p7 => mf2, p8 => q4, p9 => mf3, p11 => q3, p12 => mf4, p13 => q2, p14 => mf5, p15 => q1, p16 => mf6, p17 => q0, p18 => mf7, p19 => qdrive);
qctl_1f08 : dip_74s241 port map (p1 => \-qdrive\, p2 => q31, p3 => mf24, p4 => q30, p5 => mf25, p6 => q29, p7 => mf26, p8 => q28, p9 => mf27, p11 => q27, p12 => mf28, p13 => q26, p14 => mf29, p15 => q25, p16 => mf30, p17 => q24, p18 => mf31, p19 => qdrive);
qctl_1f10 : dip_74s241 port map (p1 => \-qdrive\, p2 => q23, p3 => mf16, p4 => q22, p5 => mf17, p6 => q21, p7 => mf18, p8 => q20, p9 => mf19, p11 => q19, p12 => mf20, p13 => q18, p14 => mf21, p15 => q17, p16 => mf22, p17 => q16, p18 => mf23, p19 => qdrive);
qctl_1f15 : dip_74s241 port map (p1 => \-qdrive\, p2 => q15, p3 => mf8, p4 => q14, p5 => mf9, p6 => q13, p7 => mf10, p8 => q12, p9 => mf11, p11 => q11, p12 => mf12, p13 => q10, p14 => mf13, p15 => q9, p16 => mf14, p17 => q8, p18 => mf15, p19 => qdrive);
qctl_2a04 : dip_74s08 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => qdrive, p12 => tse2, p13 => srcq);
qctl_2a05 : dip_74s04 port map (p1 => 'Z', p2 => open, p3 => 'Z', p4 => open, p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => srcq, p11 => \-srcq\, p12 => \-alu31\, p13 => alu31);
qctl_2b19 : dip_7428 port map (p1 => open, p2 => 'Z', p3 => 'Z', p4 => open, p5 => 'Z', p6 => 'Z', p8 => \-iralu\, p9 => \-ir1\, p10 => qs1, p11 => \-iralu\, p12 => \-ir0\, p13 => qs0);
end architecture;
