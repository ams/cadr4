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
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
