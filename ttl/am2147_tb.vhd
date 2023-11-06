library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.other.all;

entity am2147_tb is
end;

architecture testbench of am2147_tb is

  signal a6   : std_logic;
  signal a7   : std_logic;
  signal a8   : std_logic;
  signal a9   : std_logic;
  signal a10  : std_logic;
  signal a11  : std_logic;
  signal di   : std_logic;
  signal ce_n : std_logic;
  signal we_n : std_logic;
  signal do   : std_logic;
  signal a5   : std_logic;
  signal a4   : std_logic;
  signal a3   : std_logic;
  signal a2   : std_logic;
  signal a1   : std_logic;
  signal a0   : std_logic;

begin

  uut : am2147 port map(
    a0   => a0,
    a1   => a1,
    a2   => a2,
    a3   => a3,
    a4   => a4,
    a5   => a5,
    do   => do,
    we_n => we_n,
    ce_n => ce_n,
    di   => di,
    a11  => a11,
    a10  => a10,
    a9   => a9,
    a8   => a8,
    a7   => a7,
    a6   => a6
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
