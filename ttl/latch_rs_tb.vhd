-- Set/Reset latch

library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.misc.all;

entity latch_rs_tb is
end;

architecture testbench of latch_rs_tb is

  signal s_n, r_n : std_logic;
  signal q, q_n   : std_logic;

begin

  uut : latch_rs port map(
    r_n => r_n, s_n => s_n,
    q   => q, q_n => q_n
    );

  process

    type pt is record
      r_n, s_n : std_logic;
      q, q_n   : std_logic;
    end record;
    type pa is array (natural range <>) of pt;

    constant p : pa :=
      (('0', '0', '1', '1'),            -- Disallowed
       ('0', '0', '1', '1'),            -- Disallowed

       ('0', '1', '1', '0'),            -- Set
       ('1', '1', '1', '0'),            -- Hold
       ('1', '1', '1', '0'),            -- Hold

       ('1', '0', '0', '1'),            -- Reset
       ('1', '1', '0', '1'),            -- Hold
       ('1', '1', '0', '1'),            -- Hold

       ('0', '0', '1', '1'),            -- Disallowed
       ('0', '0', '1', '1')             -- Disallowed
       );

  begin
    for i in p'range loop
      r_n <= p(i).r_n; s_n <= p(i).s_n;

      wait for 5 ns;

      assert q = p(i).q and q_n = p(i).q_n;
    end loop;

    wait;
  end process;

end;
