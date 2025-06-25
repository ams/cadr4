-- Testbench for ff_dpc (D Flip-Flop with preset and clear)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.env.finish;

entity ff_dpc_tb is
end;

architecture testbench of ff_dpc_tb is
  signal clk      : std_logic := '0';
  signal pre, clr : std_logic := '1';
  signal d        : std_logic := '0';
  signal enb_n    : std_logic := '0';  -- Changed from hardcoded to signal
  signal q, q_n   : std_logic;

  constant CLK_PERIOD : time := 20 ns;
begin
  
  uut : entity work.ff_dpc port map (
    clk   => clk,
    pre   => pre,
    clr   => clr,
    d     => d,
    enb_n => enb_n,  -- Now properly connected to signal
    q     => q,
    q_n   => q_n
  );

  -- Clock generation
  clk <= not clk after CLK_PERIOD / 2;

  process
  begin
    -- Test 1: Reset (clear active) - this initializes the flip-flop from 'U' state
    clr <= '0';
    wait for CLK_PERIOD;
    assert q = '0' and q_n = '1' report "Clear test failed" severity error;
    clr <= '1';
    
    -- Test 2: Preset active
    pre <= '0';
    wait for CLK_PERIOD;
    assert q = '1' and q_n = '0' report "Preset test failed" severity error;
    pre <= '1';
    
    -- Test 3: Normal D flip-flop operation with enb_n = '0' (enabled) - clock in '1'
    enb_n <= '0';
    d <= '1';
    wait until rising_edge(clk);
    wait for 1 ns;
    assert q = '1' and q_n = '0' report "D=1 test with enb_n=0 failed" severity error;
    
    -- Test 4: Normal D flip-flop operation with enb_n = '0' (enabled) - clock in '0'
    d <= '0';
    wait until rising_edge(clk);
    wait for 1 ns;
    assert q = '0' and q_n = '1' report "D=0 test with enb_n=0 failed" severity error;
    
    -- Test 5: Enable signal test - disable the flip-flop (enb_n = '1')
    enb_n <= '1';
    d <= '1';  -- Try to clock in '1' but should be ignored
    wait until rising_edge(clk);
    wait for 1 ns;
    assert q = '0' and q_n = '1' report "Flip-flop should be disabled when enb_n=1" severity error;
    
    -- Test 6: Multiple clock edges while disabled
    d <= '1';
    wait until rising_edge(clk);
    wait for 1 ns;
    d <= '0';
    wait until rising_edge(clk);
    wait for 1 ns;
    d <= '1';
    wait until rising_edge(clk);
    wait for 1 ns;
    assert q = '0' and q_n = '1' report "Flip-flop should remain disabled through multiple clocks" severity error;
    
    -- Test 7: Re-enable the flip-flop
    enb_n <= '0';
    d <= '1';
    wait until rising_edge(clk);
    wait for 1 ns;
    assert q = '1' and q_n = '0' report "Flip-flop should work after re-enabling" severity error;
    
    -- Test 8: Enable control during preset (preset should still work)
    enb_n <= '1';  -- Disable
    clr <= '0';    -- Clear should still work
    wait for CLK_PERIOD / 4;
    assert q = '0' and q_n = '1' report "Clear should work even when disabled" severity error;
    clr <= '1';
    
    -- Test 9: Enable control during preset (preset should still work)
    enb_n <= '1';  -- Still disabled
    pre <= '0';    -- Preset should still work
    wait for CLK_PERIOD / 4;
    assert q = '1' and q_n = '0' report "Preset should work even when disabled" severity error;
    pre <= '1';
    
    -- Test 10: Enable signal change during clock edge
    enb_n <= '0';  -- Enable
    d <= '0';
    wait for CLK_PERIOD / 4;
    enb_n <= '1';  -- Disable during clock cycle
    wait until rising_edge(clk);
    wait for 1 ns;
    assert q = '1' and q_n = '0' report "Enable change during clock cycle should not affect current state" severity error;
    
    -- Test 11: Test unknown enable signal
    enb_n <= 'X';
    d <= '0';
    wait until rising_edge(clk);
    wait for 1 ns;
    assert q = '1' and q_n = '0' report "Unknown enable should maintain previous state" severity error;
    
    -- Reset to known state for remaining tests
    enb_n <= '0';
    clr <= '0';
    wait for CLK_PERIOD / 4;
    clr <= '1';
    
    -- Test 12: Preset and clear precedence (both active - should produce X)
    pre <= '0';
    clr <= '0';
    wait for CLK_PERIOD / 4;
    assert q = 'X' and q_n = 'X' report "Conflicting preset/clear should produce X" severity error;
    pre <= '1';
    clr <= '1';
    
    -- Test 13: Verify no change without clock edge when enabled
    enb_n <= '0';
    d <= '1';
    wait for CLK_PERIOD / 4;  -- Wait without clock edge
    assert q = '0' and q_n = '1' report "Output changed without clock edge" severity error;
    
    -- Now apply clock edge
    wait until rising_edge(clk);
    wait for 1 ns;
    assert q = '1' and q_n = '0' report "Clock edge operation failed" severity error;
    
    -- Test 14: Test X input handling - D unknown (when enabled)
    d <= 'X';
    wait until rising_edge(clk);
    wait for 1 ns;
    assert q = 'X' and q_n = 'X' report "Unknown D input should produce X" severity error;
    
    -- Reset to known state
    clr <= '0';
    wait for CLK_PERIOD / 4;
    clr <= '1';
    
    -- Test 15: Test U input handling - D uninitialized (when enabled)
    d <= 'U';
    wait until rising_edge(clk);
    wait for 1 ns;
    assert q = 'X' and q_n = 'X' report "Uninitialized D input should produce X" severity error;
    
    -- Reset to known state
    clr <= '0';
    wait for CLK_PERIOD / 4;
    clr <= '1';
    
    -- Test 16: Test unknown clock handling (realistic TTL behavior)
    -- Unknown clock should not produce a valid edge, so flip-flop maintains state
    d <= '1';  -- Set command (but won't execute due to unknown clock)
    clk <= 'X';
    wait for CLK_PERIOD / 4;
    assert q = '0' and q_n = '1' report "Unknown clock should maintain previous state" severity error;
    
    -- Resume normal clock
    clk <= '0';
    wait for CLK_PERIOD / 4;
    
    -- Test 17: Test unknown preset signal
    pre <= 'X';
    clr <= '1';
    wait for CLK_PERIOD / 4;
    assert q = 'X' and q_n = 'X' report "Unknown preset should produce X" severity error;
    pre <= '1';
    
    -- Test 18: Test unknown clear signal
    pre <= '1';
    clr <= 'X';
    wait for CLK_PERIOD / 4;
    assert q = 'X' and q_n = 'X' report "Unknown clear should produce X" severity error;
    clr <= '1';
    
    -- Test 19: Asynchronous operation verification (preset/clear work without clock)
    -- Stop clock
    clk <= '0';
    
    -- Clear without clock (should work regardless of enable)
    enb_n <= '1';  -- Disabled
    clr <= '0';
    wait for CLK_PERIOD / 4;
    assert q = '0' and q_n = '1' report "Asynchronous clear failed when disabled" severity error;
    clr <= '1';
    
    -- Preset without clock (should work regardless of enable)
    pre <= '0';
    wait for CLK_PERIOD / 4;
    assert q = '1' and q_n = '0' report "Asynchronous preset failed when disabled" severity error;
    pre <= '1';
    
    -- Test 20: Multiple rapid D changes with enable (only last value before clock should matter)
    enb_n <= '0';  -- Enable
    d <= '0';
    wait for 1 ns;
    d <= '1';
    wait for 1 ns;
    d <= '0';
    wait for 1 ns;
    d <= '1';  -- Final value before clock
    
    -- Resume clock and check
    clk <= '1';
    wait for CLK_PERIOD / 4;
    clk <= '0';
    wait for 1 ns;
    assert q = '1' and q_n = '0' report "Multiple D changes test failed when enabled" severity error;
    
    -- Test 21: Multiple rapid D changes while disabled (should not affect output)
    enb_n <= '1';  -- Disable
    d <= '0';
    wait for 1 ns;
    d <= '1';
    wait for 1 ns;
    d <= '0';
    wait for 1 ns;
    
    -- Clock edge while disabled
    clk <= '1';
    wait for CLK_PERIOD / 4;
    clk <= '0';
    wait for 1 ns;
    assert q = '1' and q_n = '0' report "D changes should not affect output when disabled" severity error;
    
    -- Test 22: Preset overrides clock operation (regardless of enable)
    enb_n <= '0';  -- Enable
    d <= '0';  -- Try to clock in 0
    pre <= '0';  -- But preset is active
    clk <= '1';
    wait for CLK_PERIOD / 4;
    clk <= '0';
    wait for 1 ns;
    assert q = '1' and q_n = '0' report "Preset should override clock operation" severity error;
    pre <= '1';
    
    -- Test 23: Clear overrides clock operation (regardless of enable)
    d <= '1';  -- Try to clock in 1
    clr <= '0';  -- But clear is active
    clk <= '1';
    wait for CLK_PERIOD / 4;
    clk <= '0';
    wait for 1 ns;
    assert q = '0' and q_n = '1' report "Clear should override clock operation" severity error;
    clr <= '1';
    
    -- Test 24: Verify setup/hold behavior when enabled
    enb_n <= '0';  -- Enable
    d <= '1';
    wait for 1 ns;  -- Setup time
    clk <= '1';
    d <= '0';  -- Change D during clock high (should not affect this cycle)
    wait for CLK_PERIOD / 4;
    clk <= '0';
    wait for 1 ns;
    assert q = '1' and q_n = '0' report "Setup/hold test failed - D change during clock high affected output" severity error;
    
    -- Test 25: Falling edge should not trigger (when enabled)
    d <= '0';
    clk <= '1';  -- Start high
    wait for CLK_PERIOD / 4;
    clk <= '0';  -- Falling edge
    wait for 1 ns;
    -- q should still be '1' from previous test
    assert q = '1' and q_n = '0' report "Falling edge incorrectly triggered" severity error;
    
    -- Test 26: Rising edge should trigger (when enabled)
    d <= '0';
    clk <= '0';  -- Start low
    wait for CLK_PERIOD / 4;
    clk <= '1';  -- Rising edge
    wait for 1 ns;
    clk <= '0';
    wait for 1 ns;
    assert q = '0' and q_n = '1' report "Rising edge failed to trigger when enabled" severity error;
    
    -- Test 27: Final enable/disable sequence test
    enb_n <= '1';  -- Disable
    d <= '1';
    wait until rising_edge(clk);
    wait for 1 ns;
    assert q = '0' and q_n = '1' report "Final disable test failed" severity error;
    
    enb_n <= '0';  -- Enable
    wait until rising_edge(clk);
    wait for 1 ns;
    assert q = '1' and q_n = '0' report "Final enable test failed" severity error;
    
    wait for CLK_PERIOD * 2;
    finish;
  end process;

end; 