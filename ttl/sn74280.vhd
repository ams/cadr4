-- 9-Bit Odd/Even Parity Generators/Checkers

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74280 is
  port (
    i0, i1, i2, i3, i4, i5, i6, i7, i8 : in std_logic;

    even, odd : out std_logic
    );
end;

architecture ttl of sn74280 is
begin
  process (i0, i1, i2, i3, i4, i5, i6, i7, i8)
    variable parity : std_logic;
  begin
    parity := i0 xor i1 xor i2 xor i3 xor i4 xor i5 xor i6 xor i7 xor i8;
    even <= not parity;
    odd <= parity;
  end process;
end;
