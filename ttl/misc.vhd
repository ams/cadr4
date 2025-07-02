library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

package misc is

  constant gnd : std_logic := '0';

  procedure clkgen(signal clk : out std_logic; constant frequency : real);
  function pullup(s   : std_logic) return std_logic;
  function pulldown(s : std_logic) return std_logic;
  function ttl_input(i : std_logic) return std_logic;
  function string_cast(s: string; width: integer) return string;
  
  -- Generic hex file loading function for ROM and RAM
  -- File format: two hex digits per line (1 byte per line: 00-FF)
  -- size: number of memory words, width: bits per word
  -- filename: file to load, or special values:
  --   ":hex_value" = initialize all words to hex_value (1-2 hex digits, e.g., ":A", ":FF")
  --   otherwise = load from file (initialize unloaded words to 'U')
  -- Returns word array for consistent memory access
  type word_array_t is array (natural range <>) of std_logic_vector;
  impure function load_hex_file(filename : string; size : integer; width : integer) return word_array_t;

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

    -- Function to implement TTL input behavior
  function ttl_input(i : std_logic) return std_logic is
  begin
    case i is
      when 'Z' => return '1';  -- High impedance gets weak pull-up, return strong '1'
      when 'H' => return '1';  -- Weak high becomes strong '1'
      when 'L' => return '0';  -- Weak low becomes strong '0'
      when others => return i; -- Pass through
    end case;
  end function;

  function string_cast(s: string; width: integer) return string is
  begin
    return s & (1 to width - s'LENGTH => ' '); -- pad spaces
  end function;

            -- Generic hex file loading function that returns word array
  impure function load_hex_file(filename : string; size : integer; width : integer) return word_array_t is
    file f : text;
    variable l : line;
    variable byte_val : std_logic_vector(7 downto 0);
    variable temp_data : std_logic_vector(16384 * 8 - 1 downto 0) := (others => 'U'); -- 16KB max
    variable byte_count : integer := 0;
    variable result : word_array_t(0 to size - 1)(width - 1 downto 0);
    variable default_val : std_logic_vector(7 downto 0);
    variable temp_line : line;
  begin
    if filename'length > 0 and filename(filename'left) = ':' then
      -- Initialize all words with hex value after ':'
      if filename'length = 2 then
        -- Single hex digit - pad with leading zero
        write(temp_line, "0" & filename(filename'left + 1 to filename'right));
      else
        -- Two hex digits or more
        write(temp_line, filename(filename'left + 1 to filename'right));
      end if;
      hread(temp_line, default_val);
      
      -- Initialize all words with default value (truncated to width)
      for i in 0 to size - 1 loop
        result(i) := default_val(width - 1 downto 0);
      end loop;
    else
      -- Load from file - initialize with 'U' first
      result := (others => (others => 'U'));
      
      file_open(f, filename, read_mode);
      
      -- First pass: read all bytes from file
      while not endfile(f) loop
        readline(f, l);
        if l'length > 0 then  -- Skip empty lines
          hread(l, byte_val);  -- Read two hex digits (1 byte)
          temp_data(byte_count * 8 + 7 downto byte_count * 8) := byte_val;
          byte_count := byte_count + 1;
        end if;
      end loop;
      file_close(f);
      
      -- Convert flat data to word array based on width
      case width is
        when 1 =>
          -- 1-bit wide: each byte provides 8 memory words, each word is std_logic_vector(0 downto 0)
          for i in 0 to size - 1 loop
            if i / 8 < byte_count then
              result(i)(0 downto 0) := temp_data(i downto i);
            end if;
          end loop;
          
        when 2 =>
          -- 2-bit wide: each byte provides 4 memory words
          for i in 0 to size - 1 loop
            if i / 4 < byte_count then
              result(i) := temp_data((i / 4) * 8 + (i mod 4) * 2 + 1 downto (i / 4) * 8 + (i mod 4) * 2);
            end if;
          end loop;
          
        when 4 =>
          -- 4-bit wide: each byte provides 2 memory words
          for i in 0 to size - 1 loop
            if i / 2 < byte_count then
              if i mod 2 = 0 then
                result(i) := temp_data((i / 2) * 8 + 3 downto (i / 2) * 8);
              else
                result(i) := temp_data((i / 2) * 8 + 7 downto (i / 2) * 8 + 4);
              end if;
            end if;
          end loop;
          
        when 8 =>
          -- 8-bit wide: each byte is one memory word
          for i in 0 to size - 1 loop
            if i < byte_count then
              result(i) := temp_data(i * 8 + 7 downto i * 8);
            end if;
          end loop;
          
        when others =>
          -- Default: treat as 8-bit wide
          for i in 0 to size - 1 loop
            if i < byte_count then
              result(i) := temp_data(i * 8 + 7 downto i * 8);
            end if;
          end loop;
      end case;
    end if;
    
    return result;
  end function;

end;
