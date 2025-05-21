-- 4 Bit Binary Full Adders With Fast Carry

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74283 is
  port (
    c0             : in std_logic;
    a0, a1, a2, a3 : in std_logic;
    b0, b1, b2, b3 : in std_logic;

    s0, s1, s2, s3 : out std_logic;
    c4             : out std_logic
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
    sum := ('0' & a) + ('0' & b) + ("0000" & c0);
    s3 <= sum(3); s2 <= sum(2); s1 <= sum(1); s0 <= sum(0);
    c4 <= sum(4);
  end process;
end;
