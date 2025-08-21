library ieee;
use ieee.std_logic_1164.all;

use work.other.all;

entity sip330_470_8_tb is
end entity;

architecture testbench of sip330_470_8_tb is

  signal r7 : std_logic;
  signal r6 : std_logic;
  signal r5 : std_logic;
  signal r4 : std_logic;
  signal r3 : std_logic;
  signal r2 : std_logic;

begin

  uut : sip330_470_8 port map(
    r2 => r2,
    r3 => r3,
    r4 => r4,
    r5 => r5,
    r6 => r6,
    r7 => r7
    );

  process
  begin
    -- Wait for initial propagation
    wait for 5 ns;

    -- Test that all outputs are '1'
    assert r2 = 'H' report "r2 should be 'H'" severity error;
    assert r3 = 'H' report "r3 should be 'H'" severity error;
    assert r4 = 'H' report "r4 should be 'H'" severity error;
    assert r5 = 'H' report "r5 should be 'H'" severity error;
    assert r6 = 'H' report "r6 should be 'H'" severity error;
    assert r7 = 'H' report "r7 should be 'H'" severity error;

    wait;
  end process;

end architecture;
