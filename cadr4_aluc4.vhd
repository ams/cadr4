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
  -- internal signals
  signal internal33   : std_logic; -- From 2C10, p1
  signal internal34   : std_logic; -- From 2C15, p1
  signal internal35   : std_logic; -- From 2C15, p2
  signal internal36   : std_logic; -- From 2C15, p3
  signal internal37   : std_logic; -- From 2C15, p4
begin
  -- 74S182 (4-bit lookahead carry generator)
  aluc4_2a20 : sn74s182 port map(
    y1      => yout7,    -- p1 (YOUT7)
    x1      => xout7,    -- p2 (XOUT7)
    y0      => yout3,    -- p3 (YOUT3)
    x0      => xout3,    -- p4 (XOUT3)
    y3      => yout15,   -- p5 (YOUT15)
    x3      => xout15,   -- p6 (XOUT15)
    xout    => xx0,      -- p7 (XX0)
    cout2_n => \-cin12\, -- p9 (-CIN12)
    yout    => yy0,      -- p10 (YY0)
    cout1_n => \-cin8\,  -- p11 (-CIN8)
    cout0_n => \-cin4\,  -- p12 (-CIN4)
    cin_n   => \-cin0\,  -- p13 (-CIN0)
    y2      => yout11,   -- p14 (YOUT11)
    x2      => xout11    -- p15 (XOUT11)
  );

  aluc4_2a19 : sn74s182 port map(
    y1      => yout23,   -- p1 (YOUT23)
    x1      => xout23,   -- p2 (XOUT23)
    y0      => yout19,   -- p3 (YOUT19)
    x0      => xout19,   -- p4 (XOUT19)
    y3      => yout31,   -- p5 (YOUT31)
    x3      => xout31,   -- p6 (XOUT31)
    xout    => xx1,      -- p7 (XX1)
    cout2_n => \-cin28\, -- p9 (-CIN28)
    yout    => yy1,      -- p10 (YY1)
    cout1_n => \-cin24\, -- p11 (-CIN24)
    cout0_n => \-cin20\, -- p12 (-CIN20)
    cin_n   => \-cin16\, -- p13 (-CIN16)
    y2      => yout27,   -- p14 (YOUT27)
    x2      => xout27    -- p15 (XOUT27)
  );

  aluc4_2a18 : sn74s182 port map(
    y1      => yy1,      -- p1 (YY1)
    x1      => xx1,      -- p2 (XX1)
    y0      => yy0,      -- p3 (YY0)
    x0      => xx0,      -- p4 (XX0)
    y3      => '0',    -- p5 (NC)
    x3      => '0',    -- p6 (NC)
    xout    => open,    -- p7 (NC)
    cout2_n => open,    -- p9 (NC)
    yout    => open,    -- p10 (NC)
    cout1_n => \-cin32\, -- p11 (-CIN32)
    cout0_n => \-cin16\, -- p12 (-CIN16)
    cin_n   => \-cin0\,  -- p13 (-CIN0)
    y2      => '0',    -- p14 (NC)
    x2      => '0'     -- p15 (NC)
  );

  -- 74S153 (Dual 4-input multiplexer)
  aluc4_2b16 : sn74s153 port map(
    enb1_n => gnd,      -- p1 (GND)
    sel1   => alusub,   -- p2 (ALUSUB)
    g1c3   => gnd,      -- p3 (GND)
    g1c2   => hi12,     -- p4 (HI12)
    g1c1   => gnd,      -- p5 (GND)
    g1c0   => \-ir3\,   -- p6 (-IR3)
    g1q    => \-aluf3\, -- p7 (-ALUF3)
    g2q    => \-aluf2\, -- p9 (-ALUF2)
    g2c0   => \-ir4\,   -- p10 (-IR4)
    g2c1   => hi12,     -- p11 (HI12)
    g2c2   => gnd,      -- p12 (GND)
    g2c3   => gnd,      -- p13 (GND)
    sel0   => aluadd,   -- p14 (ALUADD)
    enb2_n => gnd       -- p15 (GND)
  );

  aluc4_2b17 : sn74s153 port map(
    enb1_n => gnd,      -- p1 (GND)
    sel1   => alusub,   -- p2 (ALUSUB)
    g1c3   => gnd,      -- p3 (GND)
    g1c2   => gnd,      -- p4 (GND)
    g1c1   => hi12,     -- p5 (HI12)
    g1c0   => ir6,      -- p6 (IR6)
    g1q    => \-aluf1\, -- p7 (-ALUF1)
    g2q    => \-aluf0\, -- p9 (-ALUF0)
    g2c0   => ir5,      -- p10 (IR5)
    g2c1   => gnd,      -- p11 (GND)
    g2c2   => hi12,     -- p12 (HI12)
    g2c3   => gnd,      -- p13 (GND)
    sel0   => aluadd,   -- p14 (ALUADD)
    enb2_n => gnd       -- p15 (GND)
  );

  aluc4_2b18 : sn74s153 port map(
    enb1_n => gnd,      -- p1 (GND)
    sel1   => alusub,   -- p2 (ALUSUB)
    g1c3   => gnd,      -- p3 (GND)
    g1c2   => hi12,     -- p4 (HI12)
    g1c1   => hi12,     -- p5 (HI12)
    g1c0   => ir7,      -- p6 (IR7)
    g1q    => \-alumode\,-- p7 (-ALUMODE)
    g2q    => \-cin0\,  -- p9 (-CIN0)
    g2c0   => \-ir2\,   -- p10 (-IR2)
    g2c1   => hi12,     -- p11 (HI12)
    g2c2   => irjump,   -- p12 (IRJUMP)
    g2c3   => gnd,      -- p13 (GND)
    sel0   => aluadd,   -- p14 (ALUADD)
    enb2_n => gnd       -- p15 (GND)
  );

  -- 74S37 (Quadruple 2-Input Positive-NAND Buffers)
  aluc4_2a17 : sn74s37 port map(
    g1a => \-aluf0\,  -- p1 (-ALUF0)
    g1b => \-aluf0\,  -- p2 (-ALUF0)
    g1y => aluf0a,   -- p3 (ALUF0A)
    g2a => \-aluf1\,  -- p4 (-ALUF1)
    g2b => \-aluf1\,  -- p5 (-ALUF1)
    g2y => aluf1a,   -- p6 (ALUF1A)
    g3a => \-aluf2\,  -- p8 (-ALUF2)
    g3b => \-aluf2\,  -- p9 (-ALUF2)
    g3y => aluf2a,   -- p10 (ALUF2A)
    g4a => \-aluf3\,  -- p11 (-ALUF3)
    g4b => \-aluf3\,  -- p12 (-ALUF3)
    g4y => aluf3a    -- p13 (ALUF3A)
  );

  aluc4_2a16 : sn74s37 port map(
    g1a => \-aluf0\,  -- p1 (-ALUF0)
    g1b => \-aluf0\,  -- p2 (-ALUF0)
    g1y => aluf0b,   -- p3 (ALUF0B)
    g2a => \-aluf1\,  -- p4 (-ALUF1)
    g2b => \-aluf1\,  -- p5 (-ALUF1)
    g2y => aluf1b,   -- p6 (ALUF1B)
    g3a => \-aluf2\,  -- p8 (-ALUF2)
    g3b => \-aluf2\,  -- p9 (-ALUF2)
    g3y => aluf2b,   -- p10 (ALUF2B)
    g4a => \-aluf3\,  -- p11 (-ALUF3)
    g4b => \-aluf3\,  -- p12 (-ALUF3)
    g4y => aluf3b    -- p13 (ALUF3B)
  );

  -- 74S02 (Quadruple 2-Input Positive-NOR Gates)
  aluc4_2c10 : sn74s02 port map(
    g1a   => ir5,                -- p1 (IR5)
    g1b   => \-divposlasttime\, -- p2 (-DIVPOSLASTTIME)
    g1q_n => internal33,         -- p3 (@2C10,p1)
    g2a   => q0,                 -- p4 (Q0)
    g2b   => ir6,                -- p5 (IR6)
    g2q_n => \-divposlasttime\, -- p6 (-DIVPOSLASTTIME)
    g3a   => \-div\,            -- p8 (-DIV)
    g3b   => \-divposlasttime\, -- p9 (-DIVPOSLASTTIME)
    g3q_n => divsubcond,         -- p10 (DIVSUBCOND)
    g4a   => \-div\,            -- p11 (-DIV)
    g4b   => internal33,         -- p12 (@2C10,p1)
    g4q_n => divaddcond          -- p13 (DIVADDCOND)
  );

  -- 74S04 (Hex Inverters)
  aluc4_2c11 : sn74s04 port map(
    g1a   => a31b,   -- p1 (A31B)
    g1q_n => \-a31\, -- p2 (-A31)
    g2a   => ir4,    -- p3 (IR4)
    g2q_n => \-ir4\, -- p4 (-IR4)
    g3a   => ir3,    -- p5 (IR3)
    g3q_n => \-ir3\, -- p6 (-IR3)
    g4a   => ir2,    -- p7 (IR2)
    g4q_n => \-ir2\, -- p8 (-IR2)
    g5a   => ir1,    -- p9 (IR1)
    g5q_n => \-ir1\, -- p10 (-IR1)
    g6a   => ir0,    -- p11 (IR0)
    g6q_n => \-ir0\  -- p12 (-IR0)
  );

  -- 74S00 (Quadruple 2-input Positive-NAND Gates)
  aluc4_2c15 : sn74s00 port map(
    g1a   => divaddcond, -- p1 (DIVADDCOND)
    g1b   => \-a31\,     -- p2 (-A31)
    g1q_n => internal34, -- p3 (@2C20,p13)
    g2a   => divsubcond, -- p4 (DIVSUBCOND)
    g2b   => a31a,       -- p5 (A31A)
    g2q_n => internal35, -- p6 (@2C20,p12)
    g3a   => divsubcond, -- p8 (@2C20,p2)
    g3b   => \-a31\,     -- p9 (DIVSUBCOND)
    g3q_n => internal36, -- p10 (-A31)
    g4a   => divaddcond, -- p11 (@2C20,p4)
    g4b   => a31a,       -- p12 (DIVADDCOND)
    g4q_n => internal37  -- p13 (A31A)
  );

  -- 74S32 (Quadruple 2-Input Positive-OR Gates)
  aluc4_2d15 : sn74s32 port map(
    g1a => '0',      -- p1 (0)
    g1b => '0',      -- p2 (0)
    g1y => open,     -- p3 (NC)
    g2a => \-mul\,   -- p4 (-MUL)
    g2b => q0,       -- p5 (Q0)
    g2y => \-mulnop\,-- p6 (-MULNOP)
    g3a => '0',      -- p9 (0)
    g3b => '0',      -- p10 (0)
    g3y => open,     -- p8 (NC)
    g4a => '0',      -- p12 (0)
    g4b => '0',      -- p13 (0)
    g4y => open      -- p11 (NC)
  );

  -- 7420 (Dual 4-Input Positive-NAND Gates)
  aluc4_2c20 : sn7420 port map(
    g1a   => \-mulnop\, -- p1 (-MULNOP)
    g1b   => internal36, -- p2 (@2C15,p8)
    g1c   => internal37, -- p4 (@2C15,p11)
    g1d   => \-irjump\, -- p5 (-IRJUMP)
    g1y_n => alusub,     -- p6 (ALUSUB)
    g2a   => \-mul\,   -- p9 (-MUL)
    g2b   => hi12,     -- p10 (HI12)
    g2c   => internal35, -- p12 (@2C15,p6)
    g2d   => internal34, -- p13 (@2C15,p3)
    g2y_n => aluadd      -- p8 (ALUADD)
  );

  -- 7428 (Quadruple 2-input Positive-NOR Gates)
  aluc4_2d21 : sn7428 port map(
    g1a   => \-ir13\,  -- p1 (-IR13)
    g1b   => \-iralu\, -- p2 (-IRALU)
    g1q_n => osel1a,  -- p3 (OSEL1A)
    g2a   => \-ir12\,  -- p4 (-IR12)
    g2b   => \-iralu\, -- p5 (-IRALU)
    g2q_n => osel0a,  -- p6 (OSEL0A)
    g3a   => \-iralu\, -- p8 (-IRALU)
    g3b   => \-ir13\,  -- p9 (-IR13)
    g3q_n => osel1b,  -- p10 (OSEL1B)
    g4a   => \-iralu\, -- p11 (-IRALU)
    g4b   => \-ir12\,  -- p12 (-IR12)
    g4q_n => osel0b   -- p13 (OSEL0B)
  );

  -- 74S37 (Quadruple 2-Input Positive-NAND Buffers) - Part of 2B20
  aluc4_2b20 : sn74s37 port map(
    g1a => \-alumode\, -- p1 (-ALUMODE)
    g1b => \-alumode\, -- p2 (-ALUMODE)
    g1y => alumode,    -- p3 (ALUMODE)
    g2a => '0',        -- p4 (0)
    g2b => '0',        -- p5 (0)
    g2y => open,       -- p6 (NC)
    g3a => '0',        -- p8 (0)
    g3b => '0',        -- p9 (0)
    g3y => open,       -- p10 (NC)
    g4a => '0',        -- p11 (0)
    g4b => '0',        -- p12 (0)
    g4y => open        -- p13 (NC)
  );
end architecture;
