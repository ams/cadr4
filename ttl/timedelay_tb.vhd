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
    wait for 1 ps;                      -- small delta delay
    assert delayed(0) = '1' report "delayed(0) should be 1 but is " & std_logic'image(delayed(0));
    assert delayed(1) = '0' report "delayed(1) should be 0 but is " & std_logic'image(delayed(1));
    assert delayed(2) = '0' report "delayed(2) should be 0 but is " & std_logic'image(delayed(2));
    assert delayed(3) = '0' report "delayed(3) should be 0 but is " & std_logic'image(delayed(3));
    assert delayed(4) = '0' report "delayed(4) should be 0 but is " & std_logic'image(delayed(4));

    wait for 10 ns;                     -- 70 ns
    assert delayed(1) = '1';

    wait for 10 ns;                     -- 80 ns
    assert delayed(2) = '1';

    wait for 10 ns;                     -- 90 ns
    assert delayed(3) = '1';

    wait for 10 ns;                     -- 100 ns
    assert delayed(4) = '1';

    wait for 20 ns;                     -- 110 ns
    input <= '0';

    wait for 50 ns;                     -- 160 ns
    assert delayed(0) = '0';

    wait for 10 ns;                     -- 170 ns
    assert delayed(1) = '0';

    wait for 10 ns;                     -- 180 ns
    assert delayed(2) = '0';

    wait for 10 ns;                     -- 190 ns
    assert delayed(3) = '0';

    wait for 10 ns;                     -- 200 ns
    assert delayed(4) = '0';

    wait;
  end process;

end;
