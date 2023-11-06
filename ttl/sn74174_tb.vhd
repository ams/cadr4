library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74174_tb is
end;

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
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
