library ieee;
use ieee.std_logic_1164.all;

package ecc is

  component mttldl is
  generic (delay : time := 100 ns);
    port (
      i0 : in std_logic; -- 1
      i1 : in std_logic; -- 3
      i2 : in std_logic; -- 5
      o0 : out std_logic; -- 12
      o1 : out std_logic; -- 10
      o2 : out std_logic  -- 8
    );
  end component;

  component ttldm is
  generic (
      single_tap_delay : time := 5 ns
      );
    port (
      input  : in  std_logic;
      tap1   : out std_logic := 'H';
      tap2   : out std_logic := 'H';
      tap3   : out std_logic := 'H';
      tap4   : out std_logic := 'H';
      output : out std_logic := 'H'
      );
  end component;

end package;
