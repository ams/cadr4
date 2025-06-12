-- 256 Bit Bipolar Read Only Memory
-- IM5600 256x8 Bipolar PROM

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity im5600 is
  generic (fn : string := "");
  port (
    ce_n : in  std_logic;
    a0   : in  std_logic;
    a1   : in  std_logic;
    a2   : in  std_logic;
    a3   : in  std_logic;
    a4   : in  std_logic;
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
  type rom_t is array (0 to 31) of std_logic_vector(7 downto 0);

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
  signal addr : unsigned(4 downto 0) := (others => '0');
  
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
  addr <= a4 & a3 & a2 & a1 & a0;

  process(all)
    variable data : std_logic_vector(7 downto 0);
  begin
    if ce_n = '0' then
      -- Check for unknown address or control signals
      if has_unknown_addr(addr) or (ce_n /= '0' and ce_n /= '1') then
        -- Unknown address or control produces unknown output
        o7 <= 'X'; o6 <= 'X'; o5 <= 'X'; o4 <= 'X';
        o3 <= 'X'; o2 <= 'X'; o1 <= 'X'; o0 <= 'X';
      else
        data := rom(to_integer(addr));
        o7   <= data(7); o6 <= data(6); o5 <= data(5); o4 <= data(4);
        o3   <= data(3); o2 <= data(2); o1 <= data(1); o0 <= data(0);
      end if;
    else
      o7 <= 'Z'; o6 <= 'Z'; o5 <= 'Z'; o4 <= 'Z';
      o3 <= 'Z'; o2 <= 'Z'; o1 <= 'Z'; o0 <= 'Z';
    end if;
  end process;
end;
