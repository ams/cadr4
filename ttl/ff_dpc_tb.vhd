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
  signal q, q_n   : std_logic;

  constant CLK_PERIOD : time := 20 ns;
begin
  
  uut : entity work.ff_dpc port map (
    clk => clk,
    pre => pre,
    clr => clr,
    d   => d,
    q   => q,
    q_n => q_n
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
    
    -- Test 3: Normal D flip-flop operation - clock in '1'
    d <= '1';
    wait until rising_edge(clk);
    wait for 1 ns;
    assert q = '1' and q_n = '0' report "D=1 test failed" severity error;
    
    -- Test 4: Normal D flip-flop operation - clock in '0'
    d <= '0';
    wait until rising_edge(clk);
    wait for 1 ns;
    assert q = '0' and q_n = '1' report "D=0 test failed" severity error;
    
    -- Test 5: Preset and clear precedence (both active - should produce X)
    pre <= '0';
    clr <= '0';
    wait for CLK_PERIOD / 4;
    assert q = 'X' and q_n = 'X' report "Conflicting preset/clear should produce X" severity error;
    pre <= '1';
    clr <= '1';
    
    -- Test 6: Verify no change without clock edge
    d <= '1';
    wait for CLK_PERIOD / 4;  -- Wait without clock edge
    assert q = '0' and q_n = '1' report "Output changed without clock edge" severity error;
    
    -- Now apply clock edge
    wait until rising_edge(clk);
    wait for 1 ns;
    assert q = '1' and q_n = '0' report "Clock edge operation failed" severity error;
    
    -- Test 7: Test X input handling - D unknown
    d <= 'X';
    wait until rising_edge(clk);
    wait for 1 ns;
    assert q = 'X' and q_n = 'X' report "Unknown D input should produce X" severity error;
    
    -- Reset to known state
    clr <= '0';
    wait for CLK_PERIOD / 4;
    clr <= '1';
    
    -- Test 8: Test U input handling - D uninitialized
    d <= 'U';
    wait until rising_edge(clk);
    wait for 1 ns;
    assert q = 'X' and q_n = 'X' report "Uninitialized D input should produce X" severity error;
    
    -- Reset to known state
    clr <= '0';
    wait for CLK_PERIOD / 4;
    clr <= '1';
    
    -- Test 9: Test unknown clock handling
    d <= '1';
    clk <= 'X';
    wait for CLK_PERIOD / 4;
    assert q = 'X' and q_n = 'X' report "Unknown clock should produce X" severity error;
    
    -- Resume normal clock
    clk <= '0';
    wait for CLK_PERIOD / 4;
    
    -- Test 10: Test unknown preset signal
    pre <= 'X';
    clr <= '1';
    wait for CLK_PERIOD / 4;
    assert q = 'X' and q_n = 'X' report "Unknown preset should produce X" severity error;
    pre <= '1';
    
    -- Test 11: Test unknown clear signal
    pre <= '1';
    clr <= 'X';
    wait for CLK_PERIOD / 4;
    assert q = 'X' and q_n = 'X' report "Unknown clear should produce X" severity error;
    clr <= '1';
    
    -- Test 12: Asynchronous operation verification (preset/clear work without clock)
    -- Stop clock
    clk <= '0';
    
    -- Clear without clock
    clr <= '0';
    wait for CLK_PERIOD / 4;
    assert q = '0' and q_n = '1' report "Asynchronous clear failed" severity error;
    clr <= '1';
    
    -- Preset without clock
    pre <= '0';
    wait for CLK_PERIOD / 4;
    assert q = '1' and q_n = '0' report "Asynchronous preset failed" severity error;
    pre <= '1';
    
    -- Test 13: Multiple rapid D changes (only last value before clock should matter)
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
    assert q = '1' and q_n = '0' report "Multiple D changes test failed" severity error;
    
    -- Test 14: Preset overrides clock operation
    d <= '0';  -- Try to clock in 0
    pre <= '0';  -- But preset is active
    clk <= '1';
    wait for CLK_PERIOD / 4;
    clk <= '0';
    wait for 1 ns;
    assert q = '1' and q_n = '0' report "Preset should override clock operation" severity error;
    pre <= '1';
    
    -- Test 15: Clear overrides clock operation
    d <= '1';  -- Try to clock in 1
    clr <= '0';  -- But clear is active
    clk <= '1';
    wait for CLK_PERIOD / 4;
    clk <= '0';
    wait for 1 ns;
    assert q = '0' and q_n = '1' report "Clear should override clock operation" severity error;
    clr <= '1';
    
    -- Test 16: Verify setup/hold behavior (D changes around clock edge)
    d <= '1';
    wait for 1 ns;  -- Setup time
    clk <= '1';
    d <= '0';  -- Change D during clock high (should not affect this cycle)
    wait for CLK_PERIOD / 4;
    clk <= '0';
    wait for 1 ns;
    assert q = '1' and q_n = '0' report "Setup/hold test failed - D change during clock high affected output" severity error;
    
    -- Test 17: Falling edge should not trigger
    d <= '0';
    clk <= '1';  -- Start high
    wait for CLK_PERIOD / 4;
    clk <= '0';  -- Falling edge
    wait for 1 ns;
    -- q should still be '1' from previous test
    assert q = '1' and q_n = '0' report "Falling edge incorrectly triggered" severity error;
    
    -- Test 18: Rising edge should trigger
    d <= '0';
    clk <= '0';  -- Start low
    wait for CLK_PERIOD / 4;
    clk <= '1';  -- Rising edge
    wait for 1 ns;
    clk <= '0';
    wait for 1 ns;
    assert q = '0' and q_n = '1' report "Rising edge failed to trigger" severity error;
    
    wait for CLK_PERIOD * 2;
    finish;
  end process;

end; 