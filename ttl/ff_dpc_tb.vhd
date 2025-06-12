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
    
    -- Test 3: Normal D flip-flop operation
    d <= '1';
    wait until rising_edge(clk);
    wait for 1 ns;
    assert q = '1' and q_n = '0' report "D=1 test failed" severity error;
    
    d <= '0';
    wait until rising_edge(clk);
    wait for 1 ns;
    assert q = '0' and q_n = '1' report "D=0 test failed" severity error;
    
    -- Test 4: Preset and clear precedence (preset should win when both active)
    pre <= '0';
    clr <= '0';
    wait for CLK_PERIOD / 4;
    assert q = '1' and q_n = '0' report "Preset precedence test failed" severity error;
    pre <= '1';
    clr <= '1';
    
    wait for CLK_PERIOD * 2;
    finish;
  end process;

end; 