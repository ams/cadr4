library ieee;
use ieee.std_logic_1164.all;

use work.fairchild.dm8838;

entity dm8838_tb is
end entity;

architecture testbench of dm8838_tb is

  signal in1, in2, in3, in4 : std_logic;
  signal out1, out2, out3, out4 : std_logic;
  signal bus1, bus2, bus3, bus4 : std_logic;
  signal disable_a, disable_b : std_logic;
  -- external device on the bus, 'Z' when it is not driving
  signal ext1, ext2, ext3, ext4 : std_logic := 'Z';

begin

  uut : dm8838 port map(
    in1 => in1,
    in2 => in2,
    in3 => in3,
    in4 => in4,
    out1 => out1,
    out2 => out2,
    out3 => out3,
    out4 => out4,
    bus1 => bus1,
    bus2 => bus2,
    bus3 => bus3,
    bus4 => bus4,
    disable_a => disable_a,
    disable_b => disable_b
    );

  -- Bus termination: the line is pulled high ('H') when no open-collector
  -- driver pulls it low.
  bus1 <= 'H';
  bus2 <= 'H';
  bus3 <= 'H';
  bus4 <= 'H';

  -- External device on the bus (the only other driver of the bus lines).
  bus1 <= ext1;
  bus2 <= ext2;
  bus3 <= ext3;
  bus4 <= ext4;

  process
  begin
    -- Test 1: drivers enabled (both disable inputs low), inputs low.
    -- Drivers are off, the bus is pulled high and the inverting receivers
    -- output low.
    disable_a <= '0'; disable_b <= '0';
    in1 <= '0'; in2 <= '0'; in3 <= '0'; in4 <= '0';
    wait for 10 ns;
    assert bus1 = 'H' and bus2 = 'H' and bus3 = 'H' and bus4 = 'H'
      report "Test 1a failed: enabled, inputs low, bus should be pulled high" severity error;
    assert out1 = '0' and out2 = '0' and out3 = '0' and out4 = '0'
      report "Test 1b failed: receiver output must be the inverted bus (bus high -> out low)" severity error;

    -- Test 2: enabled, mixed inputs. A high input pulls its bus line low and
    -- the receiver of that channel sees the low bus.
    in1 <= '1'; in2 <= '0'; in3 <= '1'; in4 <= '0';
    wait for 10 ns;
    assert bus1 = '0' and bus2 = 'H' and bus3 = '0' and bus4 = 'H'
      report "Test 2a failed: enabled, bus incorrect for mixed inputs" severity error;
    assert out1 = '1' and out2 = '0' and out3 = '1' and out4 = '0'
      report "Test 2b failed: receiver output must be the inverted bus" severity error;

    -- Test 3: enabled, all inputs high
    in1 <= '1'; in2 <= '1'; in3 <= '1'; in4 <= '1';
    wait for 10 ns;
    assert bus1 = '0' and bus2 = '0' and bus3 = '0' and bus4 = '0'
      report "Test 3a failed: enabled, all bus lines should be low" severity error;
    assert out1 = '1' and out2 = '1' and out3 = '1' and out4 = '1'
      report "Test 3b failed: all receiver outputs should be high" severity error;

    -- Test 4: disable_a high. Drivers are off regardless of the inputs, the
    -- bus is pulled high, receivers output low.
    disable_a <= '1'; disable_b <= '0';
    in1 <= '1'; in2 <= '1'; in3 <= '1'; in4 <= '1';
    wait for 10 ns;
    assert bus1 = 'H' and bus2 = 'H' and bus3 = 'H' and bus4 = 'H'
      report "Test 4a failed: disabled, bus should be pulled high" severity error;
    assert out1 = '0' and out2 = '0' and out3 = '0' and out4 = '0'
      report "Test 4b failed: disabled, receivers should output the inverted (high) bus" severity error;

    -- Test 5: disabled, external device pulls some lines low
    ext1 <= '0'; ext2 <= 'Z'; ext3 <= '0'; ext4 <= 'Z';
    wait for 10 ns;
    assert bus1 = '0' and bus2 = 'H' and bus3 = '0' and bus4 = 'H'
      report "Test 5a failed: external device should pull bus 1 and 3 low" severity error;
    assert out1 = '1' and out2 = '0' and out3 = '1' and out4 = '0'
      report "Test 5b failed: disabled, receivers should output the inverted bus" severity error;

    -- Test 6: disable_b high, external device drives strong levels
    disable_a <= '0'; disable_b <= '1';
    ext1 <= '1'; ext2 <= '0'; ext3 <= '1'; ext4 <= '0';
    wait for 10 ns;
    assert out1 = '0' and out2 = '1' and out3 = '0' and out4 = '1'
      report "Test 6 failed: disabled, receivers should output the inverted bus" severity error;

    -- Test 7: both disable inputs high, external device releases the bus
    disable_a <= '1'; disable_b <= '1';
    ext1 <= 'Z'; ext2 <= 'Z'; ext3 <= 'Z'; ext4 <= 'Z';
    wait for 10 ns;
    assert bus1 = 'H' and bus2 = 'H' and bus3 = 'H' and bus4 = 'H'
      report "Test 7a failed: both disabled, bus should be pulled high" severity error;
    assert out1 = '0' and out2 = '0' and out3 = '0' and out4 = '0'
      report "Test 7b failed: both disabled, receivers should output low" severity error;

    -- Test 8: enabled while the external device holds a line low: the
    -- receiver follows the bus, not the driver input.
    disable_a <= '0'; disable_b <= '0';
    in1 <= '0'; in2 <= '1'; in3 <= '0'; in4 <= '0';
    ext1 <= '0'; ext2 <= 'Z'; ext3 <= 'Z'; ext4 <= 'Z';
    wait for 10 ns;
    assert bus1 = '0' and bus2 = '0' and bus3 = 'H' and bus4 = 'H'
      report "Test 8a failed: bus1 by external device, bus2 by own driver" severity error;
    assert out1 = '1' and out2 = '1' and out3 = '0' and out4 = '0'
      report "Test 8b failed: out1 must follow the bus (low) although in1 is low" severity error;

    -- Test 9: TTL inputs, 'Z'/'H' read as high and 'L' reads as low.
    -- 'Z' on disable_a disables the drivers.
    disable_a <= 'Z'; disable_b <= '0';
    in1 <= '1'; in2 <= '1'; in3 <= '1'; in4 <= '1';
    ext1 <= 'Z'; ext2 <= 'Z'; ext3 <= 'Z'; ext4 <= 'Z';
    wait for 10 ns;
    assert bus1 = 'H' and bus2 = 'H' and bus3 = 'H' and bus4 = 'H'
      report "Test 9a failed: 'Z' on disable_a must read as high (drivers off)" severity error;
    assert out1 = '0' and out2 = '0' and out3 = '0' and out4 = '0'
      report "Test 9b failed: drivers off, receivers should output low" severity error;
    -- 'L' on both disable inputs enables the drivers
    disable_a <= 'L'; disable_b <= 'L';
    in1 <= 'H'; in2 <= 'L'; in3 <= 'Z'; in4 <= '0';
    wait for 10 ns;
    assert bus1 = '0' and bus2 = 'H' and bus3 = '0' and bus4 = 'H'
      report "Test 9c failed: 'H'/'Z' inputs must read as high, 'L' as low" severity error;
    assert out1 = '1' and out2 = '0' and out3 = '1' and out4 = '0'
      report "Test 9d failed: receivers should output the inverted bus" severity error;

    -- Test 10: transition from disabled to enabled
    disable_a <= '1'; disable_b <= '0';
    in1 <= '0'; in2 <= '1'; in3 <= '0'; in4 <= '1';
    wait for 5 ns;
    assert bus1 = 'H' and bus2 = 'H' and bus3 = 'H' and bus4 = 'H'
      report "Test 10a failed: disabled, bus should be pulled high" severity error;
    disable_a <= '0'; disable_b <= '0';
    wait for 10 ns;
    assert bus1 = 'H' and bus2 = '0' and bus3 = 'H' and bus4 = '0'
      report "Test 10b failed: transition to enabled, bus pattern incorrect" severity error;
    assert out1 = '0' and out2 = '1' and out3 = '0' and out4 = '1'
      report "Test 10c failed: transition to enabled, receiver outputs incorrect" severity error;

    wait;
  end process;

end;
