-- 32x2 WWRM (Write-While-Read Memory) RAM
-- Signetics (Philips) N82S21
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
    strobe : in  std_logic := 'H';
    wclk_n : in  std_logic := 'H';
    we0_n  : in  std_logic := 'H';
    we1_n  : in  std_logic := 'H'
    );
end entity;

architecture ttl of n82s21 is
  type ram_t is array (0 to 31) of std_logic_vector(1 downto 0);
  signal ram  : ram_t;
  signal addr : unsigned(4 downto 0);
begin
  addr <= a4 & a3 & a2 & a1 & a0;

  ------------------------------------------------------------------
  -- write on falling edge of wclk_n
  ------------------------------------------------------------------
  process(all)
  begin
    if falling_edge(wclk_n) then
      if to_x01(ce) = '1' and to_x01(strobe) = '1' then
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
  -- asynchronous read
  ------------------------------------------------------------------
  process(all)
    variable word : std_logic_vector(1 downto 0);
  begin
    if to_x01(ce) = '1' then
      if is_x(addr) then
        d0 <= 'X';
        d1 <= 'X';
      else
        word := ram(to_integer(addr));
        -- this is an open-collector output component
        -- it can only drive low or high-z
        -- an external pull-up resistor is required to drive high
        d0 <= '0' when word(0) = '0' else 'Z';
        d1 <= '0' when word(1) = '0' else 'Z';
      end if;
    elsif to_x01(ce) = '0' then
      d0 <= 'Z';
      d1 <= 'Z';
    else
      d0 <= 'X';
      d1 <= 'X';
    end if;
  end process;

end architecture;
