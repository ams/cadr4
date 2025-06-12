-- D Flip-Flop (with preset and clear)
-- No external pins to verify against a datasheet as this is a custom VHDL component.

-- 'pre' and 'clr' are active-low asynchronous inputs. When both are
-- high, the flip-flop operates normally on clock edges.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ff_dpc is
  port (
    clk      : in  std_logic;
    pre, clr : in  std_logic;
    d        : in  std_logic;
    q, q_n   : out std_logic
    );
end;

architecture ttl of ff_dpc is
  signal q_int : std_logic := '0';
begin

  q <= q_int;
  q_n <= not q_int;

  process (clk, pre, clr)
  begin
    if pre = '0' then
      q_int <= '1';
    elsif clr = '0' then
      q_int <= '0';
    elsif rising_edge(clk) then
      q_int <= d;
    end if;
  end process;

end; 