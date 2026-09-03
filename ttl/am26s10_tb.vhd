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
  -- external device on the bus, 'Z' when it is not driving
  signal ext0, ext1, ext2, ext3 : std_logic := 'Z';

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

  -- External device on the bus (the only other driver of the bus lines)
  b0 <= ext0;
  b1 <= ext1;
  b2 <= ext2;
  b3 <= ext3;

  process
  begin
    -- Test 1: Enable = 0 (transmit mode), nobody else on the bus.
    -- B = NOT I; the receiver output is always the inverted bus, Z = NOT B.
    e_n <= '0';
    i0 <= '0'; i1 <= '0'; i2 <= '0'; i3 <= '0';
    wait for 10 ns;
    assert b0 = '1' and b1 = '1' and b2 = '1' and b3 = '1'
      report "Test 1a failed: transmit mode, all inputs low" severity error;
    assert z0 = '0' and z1 = '0' and z2 = '0' and z3 = '0'
      report "Test 1b failed: transmit mode, Z should be the inverted bus" severity error;

    -- Test 2: Enable = 0, different input pattern
    i0 <= '1'; i1 <= '0'; i2 <= '1'; i3 <= '0';
    wait for 10 ns;
    assert b0 = '0' and b1 = '1' and b2 = '0' and b3 = '1'
      report "Test 2a failed: transmit mode, pattern 1010" severity error;
    assert z0 = '1' and z1 = '0' and z2 = '1' and z3 = '0'
      report "Test 2b failed: transmit mode, Z should be the inverted bus" severity error;

    -- Test 3: Enable = 0, all inputs high
    i0 <= '1'; i1 <= '1'; i2 <= '1'; i3 <= '1';
    wait for 10 ns;
    assert b0 = '0' and b1 = '0' and b2 = '0' and b3 = '0'
      report "Test 3a failed: transmit mode, all inputs high" severity error;
    assert z0 = '1' and z1 = '1' and z2 = '1' and z3 = '1'
      report "Test 3b failed: transmit mode, Z should be the inverted bus" severity error;

    -- Test 4: Enable = 1 (receive mode), external device drives the bus low
    -- The bus pins are released by the device (open collector off).
    e_n <= '1';
    i0 <= '0'; i1 <= '0'; i2 <= '0'; i3 <= '0';  -- Don't matter in receive mode
    ext0 <= '0'; ext1 <= '0'; ext2 <= '0'; ext3 <= '0';
    wait for 10 ns;
    assert b0 = '0' and b1 = '0' and b2 = '0' and b3 = '0'
      report "Test 4a failed: receive mode, bus should be driven by the external device" severity error;
    assert z0 = '1' and z1 = '1' and z2 = '1' and z3 = '1'
      report "Test 4b failed: receive mode, bus low -> Z high" severity error;

    -- Test 5: Enable = 1, different bus pattern
    ext0 <= '1'; ext1 <= '0'; ext2 <= '1'; ext3 <= '0';
    wait for 10 ns;
    assert z0 = '0' and z1 = '1' and z2 = '0' and z3 = '1'
      report "Test 5 failed: receive mode, pattern 1010" severity error;

    -- Test 6: Enable = 1, all bus inputs high
    ext0 <= '1'; ext1 <= '1'; ext2 <= '1'; ext3 <= '1';
    wait for 10 ns;
    assert z0 = '0' and z1 = '0' and z2 = '0' and z3 = '0'
      report "Test 6 failed: receive mode, all bus inputs high" severity error;

    -- Test 7: Enable = 1, bus released by everybody: the bus pins float and
    -- the receivers read the undriven bus as high, Z = 0. The inputs are
    -- high to show that Z does not follow I.
    i0 <= '1'; i1 <= '1'; i2 <= '1'; i3 <= '1';
    ext0 <= 'Z'; ext1 <= 'Z'; ext2 <= 'Z'; ext3 <= 'Z';
    wait for 10 ns;
    assert b0 = 'Z' and b1 = 'Z' and b2 = 'Z' and b3 = 'Z'
      report "Test 7a failed: receive mode, bus pins should float" severity error;
    assert z0 = '0' and z1 = '0' and z2 = '0' and z3 = '0'
      report "Test 7b failed: receive mode, undriven bus reads as high -> Z low" severity error;

    -- Test 8: weak levels on the bus ('H' pull-up, 'L' pull-down)
    ext0 <= 'H'; ext1 <= 'L'; ext2 <= 'H'; ext3 <= 'L';
    wait for 10 ns;
    assert z0 = '0' and z1 = '1' and z2 = '0' and z3 = '1'
      report "Test 8 failed: receive mode, weak bus levels" severity error;

    -- Test 9: 'Z' on the enable input reads as high (receive mode)
    e_n <= 'Z';
    ext0 <= '0'; ext1 <= 'Z'; ext2 <= '0'; ext3 <= 'Z';
    i0 <= '0'; i1 <= '0'; i2 <= '0'; i3 <= '0';
    wait for 10 ns;
    assert b1 = 'Z' and b3 = 'Z'
      report "Test 9a failed: 'Z' on E must disable the drivers" severity error;
    assert z0 = '1' and z1 = '0' and z2 = '1' and z3 = '0'
      report "Test 9b failed: receive mode with 'Z' on E" severity error;

    wait;
  end process;

end architecture;
