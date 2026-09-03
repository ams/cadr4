library ieee;
use ieee.std_logic_1164.all;

package sn74 is

  component sn7400 is
  port (
      g1a   : in  std_logic; -- Pin 2 (1B)
      g1b   : in  std_logic; -- Pin 1 (1A)
      g1q_n : out std_logic; -- Pin 3 (1Y)

      g2a   : in  std_logic; -- Pin 5 (2B)
      g2b   : in  std_logic; -- Pin 4 (2A)
      g2q_n : out std_logic; -- Pin 6 (2Y)

      g3a   : in  std_logic; -- Pin 9 (3B)
      g3b   : in  std_logic; -- Pin 10 (3A)
      g3q_n : out std_logic; -- Pin 8 (3Y)

      g4a   : in  std_logic; -- Pin 12 (4B)
      g4b   : in  std_logic; -- Pin 13 (4A)
      g4q_n : out std_logic  -- Pin 11 (4Y)
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
      g1a   : in  std_logic; -- Pin 1 (1A)
      g1q_n : out std_logic; -- Pin 2 (1Y)

      g2a   : in  std_logic; -- Pin 3 (2A)
      g2q_n : out std_logic; -- Pin 4 (2Y)

      g3a   : in  std_logic; -- Pin 5 (3A)
      g3q_n : out std_logic; -- Pin 6 (3Y)

      g4a   : in  std_logic; -- Pin 9 (4A)
      g4q_n : out std_logic; -- Pin 8 (4Y)

      g5a   : in  std_logic; -- Pin 11 (5A)
      g5q_n : out std_logic; -- Pin 10 (5Y)

      g6a   : in  std_logic; -- Pin 13 (6A)
      g6q_n : out std_logic  -- Pin 12 (6Y)
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
      clr1_n : in  std_logic; -- Pin 1 (1CLR)
      j1     : in  std_logic; -- Pin 2 (1J)
      k1_n   : in  std_logic; -- Pin 3 (1K_n)
      clk1   : in  std_logic; -- Pin 4 (1CLK)
      pre1_n : in  std_logic; -- Pin 5 (1PRE)
      q1     : out std_logic; -- Pin 6 (1Q)
      q1_n   : out std_logic; -- Pin 7 (1Q_n)

      q2_n   : out std_logic; -- Pin 9 (2Q_n)
      q2     : out std_logic; -- Pin 10 (2Q)
      pre2_n : in  std_logic; -- Pin 11 (2PRE)
      clk2   : in  std_logic; -- Pin 12 (2CLK)
      k2_n   : in  std_logic; -- Pin 13 (2K_n)
      j2     : in  std_logic; -- Pin 14 (2J)
      clr2_n : in  std_logic  -- Pin 15 (2CLR)
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
      clr1_n : in  std_logic; -- Pin 15 (1CLR)
      j1     : in  std_logic; -- Pin 3 (1J)
      k1     : in  std_logic; -- Pin 2 (1K)
      clk1   : in  std_logic; -- Pin 1 (1CLK)
      pre1_n : in  std_logic; -- Pin 4 (1PRE)
      q1     : out std_logic; -- Pin 5 (1Q)
      q1_n   : out std_logic; -- Pin 6 (1Q_n)

      q2_n   : out std_logic; -- Pin 7 (2Q_n)
      q2     : out std_logic; -- Pin 9 (2Q)
      pre2_n : in  std_logic; -- Pin 10 (2PRE)
      clk2   : in  std_logic; -- Pin 13 (2CLK)
      k2     : in  std_logic; -- Pin 12 (2K)
      j2     : in  std_logic; -- Pin 11 (2J)
      clr2_n : in  std_logic  -- Pin 14 (2CLR)
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
      a   : in  std_logic;  -- Pin 1 (A)
      b   : in  std_logic;  -- Pin 2 (B)
      c   : in  std_logic;  -- Pin 3 (C)
      d   : in  std_logic;  -- Pin 4 (D)
      e   : in  std_logic;  -- Pin 5 (E)
      f   : in  std_logic;  -- Pin 6 (F)
      h   : in  std_logic;  -- Pin 10 (H)
      i   : in  std_logic;  -- Pin 11 (I)
      j   : in  std_logic;  -- Pin 12 (J)
      k   : in  std_logic;  -- Pin 13 (K)
      l   : in  std_logic;  -- Pin 14 (L)
      m   : in  std_logic;  -- Pin 15 (M)
      g   : in  std_logic;  -- Pin 7 (G)
      q_n : out std_logic   -- Pin 9 (Y)
      );
  end component;

  component sn74138 is
  port (
      sel2 : in  std_logic; -- Pin 3 (C)
      sel1 : in  std_logic; -- Pin 2 (B)
      sel0 : in  std_logic; -- Pin 1 (A)
      g1   : in  std_logic; -- Pin 6 (G1)
      g2a  : in  std_logic; -- Pin 5 (G2B)
      g2b  : in  std_logic; -- Pin 4 (G2A)
      y0   : out std_logic; -- Pin 15 (Y0)
      y1   : out std_logic; -- Pin 14 (Y1)
      y2   : out std_logic; -- Pin 13 (Y2)
      y3   : out std_logic; -- Pin 12 (Y3)
      y4   : out std_logic; -- Pin 11 (Y4)
      y5   : out std_logic; -- Pin 10 (Y5)
      y6   : out std_logic; -- Pin 9 (Y6)
      y7   : out std_logic  -- Pin 7 (Y7)
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
      i0   : in std_logic;  -- Pin 4 (D0)
      i1   : in std_logic;  -- Pin 3 (D1)
      i2   : in std_logic;  -- Pin 2 (D2)
      i3   : in std_logic;  -- Pin 1 (D3)
      i4   : in std_logic;  -- Pin 15 (D4)
      i5   : in std_logic;  -- Pin 14 (D5)
      i6   : in std_logic;  -- Pin 13 (D6)
      i7   : in std_logic;  -- Pin 12 (D7)
      sel0 : in std_logic;  -- Pin 11 (A)
      sel1 : in std_logic;  -- Pin 10 (B)
      sel2 : in std_logic;  -- Pin 9 (C)
      ce_n : in std_logic;  -- Pin 7 (G, strobe)
      q    : out std_logic; -- Pin 5 (Y)
      q_n  : out std_logic  -- Pin 6 (W)
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
      enb_n : in std_logic; -- Pin 15 (G, strobe)
      sel   : in std_logic; -- Pin 1 (A/B)

      a1 : in std_logic;    -- Pin 14 (4A)
      a2 : in std_logic;    -- Pin 11 (3A)
      a3 : in std_logic;    -- Pin 5 (2A)
      a4 : in std_logic;    -- Pin 2 (1A)

      b1 : in std_logic;    -- Pin 13 (4B)
      b2 : in std_logic;    -- Pin 10 (3B)
      b3 : in std_logic;    -- Pin 6 (2B)
      b4 : in std_logic;    -- Pin 3 (1B)

      y1 : out std_logic;   -- Pin 12 (4Y)
      y2 : out std_logic;   -- Pin 9 (3Y)
      y3 : out std_logic;   -- Pin 7 (2Y)
      y4 : out std_logic    -- Pin 4 (1Y)
      );
  end component;

  component sn74163 is
  port (
      -- Control and status
      tc      : out std_logic;        -- Pin 15 (RCO): terminal count
      clk     : in  std_logic;        -- Pin 2 (CLK)
      clr_n   : in  std_logic;        -- Pin 1 (CLR): synchronous clear (active low)
      pe_n    : in  std_logic;        -- Pin 9 (LOAD): parallel enable (active low)
      enb_p   : in  std_logic;        -- Pin 7 (ENP): count enable parallel
      enb_t   : in  std_logic;        -- Pin 10 (ENT): count enable trickle

      -- Data inputs (parallel load)
      i3, i2, i1, i0 : in  std_logic; -- Pins 6, 5, 4, 3 (D, C, B, A)

      -- Data outputs
      d3, d2, d1, d0 : out std_logic  -- Pins 11, 12, 13, 14 (QD, QC, QB, QA)
      );
  end component;

  component sn74169 is
  port (
      -- Control and status
      co_n    : out std_logic;        -- Pin 15 (RCO): ripple carry out (active low)
      clk     : in  std_logic;        -- Pin 2 (CLK)
      up_dn   : in  std_logic;        -- Pin 1 (U/D): up/down control
      load_n  : in  std_logic;        -- Pin 9 (LOAD): parallel load enable (active low)
      enb_p_n : in  std_logic;        -- Pin 7 (ENP): count enable parallel (active low)
      enb_t_n : in  std_logic;        -- Pin 10 (ENT): count enable trickle (active low)

      -- Data inputs (parallel load)
      i3, i2, i1, i0 : in  std_logic; -- Pins 6, 5, 4, 3 (D, C, B, A)

      -- Data outputs
      o3, o2, o1, o0 : out std_logic  -- Pins 11, 12, 13, 14 (QD, QC, QB, QA)
      );
  end component;

  component sn74174 is
  port (
      clk   : in std_logic; -- Pin 9 (CLK)
      clr_n : in std_logic; -- Pin 1 (CLR)

      d1 : in  std_logic;   -- Pin 3 (1D)
      d2 : in  std_logic;   -- Pin 4 (2D)
      d3 : in  std_logic;   -- Pin 6 (3D)
      d4 : in  std_logic;   -- Pin 11 (4D)
      d5 : in  std_logic;   -- Pin 13 (5D)
      d6 : in  std_logic;   -- Pin 14 (6D)
      q1 : out std_logic;   -- Pin 2 (1Q)
      q2 : out std_logic;   -- Pin 5 (2Q)
      q3 : out std_logic;   -- Pin 7 (3Q)
      q4 : out std_logic;   -- Pin 10 (4Q)
      q5 : out std_logic;   -- Pin 12 (5Q)
      q6 : out std_logic    -- Pin 15 (6Q)
      );
  end component;

  component sn74175 is
  port (
      clk   : in std_logic; -- Pin 9 (CLK)
      clr_n : in std_logic; -- Pin 1 (CLR)

      d0 : in std_logic;    -- Pin 4 (1D)
      d1 : in std_logic;    -- Pin 5 (2D)
      d2 : in std_logic;    -- Pin 12 (3D)
      d3 : in std_logic;    -- Pin 13 (4D)

      q0   : out std_logic; -- Pin 2 (1Q)
      q0_n : out std_logic; -- Pin 3 (1Q_n)
      q1   : out std_logic; -- Pin 7 (2Q)
      q1_n : out std_logic; -- Pin 6 (2Q_n)
      q2   : out std_logic; -- Pin 10 (3Q)
      q2_n : out std_logic; -- Pin 11 (3Q_n)
      q3   : out std_logic; -- Pin 15 (4Q)
      q3_n : out std_logic  -- Pin 14 (4Q_n)
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
      enb_n : in std_logic; -- Pin 15 (G, output control)
      sel   : in std_logic; -- Pin 1 (A/B)

      a0 : in  std_logic;   -- Pin 14 (4A)
      a1 : in  std_logic;   -- Pin 13 (4B)
      ay : out std_logic;   -- Pin 12 (4Y)

      b0 : in  std_logic;   -- Pin 11 (3A)
      b1 : in  std_logic;   -- Pin 10 (3B)
      by : out std_logic;   -- Pin 9 (3Y)

      c0 : in  std_logic;   -- Pin 5 (2A)
      c1 : in  std_logic;   -- Pin 6 (2B)
      cy : out std_logic;   -- Pin 7 (2Y)

      d0 : in  std_logic;   -- Pin 2 (1A)
      d1 : in  std_logic;   -- Pin 3 (1B)
      dy : out std_logic    -- Pin 4 (1Y)
      );
  end component;

  component sn74260 is
  port (
      g1a   : in  std_logic;  -- Pin 1 (1A)
      g1b   : in  std_logic;  -- Pin 2 (1B)
      g1c   : in  std_logic;  -- Pin 3 (1C)
      g1d   : in  std_logic;  -- Pin 12 (1D)
      g1e   : in  std_logic;  -- Pin 13 (1E)
      g1y_n : out std_logic;  -- Pin 5 (1Y)

      g2a   : in  std_logic;  -- Pin 4 (2A)
      g2b   : in  std_logic;  -- Pin 8 (2B)
      g2c   : in  std_logic;  -- Pin 9 (2C)
      g2d   : in  std_logic;  -- Pin 10 (2D)
      g2e   : in  std_logic;  -- Pin 11 (2E)
      g2y_n : out std_logic   -- Pin 6 (2Y)
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
      clr_n  : in  std_logic; -- Pin 1 (CLR): common clear (active low)
      set_n  : in  std_logic; -- Pin 11 (PRE): common preset (active low)

      -- Flip-flop 1
      j1     : in  std_logic; -- Pin 2 (1J)
      k1_n   : in  std_logic; -- Pin 4 (1K_n): K input (active low)
      clk1_n : in  std_logic; -- Pin 3 (1CLK): clock 1 (negative edge)
      q1     : out std_logic; -- Pin 5 (1Q)
      q1_n   : out std_logic; -- no pin (Q_n is not brought out)

      -- Flip-flop 2
      j2     : in  std_logic; -- Pin 9 (2J)
      k2_n   : in  std_logic; -- Pin 7 (2K_n): K input (active low)
      clk2_n : in  std_logic; -- Pin 8 (2CLK): clock 2 (negative edge)
      q2     : out std_logic; -- Pin 6 (2Q)
      q2_n   : out std_logic; -- no pin (Q_n is not brought out)

      -- Flip-flop 3
      j3     : in  std_logic; -- Pin 12 (3J)
      k3_n   : in  std_logic; -- Pin 14 (3K_n): K input (active low)
      clk3_n : in  std_logic; -- Pin 13 (3CLK): clock 3 (negative edge)
      q3     : out std_logic; -- Pin 15 (3Q)
      q3_n   : out std_logic; -- no pin (Q_n is not brought out)

      -- Flip-flop 4
      j4     : in  std_logic; -- Pin 19 (4J)
      k4_n   : in  std_logic; -- Pin 17 (4K_n): K input (active low)
      clk4_n : in  std_logic; -- Pin 18 (4CLK): clock 4 (negative edge)
      q4     : out std_logic; -- Pin 16 (4Q)
      q4_n   : out std_logic  -- no pin (Q_n is not brought out)
      );
  end component;

  component sn7428 is
  port (
      g1a   : in  std_logic;  -- Pin 2 (1A)
      g1b   : in  std_logic;  -- Pin 3 (1B)
      g1q_n : out std_logic;  -- Pin 1 (1Y)

      g2a   : in  std_logic;  -- Pin 5 (2A)
      g2b   : in  std_logic;  -- Pin 6 (2B)
      g2q_n : out std_logic;  -- Pin 4 (2Y)

      g3a   : in  std_logic;  -- Pin 8 (3A)
      g3b   : in  std_logic;  -- Pin 9 (3B)
      g3q_n : out std_logic;  -- Pin 10 (3Y)

      g4a   : in  std_logic;  -- Pin 11 (4A)
      g4b   : in  std_logic;  -- Pin 12 (4B)
      g4q_n : out std_logic   -- Pin 13 (4Y)
      );
  end component;

  component sn74280 is
  port (
      i0 : in std_logic;    -- Pin 1 (G)
      i1 : in std_logic;    -- Pin 2 (H)
      i2 : in std_logic;    -- Pin 4 (I)
      i3 : in std_logic;    -- Pin 8 (A)
      i4 : in std_logic;    -- Pin 9 (B)
      i5 : in std_logic;    -- Pin 10 (C)
      i6 : in std_logic;    -- Pin 11 (D)
      i7 : in std_logic;    -- Pin 12 (E)
      i8 : in std_logic;    -- Pin 13 (F)

      even : out std_logic; -- Pin 5 (sum even)
      odd  : out std_logic  -- Pin 6 (sum odd)
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
      o3     : out std_logic; -- Pin 9 (4Q)
      o4     : out std_logic; -- Pin 12 (5Q)
      o5     : out std_logic; -- Pin 15 (6Q)
      o6     : out std_logic; -- Pin 16 (7Q)
      o7     : out std_logic  -- Pin 19 (8Q)
      );
  end component;

  component sn74374 is
  port (
      clk   : in  std_logic;  -- Pin 11 (CLK)
      oenb_n : in  std_logic; -- Pin 1 (OC): output control (active low)
      i0 : in  std_logic;     -- Pin 18 (8D)
      i1 : in  std_logic;     -- Pin 17 (7D)
      i2 : in  std_logic;     -- Pin 14 (6D)
      i3 : in  std_logic;     -- Pin 13 (5D)
      i4 : in  std_logic;     -- Pin 8 (4D)
      i5 : in  std_logic;     -- Pin 7 (3D)
      i6 : in  std_logic;     -- Pin 4 (2D)
      i7 : in  std_logic;     -- Pin 3 (1D)
      o0 : out std_logic;     -- Pin 19 (8Q)
      o1 : out std_logic;     -- Pin 16 (7Q)
      o2 : out std_logic;     -- Pin 15 (6Q)
      o3 : out std_logic;     -- Pin 12 (5Q)
      o4 : out std_logic;     -- Pin 9 (4Q)
      o5 : out std_logic;     -- Pin 6 (3Q)
      o6 : out std_logic;     -- Pin 5 (2Q)
      o7 : out std_logic      -- Pin 2 (1Q)
      );
  end component;

  component sn7438 is
  port (
      g1a   : in  std_logic; -- Pin 1 (1A)
      g1b   : in  std_logic; -- Pin 2 (1B)
      g1q_n : out std_logic; -- Pin 3 (1Y)

      g2a   : in  std_logic; -- Pin 4 (2A)
      g2b   : in  std_logic; -- Pin 5 (2B)
      g2q_n : out std_logic; -- Pin 6 (2Y)

      g3a   : in  std_logic; -- Pin 10 (3B)
      g3b   : in  std_logic; -- Pin 9 (3A)
      g3q_n : out std_logic; -- Pin 8 (3Y)

      g4a   : in  std_logic; -- Pin 13 (4B)
      g4b   : in  std_logic; -- Pin 12 (4A)
      g4q_n : out std_logic  -- Pin 11 (4Y)
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
      d4    : in  std_logic;  -- Pin 1 (A)
      b2    : in  std_logic;  -- Pin 2 (E)
      a2    : in  std_logic;  -- Pin 3 (F)
      c3    : in  std_logic;  -- Pin 4 (G)
      b3    : in  std_logic;  -- Pin 5 (H)
      a3    : in  std_logic;  -- Pin 6 (I)
      \out\ : out std_logic;  -- Pin 8 (Y)
      a1    : in  std_logic;  -- Pin 9 (J)
      b1    : in  std_logic;  -- Pin 10 (K)
      c4    : in  std_logic;  -- Pin 11 (B)
      b4    : in  std_logic;  -- Pin 12 (C)
      a4    : in  std_logic   -- Pin 13 (D)
      );
  end component;

  component sn7474 is
  port (
      g1r_n : in  std_logic;  -- Pin 1 (1CLR)
      g1d   : in  std_logic;  -- Pin 2 (1D)
      g1clk : in  std_logic;  -- Pin 3 (1CLK)
      g1s_n : in  std_logic;  -- Pin 4 (1PRE)
      g1q   : out std_logic;  -- Pin 5 (1Q)
      g1q_n : out std_logic;  -- Pin 6 (1Q_n)
      g2q_n : out std_logic;  -- Pin 8 (2Q_n)
      g2q   : out std_logic;  -- Pin 9 (2Q)
      g2s_n : in  std_logic;  -- Pin 10 (2PRE)
      g2clk : in  std_logic;  -- Pin 11 (2CLK)
      g2d   : in  std_logic;  -- Pin 12 (2D)
      g2r_n : in  std_logic   -- Pin 13 (2CLR)
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

end package;
