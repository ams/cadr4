-- Q -- Q REGISTER

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_q is
begin
q_2c07 : dip_74s194 port map (p1 => hi7, p2 => q23, p3 => alu24, p4 => alu25, p5 => alu26, p6 => alu27, p7 => q28, p9 => qs0, p10 => qs1, p11 => clk2b, p12 => q27, p13 => q26, p14 => q25, p15 => q24);
q_2c08 : dip_74s194 port map (p1 => hi7, p2 => q27, p3 => alu28, p4 => alu29, p5 => alu30, p6 => alu31, p7 => alu0, p9 => qs0, p10 => qs1, p11 => clk2b, p12 => q31, p13 => q30, p14 => q29, p15 => q28);
q_2c12 : dip_74s194 port map (p1 => hi7, p2 => q15, p3 => alu16, p4 => alu17, p5 => alu18, p6 => alu19, p7 => q20, p9 => qs0, p10 => qs1, p11 => clk2b, p12 => q19, p13 => q18, p14 => q17, p15 => q16);
q_2c13 : dip_74s194 port map (p1 => hi7, p2 => q19, p3 => alu20, p4 => alu21, p5 => alu22, p6 => alu23, p7 => q24, p9 => qs0, p10 => qs1, p11 => clk2b, p12 => q23, p13 => q22, p14 => q21, p15 => q20);
q_2c22 : dip_74s194 port map (p1 => hi7, p2 => q7, p3 => alu8, p4 => alu9, p5 => alu10, p6 => alu11, p7 => q12, p9 => qs0, p10 => qs1, p11 => clk2b, p12 => q11, p13 => q10, p14 => q9, p15 => q8);
q_2c23 : dip_74s194 port map (p1 => hi7, p2 => q11, p3 => alu12, p4 => alu13, p5 => alu14, p6 => alu15, p7 => q16, p9 => qs0, p10 => qs1, p11 => clk2b, p12 => q15, p13 => q14, p14 => q13, p15 => q12);
q_2c27 : dip_74s194 port map (p1 => hi7, p2 => \-alu31\, p3 => alu0, p4 => alu1, p5 => alu2, p6 => alu3, p7 => q4, p9 => qs0, p10 => qs1, p11 => clk2b, p12 => q3, p13 => q2, p14 => q1, p15 => q0);
q_2c28 : dip_74s194 port map (p1 => hi7, p2 => q3, p3 => alu4, p4 => alu5, p5 => alu6, p6 => alu7, p7 => q8, p9 => qs0, p10 => qs1, p11 => clk2b, p12 => q7, p13 => q6, p14 => q5, p15 => q4);
end architecture;
