-- (512x8) 4096-Bit TTL PROM
-- Datasheet for DM74472 not found. This VHDL model might be based on a non-standard or custom implementation.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.misc.all;

entity dm74472 is
  generic (fn : string := "");
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
    d0   : out std_logic;
    d1   : out std_logic;
    d2   : out std_logic;
    d3   : out std_logic;
    d4   : out std_logic;
    d5   : out std_logic;
    d6   : out std_logic;
    d7   : out std_logic;
    ce_n : in  std_logic := 'H'
    );
end;

architecture ttl of dm74472 is
  constant rom  : std_logic_vector := load_rom_file(fn);
  signal addr : unsigned(8 downto 0) := (others => '0');
  

  
begin
  addr <= a8 & a7 & a6 & a5 & a4 & a3 & a2 & a1 & a0;

  process(all)
    variable data : std_logic_vector(7 downto 0);
    variable addr_int : integer;
  begin
    if ce_n = '0' then
      -- Check for unknown address or control signals
      if is_x(std_logic_vector(addr)) or (ce_n /= '0' and ce_n /= '1') then
        -- Unknown address or control produces unknown output
        d7 <= 'X'; d6 <= 'X'; d5 <= 'X'; d4 <= 'X';
        d3 <= 'X'; d2 <= 'X'; d1 <= 'X'; d0 <= 'X';
      else
        addr_int := to_integer(addr);
        data := rom(addr_int * 8 + 7 downto addr_int * 8);
        d7   <= data(7); d6 <= data(6); d5 <= data(5); d4 <= data(4);
        d3   <= data(3); d2 <= data(2); d1 <= data(1); d0 <= data(0);
      end if;
    else
      d7 <= 'Z'; d6 <= 'Z'; d5 <= 'Z'; d4 <= 'Z';
      d3 <= 'Z'; d2 <= 'Z'; d1 <= 'Z'; d0 <= 'Z';
    end if;
  end process;
end;
