library ieee;
use ieee.std_logic_1164.all;

package sn74 is

  component sn7400 is  -- Quadruple 2-input Positive-NAND Gates
    port (
      g1a, g1b : in  std_logic;
      g1q_n    : out std_logic;

      g2a, g2b : in  std_logic;
      g2q_n    : out std_logic;

      g3a, g3b : in  std_logic;
      g3q_n    : out std_logic;

      g4a, g4b : in  std_logic;
      g4q_n    : out std_logic
      );
  end component;
  alias sn74s00 is sn7400;

  component sn7402 is                   -- Quadruple 2-Input Positive-NOR Gates
    port (
      g1a, g1b : in  std_logic;
      g1q_n    : out std_logic;

      g2b, g2a : in  std_logic;
      g2q_n    : out std_logic;

      g3a, g3b : in  std_logic;
      g3q_n    : out std_logic;

      g4a, g4b : in  std_logic;
      g4q_n    : out std_logic
      );
  end component;
  alias sn74s02 is sn7402;

  component sn7404 is                   -- Hex Inverters
    port (
      g1a   : in  std_logic;
      g1q_n : out std_logic;

      g2a   : in  std_logic;
      g2q_n : out std_logic;

      g3a   : in  std_logic;
      g3q_n : out std_logic;

      g4a   : in  std_logic;
      g4q_n : out std_logic;

      g5a   : in  std_logic;
      g5q_n : out std_logic;

      g6a   : in  std_logic;
      g6q_n : out std_logic
      );
  end component;
  alias sn74s04 is sn7404;

  component sn7408 is                   -- Quadruple 2-Input Positive-AND Gates
    port (
      g1a, g1b : in  std_logic;
      g1q      : out std_logic;

      g2a, g2b : in  std_logic;
      g2q      : out std_logic;

      g3a, g3b : in  std_logic;
      g3q      : out std_logic;

      g4a, g4b : in  std_logic;
      g4q      : out std_logic
      );
  end component;
  alias sn74s08 is sn7408;

  component sn7410 is                   -- Tripple 3-Input Positive-NAND Gates
    port (
      g1a, g1b, g1c : in  std_logic;
      g1y_n         : out std_logic;

      g2a, g2b, g2c : in  std_logic;
      g2y_n         : out std_logic;

      g3a, g3b, g3c : in  std_logic;
      g3y_n         : out std_logic
      );
  end component;
  alias sn74s10 is sn7410;

  component sn7411 is                   -- Triple 3-Input Positive-AND Gates
    port (
      g1a, g1b, g1c : in  std_logic;
      g1y           : out std_logic;
      g2a, g2b, g2c : in  std_logic;
      g2y           : out std_logic;
      g3a, g3b, g3c : in  std_logic;
      g3y           : out std_logic
      );
  end component;
  alias sn74s11 is sn7411;

  component sn7420 is                   -- Dual 4-Input Positive-NAND Gates
    port (
      g1a, g1b, g1c, g1d : in  std_logic;
      g1y_n              : out std_logic;

      g2a, g2b, g2c, g2d : in  std_logic;
      g2y_n              : out std_logic
      );
  end component;
  alias sn74s20 is sn7420;

  component sn7428 is                   -- Quadruple 2-input Positive-NOR Gates
    port (
      g1a, g1b : in  std_logic;
      g1q_n    : out std_logic;

      g2a, g2b : in  std_logic;
      g2q_n    : out std_logic;

      g3a, g3b : in  std_logic;
      g3q_n    : out std_logic;

      g4a, g4b : in  std_logic;
      g4q_n    : out std_logic
      );
  end component;

  component sn7432 is                   -- Quadruple 2-Input Positive-OR Gates
    port (
      g1a, g1b : in  std_logic;
      g1y      : out std_logic;

      g2a, g2b : in  std_logic;
      g2y      : out std_logic;

      g3a, g3b : in  std_logic;
      g3y      : out std_logic;

      g4a, g4b : in  std_logic;
      g4y      : out std_logic
      );
  end component;
  alias sn74s32 is sn7432;

  component sn7437 is  -- Quadruple 2-Input Positive-NAND Buffers
    port (
      g1a, g1b : in  std_logic;
      g1y      : out std_logic;

      g2a, g2b : in  std_logic;
      g2y      : out std_logic;

      g3a, g3b : in  std_logic;
      g3y      : out std_logic;

      g4a, g4b : in  std_logic;
      g4y      : out std_logic
      );
  end component;
  alias sn74s37 is sn7437;

  component sn7451 is                   -- AND-OR-invert gates
    port (
      g1a, g1b, g1c, g1d : in  std_logic;
      g1y                : out std_logic;

      g2a, g2b, g2c, g2d : in  std_logic;
      g2y                : out std_logic
      );
  end component;
  alias sn74s51 is sn7451;

  --- Unsorted

  component sn7486 is                   -- Quadruple 2-input Exclusive-OR Gates
    port (
      g1a, g1b : in  std_logic;
      g1y      : out std_logic;

      g2a, g2b : in  std_logic;
      g2y      : out std_logic;

      g3a, g3b : in  std_logic;
      g3y      : out std_logic;

      g4a, g4b : in  std_logic;
      g4y      : out std_logic
      );
  end component;
  alias sn74s86 is sn7486;

  component sn74260 is                  -- Dual 5-Input Positive-NOR Gates
    port (
      g1a, g2a, g3a, g4a, g5a : in  std_logic;
      g1y_n                   : out std_logic
      );
  end component;
  alias sn74s260 is sn74260;

  component sn74240 is  -- Octal Buffers and Line Drivers With 3-State Outputs
    port (
      aenb_n                     : in  std_logic;
      ain0, ain1, ain2, ain3     : in  std_logic;
      aout0, aout1, aout2, aout3 : out std_logic;

      benb_n                     : in  std_logic;
      bin0                       : in  std_logic;
      bin1, bin2, bin3           : in  std_logic;
      bout0, bout1, bout2, bout3 : out std_logic
      );
  end component;
  alias sn74s240 is sn74240;

  component sn74109 is
    port (
      clr1_n : in  std_logic;
      j1     : in  std_logic;
      k1_n   : in  std_logic;
      clk1   : in  std_logic;
      pre1_n : in  std_logic;
      q1     : out std_logic;
      q1_n   : out std_logic;

      clr2_n : in  std_logic;
      j2     : in  std_logic;
      k2_n   : in  std_logic;
      clk2   : in  std_logic;
      pre2_n : in  std_logic;
      q2     : out std_logic;
      q2_n   : out std_logic
      );
  end component;
  alias sn74ls109 is sn74109;

  component sn7414 is
    port (
      g1a   : in  std_logic;
      g1q_n : out std_logic;
      g2a   : in  std_logic;
      g2q_n : out std_logic;
      g3a   : in  std_logic;
      g3q_n : out std_logic;
      g4q   : out std_logic;
      g4a   : in  std_logic;
      g5q_n : out std_logic;
      g5a   : in  std_logic;
      g6q_n : out std_logic;
      g6a   : in  std_logic
      );
  end component;
  alias sn74ls14 is sn7414;

  component sn74244 is
    port (
      aenb_n : in  std_logic;
      ain0   : in  std_logic;
      bout3  : out std_logic;
      ain1   : in  std_logic;
      bout2  : out std_logic;
      ain2   : in  std_logic;
      bout1  : out std_logic;
      ain3   : in  std_logic;
      bout0  : out std_logic;
      bin0   : in  std_logic;
      aout3  : out std_logic;
      bin1   : in  std_logic;
      aout2  : out std_logic;
      bin2   : in  std_logic;
      aout1  : out std_logic;
      bin3   : in  std_logic;
      aout0  : out std_logic;
      benb_n : in  std_logic
      );
  end component;
  alias sn74ls244 is sn74244;

  component sn74133 is
    port (
      g   : in  std_logic;
      f   : in  std_logic;
      e   : in  std_logic;
      d   : in  std_logic;
      c   : in  std_logic;
      b   : in  std_logic;
      a   : in  std_logic;
      q_n : out std_logic;
      h   : in  std_logic;
      i   : in  std_logic;
      j   : in  std_logic;
      k   : in  std_logic;
      l   : in  std_logic;
      m   : in  std_logic
      );
  end component;
  alias sn74s133 is sn74133;

  component sn74138 is
    port (
      a   : in  std_logic;
      b   : in  std_logic;
      c   : in  std_logic;
      g2a : in  std_logic;
      g2b : in  std_logic;
      g1  : in  std_logic;
      y7  : out std_logic;
      y6  : out std_logic;
      y5  : out std_logic;
      y4  : out std_logic;
      y3  : out std_logic;
      y2  : out std_logic;
      y1  : out std_logic;
      y0  : out std_logic
      );
  end component;
  alias sn74s138 is sn74138;

  component sn74139 is
    port (
      g1   : in  std_logic;
      a1   : in  std_logic;
      b1   : in  std_logic;
      g1y0 : out std_logic;
      g1y1 : out std_logic;
      g1y2 : out std_logic;
      g1y3 : out std_logic;
      g2y3 : out std_logic;
      g2y2 : out std_logic;
      g2y1 : out std_logic;
      g2y0 : out std_logic;
      b2   : in  std_logic;
      a2   : in  std_logic;
      g2   : in  std_logic
      );
  end component;
  alias sn74s139 is sn74139;

  component sn74151 is
    port (
      i0   : in  std_logic;
      i1   : in  std_logic;
      i2   : in  std_logic;
      i3   : in  std_logic;
      i4   : in  std_logic;
      i5   : in  std_logic;
      i6   : in  std_logic;
      i7   : in  std_logic;
      q    : out std_logic;
      q_n  : out std_logic;
      sel2 : in  std_logic;
      sel1 : in  std_logic;
      sel0 : in  std_logic;
      ce_n : in  std_logic
      );
  end component;
  alias sn74s151 is sn74151;

  component sn74153 is
    port (
      enb1_n : in  std_logic;
      sel1   : in  std_logic;
      g1c3   : in  std_logic;
      g1c2   : in  std_logic;
      g1c1   : in  std_logic;
      g1c0   : in  std_logic;
      g1q    : out std_logic;
      g2q    : out std_logic;
      g2c0   : in  std_logic;
      g2c1   : in  std_logic;
      g2c2   : in  std_logic;
      g2c3   : in  std_logic;
      sel0   : in  std_logic;
      enb2_n : in  std_logic
      );
  end component;
  alias sn74s153 is sn74153;

  component sn74157 is
    port (
      sel   : in  std_logic;
      a4    : in  std_logic;
      b4    : in  std_logic;
      y4    : out std_logic;
      a3    : in  std_logic;
      b3    : in  std_logic;
      y3    : out std_logic;
      y2    : out std_logic;
      b2    : in  std_logic;
      a2    : in  std_logic;
      y1    : out std_logic;
      b1    : in  std_logic;
      a1    : in  std_logic;
      enb_n : in  std_logic
      );
  end component;
  alias sn74s157 is sn74157;

  component sn74169 is
    port (
      co_n : out std_logic;
      i3   : in  std_logic;
      i2   : in  std_logic;
      i1   : in  std_logic;
      i0   : in  std_logic;

      o3 : out std_logic;
      o2 : out std_logic;
      o1 : out std_logic;
      o0 : out std_logic;

      enb_t_n : in std_logic;
      enb_p_n : in std_logic;
      load_n  : in std_logic;
      up_dn   : in std_logic;
      clk     : in std_logic
      );
  end component;
  alias sn74s169 is sn74169;

  component sn74174 is
    port (
      clr_n : in  std_logic;
      q1    : out std_logic;
      d1    : in  std_logic;
      d2    : in  std_logic;
      q2    : out std_logic;
      d3    : in  std_logic;
      q3    : out std_logic;
      clk   : in  std_logic;
      q4    : out std_logic;
      d4    : in  std_logic;
      q5    : out std_logic;
      d5    : in  std_logic;
      d6    : in  std_logic;
      q6    : out std_logic
      );
  end component;
  alias sn74s174 is sn74174;

  component sn74175 is
    port (
      d0   : in  std_logic;
      q0   : out std_logic;
      q0_n : out std_logic;

      d1   : in  std_logic;
      q1   : out std_logic;
      q1_n : out std_logic;

      d2   : in  std_logic;
      q2   : out std_logic;
      q2_n : out std_logic;

      d3   : in  std_logic;
      q3   : out std_logic;
      q3_n : out std_logic;

      clr_n : in std_logic;
      clk   : in std_logic
      );
  end component;
  alias sn74s175 is sn74175;

  component sn74181 is
    port (
      cout_n : out std_logic;
      y      : out std_logic;
      x      : out std_logic;
      aeb    : out std_logic;

      f3 : out std_logic;
      f2 : out std_logic;
      f1 : out std_logic;
      f0 : out std_logic;

      b3 : in std_logic;
      b2 : in std_logic;
      b1 : in std_logic;
      b0 : in std_logic;

      a3 : in std_logic;
      a2 : in std_logic;
      a1 : in std_logic;
      a0 : in std_logic;

      m  : in std_logic;
      s3 : in std_logic;
      s2 : in std_logic;
      s1 : in std_logic;
      s0 : in std_logic;

      cin_n : in std_logic
      );
  end component;
  alias sn74s181 is sn74181;

  component sn74182 is
    port (
      xout : out std_logic;
      yout : out std_logic;
      x3   : out std_logic;
      y3   : out std_logic;

      cout2_n : out std_logic;
      x2      : in  std_logic;
      y2      : in  std_logic;

      cout1_n : out std_logic;
      x1      : in  std_logic;
      y1      : in  std_logic;

      cout0_n : out std_logic;
      x0      : in  std_logic;
      y0      : in  std_logic;

      cin_n : in std_logic
      );
  end component;
  alias sn74s182 is sn74182;

  component sn74194 is
    port (
      clr_n : in  std_logic;
      sir   : in  std_logic;
      i0    : in  std_logic;
      i1    : in  std_logic;
      i2    : in  std_logic;
      i3    : in  std_logic;
      sil   : in  std_logic;
      s0    : in  std_logic;
      s1    : in  std_logic;
      clk   : in  std_logic;
      q3    : out std_logic;
      q2    : out std_logic;
      q1    : out std_logic;
      q0    : out std_logic
      );
  end component;
  alias sn74s194 is sn74194;


  component sn74241 is
    port (
      aenb_n : in  std_logic;
      ain0   : in  std_logic;
      bout3  : out std_logic;
      ain1   : in  std_logic;
      bout2  : out std_logic;
      ain2   : in  std_logic;
      bout1  : out std_logic;
      ain3   : in  std_logic;
      bout0  : out std_logic;
      bin0   : in  std_logic;
      aout3  : out std_logic;
      bin1   : in  std_logic;
      aout2  : out std_logic;
      bin2   : in  std_logic;
      aout1  : out std_logic;
      bin3   : in  std_logic;
      aout0  : out std_logic;
      benb   : in  std_logic
      );
  end component;
  alias sn74s241 is sn74241;

  component sn74258 is
    port (
      a0    : in  std_logic;
      a1    : in  std_logic;
      ay    : out std_logic;
      b0    : in  std_logic;
      b1    : in  std_logic;
      by    : out std_logic;
      c0    : in  std_logic;
      c1    : in  std_logic;
      cy    : out std_logic;
      d0    : in  std_logic;
      d1    : in  std_logic;
      dy    : out std_logic;
      sel   : in  std_logic;
      enb_n : in  std_logic
      );
  end component;
  alias sn74s258 is sn74258;

  component sn74280 is
    port (
      i0   : in  std_logic;
      i1   : in  std_logic;
      i2   : in  std_logic;
      even : out std_logic;
      odd  : out std_logic;
      i3   : in  std_logic;
      i4   : in  std_logic;
      i5   : in  std_logic;
      i6   : in  std_logic;
      i7   : in  std_logic;
      i8   : in  std_logic
      );
  end component;
  alias sn74s280 is sn74280;

  component sn74283 is
    port (
      c4 : out std_logic;

      a3 : in std_logic;
      a2 : in std_logic;
      a1 : in std_logic;
      a0 : in std_logic;

      s3 : out std_logic;
      s2 : out std_logic;
      s1 : out std_logic;
      s0 : out std_logic;

      b3 : in std_logic;
      b2 : in std_logic;
      b1 : in std_logic;
      b0 : in std_logic;

      c0 : in std_logic
      );
  end component;
  alias sn74s283 is sn74283;

  component sn74373 is
    port (
      i0     : in  std_logic;
      i1     : in  std_logic;
      i2     : in  std_logic;
      i3     : in  std_logic;
      i4     : in  std_logic;
      i5     : in  std_logic;
      i6     : in  std_logic;
      i7     : in  std_logic;
      o0     : out std_logic;
      o1     : out std_logic;
      o2     : out std_logic;
      o3     : out std_logic;
      o4     : out std_logic;
      o5     : out std_logic;
      o6     : out std_logic;
      o7     : out std_logic;
      hold_n : in  std_logic;
      oenb_n : in  std_logic
      );
  end component;
  alias sn74s373 is sn74373;

  component sn74374 is
    port (
      i0     : in  std_logic;
      i1     : in  std_logic;
      i2     : in  std_logic;
      i3     : in  std_logic;
      i4     : in  std_logic;
      i5     : in  std_logic;
      i6     : in  std_logic;
      i7     : in  std_logic;
      o0     : out std_logic;
      o1     : out std_logic;
      o2     : out std_logic;
      o3     : out std_logic;
      o4     : out std_logic;
      o5     : out std_logic;
      o6     : out std_logic;
      o7     : out std_logic;
      clk    : in  std_logic;
      oenb_n : in  std_logic
      );
  end component;
  alias sn74s374 is sn74374;

  component sn7464 is
    port (
      d4    : in  std_logic;
      b2    : in  std_logic;
      a2    : in  std_logic;
      c3    : in  std_logic;
      b3    : in  std_logic;
      a3    : in  std_logic;
      \out\ : out std_logic;
      a1    : in  std_logic;
      b1    : in  std_logic;
      c4    : in  std_logic;
      b4    : in  std_logic;
      a4    : in  std_logic
      );
  end component;
  alias sn74s64 is sn7464;

  component sn7474 is
    port (
      g1r_n : in  std_logic;
      g1d   : in  std_logic;
      g1clk : in  std_logic;
      g1s_n : in  std_logic;
      g1q   : out std_logic;
      g1q_n : out std_logic;
      g2q_n : out std_logic;
      g2q   : out std_logic;
      g2s_n : in  std_logic;
      g2clk : in  std_logic;
      g2d   : in  std_logic;
      g2r_n : in  std_logic
      );
  end component;
  alias sn74s74 is sn7474;

end;

package body sn74 is

end;
