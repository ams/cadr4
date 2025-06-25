-- 9-Bit Odd/Even Parity Generators/Checkers

library ieee;
use ieee.std_logic_1164.all;

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
  signal i0_i, i1_i, i2_i, i3_i, i4_i, i5_i, i6_i, i7_i, i8_i : std_logic;
begin

  i0_i <= 'H';
  i1_i <= 'H';
  i2_i <= 'H';
  i3_i <= 'H';
  i4_i <= 'H';
  i5_i <= 'H';
  i6_i <= 'H';
  i7_i <= 'H';
  i8_i <= 'H';

  i0_i <= i0;
  i1_i <= i1;
  i2_i <= i2;
  i3_i <= i3;
  i4_i <= i4;
  i5_i <= i5;
  i6_i <= i6;
  i7_i <= i7;
  i8_i <= i8;

  process (all)
    variable parity : std_logic;
    variable inputs : std_logic_vector(8 downto 0);
  begin
    inputs := i8_i & i7_i & i6_i & i5_i & i4_i & i3_i & i2_i & i1_i & i0_i;
    
    -- Check for unknown inputs
    if is_x(inputs) then
      -- Any unknown input causes unknown outputs
      even <= 'X';
      odd  <= 'X';
    else
      -- All inputs are valid, calculate parity
      parity := i0_i xor i1_i xor i2_i xor i3_i xor i4_i xor i5_i xor i6_i xor i7_i xor i8_i;
      even   <= not parity;
      odd    <= parity;
    end if;
  end process;
end;
