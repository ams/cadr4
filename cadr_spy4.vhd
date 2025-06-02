library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr;
use cadr.utilities.all;

entity cadr_spy4 is
  port (
    \-spy.flag1\ : out std_logic;
    \-wait\      : in  std_logic;
    spy8         : out std_logic;
    \-v1pe\      : in  std_logic;
    spy9         : out std_logic;
    \-v0pe\      : in  std_logic;
    spy10        : out std_logic;
    promdisable  : in  std_logic;
    spy11        : out std_logic;
    \-stathalt\  : in  std_logic;
    spy12        : out std_logic;
    err          : in  std_logic;
    spy13        : out std_logic;
    ssdone       : in  std_logic;
    spy14        : out std_logic;
    srun         : in  std_logic;
    spy15        : out std_logic;
    \-higherr\   : in  std_logic;
    spy0         : out std_logic;
    \-mempe\     : in  std_logic;
    spy1         : out std_logic;
    \-ipe\       : in  std_logic;
    spy2         : out std_logic;
    \-dpe\       : in  std_logic;
    spy3         : out std_logic;
    \-spe\       : in  std_logic;
    spy4         : out std_logic;
    \-pdlpe\     : in  std_logic;
    spy5         : out std_logic;
    \-mpe\       : in  std_logic;
    spy6         : out std_logic;
    \-ape\       : in  std_logic;
    spy7         : out std_logic;
    \-spy.pc\    : in  std_logic;
    gnd          : in  std_logic;
    pc13         : in  std_logic;
    pc12         : in  std_logic;
    pc11         : in  std_logic;
    pc10         : in  std_logic;
    pc9          : in  std_logic;
    pc8          : in  std_logic;
    pc7          : in  std_logic;
    pc6          : in  std_logic;
    pc5          : in  std_logic;
    pc4          : in  std_logic;
    pc3          : in  std_logic;
    pc2          : in  std_logic;
    pc1          : in  std_logic;
    pc0          : in  std_logic;
    \-spy.opc\   : in  std_logic;
    opc13        : in  std_logic;
    opc12        : in  std_logic;
    opc11        : in  std_logic;
    opc10        : in  std_logic;
    opc9         : in  std_logic;
    opc8         : in  std_logic;
    opc7         : in  std_logic;
    opc6         : in  std_logic;
    opc5         : in  std_logic;
    opc4         : in  std_logic;
    opc3         : in  std_logic;
    opc2         : in  std_logic;
    opc1         : in  std_logic;
    opc0         : in  std_logic);
end;

architecture ttl of cadr_spy4 is
begin
  spy4_1a12 : sn74ls244 port map(aenb_n => \-spy.flag1\, ain0 => \-wait\, bout3 => spy8, ain1 => \-v1pe\, bout2 => spy9, ain2 => \-v0pe\, bout1 => spy10, ain3 => promdisable, bout0 => spy11, bin0 => \-stathalt\, aout3 => spy12, bin1 => err, aout2 => spy13, bin2 => ssdone, aout1 => spy14, bin3 => srun, aout0 => spy15, benb_n => \-spy.flag1\);
  spy4_1a13 : sn74s240 port map(aenb_n  => \-spy.flag1\, ain0 => \-higherr\, bout3 => spy0, ain1 => \-mempe\, bout2 => spy1, ain2 => \-ipe\, bout1 => spy2, ain3 => \-dpe\, bout0 => spy3, bin0 => \-spe\, aout3 => spy4, bin1 => \-pdlpe\, aout2 => spy5, bin2 => \-mpe\, aout1 => spy6, bin3 => \-ape\, aout0 => spy7, benb_n => \-spy.flag1\);
  spy4_1d06 : sn74ls244 port map(aenb_n => \-spy.pc\, ain0 => gnd, bout3 => spy8, ain1 => gnd, bout2 => spy9, ain2 => pc13, bout1 => spy10, ain3 => pc12, bout0 => spy11, bin0 => pc11, aout3 => spy12, bin1 => pc10, aout2 => spy13, bin2 => pc9, aout1 => spy14, bin3 => pc8, aout0 => spy15, benb_n => \-spy.pc\);
  spy4_1d07 : sn74ls244 port map(aenb_n => \-spy.pc\, ain0 => pc7, bout3 => spy0, ain1 => pc6, bout2 => spy1, ain2 => pc5, bout1 => spy2, ain3 => pc4, bout0 => spy3, bin0 => pc3, aout3 => spy4, bin1 => pc2, aout2 => spy5, bin2 => pc1, aout1 => spy6, bin3 => pc0, aout0 => spy7, benb_n => \-spy.pc\);
  spy4_1e06 : sn74ls244 port map(aenb_n => \-spy.opc\, ain0 => gnd, bout3 => spy8, ain1 => gnd, bout2 => spy9, ain2 => opc13, bout1 => spy10, ain3 => opc12, bout0 => spy11, bin0 => opc11, aout3 => spy12, bin1 => opc10, aout2 => spy13, bin2 => opc9, aout1 => spy14, bin3 => opc8, aout0 => spy15, benb_n => \-spy.opc\);
  spy4_1e07 : sn74ls244 port map(aenb_n => \-spy.opc\, ain0 => opc7, bout3 => spy0, ain1 => opc6, bout2 => spy1, ain2 => opc5, bout1 => spy2, ain3 => opc4, bout0 => spy3, bin0 => opc3, aout3 => spy4, bin1 => opc2, aout2 => spy5, bin2 => opc1, aout1 => spy6, bin3 => opc0, aout0 => spy7, benb_n => \-spy.opc\);
end architecture;
