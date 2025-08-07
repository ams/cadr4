library ieee;
use ieee.std_logic_1164.all;

package fairchild is

  component dm8838 is
  port (
      in1 : in    std_logic; -- Input 1
      in2 : in    std_logic; -- Input 2  
      in3 : in    std_logic; -- Input 3
      in4 : in    std_logic; -- Input 4
      out1 : out  std_logic; -- Output 1
      out2 : out  std_logic; -- Output 2
      out3 : out  std_logic; -- Output 3
      out4 : out  std_logic; -- Output 4
      bus1 : inout std_logic; -- Bidirectional bus 1
      bus2 : inout std_logic; -- Bidirectional bus 2
      bus3 : inout std_logic; -- Bidirectional bus 3
      bus4 : inout std_logic; -- Bidirectional bus 4
      disable_a : in std_logic; -- Disable A (active high)
      disable_b : in std_logic  -- Disable B (active high)
      );
  end component;

  component dm9328 is
  port (
      clr_n  : in  std_logic; -- 7
      aq_n   : out std_logic; -- 1
      aq     : out std_logic; -- 2
      asel   : in  std_logic; -- 3
      ai1    : in  std_logic; -- 5
      ai0    : in  std_logic; -- 4
      aclk   : in  std_logic; -- 6
      comclk : in  std_logic; -- 9
      bclk   : in  std_logic; -- 10
      bi0    : in  std_logic; -- 11
      bi1    : in  std_logic; -- 12
      bsel   : in  std_logic; -- 13
      bq     : out std_logic; -- 14
      bq_n   : out std_logic  -- 15
      );
  end component;

  component dm93425a is
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
      a9   : in  std_logic;
      ce_n : in  std_logic;
      we_n : in  std_logic;
      di   : in  std_logic;
      do   : out std_logic
      );
  end component;

  component dm93s46 is
  port (
      a0  : in  std_logic;
      b0  : in  std_logic;
      a1  : in  std_logic;
      b1  : in  std_logic;
      a2  : in  std_logic;
      b2  : in  std_logic;
      enb : in  std_logic;
      eq  : out std_logic;
      a3  : in  std_logic;
      b3  : in  std_logic;
      a4  : in  std_logic;
      b4  : in  std_logic;
      a5  : in  std_logic;
      b5  : in  std_logic
      );
  end component;

  component dm9s42 is
  port (
      g1a1 : in  std_logic; -- Pin 1
      g1b1 : in  std_logic; -- Pin 2
      g2a1 : in  std_logic; -- Pin 3
      g2b1 : in  std_logic; -- Pin 4
      g2c1 : in  std_logic; -- Pin 5
      g2d1 : in  std_logic; -- Pin 6
      out1 : out std_logic; -- Pin 8
      g1a2 : in  std_logic; -- Pin 9
      g1b2 : in  std_logic; -- Pin 10
      g2a2 : in  std_logic; -- Pin 11
      g2b2 : in  std_logic; -- Pin 12
      g2c2 : in  std_logic; -- Pin 13
      g2d2 : in  std_logic; -- Pin 14
      out2 : out std_logic  -- Pin 15
      );
  end component;

end package;
