library ieee;
use ieee.std_logic_1164.all;

use work.fairchild.dm93425a;

entity dm93425a_tb is
end;

architecture testbench of dm93425a_tb is

  -- Initialize signals to avoid metavalue assertions from ieee.numeric_std
  signal a0   : std_logic := '0';
  signal a1   : std_logic := '0';
  signal a2   : std_logic := '0';
  signal a3   : std_logic := '0';
  signal a4   : std_logic := '0';
  signal a5   : std_logic := '0';
  signal a6   : std_logic := '0';
  signal a7   : std_logic := '0';
  signal a8   : std_logic := '0';
  signal a9   : std_logic := '0';
  signal ce_n : std_logic := '0';
  signal we_n : std_logic := '0';
  signal di   : std_logic := '0';
  signal do   : std_logic := '0';

begin

  uut : dm93425a port map(
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
    -- write 1 to address 0
    ce_n <= '0';
    we_n <= '0';
    di   <= '1';
    a0 <= '0'; a1 <= '0'; a2 <= '0'; a3 <= '0'; a4 <= '0';
    a5 <= '0'; a6 <= '0'; a7 <= '0'; a8 <= '0'; a9 <= '0';
    wait for 1 ns;

    -- read back
    we_n <= '1';
    wait for 1 ns;
    assert do = '1';

    -- write 0 to address 1
    we_n <= '0'; di <= '0'; a0 <= '1';
    wait for 1 ns;

    -- read back
    we_n <= '1';
    wait for 1 ns;
    assert do = '0';

    -- chip disabled
    ce_n <= '1';
    wait for 1 ns;
    assert do = 'Z';

    wait;
  end process;

end;
