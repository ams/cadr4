-- (512x8) 4096-Bit TTL PROM
-- Datasheet for DM74472 not found. This VHDL model might be based on a non-standard or custom implementation.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity dm74472 is
  generic (fn : string := "");
  port (
    a0   : in  std_logic;
    a1   : in  std_logic;
    a2   : in  std_logic;
    a3   : in  std_logic;
    a4   : in  std_logic;
    a5   : in  std_logic;
    a6   : in  std_logic;
    a7   : in  std_logic;
    a8   : in  std_logic;
    d0   : out std_logic;
    d1   : out std_logic;
    d2   : out std_logic;
    d3   : out std_logic;
    d4   : out std_logic;
    d5   : out std_logic;
    d6   : out std_logic;
    d7   : out std_logic;
    ce_n : in  std_logic
    );
end;

architecture ttl of dm74472 is
  type rom_t is array (0 to 511) of std_logic_vector(7 downto 0);

  impure function load_rom return rom_t is
    file f       : text;
    variable l   : line;
    variable mem : rom_t   := (others => (others => '0'));
    variable d   : std_logic_vector(7 downto 0);
    variable i   : integer := 0;
  begin
    if fn /= "" then
      file_open(f, fn, read_mode);
      while not endfile(f) and i < mem'length loop
        readline(f, l);
        hread(l, d);
        mem(i) := d;
        i      := i + 1;
      end loop;
      file_close(f);
    end if;
    return mem;
  end function;

  signal rom  : rom_t                := load_rom;
  signal addr : unsigned(8 downto 0) := (others => '0');
  
  -- Function to check if address contains unknown values
  function has_unknown_addr(addr : unsigned) return boolean is
    variable addr_slv : std_logic_vector(addr'length-1 downto 0);
  begin
    addr_slv := std_logic_vector(addr);
    for i in addr_slv'range loop
      if addr_slv(i) /= '0' and addr_slv(i) /= '1' then
        return true;
      end if;
    end loop;
    return false;
  end function;
  
begin
  addr <= a8 & a7 & a6 & a5 & a4 & a3 & a2 & a1 & a0;

  process(all)
    variable data : std_logic_vector(7 downto 0);
  begin
    if ce_n = '0' then
      -- Check for unknown address or control signals
      if has_unknown_addr(addr) or (ce_n /= '0' and ce_n /= '1') then
        -- Unknown address or control produces unknown output
        d7 <= 'X'; d6 <= 'X'; d5 <= 'X'; d4 <= 'X';
        d3 <= 'X'; d2 <= 'X'; d1 <= 'X'; d0 <= 'X';
      else
        data := rom(to_integer(addr));
        d7   <= data(7); d6 <= data(6); d5 <= data(5); d4 <= data(4);
        d3   <= data(3); d2 <= data(2); d1 <= data(1); d0 <= data(0);
      end if;
    else
      d7 <= 'Z'; d6 <= 'Z'; d5 <= 'Z'; d4 <= 'Z';
      d3 <= 'Z'; d2 <= 'Z'; d1 <= 'Z'; d0 <= 'Z';
    end if;
  end process;
end;
