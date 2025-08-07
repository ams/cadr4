library ieee;
use ieee.std_logic_1164.all;

package dip is

  component dip_16dummy is
  port (
      p12 : out std_logic;
      p13 : out std_logic;
      p14 : out std_logic;
      p15 : out std_logic;
      p16 : out std_logic
      );
  end component;

  component dip_2147 is
  generic (fn : string := "");
    port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : in  std_logic;
      p7  : out std_logic;
      p8  : in  std_logic;
      p10 : in  std_logic;
      p11 : in  std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic;
      p14 : in  std_logic;
      p15 : in  std_logic;
      p16 : in  std_logic;
      p17 : in  std_logic
      );
  end component;

  component dip_25ls2519 is
  port (
      p1  : in  std_logic;
      p2  : out std_logic;
      p3  : out std_logic;
      p4  : in  std_logic;
      p5  : out std_logic;
      p6  : out std_logic;
      p7  : in  std_logic;
      p8  : in  std_logic;
      p9  : in  std_logic;
      p11 : out std_logic;
      p12 : out std_logic;
      p13 : in  std_logic;
      p14 : out std_logic;
      p15 : out std_logic;
      p16 : in  std_logic;
      p17 : in  std_logic;
      p18 : in  std_logic;
      p19 : in  std_logic
      );
  end component;

  component dip_25s07 is
  port (
      p1  : in  std_logic;
      p2  : out std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : out std_logic;
      p6  : in  std_logic;
      p7  : out std_logic;
      p9  : in  std_logic;
      p10 : out std_logic;
      p11 : in  std_logic;
      p12 : out std_logic;
      p13 : in  std_logic;
      p14 : in  std_logic;
      p15 : out std_logic
      );
  end component;

  component dip_25s09 is
  port (
      p1  : in  std_logic;
      p2  : out std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : in  std_logic;
      p7  : out std_logic;
      p9  : in  std_logic;
      p10 : out std_logic;
      p11 : in  std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic;
      p14 : in  std_logic;
      p15 : out std_logic
      );
  end component;

  component dip_25s10 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : in  std_logic;
      p7  : in  std_logic;
      p9  : in  std_logic;
      p10 : in  std_logic;
      p11 : out std_logic;
      p12 : out std_logic;
      p13 : in  std_logic;
      p14 : out std_logic;
      p15 : out std_logic
      );
  end component;

  component dip_26s10 is
  port (
      p2  : inout std_logic; -- B0_n
      p3  : out   std_logic; -- Z0
      p4  : in    std_logic; -- I0
      p5  : in    std_logic; -- I1
      p6  : out   std_logic; -- Z1
      p7  : inout std_logic; -- B1_n
      p9  : inout std_logic; -- B2_n
      p10 : out   std_logic; -- Z2
      p11 : in    std_logic; -- I2
      p12 : in    std_logic; -- E_n
      p13 : in    std_logic; -- I3
      p14 : out   std_logic; -- Z3
      p15 : inout std_logic  -- B3_n
    );
  end component;

  component dip_29701 is
  port (
    p1 : in std_logic;    -- VCC
    p2 : in std_logic;    -- D3
    p3 : in std_logic;    -- D2
    p4 : in std_logic;    -- Q3
    p5 : in std_logic;    -- Q2
    p6 : in std_logic;    -- Q1
    p7 : in std_logic;    -- Q0
    p8 : in std_logic;    -- GND
    p9 : in std_logic;    -- D1
    p10 : in std_logic;   -- D0
    p11 : in std_logic;   -- D1
    p12 : in std_logic;   -- D0
    p13 : in std_logic;   -- G1
    p14 : in std_logic;   -- G2
    p15 : in std_logic;   -- LE
    p16 : in std_logic    -- VCC
    );
  end component;

  component dip_5600 is
  generic (fn : string := "");
    port (
      p1  : out std_logic;
      p2  : out std_logic;
      p3  : out std_logic;
      p4  : out std_logic;
      p5  : out std_logic;
      p6  : out std_logic;
      p7  : out std_logic;
      p9  : out std_logic;
      p10 : in  std_logic;
      p11 : in  std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic;
      p14 : in  std_logic;
      p15 : in  std_logic
      );
  end component;

  component dip_5610 is
  generic (fn : string := "");
    port (
      p1  : out std_logic;
      p2  : out std_logic;
      p3  : out std_logic;
      p4  : out std_logic;
      p5  : out std_logic;
      p6  : out std_logic;
      p7  : out std_logic;
      p9  : out std_logic;
      p10 : in  std_logic;
      p11 : in  std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic;
      p14 : in  std_logic;
      p15 : in  std_logic
      );
  end component;

  component dip_5x_til309 is
  port (        
      p1 : in std_logic; --  pc0
      p2 : in std_logic;
      p3 : in std_logic;
      p4 : in std_logic;
      p5 : in std_logic;
      p6 : in std_logic;
      p7 : in std_logic;
      p8 : in std_logic;
      p9 : in std_logic;
      p10 : in std_logic;
      p11 : in std_logic;
      p12 : in std_logic;
      p13 : in std_logic;
      p14 : in std_logic; -- pc13
      p15 : in std_logic; -- promenable
      p16 : in std_logic; -- ipe
      p17 : in std_logic; -- dpe
      p18 : in std_logic; -- tilt0 
      p19 : in std_logic -- tilt1
      );
  end component;

  component dip_74276 is
  port (
    p2 : in std_logic;    -- 1J
    p3 : in std_logic;    -- 1CLK_n
    p4 : in std_logic;    -- 1K_n
    p5 : out std_logic;    -- 1Q

    p9 : in std_logic;    -- 2J
    p8 : in std_logic;    -- 2CLK_n
    p7 : in std_logic;    -- 2K_n
    p6 : out std_logic;    -- 2Q

    p12 : in std_logic;   -- 3J
    p13 : in std_logic;   -- 3CLK_n
    p14 : in std_logic;   -- 3K_n
    p15 : out std_logic;   -- 3Q

    p19 : in std_logic;   -- 4J
    p18 : in std_logic;   -- 4CLK_n
    p17 : in std_logic;   -- 4K_n
    p16 : out std_logic;   -- 4Q

    p11 : in std_logic;   -- SET_n
    p1 : in std_logic     -- CLR_n
    );
  end component;

  component dip_7428 is
  port (
      p1  : out std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : out std_logic;
      p5  : in  std_logic;
      p6  : in  std_logic;
      p8  : in  std_logic;
      p9  : in  std_logic;
      p10 : out std_logic;
      p11 : in  std_logic;
      p12 : in  std_logic;
      p13 : out std_logic
      );
  end component;

  component dip_74ls109 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : out std_logic;
      p7  : out std_logic;
      p9  : out std_logic;
      p10 : out std_logic;
      p11 : in  std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic;
      p14 : in  std_logic;
      p15 : in  std_logic
      );
  end component;

  component dip_74ls112 is
  port (
      p1 : in std_logic;    -- 1CLK
      p2 : in std_logic;    -- 1K
      p3 : in std_logic;    -- 1J
      p4 : in std_logic;    -- 1PRE_n
      p5 : out std_logic;    -- 1Q
      p6 : out std_logic;    -- 1Q_n
      p7 : out std_logic;    -- 2Q_n
      p9 : out std_logic;    -- 2Q
      p10 : in std_logic;   -- 2PRE_n
      p11 : in std_logic;   -- 2J
      p12 : in std_logic;   -- 2K
      p13 : in std_logic;   -- 2CLK
      p14 : in std_logic;   -- 2CLR_n
      p15 : in std_logic    -- 1CLR_n
    );
  end component;

  component dip_74ls124 is
  port (
    p1  : in  std_logic;                  -- c1a
    p2  : in  std_logic;                  -- c1b
    p3  : out std_logic;                  -- y1
    p4  : in  std_logic;                  -- r1/c1
    p5  : in  std_logic;                  -- r2/c2
    p6  : out std_logic;                  -- y2
    p7  : in  std_logic;                  -- c2b
    p8  : in  std_logic;                  -- gnd
    p9  : in  std_logic;                  -- c2a
    p10 : in  std_logic;                  -- disable2
    p11 : out std_logic;                  -- freq range2
    p12 : in  std_logic;                  -- disable1
    p13 : out std_logic;                  -- freq range1
    p14 : in  std_logic;                  -- vcc
    p15 : in  std_logic;                  -- enable2
    p16 : in  std_logic                   -- enable1
    );
  end component;

  component dip_74ls14 is
  port (
      p1  : in  std_logic;
      p2  : out std_logic;
      p3  : in  std_logic;
      p4  : out std_logic;
      p5  : in  std_logic;
      p6  : out std_logic;
      p8  : out std_logic;
      p9  : in  std_logic;
      p10 : out std_logic;
      p11 : in  std_logic;
      p12 : out std_logic;
      p13 : in  std_logic
      );
  end component;

  component dip_74ls163 is
  port (
      p15 : out std_logic;   -- TC

      p6 : in std_logic;    -- I3
      p5 : in std_logic;    -- I2
      p4 : in std_logic;    -- I1
      p3 : in std_logic;    -- I0

      p11 : out std_logic;   -- D3
      p12 : out std_logic;   -- D2
      p13 : out std_logic;   -- D1
      p14 : out std_logic;   -- D0

      p10 : in std_logic;   -- ENB T
      p7 : in std_logic;    -- ENB P

      p9 : in std_logic;    -- PE_n
      p1 : in std_logic;    -- -SYNC CLR
      p2 : in std_logic     -- CLK
    );
  end component;

  component dip_74ls244 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : out std_logic;
      p4  : in  std_logic;
      p5  : out std_logic;
      p6  : in  std_logic;
      p7  : out std_logic;
      p8  : in  std_logic;
      p9  : out std_logic;
      p11 : in  std_logic;
      p12 : out std_logic;
      p13 : in  std_logic;
      p14 : out std_logic;
      p15 : in  std_logic;
      p16 : out std_logic;
      p17 : in  std_logic;
      p18 : out std_logic;
      p19 : in  std_logic
      );
  end component;

  component dip_74ls27 is
  port (
      p1  : in  std_logic; -- 1A
      p2  : in  std_logic; -- 1B
      p3  : in  std_logic; -- 2A
      p4  : in  std_logic; -- 2B
      p5  : in  std_logic; -- 2C
      p6  : out std_logic; -- 2Y
      p8  : out std_logic; -- 3Y
      p9  : in  std_logic; -- 3A
      p10 : in  std_logic; -- 3B
      p11 : in  std_logic; -- 3C
      p12 : out std_logic; -- 1Y
      p13 : in  std_logic  -- 1C
      );
  end component;

  component dip_74ls273 is
  port (
      p3 : in std_logic; -- d0
      p4 : in std_logic; -- d1
      p7 : in std_logic; -- d2
      p8 : in std_logic; -- d3
      p13 : in std_logic; -- d4
      p14 : in std_logic; -- d5
      p17 : in std_logic; -- d6
      p18 : in std_logic; -- d7

      p2 : out std_logic; -- q0
      p5 : out std_logic; -- q1
      p6 : out std_logic; -- q2
      p9 : out std_logic; -- q3
      p12 : out std_logic; -- q4
      p15 : out std_logic; -- q5
      p16 : out std_logic; -- q6
      p19 : out std_logic; -- q7

      p11 : in  std_logic; -- clk
      p1 : in  std_logic -- clr_n
    );
  end component;

  component dip_74s00 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : out std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : out std_logic;
      p8  : out std_logic;
      p9  : in  std_logic;
      p10 : in  std_logic;
      p11 : out std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic
      );
  end component;

  component dip_74s02 is
  port (
      p1  : out std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : out std_logic;
      p5  : in  std_logic;
      p6  : in  std_logic;
      p8  : in  std_logic;
      p9  : in  std_logic;
      p10 : out std_logic;
      p11 : in  std_logic;
      p12 : in  std_logic;
      p13 : out std_logic
      );
  end component;

  component dip_74s04 is
  port (
      p1  : in  std_logic;
      p2  : out std_logic;
      p3  : in  std_logic;
      p4  : out std_logic;
      p5  : in  std_logic;
      p6  : out std_logic;
      p8  : out std_logic;
      p9  : in  std_logic;
      p10 : out std_logic;
      p11 : in  std_logic;
      p12 : out std_logic;
      p13 : in  std_logic
      );
  end component;

  component dip_74s08 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : out std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : out std_logic;
      p8  : out std_logic;
      p9  : in  std_logic;
      p10 : in  std_logic;
      p11 : out std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic
      );
  end component;

  component dip_74s10 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : out std_logic;
      p8  : out std_logic;
      p9  : in  std_logic;
      p10 : in  std_logic;
      p11 : in  std_logic;
      p12 : out std_logic;
      p13 : in  std_logic
      );
  end component;

  component dip_74s11 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : out std_logic;
      p8  : out std_logic;
      p9  : in  std_logic;
      p10 : in  std_logic;
      p11 : in  std_logic;
      p12 : out std_logic;
      p13 : in  std_logic
      );
  end component;

  component dip_74s133 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : in  std_logic;
      p7  : in  std_logic;
      p9  : out std_logic;
      p10 : in  std_logic;
      p11 : in  std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic;
      p14 : in  std_logic;
      p15 : in  std_logic
      );
  end component;

  component dip_74s138 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : in  std_logic;
      p7  : out std_logic;
      p9  : out std_logic;
      p10 : out std_logic;
      p11 : out std_logic;
      p12 : out std_logic;
      p13 : out std_logic;
      p14 : out std_logic;
      p15 : out std_logic
      );
  end component;

  component dip_74s139 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : out std_logic;
      p5  : out std_logic;
      p6  : out std_logic;
      p7  : out std_logic;
      p9  : out std_logic;
      p10 : out std_logic;
      p11 : out std_logic;
      p12 : out std_logic;
      p13 : in  std_logic;
      p14 : in  std_logic;
      p15 : in  std_logic
      );
  end component;

  component dip_74s151 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : out std_logic;
      p6  : out std_logic;
      p7  : in  std_logic;
      p9  : in  std_logic;
      p10 : in  std_logic;
      p11 : in  std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic;
      p14 : in  std_logic;
      p15 : in  std_logic
      );
  end component;

  component dip_74s153 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : in  std_logic;
      p7  : out std_logic;
      p9  : out std_logic;
      p10 : in  std_logic;
      p11 : in  std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic;
      p14 : in  std_logic;
      p15 : in  std_logic
      );
  end component;

  component dip_74s157 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : out std_logic;
      p5  : in  std_logic;
      p6  : in  std_logic;
      p7  : out std_logic;
      p9  : out std_logic;
      p10 : in  std_logic;
      p11 : in  std_logic;
      p12 : out std_logic;
      p13 : in  std_logic;
      p14 : in  std_logic;
      p15 : in  std_logic
      );
  end component;

  component dip_74s169 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : in  std_logic;
      p7  : in  std_logic;
      p9  : in  std_logic;
      p10 : in  std_logic;
      p11 : out std_logic;
      p12 : out std_logic;
      p13 : out std_logic;
      p14 : out std_logic;
      p15 : out std_logic
      );
  end component;

  component dip_74s174 is
  port (
      p1  : in  std_logic;
      p2  : out std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : out std_logic;
      p6  : in  std_logic;
      p7  : out std_logic;
      p9  : in  std_logic;
      p10 : out std_logic;
      p11 : in  std_logic;
      p12 : out std_logic;
      p13 : in  std_logic;
      p14 : in  std_logic;
      p15 : out std_logic
      );
  end component;

  component dip_74s175 is
  port (
      p1  : in  std_logic;
      p2  : out std_logic;
      p3  : out std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : out std_logic;
      p7  : out std_logic;
      p9  : in  std_logic;
      p10 : out std_logic;
      p11 : out std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic;
      p14 : out std_logic;
      p15 : out std_logic
      );
  end component;

  component dip_74s181 is
  port (    
      p16 : out std_logic; -- CN+4 (carry out, active low)
      p17 : out std_logic; -- Y (carry generate)
      p15 : out std_logic; -- X (carry propagate)
      p14 : out std_logic; -- A=B

      p13 : out std_logic; -- F3
      p11 : out std_logic; -- F2
      p10 : out std_logic; -- F1
      p9  : out std_logic; -- F0


      p18 : in  std_logic; -- B3
      p20 : in  std_logic; -- B2
      p22 : in  std_logic; -- B1
      p1  : in  std_logic; -- B0

      p19 : in  std_logic; -- A3
      p21 : in  std_logic; -- A2
      p23 : in  std_logic; -- A1
      p2  : in  std_logic; -- A0

      p8  : in  std_logic; -- M (mode)
      p3  : in  std_logic; -- S3
      p4  : in  std_logic; -- S2
      p5  : in  std_logic; -- S1
      p6  : in  std_logic; -- S0

      p7  : in  std_logic  -- CN (carry in, active low)

    );
  end component;

  component dip_74s182 is
  port (
      p7  : out std_logic; -- XOUT
      p10 : out std_logic; -- YOUT
      p6  : in  std_logic; -- X3
      p5  : in  std_logic; -- Y3

      p9  : out std_logic; -- COUT2 (active low)
      p15 : in  std_logic; -- X2
      p14 : in  std_logic; -- Y2

      p11 : out std_logic; -- COUT1 (active low)
      p2  : in  std_logic; -- X1
      p1  : in  std_logic; -- Y1

      p12 : out std_logic; -- COUT0 (active low)
      p4  : in  std_logic; -- X0
      p3  : in  std_logic; -- Y0

      p13 : in  std_logic  -- CNB (active low)
      );
  end component;

  component dip_74s194 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : in  std_logic;
      p7  : in  std_logic;
      p9  : in  std_logic;
      p10 : in  std_logic;
      p11 : in  std_logic;
      p12 : out std_logic;
      p13 : out std_logic;
      p14 : out std_logic;
      p15 : out std_logic
      );
  end component;

  component dip_74s20 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : out std_logic;
      p8  : out std_logic;
      p9  : in  std_logic;
      p10 : in  std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic
      );
  end component;

  component dip_74s240 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : out std_logic;
      p4  : in  std_logic;
      p5  : out std_logic;
      p6  : in  std_logic;
      p7  : out std_logic;
      p8  : in  std_logic;
      p9  : out std_logic;
      p11 : in  std_logic;
      p12 : out std_logic;
      p13 : in  std_logic;
      p14 : out std_logic;
      p15 : in  std_logic;
      p16 : out std_logic;
      p17 : in  std_logic;
      p18 : out std_logic;
      p19 : in  std_logic
      );
  end component;

  component dip_74s241 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : out std_logic;
      p4  : in  std_logic;
      p5  : out std_logic;
      p6  : in  std_logic;
      p7  : out std_logic;
      p8  : in  std_logic;
      p9  : out std_logic;
      p11 : in  std_logic;
      p12 : out std_logic;
      p13 : in  std_logic;
      p14 : out std_logic;
      p15 : in  std_logic;
      p16 : out std_logic;
      p17 : in  std_logic;
      p18 : out std_logic;
      p19 : in  std_logic
      );
  end component;

  component dip_74s258 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : out std_logic;
      p5  : in  std_logic;
      p6  : in  std_logic;
      p7  : out std_logic;
      p9  : out std_logic;
      p10 : in  std_logic;
      p11 : in  std_logic;
      p12 : out std_logic;
      p13 : in  std_logic;
      p14 : in  std_logic;
      p15 : in  std_logic
      );
  end component;

  component dip_74s260 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : out std_logic;
      p6  : out std_logic;
      p8  : in  std_logic;
      p9  : in  std_logic;
      p10 : in  std_logic;
      p11 : in  std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic
      );
  end component;

  component dip_74s280 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p4  : in  std_logic;
      p5  : out std_logic;
      p6  : out std_logic;
      p8  : in  std_logic;
      p9  : in  std_logic;
      p10 : in  std_logic;
      p11 : in  std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic
      );
  end component;

  component dip_74s283 is
  port (
      p1  : out std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : out std_logic;
      p5  : in  std_logic;
      p6  : in  std_logic;
      p7  : in  std_logic;
      p9  : out std_logic;
      p10 : out std_logic;
      p11 : in  std_logic;
      p12 : in  std_logic;
      p13 : out std_logic;
      p14 : in  std_logic;
      p15 : in  std_logic
      );
  end component;

  component dip_74s32 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : out std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : out std_logic;
      p8  : out std_logic;
      p9  : in  std_logic;
      p10 : in  std_logic;
      p11 : out std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic
      );
  end component;

  component dip_74s37 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : out std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : out std_logic;
      p8  : out std_logic;
      p9  : in  std_logic;
      p10 : in  std_logic;
      p11 : out std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic
      );
  end component;

  component dip_74s373 is
  port (
      p1  : in  std_logic;
      p2  : out std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : out std_logic;
      p6  : out std_logic;
      p7  : in  std_logic;
      p8  : in  std_logic;
      p9  : out std_logic;
      p11 : in  std_logic;
      p12 : out std_logic;
      p13 : in  std_logic;
      p14 : in  std_logic;
      p15 : out std_logic;
      p16 : out std_logic;
      p17 : in  std_logic;
      p18 : in  std_logic;
      p19 : out std_logic
      );
  end component;

  component dip_74s374 is
  port (
      p1  : in  std_logic;
      p2  : out std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : out std_logic;
      p6  : out std_logic;
      p7  : in  std_logic;
      p8  : in  std_logic;
      p9  : out std_logic;
      p11 : in  std_logic;
      p12 : out std_logic;
      p13 : in  std_logic;
      p14 : in  std_logic;
      p15 : out std_logic;
      p16 : out std_logic;
      p17 : in  std_logic;
      p18 : in  std_logic;
      p19 : out std_logic
      );
  end component;

  component dip_74s38 is
  port (
      p1  : in  std_logic;  -- 1A
      p2  : in  std_logic;  -- 1B
      p3  : out std_logic;  -- 1Y
      p4  : in  std_logic;  -- 2A
      p5  : in  std_logic;  -- 2B
      p6  : out std_logic;  -- 2Y
      p8  : out std_logic;  -- 3Y
      p9  : in  std_logic;  -- 3B
      p10 : in  std_logic;  -- 3A
      p11 : out std_logic;  -- 4Y
      p12 : in  std_logic;  -- 4B
      p13 : in  std_logic  -- 4A
    );
  end component;

  component dip_74s472 is
  generic (fn : string := "");
    port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : out std_logic;
      p7  : out std_logic;
      p8  : out std_logic;
      p9  : out std_logic;
      p11 : out std_logic;
      p12 : out std_logic;
      p13 : out std_logic;
      p14 : out std_logic;
      p15 : in  std_logic;
      p16 : in  std_logic;
      p17 : in  std_logic;
      p18 : in  std_logic;
      p19 : in  std_logic
      );
  end component;

  component dip_74s51 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : out std_logic;
      p8  : out std_logic;
      p9  : in  std_logic;
      p10 : in  std_logic;
      p13 : in  std_logic
      );
  end component;

  component dip_74s64 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : in  std_logic;
      p8  : out std_logic;
      p9  : in  std_logic;
      p10 : in  std_logic;
      p11 : in  std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic
      );
  end component;

  component dip_74s74 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : out std_logic;
      p6  : out std_logic;
      p8  : out std_logic;
      p9  : out std_logic;
      p10 : in  std_logic;
      p11 : in  std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic
      );
  end component;

  component dip_74s86 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : out std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : out std_logic;
      p8  : out std_logic;
      p9  : in  std_logic;
      p10 : in  std_logic;
      p11 : out std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic
      );
  end component;

  component dip_82s21 is
  generic (fn : string := "");
    port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : in  std_logic;
      p7  : out std_logic;
      p9  : out std_logic;
      p10 : in  std_logic;
      p11 : in  std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic;
      p14 : in  std_logic;
      p15 : in  std_logic
      );
  end component;

  component dip_8304 is
  port (
      p1  : inout std_logic; -- A0
      p2  : inout std_logic; -- A1
      p3  : inout std_logic; -- A2
      p4  : inout std_logic; -- A3
      p5  : inout std_logic; -- A4
      p6  : inout std_logic; -- A5
      p7  : inout std_logic; -- A6
      p8  : inout std_logic; -- A7
      p9  : in    std_logic; -- chip_disable
      p11 : in    std_logic; -- transmit
      p12 : inout std_logic; -- B7
      p13 : inout std_logic; -- B6
      p14 : inout std_logic; -- B5
      p15 : inout std_logic; -- B4
      p16 : inout std_logic; -- B3
      p17 : inout std_logic; -- B2
      p18 : inout std_logic; -- B1
      p19 : inout std_logic  -- B0
    );
  end component;

  component dip_9328 is
  port (
      p1  : in  std_logic;
      p2  : out std_logic;
      p3  : out std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : in  std_logic;
      p7  : in  std_logic;
      p9  : in  std_logic;
      p10 : in  std_logic;
      p11 : in  std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic;
      p14 : out std_logic;
      p15 : out std_logic
      );
  end component;

  component dip_93425a is
  generic (fn : string := "");
    port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : in  std_logic;
      p7  : out std_logic;
      p9  : in  std_logic;
      p10 : in  std_logic;
      p11 : in  std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic;
      p14 : in  std_logic;
      p15 : in  std_logic
      );
  end component;

  component dip_93s46 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : in  std_logic;
      p7  : in  std_logic;
      p9  : out std_logic;
      p10 : in  std_logic;
      p11 : in  std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic;
      p14 : in  std_logic;
      p15 : in  std_logic
      );
  end component;

  component dip_93s48 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : in  std_logic;
      p7  : in  std_logic;
      p9  : out std_logic;
      p10 : out std_logic;
      p11 : in  std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic;
      p14 : in  std_logic;
      p15 : in  std_logic
      );
  end component;

  component dip_9s42_1 is
  port (
      p1  : in  std_logic;
      p2  : in  std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : in  std_logic;
      p7  : out std_logic;
      p9  : out std_logic;
      p10 : in  std_logic;
      p11 : in  std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic;
      p14 : in  std_logic;
      p15 : in  std_logic
      );
  end component;

  component dip_dm8838 is
  port (
      p5 : in std_logic; -- in 4
      p2 : in std_logic; -- in 3
      p11 : in std_logic; -- in 2
      p14 : in std_logic; -- in 1

      p6 : out std_logic; -- out 4
      p3 : out std_logic; -- out 3
      p10 : out std_logic; -- out 2
      p13 : out std_logic; -- out 1

      p4 : inout std_logic; -- bus 4
      p1 : inout std_logic; -- bus 3
      p12 : inout std_logic; -- bus 2
      p15 : inout std_logic; -- bus 1

      p9 : in std_logic; -- disable_a / -ena
      p7 : in std_logic -- disable_b / -enb
    );
  end component;

  component dip_dummy4 is
  port (
    p1  : in std_logic; 
    p2  : in std_logic;
    p3  : out std_logic;
    p4  : out std_logic
    );
  end component;

  component dip_mtd100 is
  port (
      p1 : in std_logic;
      p3 : in std_logic;
      p5 : in std_logic;
      p12 : out std_logic;
      p10 : out std_logic;
      p8 : out std_logic
    );
  end component;

  component dip_res20 is
  port (
      p2  : out std_logic;
      p3  : out std_logic;
      p4  : out std_logic;
      p5  : out std_logic;
      p6  : out std_logic;
      p7  : out std_logic;
      p8  : out std_logic;
      p9  : out std_logic;
      p10 : out std_logic;
      p11 : out std_logic;
      p12 : out std_logic;
      p13 : out std_logic;
      p14 : out std_logic;
      p15 : out std_logic;
      p16 : out std_logic;
      p17 : out std_logic;
      p18 : out std_logic;
      p19 : out std_logic
      );
  end component;

  component dip_sip180_390_8 is
  port (
      p2 : inout std_logic;
      p3 : inout std_logic;
      p4 : inout std_logic;
      p5 : inout std_logic;
      p6 : inout std_logic;
      p7 : inout std_logic
      );
  end component;

  component dip_sip220_330_8 is
  port (
      p2 : inout std_logic;
      p3 : inout std_logic;
      p4 : inout std_logic;
      p5 : inout std_logic;
      p6 : inout std_logic;
      p7 : inout std_logic
      );
  end component;

  component dip_sip330_470_8 is
  port (
      p2 : inout std_logic;
      p3 : inout std_logic;
      p4 : inout std_logic;
      p5 : inout std_logic;
      p6 : inout std_logic;
      p7 : inout std_logic
      );
  end component;

  component dip_td100 is
  port (
      p1  : in  std_logic;
      p4  : out std_logic;
      p6  : out std_logic;
      p8  : out std_logic;
      p10 : out std_logic;
      p12 : out std_logic
      );
  end component;

  component dip_td25 is
  port (
      p1  : in  std_logic;
      p4  : out std_logic;
      p6  : out std_logic;
      p8  : out std_logic;
      p10 : out std_logic;
      p12 : out std_logic
      );
  end component;

  component dip_td250 is
  port (
      p1  : in  std_logic;
      p4  : out std_logic;
      p6  : out std_logic;
      p8  : out std_logic;
      p10 : out std_logic;
      p12 : out std_logic
      );
  end component;

  component dip_td50 is
  port (
      p1  : in  std_logic;
      p4  : out std_logic;
      p6  : out std_logic;
      p8  : out std_logic;
      p10 : out std_logic;
      p12 : out std_logic
      );
  end component;

  component dip_til309 is
  port (
      p1  : out std_logic;
      p2  : out std_logic;
      p3  : out std_logic;
      p4  : out std_logic;
      p5  : in  std_logic;
      p6  : in  std_logic;
      p7  : in  std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic;
      p14 : in  std_logic;
      p15 : in  std_logic;
      p16 : in  std_logic;
      p17 : in  std_logic
      );
  end component;

alias dip_74s288 is dip_5610;
alias dip_74ls74 is dip_74s74;
alias dip_74ls240 is dip_74s240;
alias dip_74ls374 is dip_74s374;
alias dip_9s42 is dip_9s42_1;

end package;
