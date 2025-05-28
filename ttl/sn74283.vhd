-- 4 Bit Binary Full Adders With Fast Carry

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74283 is
  port (
    c0 : in std_logic; -- Pin 7
    a0 : in std_logic; -- Pin 1
    a1 : in std_logic; -- Pin 4
    a2 : in std_logic; -- Pin 15
    a3 : in std_logic; -- Pin 12
    b0 : in std_logic; -- Pin 2
    b1 : in std_logic; -- Pin 5
    b2 : in std_logic; -- Pin 14
    b3 : in std_logic; -- Pin 11
    s0 : out std_logic; -- Pin 3
    s1 : out std_logic; -- Pin 6
    s2 : out std_logic; -- Pin 13
    s3 : out std_logic; -- Pin 10
    c4 : out std_logic  -- Pin 9
    );
end;

-- ChatGPT Codex implementation
architecture ttl of sn74283 is
  signal a : unsigned(3 downto 0);
  signal b : unsigned(3 downto 0);
begin
  a <= a3 & a2 & a1 & a0;
  b <= b3 & b2 & b1 & b0;

  process(all)
    variable sum : unsigned(4 downto 0);
  begin
    sum := ('0' & a) + ('0' & b) + ("0000" & c0);
    s3 <= sum(3); s2 <= sum(2); s1 <= sum(1); s0 <= sum(0);
    c4 <= sum(4);
  end process;
end;
