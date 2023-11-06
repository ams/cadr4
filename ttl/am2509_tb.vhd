library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.other.all;

entity am2509_tb is
end;

architecture testbench of am2509_tb is

  signal clk : std_logic;
  signal sel : std_logic;
  signal dq  : std_logic;
  signal d1  : std_logic;
  signal d0  : std_logic;
  signal cq  : std_logic;
  signal c1  : std_logic;
  signal c0  : std_logic;
  signal bq  : std_logic;
  signal b1  : std_logic;
  signal b0  : std_logic;
  signal aq  : std_logic;
  signal a1  : std_logic;
  signal a0  : std_logic;

begin

  uut : am2509 port map(
    a0  => a0,
    a1  => a1,
    aq  => aq,
    b0  => b0,
    b1  => b1,
    bq  => bq,
    c0  => c0,
    c1  => c1,
    cq  => cq,
    d0  => d0,
    d1  => d1,
    dq  => dq,
    sel => sel,
    clk => clk
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
