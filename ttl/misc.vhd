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
  impure function load_rom_file(filename : string) return std_logic_vector;

  constant gnd : std_logic := '0';
  constant vcc : std_logic := '1';
  constant hi1 : std_logic := '1';
  constant hi2 : std_logic := '1';
  constant hi3 : std_logic := '1';
  constant hi4 : std_logic := '1';
  constant hi5 : std_logic := '1';
  constant hi6 : std_logic := '1';
  constant hi7 : std_logic := '1';
  constant hi8 : std_logic := '1';
  constant hi9 : std_logic := '1';
  constant hi10 : std_logic := '1';
  constant hi11 : std_logic := '1';
  constant hi12 : std_logic := '1';

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

  -- Generic ROM loading function that automatically determines file size
  impure function load_rom_file(filename : string) return std_logic_vector is
    file f : text;
    variable l : line;
    variable d : std_logic_vector(7 downto 0);
    variable i : integer := 0;
    variable temp_data : std_logic_vector(16384 * 8 - 1 downto 0) := (others => '0'); -- 16KB max
  begin
    if filename /= "" then
      file_open(f, filename, read_mode);
      -- First pass: count the number of entries
      while not endfile(f) loop
        readline(f, l);
        if l'length > 0 then  -- Skip empty lines
          hread(l, d);
          temp_data(i * 8 + 7 downto i * 8) := d;
          i := i + 1;
        end if;
      end loop;
      file_close(f);
    end if;
    -- Return only the used portion
    return temp_data(i * 8 - 1 downto 0);
  end function;

end;
