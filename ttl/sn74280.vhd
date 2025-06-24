-- 9-Bit Odd/Even Parity Generators/Checkers

library ieee;
use ieee.std_logic_1164.all;

entity sn74280 is
  port (
    i0 : in std_logic := 'H';
    i1 : in std_logic := 'H';
    i2 : in std_logic := 'H';
    i3 : in std_logic := 'H';
    i4 : in std_logic := 'H';
    i5 : in std_logic := 'H';
    i6 : in std_logic := 'H';
    i7 : in std_logic := 'H';
    i8 : in std_logic := 'H';

    even : out std_logic;
    odd  : out std_logic
    );
end;

architecture ttl of sn74280 is
begin
  process (all)
    variable parity : std_logic;
    variable inputs : std_logic_vector(8 downto 0);
  begin
    inputs := i8 & i7 & i6 & i5 & i4 & i3 & i2 & i1 & i0;
    
    -- Check for unknown inputs
    if is_x(inputs) then
      -- Any unknown input causes unknown outputs
      even <= 'X';
      odd  <= 'X';
    else
      -- All inputs are valid, calculate parity
      parity := i0 xor i1 xor i2 xor i3 xor i4 xor i5 xor i6 xor i7 xor i8;
      even   <= not parity;
      odd    <= parity;
    end if;
  end process;
end;
