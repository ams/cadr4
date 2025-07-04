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
  -- if filename is "", returns U, this is usually the default in generic map
  -- if filename is ":X" or ":XX", returns X or XX to initialize for example with 0 or 1
  -- if filename is a file, returns the file contents
  impure function load_hex_file(filename : string; size : integer; width : integer) return word_array_t is
    file f : text;
    variable l : line;
    variable byte_val : std_logic_vector(7 downto 0);
    variable result : word_array_t(0 to size - 1)(width - 1 downto 0);
    variable default_val : std_logic_vector(7 downto 0);
    variable temp_line : line;
    variable word_index : integer := 0;
  begin
    -- Check width parameter is valid
    assert width >= 1 and width <= 8 
      report "load_hex_file: width must be between 1 and 8, got " & integer'image(width) 
      severity failure;
    
    -- Check if filename is empty and initialize to 'U' if so
    if filename'length = 0 then
      result := (others => (others => 'U'));
      return result;
    end if;
    
    if filename'length > 0 and filename(filename'left) = ':' then
      -- Initialize all words with hex value after ':'
      if filename'length = 2 then
        -- Single hex digit - pad with leading zero
        write(temp_line, "0" & filename(filename'left + 1 to filename'right));
      elsif filename'length = 3 then
        -- Two hex digits
        write(temp_line, filename(filename'left + 1 to filename'right));
      else
        -- Invalid format - too many or no hex digits after ':'
        assert false report "load_hex_file: Invalid hex format '" & filename & "'. Expected :X or :XX where X is hex digit." severity failure;
        result := (others => (others => 'U'));
        return result;
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
      
      -- Read bytes from file and assign directly to result
      while not endfile(f) and word_index < size loop
        readline(f, l);
        -- Assert that line is not empty
        assert l'length > 0 
          report "load_hex_file: Empty line found in hex file '" & filename & "' at word " & integer'image(word_index) 
          severity failure;
        hread(l, byte_val);  -- Read two hex digits (1 byte)
        result(word_index) := byte_val(width - 1 downto 0);
        word_index := word_index + 1;
      end loop;
      file_close(f);
    end if;
    
    return result;
  end function;

end;
