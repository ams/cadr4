-- 256 Bit Bipolar Read Only Memory

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity im5600 is
  generic (fn : string := "");
  port (
    ce_n                           : in  std_logic;
    a0, a1, a2, a3, a4             : in  std_logic;
    o0, o1, o2, o3, o4, o5, o6, o7 : out std_logic
    );
end im5600;

-- ChatGPT Codex implementation
architecture ttl of im5600 is
  type rom_t is array (0 to 31) of std_logic_vector(7 downto 0);

  impure function load_rom return rom_t is
    file f    : text;
    variable l : line;
    variable mem : rom_t := (others => (others => '0'));
    variable d   : std_logic_vector(7 downto 0);
    variable i   : integer := 0;
  begin
    if fn /= "" then
      file_open(f, fn, read_mode);
      while not endfile(f) and i < mem'length loop
        readline(f, l);
        hread(l, d);
        mem(i) := d;
        i := i + 1;
      end loop;
      file_close(f);
    end if;
    return mem;
  end function;

  signal rom  : rom_t := load_rom;
  signal addr : unsigned(4 downto 0) := (others => '0');
begin
  addr <= a4 & a3 & a2 & a1 & a0;

  process(all)
    variable data : std_logic_vector(7 downto 0);
  begin
    if ce_n = '0' then
      data := rom(to_integer(addr));
      o7 <= data(7); o6 <= data(6); o5 <= data(5); o4 <= data(4);
      o3 <= data(3); o2 <= data(2); o1 <= data(1); o0 <= data(0);
    else
      o7 <= 'Z'; o6 <= 'Z'; o5 <= 'Z'; o4 <= 'Z';
      o3 <= 'Z'; o2 <= 'Z'; o1 <= 'Z'; o0 <= 'Z';
    end if;
  end process;
end;
