-- 256 Bit Bipolar Read Only Memory

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity im5600 is
  generic (fn : string := "");
  port (
    ce_n                           : in  std_logic;
    a0, a1, a2, a3, a4             : in  std_logic;
    o0, o1, o2, o3, o4, o5, o6, o7 : out std_logic
    );
end im5600;

architecture ttl of im5600 is
  type rom_t is array (0 to 31) of std_logic_vector(7 downto 0);
  signal rom  : rom_t := (others => (others => '0'));
  signal addr : unsigned(4 downto 0);
begin
  addr <= a4 & a3 & a2 & a1 & a0;

  process(all)
    variable data : std_logic_vector(7 downto 0);
  begin
    data := rom(to_integer(addr));
    if ce_n = '0' then
      o7 <= data(7); o6 <= data(6); o5 <= data(5); o4 <= data(4);
      o3 <= data(3); o2 <= data(2); o1 <= data(1); o0 <= data(0);
    else
      o7 <= 'Z'; o6 <= 'Z'; o5 <= 'Z'; o4 <= 'Z';
      o3 <= 'Z'; o2 <= 'Z'; o1 <= 'Z'; o0 <= 'Z';
    end if;
  end process;
end;
