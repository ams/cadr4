-- D Flip-Flop (with preset and clear)
-- No external pins to verify against a datasheet as this is a custom VHDL component.

-- 'pre' and 'clr' are active-low asynchronous inputs. When both are
-- high, the flip-flop operates normally on clock edges.
-- When both pre and clr are active, preset takes precedence.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

entity ff_dpc is
  port (
    clk      : in  std_logic;
    pre, clr : in  std_logic;
    d        : in  std_logic;
    q, q_n   : out std_logic
    );
end;

architecture ttl of ff_dpc is
  signal q_int : std_logic := 'U';  -- Start uninitialized to model real hardware
begin

  q   <= q_int;
  -- Proper complement handling for unknown states
  q_n <= '0' when q_int = '1' else
         '1' when q_int = '0' else
         'X';  -- Unknown complement for X, U, Z, W states

  process (clk, pre, clr)
  begin
    -- Handle preset/clear signals (preset has precedence over clear)
    if pre = '0' then
      q_int <= '1';  -- Preset to 1 (takes precedence even if clr is also active)
    elsif clr = '0' then
      q_int <= '0';  -- Clear to 0
    elsif (pre /= '1' or clr /= '1') then
      q_int <= 'X';  -- Unknown control signals
    elsif rising_edge(clk) then
      q_int <= d;    -- Normal operation, store data including X/U
    elsif clk'event and is_x(clk) then
      q_int <= 'X';  -- Clock went to unknown state
    end if;
  end process;

end; 