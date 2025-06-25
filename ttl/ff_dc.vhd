-- D Flip-Flop (with clear)

library ieee;
use ieee.std_logic_1164.all;

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

  process (clk, clr)
  begin
    -- Asynchronous clear (active low)
    if to_x01(clr) = '0' then
      q_int <= '0';
    elsif to_x01(clr) = 'X' then
      q_int <= 'X';
    elsif rising_edge(clk) then
      q_int <= d;
    end if;
  end process;
end;
