library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_platch is
  port (
    \-pdldrive\ : in  std_logic;
    m15         : out std_logic;
    pdl15       : in  std_logic;
    pdl14       : in  std_logic;
    m14         : out std_logic;
    m13         : out std_logic;
    pdl13       : in  std_logic;
    pdl12       : in  std_logic;
    m12         : out std_logic;
    clk4a       : in  std_logic;
    m11         : out std_logic;
    pdl11       : in  std_logic;
    pdl10       : in  std_logic;
    m10         : out std_logic;
    m9          : out std_logic;
    pdl9        : in  std_logic;
    pdl8        : in  std_logic;
    m8          : out std_logic;
    m7          : out std_logic;
    pdl7        : in  std_logic;
    pdl6        : in  std_logic;
    m6          : out std_logic;
    m5          : out std_logic;
    pdl5        : in  std_logic;
    pdl4        : in  std_logic;
    m4          : out std_logic;
    m3          : out std_logic;
    pdl3        : in  std_logic;
    pdl2        : in  std_logic;
    m2          : out std_logic;
    m1          : out std_logic;
    pdl1        : in  std_logic;
    pdl0        : in  std_logic;
    m0          : out std_logic;
    m31         : out std_logic;
    pdl31       : in  std_logic;
    pdl30       : in  std_logic;
    m30         : out std_logic;
    m29         : out std_logic;
    pdl29       : in  std_logic;
    pdl28       : in  std_logic;
    m28         : out std_logic;
    m27         : out std_logic;
    pdl27       : in  std_logic;
    pdl26       : in  std_logic;
    m26         : out std_logic;
    m25         : out std_logic;
    pdl25       : in  std_logic;
    pdl24       : in  std_logic;
    m24         : out std_logic;
    m23         : out std_logic;
    pdl23       : in  std_logic;
    pdl22       : in  std_logic;
    m22         : out std_logic;
    m21         : out std_logic;
    pdl21       : in  std_logic;
    pdl20       : in  std_logic;
    m20         : out std_logic;
    m19         : out std_logic;
    pdl19       : in  std_logic;
    pdl18       : in  std_logic;
    m18         : out std_logic;
    m17         : out std_logic;
    pdl17       : in  std_logic;
    pdl16       : in  std_logic;
    m16         : out std_logic;
    nc219       : out std_logic;
    nc220       : in  std_logic;
    nc221       : in  std_logic;
    nc222       : out std_logic;
    nc223       : out std_logic;
    nc224       : in  std_logic;
    nc225       : in  std_logic;
    nc226       : out std_logic;
    nc227       : out std_logic;
    nc228       : in  std_logic;
    nc229       : in  std_logic;
    nc230       : out std_logic;
    nc231       : out std_logic;
    nc232       : in  std_logic;
    pdlparity   : in  std_logic;
    mparity     : out std_logic);
end;

architecture ttl of cadr4_platch is
begin
  platch_4a02 : sn74s373 port map(oenb_n => \-pdldrive\, o0 => m15, i0 => pdl15, i1 => pdl14, o1 => m14, o2 => m13, i2 => pdl13, i3 => pdl12, o3 => m12, hold_n => clk4a, o4 => m11, i4 => pdl11, i5 => pdl10, o5 => m10, o6 => m9, i6 => pdl9, i7 => pdl8, o7 => m8);
  platch_4a04 : sn74s373 port map(oenb_n => \-pdldrive\, o0 => m7, i0 => pdl7, i1 => pdl6, o1 => m6, o2 => m5, i2 => pdl5, i3 => pdl4, o3 => m4, hold_n => clk4a, o4 => m3, i4 => pdl3, i5 => pdl2, o5 => m2, o6 => m1, i6 => pdl1, i7 => pdl0, o7 => m0);
  platch_4b03 : sn74s373 port map(oenb_n => \-pdldrive\, o0 => m31, i0 => pdl31, i1 => pdl30, o1 => m30, o2 => m29, i2 => pdl29, i3 => pdl28, o3 => m28, hold_n => clk4a, o4 => m27, i4 => pdl27, i5 => pdl26, o5 => m26, o6 => m25, i6 => pdl25, i7 => pdl24, o7 => m24);
  platch_4b05 : sn74s373 port map(oenb_n => \-pdldrive\, o0 => m23, i0 => pdl23, i1 => pdl22, o1 => m22, o2 => m21, i2 => pdl21, i3 => pdl20, o3 => m20, hold_n => clk4a, o4 => m19, i4 => pdl19, i5 => pdl18, o5 => m18, o6 => m17, i6 => pdl17, i7 => pdl16, o7 => m16);
  platch_4b08 : sn74s373 port map(oenb_n => \-pdldrive\, o0 => nc219, i0 => nc220, i1 => nc221, o1 => nc222, o2 => nc223, i2 => nc224, i3 => nc225, o3 => nc226, hold_n => clk4a, o4 => nc227, i4 => nc228, i5 => nc229, o5 => nc230, o6 => nc231, i6 => nc232, i7 => pdlparity, o7 => mparity);
end architecture;
