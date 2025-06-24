-- OPCD -- OPC, DC, ZERO DRIVE

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_opcd is
signal net_0 : std_logic;
signal net_1 : std_logic;
begin
opcd_1d18 : dip_74s04 port map (p1 => '0', p2 => open, p3 => \-srcdc\, p4 => net_1, p5 => \-srcopc\, p6 => net_0, p8 => open, p9 => '0', p10 => open, p11 => '0', p12 => open, p13 => '0');
opcd_1e01 : dip_74s241 port map (p1 => \-opcdrive\, p2 => opc7, p3 => mf4, p4 => opc6, p5 => mf5, p6 => opc5, p7 => mf6, p8 => opc4, p9 => mf7, p11 => dc7, p12 => mf4, p13 => dc6, p14 => mf5, p15 => dc5, p16 => mf6, p17 => dc4, p18 => mf7, p19 => dcdrive);
opcd_1e03 : dip_74s241 port map (p1 => \-opcdrive\, p2 => opc3, p3 => mf0, p4 => opc2, p5 => mf1, p6 => opc1, p7 => mf2, p8 => opc0, p9 => mf3, p11 => dc3, p12 => mf0, p13 => dc2, p14 => mf1, p15 => dc1, p16 => mf2, p17 => dc0, p18 => mf3, p19 => dcdrive);
opcd_1e06 : \-opcdrive\     <= net_0 nand tse1b;
            \-zero16.drive\ <= tse1b nand zero16;
opcd_1e07 : dip_74s08 port map (p1 => tse1b, p2 => net_1, p3 => dcdrive, p4 => zero16, p5 => tse1b, p6 => \zero16.drive\, p8 => open, p9 => '0', p10 => '0', p11 => open, p12 => '0', p13 => '0');
opcd_1e16 : dip_74s11 port map (p1 => \-srcopc\, p2 => zero16, p3 => '0', p4 => '0', p5 => '0', p6 => open, p8 => open, p9 => '0', p10 => '0', p11 => '0', p12 => \zero12.drive\, p13 => tse1b);
opcd_1f01 : dip_74s241 port map (p1 => \-zero16.drive\, p2 => gnd, p3 => mf24, p4 => gnd, p5 => mf25, p6 => gnd, p7 => mf26, p8 => gnd, p9 => mf27, p11 => gnd, p12 => mf28, p13 => gnd, p14 => mf29, p15 => gnd, p16 => mf30, p17 => gnd, p18 => mf31, p19 => \zero16.drive\);
opcd_1f02 : dip_74s241 port map (p1 => \-zero16.drive\, p2 => gnd, p3 => mf16, p4 => gnd, p5 => mf17, p6 => gnd, p7 => mf18, p8 => gnd, p9 => mf19, p11 => gnd, p12 => mf20, p13 => gnd, p14 => mf21, p15 => gnd, p16 => mf22, p17 => gnd, p18 => mf23, p19 => \zero16.drive\);
opcd_1f03 : dip_74s241 port map (p1 => \-opcdrive\, p2 => gnd, p3 => mf12, p4 => gnd, p5 => mf13, p6 => opc13, p7 => mf14, p8 => opc12, p9 => mf15, p11 => gnd, p12 => mf12, p13 => gnd, p14 => mf13, p15 => gnd, p16 => mf14, p17 => gnd, p18 => mf15, p19 => \zero12.drive\);
opcd_1f04 : dip_74s241 port map (p1 => \-opcdrive\, p2 => opc11, p3 => mf8, p4 => opc10, p5 => mf9, p6 => opc9, p7 => mf10, p8 => opc8, p9 => mf11, p11 => gnd, p12 => mf8, p13 => gnd, p14 => mf9, p15 => dc9, p16 => mf10, p17 => dc8, p18 => mf11, p19 => dcdrive);
opcd_3e30 : dip_74s20o port map (p1 => '0', p2 => '0', p4 => '0', p5 => '0', p6 => open, p8 => zero16, p9 => \-srcopc\, p10 => \-srcpdlidx\, p12 => \-srcpdlptr\, p13 => \-srcdc\);
end architecture;
