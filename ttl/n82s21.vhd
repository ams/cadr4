-- High Speed Write-While-Read 64-Bit Bipolar RAM (32x2 RAM)
-- Datasheet for DM8221 not found. This VHDL model might be based on a non-standard or custom implementation.

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
      if ce = '1' and strobe = '1' then
        if is_x(addr) then
          -- do nothing
        else
          if we0_n = '0' then
            ram(to_integer(addr))(0) <= i0;
          end if;
          if we1_n = '0' then
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
    if ce = '1' then
      if is_x(addr) then
        d0 <= 'X';
        d1 <= 'X';
      else
        word := ram(to_integer(addr));
        d0 <= word(0);
        d1 <= word(1);
      end if;
    else
      d0 <= 'Z';
      d1 <= 'Z';
    end if;
  end process;

end architecture;
