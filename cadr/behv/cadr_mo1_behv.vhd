-- MO1 -- MASKER/OUTPUT SELECT

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_mo1 is
begin
mo1_2a09 : dip_74s151 port map (p1 => alu31, p2 => alu31, p3 => r31, p4 => a31b, p5 => ob31, p6 => open, p7 => gnd, p9 => osel1a, p10 => osel0a, p11 => msk31, p12 => alu30, p13 => alu30, p14 => alu32, p15 => alu32);
mo1_2a10 : dip_74s151 port map (p1 => alu30, p2 => alu30, p3 => r30, p4 => a30, p5 => ob30, p6 => open, p7 => gnd, p9 => osel1a, p10 => osel0a, p11 => msk30, p12 => alu29, p13 => alu29, p14 => alu31, p15 => alu31);
mo1_2a14 : dip_74s151 port map (p1 => alu29, p2 => alu29, p3 => r29, p4 => a29, p5 => ob29, p6 => open, p7 => gnd, p9 => osel1a, p10 => osel0a, p11 => msk29, p12 => alu28, p13 => alu28, p14 => alu30, p15 => alu30);
mo1_2a15 : dip_74s151 port map (p1 => alu28, p2 => alu28, p3 => r28, p4 => a28, p5 => ob28, p6 => open, p7 => gnd, p9 => osel1a, p10 => osel0a, p11 => msk28, p12 => alu27, p13 => alu27, p14 => alu29, p15 => alu29);
mo1_2b09 : dip_74s151 port map (p1 => alu23, p2 => alu23, p3 => r23, p4 => a23, p5 => ob23, p6 => open, p7 => gnd, p9 => osel1a, p10 => osel0a, p11 => msk23, p12 => alu22, p13 => alu22, p14 => alu24, p15 => alu24);
mo1_2b10 : dip_74s151 port map (p1 => alu22, p2 => alu22, p3 => r22, p4 => a22, p5 => ob22, p6 => open, p7 => gnd, p9 => osel1a, p10 => osel0a, p11 => msk22, p12 => alu21, p13 => alu21, p14 => alu23, p15 => alu23);
mo1_2b14 : dip_74s151 port map (p1 => alu21, p2 => alu21, p3 => r21, p4 => a21, p5 => ob21, p6 => open, p7 => gnd, p9 => osel1a, p10 => osel0a, p11 => msk21, p12 => alu20, p13 => alu20, p14 => alu22, p15 => alu22);
mo1_2b15 : dip_74s151 port map (p1 => alu20, p2 => alu20, p3 => r20, p4 => a20, p5 => ob20, p6 => open, p7 => gnd, p9 => osel1a, p10 => osel0a, p11 => msk20, p12 => alu19, p13 => alu19, p14 => alu21, p15 => alu21);
mo1_2c09 : dip_74s151 port map (p1 => alu27, p2 => alu27, p3 => r27, p4 => a27, p5 => ob27, p6 => open, p7 => gnd, p9 => osel1a, p10 => osel0a, p11 => msk27, p12 => alu26, p13 => alu26, p14 => alu28, p15 => alu28);
mo1_2c14 : dip_74s151 port map (p1 => alu24, p2 => alu24, p3 => r24, p4 => a24, p5 => ob24, p6 => open, p7 => gnd, p9 => osel1a, p10 => osel0a, p11 => msk24, p12 => alu23, p13 => alu23, p14 => alu25, p15 => alu25);
mo1_2d04 : dip_74s151 port map (p1 => alu26, p2 => alu26, p3 => r26, p4 => a26, p5 => ob26, p6 => open, p7 => gnd, p9 => osel1a, p10 => osel0a, p11 => msk26, p12 => alu25, p13 => alu25, p14 => alu27, p15 => alu27);
mo1_2d09 : dip_74s151 port map (p1 => alu25, p2 => alu25, p3 => r25, p4 => a25, p5 => ob25, p6 => open, p7 => gnd, p9 => osel1a, p10 => osel0a, p11 => msk25, p12 => alu24, p13 => alu24, p14 => alu26, p15 => alu26);
mo1_2d13 : dip_74s151 port map (p1 => alu19, p2 => alu19, p3 => r19, p4 => a19, p5 => ob19, p6 => open, p7 => gnd, p9 => osel1a, p10 => osel0a, p11 => msk19, p12 => alu18, p13 => alu18, p14 => alu20, p15 => alu20);
mo1_2d14 : dip_74s151 port map (p1 => alu18, p2 => alu18, p3 => r18, p4 => a18, p5 => ob18, p6 => open, p7 => gnd, p9 => osel1a, p10 => osel0a, p11 => msk18, p12 => alu17, p13 => alu17, p14 => alu19, p15 => alu19);
mo1_2d18 : dip_74s151 port map (p1 => alu17, p2 => alu17, p3 => r17, p4 => a17, p5 => ob17, p6 => open, p7 => gnd, p9 => osel1a, p10 => osel0a, p11 => msk17, p12 => alu16, p13 => alu16, p14 => alu18, p15 => alu18);
mo1_2d19 : dip_74s151 port map (p1 => alu16, p2 => alu16, p3 => r16, p4 => a16, p5 => ob16, p6 => open, p7 => gnd, p9 => osel1a, p10 => osel0a, p11 => msk16, p12 => alu15, p13 => alu15, p14 => alu17, p15 => alu17);
end architecture;
