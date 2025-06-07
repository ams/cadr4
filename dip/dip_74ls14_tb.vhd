library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library std;
use std.textio.all;

library dip;
use dip.dip.all;

entity dip_74ls14_tb is
end entity;

architecture behavior of dip_74ls14_tb is
  signal p1, p3, p5, p9, p11, p13 : std_logic := '0';
  signal p2, p4, p6, p8, p10, p12 : std_logic;

begin
  uut : entity dip.dip_74ls14
    port map (
      p1  => p1,
      p2  => p2,
      p3  => p3,
      p4  => p4,
      p5  => p5,
      p6  => p6,
      p8  => p8,
      p9  => p9,
      p10 => p10,
      p11 => p11,
      p12 => p12,
      p13 => p13
      );

  stim_proc : process
  begin
    report "Starting test";

    -- Test case 1: all inputs low
    p1  <= '0';
    p3  <= '0';
    p5  <= '0';
    p9  <= '0';
    p11 <= '0';
    p13 <= '0';
    wait for 10 ns;
    assert p2 = '1' report "Test Case 1.1 failed" severity error;
    assert p4 = '1' report "Test Case 1.2 failed" severity error;
    assert p6 = '1' report "Test Case 1.3 failed" severity error;
    assert p8 = '1' report "Test Case 1.4 failed" severity error;
    assert p10 = '1' report "Test Case 1.5 failed" severity error;
    assert p12 = '1' report "Test Case 1.6 failed" severity error;

    -- Test case 2: all inputs high
    p1  <= '1';
    p3  <= '1';
    p5  <= '1';
    p9  <= '1';
    p11 <= '1';
    p13 <= '1';
    wait for 10 ns;
    assert p2 = '0' report "Test Case 2.1 failed" severity error;
    assert p4 = '0' report "Test Case 2.2 failed" severity error;
    assert p6 = '0' report "Test Case 2.3 failed" severity error;
    assert p8 = '0' report "Test Case 2.4 failed" severity error;
    assert p10 = '0' report "Test Case 2.5 failed" severity error;
    assert p12 = '0' report "Test Case 2.6 failed" severity error;

    -- Test case 3: mixed inputs
    p1  <= '0';
    p3  <= '1';
    p5  <= '0';
    p9  <= '1';
    p11 <= '0';
    p13 <= '1';
    wait for 10 ns;
    assert p2 = '1' report "Test Case 3.1 failed" severity error;
    assert p4 = '0' report "Test Case 3.2 failed" severity error;
    assert p6 = '1' report "Test Case 3.3 failed" severity error;
    assert p8 = '0' report "Test Case 3.4 failed" severity error;
    assert p10 = '1' report "Test Case 3.5 failed" severity error;
    assert p12 = '0' report "Test Case 3.6 failed" severity error;

    report "Test finished";
    wait;
  end process;

end architecture; 