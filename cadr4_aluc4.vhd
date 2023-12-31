library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_aluc4 is
  port (
    \-aluf0\          : out std_logic;
    aluf0b            : out std_logic;
    \-aluf1\          : out std_logic;
    aluf1b            : out std_logic;
    aluf2b            : out std_logic;
    \-aluf2\          : out std_logic;
    aluf3b            : out std_logic;
    \-aluf3\          : out std_logic;
    aluf0a            : out std_logic;
    aluf1a            : out std_logic;
    aluf2a            : out std_logic;
    aluf3a            : out std_logic;
    yy1               : out std_logic;
    xx1               : out std_logic;
    yy0               : out std_logic;
    xx0               : out std_logic;
    \-cin32\          : out std_logic;
    \-cin16\          : out std_logic;
    \-cin0\           : out std_logic;
    yout23            : in  std_logic;
    xout23            : in  std_logic;
    yout19            : in  std_logic;
    xout19            : in  std_logic;
    yout31            : out std_logic;
    xout31            : out std_logic;
    \-cin28\          : out std_logic;
    \-cin24\          : out std_logic;
    \-cin20\          : out std_logic;
    yout27            : in  std_logic;
    xout27            : in  std_logic;
    yout7             : in  std_logic;
    xout7             : in  std_logic;
    yout3             : in  std_logic;
    xout3             : in  std_logic;
    yout15            : out std_logic;
    xout15            : out std_logic;
    \-cin12\          : out std_logic;
    \-cin8\           : out std_logic;
    \-cin4\           : out std_logic;
    yout11            : in  std_logic;
    xout11            : in  std_logic;
    gnd               : in  std_logic;
    alusub            : out std_logic;
    hi12              : in  std_logic;
    \-ir3\            : out std_logic;
    \-ir4\            : out std_logic;
    aluadd            : out std_logic;
    ir6               : in  std_logic;
    ir5               : in  std_logic;
    ir7               : in  std_logic;
    \-alumode\        : out std_logic;
    \-ir2\            : out std_logic;
    irjump            : in  std_logic;
    alumode           : out std_logic;
    \-divposlasttime\ : out std_logic;
    q0                : in  std_logic;
    \-div\            : in  std_logic;
    divsubcond        : out std_logic;
    divaddcond        : out std_logic;
    a31b              : in  std_logic;
    \-a31\            : out std_logic;
    ir4               : in  std_logic;
    ir3               : in  std_logic;
    ir2               : in  std_logic;
    \-ir1\            : out std_logic;
    ir1               : in  std_logic;
    \-ir0\            : out std_logic;
    ir0               : in  std_logic;
    a31a              : in  std_logic;
    \-mulnop\         : out std_logic;
    \-irjump\         : in  std_logic;
    \-mul\            : in  std_logic;
    osel1a            : out std_logic;
    \-ir13\           : in  std_logic;
    \-iralu\          : in  std_logic;
    osel0a            : out std_logic;
    \-ir12\           : in  std_logic;
    osel1b            : out std_logic;
    osel0b            : out std_logic);
end;

architecture ttl of cadr4_aluc4 is
  signal internal33 : std_logic;
  signal internal34 : std_logic;
  signal internal35 : std_logic;
  signal internal36 : std_logic;
  signal internal37 : std_logic;
  signal nc437      : std_logic;
  signal nc438      : std_logic;
  signal nc439      : std_logic;
  signal nc440      : std_logic;
  signal nc441      : std_logic;
  signal nc442      : std_logic;
  signal nc443      : std_logic;
