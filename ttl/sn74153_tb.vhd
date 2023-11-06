library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74153_tb is
end;

architecture testbench of sn74153_tb is

  signal enb2_n : std_logic;
  signal sel0   : std_logic;
  signal g2c3   : std_logic;
  signal g2c2   : std_logic;
  signal g2c1   : std_logic;
  signal g2c0   : std_logic;
  signal g2q    : std_logic;
  signal g1q    : std_logic;
  signal g1c0   : std_logic;
  signal g1c1   : std_logic;
  signal g1c2   : std_logic;
  signal g1c3   : std_logic;
  signal sel1   : std_logic;
  signal enb1_n : std_logic;

begin

  uut : sn74153 port map(
    enb1_n => enb1_n,
    sel1   => sel1,
    g1c3   => g1c3,
    g1c2   => g1c2,
    g1c1   => g1c1,
    g1c0   => g1c0,
    g1q    => g1q,
    g2q    => g2q,
    g2c0   => g2c0,
    g2c1   => g2c1,
    g2c2   => g2c2,
    g2c3   => g2c3,
    sel0   => sel0,
    enb2_n => enb2_n
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
