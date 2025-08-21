library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity sn7474_tb is
end entity;

architecture testbench of sn7474_tb is

  signal g2r_n : std_logic;
  signal g2d   : std_logic;
  signal g2clk : std_logic;
  signal g2s_n : std_logic;
  signal g2q   : std_logic;
  signal g2q_n : std_logic;
  signal g1q_n : std_logic;
  signal g1q   : std_logic;
  signal g1s_n : std_logic;
  signal g1clk : std_logic;
  signal g1d   : std_logic;
  signal g1r_n : std_logic;

  procedure check_outputs(
    g1q_expected, g1q_n_expected,
    g2q_expected, g2q_n_expected : in std_logic;
    msg : in string) is
  begin
    assert g1q = g1q_expected report "g1q " & msg severity error;
    assert g1q_n = g1q_n_expected report "g1q_n " & msg severity error;
    assert g2q = g2q_expected report "g2q " & msg severity error;
    assert g2q_n = g2q_n_expected report "g2q_n " & msg severity error;
  end procedure;

begin

  uut : sn7474 port map(
    g1r_n => g1r_n,
    g1d   => g1d,
    g1clk => g1clk,
    g1s_n => g1s_n,
    g1q   => g1q,
    g1q_n => g1q_n,
    g2q_n => g2q_n,
    g2q   => g2q,
    g2s_n => g2s_n,
    g2clk => g2clk,
    g2d   => g2d,
    g2r_n => g2r_n
    );

  process
  begin
    -- Initialize
    g1clk <= '0'; g2clk <= '0';
    g1r_n <= '1'; g2r_n <= '1';
    g1s_n <= '1'; g2s_n <= '1';
    g1d <= '0'; g2d <= '0';
    wait for 5 ns;

    -- Test clear (reset) for both
    g1r_n <= '0'; g2r_n <= '0';
    wait for 5 ns;
    check_outputs('0', '1', '0', '1', "should be cleared");

    -- Test preset for both
    g1r_n <= '1'; g2r_n <= '1';
    g1s_n <= '0'; g2s_n <= '0';
    wait for 5 ns;
    check_outputs('1', '0', '1', '0', "should be preset");

    -- Test data loading on rising edge
    g1s_n <= '1'; g2s_n <= '1';
    g1d <= '1'; g2d <= '0';
    wait for 5 ns;
    check_outputs('1', '0', '1', '0', "should not change without clock");

    g1clk <= '1'; g2clk <= '1';
    wait for 5 ns;
    check_outputs('1', '0', '0', '1', "should load data on rising edge");

    -- Test complementary outputs
    g1d <= '0'; g2d <= '1';
    g1clk <= '0'; g2clk <= '0';
    wait for 5 ns;
    check_outputs('1', '0', '0', '1', "should not change without clock");

    g1clk <= '1'; g2clk <= '1';
    wait for 5 ns;
    check_outputs('0', '1', '1', '0', "should load new data on rising edge");

    -- Test clear during operation
    g1r_n <= '0'; g2r_n <= '0';
    wait for 5 ns;
    check_outputs('0', '1', '0', '1', "should clear immediately");

    -- Test preset during operation
    g1r_n <= '1'; g2r_n <= '1';
    g1s_n <= '0'; g2s_n <= '0';
    wait for 5 ns;
    check_outputs('1', '0', '1', '0', "should preset immediately");

    -- Test clock edge sensitivity
    g1s_n <= '1'; g2s_n <= '1';
    g1d <= '1'; g2d <= '1';
    g1clk <= '0'; g2clk <= '0';
    wait for 5 ns;
    check_outputs('1', '0', '1', '0', "should not change on falling edge");

    g1clk <= '1'; g2clk <= '1';
    wait for 5 ns;
    check_outputs('1', '0', '1', '0', "should change on rising edge");

    wait;
  end process;

end;
