-- SOURCE -- SOURCE, DEST, OP DECODE

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_source is
signal net_0 : std_logic;
begin
source_3d02 : dip_74s00 port map (p1 => '0', p2 => '0', p3 => open, p4 => \-iralu\, p5 => \-irbyte\, p6 => dest, p8 => \-destmem\, p9 => ir23, p10 => destm, p11 => \-specalu\, p12 => ir8, p13 => iralu);
source_3d03 : dip_74s04a port map (p1 => ir22, p2 => \-ir22\, p3 => ir25, p4 => \-ir25\, p5 => '0', p6 => open, p8 => irdisp, p9 => \-irdisp\, p10 => irjump, p11 => \-irjump\, p12 => iralu, p13 => \-iralu\);
source_3d04 : dip_74s139 port map (p1 => \-specalu\, p2 => ir3, p3 => ir4, p4 => \-mul\, p5 => \-div\, p6 => open, p7 => open, p9 => open, p10 => open, p11 => open, p12 => open, p13 => '0', p14 => '0', p15 => '0');
source_3d05 : dip_74s139 port map (p1 => nop, p2 => ir43, p3 => ir44, p4 => \-iralu\, p5 => \-irjump\, p6 => \-irdisp\, p7 => \-irbyte\, p9 => \-funct3\, p10 => \-funct2\, p11 => \-funct1\, p12 => \-funct0\, p13 => ir11, p14 => ir10, p15 => nop);
source_3d11 : dip_74s138 port map (p1 => ir19, p2 => ir20, p3 => ir21, p4 => ir22, p5 => ir23, p6 => destm, p7 => open, p9 => open, p10 => open, p11 => open, p12 => open, p13 => \-destintctl\, p14 => \-destlc\, p15 => open);
source_3d12 : dip_74s138 port map (p1 => ir19, p2 => ir20, p3 => ir21, p4 => \-ir22\, p5 => ir23, p6 => destm, p7 => \-destimod1\, p9 => \-destimod0\, p10 => \-destspc\, p11 => \-destpdlp\, p12 => \-destpdlx\, p13 => \-destpdl(x)\, p14 => \-destpdl(p)\, p15 => \-destpdltop\);
source_3d21 : dip_74s08 port map (p1 => '0', p2 => '0', p3 => open, p4 => '0', p5 => '0', p6 => open, p8 => open, p9 => '0', p10 => '0', p11 => destm, p12 => \-ir25\, p13 => dest);
source_3d22 : dip_74s138 port map (p1 => ir26, p2 => ir27, p3 => ir28, p4 => \-ir31\, p5 => ir29, p6 => hi5, p7 => \-srcq\, p9 => \-srcopc\, p10 => \-srcpdltop\, p11 => \-srcpdlpop\, p12 => \-srcpdlidx\, p13 => \-srcpdlptr\, p14 => \-srcspc\, p15 => \-srcdc\);
source_3d23 : dip_74s138 port map (p1 => ir26, p2 => ir27, p3 => ir28, p4 => \-ir31\, p5 => gnd, p6 => ir29, p7 => open, p9 => open, p10 => open, p11 => \-srcspcpop\, p12 => \-srclc\, p13 => \-srcmd\, p14 => \-srcmap\, p15 => \-srcvma\);
source_3e05 : dip_74s08o port map (p1 => '0', p2 => '0', p3 => open, p4 => \destimod0 l\, p5 => \iwrited l\, p6 => net_0, p8 => open, p9 => '0', p10 => '0', p11 => open, p12 => '0', p13 => '0');
source_3e09 : dip_74s32o port map (p1 => '0', p2 => '0', p3 => open, p4 => \-destmem\, p5 => \-ir22\, p6 => \-destmdr\, p8 => \-destvma\, p9 => ir22, p10 => \-destmem\, p11 => open, p12 => '0', p13 => '0');
source_4d10 : dip_74s10o port map (p1 => '0', p2 => '0', p3 => net_0, p4 => \-destimod1\, p5 => \-idebug\, p6 => imod, p8 => open, p9 => '0', p10 => '0', p11 => '0', p12 => open, p13 => '0');
end architecture;
