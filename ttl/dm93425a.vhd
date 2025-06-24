-- 1024x1 Bit TTL Bipolar RAM
-- Fairchild 93425A
-- doc/ttl/dm93425a.pdf

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dm93425a is
  port (
    a0   : in  std_logic := 'H';
    a1   : in  std_logic := 'H';
    a2   : in  std_logic := 'H';
    a3   : in  std_logic := 'H';
    a4   : in  std_logic := 'H';
    a5   : in  std_logic := 'H';
    a6   : in  std_logic := 'H';
    a7   : in  std_logic := 'H';
    a8   : in  std_logic := 'H';
    a9   : in  std_logic := 'H';
    ce_n : in  std_logic := 'H';
    we_n : in  std_logic := 'H';
    di   : in  std_logic := 'H';
    do   : out std_logic
    );
end entity;

architecture ttl of dm93425a is
  type ram_t is array (0 to 1023) of std_logic;
  signal ram  : ram_t;
begin
  process(all)
    variable addr : unsigned(9 downto 0);
  begin
    if ce_n = '0' then
      addr := (a9, a8, a7, a6, a5, a4, a3, a2, a1, a0);
      if is_x(addr) then
        do <= 'X';
      else
        if we_n = '0' then
          -- Write
          ram(to_integer(addr)) <= di;
        else
          -- Read (always happens when enabled)
          do <= ram(to_integer(addr));
        end if;
      end if;
  else
    do <= 'Z';
  end if;
  end process;
end architecture;
