-- SN74373: Octal D-Type Transparent Latches
-- Datasheet: Texas Instruments SN74LS373 Octal D-Type Transparent Latches, PDIP (N) Package
-- URL: https://www.ti.com/lit/ds/symlink/sn54s373.pdf
-- Note: The 'hold_n' (Latch Enable) signal in this VHDL model is implemented as active low,
-- while the standard SN74LS373 datasheet typically shows LE as active high.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74373 is
  port (
    hold_n : in  std_logic; -- Pin 11 (LE)
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
  signal data      : std_logic_vector(7 downto 0);
  signal next_data : std_logic_vector(7 downto 0);
begin
  -- transparent latch when hold_n = 1, hold when hold_n = 0
  next_data <= i7 & i6 & i5 & i4 & i3 & i2 & i1 & i0;

  process(hold_n, next_data)
  begin
    if hold_n = '1' then
      data <= next_data;
    end if;
  end process;

  process(oenb_n, data)
  begin
    if oenb_n = '1' then
      o7 <= 'Z'; o6 <= 'Z'; o5 <= 'Z'; o4 <= 'Z';
      o3 <= 'Z'; o2 <= 'Z'; o1 <= 'Z'; o0 <= 'Z';
    else
      o7 <= data(7); o6 <= data(6); o5 <= data(5); o4 <= data(4);
      o3 <= data(3); o2 <= data(2); o1 <= data(1); o0 <= data(0);
    end if;
  end process;
end;
