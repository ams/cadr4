-- VCTL2 -- VMA/MD CONTROL

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_vctl2 is
begin
vctl2_1c15 : mapwr0d <=  \-wmapd\ nor \-vma26\;
             mapwr1d <= \-wmapd\ nor \-vma25\;
vctl2_1d07 : \-vm0wpa\  <= not (mapwr0d and wp1a);
             \-vm0wpb\  <= not (mapwr0d and wp1a);
             \-vm1wpa\  <= not (wp1b and mapwr1d);
             \-vm1wpb\  <= not (wp1b and mapwr1d);
vctl2_1d26 : \-pfr\ <= not \-lvmo23\;
             wmap <= not \-wmap\;
             \-memrq\ <= not memrq;
             \-memprepare\ <= not memprepare;
             destmem <= not \-destmem\;
vctl2_1d27 : mdsela <=  \-destmdr\ nor clk2c;
             mdselb <= \-destmdr\ nor clk2c;
vctl2_1d28 : \-vmaenb\ <= \-destvma\ and \-ifetch\;
             vmasela <= \-ifetch\ and hi11;
             vmaselb <= hi11 and \-ifetch\;
vctl2_1e06 : \-memdrive.a\ <= wrcyc nand \lm drive enb\;
             \-memdrive.b\ <= wrcyc nand \lm drive enb\;
vctl2_3d04 : dip_74s139 port map (p1 => '0', p2 => '0', p3 => '0', p4 => open, p5 => open, p6 => open, p7 => open, p9 => \-wmap\, p10 => \-memwr\, p11 => \-memrd\, p12 => open, p13 => ir20, p14 => ir19, p15 => \-destmem\);
vctl2_3f18 : \use.md\ <=  \-srcmd\ nor nopa;
vctl2_3f19 : nopa <= not \-nopa\;
end architecture;
