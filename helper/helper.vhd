library ieee;
use ieee.std_logic_1164.all;

package helper is
  component helper_required_signals is
    port (
    -- olord2
    hi1 : out std_logic;
    hi2 : out std_logic;
    hi3 : out std_logic;
    hi4 : out std_logic;
    hi5 : out std_logic;
    hi6 : out std_logic;
    hi7 : out std_logic;
    hi8 : out std_logic;
    hi9 : out std_logic;
    hi10 : out std_logic;
    hi11 : out std_logic;
    hi12 : out std_logic;
    \-boot2\ : out std_logic;

    spy7 : out std_logic;

    -- mbcpin
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