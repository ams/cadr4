library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74138_tb is
end;

architecture testbench of sn74138_tb is

  signal nY   : std_logic_vector (7 downto 0);
  signal SEL  : std_logic_vector (2 downto 0);

  signal nCE0 : std_logic;
  signal nCE1 : std_logic;
  signal  CE2 : std_logic;

begin

  uut : sn74138 port map(
    SEL   => SEL,
    nY    => nY,
    nCE0  => nCE0,
    nCE1  => nCE1,
    CE2   => CE2
    );

  process
  begin
    nCE0 <= '0';
    nCE1 <= '0';
    CE2 <= '1';
    SEL <= "000";
    wait for 5 ns;
    assert nY = x"FE" report "ERROR: sel 0" severity error;

    SEL <= "111";
    wait for 5 ns;
    assert nY(7) = '0' report "ERROR: sel 7" severity error;

    SEL <= "101";
    wait for 5 ns;
    assert nY(5) = '0' report "ERROR: sel 5" severity error;

    CE2 <= '0';
    wait for 5 ns;
    assert nY = x"FF" report "ERROR: disable CE2" severity error;

    CE2 <= '1';
    nCE1 <= '1';
    wait for 5 ns;
    assert nY = x"FF" report "ERROR: disable nCE1" severity error;

    nCE1 <= '0';
    nCE0 <= '1';
    wait for 5 ns;
    assert nY = x"FF" report "ERROR: disable nCE0" severity error;
    wait;
  end process;

end;
