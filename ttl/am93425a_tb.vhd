library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.other.all;

entity am93425a_tb is
end;

architecture testbench of am93425a_tb is

  signal a0   : std_logic;
  signal a1   : std_logic;
  signal a2   : std_logic;
  signal a3   : std_logic;
  signal a4   : std_logic;
  signal a5   : std_logic;
  signal a6   : std_logic;
  signal a7   : std_logic;
  signal a8   : std_logic;
  signal a9   : std_logic;
  signal ce_n : std_logic;
  signal we_n : std_logic;
  signal di   : std_logic;
  signal do   : std_logic;

begin

  uut : am93425a port map(
    a0   => a0,
    a1   => a1,
    a2   => a2,
    a3   => a3,
    a4   => a4,
    a5   => a5,
    a6   => a6,
    a7   => a7,
    a8   => a8,
    a9   => a9,
    ce_n => ce_n,
    we_n => we_n,
    di   => di,
    do   => do
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
