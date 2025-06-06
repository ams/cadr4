-- 4 Bit Binary Full Adders With Fast Carry

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74283 is
  port (
    c0 : in  std_logic;
    a0 : in  std_logic;
    a1 : in  std_logic;
    a2 : in  std_logic;
    a3 : in  std_logic;
    b0 : in  std_logic;
    b1 : in  std_logic;
    b2 : in  std_logic;
    b3 : in  std_logic;
    s0 : out std_logic;
    s1 : out std_logic;
    s2 : out std_logic;
    s3 : out std_logic;
    c4 : out std_logic
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
    s3  <= sum(3); s2 <= sum(2); s1 <= sum(1); s0 <= sum(0);
    c4  <= sum(4);
  end process;
end;
