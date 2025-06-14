-- 256 Bit Bipolar Read Only Memory
-- IM5600 256x8 Bipolar PROM

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.misc.all;

entity im5600 is
  generic (fn : string := "");
  port (
    ce_n : in  std_logic := 'H';
    a0   : in  std_logic := 'H';
    a1   : in  std_logic := 'H';
    a2   : in  std_logic := 'H';
    a3   : in  std_logic := 'H';
    a4   : in  std_logic := 'H';
    o0   : out std_logic;
    o1   : out std_logic;
    o2   : out std_logic;
    o3   : out std_logic;
    o4   : out std_logic;
    o5   : out std_logic;
    o6   : out std_logic;
    o7   : out std_logic
    );
end im5600;

architecture ttl of im5600 is
  constant rom  : std_logic_vector := load_rom_file(fn);
  signal addr : unsigned(4 downto 0) := (others => '0');
  

  
begin
  addr <= a4 & a3 & a2 & a1 & a0;

  process(all)
    variable data : std_logic_vector(7 downto 0);
    variable addr_int : integer;
  begin
    if ce_n = '0' then
      -- Check for unknown address or control signals
      if is_x(std_logic_vector(addr)) or (ce_n /= '0' and ce_n /= '1') then
        -- Unknown address or control produces unknown output
        o7 <= 'X'; o6 <= 'X'; o5 <= 'X'; o4 <= 'X';
        o3 <= 'X'; o2 <= 'X'; o1 <= 'X'; o0 <= 'X';
      else
        addr_int := to_integer(addr);
        data := rom(addr_int * 8 + 7 downto addr_int * 8);
        o7   <= data(7); o6 <= data(6); o5 <= data(5); o4 <= data(4);
        o3   <= data(3); o2 <= data(2); o1 <= data(1); o0 <= data(0);
      end if;
    else
      o7 <= 'Z'; o6 <= 'Z'; o5 <= 'Z'; o4 <= 'Z';
      o3 <= 'Z'; o2 <= 'Z'; o1 <= 'Z'; o0 <= 'Z';
    end if;
  end process;
end;
