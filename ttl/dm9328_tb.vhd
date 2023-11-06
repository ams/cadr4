library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.other.all;

entity dm9328_tb is
end;

architecture testbench of dm9328_tb is

  signal clr_n  : std_logic;
  signal aq_n   : std_logic;
  signal aq     : std_logic;
  signal asel   : std_logic;
  signal ai1    : std_logic;
  signal ai0    : std_logic;
  signal aclk   : std_logic;
  signal comclk : std_logic;
  signal bclk   : std_logic;
  signal bi0    : std_logic;
  signal bi1    : std_logic;
  signal bsel   : std_logic;
  signal bq     : std_logic;
  signal bq_n   : std_logic;

begin

  uut : dm9328 port map(
    clr_n  => clr_n,
    aq_n   => aq_n,
    aq     => aq,
    asel   => asel,
    ai1    => ai1,
    ai0    => ai0,
    aclk   => aclk,
    comclk => comclk,
    bclk   => bclk,
    bi0    => bi0,
    bi1    => bi1,
    bsel   => bsel,
    bq     => bq,
    bq_n   => bq_n
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
