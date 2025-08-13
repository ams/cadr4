library ieee;
use ieee.std_logic_1164.all;

package sn74 is

  component sn7400 is
  port (
      g1a   : in  std_logic;
      g1b   : in  std_logic;
      g1q_n : out std_logic;

      g2a   : in  std_logic;
      g2b   : in  std_logic;
      g2q_n : out std_logic;

      g3a   : in  std_logic;
      g3b   : in  std_logic;
      g3q_n : out std_logic;

      g4a   : in  std_logic;
      g4b   : in  std_logic;
      g4q_n : out std_logic
      );
  end component;

  component sn7402 is
  port (
      g1q_n : out std_logic; -- Pin 1
      g1a   : in  std_logic; -- Pin 2
      g1b   : in  std_logic; -- Pin 3

      g2q_n : out std_logic; -- Pin 4
      g2a   : in  std_logic; -- Pin 5
      g2b   : in  std_logic; -- Pin 6

      g3a   : in  std_logic; -- Pin 8
      g3b   : in  std_logic; -- Pin 9
      g3q_n : out std_logic; -- Pin 10

      g4a   : in  std_logic; -- Pin 11
      g4b   : in  std_logic; -- Pin 12
      g4q_n : out std_logic  -- Pin 13
      );
  end component;

  component sn7404 is
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

  component sn7408 is
  port (
      g1a : in  std_logic; -- Pin 1
      g1b : in  std_logic; -- Pin 2
      g1q : out std_logic; -- Pin 3

      g2a : in  std_logic; -- Pin 4
      g2b : in  std_logic; -- Pin 5
      g2q : out std_logic; -- Pin 6

      g3a : in  std_logic; -- Pin 9
      g3b : in  std_logic; -- Pin 10
      g3q : out std_logic; -- Pin 8

      g4a : in  std_logic; -- Pin 12
      g4b : in  std_logic; -- Pin 13
      g4q : out std_logic  -- Pin 11
      );
  end component;

  component sn7410 is
  port (
      g1a   : in  std_logic; -- Pin 1
      g1b   : in  std_logic; -- Pin 2
      g1c   : in  std_logic; -- Pin 13
      g1y_n : out std_logic; -- Pin 12

      g2a   : in  std_logic; -- Pin 3
      g2b   : in  std_logic; -- Pin 4
      g2c   : in  std_logic; -- Pin 5
      g2y_n : out std_logic; -- Pin 6

      g3a   : in  std_logic; -- Pin 9
      g3b   : in  std_logic; -- Pin 10
      g3c   : in  std_logic; -- Pin 11
      g3y_n : out std_logic  -- Pin 8
      );
  end component;

  component sn74109 is
  port (
      clr1_n : in  std_logic;
      j1     : in  std_logic;
      k1_n   : in  std_logic;
      clk1   : in  std_logic;
      pre1_n : in  std_logic;
      q1     : out std_logic;
      q1_n   : out std_logic;

      q2_n   : out std_logic;
      q2     : out std_logic;
      pre2_n : in  std_logic;
      clk2   : in  std_logic;
      k2_n   : in  std_logic;
      j2     : in  std_logic;
      clr2_n : in  std_logic
      );
  end component;

  component sn7411 is
  port (
      g1a : in  std_logic; -- Pin 1
      g1b : in  std_logic; -- Pin 2
      g1c : in  std_logic; -- Pin 13
      g1y : out std_logic; -- Pin 12

      g2a : in  std_logic; -- Pin 3
      g2b : in  std_logic; -- Pin 4
      g2c : in  std_logic; -- Pin 5
      g2y : out std_logic; -- Pin 6

      g3a : in  std_logic; -- Pin 9
      g3b : in  std_logic; -- Pin 10
      g3c : in  std_logic; -- Pin 11
      g3y : out std_logic  -- Pin 8
      );
  end component;

  component sn74112 is
  port (
      clr1_n : in  std_logic;
      j1     : in  std_logic;
      k1     : in  std_logic;
      clk1   : in  std_logic;
      pre1_n : in  std_logic;
      q1     : out std_logic;
      q1_n   : out std_logic;

      q2_n   : out std_logic;
      q2     : out std_logic;
      pre2_n : in  std_logic;
      clk2   : in  std_logic;
      k2     : in  std_logic;
      j2     : in  std_logic;
      clr2_n : in  std_logic
      );
  end component;

  component sn74124 is
  port (
      en_n : in  std_logic;
      y    : out std_logic
    );
  end component;

  component sn74133 is
  port (
      a   : in  std_logic; -- Pin 1
      b   : in  std_logic; -- Pin 2
      c   : in  std_logic; -- Pin 3
      d   : in  std_logic; -- Pin 4
      e   : in  std_logic; -- Pin 5
      f   : in  std_logic; -- Pin 6
      h   : in  std_logic; -- Pin 10
      i   : in  std_logic; -- Pin 11
      j   : in  std_logic; -- Pin 12
      k   : in  std_logic; -- Pin 13
      l   : in  std_logic; -- Pin 14
      m   : in  std_logic; -- Pin 15
      g   : in  std_logic; -- Pin 9
      q_n : out std_logic  -- Pin 8
      );
  end component;

  component sn74138 is
  port (
      sel2 : in  std_logic;
      sel1 : in  std_logic;
      sel0 : in  std_logic;
      g1   : in  std_logic;
      g2a  : in  std_logic;
      g2b  : in  std_logic;
      y0   : out std_logic;
      y1   : out std_logic;
      y2   : out std_logic;
      y3   : out std_logic;
      y4   : out std_logic;
      y5   : out std_logic;
      y6   : out std_logic;
      y7   : out std_logic
      );
  end component;

  component sn74139 is
  port (    
      g1y3 : out std_logic; -- Pin 7  
      g1y2 : out std_logic; -- Pin 6
      g1y1 : out std_logic; -- Pin 5
      g1y0 : out std_logic; -- Pin 4  
      g1s1 : in  std_logic; -- Pin 3
      g1s0 : in  std_logic; -- Pin 2
      g1e_n: in  std_logic; -- Pin 1

      g2y3 : out std_logic; -- Pin 9
      g2y2 : out std_logic; -- Pin 10
      g2y1 : out std_logic; -- Pin 11
      g2y0 : out std_logic; -- Pin 12
      g2s1 : in  std_logic; -- Pin 13
      g2s0 : in  std_logic; -- Pin 14
      g2e_n: in  std_logic  -- Pin 15
      );
  end component;

  component sn7414 is
  port (
      g1a   : in  std_logic; -- Pin 1
      g1q_n : out std_logic; -- Pin 2
      g2a   : in  std_logic; -- Pin 3
      g2q_n : out std_logic; -- Pin 4
      g3a   : in  std_logic; -- Pin 5
      g3q_n : out std_logic; -- Pin 6
      g4a   : in  std_logic; -- Pin 9
      g4q_n : out std_logic; -- Pin 8
      g5a   : in  std_logic; -- Pin 11
      g5q_n : out std_logic; -- Pin 10
      g6a   : in  std_logic; -- Pin 13
      g6q_n : out std_logic  -- Pin 12
      );
  end component;

  component sn74151 is
  port (
      i0   : in std_logic;
      i1   : in std_logic;
      i2   : in std_logic;
      i3   : in std_logic;
      i4   : in std_logic;
      i5   : in std_logic;
      i6   : in std_logic;
      i7   : in std_logic;
      sel0 : in std_logic;
      sel1 : in std_logic;
      sel2 : in std_logic;
      ce_n : in std_logic;
      q    : out std_logic;
      q_n  : out std_logic
      );
  end component;

  component sn74153 is
  port (    
      g1c0   : in  std_logic; -- Pin 6
      g1c1   : in  std_logic; -- Pin 5
      g1c2   : in  std_logic; -- Pin 4
      g1c3   : in  std_logic; -- Pin 3
      enb1_n : in  std_logic; -- Pin 1
      g1y    : out std_logic; -- Pin 7


      g2c0   : in  std_logic; -- Pin 10
      g2c1   : in  std_logic; -- Pin 11
      g2c2   : in  std_logic; -- Pin 12
      g2c3   : in  std_logic; -- Pin 13
      enb2_n : in  std_logic; -- Pin 15
      g2y    : out std_logic; -- Pin 9

      sela   : in  std_logic; -- Pin 14
      selb   : in  std_logic -- Pin 2
      );
  end component;

  component sn74157 is
  port (
      enb_n : in std_logic;
      sel   : in std_logic;

      a1 : in std_logic;
      a2 : in std_logic;
      a3 : in std_logic;
      a4 : in std_logic;

      b1 : in std_logic;
      b2 : in std_logic;
      b3 : in std_logic;
      b4 : in std_logic;

      y1 : out std_logic;
      y2 : out std_logic;
      y3 : out std_logic;
      y4 : out std_logic
      );
  end component;

  component sn74163 is
  port (
      -- Control and status
      tc      : out std_logic;  -- Terminal count
      clk     : in  std_logic;  -- Clock
      clr_n   : in  std_logic;  -- Synchronous clear (active low)
      pe_n    : in  std_logic;  -- Parallel enable (active low)
      enb_p   : in  std_logic;  -- Count enable parallel
      enb_t   : in  std_logic;  -- Count enable trickle

      -- Data inputs (parallel load)
      i3, i2, i1, i0 : in  std_logic;

      -- Data outputs
      d3, d2, d1, d0 : out std_logic
      );
  end component;

  component sn74169 is
  port (
      -- Control and status
      co_n    : out std_logic;  -- Carry out (active low)
      clk     : in  std_logic;  -- Clock
      up_dn   : in  std_logic;  -- Up/Down control
      load_n  : in  std_logic;  -- Parallel load enable (active low)
      enb_p_n : in  std_logic;  -- Count enable parallel (active low)
      enb_t_n : in  std_logic;  -- Count enable trickle (active low)

      -- Data inputs (parallel load)
      i3, i2, i1, i0 : in  std_logic;

      -- Data outputs
      o3, o2, o1, o0 : out std_logic
      );
  end component;

  component sn74174 is
  port (
      clk   : in std_logic;
      clr_n : in std_logic;

      d1 : in  std_logic;
      d2 : in  std_logic;
      d3 : in  std_logic;
      d4 : in  std_logic;
      d5 : in  std_logic;
      d6 : in  std_logic;
      q1 : out std_logic;
      q2 : out std_logic;
      q3 : out std_logic;
      q4 : out std_logic;
      q5 : out std_logic;
      q6 : out std_logic
      );
  end component;

  component sn74175 is
  port (
      clk   : in std_logic;
      clr_n : in std_logic;

      d0 : in std_logic;
      d1 : in std_logic;
      d2 : in std_logic;
      d3 : in std_logic;

      q0   : out std_logic;
      q0_n : out std_logic;
      q1   : out std_logic;
      q1_n : out std_logic;
      q2   : out std_logic;
      q2_n : out std_logic;
      q3   : out std_logic;
      q3_n : out std_logic
      );
  end component;

  component sn74181 is
  port (
      -- Control and status (external ports with _e suffix)
      M_e      : in  std_logic;  -- Mode: 1=Logic, 0=Arithmetic
      CNb_e    : in  std_logic;  -- Carry in (active low)
      CN4b_e   : out std_logic;  -- Carry out (active low)
      AEB_e    : out std_logic;  -- A equals B
      X_e      : out std_logic;  -- Carry propagate
      Y_e      : out std_logic;  -- Carry generate

      -- Function select
      S_e      : in  std_logic_vector(3 downto 0); -- S3, S2, S1, S0

      -- Data inputs
      A_e      : in  std_logic_vector(3 downto 0); -- A3, A2, A1, A0
      B_e      : in  std_logic_vector(3 downto 0); -- B3, B2, B1, B0

      -- Function outputs
      F_e      : out std_logic_vector(3 downto 0)  -- F3, F2, F1, F0
      );
  end component;

  component sn74182 is
  port (
      Xo_e    : out std_logic;  -- Group Propagate output
      Yo_e    : out std_logic;  -- Group Generate output
      CNZ_e   : out std_logic;  -- Carry out 2 (active-low)
      CNY_e   : out std_logic;  -- Carry out 1 (active-low)
      CNX_e   : out std_logic;  -- Carry out 0 (active-low)
      X_e     : in  std_logic_vector(3 downto 0);  -- Propagate inputs [3:0]
      Y_e     : in  std_logic_vector(3 downto 0);  -- Generate inputs [3:0]
      CNB_e   : in  std_logic   -- Carry in (active-low)
      );
  end component;

  component sn74188 is
  generic (fn : string := "");
    port (
      ce_n : in  std_logic;
      a0   : in  std_logic;
      a1   : in  std_logic;
      a2   : in  std_logic;
      a3   : in  std_logic;
      a4   : in  std_logic;
      o0   : out std_logic;
      o1   : out std_logic;
      o2   : out std_logic;
      o3   : out std_logic;
      o4   : out std_logic;
      o5   : out std_logic;
      o6   : out std_logic;
      o7   : out std_logic
      );
  end component;

  component sn74194 is
  port (
      clk : in std_logic; -- Pin 11

      sil   : in std_logic; -- Pin 7 (SL SER)
      sir   : in std_logic; -- Pin 2 (SR SER)
      clr_n : in std_logic; -- Pin 1 (CLR)

      i0 : in std_logic; -- Pin 3 (A)
      i1 : in std_logic; -- Pin 4 (B)
      i2 : in std_logic; -- Pin 5 (C)
      i3 : in std_logic; -- Pin 6 (D)
      s0 : in std_logic; -- Pin 9 (S0)
      s1 : in std_logic; -- Pin 10 (S1)

      q0 : out std_logic; -- Pin 15 (QA)
      q1 : out std_logic; -- Pin 14 (QB)
      q2 : out std_logic; -- Pin 13 (QC)
      q3 : out std_logic  -- Pin 12 (QD)
      );
  end component;

  component sn7420 is
  port (
      g1a   : in  std_logic; -- Pin 1
      g1b   : in  std_logic; -- Pin 2
      g1c   : in  std_logic; -- Pin 4
      g1d   : in  std_logic; -- Pin 5
      g1y_n : out std_logic; -- Pin 6

      g2a   : in  std_logic; -- Pin 9
      g2b   : in  std_logic; -- Pin 10
      g2c   : in  std_logic; -- Pin 12
      g2d   : in  std_logic; -- Pin 13
      g2y_n : out std_logic  -- Pin 8
      );
  end component;

  component sn74240 is
  port (
      aenb_n : in  std_logic; -- Pin 1 (1G_bar) : Channel 1 Output Enable (Active Low)
      ain0   : in  std_logic; -- Pin 2 (1A1)
      ain1   : in  std_logic; -- Pin 4 (1A2)
      ain2   : in  std_logic; -- Pin 6 (1A3)
      ain3   : in  std_logic; -- Pin 8 (1A4)
      aout0  : out std_logic; -- Pin 18 (1Y1)
      aout1  : out std_logic; -- Pin 16 (1Y2)
      aout2  : out std_logic; -- Pin 14 (1Y3)
      aout3  : out std_logic; -- Pin 12 (1Y4)

      benb_n : in  std_logic; -- Pin 19 (2G_bar) : Channel 2 Output Enable (Active Low)
      bin0   : in  std_logic; -- Pin 11 (2A1)
      bin1   : in  std_logic; -- Pin 13 (2A2)
      bin2   : in  std_logic; -- Pin 15 (2A3)
      bin3   : in  std_logic; -- Pin 17 (2A4)
      bout0  : out std_logic; -- Pin 9 (2Y1)
      bout1  : out std_logic; -- Pin 7 (2Y2)
      bout2  : out std_logic; -- Pin 5 (2Y3)
      bout3  : out std_logic  -- Pin 3 (2Y4)
      );
  end component;

  component sn74241 is
  port (
      aenb_n : in  std_logic; -- Pin 1 (1G) : Channel 1 Output Enable (Active Low)
      ain0   : in  std_logic; -- Pin 2 (1A1)
      ain1   : in  std_logic; -- Pin 4 (1A2)
      ain2   : in  std_logic; -- Pin 6 (1A3)
      ain3   : in  std_logic; -- Pin 8 (1A4)
      aout0  : out std_logic; -- Pin 18 (1Y1)
      aout1  : out std_logic; -- Pin 16 (1Y2)
      aout2  : out std_logic; -- Pin 14 (1Y3)
      aout3  : out std_logic; -- Pin 12 (1Y4)

      benb  : in  std_logic; -- Pin 19 (2G) : Channel 2 Output Enable (Active High)
      bin0  : in  std_logic; -- Pin 11 (2A1)
      bin1  : in  std_logic; -- Pin 13 (2A2)
      bin2  : in  std_logic; -- Pin 15 (2A3)
      bin3  : in  std_logic; -- Pin 17 (2A4)
      bout0 : out std_logic; -- Pin 9 (2Y1)
      bout1 : out std_logic; -- Pin 7 (2Y2)
      bout2 : out std_logic; -- Pin 5 (2Y3)
      bout3 : out std_logic  -- Pin 3 (2Y4)
      );
  end component;

  component sn74244 is
  port (
      aenb_n : in  std_logic; -- Pin 1 (1G)
      ain0   : in  std_logic; -- Pin 2 (1A1)
      ain1   : in  std_logic; -- Pin 4 (1A2)
      ain2   : in  std_logic; -- Pin 6 (1A3)
      ain3   : in  std_logic; -- Pin 8 (1A4)
      aout0  : out std_logic; -- Pin 18 (1Y1)
      aout1  : out std_logic; -- Pin 16 (1Y2)
      aout2  : out std_logic; -- Pin 14 (1Y3)
      aout3  : out std_logic; -- Pin 12 (1Y4)

      benb_n : in  std_logic; -- Pin 19 (2/G)
      bin0   : in  std_logic; -- Pin 11 (2A1)
      bin1   : in  std_logic; -- Pin 13 (2A2)
      bin2   : in  std_logic; -- Pin 15 (2A3)
      bin3   : in  std_logic; -- Pin 17 (2A4)
      bout0  : out std_logic; -- Pin 9 (2Y1)
      bout1  : out std_logic; -- Pin 7 (2Y2)
      bout2  : out std_logic; -- Pin 5 (2Y3)
      bout3  : out std_logic  -- Pin 3 (2Y4)
      );
  end component;

  component sn74258 is
  port (
      enb_n : in std_logic;
      sel   : in std_logic;

      a0 : in  std_logic;
      a1 : in  std_logic;
      ay : out std_logic;

      b0 : in  std_logic;
      b1 : in  std_logic;
      by : out std_logic;

      c0 : in  std_logic;
      c1 : in  std_logic;
      cy : out std_logic;

      d0 : in  std_logic;
      d1 : in  std_logic;
      dy : out std_logic
      );
  end component;

  component sn74260 is
  port (
      g1a   : in  std_logic; -- Pin 2
      g1b   : in  std_logic; -- Pin 3
      g1c   : in  std_logic; -- Pin 4
      g1d   : in  std_logic; -- Pin 5
      g1e   : in  std_logic; -- Pin 6
      g1y_n : out std_logic; -- Pin 1

      g2a   : in  std_logic; -- Pin 8
      g2b   : in  std_logic; -- Pin 9
      g2c   : in  std_logic; -- Pin 10
      g2d   : in  std_logic; -- Pin 11
      g2e   : in  std_logic; -- Pin 12
      g2y_n : out std_logic  -- Pin 13
      );
  end component;

  component sn7427 is
  port (
      g1a   : in  std_logic; -- Pin 1
      g1b   : in  std_logic; -- Pin 2
      g1y_n : out std_logic; -- Pin 12

      g2a   : in  std_logic; -- Pin 3
      g2b   : in  std_logic; -- Pin 4
      g2c   : in  std_logic; -- Pin 5
      g2y_n : out std_logic; -- Pin 6

      g3a   : in  std_logic; -- Pin 9
      g3b   : in  std_logic; -- Pin 10
      g3c   : in  std_logic; -- Pin 11
      g3y_n : out std_logic; -- Pin 8

      g1c   : in  std_logic  -- Pin 13
      );
  end component;

  component sn74273 is
  port (
      clr_n : in  std_logic; -- Pin 1 (CLR)
      clk   : in  std_logic; -- Pin 11 (CLK)
      d0    : in  std_logic; -- Pin 3 (1D)
      d1    : in  std_logic; -- Pin 4 (2D)
      d2    : in  std_logic; -- Pin 7 (3D)
      d3    : in  std_logic; -- Pin 8 (4D)
      d4    : in  std_logic; -- Pin 13 (5D)
      d5    : in  std_logic; -- Pin 14 (6D)
      d6    : in  std_logic; -- Pin 17 (7D)
      d7    : in  std_logic; -- Pin 18 (8D)
      q0    : out std_logic; -- Pin 2 (1Q)
      q1    : out std_logic; -- Pin 5 (2Q)
      q2    : out std_logic; -- Pin 6 (3Q)
      q3    : out std_logic; -- Pin 9 (4Q)
      q4    : out std_logic; -- Pin 12 (5Q)
      q5    : out std_logic; -- Pin 15 (6Q)
      q6    : out std_logic; -- Pin 16 (7Q)
      q7    : out std_logic  -- Pin 19 (8Q)
      );
  end component;

  component sn74276 is
  port (
      clr_n  : in  std_logic;  -- Common clear (active low)
      set_n  : in  std_logic;  -- Common preset (active low)

      -- Flip-flop 1
      j1     : in  std_logic;
      k1_n   : in  std_logic;  -- K input (active low)
      clk1_n : in  std_logic;  -- Clock 1 (negative edge)
      q1     : out std_logic;
      q1_n   : out std_logic;

      -- Flip-flop 2
      j2     : in  std_logic;
      k2_n   : in  std_logic;  -- K input (active low)
      clk2_n : in  std_logic;  -- Clock 2 (negative edge)
      q2     : out std_logic;
      q2_n   : out std_logic;

      -- Flip-flop 3
      j3     : in  std_logic;
      k3_n   : in  std_logic;  -- K input (active low)
      clk3_n : in  std_logic;  -- Clock 3 (negative edge)
      q3     : out std_logic;
      q3_n   : out std_logic;

      -- Flip-flop 4
      j4     : in  std_logic;
      k4_n   : in  std_logic;  -- K input (active low)
      clk4_n : in  std_logic;  -- Clock 4 (negative edge)
      q4     : out std_logic;
      q4_n   : out std_logic
      );
  end component;

  component sn7428 is
  port (
      g1a   : in  std_logic; -- Pin 1
      g1b   : in  std_logic; -- Pin 2
      g1q_n : out std_logic; -- Pin 3

      g2a   : in  std_logic; -- Pin 4
      g2b   : in  std_logic; -- Pin 5
      g2q_n : out std_logic; -- Pin 6

      g3a   : in  std_logic; -- Pin 9
      g3b   : in  std_logic; -- Pin 10
      g3q_n : out std_logic; -- Pin 8

      g4a   : in  std_logic; -- Pin 12
      g4b   : in  std_logic; -- Pin 13
      g4q_n : out std_logic  -- Pin 11
      );
  end component;

  component sn74280 is
  port (
      i0 : in std_logic;
      i1 : in std_logic;
      i2 : in std_logic;
      i3 : in std_logic;
      i4 : in std_logic;
      i5 : in std_logic;
      i6 : in std_logic;
      i7 : in std_logic;
      i8 : in std_logic;

      even : out std_logic;
      odd  : out std_logic
      );
  end component;

  component sn74283 is
  port (
      ci : in std_logic;  -- Pin 7
      a0 : in std_logic;  -- Pin 5
      a1 : in std_logic;  -- Pin 3
      a2 : in std_logic;  -- Pin 14
      a3 : in std_logic;  -- Pin 12
      b0 : in std_logic;  -- Pin 6
      b1 : in std_logic;  -- Pin 2
      b2 : in std_logic;  -- Pin 15
      b3 : in std_logic;  -- Pin 11
      s0 : out std_logic; -- Pin 4
      s1 : out std_logic; -- Pin 1
      s2 : out std_logic; -- Pin 13
      s3 : out std_logic; -- Pin 10
      co : out std_logic  -- Pin 9
      );
  end component;

  component sn74288 is
  generic (fn : string := "");
    port (
      ce_n : in  std_logic;
      a0   : in  std_logic;
      a1   : in  std_logic;
      a2   : in  std_logic;
      a3   : in  std_logic;
      a4   : in  std_logic;
      o0   : out std_logic;
      o1   : out std_logic;
      o2   : out std_logic;
      o3   : out std_logic;
      o4   : out std_logic;
      o5   : out std_logic;
      o6   : out std_logic;
      o7   : out std_logic
      );
  end component;

  component sn7432 is
  port (
      g1a : in  std_logic; -- Pin 1
      g1b : in  std_logic; -- Pin 2
      g1y : out std_logic; -- Pin 3

      g2a : in  std_logic; -- Pin 4
      g2b : in  std_logic; -- Pin 5
      g2y : out std_logic; -- Pin 6

      g3a : in  std_logic; -- Pin 9
      g3b : in  std_logic; -- Pin 10
      g3y : out std_logic; -- Pin 8

      g4a : in  std_logic; -- Pin 12
      g4b : in  std_logic; -- Pin 13
      g4y : out std_logic  -- Pin 11
      );
  end component;

  component sn7437 is
  port (
      g1a   : in  std_logic; -- Pin 1
      g1b   : in  std_logic; -- Pin 2
      g1y   : out std_logic; -- Pin 3

      g2a   : in  std_logic; -- Pin 4
      g2b   : in  std_logic; -- Pin 5
      g2y   : out std_logic; -- Pin 6

      g3a   : in  std_logic; -- Pin 9
      g3b   : in  std_logic; -- Pin 10
      g3y   : out std_logic; -- Pin 8

      g4a   : in  std_logic; -- Pin 12
      g4b   : in  std_logic; -- Pin 13
      g4y   : out std_logic  -- Pin 11
      );
  end component;

  component sn74373 is
  port (
      -- in the datasheet, instead of -hold, C is given
      -- when C is high, output follows input
      -- hence this is effectively same as having a -hold input
      -- when -hold is low, output is latched (does not follow input)
      hold_n : in  std_logic; -- Pin 11 (LE) - Latch Enable
      oenb_n : in  std_logic; -- Pin 1 (OE_n)
      i0     : in  std_logic; -- Pin 3 (1D)
      i1     : in  std_logic; -- Pin 4 (2D)
      i2     : in  std_logic; -- Pin 7 (3D)
      i3     : in  std_logic; -- Pin 8 (4D)
      i4     : in  std_logic; -- Pin 13 (5D)
      i5     : in  std_logic; -- Pin 14 (6D)
      i6     : in  std_logic; -- Pin 17 (7D)
      i7     : in  std_logic; -- Pin 18 (8D)
      o0     : out std_logic; -- Pin 2 (1Q)
      o1     : out std_logic; -- Pin 5 (2Q)
      o2     : out std_logic; -- Pin 6 (3Q)
      o3     : out std_logic; -- Pin 10 (4Q)
      o4     : out std_logic; -- Pin 12 (5Q)
      o5     : out std_logic; -- Pin 15 (6Q)
      o6     : out std_logic; -- Pin 16 (7Q)
      o7     : out std_logic  -- Pin 19 (8Q)
      );
  end component;

  component sn74374 is
  port (
      clk   : in  std_logic;
      oenb_n : in  std_logic;
      i0 : in  std_logic;
      i1 : in  std_logic;
      i2 : in  std_logic;
      i3 : in  std_logic;
      i4 : in  std_logic;
      i5 : in  std_logic;
      i6 : in  std_logic;
      i7 : in  std_logic;
      o0 : out std_logic;
      o1 : out std_logic;
      o2 : out std_logic;
      o3 : out std_logic;
      o4 : out std_logic;
      o5 : out std_logic;
      o6 : out std_logic;
      o7 : out std_logic
      );
  end component;

  component sn7438 is
  port (
      g1a   : in  std_logic;
      g1b   : in  std_logic;
      g1q_n : out std_logic;

      g2a   : in  std_logic;
      g2b   : in  std_logic;
      g2q_n : out std_logic;

      g3a   : in  std_logic;
      g3b   : in  std_logic;
      g3q_n : out std_logic;

      g4a   : in  std_logic;
      g4b   : in  std_logic;
      g4q_n : out std_logic
      );
  end component;

  component sn74472 is
  generic (fn : string := "");
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
      d0   : out std_logic;
      d1   : out std_logic;
      d2   : out std_logic;
      d3   : out std_logic;
      d4   : out std_logic;
      d5   : out std_logic;
      d6   : out std_logic;
      d7   : out std_logic;
      ce_n : in  std_logic
      );
  end component;

  component sn7451 is
  port (
      g1a   : in  std_logic; -- Pin 2
      g1b   : in  std_logic; -- Pin 3
      g1c   : in  std_logic; -- Pin 4
      g1d   : in  std_logic; -- Pin 5
      g1y   : out std_logic; -- Pin 6

      g2a   : in  std_logic; -- Pin 9
      g2b   : in  std_logic; -- Pin 10
      g2c   : in  std_logic; -- Pin 13
      g2d   : in  std_logic; -- Pin 1
      g2y   : out std_logic  -- Pin 8
      );
  end component;

  component sn7464 is
  port (
      d4    : in  std_logic; -- Pin 1
      b2    : in  std_logic; -- Pin 2
      a2    : in  std_logic; -- Pin 3
      c3    : in  std_logic; -- Pin 4
      b3    : in  std_logic; -- Pin 5
      a3    : in  std_logic; -- Pin 9
      \out\ : out std_logic; -- Pin 8
      a1    : in  std_logic; -- Pin 10
      b1    : in  std_logic; -- Pin 11
      c4    : in  std_logic; -- Pin 12
      b4    : in  std_logic; -- Pin 13
      a4    : in  std_logic  -- Pin 14
      );
  end component;

  component sn7474 is
  port (
      g1r_n : in  std_logic; -- pin 1
      g1d   : in  std_logic; -- pin 2
      g1clk : in  std_logic; -- pin 3
      g1s_n : in  std_logic; -- pin 4
      g1q   : out std_logic; -- pin 5
      g1q_n : out std_logic; -- pin 6
      g2q_n : out std_logic; -- pin 9
      g2q   : out std_logic; -- pin 8
      g2s_n : in  std_logic; -- pin 10
      g2clk : in  std_logic; -- pin 11
      g2d   : in  std_logic; -- pin 12
      g2r_n : in  std_logic  -- pin 13
      );
  end component;

  component sn7486 is
  port (
      g1a : in  std_logic; -- Pin 1
      g1b : in  std_logic; -- Pin 2
      g1y : out std_logic; -- Pin 3

      g2a : in  std_logic; -- Pin 4
      g2b : in  std_logic; -- Pin 5
      g2y : out std_logic; -- Pin 6

      g3a : in  std_logic; -- Pin 9
      g3b : in  std_logic; -- Pin 10
      g3y : out std_logic; -- Pin 8

      g4a : in  std_logic; -- Pin 12
      g4b : in  std_logic; -- Pin 13
      g4y : out std_logic  -- Pin 11
      );
  end component;

