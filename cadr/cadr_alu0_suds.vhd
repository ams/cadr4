-- ALU0 -- ALU0

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_alu0 is
begin
alu0_2a23 : dip_74s181 port map (p1 => a12, p2 => m12, p3 => aluf3b, p4 => aluf2b, p5 => aluf1b, p6 => aluf0b, p7 => \-cin12\, p8 => alumode, p9 => alu12, p10 => alu13, p11 => alu14, p13 => alu15, p14 => \a=m\, p15 => xout15, p16 => open, p17 => yout15, p18 => a15, p19 => m15, p20 => a14, p21 => m14, p22 => a13, p23 => m13);
alu0_2a28 : dip_74s181 port map (p1 => a4, p2 => m4, p3 => aluf3b, p4 => aluf2b, p5 => aluf1b, p6 => aluf0b, p7 => \-cin4\, p8 => alumode, p9 => alu4, p10 => alu5, p11 => alu6, p13 => alu7, p14 => \a=m\, p15 => xout7, p16 => open, p17 => yout7, p18 => a7, p19 => m7, p20 => a6, p21 => m6, p22 => a5, p23 => m5);
alu0_2b23 : dip_74s181 port map (p1 => a8, p2 => m8, p3 => aluf3b, p4 => aluf2b, p5 => aluf1b, p6 => aluf0b, p7 => \-cin8\, p8 => alumode, p9 => alu8, p10 => alu9, p11 => alu10, p13 => alu11, p14 => \a=m\, p15 => xout11, p16 => open, p17 => yout11, p18 => a11, p19 => m11, p20 => a10, p21 => m10, p22 => a9, p23 => m9);
alu0_2b28 : dip_74s181 port map (p1 => a0, p2 => m0, p3 => aluf3b, p4 => aluf2b, p5 => aluf1b, p6 => aluf0b, p7 => \-cin0\, p8 => alumode, p9 => alu0, p10 => alu1, p11 => alu2, p13 => alu3, p14 => \a=m\, p15 => xout3, p16 => open, p17 => yout3, p18 => a3, p19 => m3, p20 => a2, p21 => m2, p22 => a1, p23 => m1);
end architecture;
