library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74472_tb is
end;

architecture testbench of sn74472_tb is

  signal a8   : std_logic;
  signal a7   : std_logic;
  signal a6   : std_logic;
  signal a5   : std_logic;
  signal ce_n : std_logic;
  signal d7   : std_logic;
  signal d6   : std_logic;
  signal d5   : std_logic;
  signal d4   : std_logic;
  signal d3   : std_logic;
  signal d2   : std_logic;
  signal d1   : std_logic;
  signal d0   : std_logic;
  signal a4   : std_logic;
  signal a3   : std_logic;
  signal a2   : std_logic;
  signal a1   : std_logic;
  signal a0   : std_logic;

begin

  uut : sn74472 port map(
    a0   => a0,
    a1   => a1,
    a2   => a2,
    a3   => a3,
    a4   => a4,
    d0   => d0,
    d1   => d1,
    d2   => d2,
    d3   => d3,
    d4   => d4,
    d5   => d5,
    d6   => d6,
    d7   => d7,
    ce_n => ce_n,
    a5   => a5,
    a6   => a6,
    a7   => a7,
    a8   => a8
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
