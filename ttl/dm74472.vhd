-- (512x8) 4096-Bit TTL PROM

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dm74472 is
  generic (fn : string := "");
  port (
    a0, a1, a2, a3, a4, a5, a6, a7, a8 : in  std_logic;
    d0, d1, d2, d3, d4, d5, d6, d7     : out std_logic;
    ce_n                               : in  std_logic
    );
end;

architecture ttl of dm74472 is
  type rom_t is array (0 to 511) of std_logic_vector(7 downto 0);
  signal rom  : rom_t := (others => (others => '0'));
  signal addr : unsigned(8 downto 0);
begin
  addr <= a8 & a7 & a6 & a5 & a4 & a3 & a2 & a1 & a0;

  process(all)
    variable data : std_logic_vector(7 downto 0);
  begin
    data := rom(to_integer(addr));
    if ce_n = '0' then
      d7 <= data(7); d6 <= data(6); d5 <= data(5); d4 <= data(4);
      d3 <= data(3); d2 <= data(2); d1 <= data(1); d0 <= data(0);
    else
      d7 <= 'Z'; d6 <= 'Z'; d5 <= 'Z'; d4 <= 'Z';
      d3 <= 'Z'; d2 <= 'Z'; d1 <= 'Z'; d0 <= 'Z';
    end if;
  end process;
end;
