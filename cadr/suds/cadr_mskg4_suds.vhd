-- MSKG4 -- MASK GENERATION

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_mskg4 is
begin
mskg4_2d11 : dip_5600 generic map (fn => "rom/mskg4.2d11.hex") port map (p1 => msk24, p2 => msk25, p3 => msk26, p4 => msk27, p5 => msk28, p6 => msk29, p7 => msk30, p9 => msk31, p10 => mskl0, p11 => mskl1, p12 => mskl2, p13 => mskl3, p14 => mskl4, p15 => gnd);
mskg4_2d12 : dip_5600 generic map (fn => "rom/mskg4.2d12.hex") port map (p1 => msk24, p2 => msk25, p3 => msk26, p4 => msk27, p5 => msk28, p6 => msk29, p7 => msk30, p9 => msk31, p10 => mskr0, p11 => mskr1, p12 => mskr2, p13 => mskr3, p14 => mskr4, p15 => gnd);
mskg4_2d16 : dip_5600 generic map (fn => "rom/mskg4.2d16.hex") port map (p1 => msk8, p2 => msk9, p3 => msk10, p4 => msk11, p5 => msk12, p6 => msk13, p7 => msk14, p9 => msk15, p10 => mskl0, p11 => mskl1, p12 => mskl2, p13 => mskl3, p14 => mskl4, p15 => gnd);
mskg4_2d17 : dip_5600 generic map (fn => "rom/mskg4.2d17.hex") port map (p1 => msk8, p2 => msk9, p3 => msk10, p4 => msk11, p5 => msk12, p6 => msk13, p7 => msk14, p9 => msk15, p10 => mskr0, p11 => mskr1, p12 => mskr2, p13 => mskr3, p14 => mskr4, p15 => gnd);
mskg4_2d26 : dip_74s04a port map (p1 => 'Z', p2 => open, p3 => ir31, p4 => \-ir31\, p5 => ir13, p6 => \-ir13\, p8 => \-ir12\, p9 => ir12, p10 => open, p11 => 'Z', p12 => open, p13 => 'Z');
mskg4_2e11 : dip_5600 generic map (fn => "rom/mskg4.2e11.hex") port map (p1 => msk16, p2 => msk17, p3 => msk18, p4 => msk19, p5 => msk20, p6 => msk21, p7 => msk22, p9 => msk23, p10 => mskl0, p11 => mskl1, p12 => mskl2, p13 => mskl3, p14 => mskl4, p15 => gnd);
mskg4_2e12 : dip_5600 generic map (fn => "rom/mskg4.2e12.hex") port map (p1 => msk16, p2 => msk17, p3 => msk18, p4 => msk19, p5 => msk20, p6 => msk21, p7 => msk22, p9 => msk23, p10 => mskr0, p11 => mskr1, p12 => mskr2, p13 => mskr3, p14 => mskr4, p15 => gnd);
mskg4_2e15 : dip_res20 port map (p2 => \a=m\, p3 => msk31, p4 => msk30, p5 => msk29, p6 => msk28, p7 => msk27, p8 => msk26, p9 => msk25, p10 => open, p11 => msk24, p12 => msk23, p13 => msk22, p14 => msk21, p15 => msk20, p16 => msk19, p17 => msk18, p18 => msk17, p19 => msk16);
mskg4_2e16 : dip_5600 generic map (fn => "rom/mskg4.2e16.hex") port map (p1 => msk0, p2 => msk1, p3 => msk2, p4 => msk3, p5 => msk4, p6 => msk5, p7 => msk6, p9 => msk7, p10 => mskl0, p11 => mskl1, p12 => mskl2, p13 => mskl3, p14 => mskl4, p15 => gnd);
mskg4_2e17 : dip_5600 generic map (fn => "rom/mskg4.2e17.hex") port map (p1 => msk0, p2 => msk1, p3 => msk2, p4 => msk3, p5 => msk4, p6 => msk5, p7 => msk6, p9 => msk7, p10 => mskr0, p11 => mskr1, p12 => mskr2, p13 => mskr3, p14 => mskr4, p15 => gnd);
mskg4_2e20 : dip_res20 port map (p2 => open, p3 => msk15, p4 => msk14, p5 => msk13, p6 => msk12, p7 => msk11, p8 => msk10, p9 => msk9, p10 => open, p11 => msk8, p12 => msk7, p13 => msk6, p14 => msk5, p15 => msk4, p16 => msk3, p17 => msk2, p18 => msk1, p19 => msk0);
end architecture;
