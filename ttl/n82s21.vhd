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
    latch_n: in  std_logic;
    wclk_n : in  std_logic;
    we0_n  : in  std_logic;
    we1_n  : in  std_logic
    );
end entity;

architecture ttl of n82s21 is
  signal a0_i, a1_i, a2_i, a3_i, a4_i, ce_i, i0_i, i1_i, latch_n_i, wclk_n_i, we0_n_i, we1_n_i : std_logic;
  type ram_t is array (0 to 31) of std_logic_vector(1 downto 0);
  signal ram : ram_t := (others => (others => '0'));
  signal addr : unsigned(4 downto 0);
  signal output_latches : std_logic_vector(1 downto 0) := (others => '0');
begin

  a0_i <= 'H';
  a1_i <= 'H';
  a2_i <= 'H';
  a3_i <= 'H';
  a4_i <= 'H';
  ce_i <= 'H';
  i0_i <= 'H';
  i1_i <= 'H';
  latch_n_i <= 'H';
  wclk_n_i <= 'H';
  we0_n_i <= 'H';
  we1_n_i <= 'H';

  a0_i <= a0;
  a1_i <= a1;
  a2_i <= a2;
  a3_i <= a3;
  a4_i <= a4;
  ce_i <= ce;
  i0_i <= i0;
  i1_i <= i1;
  latch_n_i <= latch_n;
  wclk_n_i <= wclk_n;
  we0_n_i <= we0_n;
  we1_n_i <= we1_n;

  addr <= a4_i & a3_i & a2_i & a1_i & a0_i;

  ------------------------------------------------------------------
  -- write on falling edge of wclk_n
  ------------------------------------------------------------------
  process(all)
  begin
    if falling_edge(wclk_n_i) then
      if to_x01(ce_i) = '1' then
        if is_x(addr) then
          -- do nothing
        else
          if to_x01(we0_n_i) = '0' then
            ram(to_integer(addr))(0) <= i0_i;
          end if;
          if to_x01(we1_n_i) = '0' then
            ram(to_integer(addr))(1) <= i1_i;
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
    if falling_edge(latch_n_i) then
      if to_x01(ce_i) = '1' then
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
    if to_x01(ce_i) = '1' then
      -- Get live data from memory
      if is_x(addr) then
        live_word := (others => 'X');
      else
        live_word := ram(to_integer(addr));
      end if;
      
      -- Select between live data and latched data
      if to_x01(latch_n_i) = '1' then
        output_word := live_word;  -- Live data
      elsif to_x01(latch_n_i) = '0' then
        output_word := output_latches;  -- Latched data
      else
        output_word := (others => 'X');  -- Unknown latch_n state
      end if;
      
      -- Drive open-collector outputs
      -- Can only drive low or high-z, external pull-up required for high
      d0 <= '0' when output_word(0) = '0' else 'Z';
      d1 <= '0' when output_word(1) = '0' else 'Z';
      
    elsif to_x01(ce_i) = '0' then
      d0 <= 'Z';
      d1 <= 'Z';
    else
      d0 <= 'X';
      d1 <= 'X';
    end if;
  end process;

end architecture;
