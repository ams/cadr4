-- SOURCE -- SOURCE, DEST, OP DECODE

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_source is
signal net_0 : std_logic;
begin
source_3d02 : dest <= \-iralu\ nand \-irbyte\;
             \-destmem\ <= ir23 nand destm;
             \-specalu\ <= ir8 nand iralu;
source_3d03 : \-ir22\ <= not ir22;
              \-ir25\ <= not ir25;
              irdisp <= not \-irdisp\;
              irjump <= not \-irjump\;
              iralu <= not \-iralu\;
source_3d04 : dip_74s139 port map (p1 => \-specalu\, p2 => ir3, p3 => ir4, p4 => \-mul\, p5 => \-div\, p6 => open, p7 => open, p9 => open, p10 => open, p11 => open, p12 => open, p13 => '0', p14 => '0', p15 => '0');
source_3d05 : dip_74s139 port map (p1 => nop, p2 => ir43, p3 => ir44, p4 => \-iralu\, p5 => \-irjump\, p6 => \-irdisp\, p7 => \-irbyte\, p9 => \-funct3\, p10 => \-funct2\, p11 => \-funct1\, p12 => \-funct0\, p13 => ir11, p14 => ir10, p15 => nop);
source_3d11 : dip_74s138 port map (p1 => ir19, p2 => ir20, p3 => ir21, p4 => ir22, p5 => ir23, p6 => destm, p7 => open, p9 => open, p10 => open, p11 => open, p12 => open, p13 => \-destintctl\, p14 => \-destlc\, p15 => open);
source_3d12 : dip_74s138 port map (p1 => ir19, p2 => ir20, p3 => ir21, p4 => \-ir22\, p5 => ir23, p6 => destm, p7 => \-destimod1\, p9 => \-destimod0\, p10 => \-destspc\, p11 => \-destpdlp\, p12 => \-destpdlx\, p13 => \-destpdl(x)\, p14 => \-destpdl(p)\, p15 => \-destpdltop\);
source_3d21 : destm <= \-ir25\ and dest;
source_3d22 : dip_74s138 port map (p1 => ir26, p2 => ir27, p3 => ir28, p4 => \-ir31\, p5 => ir29, p6 => hi5, p7 => \-srcq\, p9 => \-srcopc\, p10 => \-srcpdltop\, p11 => \-srcpdlpop\, p12 => \-srcpdlidx\, p13 => \-srcpdlptr\, p14 => \-srcspc\, p15 => \-srcdc\);
source_3d23 : dip_74s138 port map (p1 => ir26, p2 => ir27, p3 => ir28, p4 => \-ir31\, p5 => gnd, p6 => ir29, p7 => open, p9 => open, p10 => open, p11 => \-srcspcpop\, p12 => \-srclc\, p13 => \-srcmd\, p14 => \-srcmap\, p15 => \-srcvma\);
source_3e05 : net_0 <= \destimod0 l\ and \iwrited l\;
source_3e09 : dip_74s32o port map (p1 => '0', p2 => '0', p3 => open, p4 => \-destmem\, p5 => \-ir22\, p6 => \-destmdr\, p8 => \-destvma\, p9 => ir22, p10 => \-destmem\, p11 => open, p12 => '0', p13 => '0');
source_4d10 : imod <= not (net_0 and \-destimod1\ and \-idebug\);
end architecture;
