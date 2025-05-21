library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.misc.all;

entity timedelay_tb is
end;

architecture testbench of timedelay_tb is

  signal input   : std_logic;
  signal delayed : std_logic_vector(4 downto 0);

begin

  uut : timedelay port map(
    input   => input,
    delayed => delayed
    );

  stimulus : process
  begin
    input <= '0';
    wait for 10 ns;
    input <= '1';

    wait for 50 ns;                     -- 10 ns + 50 ns = 60 ns
    assert delayed(0) = '1';
    assert delayed(1) = '0';
    assert delayed(2) = '0';
    assert delayed(3) = '0';
    assert delayed(4) = '0';

    wait for 10 ns;                     -- 70 ns
    assert delayed(1) = '1';

    wait for 10 ns;                     -- 80 ns
    assert delayed(2) = '1';

    wait for 10 ns;                     -- 90 ns
    assert delayed(3) = '1';

    wait for 10 ns;                     -- 100 ns
    assert delayed(4) = '1';

    wait for 20 ns;                     -- 120 ns
    input <= '0';

    wait for 50 ns;                     -- 170 ns
    assert delayed(0) = '0';

    wait for 10 ns;                     -- 180 ns
    assert delayed(1) = '0';

    wait for 10 ns;                     -- 190 ns
    assert delayed(2) = '0';

    wait for 10 ns;                     -- 200 ns
    assert delayed(3) = '0';

    wait for 10 ns;                     -- 210 ns
    assert delayed(4) = '0';

    wait;
  end process;

end;
