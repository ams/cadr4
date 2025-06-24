-- VCTL2 -- VMA/MD CONTROL

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_vctl2 is
begin
vctl2_1c15 : dip_74s02o port map (p1 => mapwr0d, p2 => \-wmapd\, p3 => \-vma26\, p4 => mapwr1d, p5 => \-wmapd\, p6 => \-vma25\, p8 => '0', p9 => '0', p10 => open, p11 => '0', p12 => '0', p13 => open);
vctl2_1d07 : dip_74s37 port map (p1 => mapwr0d, p2 => wp1a, p3 => \-vm0wpa\, p4 => mapwr0d, p5 => wp1a, p6 => \-vm0wpb\, p8 => \-vm1wpa\, p9 => wp1b, p10 => mapwr1d, p11 => \-vm1wpb\, p12 => wp1b, p13 => mapwr1d);
vctl2_1d26 : dip_74s04a port map (p1 => '0', p2 => open, p3 => \-lvmo23\, p4 => \-pfr\, p5 => \-wmap\, p6 => wmap, p8 => \-memrq\, p9 => memrq, p10 => \-memprepare\, p11 => memprepare, p12 => destmem, p13 => \-destmem\);
vctl2_1d27 : dip_74s02o port map (p1 => mdsela, p2 => \-destmdr\, p3 => clk2c, p4 => mdselb, p5 => \-destmdr\, p6 => clk2c, p8 => '0', p9 => '0', p10 => open, p11 => '0', p12 => '0', p13 => open);
vctl2_1d28 : dip_74s08o port map (p1 => \-destvma\, p2 => \-ifetch\, p3 => \-vmaenb\, p4 => \-ifetch\, p5 => hi11, p6 => vmasela, p8 => vmaselb, p9 => hi11, p10 => \-ifetch\, p11 => open, p12 => '0', p13 => '0');
vctl2_1e06 : dip_74s00 port map (p1 => wrcyc, p2 => \lm drive enb\, p3 => \-memdrive.a\, p4 => wrcyc, p5 => \lm drive enb\, p6 => \-memdrive.b\, p8 => open, p9 => '0', p10 => '0', p11 => open, p12 => '0', p13 => '0');
vctl2_3d04 : dip_74s139 port map (p1 => '0', p2 => '0', p3 => '0', p4 => open, p5 => open, p6 => open, p7 => open, p9 => \-wmap\, p10 => \-memwr\, p11 => \-memrd\, p12 => open, p13 => ir20, p14 => ir19, p15 => \-destmem\);
vctl2_3f18 : dip_74s02o port map (p1 => \use.md\, p2 => \-srcmd\, p3 => nopa, p4 => open, p5 => '0', p6 => '0', p8 => '0', p9 => '0', p10 => open, p11 => '0', p12 => '0', p13 => open);
vctl2_3f19 : dip_74s04 port map (p1 => '0', p2 => open, p3 => '0', p4 => open, p5 => '0', p6 => open, p8 => open, p9 => '0', p10 => nopa, p11 => \-nopa\, p12 => open, p13 => '0');
end architecture;
