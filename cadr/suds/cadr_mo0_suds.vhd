-- MO0 -- MASKER/OUTPUT SELECT

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_mo0 is
begin
mo0_2a24 : dip_74s151 port map (p1 => alu15, p2 => alu15, p3 => r15, p4 => a15, p5 => ob15, p6 => open, p7 => gnd, p9 => osel1b, p10 => osel0b, p11 => msk15, p12 => alu14, p13 => alu14, p14 => alu16, p15 => alu16);
mo0_2a25 : dip_74s151 port map (p1 => alu14, p2 => alu14, p3 => r14, p4 => a14, p5 => ob14, p6 => open, p7 => gnd, p9 => osel1b, p10 => osel0b, p11 => msk14, p12 => alu13, p13 => alu13, p14 => alu15, p15 => alu15);
mo0_2a29 : dip_74s151 port map (p1 => alu13, p2 => alu13, p3 => r13, p4 => a13, p5 => ob13, p6 => open, p7 => gnd, p9 => osel1b, p10 => osel0b, p11 => msk13, p12 => alu12, p13 => alu12, p14 => alu14, p15 => alu14);
mo0_2a30 : dip_74s151 port map (p1 => alu12, p2 => alu12, p3 => r12, p4 => a12, p5 => ob12, p6 => open, p7 => gnd, p9 => osel1b, p10 => osel0b, p11 => msk12, p12 => alu11, p13 => alu11, p14 => alu13, p15 => alu13);
mo0_2b24 : dip_74s151 port map (p1 => alu7, p2 => alu7, p3 => r7, p4 => a7, p5 => ob7, p6 => open, p7 => gnd, p9 => osel1b, p10 => osel0b, p11 => msk7, p12 => alu6, p13 => alu6, p14 => alu8, p15 => alu8);
mo0_2b25 : dip_74s151 port map (p1 => alu6, p2 => alu6, p3 => r6, p4 => a6, p5 => ob6, p6 => open, p7 => gnd, p9 => osel1b, p10 => osel0b, p11 => msk6, p12 => alu5, p13 => alu5, p14 => alu7, p15 => alu7);
mo0_2b29 : dip_74s151 port map (p1 => alu5, p2 => alu5, p3 => r5, p4 => a5, p5 => ob5, p6 => open, p7 => gnd, p9 => osel1b, p10 => osel0b, p11 => msk5, p12 => alu4, p13 => alu4, p14 => alu6, p15 => alu6);
mo0_2b30 : dip_74s151 port map (p1 => alu4, p2 => alu4, p3 => r4, p4 => a4, p5 => ob4, p6 => open, p7 => gnd, p9 => osel1b, p10 => osel0b, p11 => msk4, p12 => alu3, p13 => alu3, p14 => alu5, p15 => alu5);
mo0_2c19 : dip_74s151 port map (p1 => alu11, p2 => alu11, p3 => r11, p4 => a11, p5 => ob11, p6 => open, p7 => gnd, p9 => osel1b, p10 => osel0b, p11 => msk11, p12 => alu10, p13 => alu10, p14 => alu12, p15 => alu12);
mo0_2c24 : dip_74s151 port map (p1 => alu10, p2 => alu10, p3 => r10, p4 => a10, p5 => ob10, p6 => open, p7 => gnd, p9 => osel1b, p10 => osel0b, p11 => msk10, p12 => alu9, p13 => alu9, p14 => alu11, p15 => alu11);
mo0_2c29 : dip_74s151 port map (p1 => alu3, p2 => alu3, p3 => r3, p4 => a3, p5 => ob3, p6 => open, p7 => gnd, p9 => osel1b, p10 => osel0b, p11 => msk3, p12 => alu2, p13 => alu2, p14 => alu4, p15 => alu4);
mo0_2c30 : dip_74s151 port map (p1 => alu2, p2 => alu2, p3 => r2, p4 => a2, p5 => ob2, p6 => open, p7 => gnd, p9 => osel1b, p10 => osel0b, p11 => msk2, p12 => alu1, p13 => alu1, p14 => alu3, p15 => alu3);
mo0_2d23 : dip_74s151 port map (p1 => alu9, p2 => alu9, p3 => r9, p4 => a9, p5 => ob9, p6 => open, p7 => gnd, p9 => osel1b, p10 => osel0b, p11 => msk9, p12 => alu8, p13 => alu8, p14 => alu10, p15 => alu10);
mo0_2d24 : dip_74s151 port map (p1 => alu8, p2 => alu8, p3 => r8, p4 => a8, p5 => ob8, p6 => open, p7 => gnd, p9 => osel1b, p10 => osel0b, p11 => msk8, p12 => alu7, p13 => alu7, p14 => alu9, p15 => alu9);
mo0_2d28 : dip_74s151 port map (p1 => alu1, p2 => alu1, p3 => r1, p4 => a1, p5 => ob1, p6 => open, p7 => gnd, p9 => osel1b, p10 => osel0b, p11 => msk1, p12 => alu0, p13 => alu0, p14 => alu2, p15 => alu2);
mo0_2d29 : dip_74s151 port map (p1 => alu0, p2 => alu0, p3 => r0, p4 => a0, p5 => ob0, p6 => open, p7 => gnd, p9 => osel1b, p10 => osel0b, p11 => msk0, p12 => q31, p13 => q31, p14 => alu1, p15 => alu1);
end architecture;
