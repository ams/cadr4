-- ALU1 -- ALU1

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_alu1 is
begin
alu1_2a03 : dip_74s181 port map (p1 => a31a, p2 => m31b, p3 => aluf3a, p4 => aluf2a, p5 => aluf1a, p6 => aluf0a, p7 => \-cin32\, p8 => alumode, p9 => alu32, p10 => open, p11 => open, p13 => open, p14 => open, p15 => open, p16 => open, p17 => open, p18 => '0', p19 => '0', p20 => '0', p21 => '0', p22 => '0', p23 => '0');
alu1_2a04 : m31b <= m31 and hi12;
alu1_2a08 : dip_74s181 port map (p1 => a28, p2 => m28, p3 => aluf3a, p4 => aluf2a, p5 => aluf1a, p6 => aluf0a, p7 => \-cin28\, p8 => alumode, p9 => alu28, p10 => alu29, p11 => alu30, p13 => alu31, p14 => \a=m\, p15 => xout31, p16 => open, p17 => yout31, p18 => a31b, p19 => m31b, p20 => a30, p21 => m30, p22 => a29, p23 => m29);
alu1_2a13 : dip_74s181 port map (p1 => a20, p2 => m20, p3 => aluf3a, p4 => aluf2a, p5 => aluf1a, p6 => aluf0a, p7 => \-cin20\, p8 => alumode, p9 => alu20, p10 => alu21, p11 => alu22, p13 => alu23, p14 => \a=m\, p15 => xout23, p16 => open, p17 => yout23, p18 => a23, p19 => m23, p20 => a22, p21 => m22, p22 => a21, p23 => m21);
alu1_2b08 : dip_74s181 port map (p1 => a24, p2 => m24, p3 => aluf3a, p4 => aluf2a, p5 => aluf1a, p6 => aluf0a, p7 => \-cin24\, p8 => alumode, p9 => alu24, p10 => alu25, p11 => alu26, p13 => alu27, p14 => \a=m\, p15 => xout27, p16 => open, p17 => yout27, p18 => a27, p19 => m27, p20 => a26, p21 => m26, p22 => a25, p23 => m25);
alu1_2b13 : dip_74s181 port map (p1 => a16, p2 => m16, p3 => aluf3a, p4 => aluf2a, p5 => aluf1a, p6 => aluf0a, p7 => \-cin16\, p8 => alumode, p9 => alu16, p10 => alu17, p11 => alu18, p13 => alu19, p14 => \a=m\, p15 => xout19, p16 => open, p17 => yout19, p18 => a19, p19 => m19, p20 => a18, p21 => m18, p22 => a17, p23 => m17);
end architecture;
