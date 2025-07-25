library ieee;
use ieee.std_logic_1164.all;

entity cadr_flag is
  port (
    ir45                : in  std_logic;
    \-nopa\             : in  std_logic;
    \-ilong\            : out std_logic;
    ob29                : in  std_logic;
    \lc byte mode\      : out std_logic;
    ob28                : in  std_logic;
    \prog.unibus.reset\ : out std_logic;
    hi4                 : in  std_logic;
    clk3c               : in  std_logic;
    \int.enable\        : out std_logic;
    ob27                : in  std_logic;
    \sequence.break\    : out std_logic;
    ob26                : in  std_logic;
    \-destintctl\       : in  std_logic;
    \-reset\            : in  std_logic;
    \-statbit\          : out std_logic;
    ir46                : in  std_logic;
    \a=m\               : in  std_logic;
    alu32               : in  std_logic;
    aluneg              : out std_logic;
    r0                  : in  std_logic;
    jcond               : out std_logic;
    \-jcond\            : out std_logic;
    conds2              : out std_logic;
    conds1              : out std_logic;
    conds0              : out std_logic;
    \pgf.or.int.or.sb\  : out std_logic;
    \pgf.or.int\        : out std_logic;
    \-vmaok\            : in  std_logic;
    ir2                 : in  std_logic;
    ir5                 : in  std_logic;
    ir1                 : in  std_logic;
    ir0                 : in  std_logic;
    \-alu32\            : out std_logic;
    sint                : out std_logic;
    sintr               : in  std_logic
    );
end;
