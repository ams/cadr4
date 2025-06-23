-- D Flip-Flop (with clear)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

entity ff_dc is
  port (
    clk    : in  std_logic;
    clr    : in  std_logic;
    d      : in  std_logic;
    q, q_n : out std_logic
    );
end;

architecture ttl of ff_dc is
  signal q_int : std_logic;
begin
  q <= q_int;
  -- Proper complement handling for unknown states
  q_n <= '0' when q_int = '1' else
         '1' when q_int = '0' else
         'X';  -- Unknown complement for X, U, Z, W states

  process(clk, clr)
  begin
    if clr = '0' then
      q_int <= '0';
    elsif rising_edge(clk) then
      q_int <= d;
    end if;
  end process;
end;
