-- 4 Bit Binary Full Adders With Fast Carry

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Datasheet: Texas Instruments SN74LS283 4-Bit Binary Full Adders With Fast Carry, PDIP (N) Package
-- URL: https://www.ti.com/lit/gpn/SN74LS283

entity sn74283 is
  port (
    c0 : in std_logic := 'H'; -- Pin 7
    a0 : in std_logic := 'H'; -- Pin 5
    a1 : in std_logic := 'H'; -- Pin 3
    a2 : in std_logic := 'H'; -- Pin 14
    a3 : in std_logic := 'H'; -- Pin 13
    b0 : in std_logic := 'H'; -- Pin 6
    b1 : in std_logic := 'H'; -- Pin 2
    b2 : in std_logic := 'H'; -- Pin 15
    b3 : in std_logic := 'H'; -- Pin 11
    s0 : out std_logic; -- Pin 4
    s1 : out std_logic; -- Pin 1
    s2 : out std_logic; -- Pin 13
    s3 : out std_logic; -- Pin 10
    c4 : out std_logic  -- Pin 9
    );
end;

architecture ttl of sn74283 is
  signal a : unsigned(3 downto 0);
  signal b : unsigned(3 downto 0);
begin
  a <= a3 & a2 & a1 & a0;
  b <= b3 & b2 & b1 & b0;

  process(all)
    variable sum : unsigned(4 downto 0);
  begin
    -- Check for unknown inputs
    if (a0 /= '0' and a0 /= '1') or (a1 /= '0' and a1 /= '1') or 
       (a2 /= '0' and a2 /= '1') or (a3 /= '0' and a3 /= '1') or
       (b0 /= '0' and b0 /= '1') or (b1 /= '0' and b1 /= '1') or
       (b2 /= '0' and b2 /= '1') or (b3 /= '0' and b3 /= '1') or
       (c0 /= '0' and c0 /= '1') then
      -- Any unknown input causes unknown outputs
      s0 <= 'X'; s1 <= 'X'; s2 <= 'X'; s3 <= 'X'; c4 <= 'X';
    else
      -- All inputs are valid, perform addition
      sum := ('0' & a) + ('0' & b) + ("0000" & c0);
      s3  <= sum(3); s2 <= sum(2); s1 <= sum(1); s0 <= sum(0);
      c4  <= sum(4);
    end if;
  end process;
end;
