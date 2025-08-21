library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity sn74174_tb is
end entity;

architecture testbench of sn74174_tb is

  signal q6    : std_logic;
  signal d6    : std_logic;
  signal d5    : std_logic;
  signal q5    : std_logic;
  signal d4    : std_logic;
  signal q4    : std_logic;
  signal clk   : std_logic;
  signal q3    : std_logic;
  signal d3    : std_logic;
  signal q2    : std_logic;
  signal d2    : std_logic;
  signal d1    : std_logic;
  signal q1    : std_logic;
  signal clr_n : std_logic;

  procedure check_outputs(
    q1_expected, q2_expected, q3_expected,
    q4_expected, q5_expected, q6_expected : in std_logic;
    msg : in string) is
  begin
    assert q1 = q1_expected report "q1 " & msg severity error;
    assert q2 = q2_expected report "q2 " & msg severity error;
    assert q3 = q3_expected report "q3 " & msg severity error;
    assert q4 = q4_expected report "q4 " & msg severity error;
    assert q5 = q5_expected report "q5 " & msg severity error;
    assert q6 = q6_expected report "q6 " & msg severity error;
  end procedure;

begin

  uut : sn74174 port map(
    clr_n => clr_n,
    q1    => q1,
    d1    => d1,
    d2    => d2,
    q2    => q2,
    d3    => d3,
    q3    => q3,
    clk   => clk,
    q4    => q4,
    d4    => d4,
    q5    => q5,
    d5    => d5,
    d6    => d6,
    q6    => q6
    );

  process
  begin
    -- Initialize
    clk <= '0';
    clr_n <= '1';
    d1 <= '0'; d2 <= '0'; d3 <= '0';
    d4 <= '0'; d5 <= '0'; d6 <= '0';
    wait for 5 ns;

    -- Test clear functionality
    clr_n <= '0';
    wait for 5 ns;
    check_outputs('0', '0', '0', '0', '0', '0', "should be cleared");

    -- Test data loading
    clr_n <= '1';
    d1 <= '1'; d2 <= '1'; d3 <= '1';
    d4 <= '1'; d5 <= '1'; d6 <= '1';
    wait for 5 ns;
    check_outputs('0', '0', '0', '0', '0', '0', "should not change without clock");

    clk <= '1';
    wait for 5 ns;
    check_outputs('1', '1', '1', '1', '1', '1', "should load data on rising edge");

    -- Test individual bit loading
    clk <= '0';
    d1 <= '0'; d2 <= '1'; d3 <= '0';
    d4 <= '1'; d5 <= '0'; d6 <= '1';
    wait for 5 ns;
    check_outputs('1', '1', '1', '1', '1', '1', "should not change without clock");

    clk <= '1';
    wait for 5 ns;
    check_outputs('0', '1', '0', '1', '0', '1', "should load alternating data");

    -- Test clear during operation
    clr_n <= '0';
    wait for 5 ns;
    check_outputs('0', '0', '0', '0', '0', '0', "should clear immediately");

    -- Test clock edge sensitivity
    clr_n <= '1';
    d1 <= '1'; d2 <= '1'; d3 <= '1';
    d4 <= '1'; d5 <= '1'; d6 <= '1';
    clk <= '0';
    wait for 5 ns;
    check_outputs('0', '0', '0', '0', '0', '0', "should not change on falling edge");

    clk <= '1';
    wait for 5 ns;
    check_outputs('1', '1', '1', '1', '1', '1', "should change on rising edge");

    wait;
  end process;

end;
