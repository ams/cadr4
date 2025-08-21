-- Testbench for SN74273 Octal D-Type Flip-Flop with Clear

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.sn74.sn74273;

entity sn74273_tb is
end entity;

architecture sim of sn74273_tb is

  signal clr_n : std_logic := '1';
  signal clk   : std_logic := '0';
  signal d0, d1, d2, d3, d4, d5, d6, d7 : std_logic := '0';
  signal q0, q1, q2, q3, q4, q5, q6, q7 : std_logic;

  constant clock_period : time := 20 ns;

begin

  -- Clock generation
  clk <= not clk after clock_period / 2;

  -- Device under test
  dut: sn74273
    port map (
      clr_n => clr_n,
      clk   => clk,
      d0    => d0,
      d1    => d1,
      d2    => d2,
      d3    => d3,
      d4    => d4,
      d5    => d5,
      d6    => d6,
      d7    => d7,
      q0    => q0,
      q1    => q1,
      q2    => q2,
      q3    => q3,
      q4    => q4,
      q5    => q5,
      q6    => q6,
      q7    => q7
      );

  -- Test process
  process
  begin
    -- Test asynchronous clear
    clr_n <= '0';
    d0 <= '1'; d1 <= '1'; d2 <= '1'; d3 <= '1';
    d4 <= '1'; d5 <= '1'; d6 <= '1'; d7 <= '1';
    wait for 30 ns;
    assert (q0='0' and q1='0' and q2='0' and q3='0' and q4='0' and q5='0' and q6='0' and q7='0')
      report "Clear test failed" severity error;

    -- Release clear and test basic operation
    clr_n <= '1';
    wait for 10 ns;
    
    -- Test data transfer on rising edge
    d0 <= '1'; d1 <= '0'; d2 <= '1'; d3 <= '0';
    d4 <= '1'; d5 <= '0'; d6 <= '1'; d7 <= '0';
    wait until rising_edge(clk);
    wait for 5 ns;
    assert (q0='1' and q1='0' and q2='1' and q3='0' and q4='1' and q5='0' and q6='1' and q7='0')
      report "Data transfer test 1 failed" severity error;

    -- Test different data pattern
    d0 <= '0'; d1 <= '1'; d2 <= '0'; d3 <= '1';
    d4 <= '0'; d5 <= '1'; d6 <= '0'; d7 <= '1';
    wait until rising_edge(clk);
    wait for 5 ns;
    assert (q0='0' and q1='1' and q2='0' and q3='1' and q4='0' and q5='1' and q6='0' and q7='1')
      report "Data transfer test 2 failed" severity error;

    -- Test that data doesn't change on falling edge
    d0 <= '1'; d1 <= '1'; d2 <= '1'; d3 <= '1';
    d4 <= '1'; d5 <= '1'; d6 <= '1'; d7 <= '1';
    wait until falling_edge(clk);
    wait for 5 ns;
    assert (q0='0' and q1='1' and q2='0' and q3='1' and q4='0' and q5='1' and q6='0' and q7='1')
      report "Falling edge immunity test failed" severity error;

    -- Test clear during operation
    wait until rising_edge(clk);
    wait for 5 ns;
    assert (q0='1' and q1='1' and q2='1' and q3='1' and q4='1' and q5='1' and q6='1' and q7='1')
      report "Data transfer test 3 failed" severity error;

    clr_n <= '0';
    wait for 5 ns;
    assert (q0='0' and q1='0' and q2='0' and q3='0' and q4='0' and q5='0' and q6='0' and q7='0')
      report "Clear during operation test failed" severity error;

    -- Test hold time after clear release
    clr_n <= '1';
    d0 <= '0'; d1 <= '0'; d2 <= '0'; d3 <= '0';
    d4 <= '0'; d5 <= '0'; d6 <= '0'; d7 <= '0';
    wait for 30 ns;
    assert (q0='0' and q1='0' and q2='0' and q3='0' and q4='0' and q5='0' and q6='0' and q7='0')
      report "Hold after clear test failed" severity error;

    wait for 100 ns;
    assert false report "Test completed" severity note;
    wait;
  end process;

end;
