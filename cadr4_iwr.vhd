library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_iwr is
  port (
    gnd   : in  std_logic;
    iwr47 : out std_logic;
    aa15  : in  std_logic;
    aa14  : in  std_logic;
    iwr46 : out std_logic;
    iwr45 : out std_logic;
    aa13  : in  std_logic;
    aa12  : in  std_logic;
    iwr44 : out std_logic;
    clk2c : in  std_logic;
    iwr43 : out std_logic;
    aa11  : in  std_logic;
    aa10  : in  std_logic;
    iwr42 : out std_logic;
    iwr41 : out std_logic;
    aa9   : in  std_logic;
    aa8   : in  std_logic;
    iwr40 : out std_logic;
    iwr39 : out std_logic;
    aa7   : in  std_logic;
    aa6   : in  std_logic;
    iwr38 : out std_logic;
    iwr37 : out std_logic;
    aa5   : in  std_logic;
    aa4   : in  std_logic;
    iwr36 : out std_logic;
    iwr35 : out std_logic;
    aa3   : in  std_logic;
    aa2   : in  std_logic;
    iwr34 : out std_logic;
    iwr33 : out std_logic;
    aa1   : in  std_logic;
    aa0   : in  std_logic;
    iwr32 : out std_logic;
    iwr15 : out std_logic;
    m15   : in  std_logic;
    m14   : in  std_logic;
    iwr14 : out std_logic;
    iwr13 : out std_logic;
    m13   : in  std_logic;
    m12   : in  std_logic;
    iwr12 : out std_logic;
    clk4c : in  std_logic;
    iwr11 : out std_logic;
    m11   : in  std_logic;
    m10   : in  std_logic;
    iwr10 : out std_logic;
    iwr9  : out std_logic;
    m9    : in  std_logic;
    m8    : in  std_logic;
    iwr8  : out std_logic;
    iwr7  : out std_logic;
    m7    : in  std_logic;
    m6    : in  std_logic;
    iwr6  : out std_logic;
    iwr5  : out std_logic;
    m5    : in  std_logic;
    m4    : in  std_logic;
    iwr4  : out std_logic;
    iwr3  : out std_logic;
    m3    : in  std_logic;
    m2    : in  std_logic;
    iwr2  : out std_logic;
    iwr1  : out std_logic;
    m1    : in  std_logic;
    m0    : in  std_logic;
    iwr0  : out std_logic;
    iwr31 : out std_logic;
    m31   : in  std_logic;
    m30   : in  std_logic;
    iwr30 : out std_logic;
    iwr29 : out std_logic;
    m29   : in  std_logic;
    m28   : in  std_logic;
    iwr28 : out std_logic;
    iwr27 : out std_logic;
    m27   : in  std_logic;
    m26   : in  std_logic;
    iwr26 : out std_logic;
    iwr25 : out std_logic;
    m25   : in  std_logic;
    m24   : in  std_logic;
    iwr24 : out std_logic;
    iwr23 : out std_logic;
    m23   : in  std_logic;
    m22   : in  std_logic;
    iwr22 : out std_logic;
    iwr21 : out std_logic;
    m21   : in  std_logic;
    m20   : in  std_logic;
    iwr20 : out std_logic;
    iwr19 : out std_logic;
    m19   : in  std_logic;
    m18   : in  std_logic;
    iwr18 : out std_logic;
    iwr17 : out std_logic;
    m17   : in  std_logic;
    m16   : in  std_logic;
    iwr16 : out std_logic);
end;

architecture ttl of cadr4_iwr is
begin
  iwr_1f12 : sn74s374 port map(oenb_n => gnd, o0 => iwr47, i0 => aa15, i1 => aa14, o1 => iwr46, o2 => iwr45, i2 => aa13, i3 => aa12, o3 => iwr44, clk => clk2c, o4 => iwr43, i4 => aa11, i5 => aa10, o5 => iwr42, o6 => iwr41, i6 => aa9, i7 => aa8, o7 => iwr40);
  iwr_1f14 : sn74s374 port map(oenb_n => gnd, o0 => iwr39, i0 => aa7, i1 => aa6, o1 => iwr38, o2 => iwr37, i2 => aa5, i3 => aa4, o3 => iwr36, clk => clk2c, o4 => iwr35, i4 => aa3, i5 => aa2, o5 => iwr34, o6 => iwr33, i6 => aa1, i7 => aa0, o7 => iwr32);
  iwr_4b01 : sn74s374 port map(oenb_n => gnd, o0 => iwr15, i0 => m15, i1 => m14, o1 => iwr14, o2 => iwr13, i2 => m13, i3 => m12, o3 => iwr12, clk => clk4c, o4 => iwr11, i4 => m11, i5 => m10, o5 => iwr10, o6 => iwr9, i6 => m9, i7 => m8, o7 => iwr8);
  iwr_4b06 : sn74s374 port map(oenb_n => gnd, o0 => iwr7, i0 => m7, i1 => m6, o1 => iwr6, o2 => iwr5, i2 => m5, i3 => m4, o3 => iwr4, clk => clk4c, o4 => iwr3, i4 => m3, i5 => m2, o5 => iwr2, o6 => iwr1, i6 => m1, i7 => m0, o7 => iwr0);
  iwr_4c04 : sn74s374 port map(oenb_n => gnd, o0 => iwr31, i0 => m31, i1 => m30, o1 => iwr30, o2 => iwr29, i2 => m29, i3 => m28, o3 => iwr28, clk => clk4c, o4 => iwr27, i4 => m27, i5 => m26, o5 => iwr26, o6 => iwr25, i6 => m25, i7 => m24, o7 => iwr24);
  iwr_4c05 : sn74s374 port map(oenb_n => gnd, o0 => iwr23, i0 => m23, i1 => m22, o1 => iwr22, o2 => iwr21, i2 => m21, i3 => m20, o3 => iwr20, clk => clk4c, o4 => iwr19, i4 => m19, i5 => m18, o5 => iwr18, o6 => iwr17, i6 => m17, i7 => m16, o7 => iwr16);
end architecture;
