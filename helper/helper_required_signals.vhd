library ieee;
use ieee.std_logic_1164.all;

use work.helper.all;

entity helper_required_signals is
  port (
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