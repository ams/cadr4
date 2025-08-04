-- QCTL -- Q REGISTER CONTROL

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_qctl is
begin
qctl_1a18 : \-qdrive\ <= tse2 nand srcq;
qctl_1e12 : dip_74s241 port map (p1 => \-qdrive\, p2 => q7, p3 => mf0, p4 => q6, p5 => mf1, p6 => q5, p7 => mf2, p8 => q4, p9 => mf3, p11 => q3, p12 => mf4, p13 => q2, p14 => mf5, p15 => q1, p16 => mf6, p17 => q0, p18 => mf7, p19 => qdrive);
qctl_1f08 : dip_74s241 port map (p1 => \-qdrive\, p2 => q31, p3 => mf24, p4 => q30, p5 => mf25, p6 => q29, p7 => mf26, p8 => q28, p9 => mf27, p11 => q27, p12 => mf28, p13 => q26, p14 => mf29, p15 => q25, p16 => mf30, p17 => q24, p18 => mf31, p19 => qdrive);
qctl_1f10 : dip_74s241 port map (p1 => \-qdrive\, p2 => q23, p3 => mf16, p4 => q22, p5 => mf17, p6 => q21, p7 => mf18, p8 => q20, p9 => mf19, p11 => q19, p12 => mf20, p13 => q18, p14 => mf21, p15 => q17, p16 => mf22, p17 => q16, p18 => mf23, p19 => qdrive);
qctl_1f15 : dip_74s241 port map (p1 => \-qdrive\, p2 => q15, p3 => mf8, p4 => q14, p5 => mf9, p6 => q13, p7 => mf10, p8 => q12, p9 => mf11, p11 => q11, p12 => mf12, p13 => q10, p14 => mf13, p15 => q9, p16 => mf14, p17 => q8, p18 => mf15, p19 => qdrive);
qctl_2a04 : qdrive <= tse2 and srcq;
qctl_2a05 : srcq <= not \-srcq\;
            \-alu31\ <= not alu31;
qctl_2b19 : qs1 <= \-iralu\ nor \-ir1\;
            qs0 <= \-iralu\ nor \-ir0\;
end architecture;
