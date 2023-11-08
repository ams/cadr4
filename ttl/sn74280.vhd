-- 9-Bit Odd/Even Parity Generators/Checkers

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74280 is
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
end;

architecture ttl of sn74280 is
begin

end;
