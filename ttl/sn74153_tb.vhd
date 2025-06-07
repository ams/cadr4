library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;


entity sn74153_tb is
end entity;

architecture behavior of sn74153_tb is
  -- Inputs
  signal sela   : std_logic := '0';
  signal selb   : std_logic := '0';
  signal enb1_n : std_logic := '0';
  signal g1c0   : std_logic := '0';
  signal g1c1   : std_logic := '0';
  signal g1c2   : std_logic := '0';
  signal g1c3   : std_logic := '0';
  signal enb2_n : std_logic := '0';
  signal g2c0   : std_logic := '0';
  signal g2c1   : std_logic := '0';
  signal g2c2   : std_logic := '0';
  signal g2c3   : std_logic := '0';

  -- Outputs
  signal g1y : std_logic;
  signal g2y : std_logic;

  constant clk_period : time := 10 ns;

begin

  uut : entity ttl.sn74153(rtl)
    port map (
      sela   => sela,
      selb   => selb,
      enb1_n => enb1_n,
      g1c0   => g1c0,
      g1c1   => g1c1,
      g1c2   => g1c2,
      g1c3   => g1c3,
      g1y    => g1y,
      enb2_n => enb2_n,
      g2c0   => g2c0,
      g2c1   => g2c1,
      g2c2   => g2c2,
      g2c3   => g2c3,
      g2y    => g2y
      );

  stim_proc : process
  begin
    -- Test MUX 1
    enb1_n <= '0';
    enb2_n <= '1'; -- Disable MUX2

    g1c0 <= '1'; g1c1 <= '0'; g1c2 <= '0'; g1c3 <= '0';
    sela <= '0'; selb <= '0'; wait for clk_period;
    assert (g1y = '1') report "MUX1 sel 00 failed" severity error;
    assert (g2y = '0') report "MUX2 disabled failed" severity error;

    g1c0 <= '0'; g1c1 <= '1'; g1c2 <= '0'; g1c3 <= '0';
    sela <= '1'; selb <= '0'; wait for clk_period;
    assert (g1y = '1') report "MUX1 sel 01 failed" severity error;

    g1c0 <= '0'; g1c1 <= '0'; g1c2 <= '1'; g1c3 <= '0';
    sela <= '0'; selb <= '1'; wait for clk_period;
    assert (g1y = '1') report "MUX1 sel 10 failed" severity error;

    g1c0 <= '0'; g1c1 <= '0'; g1c2 <= '0'; g1c3 <= '1';
    sela <= '1'; selb <= '1'; wait for clk_period;
    assert (g1y = '1') report "MUX1 sel 11 failed" severity error;

    -- Test MUX 2
    enb1_n <= '1'; -- Disable MUX1
    enb2_n <= '0';

    g2c0 <= '1'; g2c1 <= '0'; g2c2 <= '0'; g2c3 <= '0';
    sela <= '0'; selb <= '0'; wait for clk_period;
    assert (g2y = '1') report "MUX2 sel 00 failed" severity error;
    assert (g1y = '0') report "MUX1 disabled failed" severity error;

    g2c0 <= '0'; g2c1 <= '1'; g2c2 <= '0'; g2c3 <= '0';
    sela <= '1'; selb <= '0'; wait for clk_period;
    assert (g2y = '1') report "MUX2 sel 01 failed" severity error;

    g2c0 <= '0'; g2c1 <= '0'; g2c2 <= '1'; g2c3 <= '0';
    sela <= '0'; selb <= '1'; wait for clk_period;
    assert (g2y = '1') report "MUX2 sel 10 failed" severity error;

    g2c0 <= '0'; g2c1 <= '0'; g2c2 <= '0'; g2c3 <= '1';
    sela <= '1'; selb <= '1'; wait for clk_period;
    assert (g2y = '1') report "MUX2 sel 11 failed" severity error;

    -- Test enable high
    enb1_n <= '1';
    enb2_n <= '1';
    wait for clk_period;
    assert (g1y = '0') report "MUX1 enable high failed" severity error;
    assert (g2y = '0') report "MUX2 enable high failed" severity error;

    report "Testbench finished.";
    wait;
  end process;

end architecture; 