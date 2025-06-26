-- 4 Bit Binary Full Adders With Fast Carry

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.misc.all;

entity sn74283 is
  port (
    ci : in std_logic; -- Pin 7
    a0 : in std_logic; -- Pin 5
    a1 : in std_logic; -- Pin 3
    a2 : in std_logic; -- Pin 14
    a3 : in std_logic; -- Pin 13
    b0 : in std_logic; -- Pin 6
    b1 : in std_logic; -- Pin 2
    b2 : in std_logic; -- Pin 15
    b3 : in std_logic; -- Pin 11
    s0 : out std_logic; -- Pin 4
    s1 : out std_logic; -- Pin 1
    s2 : out std_logic; -- Pin 13
    s3 : out std_logic; -- Pin 10
    co : out std_logic  -- Pin 9
    );
end;

architecture ttl of sn74283 is
  signal ci_i, a0_i, a1_i, a2_i, a3_i, b0_i, b1_i, b2_i, b3_i : std_logic;
  signal a : unsigned(3 downto 0);
  signal b : unsigned(3 downto 0);
begin

  ci_i <= ttl_input(ci);
  a0_i <= ttl_input(a0);
  a1_i <= ttl_input(a1);
  a2_i <= ttl_input(a2);
  a3_i <= ttl_input(a3);
  b0_i <= ttl_input(b0);
  b1_i <= ttl_input(b1);
  b2_i <= ttl_input(b2);
  b3_i <= ttl_input(b3);

  a <= a3_i & a2_i & a1_i & a0_i;
  b <= b3_i & b2_i & b1_i & b0_i;

  process(all)
    variable sum : unsigned(4 downto 0);
  begin
    -- Check for unknown inputs
    if is_x(a) or is_x(b) then
      -- Any unknown input causes unknown outputs
      s0 <= 'X'; s1 <= 'X'; s2 <= 'X'; s3 <= 'X'; co <= 'X';
    else
      -- All inputs are valid, perform addition
      sum := ('0' & a) + ('0' & b) + ("0000" & ci_i);
      s3  <= sum(3); s2 <= sum(2); s1 <= sum(1); s0 <= sum(0);
      co  <= sum(4);
    end if;
  end process;
end;
