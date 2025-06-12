library ieee;
use ieee.std_logic_1164.all;



entity ff_jk_tb is
end;

architecture testbench of ff_jk_tb is

  signal q_n : std_logic;
  signal q   : std_logic;
  signal k   : std_logic;
  signal j   : std_logic;
  signal clk : std_logic;

begin

  uut : entity work.ff_jk port map(
    clk => clk,
    j   => j,
    k   => k,
    q   => q,
    q_n => q_n
    );

  process
  begin
    clk <= '0';

    -- clear to 0 using JK=01
    j <= '0'; k <= '1';
    clk <= '1'; wait for 1 ns; clk <= '0';
    wait for 1 ns;
    assert q = '0' and q_n = '1';

    -- set to 1 using JK=10
    j <= '1'; k <= '0';
    clk <= '1'; wait for 1 ns; clk <= '0';
    wait for 1 ns;
    assert q = '1' and q_n = '0';

    -- reset to 0 using JK=01
    j <= '0'; k <= '1';
    clk <= '1'; wait for 1 ns; clk <= '0';
    wait for 1 ns;
    assert q = '0' and q_n = '1';

    -- toggle using JK=11
    j <= '1'; k <= '1';
    clk <= '1'; wait for 1 ns; clk <= '0';
    wait for 1 ns;
    assert q = '1' and q_n = '0';

    wait;
  end process;

end;
