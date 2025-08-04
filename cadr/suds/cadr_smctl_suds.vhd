-- SMCTL -- SHIFT/MASK CONTROL

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_smctl is
begin
smctl_2d15 : dip_74s32o port map (p1 => \-sh4\, p2 => \-sr\, p3 => \-s4\, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
smctl_2d20 : dip_74s02 port map (p1 => \-mr\, p2 => \-irbyte\, p3 => ir13, p4 => \-sr\, p5 => \-irbyte\, p6 => ir12, p8 => \-ir0\, p9 => \-sr\, p10 => s0, p11 => \-ir1\, p12 => \-sr\, p13 => s1);
smctl_2e10 : dip_74s283 port map (p1 => open, p2 => 'Z', p3 => 'Z', p4 => mskl4, p5 => ir9, p6 => mskr4, p7 => mskl3cry, p9 => open, p10 => open, p11 => 'Z', p12 => 'Z', p13 => open, p14 => 'Z', p15 => 'Z');
smctl_2e14 : dip_74s02o port map (p1 => s3a, p2 => \-sr\, p3 => \-sh3\, p4 => s3b, p5 => \-sh3\, p6 => \-sr\, p8 => \-ir2\, p9 => \-sr\, p10 => s2a, p11 => \-sr\, p12 => \-ir2\, p13 => s2b);
smctl_2e19 : dip_74s02o port map (p1 => s4, p2 => \-sr\, p3 => \-sh4\, p4 => mskr0, p5 => \-mr\, p6 => \-ir0\, p8 => \-ir1\, p9 => \-mr\, p10 => mskr1, p11 => \-ir2\, p12 => \-mr\, p13 => mskr2);
smctl_2e25 : dip_74s283 port map (p1 => mskl1, p2 => mskr1, p3 => ir6, p4 => mskl0, p5 => ir5, p6 => mskr0, p7 => gnd, p9 => mskl3cry, p10 => mskl3, p11 => mskr3, p12 => ir8, p13 => mskl2, p14 => ir7, p15 => mskr2);
smctl_2e30 : dip_74s02o port map (p1 => mskr3, p2 => \-mr\, p3 => \-sh3\, p4 => mskr4, p5 => \-mr\, p6 => \-sh4\, p8 => 'Z', p9 => 'Z', p10 => open, p11 => 'Z', p12 => 'Z', p13 => open);
end architecture;
