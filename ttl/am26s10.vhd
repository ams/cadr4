-- Quad Open-Collector Bus Transceiver (inverting)
-- AMD Am26S10
-- doc/ttl/am26s10.pdf
--
-- Driver: B = NOT I while enabled (E low), released while disabled.
-- Receiver: Z = NOT B, always active and fed from the bus pin (not from the
-- driver input). The bus is read through ttl_input so a released bus reads
-- as high.
-- Note: the real driver is open collector; the model drives the released
-- level as '1' (standing in for the bus termination) instead of 'Z'.

library ieee;
use ieee.std_logic_1164.all;

use work.misc.all;

entity am26s10 is
  port (
    e_n : in  std_logic; -- 12 Active-low enable
    i0  : in  std_logic; -- 4 Input 0
    i1  : in  std_logic; -- 5 Input 1
    i2  : in  std_logic; -- 11 Input 2
    i3  : in  std_logic; -- 13 Input 3
    b0  : inout std_logic; -- 2 Inverting bidirectional bus 0
    b1  : inout std_logic; -- 7 Inverting bidirectional bus 1
    b2  : inout std_logic; -- 9 Inverting bidirectional bus 2
    b3  : inout std_logic; -- 15 Inverting bidirectional bus 3
    z0  : out std_logic; -- 3 Receiver output 0 (inverted bus)
    z1  : out std_logic; -- 6 Receiver output 1 (inverted bus)
    z2  : out std_logic; -- 10 Receiver output 2 (inverted bus)
    z3  : out std_logic  -- 14 Receiver output 3 (inverted bus)
    );
end entity;

architecture behavioral of am26s10 is
  signal e_n_i, i0_i, i1_i, i2_i, i3_i : std_logic;
begin

  -- TTL input handling
  e_n_i <= ttl_input(e_n);
  i0_i <= ttl_input(i0);
  i1_i <= ttl_input(i1);
  i2_i <= ttl_input(i2);
  i3_i <= ttl_input(i3);

  -- Bus drivers
  process (all)
  begin
    if e_n_i = '0' then
      -- Enabled: inverting bus drivers
      b0 <= not i0_i;
      b1 <= not i1_i;
      b2 <= not i2_i;
      b3 <= not i3_i;
    elsif e_n_i = '1' then
      -- Disabled: drivers released
      b0 <= 'Z';
      b1 <= 'Z';
      b2 <= 'Z';
      b3 <= 'Z';
    else
      -- Unknown state
      b0 <= 'X';
      b1 <= 'X';
      b2 <= 'X';
      b3 <= 'X';
    end if;
  end process;

  -- Receivers: always the inverted bus
  z0 <= not ttl_input(b0);
  z1 <= not ttl_input(b1);
  z2 <= not ttl_input(b2);
  z3 <= not ttl_input(b3);

end architecture;
