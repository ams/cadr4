-- VMAS -- VMA INPUT SELECTOR

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_vmas is
begin
vmas_1a27 : dip_74s258 port map (p1 => vmasela, p2 => lc22, p3 => ob20, p4 => \-vmas20\, p5 => lc23, p6 => ob21, p7 => \-vmas21\, p9 => \-vmas22\, p10 => ob22, p11 => lc24, p12 => \-vmas23\, p13 => ob23, p14 => lc25, p15 => gnd);
vmas_1a29 : dip_74s258 port map (p1 => vmasela, p2 => gnd, p3 => ob28, p4 => \-vmas28\, p5 => gnd, p6 => ob29, p7 => \-vmas29\, p9 => \-vmas30\, p10 => ob30, p11 => gnd, p12 => \-vmas31\, p13 => ob31, p14 => gnd, p15 => gnd);
vmas_1b26 : dip_74s258 port map (p1 => vmaselb, p2 => lc14, p3 => ob12, p4 => \-vmas12\, p5 => lc15, p6 => ob13, p7 => \-vmas13\, p9 => \-vmas14\, p10 => ob14, p11 => lc16, p12 => \-vmas15\, p13 => ob15, p14 => lc17, p15 => gnd);
vmas_1b29 : dip_74s258 port map (p1 => vmasela, p2 => lc18, p3 => ob16, p4 => \-vmas16\, p5 => lc19, p6 => ob17, p7 => \-vmas17\, p9 => \-vmas18\, p10 => ob18, p11 => lc20, p12 => \-vmas19\, p13 => ob19, p14 => lc21, p15 => gnd);
vmas_1c16 : dip_74s258 port map (p1 => \-memstart\, p2 => \-vma12\, p3 => \-md12\, p4 => mapi12, p5 => \-vma13\, p6 => \-md13\, p7 => mapi13, p9 => mapi14, p10 => \-md14\, p11 => \-vma14\, p12 => mapi15, p13 => \-md15\, p14 => \-vma15\, p15 => gnd);
vmas_1c18 : dip_74s258 port map (p1 => \-memstart\, p2 => \-vma16\, p3 => \-md16\, p4 => mapi16, p5 => \-vma17\, p6 => \-md17\, p7 => mapi17, p9 => mapi18, p10 => \-md18\, p11 => \-vma18\, p12 => mapi19, p13 => \-md19\, p14 => \-vma19\, p15 => gnd);
vmas_1c20 : dip_74s258 port map (p1 => \-memstart\, p2 => \-vma20\, p3 => \-md20\, p4 => mapi20, p5 => \-vma21\, p6 => \-md21\, p7 => mapi21, p9 => mapi22, p10 => \-md22\, p11 => \-vma22\, p12 => mapi23, p13 => \-md23\, p14 => \-vma23\, p15 => gnd);
vmas_1c28 : dip_74s258 port map (p1 => vmaselb, p2 => lc2, p3 => ob0, p4 => \-vmas0\, p5 => lc3, p6 => ob1, p7 => \-vmas1\, p9 => \-vmas2\, p10 => ob2, p11 => lc4, p12 => \-vmas3\, p13 => ob3, p14 => lc5, p15 => gnd);
vmas_1d19 : dip_74s258 port map (p1 => \-memstart\, p2 => \-vma8\, p3 => \-md8\, p4 => mapi8, p5 => \-vma9\, p6 => \-md9\, p7 => mapi9, p9 => mapi10, p10 => \-md10\, p11 => \-vma10\, p12 => mapi11, p13 => \-md11\, p14 => \-vma11\, p15 => gnd);
vmas_1d30 : dip_74s258 port map (p1 => vmaselb, p2 => lc10, p3 => ob8, p4 => \-vmas8\, p5 => lc11, p6 => ob9, p7 => \-vmas9\, p9 => \-vmas10\, p10 => ob10, p11 => lc12, p12 => \-vmas11\, p13 => ob11, p14 => lc13, p15 => gnd);
vmas_2b01 : dip_74s258 port map (p1 => vmaselb, p2 => lc6, p3 => ob4, p4 => \-vmas4\, p5 => lc7, p6 => ob5, p7 => \-vmas5\, p9 => \-vmas6\, p10 => ob6, p11 => lc8, p12 => \-vmas7\, p13 => ob7, p14 => lc9, p15 => gnd);
vmas_2b04 : dip_74s258 port map (p1 => vmasela, p2 => gnd, p3 => ob24, p4 => \-vmas24\, p5 => gnd, p6 => ob25, p7 => \-vmas25\, p9 => \-vmas26\, p10 => ob26, p11 => gnd, p12 => \-vmas27\, p13 => ob27, p14 => gnd, p15 => gnd);
end architecture;
