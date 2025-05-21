library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74181_tb is
end;

architecture testbench of sn74181_tb is

  signal cin_n  : std_logic;
  signal s0     : std_logic;
  signal s1     : std_logic;
  signal s2     : std_logic;
  signal s3     : std_logic;
  signal m      : std_logic;
  signal a0     : std_logic;
  signal a1     : std_logic;
  signal a2     : std_logic;
  signal a3     : std_logic;
  signal b0     : std_logic;
  signal b1     : std_logic;
  signal b2     : std_logic;
  signal b3     : std_logic;
  signal f0     : std_logic;
  signal f1     : std_logic;
  signal f2     : std_logic;
  signal f3     : std_logic;
  signal aeb    : std_logic;
  signal x      : std_logic;
  signal y      : std_logic;
  signal cout_n : std_logic;

begin

  uut : sn74181 port map(
    cout_n => cout_n,
    y      => y,
    x      => x,
    aeb    => aeb,

    f3 => f3,
    f2 => f2,
    f1 => f1,
    f0 => f0,

    b3 => b3,
    b2 => b2,
    b1 => b1,
    b0 => b0,

    a3 => a3,
    a2 => a2,
    a1 => a1,
    a0 => a0,

    m  => m,
    s3 => s3,
    s2 => s2,
    s1 => s1,
    s0 => s0,

    cin_n => cin_n
    );

  process
    variable f : std_logic_vector(3 downto 0);
  begin
    -- arithmetic mode
    m <= '0'; cin_n <= '1';
    a3 <= '0'; a2 <= '0'; a1 <= '1'; a0 <= '1'; -- 3
    b3 <= '0'; b2 <= '1'; b1 <= '0'; b0 <= '1'; -- 5
    wait for 1 ns;
    f := f3 & f2 & f1 & f0;
    assert f = "1000" and cout_n = '1';

    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- 5
    b3 <= '0'; b2 <= '1'; b1 <= '0'; b0 <= '1'; -- 5
    wait for 1 ns;
    f := f3 & f2 & f1 & f0;
    assert f = "1010" and cout_n = '1' and aeb = '1';

    -- logic mode tests
    m <= '1';
    a3 <= '1'; a2 <= '1'; a1 <= '0'; a0 <= '0'; -- 12
    b3 <= '1'; b2 <= '0'; b1 <= '1'; b0 <= '0'; -- 10
    cin_n <= '1';

    s3 <= '0'; s2 <= '0'; s1 <= '0'; s0 <= '0';
    wait for 1 ns; assert (f3 & f2 & f1 & f0) = "1000";

    s3 <= '0'; s2 <= '0'; s1 <= '0'; s0 <= '1';
    wait for 1 ns; assert (f3 & f2 & f1 & f0) = "1110";

    s3 <= '0'; s2 <= '0'; s1 <= '1'; s0 <= '0';
    wait for 1 ns; assert (f3 & f2 & f1 & f0) = "0110";

    s3 <= '0'; s2 <= '0'; s1 <= '1'; s0 <= '1';
    wait for 1 ns; assert (f3 & f2 & f1 & f0) = "1001";

    wait;
  end process;

end;
