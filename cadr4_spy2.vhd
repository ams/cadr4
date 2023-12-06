library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_spy2 is
  port (
    \-spy.al\    : out std_logic;
    aa15         : in  std_logic;
    spy8         : out std_logic;
    aa14         : in  std_logic;
    spy9         : out std_logic;
    aa13         : in  std_logic;
    spy10        : out std_logic;
    aa12         : in  std_logic;
    spy11        : out std_logic;
    aa11         : in  std_logic;
    spy12        : out std_logic;
    aa10         : in  std_logic;
    spy13        : out std_logic;
    aa9          : in  std_logic;
    spy14        : out std_logic;
    aa8          : in  std_logic;
    spy15        : out std_logic;
    aa7          : in  std_logic;
    spy0         : out std_logic;
    aa6          : in  std_logic;
    spy1         : out std_logic;
    aa5          : in  std_logic;
    spy2         : out std_logic;
    aa4          : in  std_logic;
    spy3         : out std_logic;
    aa3          : in  std_logic;
    spy4         : out std_logic;
    aa2          : in  std_logic;
    spy5         : out std_logic;
    aa1          : in  std_logic;
    spy6         : out std_logic;
    aa0          : in  std_logic;
    spy7         : out std_logic;
    \-spy.ah\    : in  std_logic;
    a31a         : in  std_logic;
    a30          : in  std_logic;
    a29          : in  std_logic;
    a28          : in  std_logic;
    a27          : in  std_logic;
    a26          : in  std_logic;
    a25          : in  std_logic;
    a24          : in  std_logic;
    a23          : in  std_logic;
    a22          : in  std_logic;
    a21          : in  std_logic;
    a20          : in  std_logic;
    a19          : in  std_logic;
    a18          : in  std_logic;
    a17          : in  std_logic;
    a16          : in  std_logic;
    \-spy.flag2\ : in  std_logic;
    nc149        : in  std_logic;
    nc150        : in  std_logic;
    ir48         : in  std_logic;
    nop          : in  std_logic;
    \-vmaok\     : in  std_logic;
    jcond        : in  std_logic;
    pcs1         : in  std_logic;
    pcs0         : in  std_logic;
    nc151        : in  std_logic;
    nc152        : in  std_logic;
    wmapd        : in  std_logic;
    destspcd     : in  std_logic;
    iwrited      : in  std_logic;
    imodd        : in  std_logic;
    pdlwrited    : in  std_logic;
    spushd       : in  std_logic;
    \-spy.ml\    : in  std_logic;
    m15          : in  std_logic;
    m14          : in  std_logic;
    m13          : in  std_logic;
    m12          : in  std_logic;
    m11          : in  std_logic;
    m10          : in  std_logic;
    m9           : in  std_logic;
    m8           : in  std_logic;
    m7           : in  std_logic;
    m6           : in  std_logic;
    m5           : in  std_logic;
    m4           : in  std_logic;
    m3           : in  std_logic;
    m2           : in  std_logic;
    m1           : in  std_logic;
    m0           : in  std_logic;
    \-spy.mh\    : in  std_logic;
    m23          : in  std_logic;
    m22          : in  std_logic;
    m21          : in  std_logic;
    m20          : in  std_logic;
    m19          : in  std_logic;
    m18          : in  std_logic;
    m17          : in  std_logic;
    m16          : in  std_logic;
    m31          : in  std_logic;
    m30          : in  std_logic;
    m29          : in  std_logic;
    m28          : in  std_logic;
    m27          : in  std_logic;
    m26          : in  std_logic;
    m25          : in  std_logic;
    m24          : in  std_logic);
end;

