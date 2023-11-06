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
      r2  : out std_logic;
      r3  : out std_logic;
      r4  : out std_logic;
      r5  : out std_logic;
      r6  : out std_logic;
      r7  : out std_logic;
      r8  : out std_logic;
      r9  : out std_logic;
      r10 : out std_logic;
      r11 : out std_logic;
      r12 : out std_logic;
      r13 : out std_logic;
      r14 : out std_logic;
      r15 : out std_logic;
      r16 : out std_logic;
      r17 : out std_logic;
      r18 : out std_logic;
      r19 : out std_logic
      );
  end component;

  component sip220_330_8 is
    port (
      r2 : out std_logic;
      r3 : out std_logic;
      r4 : out std_logic;
      r5 : out std_logic;
      r6 : out std_logic;
      r7 : out std_logic
      );
  end component;

  component sip330_470_8 is
    port (
      r2 : out std_logic;
      r3 : out std_logic;
      r4 : out std_logic;
      r5 : out std_logic;
      r6 : out std_logic;
      r7 : out std_logic
      );
  end component;

  alias am25s07 is am2507;
  alias am25s09 is am2509;
  alias am25s10 is am2510;

end;

package body other is

end;
