library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_spclch is
  port (
    \-spcdrive\ : in  std_logic;
    m23         : out std_logic;
    gnd         : in  std_logic;
    m22         : out std_logic;
    m21         : out std_logic;
    m20         : out std_logic;
    clk4c       : in  std_logic;
    m19         : out std_logic;
    spco18      : in  std_logic;
    m18         : out std_logic;
    m17         : out std_logic;
    spco17      : in  std_logic;
    spco16      : in  std_logic;
    m16         : out std_logic;
    m15         : out std_logic;
    spco15      : in  std_logic;
    spco14      : in  std_logic;
    m14         : out std_logic;
    m13         : out std_logic;
    spco13      : in  std_logic;
    spco12      : in  std_logic;
    m12         : out std_logic;
    m11         : out std_logic;
    spco11      : in  std_logic;
    spco10      : in  std_logic;
    m10         : out std_logic;
    m9          : out std_logic;
    spco9       : in  std_logic;
    spco8       : in  std_logic;
    m8          : out std_logic;
    m7          : out std_logic;
    spco7       : in  std_logic;
    spco6       : in  std_logic;
    m6          : out std_logic;
    m5          : out std_logic;
    spco5       : in  std_logic;
    spco4       : in  std_logic;
    m4          : out std_logic;
    m3          : out std_logic;
    spco3       : in  std_logic;
    spco2       : in  std_logic;
    m2          : out std_logic;
    m1          : out std_logic;
    spco1       : in  std_logic;
    spco0       : in  std_logic;
    m0          : out std_logic;
    m24         : out std_logic;
    m25         : out std_logic;
    m26         : out std_logic;
    spcptr4     : in  std_logic;
    m27         : out std_logic;
    spcptr3     : in  std_logic;
    m28         : out std_logic;
    spcptr2     : in  std_logic;
    m29         : out std_logic;
    spcptr1     : in  std_logic;
    m30         : out std_logic;
    spcptr0     : in  std_logic;
    m31         : out std_logic;
    spcdrive    : in  std_logic;
    hi1         : in  std_logic;
    nc166       : in  std_logic;
    spc16       : out std_logic;
    nc167       : in  std_logic;
    spc17       : out std_logic;
    nc168       : in  std_logic;
    spc18       : out std_logic;
    nc169       : in  std_logic;
    spcpar      : out std_logic;
    spcwpar     : in  std_logic;
    nc170       : out std_logic;
    spcw18      : in  std_logic;
    nc171       : out std_logic;
    spcw17      : in  std_logic;
    nc172       : out std_logic;
    spcw16      : in  std_logic;
    nc173       : out std_logic;
    spcwpass    : in  std_logic;
    \-spcwpass\ : in  std_logic;
    spcw15      : in  std_logic;
    spc8        : out std_logic;
    spcw14      : in  std_logic;
    spc9        : out std_logic;
    spcw13      : in  std_logic;
    spc10       : out std_logic;
    spcw12      : in  std_logic;
    spc11       : out std_logic;
    spcw11      : in  std_logic;
    spc12       : out std_logic;
    spcw10      : in  std_logic;
    spc13       : out std_logic;
    spcw9       : in  std_logic;
    spc14       : out std_logic;
    spcw8       : in  std_logic;
    spc15       : out std_logic;
    spcw7       : in  std_logic;
    spc0        : out std_logic;
    spcw6       : in  std_logic;
    spc1        : out std_logic;
    spcw5       : in  std_logic;
    spc2        : out std_logic;
    spcw4       : in  std_logic;
    spc3        : out std_logic;
    spcw3       : in  std_logic;
    spc4        : out std_logic;
    spcw2       : in  std_logic;
    spc5        : out std_logic;
    spcw1       : in  std_logic;
    spc6        : out std_logic;
    spcw0       : in  std_logic;
    spc7        : out std_logic;
    \-spcpass\  : in  std_logic;
    nc174       : out std_logic;
    nc175       : in  std_logic;
    nc176       : in  std_logic;
    nc177       : out std_logic;
    nc178       : out std_logic;
    nc179       : in  std_logic;
    nc180       : in  std_logic;
    nc181       : out std_logic;
    clk4d       : in  std_logic;
    spcopar     : in  std_logic);
end;

