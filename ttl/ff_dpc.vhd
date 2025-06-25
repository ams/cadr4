-- D Flip-Flop (with preset and clear)
-- No external pins to verify against a datasheet as this is a custom VHDL component.

-- 'pre' and 'clr' are active-low asynchronous inputs. When both are
-- high, the flip-flop operates normally on clock edges.
-- When both pre and clr are active, preset takes precedence.

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
    -- Handle preset/clear signals (preset has precedence over clear)
    if to_x01(pre) = '0' then
      q_int <= '1';  -- Preset to 1 (takes precedence even if clr is also active)
    elsif to_x01(clr) = '0' then
      q_int <= '0';  -- Clear to 0
    elsif to_x01(pre) = 'X' then
      q_int <= 'X';
    elsif to_x01(clr) = 'X' then
      q_int <= 'X';
    -- Handle clock edges
    elsif clk'event then
      if is_x(clk) or is_x(clk'last_value) then
        -- Clock transition involving metavalue - output becomes unknown
        q_int <= 'X';
      elsif clk = '1' and clk'last_value = '0' then
        -- Valid rising edge
        q_int <= d;    -- Normal operation, store data including X/U
      end if;
    end if;
  end process;

end; 