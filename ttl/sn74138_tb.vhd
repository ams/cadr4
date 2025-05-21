library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ttl;
use ttl.sn74.all;

entity sn74138_tb is
end;

architecture testbench of sn74138_tb is

  signal y0  : std_logic;
  signal y1  : std_logic;
  signal y2  : std_logic;
  signal y3  : std_logic;
  signal y4  : std_logic;
  signal y5  : std_logic;
  signal y6  : std_logic;
  signal y7  : std_logic;
  signal g1  : std_logic;
  signal g2b : std_logic;
  signal g2a : std_logic;
  signal c   : std_logic;
  signal b   : std_logic;
  signal a   : std_logic;

begin

  uut : sn74138 port map(
    a   => a,
    b   => b,
    c   => c,
    g2a => g2a,
    g2b => g2b,
    g1  => g1,
    y7  => y7,
    y6  => y6,
    y5  => y5,
    y4  => y4,
    y3  => y3,
    y2  => y2,
    y1  => y1,
    y0  => y0
    );

  process
    variable sel : unsigned(2 downto 0);
    variable exp : std_logic_vector(7 downto 0);
  begin
    g1  <= '1';
    g2a <= '0';
    g2b <= '0';

    for i in 0 to 7 loop
      sel := to_unsigned(i, 3);
      a <= sel(2); b <= sel(1); c <= sel(0);
      wait for 1 ns;

      exp := (others => '1');
      exp(7 - i) := '0';
      assert (y7 & y6 & y5 & y4 & y3 & y2 & y1 & y0) = exp;
    end loop;

    -- disabled outputs when g1 is low
    g1 <= '0';
    wait for 1 ns;
    exp := (others => '1');
    assert (y7 & y6 & y5 & y4 & y3 & y2 & y1 & y0) = exp;

    wait;
  end process;

end;
