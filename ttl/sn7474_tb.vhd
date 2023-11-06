library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn7474_tb is
end;

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
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
