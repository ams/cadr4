library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74175_tb is
end;

architecture testbench of sn74175_tb is
  signal clk   : std_logic;
  signal clr_n : std_logic;
  signal q3_n  : std_logic;
  signal q3    : std_logic;
  signal d3    : std_logic;
  signal q2_n  : std_logic;
  signal q2    : std_logic;
  signal d2    : std_logic;
  signal q1_n  : std_logic;
  signal q1    : std_logic;
  signal d1    : std_logic;
  signal q0_n  : std_logic;
  signal q0    : std_logic;
  signal d0    : std_logic;

  procedure check_outputs(
    q0_expected, q0_n_expected,
    q1_expected, q1_n_expected,
    q2_expected, q2_n_expected,
    q3_expected, q3_n_expected : in std_logic;
    msg : in string) is
  begin
    assert q0 = q0_expected report "q0 " & msg severity error;
    assert q0_n = q0_n_expected report "q0_n " & msg severity error;
    assert q1 = q1_expected report "q1 " & msg severity error;
    assert q1_n = q1_n_expected report "q1_n " & msg severity error;
    assert q2 = q2_expected report "q2 " & msg severity error;
    assert q2_n = q2_n_expected report "q2_n " & msg severity error;
    assert q3 = q3_expected report "q3 " & msg severity error;
    assert q3_n = q3_n_expected report "q3_n " & msg severity error;
  end procedure;

begin
  uut : sn74175 port map(
    d0   => d0,
    q0   => q0,
    q0_n => q0_n,
    d1   => d1,
    q1   => q1,
    q1_n => q1_n,
    d2   => d2,
    q2   => q2,
    q2_n => q2_n,
    d3   => d3,
    q3   => q3,
    q3_n => q3_n,
    clr_n => clr_n,
    clk   => clk
    );

  process
  begin
    -- Initialize
    clk <= '0';
    clr_n <= '1';
    d0 <= '0'; d1 <= '0'; d2 <= '0'; d3 <= '0';
    wait for 5 ns;

    -- Test clear functionality
    clr_n <= '0';
    wait for 5 ns;
    check_outputs('0', '1', '0', '1', '0', '1', '0', '1', "should be cleared");

    -- Test data loading
    clr_n <= '1';
    d0 <= '1'; d1 <= '1'; d2 <= '1'; d3 <= '1';
    wait for 5 ns;
    check_outputs('0', '1', '0', '1', '0', '1', '0', '1', "should not change without clock");

    clk <= '1';
    wait for 5 ns;
    check_outputs('1', '0', '1', '0', '1', '0', '1', '0', "should load data on rising edge");

    -- Test individual bit loading
    clk <= '0';
    d0 <= '0'; d1 <= '1'; d2 <= '0'; d3 <= '1';
    wait for 5 ns;
    check_outputs('1', '0', '1', '0', '1', '0', '1', '0', "should not change without clock");

    clk <= '1';
    wait for 5 ns;
    check_outputs('0', '1', '1', '0', '0', '1', '1', '0', "should load alternating data");

    -- Test clear during operation
    clr_n <= '0';
    wait for 5 ns;
    check_outputs('0', '1', '0', '1', '0', '1', '0', '1', "should clear immediately");

    -- Test clock edge sensitivity
    clr_n <= '1';
    d0 <= '1'; d1 <= '1'; d2 <= '1'; d3 <= '1';
    clk <= '0';
    wait for 5 ns;
    check_outputs('0', '1', '0', '1', '0', '1', '0', '1', "should not change on falling edge");

    clk <= '1';
    wait for 5 ns;
    check_outputs('1', '0', '1', '0', '1', '0', '1', '0', "should change on rising edge");

    report "Test completed successfully" severity note;
    wait;
  end process;
end;
