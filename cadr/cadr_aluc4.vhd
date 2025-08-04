library ieee;
use ieee.std_logic_1164.all;

entity cadr_aluc4 is
  port (
    \-a31\            : out std_logic;
    \-aluf0\          : out std_logic;
    \-aluf1\          : out std_logic;
    \-aluf2\          : out std_logic;
    \-aluf3\          : out std_logic;
    \-alumode\        : out std_logic;
    \-cin0\           : out std_logic;
    \-cin4\           : out std_logic;
    \-cin8\           : out std_logic;
    \-cin12\          : out std_logic;
    \-cin16\          : out std_logic;
    \-cin20\          : out std_logic;
    \-cin24\          : out std_logic;
    \-cin28\          : out std_logic;
    \-cin32\          : out std_logic;
    \-div\            : in  std_logic;
    \-divposlasttime\ : out std_logic;
    \-ir0\            : out std_logic;
    \-ir1\            : out std_logic;
    \-ir2\            : out std_logic;
    \-ir3\            : out std_logic;
    \-ir4\            : out std_logic;
    \-ir12\           : in  std_logic;
    \-ir13\           : in  std_logic;
    \-iralu\          : in  std_logic;
    \-irjump\         : in  std_logic;
    \-mul\            : in  std_logic;
    \-mulnop\         : out std_logic;
    a31a              : in  std_logic;
    a31b              : in  std_logic;
    aluadd            : out std_logic;
    aluf0a, aluf0b    : out std_logic;  -- Same signal.
    aluf1a, aluf1b    : out std_logic;  -- Same signal.
    aluf2a, aluf2b    : out std_logic;  -- Same signal.
    aluf3a, aluf3b    : out std_logic;  -- Same signal.
    alumode           : out std_logic;
    alusub            : out std_logic;
    divaddcond        : out std_logic;
    divsubcond        : out std_logic;
    hi12              : in  std_logic;
    ir0               : in  std_logic;
    ir1               : in  std_logic;
    ir2               : in  std_logic;
    ir3               : in  std_logic;
    ir4               : in  std_logic;
    ir5               : in  std_logic;
    ir6               : in  std_logic;
    ir7               : in  std_logic;
    irjump            : in  std_logic;
    osel0a, osel0b    : out std_logic;  -- Same signal.
    osel1a, osel1b    : out std_logic;  -- Same signal.
    q0                : in  std_logic;
    xout3             : in  std_logic;
    xout7             : in  std_logic;
    xout11            : in  std_logic;
    xout15            : in  std_logic;
    xout19            : in  std_logic;
    xout23            : in  std_logic;
    xout27            : in  std_logic;
    xout31            : in  std_logic;
    xx0               : out std_logic;
    xx1               : out std_logic;
    yout3             : in  std_logic;
    yout7             : in  std_logic;
    yout11            : in  std_logic;
    yout15            : in  std_logic;
    yout19            : in  std_logic;
    yout23            : in  std_logic;
    yout27            : in  std_logic;
    yout31            : in  std_logic;
    yy0               : out std_logic;
    yy1               : out std_logic
  );
end;
