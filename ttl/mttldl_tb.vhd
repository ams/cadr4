library ieee;
use ieee.std_logic_1164.all;

use work.ecc.mttldl;

entity mttldl_tb is
end entity;

architecture testbench of mttldl_tb is

  signal i0, i1, i2 : std_logic := '0';
  signal o0, o1, o2 : std_logic;

begin

  uut : mttldl
    generic map (delay => 100 ns)
    port map (
      i0 => i0,
      i1 => i1,
      i2 => i2,
      o0 => o0,
      o1 => o1,
      o2 => o2
      );

  process
  begin
    wait for 150 ns;
    assert o0 = '0' and o1 = '0' and o2 = '0'
      report "Test 0 failed: outputs should follow the low inputs" severity error;

    -- Test 1: a rising edge appears at the output after the delay
    i0 <= '1';
    wait for 99 ns;
    assert o0 = '0'
      report "Test 1a failed: output changed before the delay" severity error;
    wait for 2 ns;
    assert o0 = '1'
      report "Test 1b failed: output should be high 100 ns after the input" severity error;

    -- Test 2: falling edge on channel 0, rising edge on channel 1
    i0 <= '0';
    i1 <= '1';
    wait for 99 ns;
    assert o0 = '1' and o1 = '0'
      report "Test 2a failed: outputs changed before the delay" severity error;
    wait for 2 ns;
    assert o0 = '0' and o1 = '1'
      report "Test 2b failed: outputs should have changed after 100 ns" severity error;

    -- Test 3: a pulse shorter than the delay is reproduced (transport delay)
    i2 <= '1';
    wait for 10 ns;
    i2 <= '0';
    wait for 89 ns;
    assert o2 = '0'
      report "Test 3a failed: pulse appeared too early" severity error;
    wait for 2 ns;
    assert o2 = '1'
      report "Test 3b failed: pulse should start 100 ns after the input" severity error;
    wait for 10 ns;
    assert o2 = '0'
      report "Test 3c failed: pulse should end 100 ns after the input" severity error;

    -- Test 4: TTL inputs, 'Z' reads as high and 'L' as low
    i0 <= 'Z';
    wait for 101 ns;
    assert o0 = '1'
      report "Test 4a failed: 'Z' input should read as high" severity error;
    i0 <= 'L';
    wait for 101 ns;
    assert o0 = '0'
      report "Test 4b failed: 'L' input should read as low" severity error;

    wait;
  end process;

end architecture;
