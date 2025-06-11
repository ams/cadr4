library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity sn74374_tb is
end;

architecture testbench of sn74374_tb is

  signal oenb_n : std_logic;
  signal clk    : std_logic;
  signal o7     : std_logic;
  signal o6     : std_logic;
  signal o5     : std_logic;
  signal o4     : std_logic;
  signal o3     : std_logic;
  signal o2     : std_logic;
  signal o1     : std_logic;
  signal o0     : std_logic;
  signal i7     : std_logic;
  signal i6     : std_logic;
  signal i5     : std_logic;
  signal i4     : std_logic;
  signal i3     : std_logic;
  signal i2     : std_logic;
  signal i1     : std_logic;
  signal i0     : std_logic;

begin

  uut : sn74374 port map(
    i0     => i0,
    i1     => i1,
    i2     => i2,
    i3     => i3,
    i4     => i4,
    i5     => i5,
    i6     => i6,
    i7     => i7,
    o0     => o0,
    o1     => o1,
    o2     => o2,
    o3     => o3,
    o4     => o4,
    o5     => o5,
    o6     => o6,
    o7     => o7,
    clk    => clk,
    oenb_n => oenb_n
    );

  process
  begin
    clk <= '0';
    oenb_n <= '1';

    -- load first value
    i0 <= '0'; i1 <= '1'; i2 <= '0'; i3 <= '1';
    i4 <= '0'; i5 <= '1'; i6 <= '0'; i7 <= '1';
    wait for 1 ns;
    clk <= '1'; wait for 1 ns; clk <= '0';
    wait for 1 ns;

    oenb_n <= '0';
    wait for 1 ns;
    assert (o7 & o6 & o5 & o4 & o3 & o2 & o1 & o0) = "10101010";

    -- load second value
    oenb_n <= '1';
    i0 <= '1'; i1 <= '0'; i2 <= '1'; i3 <= '0';
    i4 <= '1'; i5 <= '0'; i6 <= '1'; i7 <= '0';
    clk <= '1'; wait for 1 ns; clk <= '0';

    oenb_n <= '0';
    wait for 1 ns;
    assert (o7 & o6 & o5 & o4 & o3 & o2 & o1 & o0) = "01010101";

    -- outputs disabled
    oenb_n <= '1';
    wait for 1 ns;
    assert o0 = 'Z' and o1 = 'Z' and o2 = 'Z' and o3 = 'Z' and
           o4 = 'Z' and o5 = 'Z' and o6 = 'Z' and o7 = 'Z';

    wait;
  end process;

end;
