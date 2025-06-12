-- High Speed Write-While-Read 64-Bit Bipolar RAM (32x2 RAM)
-- Datasheet for DM8221 not found. This VHDL model might be based on a non-standard or custom implementation.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dm8221 is
  port (
    a0     : in  std_logic;
    a1     : in  std_logic;
    a2     : in  std_logic;
    a3     : in  std_logic;
    a4     : in  std_logic;
    ce     : in  std_logic;
    d0     : out std_logic;
    d1     : out std_logic;
    i0     : in  std_logic;
    i1     : in  std_logic;
    strobe : in  std_logic;
    wclk_n : in  std_logic;
    we0_n  : in  std_logic;
    we1_n  : in  std_logic
    );
end dm8221;

architecture ttl of dm8221 is
  type ram_t is array (0 to 31) of std_logic_vector(1 downto 0);
  signal ram  : ram_t := (others => (others => '0'));
  signal addr : unsigned(4 downto 0);
  
  -- Function to check if address contains unknown values
  function has_unknown_addr(address : unsigned) return boolean is
    variable addr_slv : std_logic_vector(address'length-1 downto 0);
  begin
    addr_slv := std_logic_vector(address);
    for i in addr_slv'range loop
      if addr_slv(i) /= '0' and addr_slv(i) /= '1' then
        return true;
      end if;
    end loop;
    return false;
  end function;
  
begin
  addr <= a4 & a3 & a2 & a1 & a0;

  ------------------------------------------------------------------
  -- write on falling edge of wclk_n
  ------------------------------------------------------------------
  process(all)
  begin
    if falling_edge(wclk_n) then
      if ce = '1' and strobe = '1' then
        -- Check for unknown address before writing
        if not has_unknown_addr(addr) then
          if we0_n = '0' then
            ram(to_integer(addr))(0) <= i0;
          end if;
          if we1_n = '0' then
            ram(to_integer(addr))(1) <= i1;
          end if;
        end if;
        -- If address is unknown, do nothing (cannot write to unknown location)
      end if;
    end if;
  end process;

  ------------------------------------------------------------------
  -- asynchronous read
  ------------------------------------------------------------------
  process(all)
    variable word : std_logic_vector(1 downto 0);
  begin
    if ce = '1' then
      -- Check for unknown address or control signals
      if has_unknown_addr(addr) or (ce /= '0' and ce /= '1') then
        d0 <= 'X'; d1 <= 'X';  -- Unknown address or control produces unknown output
      else
        word := ram(to_integer(addr));
        d0   <= word(0); d1 <= word(1);
      end if;
    else
      d0 <= 'Z'; d1 <= 'Z';
    end if;
  end process;
end;
