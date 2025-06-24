-- Engineered Components Company

library ieee;
use ieee.std_logic_1164.all;

package ecc is

  component ttldm is
    generic (
      single_tap_delay : time
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

end;
