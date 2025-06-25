-- D Flip-Flop (with preset and clear)
-- No external pins to verify against a datasheet as this is a custom VHDL component.

-- 'pre' and 'clr' are active-low asynchronous inputs. When both are
-- high, the flip-flop operates normally on clock edges.
-- When both pre and clr are active, this produces undefined behavior.

library ieee;
use ieee.std_logic_1164.all;

entity ff_dpc is
  port (
    clk      : in  std_logic;
    pre, clr : in  std_logic;
    d        : in  std_logic;
    q, q_n   : out std_logic
    );
end;

architecture ttl of ff_dpc is
  signal q_int : std_logic;
begin
  q <= q_int;
  -- Proper complement handling for unknown states
  q_n <= '0' when q_int = '1' else
         '1' when q_int = '0' else
         'X';  -- Unknown complement for X, U, Z, W states

  process (clk, pre, clr)
  begin
    -- Asynchronous preset and clear (active low)
    -- Conflicting preset and clear signals produce undefined behavior (X)
    if to_x01(pre) = '0' and to_x01(clr) = '0' then
      q_int <= 'X';  -- Undefined behavior when both are active
    elsif to_x01(pre) = '0' then
      q_int <= '1';
    elsif to_x01(clr) = '0' then
      q_int <= '0';
    elsif to_x01(pre) = 'X' or to_x01(clr) = 'X' then
      q_int <= 'X';
    elsif rising_edge(clk) then
      q_int <= d;
    end if;
  end process;
end; 