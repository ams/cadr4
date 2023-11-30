library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_spcw is
  port (
    destspcd : in  std_logic;
    reta12   : out std_logic;
    l12      : in  std_logic;
    spcw12   : out std_logic;
    reta13   : out std_logic;
    l13      : in  std_logic;
    spcw13   : out std_logic;
    spcw14   : out std_logic;
    l14      : in  std_logic;
    gnd      : in  std_logic;
    spcw15   : out std_logic;
    l15      : in  std_logic;
    reta8    : out std_logic;
    l8       : in  std_logic;
    spcw8    : out std_logic;
    reta9    : out std_logic;
    l9       : in  std_logic;
    spcw9    : out std_logic;
    spcw10   : out std_logic;
    l10      : in  std_logic;
    reta10   : out std_logic;
    spcw11   : out std_logic;
    l11      : in  std_logic;
    reta11   : out std_logic;
    reta4    : out std_logic;
    l4       : in  std_logic;
    spcw4    : out std_logic;
    reta5    : out std_logic;
    l5       : in  std_logic;
    spcw5    : out std_logic;
    spcw6    : out std_logic;
    l6       : in  std_logic;
    reta6    : out std_logic;
    spcw7    : out std_logic;
    l7       : in  std_logic;
    reta7    : out std_logic;
    reta0    : out std_logic;
    l0       : in  std_logic;
    spcw0    : out std_logic;
    reta1    : out std_logic;
    l1       : in  std_logic;
    spcw1    : out std_logic;
    spcw2    : out std_logic;
    l2       : in  std_logic;
    reta2    : out std_logic;
    spcw3    : out std_logic;
    l3       : in  std_logic;
    reta3    : out std_logic;
    n        : in  std_logic;
    ipc12    : in  std_logic;
    wpc12    : in  std_logic;
    wpc13    : in  std_logic;
    ipc13    : in  std_logic;
    clk4d    : in  std_logic;
    nc153    : out std_logic;
    nc154    : in  std_logic;
    nc155    : in  std_logic;
    nc156    : in  std_logic;
    nc157    : in  std_logic;
    nc158    : out std_logic;
    ipc8     : in  std_logic;
    wpc8     : in  std_logic;
    wpc9     : in  std_logic;
    ipc9     : in  std_logic;
    ipc10    : in  std_logic;
    wpc10    : in  std_logic;
    wpc11    : in  std_logic;
    ipc11    : in  std_logic;
    ipc4     : in  std_logic;
    wpc4     : in  std_logic;
    wpc5     : in  std_logic;
    ipc5     : in  std_logic;
    ipc6     : in  std_logic;
    wpc6     : in  std_logic;
    wpc7     : in  std_logic;
    ipc7     : in  std_logic;
    ipc0     : in  std_logic;
    wpc0     : in  std_logic;
    wpc1     : in  std_logic;
    ipc1     : in  std_logic;
    ipc2     : in  std_logic;
    wpc2     : in  std_logic;
    wpc3     : in  std_logic;
    ipc3     : in  std_logic;
    l16      : in  std_logic;
    spcw16   : out std_logic;
    l17      : in  std_logic;
    spcw17   : out std_logic;
    spcw18   : out std_logic;
    l18      : in  std_logic;
    nc159    : out std_logic;
    nc160    : in  std_logic;
    nc161    : in  std_logic);
end;

architecture ttl of cadr4_spcw is
begin
  spcw_4e11 : sn74s157 port map(sel => destspcd, a4 => reta12, b4 => l12, y4 => spcw12, a3 => reta13, b3 => l13, y3 => spcw13, y2 => spcw14, b2 => l14, a2 => gnd, y1 => spcw15, b1 => l15, a1 => gnd, enb_n => gnd);
  spcw_4e12 : sn74s157 port map(sel => destspcd, a4 => reta8, b4 => l8, y4 => spcw8, a3 => reta9, b3 => l9, y3 => spcw9, y2 => spcw10, b2 => l10, a2 => reta10, y1 => spcw11, b1 => l11, a1 => reta11, enb_n => gnd);
  spcw_4e13 : sn74s157 port map(sel => destspcd, a4 => reta4, b4 => l4, y4 => spcw4, a3 => reta5, b3 => l5, y3 => spcw5, y2 => spcw6, b2 => l6, a2 => reta6, y1 => spcw7, b1 => l7, a1 => reta7, enb_n => gnd);
  spcw_4e14 : sn74s157 port map(sel => destspcd, a4 => reta0, b4 => l0, y4 => spcw0, a3 => reta1, b3 => l1, y3 => spcw1, y2 => spcw2, b2 => l2, a2 => reta2, y1 => spcw3, b1 => l3, a1 => reta3, enb_n => gnd);
  spcw_4f11 : am25s09 port map(sel  => n, aq => reta12, a0 => ipc12, a1 => wpc12, b1 => wpc13, b0 => ipc13, bq => reta13, clk => clk4d, cq => nc153, c0 => nc154, c1 => nc155, d1 => nc156, d0 => nc157, dq => nc158);
  spcw_4f12 : am25s09 port map(sel  => n, aq => reta8, a0 => ipc8, a1 => wpc8, b1 => wpc9, b0 => ipc9, bq => reta9, clk => clk4d, cq => reta10, c0 => ipc10, c1 => wpc10, d1 => wpc11, d0 => ipc11, dq => reta11);
  spcw_4f13 : am25s09 port map(sel  => n, aq => reta4, a0 => ipc4, a1 => wpc4, b1 => wpc5, b0 => ipc5, bq => reta5, clk => clk4d, cq => reta6, c0 => ipc6, c1 => wpc6, d1 => wpc7, d0 => ipc7, dq => reta7);
  spcw_4f14 : am25s09 port map(sel  => n, aq => reta0, a0 => ipc0, a1 => wpc0, b1 => wpc1, b0 => ipc1, bq => reta1, clk => clk4d, cq => reta2, c0 => ipc2, c1 => wpc2, d1 => wpc3, d0 => ipc3, dq => reta3);
  spcw_4f15 : sn74s157 port map(sel => destspcd, a4 => gnd, b4 => l16, y4 => spcw16, a3 => gnd, b3 => l17, y3 => spcw17, y2 => spcw18, b2 => l18, a2 => gnd, y1 => nc159, b1 => nc160, a1 => nc161, enb_n => gnd);
end architecture;
