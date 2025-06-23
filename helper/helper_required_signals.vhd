library ieee;
use ieee.std_logic_1164.all;

use work.helper.all;

entity helper_required_signals is
  port (
    -- olord2
    hi1 : out std_logic := '1';
    hi2 : out std_logic := '1';
    hi3 : out std_logic := '1';
    hi4 : out std_logic := '1';
    hi5 : out std_logic := '1';
    hi6 : out std_logic := '1';
    hi7 : out std_logic := '1';
    hi8 : out std_logic := '1';
    hi9 : out std_logic := '1';
    hi10 : out std_logic := '1';
    hi11 : out std_logic := '1';
    hi12 : out std_logic := '1';
    \-boot2\ : out std_logic := '0';

    spy7 : out std_logic := 'H';

    -- mbcpin
    \-busint.lm.reset\: out std_logic := '1';
    \-dbread\: out std_logic := '1';
    \-dbwrite\: out std_logic := '1';
    \-eadr0\: out std_logic := '1';
    \-eadr1\: out std_logic := '1';
    \-eadr2\: out std_logic := '1';
    \-eadr3\: out std_logic := '1'
  );
end entity;

architecture structural of helper_required_signals is
begin
end architecture;