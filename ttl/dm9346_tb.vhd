library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.other.all;

entity dm9346_tb is
end;

architecture testbench of dm9346_tb is

  signal a5  : std_logic;
  signal a4  : std_logic;
  signal a3  : std_logic;
  signal a2  : std_logic;
  signal a1  : std_logic;
  signal a0  : std_logic;
  signal b5  : std_logic;
  signal b4  : std_logic;
  signal b3  : std_logic;
  signal b2  : std_logic;
  signal b1  : std_logic;
  signal b0  : std_logic;
  signal enb : std_logic;
  signal eq  : std_logic;

begin

  uut : dm9346 port map(
    a5  => a5,
    a4  => a4,
    a3  => a3,
    a2  => a2,
    a1  => a1,
    a0  => a0,
    b5  => b5,
    b4  => b4,
    b3  => b3,
    b2  => b2,
    b1  => b1,
    b0  => b0,
    enb => enb,
    eq  => eq
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