architecture ttl of cadr4_spclch is
begin
  spclch_4a07 : sn74s373 port map(oenb_n => \-spcdrive\, o0 => m23, i0 => gnd, i1 => gnd, o1 => m22, o2 => m21, i2 => gnd, i3 => gnd, o3 => m20, hold_n => clk4c, o4 => m19, i4 => gnd, i5 => spco18, o5 => m18, o6 => m17, i6 => spco17, i7 => spco16, o7 => m16);
  spclch_4a09 : sn74s373 port map(oenb_n => \-spcdrive\, o0 => m15, i0 => spco15, i1 => spco14, o1 => m14, o2 => m13, i2 => spco13, i3 => spco12, o3 => m12, hold_n => clk4c, o4 => m11, i4 => spco11, i5 => spco10, o5 => m10, o6 => m9, i6 => spco9, i7 => spco8, o7 => m8);
  spclch_4a10 : sn74s373 port map(oenb_n => \-spcdrive\, o0 => m7, i0 => spco7, i1 => spco6, o1 => m6, o2 => m5, i2 => spco5, i3 => spco4, o3 => m4, hold_n => clk4c, o4 => m3, i4 => spco3, i5 => spco2, o5 => m2, o6 => m1, i6 => spco1, i7 => spco0, o7 => m0);
  spclch_4b10 : sn74s241 port map(aenb_n => \-spcdrive\, ain0 => gnd, bout3 => m24, ain1 => gnd, bout2 => m25, ain2 => gnd, bout1 => m26, ain3 => spcptr4, bout0 => m27, bin0 => spcptr3, aout3 => m28, bin1 => spcptr2, aout2 => m29, bin2 => spcptr1, aout1 => m30, bin3 => spcptr0, aout0 => m31, benb => spcdrive);
  spclch_4e16 : sn74s241 port map(aenb_n => hi1, ain0 => nc166, bout3 => spc16, ain1 => nc167, bout2 => spc17, ain2 => nc168, bout1 => spc18, ain3 => nc169, bout0 => spcpar, bin0 => spcwpar, aout3 => nc170, bin1 => spcw18, aout2 => nc171, bin2 => spcw17, aout1 => nc172, bin3 => spcw16, aout0 => nc173, benb => spcwpass);
  spclch_4e17 : sn74s241 port map(aenb_n => \-spcwpass\, ain0 => spcw15, bout3 => spc8, ain1 => spcw14, bout2 => spc9, ain2 => spcw13, bout1 => spc10, ain3 => spcw12, bout0 => spc11, bin0 => spcw11, aout3 => spc12, bin1 => spcw10, aout2 => spc13, bin2 => spcw9, aout1 => spc14, bin3 => spcw8, aout0 => spc15, benb => spcwpass);
  spclch_4e18 : sn74s241 port map(aenb_n => \-spcwpass\, ain0 => spcw7, bout3 => spc0, ain1 => spcw6, bout2 => spc1, ain2 => spcw5, bout1 => spc2, ain3 => spcw4, bout0 => spc3, bin0 => spcw3, aout3 => spc4, bin1 => spcw2, aout2 => spc5, bin2 => spcw1, aout1 => spc6, bin3 => spcw0, aout0 => spc7, benb => spcwpass);
  spclch_4f18 : sn74s373 port map(oenb_n => \-spcpass\, o0 => nc174, i0 => nc175, i1 => nc176, o1 => nc177, o2 => nc178, i2 => nc179, i3 => nc180, o3 => nc181, hold_n => clk4d, o4 => spcpar, i4 => spcopar, i5 => spco18, o5 => spc18, o6 => spc17, i6 => spco17, i7 => spco16, o7 => spc16);
  spclch_4f19 : sn74s373 port map(oenb_n => \-spcpass\, o0 => spc15, i0 => spco15, i1 => spco14, o1 => spc14, o2 => spc13, i2 => spco13, i3 => spco12, o3 => spc12, hold_n => clk4d, o4 => spc11, i4 => spco11, i5 => spco10, o5 => spc10, o6 => spc9, i6 => spco9, i7 => spco8, o7 => spc8);
  spclch_4f20 : sn74s373 port map(oenb_n => \-spcpass\, o0 => spc7, i0 => spco7, i1 => spco6, o1 => spc6, o2 => spc5, i2 => spco5, i3 => spco4, o3 => spc4, hold_n => clk4d, o4 => spc3, i4 => spco3, i5 => spco2, o5 => spc2, o6 => spc1, i6 => spco1, i7 => spco0, o7 => spc0);
end architecture;
