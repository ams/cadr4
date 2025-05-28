-- 4096 X 1 Static RAM

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity am2147 is
  port (
    a0   : in  std_logic; -- Pin 2
    a1   : in  std_logic; -- Pin 3
    a2   : in  std_logic; -- Pin 4
    a3   : in  std_logic; -- Pin 5
    a4   : in  std_logic; -- Pin 6
    a5   : in  std_logic; -- Pin 9
    a6   : in  std_logic; -- Pin 17
    a7   : in  std_logic; -- Pin 16
    a8   : in  std_logic; -- Pin 15
    a9   : in  std_logic; -- Pin 14
    a10  : in  std_logic; -- Pin 13
    a11  : in  std_logic; -- Pin 12
    ce_n : in  std_logic; -- Pin 1 (active low Chip Enable)
    di   : in  std_logic; -- Pin 11
    we_n : in  std_logic; -- Pin 10
    do   : out std_logic  -- Pin 7
    );
end am2147;

-- ChatGPT Codex implementation
architecture ttl of am2147 is
  type ram_t is array (0 to 4095) of std_logic;
  signal ram  : ram_t := (others => '0');
  signal addr : unsigned(11 downto 0);
begin
  addr <= a11 & a10 & a9 & a8 & a7 & a6 & a5 & a4 & a3 & a2 & a1 & a0;

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
