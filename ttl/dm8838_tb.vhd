library ieee;
use ieee.std_logic_1164.all;

use work.fairchild.dm8838;

entity dm8838_tb is
end;

architecture testbench of dm8838_tb is

  signal in1, in2, in3, in4 : std_logic;
  signal out1, out2, out3, out4 : std_logic;
  signal bus1, bus2, bus3, bus4 : std_logic;
  signal disable_a, disable_b : std_logic;

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

  -- Model weak pull-up resistors on the bus lines.
  -- In an open-collector system, the bus is pulled high by resistors.
  -- When the driver is active, it pulls the line low ('0').
  -- When the driver is inactive ('Z'), the resistor pulls it high ('H').
  bus1 <= 'H';
  bus2 <= 'H';
  bus3 <= 'H';
  bus4 <= 'H';

  process
  begin
    -- Test 1: Both disable signals low (enabled - NOR = 1)
    -- Device drives from inputs to bus and outputs
    disable_a <= '0'; disable_b <= '0';
    in1 <= '0'; in2 <= '0'; in3 <= '0'; in4 <= '0';
    wait for 10 ns;
    assert out1 = '0' and out2 = '0' and out3 = '0' and out4 = '0'
      report "Test 1a failed: enabled mode, outputs should match inputs" severity error;
    -- When inputs are low, open collector outputs are high-Z, so bus is pulled high.
    report "DEBUG: bus1=" & std_logic'image(bus1) & " bus2=" & std_logic'image(bus2) & 
           " bus3=" & std_logic'image(bus3) & " bus4=" & std_logic'image(bus4);
    assert bus1 = 'H' and bus2 = 'H' and bus3 = 'H' and bus4 = 'H'
      report "Test 1b failed: enabled mode, bus should be pulled high when inputs low" severity error;

    -- Test 2: Enabled mode with high inputs
    in1 <= '1'; in2 <= '0'; in3 <= '1'; in4 <= '0';
    wait for 10 ns;
    assert out1 = '1' and out2 = '0' and out3 = '1' and out4 = '0'
      report "Test 2a failed: enabled mode, outputs should match inputs" severity error;
    assert bus1 = '0' and bus2 = 'H' and bus3 = '0' and bus4 = 'H'
      report "Test 2b failed: enabled mode, bus incorrect for mixed inputs" severity error;

    -- Test 3: Enabled mode with all inputs high
    in1 <= '1'; in2 <= '1'; in3 <= '1'; in4 <= '1';
    wait for 10 ns;
    assert out1 = '1' and out2 = '1' and out3 = '1' and out4 = '1'
      report "Test 3a failed: enabled mode, all outputs should be high" severity error;
    assert bus1 = '0' and bus2 = '0' and bus3 = '0' and bus4 = '0'
      report "Test 3b failed: enabled mode, all bus lines should be low" severity error;

    -- Test 4: disable_a high (disabled - NOR = 0)
    -- Device is in high-Z on bus, drives outputs from bus
    disable_a <= '1'; disable_b <= '0';
    in1 <= '0'; in2 <= '0'; in3 <= '0'; in4 <= '0';  -- Don't matter when disabled
    wait for 10 ns;
    -- Bus should be pulled high when disabled
    assert bus1 = 'H' and bus2 = 'H' and bus3 = 'H' and bus4 = 'H'
      report "Test 4a failed: disabled mode, bus should be pulled high" severity error;
    assert out1 = '1' and out2 = '1' and out3 = '1' and out4 = '1'
      report "Test 4b failed: disabled mode, outputs should read bus H as high" severity error;

    -- Test 5: External driver overrides pull-up
    disable_a <= '1'; disable_b <= '0';
    bus1 <= '0'; bus2 <= '0'; bus3 <= '0'; bus4 <= '0';  -- External driver forces low
    wait for 10 ns;
    assert out1 = '0' and out2 = '0' and out3 = '0' and out4 = '0'
      report "Test 5 failed: disabled mode, outputs should match externally driven bus" severity error;

    -- Test 6: disable_b high (disabled - NOR = 0)
    disable_a <= '0'; disable_b <= '1';
    bus1 <= '1'; bus2 <= '0'; bus3 <= '1'; bus4 <= '0';
    wait for 10 ns;
    assert out1 = '1' and out2 = '0' and out3 = '1' and out4 = '0'
      report "Test 6 failed: disabled mode, outputs should match bus inputs" severity error;

    -- Test 7: Both disable signals high (disabled - NOR = 0)
    disable_a <= '1'; disable_b <= '1';
    bus1 <= '1'; bus2 <= '1'; bus3 <= '1'; bus4 <= '1';
    wait for 10 ns;
    assert out1 = '1' and out2 = '1' and out3 = '1' and out4 = '1'
      report "Test 7 failed: disabled mode, all outputs should be high" severity error;

    -- Test 8: Transition from disabled to enabled
    disable_a <= '1'; disable_b <= '0';
    in1 <= '0'; in2 <= '1'; in3 <= '0'; in4 <= '1';
    wait for 5 ns;
    disable_a <= '0'; disable_b <= '0';
    wait for 10 ns;
    assert out1 = '0' and out2 = '1' and out3 = '0' and out4 = '1'
      report "Test 8a failed: transition to enabled, outputs should match inputs" severity error;
    assert bus1 = 'H' and bus2 = '0' and bus3 = 'H' and bus4 = '0'
      report "Test 8b failed: transition to enabled, bus pattern incorrect" severity error;

    report "All tests passed!" severity note;
    wait;
  end process;

end;