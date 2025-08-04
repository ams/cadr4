-- SMCTL -- SHIFT/MASK CONTROL

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_smctl is
begin
smctl_2d15 : \-s4\ <= \-sh4\ or \-sr\;
smctl_2d20 : \-mr\ <= \-irbyte\ nor ir13;
             \-sr\ <= \-irbyte\ nor ir12;
             s0 <= \-ir0\ nor \-sr\;
             s1 <= \-ir1\ nor \-sr\;
smctl_2e10 : dip_74s283 port map (p1 => open, p2 => '0', p3 => '0', p4 => mskl4, p5 => ir9, p6 => mskr4, p7 => mskl3cry, p9 => open, p10 => open, p11 => '0', p12 => '0', p13 => open, p14 => '0', p15 => '0');
smctl_2e14 : s3a <= \-sr\ nor \-sh3\;
             s3b <= \-sh3\ nor \-sr\;
             s2a <= \-ir2\ nor \-sr\;
             s2b <= \-sr\ nor \-ir2\;
smctl_2e19 : s4 <=  \-sr\ nor \-sh4\;
             mskr0 <= \-mr\ nor \-ir0\;
             mskr1 <= \-ir1\ nor \-mr\;
             mskr2 <= \-ir2\ nor \-mr\;
smctl_2e25 : dip_74s283 port map (p1 => mskl1, p2 => mskr1, p3 => ir6, p4 => mskl0, p5 => ir5, p6 => mskr0, p7 => gnd, p9 => mskl3cry, p10 => mskl3, p11 => mskr3, p12 => ir8, p13 => mskl2, p14 => ir7, p15 => mskr2);
smctl_2e30 : mskr3 <= \-mr\ nor \-sh3\;
             mskr4 <= \-mr\ nor \-sh4\;
end architecture;