architecture ttl of cadr4_spy2 is
begin
  spy2_1f11 : sn74ls244 port map(aenb_n => \-spy.al\, ain0 => aa15, bout3 => spy8, ain1 => aa14, bout2 => spy9, ain2 => aa13, bout1 => spy10, ain3 => aa12, bout0 => spy11, bin0 => aa11, aout3 => spy12, bin1 => aa10, aout2 => spy13, bin2 => aa9, aout1 => spy14, bin3 => aa8, aout0 => spy15, benb_n => \-spy.al\);
  spy2_1f13 : sn74ls244 port map(aenb_n => \-spy.al\, ain0 => aa7, bout3 => spy0, ain1 => aa6, bout2 => spy1, ain2 => aa5, bout1 => spy2, ain3 => aa4, bout0 => spy3, bin0 => aa3, aout3 => spy4, bin1 => aa2, aout2 => spy5, bin2 => aa1, aout1 => spy6, bin3 => aa0, aout0 => spy7, benb_n => \-spy.al\);
  spy2_3a26 : sn74ls244 port map(aenb_n => \-spy.ah\, ain0 => a31a, bout3 => spy8, ain1 => a30, bout2 => spy9, ain2 => a29, bout1 => spy10, ain3 => a28, bout0 => spy11, bin0 => a27, aout3 => spy12, bin1 => a26, aout2 => spy13, bin2 => a25, aout1 => spy14, bin3 => a24, aout0 => spy15, benb_n => \-spy.ah\);
  spy2_3a27 : sn74ls244 port map(aenb_n => \-spy.ah\, ain0 => a23, bout3 => spy0, ain1 => a22, bout2 => spy1, ain2 => a21, bout1 => spy2, ain3 => a20, bout0 => spy3, bin0 => a19, aout3 => spy4, bin1 => a18, aout2 => spy5, bin2 => a17, aout1 => spy6, bin3 => a16, aout0 => spy7, benb_n => \-spy.ah\);
  spy2_3e16 : sn74ls244 port map(aenb_n => \-spy.flag2\, ain0 => nc149, bout3 => spy0, ain1 => nc150, bout2 => spy1, ain2 => ir48, bout1 => spy2, ain3 => nop, bout0 => spy3, bin0 => \-vmaok\, aout3 => spy4, bin1 => jcond, aout2 => spy5, bin2 => pcs1, aout1 => spy6, bin3 => pcs0, aout0 => spy7, benb_n => \-spy.flag2\);
  spy2_3f15 : sn74ls244 port map(aenb_n => \-spy.flag2\, ain0 => nc151, bout3 => spy8, ain1 => nc152, bout2 => spy9, ain2 => wmapd, bout1 => spy10, ain3 => destspcd, bout0 => spy11, bin0 => iwrited, aout3 => spy12, bin1 => imodd, aout2 => spy13, bin2 => pdlwrited, aout1 => spy14, bin3 => spushd, aout0 => spy15, benb_n => \-spy.flag2\);
  spy2_4a13 : sn74ls244 port map(aenb_n => \-spy.ml\, ain0 => m15, bout3 => spy8, ain1 => m14, bout2 => spy9, ain2 => m13, bout1 => spy10, ain3 => m12, bout0 => spy11, bin0 => m11, aout3 => spy12, bin1 => m10, aout2 => spy13, bin2 => m9, aout1 => spy14, bin3 => m8, aout0 => spy15, benb_n => \-spy.ml\);
  spy2_4a15 : sn74ls244 port map(aenb_n => \-spy.ml\, ain0 => m7, bout3 => spy0, ain1 => m6, bout2 => spy1, ain2 => m5, bout1 => spy2, ain3 => m4, bout0 => spy3, bin0 => m3, aout3 => spy4, bin1 => m2, aout2 => spy5, bin2 => m1, aout1 => spy6, bin3 => m0, aout0 => spy7, benb_n => \-spy.ml\);
  spy2_4b13 : sn74ls244 port map(aenb_n => \-spy.mh\, ain0 => m23, bout3 => spy0, ain1 => m22, bout2 => spy1, ain2 => m21, bout1 => spy2, ain3 => m20, bout0 => spy3, bin0 => m19, aout3 => spy4, bin1 => m18, aout2 => spy5, bin2 => m17, aout1 => spy6, bin3 => m16, aout0 => spy7, benb_n => \-spy.mh\);
  spy2_4b17 : sn74ls244 port map(aenb_n => \-spy.mh\, ain0 => m31, bout3 => spy8, ain1 => m30, bout2 => spy9, ain2 => m29, bout1 => spy10, ain3 => m28, bout0 => spy11, bin0 => m27, aout3 => spy12, bin1 => m26, aout2 => spy13, bin2 => m25, aout1 => spy14, bin3 => m24, aout0 => spy15, benb_n => \-spy.mh\);
end architecture;