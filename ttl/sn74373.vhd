-- SN74373: Octal D-Type Transparent Latches
-- Datasheet: Texas Instruments SN74LS373 Octal D-Type Transparent Latches, PDIP (N) Package
-- URL: https://www.ti.com/lit/ds/symlink/sn54s373.pdf
-- Note: The 'hold_n' (Latch Enable) signal follows the standard datasheet behavior:
-- hold_n = '1' (LE high): Transparent mode - inputs pass through to outputs
-- hold_n = '0' (LE low): Latch mode - data is held/latched
-- This matches the standard SN74373 datasheet specification.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74373 is
  port (
    hold_n : in  std_logic; -- Pin 11 (LE) - Latch Enable
    oenb_n : in  std_logic; -- Pin 1 (OE_n)
    i0     : in  std_logic; -- Pin 3 (1D)
    i1     : in  std_logic; -- Pin 4 (2D)
    i2     : in  std_logic; -- Pin 7 (3D)
    i3     : in  std_logic; -- Pin 8 (4D)
    i4     : in  std_logic; -- Pin 13 (5D)
    i5     : in  std_logic; -- Pin 14 (6D)
    i6     : in  std_logic; -- Pin 17 (7D)
    i7     : in  std_logic; -- Pin 18 (8D)
    o0     : out std_logic; -- Pin 2 (1Q)
    o1     : out std_logic; -- Pin 5 (2Q)
    o2     : out std_logic; -- Pin 6 (3Q)
    o3     : out std_logic; -- Pin 10 (4Q)
    o4     : out std_logic; -- Pin 12 (5Q)
    o5     : out std_logic; -- Pin 15 (6Q)
    o6     : out std_logic; -- Pin 16 (7Q)
    o7     : out std_logic  -- Pin 19 (8Q)
    );
end;

architecture ttl of sn74373 is
  signal data : std_logic_vector(7 downto 0) := (others => 'U');
begin

  -- Latch process with proper X/U handling
  process(hold_n, i0, i1, i2, i3, i4, i5, i6, i7)
    variable input_data : std_logic_vector(7 downto 0);
  begin
    input_data := i7 & i6 & i5 & i4 & i3 & i2 & i1 & i0;
    
    if hold_n = '1' then
      -- Transparent mode: pass input data (including X/U)
      data <= input_data;
    elsif hold_n = '0' then
      -- Hold mode: maintain current data
      null;  -- data unchanged
    else
      -- Unknown hold signal: outputs become unknown
      data <= (others => 'X');
    end if;
  end process;

  -- Tri-state output process with proper X/U handling
  process(oenb_n, data)
  begin
    if oenb_n = '0' then
      -- Enabled: pass latched data
      o0 <= data(0); o1 <= data(1); o2 <= data(2); o3 <= data(3);
      o4 <= data(4); o5 <= data(5); o6 <= data(6); o7 <= data(7);
    elsif oenb_n = '1' then
      -- Disabled: high impedance
      o0 <= 'Z'; o1 <= 'Z'; o2 <= 'Z'; o3 <= 'Z';
      o4 <= 'Z'; o5 <= 'Z'; o6 <= 'Z'; o7 <= 'Z';
    else
      -- Unknown enable signal: outputs unknown
      o0 <= 'X'; o1 <= 'X'; o2 <= 'X'; o3 <= 'X';
      o4 <= 'X'; o5 <= 'X'; o6 <= 'X'; o7 <= 'X';
    end if;
  end process;

end;
