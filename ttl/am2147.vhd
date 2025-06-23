-- 4096 X 1 Static RAM

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Datasheet: AMD AM2147
entity am2147 is
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
    a10  : in  std_logic := 'H';
    a11  : in  std_logic := 'H';
    ce_n : in  std_logic := 'H';
    di   : in  std_logic := 'H';
    we_n : in  std_logic := 'H';
    do   : out std_logic
    );
end am2147;

architecture ttl of am2147 is
  type ram_t is array (0 to 4095) of std_logic;
  signal ram : ram_t;
begin
  process (all)
    variable addr : unsigned(11 downto 0);
  begin
    addr := (a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0);
    if ce_n = '0' then
      if we_n = '0' then
        ram(to_integer(addr)) <= di;
      else
        do <= ram(to_integer(addr));
      end if;
    else
      do <= 'Z';
    end if;
  end process;
end architecture;
