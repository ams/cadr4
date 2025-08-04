-- VMEM1 -- VIRTUAL MEMORY MAP STAGE 1

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_vmem1 is
begin
vmem1_1c03 : dip_93s48 port map (p1 => \-vma17\, p2 => \-vma18\, p3 => \-vma19\, p4 => \-vma20\, p5 => \-vma21\, p6 => \-vma22\, p7 => \-vma23\, p9 => vm1mpar, p10 => open, p11 => \-vma12\, p12 => \-vma13\, p13 => \-vma14\, p14 => \-vma15\, p15 => \-vma16\);
vmem1_1c04 : dip_93s48 port map (p1 => \-vma5\, p2 => \-vma6\, p3 => \-vma7\, p4 => \-vma8\, p5 => \-vma9\, p6 => \-vma10\, p7 => \-vma11\, p9 => open, p10 => \-vm1lpar\, p11 => \-vma0\, p12 => \-vma1\, p13 => \-vma2\, p14 => \-vma3\, p15 => \-vma4\);
vmem1_1d01 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => vmap4a, p3 => vmap3a, p4 => vmap2a, p5 => vmap1a, p6 => vmap0a, p7 => \-vmo10\, p9 => \-mapi12a\, p10 => \-mapi11a\, p11 => \-mapi10a\, p12 => \-mapi9a\, p13 => \-mapi8a\, p14 => \-vm1wpa\, p15 => \-vma10\);
vmem1_1d02 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => vmap4a, p3 => vmap3a, p4 => vmap2a, p5 => vmap1a, p6 => vmap0a, p7 => \-vmo4\, p9 => \-mapi12a\, p10 => \-mapi11a\, p11 => \-mapi10a\, p12 => \-mapi9a\, p13 => \-mapi8a\, p14 => \-vm1wpa\, p15 => \-vma4\);
vmem1_1d06 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => vmap4a, p3 => vmap3a, p4 => vmap2a, p5 => vmap1a, p6 => vmap0a, p7 => \-vmo2\, p9 => \-mapi12a\, p10 => \-mapi11a\, p11 => \-mapi10a\, p12 => \-mapi9a\, p13 => \-mapi8a\, p14 => \-vm1wpa\, p15 => \-vma2\);
vmem1_1d08 : dip_74s240 port map (p1 => gnd, p2 => mapi10, p3 => vmap0a, p4 => mapi9, p5 => vmap1a, p6 => mapi8, p7 => vmap2a, p8 => \-vmap4\, p9 => vmap3a, p11 => \-vmap3\, p12 => vmap4a, p13 => \-vmap2\, p14 => \-mapi8a\, p15 => \-vmap1\, p16 => \-mapi9a\, p17 => \-vmap0\, p18 => \-mapi10a\, p19 => gnd);
vmem1_1d11 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => vmap4a, p3 => vmap3a, p4 => vmap2a, p5 => vmap1a, p6 => vmap0a, p7 => \-vmo0\, p9 => \-mapi12a\, p10 => \-mapi11a\, p11 => \-mapi10a\, p12 => \-mapi9a\, p13 => \-mapi8a\, p14 => \-vm1wpa\, p15 => \-vma0\);
vmem1_1d12 : dip_74s86 port map (p1 => vm1mpar, p2 => \-vm1lpar\, p3 => vm1pari, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
vmem1_1d13 : dip_74s240 port map (p1 => gnd, p2 => mapi12, p3 => \-mapi11a\, p4 => mapi11, p5 => \-mapi12a\, p6 => mapi10, p7 => open, p8 => mapi9, p9 => \-mapi8b\, p11 => mapi8, p12 => \-mapi9b\, p13 => 'Z', p14 => \-mapi10b\, p15 => mapi12, p16 => \-mapi11b\, p17 => mapi11, p18 => \-mapi12b\, p19 => gnd);
vmem1_1e04 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => vmap4a, p3 => vmap3a, p4 => vmap2a, p5 => vmap1a, p6 => vmap0a, p7 => \-vmo11\, p9 => \-mapi12a\, p10 => \-mapi11a\, p11 => \-mapi10a\, p12 => \-mapi9a\, p13 => \-mapi8a\, p14 => \-vm1wpa\, p15 => \-vma11\);
vmem1_1e05 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => vmap4a, p3 => vmap3a, p4 => vmap2a, p5 => vmap1a, p6 => vmap0a, p7 => \-vmo5\, p9 => \-mapi12a\, p10 => \-mapi11a\, p11 => \-mapi10a\, p12 => \-mapi9a\, p13 => \-mapi8a\, p14 => \-vm1wpa\, p15 => \-vma5\);
vmem1_1e08 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => vmap4a, p3 => vmap3a, p4 => vmap2a, p5 => vmap1a, p6 => vmap0a, p7 => \-vmo9\, p9 => \-mapi12a\, p10 => \-mapi11a\, p11 => \-mapi10a\, p12 => \-mapi9a\, p13 => \-mapi8a\, p14 => \-vm1wpa\, p15 => \-vma9\);
vmem1_1e09 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => vmap4a, p3 => vmap3a, p4 => vmap2a, p5 => vmap1a, p6 => vmap0a, p7 => \-vmo3\, p9 => \-mapi12a\, p10 => \-mapi11a\, p11 => \-mapi10a\, p12 => \-mapi9a\, p13 => \-mapi8a\, p14 => \-vm1wpa\, p15 => \-vma3\);
vmem1_1e10 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => vmap4a, p3 => vmap3a, p4 => vmap2a, p5 => vmap1a, p6 => vmap0a, p7 => \-vmo8\, p9 => \-mapi12a\, p10 => \-mapi11a\, p11 => \-mapi10a\, p12 => \-mapi9a\, p13 => \-mapi8a\, p14 => \-vm1wpa\, p15 => \-vma8\);
vmem1_1e13 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => vmap4a, p3 => vmap3a, p4 => vmap2a, p5 => vmap1a, p6 => vmap0a, p7 => \-vmo7\, p9 => \-mapi12a\, p10 => \-mapi11a\, p11 => \-mapi10a\, p12 => \-mapi9a\, p13 => \-mapi8a\, p14 => \-vm1wpa\, p15 => \-vma7\);
vmem1_1e14 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => vmap4a, p3 => vmap3a, p4 => vmap2a, p5 => vmap1a, p6 => vmap0a, p7 => \-vmo1\, p9 => \-mapi12a\, p10 => \-mapi11a\, p11 => \-mapi10a\, p12 => \-mapi9a\, p13 => \-mapi8a\, p14 => \-vm1wpa\, p15 => \-vma1\);
vmem1_1e15 : dip_93425a generic map (fn => ":0") port map (p1 => gnd, p2 => vmap4a, p3 => vmap3a, p4 => vmap2a, p5 => vmap1a, p6 => vmap0a, p7 => \-vmo6\, p9 => \-mapi12a\, p10 => \-mapi11a\, p11 => \-mapi10a\, p12 => \-mapi9a\, p13 => \-mapi8a\, p14 => \-vm1wpa\, p15 => \-vma6\);
end architecture;
