-- 4096 X 1 Static RAM

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity am2147 is
  port (
    a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11 : in  std_logic;
    ce_n                                             : in  std_logic;
    di                                               : in  std_logic;
    we_n                                             : in  std_logic;
    do                                               : out std_logic
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
