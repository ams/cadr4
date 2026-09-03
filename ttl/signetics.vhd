library ieee;
use ieee.std_logic_1164.all;

package signetics is

  component n82s21 is
  generic (fn : string := "");
    port (
      a0     : in  std_logic; -- 13
      a1     : in  std_logic; -- 12
      a2     : in  std_logic; -- 11
      a3     : in  std_logic; -- 10
      a4     : in  std_logic; -- 4
      ce     : in  std_logic; -- 5
      d0     : out std_logic; -- 7 (O0, open collector)
      d1     : out std_logic; -- 9 (O1, open collector)
      i0     : in  std_logic; -- 3
      i1     : in  std_logic; -- 14
      latch_n: in  std_logic; -- 6 (L)
      wclk_n : in  std_logic; -- 1 (C, write control)
      we0_n  : in  std_logic; -- 2 (W0)
      we1_n  : in  std_logic  -- 15 (W1)
      );
  end component;

end package;
