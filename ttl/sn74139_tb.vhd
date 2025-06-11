library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.sn74.all;

entity sn74139_tb is
end;

architecture testbench of sn74139_tb is

  signal g2   : std_logic;
  signal a2   : std_logic;
  signal b2   : std_logic;
  signal g2y0 : std_logic;
  signal g2y1 : std_logic;
  signal g2y2 : std_logic;
  signal g2y3 : std_logic;
  signal g1y3 : std_logic;
  signal g1y2 : std_logic;
  signal g1y1 : std_logic;
  signal g1y0 : std_logic;
  signal b1   : std_logic;
  signal a1   : std_logic;
  signal g1   : std_logic;

begin

  uut : sn74139 port map(
    g1   => g1,
    a1   => a1,
    b1   => b1,
    g1y0 => g1y0,
    g1y1 => g1y1,
    g1y2 => g1y2,
    g1y3 => g1y3,
    g2y3 => g2y3,
    g2y2 => g2y2,
    g2y1 => g2y1,
    g2y0 => g2y0,
    b2   => b2,
    a2   => a2,
    g2   => g2
    );

  process
    variable sel : unsigned(1 downto 0);
    variable exp : std_logic_vector(3 downto 0);
  begin
    -- initialize inputs
    g1 <= '1'; g2 <= '1';
    a1 <= '0'; b1 <= '0';
    a2 <= '0'; b2 <= '0';
    wait for 1 ns;

    -- test first decoder
    g2 <= '1';
    for i in 0 to 3 loop
      sel := to_unsigned(i, 2);
      a1 <= sel(1); b1 <= sel(0); g1 <= '0';
      wait for 1 ns;
      exp := (others => '1');
      exp(3 - i) := '0';
      assert (g1y0 & g1y1 & g1y2 & g1y3) = exp;
      exp := "1111";
      assert (g2y3 & g2y2 & g2y1 & g2y0) = exp;
    end loop;
    g1 <= '1';
    wait for 1 ns;
    exp := "1111";
    assert (g1y0 & g1y1 & g1y2 & g1y3) = exp;

    -- test second decoder
    g1 <= '1';
    for i in 0 to 3 loop
      sel := to_unsigned(i, 2);
      a2 <= sel(1); b2 <= sel(0); g2 <= '0';
      wait for 1 ns;
      exp := (others => '1');
      exp(i) := '0';
      assert (g2y3 & g2y2 & g2y1 & g2y0) = exp;
      exp := "1111";
      assert (g1y0 & g1y1 & g1y2 & g1y3) = exp;
    end loop;
    g2 <= '1';
    wait for 1 ns;
    exp := "1111";
    assert (g2y3 & g2y2 & g2y1 & g2y0) = exp;

    wait;
  end process;

end architecture testbench;
