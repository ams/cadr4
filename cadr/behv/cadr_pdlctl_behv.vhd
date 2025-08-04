-- PDLCTL -- PDL BUFFER CONTROL

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_pdlctl is
signal net_0 : std_logic;
begin
pdlctl_4c11 : dip_74s175 port map (p1 => \-reset\, p2 => pdlwrited, p3 => \-pdlwrited\, p4 => pdlwrite, p5 => \-destpdl(x)\, p6 => pwidx, p7 => \-pwidx\, p9 => clk4f, p10 => imodd, p11 => \-imodd\, p12 => imod, p13 => \-destspc\, p14 => open, p15 => \-destspcd\);
pdlctl_4c12 : dip_74s258 port map (p1 => \-pdlpb\, p2 => pdlptr0, p3 => pdlidx0, p4 => \-pdla0b\, p5 => pdlptr1, p6 => pdlidx1, p7 => \-pdla1b\, p9 => \-pdla2b\, p10 => pdlidx2, p11 => pdlptr2, p12 => \-pdla3b\, p13 => pdlidx3, p14 => pdlptr3, p15 => gnd);
pdlctl_4c16 : dip_74s258 port map (p1 => \-pdlpa\, p2 => pdlptr8, p3 => pdlidx8, p4 => \-pdla8b\, p5 => pdlptr9, p6 => pdlidx9, p7 => \-pdla9b\, p9 => \-pdla0a\, p10 => pdlidx0, p11 => pdlptr0, p12 => \-pdla1a\, p13 => pdlidx1, p14 => pdlptr1, p15 => gnd);
pdlctl_4c22 : dip_74s258 port map (p1 => \-pdlpa\, p2 => pdlptr2, p3 => pdlidx2, p4 => \-pdla2a\, p5 => pdlptr3, p6 => pdlidx3, p7 => \-pdla3a\, p9 => \-pdla4a\, p10 => pdlidx4, p11 => pdlptr4, p12 => \-pdla5a\, p13 => pdlidx5, p14 => pdlptr5, p15 => gnd);
pdlctl_4d06 : \-pdlcnt\ <= net_0 and \-destpdl(p)\;
pdlctl_4d07 : dip_74s51 port map (p1 => \-pwidx\, p2 => clk4b, p3 => ir30, p4 => \-clk4e\, p5 => \-pwidx\, p6 => \-pdlpa\, p8 => \-pdlpb\, p9 => clk4b, p10 => ir30, p13 => \-clk4e\);
pdlctl_4d08 : pdlenb      <= \-srcpdlpop\ nand \-srcpdltop\;
              \-pdldrive\ <= pdlenb nand tse4b;
pdlctl_4d10 : pdlwrite <= not (\-destpdltop\ and \-destpdl(x)\ and \-destpdl(p)\);
pdlctl_4d14 : dip_74s258 port map (p1 => \-pdlpb\, p2 => pdlptr4, p3 => pdlidx4, p4 => \-pdla4b\, p5 => pdlptr5, p6 => pdlidx5, p7 => \-pdla5b\, p9 => \-pdla6b\, p10 => pdlidx6, p11 => pdlptr6, p12 => \-pdla7b\, p13 => pdlidx7, p14 => pdlptr7, p15 => gnd);
pdlctl_4d20 : \-pwpa\  <= not (pdlwrited and wp4a);
              \-pwpb\  <= not (pdlwrited and wp4a);
              \-pwpc\  <= not (wp4a and pdlwrited);
pdlctl_4d24 : dip_74s258 port map (p1 => \-pdlpa\, p2 => pdlptr6, p3 => pdlidx6, p4 => \-pdla6a\, p5 => pdlptr7, p6 => pdlidx7, p7 => \-pdla7a\, p9 => \-pdla8a\, p10 => pdlidx8, p11 => pdlptr8, p12 => \-pdla9a\, p13 => pdlidx9, p14 => pdlptr9, p15 => gnd);
pdlctl_4e03 : net_0 <= \-srcpdlpop\ or nop;
end architecture;
