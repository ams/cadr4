library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.sn74.all;

entity sn74139_tb is
end entity;

architecture testbench of sn74139_tb is

  signal g2e_n : std_logic;
  signal g2s0  : std_logic;
  signal g2s1  : std_logic;
  signal g2y0  : std_logic;
  signal g2y1  : std_logic;
  signal g2y2  : std_logic;
  signal g2y3  : std_logic;
  signal g1y3  : std_logic;
  signal g1y2  : std_logic;
  signal g1y1  : std_logic;
  signal g1y0  : std_logic;
  signal g1s1  : std_logic;
  signal g1s0  : std_logic;
  signal g1e_n : std_logic;

begin

  uut : sn74139 port map(
    g1e_n => g1e_n,
    g1s0  => g1s0,
    g1s1  => g1s1,
    g1y0  => g1y0,
    g1y1  => g1y1,
    g1y2  => g1y2,
    g1y3  => g1y3,
    g2y3  => g2y3,
    g2y2  => g2y2,
    g2y1  => g2y1,
    g2y0  => g2y0,
    g2e_n => g2e_n,
    g2s0  => g2s0,
    g2s1  => g2s1
    );

  process
    variable sel : unsigned(1 downto 0);
    variable exp : std_logic_vector(3 downto 0);
  begin
    -- initialize inputs
    g1e_n <= '1'; g2e_n <= '1';
    g1s0 <= '0'; g1s1 <= '0';
    g2s0 <= '0'; g2s1 <= '0';
    wait for 1 ns;

    -- test first decoder
    g2e_n <= '1';
    for i in 0 to 3 loop
      sel := to_unsigned(i, 2);
      g1s1 <= sel(1); g1s0 <= sel(0); g1e_n <= '0';
      wait for 1 ns;
      exp := (others => '1');
      exp(3 - i) := '0';
      assert (g1y0 & g1y1 & g1y2 & g1y3) = exp;
      exp := "1111";
      assert (g2y3 & g2y2 & g2y1 & g2y0) = exp;
    end loop;
    g1e_n <= '1';
    wait for 1 ns;
    exp := "1111";
    assert (g1y0 & g1y1 & g1y2 & g1y3) = exp;

    -- test second decoder
    g1e_n <= '1';
    for i in 0 to 3 loop
      sel := to_unsigned(i, 2);
      g2s1 <= sel(1); g2s0 <= sel(0); g2e_n <= '0';
      wait for 1 ns;
      exp := (others => '1');
      exp(i) := '0';
      assert (g2y3 & g2y2 & g2y1 & g2y0) = exp;
      exp := "1111";
      assert (g1y0 & g1y1 & g1y2 & g1y3) = exp;
    end loop;
    g2e_n <= '1';
    wait for 1 ns;
    exp := "1111";
    assert (g2y3 & g2y2 & g2y1 & g2y0) = exp;

    wait;
  end process;

end architecture;
