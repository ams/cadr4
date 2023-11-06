library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.other.all;

entity td250_tb is
end;

architecture testbench of td250_tb is

  signal o_250ns : std_logic;
  signal o_200ns : std_logic;
  signal o_150ns : std_logic;
  signal o_100ns : std_logic;
  signal o_50ns  : std_logic;
  signal input   : std_logic;

begin

  uut : td250 port map(
    input   => input,
    o_50ns  => o_50ns,
    o_100ns => o_100ns,
    o_150ns => o_150ns,
    o_200ns => o_200ns,
    o_250ns => o_250ns
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