begin
  aluc4_2a16 : sn74s37 port map(g1a     => \-aluf0\, g1b => \-aluf0\, g1y => aluf0b, g2a => \-aluf1\, g2b => \-aluf1\, g2y => aluf1b, g3y => aluf2b, g3a => \-aluf2\, g3b => \-aluf2\, g4y => aluf3b, g4a => \-aluf3\, g4b => \-aluf3\);
  aluc4_2a17 : sn74s37 port map(g1a     => \-aluf0\, g1b => \-aluf0\, g1y => aluf0a, g2a => \-aluf1\, g2b => \-aluf1\, g2y => aluf1a, g3y => aluf2a, g3a => \-aluf2\, g3b => \-aluf2\, g4y => aluf3a, g4a => \-aluf3\, g4b => \-aluf3\);
  aluc4_2a18 : sn74s182 port map(y1     => yy1, x1 => xx1, y0 => yy0, x0 => xx0, y3 => nc437, x3 => nc438, xout => nc439, cout2_n => nc440, yout => nc441, cout1_n => \-cin32\, cout0_n => \-cin16\, cin_n => \-cin0\, y2 => nc442, x2 => nc443);
  aluc4_2a19 : sn74s182 port map(y1     => yout23, x1 => xout23, y0 => yout19, x0 => xout19, y3 => yout31, x3 => xout31, xout => xx1, cout2_n => \-cin28\, yout => yy1, cout1_n => \-cin24\, cout0_n => \-cin20\, cin_n => \-cin16\, y2 => yout27, x2 => xout27);
  aluc4_2a20 : sn74s182 port map(y1     => yout7, x1 => xout7, y0 => yout3, x0 => xout3, y3 => yout15, x3 => xout15, xout => xx0, cout2_n => \-cin12\, yout => yy0, cout1_n => \-cin8\, cout0_n => \-cin4\, cin_n => \-cin0\, y2 => yout11, x2 => xout11);
  aluc4_2b16 : sn74s153 port map(enb1_n => gnd, sel1 => alusub, g1c3 => gnd, g1c2 => hi12, g1c1 => gnd, g1c0 => \-ir3\, g1q => \-aluf3\, g2q => \-aluf2\, g2c0 => \-ir4\, g2c1 => hi12, g2c2 => gnd, g2c3 => gnd, sel0 => aluadd, enb2_n => gnd);
  aluc4_2b17 : sn74s153 port map(enb1_n => gnd, sel1 => alusub, g1c3 => gnd, g1c2 => gnd, g1c1 => hi12, g1c0 => ir6, g1q => \-aluf1\, g2q => \-aluf0\, g2c0 => ir5, g2c1 => gnd, g2c2 => hi12, g2c3 => gnd, sel0 => aluadd, enb2_n => gnd);
  aluc4_2b18 : sn74s153 port map(enb1_n => gnd, sel1 => alusub, g1c3 => gnd, g1c2 => hi12, g1c1 => hi12, g1c0 => ir7, g1q => \-alumode\, g2q => \-cin0\, g2c0 => \-ir2\, g2c1 => hi12, g2c2 => irjump, g2c3 => gnd, sel0 => aluadd, enb2_n => gnd);
  aluc4_2b20 : sn74s37 port map(g1a     => \-alumode\, g1b => \-alumode\, g1y => alumode, g2a => '0', g2b => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');
  aluc4_2c10 : sn74s02 port map(g1q_n   => internal33, g1a => ir5, g1b => \-divposlasttime\, g2q_n => \-divposlasttime\, g2a => q0, g2b => ir6, g3b => \-divposlasttime\, g3a => \-div\, g3q_n => divsubcond, g4b => internal33, g4a => \-div\, g4q_n => divaddcond);
  aluc4_2c11 : sn74s04 port map(g1a     => a31b, g1q_n => \-a31\, g2a => ir4, g2q_n => \-ir4\, g3a => ir3, g3q_n => \-ir3\, g4q_n => \-ir2\, g4a => ir2, g5q_n => \-ir1\, g5a => ir1, g6q_n => \-ir0\, g6a => ir0);
  aluc4_2c15 : sn74s00 port map(g1b     => divaddcond, g1a => \-a31\, g1q_n => internal34, g2b => divsubcond, g2a => a31a, g2q_n => internal35, g3q_n => internal36, g3b => divsubcond, g3a => \-a31\, g4q_n => internal37, g4a => divaddcond, g4b => a31a);
  aluc4_2c20 : sn74s20 port map(g1a     => \-mulnop\, g1b => internal36, g1c => internal37, g1d => \-irjump\, g1y_n => alusub, g2y_n => aluadd, g2a => \-mul\, g2b => hi12, g2c => internal35, g2d => internal34);
  aluc4_2d15 : sn74s32 port map(g2a     => \-mul\, g2b => q0, g2y => \-mulnop\, g1a => '0', g1b => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');
  aluc4_2d21 : sn7428 port map(g1q_n    => osel1a, g1a => \-ir13\, g1b => \-iralu\, g2q_n => osel0a, g2a => \-ir12\, g2b => \-iralu\, g3a => \-iralu\, g3b => \-ir13\, g3q_n => osel1b, g4a => \-iralu\, g4b => \-ir12\, g4q_n => osel0b);
end architecture;
