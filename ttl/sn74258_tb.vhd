library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity sn74258_tb is
end;

architecture testbench of sn74258_tb is

  signal enb_n : std_logic;
  signal sel   : std_logic;
  signal dy    : std_logic;
  signal d1    : std_logic;
  signal d0    : std_logic;
  signal cy    : std_logic;
  signal c1    : std_logic;
  signal c0    : std_logic;
  signal by    : std_logic;
  signal b1    : std_logic;
  signal b0    : std_logic;
  signal ay    : std_logic;
  signal a1    : std_logic;
  signal a0    : std_logic;

begin

  uut : sn74258 port map(
    a0    => a0,
    a1    => a1,
    ay    => ay,
    b0    => b0,
    b1    => b1,
    by    => by,
    c0    => c0,
    c1    => c1,
    cy    => cy,
    d0    => d0,
    d1    => d1,
    dy    => dy,
    sel   => sel,
    enb_n => enb_n
    );

  process
  begin
    -- outputs should be high impedance when disabled
    enb_n <= '1'; sel <= '0';
    a0 <= '1'; a1 <= '0';
    b0 <= '0'; b1 <= '1';
    c0 <= '1'; c1 <= '0';
    d0 <= '0'; d1 <= '1';
    wait for 1 ns;
    assert ay = 'Z' and by = 'Z' and cy = 'Z' and dy = 'Z';

    -- select input 0 (outputs are inverted)
    enb_n <= '0'; sel <= '0';
    a0 <= '0'; b0 <= '1'; c0 <= '0'; d0 <= '1';
    wait for 1 ns;
    assert ay = (not a0) and by = (not b0) and cy = (not c0) and dy = (not d0);

    -- select input 1 (outputs are inverted)
    sel <= '1';
    a1 <= '1'; b1 <= '0'; c1 <= '1'; d1 <= '0';
    wait for 1 ns;
    assert ay = (not a1) and by = (not b1) and cy = (not c1) and dy = (not d1);

    wait;
  end process;

end;
