library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74139_tb is
end;

architecture testbench of sn74139_tb is
    signal SEL  : std_logic_vector (1 downto 0);
    signal nENB : std_logic;
    signal nY   : std_logic_vector (3 downto 0);
begin

  uut : sn74139 port map(SEL => SEL, nENB => nENB, nY => nY
    );

  process
  begin
    nENB <= '0';
    SEL <= "00";
    wait for 5 ns;
    assert nY = "1110" report "ERROR: sel 0" severity error;

    SEL <= "01";
    wait for 5 ns;
    assert nY = "1101" report "ERROR: sel 1" severity error;

    SEL <= "10";
    wait for 5 ns;
    assert nY = "1011" report "ERROR: sel 2" severity error;

    SEL <= "11";
    wait for 5 ns;
    assert nY = "0111" report "ERROR: sel 3" severity error;

    nENB <= '1';
    wait for 5 ns;
    assert nY = "1111" report "ERROR: nENB" severity error;

    wait;
  end process;

end;
