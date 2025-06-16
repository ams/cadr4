library ieee;
use ieee.std_logic_1164.all;

package other is

  component td25 is                     -- 25ns time delay, 5ns increments
    port (
      input                                 : in  std_logic;
      o_5ns, o_10ns, o_15ns, o_20ns, o_25ns : out std_logic
      );
  end component;

  component td50 is                     -- 50ns time delay, 10ns increments
    port (
      input                                  : in  std_logic;
      o_10ns, o_20ns, o_30ns, o_40ns, o_50ns : out std_logic
      );
  end component;

  component td100 is                    -- 100ns time delay, 20ns increments
    port (
      input                                   : in  std_logic;
      o_20ns, o_40ns, o_60ns, o_80ns, o_100ns : out std_logic
      );
  end component;

  component td250 is                    -- 250ns time delay, 50ns increments
    port (
      input                                      : in  std_logic;
      o_50ns, o_100ns, o_150ns, o_200ns, o_250ns : out std_logic
      );
  end component;

  component am93s48 is                  -- 12-input parity checker/generator
    port (
      i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11 : in  std_logic;
      pe                                               : out std_logic;
      po                                               : out std_logic
      );
  end component;

  component am2147
    port(
      a0   : in  std_logic;
      a1   : in  std_logic;
      a2   : in  std_logic;
      a3   : in  std_logic;
      a4   : in  std_logic;
      a5   : in  std_logic;
      do   : out std_logic;
      we_n : in  std_logic;
      ce_n : in  std_logic;
      di   : in  std_logic;
      a11  : in  std_logic;
      a10  : in  std_logic;
      a9   : in  std_logic;
      a8   : in  std_logic;
      a7   : in  std_logic;
      a6   : in  std_logic);
  end component;

  component am2507
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
  alias am25s07 is am2507;

  component am2509
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
  alias am25s09 is am2509;

  component am2510
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
  alias am25s10 is am2510;

  component am93425a is
    port (
      a0   : in  std_logic;
      a1   : in  std_logic;
      a2   : in  std_logic;
      a3   : in  std_logic;
      a4   : in  std_logic;
      a5   : in  std_logic;
      a6   : in  std_logic;
      a7   : in  std_logic;
      a8   : in  std_logic;
      a9   : in  std_logic;
      ce_n : in  std_logic;
      we_n : in  std_logic;
      di   : in  std_logic;
      do   : out std_logic
      );
  end component;

  component am252519 is
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
  alias am25ls2519 is am252519;

  component im5600 is
    generic (fn : string);
    port (
      o7   : out std_logic;
      o6   : out std_logic;
      o5   : out std_logic;
      o4   : out std_logic;
      o3   : out std_logic;
      o2   : out std_logic;
      o1   : out std_logic;
      o0   : out std_logic;
      a4   : in  std_logic;
      a3   : in  std_logic;
      a2   : in  std_logic;
      a1   : in  std_logic;
      a0   : in  std_logic;
      ce_n : in  std_logic
      );
  end component;
  alias im5610 is im5600;

  component dm9328 is
    port (
      clr_n  : in  std_logic;
      aq_n   : out std_logic;
      aq     : out std_logic;
      asel   : in  std_logic;
      ai1    : in  std_logic;
      ai0    : in  std_logic;
      aclk   : in  std_logic;
      comclk : in  std_logic;
      bclk   : in  std_logic;
      bi0    : in  std_logic;
      bi1    : in  std_logic;
      bsel   : in  std_logic;
      bq     : out std_logic;
      bq_n   : out std_logic
      );
  end component;

  component dm8221 is
    port (
      d1     : out std_logic;
      i1     : in  std_logic;
      we1_n  : in  std_logic;
      i0     : in  std_logic;
      d0     : out std_logic;
      we0_n  : in  std_logic;
      a0     : in  std_logic;
      a1     : in  std_logic;
      a2     : in  std_logic;
      a3     : in  std_logic;
      a4     : in  std_logic;
      strobe : in  std_logic;
      wclk_n : in  std_logic;
      ce     : in  std_logic
      );
  end component;
  alias dm82s21 is dm8221;

  component dm9346
    port (
      a5  : in  std_logic;
      a4  : in  std_logic;
      a3  : in  std_logic;
      a2  : in  std_logic;
      a1  : in  std_logic;
      a0  : in  std_logic;
      b5  : in  std_logic;
      b4  : in  std_logic;
      b3  : in  std_logic;
      b2  : in  std_logic;
      b1  : in  std_logic;
      b0  : in  std_logic;
      enb : in  std_logic;
      eq  : out std_logic
      );
  end component;
  alias dm93s46 is dm9346;

  component dm942
    port (
      g1a1 : in  std_logic;
      g1b1 : in  std_logic;
      g2a1 : in  std_logic;
      g2b1 : in  std_logic;
      g2c1 : in  std_logic;
      g2d1 : in  std_logic;
      out1 : out std_logic;
      g1a2 : in  std_logic;
      g1b2 : in  std_logic;
      g2a2 : in  std_logic;
      g2b2 : in  std_logic;
      g2c2 : in  std_logic;
      g2d2 : in  std_logic;
      out2 : out std_logic
      );
  end component;
  alias dm9s42_1 is dm942;

  component dm74472 is
    generic (fn : string := "");
    port (
      a0   : in  std_logic;
      a1   : in  std_logic;
      a2   : in  std_logic;
      a3   : in  std_logic;
      a4   : in  std_logic;
      d0   : out std_logic;
      d1   : out std_logic;
      d2   : out std_logic;
      d3   : out std_logic;
      d4   : out std_logic;
      d5   : out std_logic;
      d6   : out std_logic;
      d7   : out std_logic;
      ce_n : in  std_logic;
      a5   : in  std_logic;
      a6   : in  std_logic;
      a7   : in  std_logic;
      a8   : in  std_logic
      );
  end component;
  alias dm74s472 is dm74472;

  component til309 is
    port (
      i1, i2, i4, i8 : in  std_logic;
      dp             : in  std_logic;
      latch          : in  std_logic;
      blank_n        : in  std_logic;
      ldp            : in  std_logic;
      test_n         : in  std_logic;
      l1, l2, l4, l8 : out std_logic
      );
  end component;

  component res20 is
    port (
      r2  : inout std_logic;
      r3  : inout std_logic;
      r4  : inout std_logic;
      r5  : inout std_logic;
      r6  : inout std_logic;
      r7  : inout std_logic;
      r8  : inout std_logic;
      r9  : inout std_logic;
      r10 : inout std_logic;
      r11 : inout std_logic;
      r12 : inout std_logic;
      r13 : inout std_logic;
      r14 : inout std_logic;
      r15 : inout std_logic;
      r16 : inout std_logic;
      r17 : inout std_logic;
      r18 : inout std_logic;
      r19 : inout std_logic
      );
  end component;

  component sip220_330_8 is
    port (
      r2 : inout std_logic;
      r3 : inout std_logic;
      r4 : inout std_logic;
      r5 : inout std_logic;
      r6 : inout std_logic;
      r7 : inout std_logic
      );
  end component;

  component sip330_470_8 is
    port (
      r2 : inout std_logic;
      r3 : inout std_logic;
      r4 : inout std_logic;
      r5 : inout std_logic;
      r6 : inout std_logic;
      r7 : inout std_logic
      );
  end component;

  component ic_16dummy port(
    \-boot2\       : out std_logic; -- 13
    \-power reset\ : out std_logic  -- 12
    ); end component;

end;
