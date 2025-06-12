-- 9-Bit Odd/Even Parity Generators/Checkers

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Datasheet: Texas Instruments SN74LS280 9-Bit Odd/Even Parity Generators/Checkers, PDIP (N) Package
-- URL: https://www.ti.com/lit/gpn/SN74LS280

entity sn74280 is
  port (
    i0 : in std_logic;
    i1 : in std_logic;
    i2 : in std_logic;
    i3 : in std_logic;
    i4 : in std_logic;
    i5 : in std_logic;
    i6 : in std_logic;
    i7 : in std_logic;
    i8 : in std_logic;

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
    if (i0 /= '0' and i0 /= '1') or (i1 /= '0' and i1 /= '1') or 
       (i2 /= '0' and i2 /= '1') or (i3 /= '0' and i3 /= '1') or
       (i4 /= '0' and i4 /= '1') or (i5 /= '0' and i5 /= '1') or
       (i6 /= '0' and i6 /= '1') or (i7 /= '0' and i7 /= '1') or
       (i8 /= '0' and i8 /= '1') then
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
