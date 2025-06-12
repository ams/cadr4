-- Reset/Set latch

library ieee;
use ieee.std_logic_1164.all;

entity latch_rs_tb is
end;

architecture testbench of latch_rs_tb is

  signal r, s   : std_logic;
  signal q, q_n : std_logic;

begin

  uut : entity work.latch_rs port map(
    r => r, s => s,
    q => q, q_n => q_n
    );

  process

    type pt is record
      r, s   : std_logic;
      q, q_n : std_logic;
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
      r <= p(i).r; s <= p(i).s;

      wait for 5 ns;

      assert q = p(i).q and q_n = p(i).q_n;
    end loop;

    wait;
  end process;

end;
