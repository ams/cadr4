library ieee;
use ieee.std_logic_1164.all;

package helper is
  component helper_required_signals is
    port (
      \-busint.lm.reset\: out std_logic;
    \-dbread\: out std_logic;
    \-dbwrite\: out std_logic;
    \-eadr0\: out std_logic;
    \-eadr1\: out std_logic;
    \-eadr2\: out std_logic;
    \-eadr3\: out std_logic
    );
  end component;
end package;