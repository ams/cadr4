library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity sn74283_tb is
end;

architecture testbench of sn74283_tb is

  signal ci : std_logic;
  signal b0 : std_logic;
  signal b1 : std_logic;
  signal b2 : std_logic;
  signal b3 : std_logic;
  signal s0 : std_logic;
  signal s1 : std_logic;
  signal s2 : std_logic;
  signal s3 : std_logic;
  signal a0 : std_logic;
  signal a1 : std_logic;
  signal a2 : std_logic;
  signal a3 : std_logic;
  signal co : std_logic;

begin

  uut : sn74283 port map(
    ci => ci,

    a3 => a3,
    a2 => a2,
    a1 => a1,
    a0 => a0,

    s3 => s3,
    s2 => s2,
    s1 => s1,
    s0 => s0,

    b3 => b3,
    b2 => b2,
    b1 => b1,
    b0 => b0,

    co => co
    );

  process
    variable f : std_logic_vector(3 downto 0);
  begin
    -- 3 + 5 = 8
    ci <= '0';
    a3 <= '0'; a2 <= '0'; a1 <= '1'; a0 <= '1';
    b3 <= '0'; b2 <= '1'; b1 <= '0'; b0 <= '1';
    wait for 1 ns;
    f := s3 & s2 & s1 & s0;
    assert f = "1000" and co = '0';

    -- 15 + 1 = 16
    a3 <= '1'; a2 <= '1'; a1 <= '1'; a0 <= '1';
    b3 <= '0'; b2 <= '0'; b1 <= '0'; b0 <= '1';
    wait for 1 ns;
    f := s3 & s2 & s1 & s0;
    assert f = "0000" and co = '1';

    -- 6 + 7 + carry
    ci <= '1';
    a3 <= '0'; a2 <= '1'; a1 <= '1'; a0 <= '0';
    b3 <= '0'; b2 <= '1'; b1 <= '1'; b0 <= '1';
    wait for 1 ns;
    f := s3 & s2 & s1 & s0;
    assert f = "1110" and co = '0';

    -- Test X-state propagation: X input should produce X outputs
    ci <= '0';
    a3 <= 'X'; a2 <= '1'; a1 <= '1'; a0 <= '0';  -- X in a3
    b3 <= '0'; b2 <= '1'; b1 <= '1'; b0 <= '1';
    wait for 1 ns;
    f := s3 & s2 & s1 & s0;
    assert f = "XXXX" and co = 'X' report "X-state test failed: expected all X outputs";

    wait;
  end process;

end;
