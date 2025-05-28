-- AM93425A 1024 X 1 Bit RAM

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity am93425a is
  port (
    a0   : in  std_logic; -- pin 2
    a1   : in  std_logic; -- pin 3
    a2   : in  std_logic; -- pin 4
    a3   : in  std_logic; -- pin 5
    a4   : in  std_logic; -- pin 6
    a5   : in  std_logic; -- pin 9
    a6   : in  std_logic; -- pin 10
    a7   : in  std_logic; -- pin 11
    a8   : in  std_logic; -- pin 12
    a9   : in  std_logic; -- pin 13
    ce_n : in  std_logic; -- pin 1
    we_n : in  std_logic; -- pin 14
    di   : in  std_logic; -- pin 15
    do   : out std_logic  -- pin 7
    );
end am93425a;

-- ChatGPT Codex implementation
architecture ttl of am93425a is
  type ram_t is array (0 to 1023) of std_logic;
  signal ram  : ram_t := (others => '0');
  signal addr : unsigned(9 downto 0) := (others => '0');
begin
  addr <= a9 & a8 & a7 & a6 & a5 & a4 & a3 & a2 & a1 & a0;

  process(all)
  begin
    if ce_n = '0' then
      if we_n = '0' then
        ram(to_integer(addr)) <= di;
      end if;
      do <= ram(to_integer(addr));
    else
      do <= 'Z';
    end if;
  end process;
end;
