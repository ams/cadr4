library ieee;
use ieee.std_logic_1164.all;

use work.amd.am26s10;

entity am26s10_tb is
end entity;

architecture testbench of am26s10_tb is

  signal e_n : std_logic;
  signal i0, i1, i2, i3 : std_logic;
  signal b0, b1, b2, b3 : std_logic;
  signal z0, z1, z2, z3 : std_logic;

begin

  uut : am26s10 port map(
    e_n => e_n,
    i0  => i0,
    i1  => i1,
    i2  => i2,
    i3  => i3,
    b0  => b0,
    b1  => b1,
    b2  => b2,
    b3  => b3,
    z0  => z0,
    z1  => z1,
    z2  => z2,
    z3  => z3
    );

  process
  begin
    -- Test 1: Enable = 0 (transmit mode)
    -- In transmit mode: b outputs = NOT i inputs, z outputs = i inputs
    e_n <= '0';
    i0 <= '0'; i1 <= '0'; i2 <= '0'; i3 <= '0';
    b0 <= 'Z'; b1 <= 'Z'; b2 <= 'Z'; b3 <= 'Z';  -- High impedance
    wait for 10 ns;
    assert b0 = '1' and b1 = '1' and b2 = '1' and b3 = '1' 
      report "Test 1a failed: transmit mode, all inputs low" severity error;
    assert z0 = '0' and z1 = '0' and z2 = '0' and z3 = '0'
      report "Test 1b failed: transmit mode, z outputs should match inputs" severity error;

    -- Test 2: Enable = 0, different input pattern
    i0 <= '1'; i1 <= '0'; i2 <= '1'; i3 <= '0';
    wait for 10 ns;
    assert b0 = '0' and b1 = '1' and b2 = '0' and b3 = '1'
      report "Test 2a failed: transmit mode, pattern 1010" severity error;
    assert z0 = '1' and z1 = '0' and z2 = '1' and z3 = '0'
      report "Test 2b failed: transmit mode, z outputs should match inputs" severity error;

    -- Test 3: Enable = 0, all inputs high
    i0 <= '1'; i1 <= '1'; i2 <= '1'; i3 <= '1';
    wait for 10 ns;
    assert b0 = '0' and b1 = '0' and b2 = '0' and b3 = '0'
      report "Test 3a failed: transmit mode, all inputs high" severity error;
    assert z0 = '1' and z1 = '1' and z2 = '1' and z3 = '1'
      report "Test 3b failed: transmit mode, z outputs should match inputs" severity error;

    -- Test 4: Enable = 1 (receive mode)
    -- In receive mode: z outputs = NOT b inputs, b pins should be high-Z from device
    e_n <= '1';
    i0 <= '0'; i1 <= '0'; i2 <= '0'; i3 <= '0';  -- Don't matter in receive mode
    b0 <= '0'; b1 <= '0'; b2 <= '0'; b3 <= '0';  -- External driver
    wait for 10 ns;
    assert z0 = '1' and z1 = '1' and z2 = '1' and z3 = '1'
      report "Test 4 failed: receive mode, b inputs low" severity error;

    -- Test 5: Enable = 1, different bus pattern
    b0 <= '1'; b1 <= '0'; b2 <= '1'; b3 <= '0';
    wait for 10 ns;
    assert z0 = '0' and z1 = '1' and z2 = '0' and z3 = '1'
      report "Test 5 failed: receive mode, pattern 1010" severity error;

    -- Test 6: Enable = 1, all bus inputs high
    b0 <= '1'; b1 <= '1'; b2 <= '1'; b3 <= '1';
    wait for 10 ns;
    assert z0 = '0' and z1 = '0' and z2 = '0' and z3 = '0'
      report "Test 6 failed: receive mode, all bus inputs high" severity error;

    report "All tests passed!" severity note;
    wait;
  end process;

end architecture;
