library ieee;
use ieee.std_logic_1164.all;

package fairchild is

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

  component dm93s46
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

end;
