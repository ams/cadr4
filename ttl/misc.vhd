library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

package misc is

  procedure clkgen(signal clk : out std_logic; constant frequency : real);
  function pullup(s   : std_logic) return std_logic;
  function pulldown(s : std_logic) return std_logic;
  
  -- Generic ROM loading function
  impure function load_rom_file(filename : string; rom_size : natural) return std_logic_vector;

end;

package body misc is

  procedure clkgen(signal clk : out std_logic; constant frequency : real) is
    constant period    : time := 1 sec / frequency;   -- Full period.
    constant high_time : time := period / 2;          -- High time.
    constant low_time  : time := period - high_time;  -- Low time; always >= HIGH_TIME.
  begin
    assert (high_time /= 0 fs)
      report "clkgen: High time is zero; time resolution to large for frequency."
      severity failure;
    loop
      clk <= '1';
      wait for high_time;
      clk <= '0';
      wait for low_time;
    end loop;
  end procedure;

  function pullup(s : std_logic) return std_logic is
    variable pull : std_logic;
  begin
    case (s) is
      when '1' | 'Z' => pull := '1';
      when others    => pull := 'Z';
    end case;
    return pull;
  end;

  function pulldown(s : std_logic) return std_logic is
    variable pull : std_logic;
  begin
    case (s) is
      when '0' | 'Z' => pull := '0';
      when others    => pull := 'Z';
    end case;
    return pull;
  end;

  -- Generic ROM loading function that returns a flat std_logic_vector
  -- The caller can reshape this into their specific array type
  impure function load_rom_file(filename : string; rom_size : natural) return std_logic_vector is
    file f : text;
    variable l : line;
    variable result : std_logic_vector(rom_size * 8 - 1 downto 0) := (others => '0');
    variable d : std_logic_vector(7 downto 0);
    variable i : integer := 0;
  begin
    if filename /= "" then
      file_open(f, filename, read_mode);
      while not endfile(f) and i < rom_size loop
        readline(f, l);
        hread(l, d);
        result(i * 8 + 7 downto i * 8) := d;
        i := i + 1;
      end loop;
      file_close(f);
    end if;
    return result;
  end function;

end;