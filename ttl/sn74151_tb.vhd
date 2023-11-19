library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74151_tb is
end;

architecture testbench of sn74151_tb is

  signal ce_n : std_logic;
  signal sel  : std_logic_vector(0 to 2);
  signal i    : std_logic_vector(0 to 7);

  signal q, q_n : std_logic;

begin

  uut : sn74151 port map(
    ce_n => ce_n,
    sel0 => sel(0), sel1 => sel(1), sel2 => sel(2),
    i0   => i(0), i1 => i(1), i2 => i(2), i3 => i(3), i4 => i(4), i5 => i(5), i6 => i(6), i7 => i(7),
    q    => q, q_n => q_n
    );

  process
    procedure x(xce_n    : std_logic;
                xsel     : std_logic_vector(0 to 2);
                xi       : std_logic_vector(0 to 7);
                expected : std_logic) is
    begin

      wait for 5 ns;
      ce_n <= xce_n; sel <= xsel; i <= xi;
      wait for 5 ns;
      assert q = expected and q_n = not expected;

    end procedure;

  begin
    wait for 5 ns;

    x('0', "000", "10000000", '1');
    x('0', "001", "01000000", '1');
    x('0', "010", "00100000", '1');
    x('0', "011", "00010000", '1');
    x('0', "100", "00001000", '1');
    x('0', "101", "00000100", '1');
    x('0', "110", "00000010", '1');
    x('0', "111", "00000001", '1');

    x('0', "000", "01111111", '0');
    x('0', "001", "10111111", '0');
    x('0', "010", "11011111", '0');
    x('0', "011", "11101111", '0');
    x('0', "100", "11110111", '0');
    x('0', "101", "11111011", '0');
    x('0', "110", "11111101", '0');
    x('0', "111", "11111110", '0');

    x('1', "111", "00000001", 'X');

    wait;
  end process;

end;
