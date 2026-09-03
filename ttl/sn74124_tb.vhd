library ieee;
use ieee.std_logic_1164.all;

use work.sn74.sn74124;

entity sn74124_tb is
end entity;

architecture testbench of sn74124_tb is

  signal en_n : std_logic := '1';
  signal y    : std_logic;

begin

  uut : sn74124 port map (
    en_n => en_n,
    y    => y
    );

  process
  begin
    -- Test 1: disabled, output high and steady
    wait for 10 ns;
    assert y = '1'
      report "Test 1a failed: output should be high while disabled" severity error;
    wait for 200 ns;
    assert y = '1'
      report "Test 1b failed: output should stay high while disabled" severity error;

    -- Test 2: enabled, 10 MHz oscillation starting low
    en_n <= '0';
    wait for 1 ns;
    assert y = '0'
      report "Test 2a failed: output should start low when enabled" severity error;
    wait for 48 ns;
    assert y = '0'
      report "Test 2b failed: output changed before the half period" severity error;
    wait for 2 ns;
    assert y = '1'
      report "Test 2c failed: output should be high after 50 ns" severity error;
    wait for 50 ns;
    assert y = '0'
      report "Test 2d failed: output should be low after 100 ns" severity error;
    wait for 50 ns;
    assert y = '1'
      report "Test 2e failed: output should be high after 150 ns" severity error;

    -- Test 3: disable in the middle of a half period, output goes high at once
    wait for 60 ns;
    assert y = '0'
      report "Test 3a failed: output should be low before the disable" severity error;
    en_n <= '1';
    wait for 1 ns;
    assert y = '1'
      report "Test 3b failed: output should go high as soon as disabled" severity error;
    wait for 200 ns;
    assert y = '1'
      report "Test 3c failed: output should stay high while disabled" severity error;

    -- Test 4: 'Z' on the enable input reads as high (disabled)
    en_n <= 'Z';
    wait for 200 ns;
    assert y = '1'
      report "Test 4 failed: 'Z' on enable should keep the oscillator disabled" severity error;

    wait;
  end process;

end architecture;
