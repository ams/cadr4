-- ALUC4 -- ALU CARRY AND FUNCTION

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_aluc4 is
signal net_0 : std_logic;
signal net_1 : std_logic;
signal net_2 : std_logic;
signal net_3 : std_logic;
signal net_4 : std_logic;
begin
aluc4_2a16 : aluf0b <= not (\-aluf0\  and \-aluf0\);
             aluf1b <= not (\-aluf1\  and \-aluf1\);
             aluf2b <= not (\-aluf2\  and \-aluf2\);
             aluf3b <= not (\-aluf3\  and \-aluf3\);
aluc4_2a17 : aluf0a <= not (\-aluf0\  and \-aluf0\);
             aluf1a <= not (\-aluf1\  and \-aluf1\);
             aluf2a <= not (\-aluf2\  and \-aluf2\);
             aluf3a <= not (\-aluf3\  and \-aluf3\);
aluc4_2a18 : dip_74s182 port map (p1 => yy1, p2 => xx1, p3 => yy0, p4 => xx0, p5 => '0', p6 => '0', p7 => open, p9 => open, p10 => open, p11 => \-cin32\, p12 => \-cin16\, p13 => \-cin0\, p14 => '0', p15 => '0');
aluc4_2a19 : dip_74s182 port map (p1 => yout23, p2 => xout23, p3 => yout19, p4 => xout19, p5 => yout31, p6 => xout31, p7 => xx1, p9 => \-cin28\, p10 => yy1, p11 => \-cin24\, p12 => \-cin20\, p13 => \-cin16\, p14 => yout27, p15 => xout27);
aluc4_2a20 : dip_74s182 port map (p1 => yout7, p2 => xout7, p3 => yout3, p4 => xout3, p5 => yout15, p6 => xout15, p7 => xx0, p9 => \-cin12\, p10 => yy0, p11 => \-cin8\, p12 => \-cin4\, p13 => \-cin0\, p14 => yout11, p15 => xout11);
aluc4_2b16 : dip_74s153 port map (p1 => gnd, p2 => alusub, p3 => gnd, p4 => hi12, p5 => gnd, p6 => \-ir3\, p7 => \-aluf3\, p9 => \-aluf2\, p10 => \-ir4\, p11 => hi12, p12 => gnd, p13 => gnd, p14 => aluadd, p15 => gnd);
aluc4_2b17 : dip_74s153 port map (p1 => gnd, p2 => alusub, p3 => gnd, p4 => gnd, p5 => hi12, p6 => ir6, p7 => \-aluf1\, p9 => \-aluf0\, p10 => ir5, p11 => gnd, p12 => hi12, p13 => gnd, p14 => aluadd, p15 => gnd);
aluc4_2b18 : dip_74s153 port map (p1 => gnd, p2 => alusub, p3 => gnd, p4 => hi12, p5 => hi12, p6 => ir7, p7 => \-alumode\, p9 => \-cin0\, p10 => \-ir2\, p11 => hi12, p12 => irjump, p13 => gnd, p14 => aluadd, p15 => gnd);
aluc4_2b20 : alumode <= not (\-alumode\  and \-alumode\);
aluc4_2c10 : net_4 <= ir5 nor \-divposlasttime\;
             \-divposlasttime\ <= q0 nor ir6;
             divsubcond <= \-divposlasttime\ nor \-div\;
             divaddcond <= net_4 nor \-div\;
aluc4_2c11 : \-a31\ <= not a31b;
             \-ir4\ <= not ir4;
             \-ir3\ <= not ir3;
             \-ir2\ <= not ir2;
             \-ir1\ <= not ir1;
             \-ir0\ <= not ir0;
aluc4_2c15 : net_1 <= divaddcond nand \-a31\;
             net_0 <= divsubcond nand a31a;
             net_2 <= divsubcond nand \-a31\;
             net_3 <= divaddcond nand a31a;
aluc4_2c20 : dip_74s20o port map (p1 => \-mulnop\, p2 => net_2, p4 => net_3, p5 => \-irjump\, p6 => alusub, p8 => aluadd, p9 => \-mul\, p10 => hi12, p12 => net_0, p13 => net_1);
aluc4_2d15 : dip_74s32o port map (p1 => '0', p2 => '0', p3 => open, p4 => \-mul\, p5 => q0, p6 => \-mulnop\, p8 => open, p9 => '0', p10 => '0', p11 => open, p12 => '0', p13 => '0');
aluc4_2d21 : dip_7428 port map (p1 => osel1a, p2 => \-ir13\, p3 => \-iralu\, p4 => osel0a, p5 => \-ir12\, p6 => \-iralu\, p8 => \-iralu\, p9 => \-ir13\, p10 => osel1b, p11 => \-iralu\, p12 => \-ir12\, p13 => osel0b);
end architecture;
