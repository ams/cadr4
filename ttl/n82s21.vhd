-- 32x2 WWRM (Write-While-Read Memory) RAM
-- Signetics N82S21
-- doc/ttl/n82s21.pdf

-- A Write While Read Memory element is a RAM provided with output latches,
-- in such a way that (read out) data may be retained in the latches either 
-- when the chip is disabled or when new information has to be written in 
-- the memory.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity n82s21 is
  port (
    a0     : in  std_logic := 'H';
    a1     : in  std_logic := 'H';
    a2     : in  std_logic := 'H';
    a3     : in  std_logic := 'H';
    a4     : in  std_logic := 'H';
    ce     : in  std_logic := 'H';
    d0     : out std_logic;
    d1     : out std_logic;
    i0     : in  std_logic := 'H';
    i1     : in  std_logic := 'H';
    latch_n: in  std_logic := 'H';
    wclk_n : in  std_logic := 'H';
    we0_n  : in  std_logic := 'H';
    we1_n  : in  std_logic := 'H'
    );
end entity;

architecture ttl of n82s21 is
  type ram_t is array (0 to 31) of std_logic_vector(1 downto 0);
  signal ram : ram_t := (others => (others => '0'));
  signal addr : unsigned(4 downto 0);
  signal output_latches : std_logic_vector(1 downto 0) := (others => '0');
begin
  addr <= a4 & a3 & a2 & a1 & a0;

  ------------------------------------------------------------------
  -- write on falling edge of wclk_n
  ------------------------------------------------------------------
  process(all)
  begin
    if falling_edge(wclk_n) then
      if to_x01(ce) = '1' then
        if is_x(addr) then
          -- do nothing
        else
          if to_x01(we0_n) = '0' then
            ram(to_integer(addr))(0) <= i0;
          end if;
          if to_x01(we1_n) = '0' then
            ram(to_integer(addr))(1) <= i1;
          end if;
        end if;
      end if;
    end if;
  end process;

  ------------------------------------------------------------------
  -- output latch control: latch data on falling edge of latch_n
  ------------------------------------------------------------------
  process(all)
    variable word : std_logic_vector(1 downto 0);
  begin
    if falling_edge(latch_n) then
      if to_x01(ce) = '1' then
        if is_x(addr) then
          output_latches <= (others => 'X');
        else
          output_latches <= ram(to_integer(addr));
        end if;
      end if;
    end if;
  end process;

  ------------------------------------------------------------------
  -- output control: live data when latch_n='1', latched data when latch_n='0'
  ------------------------------------------------------------------
  process(all)
    variable live_word : std_logic_vector(1 downto 0);
    variable output_word : std_logic_vector(1 downto 0);
  begin
    if to_x01(ce) = '1' then
      -- Get live data from memory
      if is_x(addr) then
        live_word := (others => 'X');
      else
        live_word := ram(to_integer(addr));
      end if;
      
      -- Select between live data and latched data
      if to_x01(latch_n) = '1' then
        output_word := live_word;  -- Live data
      elsif to_x01(latch_n) = '0' then
        output_word := output_latches;  -- Latched data
      else
        output_word := (others => 'X');  -- Unknown latch_n state
      end if;
      
      -- Drive open-collector outputs
      -- Can only drive low or high-z, external pull-up required for high
      d0 <= '0' when output_word(0) = '0' else 'Z';
      d1 <= '0' when output_word(1) = '0' else 'Z';
      
    elsif to_x01(ce) = '0' then
      d0 <= 'Z';
      d1 <= 'Z';
    else
      d0 <= 'X';
      d1 <= 'X';
    end if;
  end process;

end architecture;
