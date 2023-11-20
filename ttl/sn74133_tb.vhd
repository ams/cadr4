library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74133_tb is
end;

architecture testbench of sn74133_tb is

  signal a, b, c, d, e, f, g, h, i, j, k, l, m : std_logic;
  signal q_n                                   : std_logic;

begin

  uut : sn74133 port map(
    a   => a, b => b, c => c, d => d, e => e, f => f, g => g, h => h, i => i, j => j, k => k, l => l, m => m,
    q_n => q_n
    );

  process

    type pt is record
      i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12 : std_logic;
      q                                                     : std_logic;
    end record;
    type pa is array (natural range <>) of pt;

    constant p : pa :=
      (('0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1'),
       ('0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1'),
       -- ...
       ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0'));

  begin
    for ii in p'range loop
      a <= p(ii).i0;
      b <= p(ii).i1;
      c <= p(ii).i2;
      d <= p(ii).i3;
      e <= p(ii).i4;
      f <= p(ii).i5;
      g <= p(ii).i6;
      h <= p(ii).i7;
      i <= p(ii).i8;
      j <= p(ii).i9;
      k <= p(ii).i10;
      l <= p(ii).i11;
      m <= p(ii).i12;

      wait for 1 ns;

      assert q_n = p(ii).q;
    end loop;

    wait;
  end process;

end;
