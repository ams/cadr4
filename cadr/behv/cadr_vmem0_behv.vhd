-- VMEM0 -- VIRTUAL MEMORY MAP STAGE 0

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_vmem0 is
signal net_0 : std_logic;
begin
vmem0_1c01 : dip_74s280 port map (p1 => \-vmap0\, p2 => \-vmap1\, p4 => \-vmap2\, p5 => open, p6 => net_0, p8 => \-vmap3\, p9 => \-vmap4\, p10 => vpari, p11 => gnd, p12 => gnd, p13 => gnd);
vmem0_1c02 : dip_74s280 port map (p1 => \-vma27\, p2 => \-vma28\, p4 => \-vma29\, p5 => vm0pari, p6 => open, p8 => \-vma30\, p9 => \-vma31\, p10 => gnd, p11 => gnd, p12 => gnd, p13 => gnd);
vmem0_1c06 : dip_93425a port map (p1 => \-mapi23\, p2 => mapi22, p3 => mapi21, p4 => mapi20, p5 => mapi19, p6 => mapi18, p7 => \-vmap2\, p9 => mapi17, p10 => mapi16, p11 => mapi15, p12 => mapi14, p13 => mapi13, p14 => \-vm0wpb\, p15 => \-vma29\);
vmem0_1c07 : dip_93425a port map (p1 => mapi23, p2 => mapi22, p3 => mapi21, p4 => mapi20, p5 => mapi19, p6 => mapi18, p7 => \-vmap0\, p9 => mapi17, p10 => mapi16, p11 => mapi15, p12 => mapi14, p13 => mapi13, p14 => \-vm0wpa\, p15 => \-vma27\);
vmem0_1c08 : dip_93425a port map (p1 => mapi23, p2 => mapi22, p3 => mapi21, p4 => mapi20, p5 => mapi19, p6 => mapi18, p7 => \-vmap1\, p9 => mapi17, p10 => mapi16, p11 => mapi15, p12 => mapi14, p13 => mapi13, p14 => \-vm0wpa\, p15 => \-vma28\);
vmem0_1c09 : dip_93425a port map (p1 => mapi23, p2 => mapi22, p3 => mapi21, p4 => mapi20, p5 => mapi19, p6 => mapi18, p7 => \-vmap2\, p9 => mapi17, p10 => mapi16, p11 => mapi15, p12 => mapi14, p13 => mapi13, p14 => \-vm0wpa\, p15 => \-vma29\);
vmem0_1c11 : dip_93425a port map (p1 => \-mapi23\, p2 => mapi22, p3 => mapi21, p4 => mapi20, p5 => mapi19, p6 => mapi18, p7 => \-vmap3\, p9 => mapi17, p10 => mapi16, p11 => mapi15, p12 => mapi14, p13 => mapi13, p14 => \-vm0wpb\, p15 => \-vma30\);
vmem0_1c12 : dip_93425a port map (p1 => \-mapi23\, p2 => mapi22, p3 => mapi21, p4 => mapi20, p5 => mapi19, p6 => mapi18, p7 => \-vmap4\, p9 => mapi17, p10 => mapi16, p11 => mapi15, p12 => mapi14, p13 => mapi13, p14 => \-vm0wpb\, p15 => \-vma31\);
vmem0_1c13 : dip_93425a port map (p1 => mapi23, p2 => mapi22, p3 => mapi21, p4 => mapi20, p5 => mapi19, p6 => mapi18, p7 => \-vmap3\, p9 => mapi17, p10 => mapi16, p11 => mapi15, p12 => mapi14, p13 => mapi13, p14 => \-vm0wpa\, p15 => \-vma30\);
vmem0_1c14 : dip_93425a port map (p1 => mapi23, p2 => mapi22, p3 => mapi21, p4 => mapi20, p5 => mapi19, p6 => mapi18, p7 => \-vmap4\, p9 => mapi17, p10 => mapi16, p11 => mapi15, p12 => mapi14, p13 => mapi13, p14 => \-vm0wpa\, p15 => \-vma31\);
vmem0_1d04 : dip_93425a port map (p1 => \-mapi23\, p2 => mapi22, p3 => mapi21, p4 => mapi20, p5 => mapi19, p6 => mapi18, p7 => vpari, p9 => mapi17, p10 => mapi16, p11 => mapi15, p12 => mapi14, p13 => mapi13, p14 => \-vm0wpb\, p15 => vm0pari);
vmem0_1d05 : dip_93425a port map (p1 => mapi23, p2 => mapi22, p3 => mapi21, p4 => mapi20, p5 => mapi19, p6 => mapi18, p7 => vpari, p9 => mapi17, p10 => mapi16, p11 => mapi15, p12 => mapi14, p13 => mapi13, p14 => \-vm0wpa\, p15 => vm0pari);
vmem0_1d09 : dip_93425a port map (p1 => \-mapi23\, p2 => mapi22, p3 => mapi21, p4 => mapi20, p5 => mapi19, p6 => mapi18, p7 => \-vmap0\, p9 => mapi17, p10 => mapi16, p11 => mapi15, p12 => mapi14, p13 => mapi13, p14 => \-vm0wpb\, p15 => \-vma27\);
vmem0_1d10 : dip_93425a port map (p1 => \-mapi23\, p2 => mapi22, p3 => mapi21, p4 => mapi20, p5 => mapi19, p6 => mapi18, p7 => \-vmap1\, p9 => mapi17, p10 => mapi16, p11 => mapi15, p12 => mapi14, p13 => mapi13, p14 => \-vm0wpb\, p15 => \-vma28\);
vmem0_1d18 : \-mapi23\ <= not mapi23;
vmem0_1d27 : \-use.map\ <= memstart nor srcmap;
vmem0_1e26 : v0parok <= \-use.map\ or net_0;
             vmoparok <= \-use.map\ or vmoparodd;
end architecture;
