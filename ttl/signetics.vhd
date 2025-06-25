-- Signetics components

library ieee;
use ieee.std_logic_1164.all;

-- the component names in this package are exact
-- there should not be any aliases

package signetics is

  component n82s21 is
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
      latch_n: in  std_logic;
      wclk_n : in  std_logic;
      ce     : in  std_logic
      );
  end component;

end;
