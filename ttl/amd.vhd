-- AMD components

library ieee;
use ieee.std_logic_1164.all;

-- the component names in this package are exact
-- there should not be any aliases

package amd is

    component am25ls2519 is
    port (
      d0         : in  std_logic; -- 1
      d1         : in  std_logic; -- 4
      d2         : in  std_logic; -- 13
      d3         : in  std_logic; -- 16
      e_n        : in  std_logic; -- 17
      cp         : in  std_logic; -- 9
      oe_y_n     : in  std_logic; -- 8
      oe_w_n     : in  std_logic; -- 7
      y0         : out std_logic; -- 3
      y1         : out std_logic; -- 6
      y2         : out std_logic; -- 11
      y3         : out std_logic; -- 14
      w0         : out std_logic; -- 2
      w1         : out std_logic; -- 5
      w2         : out std_logic; -- 12
      w3         : out std_logic; -- 15
      pol        : in  std_logic; -- 18
      clr_n      : in  std_logic -- 19
      );
  end component;

  component am25s07 is
    port(
      i0    : in  std_logic;
      i1    : in  std_logic;
      i2    : in  std_logic;
      i3    : in  std_logic;
      i4    : in  std_logic;
      i5    : in  std_logic;
      d0    : out std_logic;
      d1    : out std_logic;
      d2    : out std_logic;
      d3    : out std_logic;
      d4    : out std_logic;
      d5    : out std_logic;
      clk   : in  std_logic;
      enb_n : in  std_logic);
  end component;

  component am25s09 is
    port(
      a0  : in  std_logic;
      a1  : in  std_logic;
      aq  : out std_logic;
      b0  : in  std_logic;
      b1  : in  std_logic;
      bq  : out std_logic;
      c0  : in  std_logic;
      c1  : in  std_logic;
      cq  : out std_logic;
      d0  : in  std_logic;
      d1  : in  std_logic;
      dq  : out std_logic;
      sel : in  std_logic;
      clk : in  std_logic);
  end component;

  component am25s10 is
    port(
      i3   : in  std_logic;
      i2   : in  std_logic;
      i1   : in  std_logic;
      i0   : in  std_logic;
      i_1  : in  std_logic;
      i_2  : in  std_logic;
      i_3  : in  std_logic;
      sel1 : in  std_logic;
      sel0 : in  std_logic;
      ce_n : in  std_logic;
      o3   : out std_logic;
      o2   : out std_logic;
      o1   : out std_logic;
      o0   : out std_logic);
  end component;

  component am93s48 is
    port (
      i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11 : in  std_logic;
      pe                                               : out std_logic;
      po                                               : out std_logic
      );
  end component;

end;
