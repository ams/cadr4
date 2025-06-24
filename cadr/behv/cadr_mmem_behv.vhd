-- MMEM -- M MEMORY

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_mmem is
begin
mmem_4a21 : dip_82s21 port map (p1 => \-mwpa\, p2 => gnd, p3 => l16, p4 => \-madr4a\, p5 => hi3, p6 => hi3, p7 => mmem16, p9 => mmem17, p10 => \-madr3a\, p11 => \-madr2a\, p12 => \-madr1a\, p13 => \-madr0a\, p14 => l17, p15 => gnd);
mmem_4a22 : dip_82s21 port map (p1 => \-mwpb\, p2 => gnd, p3 => l12, p4 => \-madr4b\, p5 => hi2, p6 => hi2, p7 => mmem12, p9 => mmem13, p10 => \-madr3b\, p11 => \-madr2b\, p12 => \-madr1b\, p13 => \-madr0b\, p14 => l13, p15 => gnd);
mmem_4a23 : dip_82s21 port map (p1 => \-mwpb\, p2 => gnd, p3 => l8, p4 => \-madr4b\, p5 => hi2, p6 => hi2, p7 => mmem8, p9 => mmem9, p10 => \-madr3b\, p11 => \-madr2b\, p12 => \-madr1b\, p13 => \-madr0b\, p14 => l9, p15 => gnd);
mmem_4a24 : dip_82s21 port map (p1 => \-mwpb\, p2 => gnd, p3 => l4, p4 => \-madr4b\, p5 => hi2, p6 => hi2, p7 => mmem4, p9 => mmem5, p10 => \-madr3b\, p11 => \-madr2b\, p12 => \-madr1b\, p13 => \-madr0b\, p14 => l5, p15 => gnd);
mmem_4a25 : dip_82s21 port map (p1 => \-mwpb\, p2 => gnd, p3 => l0, p4 => \-madr4b\, p5 => hi2, p6 => hi2, p7 => mmem0, p9 => mmem1, p10 => \-madr3b\, p11 => \-madr2b\, p12 => \-madr1b\, p13 => \-madr0b\, p14 => l1, p15 => gnd);
mmem_4a26 : dip_82s21 port map (p1 => \-mwpa\, p2 => gnd, p3 => l18, p4 => \-madr4a\, p5 => hi3, p6 => hi3, p7 => mmem18, p9 => mmem19, p10 => \-madr3a\, p11 => \-madr2a\, p12 => \-madr1a\, p13 => \-madr0a\, p14 => l19, p15 => gnd);
mmem_4a27 : dip_82s21 port map (p1 => \-mwpb\, p2 => gnd, p3 => l14, p4 => \-madr4b\, p5 => hi2, p6 => hi2, p7 => mmem14, p9 => mmem15, p10 => \-madr3b\, p11 => \-madr2b\, p12 => \-madr1b\, p13 => \-madr0b\, p14 => l15, p15 => gnd);
mmem_4a28 : dip_82s21 port map (p1 => \-mwpb\, p2 => gnd, p3 => l10, p4 => \-madr4b\, p5 => hi2, p6 => hi2, p7 => mmem10, p9 => mmem11, p10 => \-madr3b\, p11 => \-madr2b\, p12 => \-madr1b\, p13 => \-madr0b\, p14 => l11, p15 => gnd);
mmem_4a29 : dip_82s21 port map (p1 => \-mwpb\, p2 => gnd, p3 => l6, p4 => \-madr4b\, p5 => hi2, p6 => hi2, p7 => mmem6, p9 => mmem7, p10 => \-madr3b\, p11 => \-madr2b\, p12 => \-madr1b\, p13 => \-madr0b\, p14 => l7, p15 => gnd);
mmem_4a30 : dip_82s21 port map (p1 => \-mwpb\, p2 => gnd, p3 => l2, p4 => \-madr4b\, p5 => hi2, p6 => hi2, p7 => mmem2, p9 => mmem3, p10 => \-madr3b\, p11 => \-madr2b\, p12 => \-madr1b\, p13 => \-madr0b\, p14 => l3, p15 => gnd);
mmem_4b23 : dip_82s21 port map (p1 => \-mwpa\, p2 => gnd, p3 => l28, p4 => \-madr4a\, p5 => hi3, p6 => hi3, p7 => mmem28, p9 => mmem29, p10 => \-madr3a\, p11 => \-madr2a\, p12 => \-madr1a\, p13 => \-madr0a\, p14 => l29, p15 => gnd);
mmem_4b24 : dip_82s21 port map (p1 => \-mwpa\, p2 => gnd, p3 => l24, p4 => \-madr4a\, p5 => hi3, p6 => hi3, p7 => mmem24, p9 => mmem25, p10 => \-madr3a\, p11 => \-madr2a\, p12 => \-madr1a\, p13 => \-madr0a\, p14 => l25, p15 => gnd);
mmem_4b25 : dip_82s21 port map (p1 => \-mwpa\, p2 => gnd, p3 => l20, p4 => \-madr4a\, p5 => hi3, p6 => hi3, p7 => mmem20, p9 => mmem21, p10 => \-madr3a\, p11 => \-madr2a\, p12 => \-madr1a\, p13 => \-madr0a\, p14 => l21, p15 => gnd);
mmem_4b27 : dip_82s21 port map (p1 => \-mwpa\, p2 => gnd, p3 => lparity, p4 => \-madr4a\, p5 => hi3, p6 => hi3, p7 => mmemparity, p9 => open, p10 => \-madr3a\, p11 => \-madr2a\, p12 => \-madr1a\, p13 => \-madr0a\, p14 => '0', p15 => '0');
mmem_4b28 : dip_82s21 port map (p1 => \-mwpa\, p2 => gnd, p3 => l30, p4 => \-madr4a\, p5 => hi3, p6 => hi3, p7 => mmem30, p9 => mmem31, p10 => \-madr3a\, p11 => \-madr2a\, p12 => \-madr1a\, p13 => \-madr0a\, p14 => l31, p15 => gnd);
mmem_4b29 : dip_82s21 port map (p1 => \-mwpa\, p2 => gnd, p3 => l26, p4 => \-madr4a\, p5 => hi3, p6 => hi3, p7 => mmem26, p9 => mmem27, p10 => \-madr3a\, p11 => \-madr2a\, p12 => \-madr1a\, p13 => \-madr0a\, p14 => l27, p15 => gnd);
mmem_4b30 : dip_82s21 port map (p1 => \-mwpa\, p2 => gnd, p3 => l22, p4 => \-madr4a\, p5 => hi3, p6 => hi3, p7 => mmem22, p9 => mmem23, p10 => \-madr3a\, p11 => \-madr2a\, p12 => \-madr1a\, p13 => \-madr0a\, p14 => l23, p15 => gnd);
end architecture;
