library ieee;
use ieee.std_logic_1164.all;

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
  port (
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
      enb_n : in  std_logic
      );
  end component;

  component am25s09 is
  port (
      clk : in  std_logic;
      sel : in  std_logic;
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
      dq  : out std_logic
      );
  end component;

  component am25s10 is
  port (
      sel1 : in  std_logic;
      sel0 : in  std_logic;
      ce_n : in  std_logic;
      i3   : in  std_logic;
      i2   : in  std_logic;
      i1   : in  std_logic;
      i0   : in  std_logic;
      i_1  : in  std_logic;
      i_2  : in  std_logic;
      i_3  : in  std_logic;
      o0   : out std_logic;
      o1   : out std_logic;
      o2   : out std_logic;
      o3   : out std_logic
      );
  end component;

  component am26s10 is
  port (
      e_n : in  std_logic; -- Active-low enable 
      i0  : in  std_logic; -- Input 0
      i1  : in  std_logic; -- Input 1  
      i2  : in  std_logic; -- Input 2
      i3  : in  std_logic; -- Input 3
      b0  : inout std_logic; -- Inverting bidirectional bus 0
      b1  : inout std_logic; -- Inverting bidirectional bus 1
      b2  : inout std_logic; -- Inverting bidirectional bus 2
      b3  : inout std_logic; -- Inverting bidirectional bus 3
      z0  : out std_logic; -- Non-inverting output 0
      z1  : out std_logic; -- Non-inverting output 1
      z2  : out std_logic; -- Non-inverting output 2
      z3  : out std_logic  -- Non-inverting output 3
      );
  end component;

  component am29701 is
  port (
      i1      : in  std_logic;
      i2      : in  std_logic;
      i3      : in  std_logic;
      i4      : in  std_logic;
      o1      : out std_logic;
      o2      : out std_logic;
      o3      : out std_logic;
      o4      : out std_logic;
      a0      : in  std_logic;
      a1      : in  std_logic;
      a2      : in  std_logic;
      a3      : in  std_logic;
      write_n : in  std_logic;
      ce_n    : in  std_logic
    );
  end component;

  component am8304 is
  port (
      a0           : inout std_logic;
      a1           : inout std_logic;
      a2           : inout std_logic;
      a3           : inout std_logic;
      a4           : inout std_logic;
      a5           : inout std_logic;
      a6           : inout std_logic;
      a7           : inout std_logic;
      b0           : inout std_logic;
      b1           : inout std_logic;
      b2           : inout std_logic;
      b3           : inout std_logic;
      b4           : inout std_logic;
      b5           : inout std_logic;
      b6           : inout std_logic;
      b7           : inout std_logic;
      chip_disable : in    std_logic;
      transmit     : in    std_logic
      );
  end component;

  component am93s48 is
  port (
      i0  : in  std_logic; -- Pin 11
      i1  : in  std_logic; -- Pin 12
      i2  : in  std_logic; -- Pin 13
      i3  : in  std_logic; -- Pin 14
      i4  : in  std_logic; -- Pin 15
      i5  : in  std_logic; -- Pin 1
      i6  : in  std_logic; -- Pin 2
      i7  : in  std_logic; -- Pin 3
      i8  : in  std_logic; -- Pin 4
      i9  : in  std_logic; -- Pin 5
      i10 : in  std_logic; -- Pin 6
      i11 : in  std_logic; -- Pin 7
      pe  : out std_logic; -- Pin 10
      po  : out std_logic  -- Pin 9
      );
  end component;

end package;