alias sn74s00 is sn7400;
alias sn74s02 is sn7402;
alias sn74s04 is sn7404;
alias sn74s08 is sn7408;
alias sn74s10 is sn7410;
alias sn74s11 is sn7411;
alias sn74ls14 is sn7414;
alias sn74s20 is sn7420;
alias sn74s32 is sn7432;
alias sn74s37 is sn7437;
alias sn74s51 is sn7451;
alias sn74s64 is sn7464;
alias sn74s74 is sn7474;
alias sn74s86 is sn7486;
alias sn74ls109 is sn74109;
alias sn74s133 is sn74133;
alias sn74s138 is sn74138;
alias sn74s139 is sn74139;
alias sn74s151 is sn74151;
alias sn74s153 is sn74153;
alias sn74s157 is sn74157;
alias sn74s169 is sn74169;
alias sn74s174 is sn74174;
alias sn74s175 is sn74175;
alias sn74s181 is sn74181;
alias sn74s182 is sn74182;
alias sn74s188 is sn74188;
alias sn74s194 is sn74194;
alias sn74s240 is sn74240;
alias sn74s241 is sn74241;
alias sn74ls244 is sn74244;
alias sn74s258 is sn74258;
alias sn74s260 is sn74260;
alias sn74s280 is sn74280;
alias sn74s283 is sn74283;
alias sn74s288 is sn74288;
alias sn74s373 is sn74373;
alias sn74s374 is sn74374;
alias sn74s472 is sn74472;

end package;
