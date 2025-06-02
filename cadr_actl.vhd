library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr;
use cadr.utilities.all;

entity cadr_actl is
  port (
    clk3e       : in  std_logic;
    wadr0       : out std_logic;
    ir32        : in  std_logic;
    \-aadr0b\   : out std_logic;
    wadr1       : out std_logic;
    ir33        : in  std_logic;
    \-aadr1b\   : out std_logic;
    \-aadr2b\   : out std_logic;
    ir34        : in  std_logic;
    wadr2       : out std_logic;
    \-aadr3b\   : out std_logic;
    ir35        : in  std_logic;
    wadr3       : out std_logic;
    gnd         : in  std_logic;
    clk3d       : in  std_logic;
    wadr4       : out std_logic;
    ir36        : in  std_logic;
    \-aadr4b\   : out std_logic;
    wadr5       : out std_logic;
    ir37        : in  std_logic;
    \-aadr5b\   : out std_logic;
    \-aadr6b\   : out std_logic;
    ir38        : in  std_logic;
    wadr6       : out std_logic;
    \-aadr7b\   : out std_logic;
    ir39        : in  std_logic;
    wadr7       : out std_logic;
    \-aadr0a\   : out std_logic;
    \-aadr1a\   : out std_logic;
    \-aadr2a\   : out std_logic;
    \-aadr3a\   : out std_logic;
    \-aadr4a\   : out std_logic;
    \-aadr5a\   : out std_logic;
    \-aadr6a\   : out std_logic;
    \-aadr7a\   : out std_logic;
    wadr8       : out std_logic;
    ir40        : in  std_logic;
    \-aadr8a\   : out std_logic;
    wadr9       : out std_logic;
    ir41        : in  std_logic;
    \-aadr9a\   : out std_logic;
    \-aadr8b\   : out std_logic;
    \-aadr9b\   : out std_logic;
    apass1      : out std_logic;
    apass2      : out std_logic;
    \-apass\    : out std_logic;
    tse3a       : in  std_logic;
    \-amemenb\  : out std_logic;
    hi3         : in  std_logic;
    \-reset\    : in  std_logic;
    ir14        : in  std_logic;
    ir15        : in  std_logic;
    ir16        : in  std_logic;
    ir17        : in  std_logic;
    destmd      : out std_logic;
    destm       : in  std_logic;
    dest        : in  std_logic;
    destd       : out std_logic;
    ir21        : in  std_logic;
    ir20        : in  std_logic;
    ir19        : in  std_logic;
    ir18        : in  std_logic;
    ir23        : in  std_logic;
    ir22        : in  std_logic;
    wp3a        : in  std_logic;
    \-awpa\     : out std_logic;
    \-awpb\     : out std_logic;
    \-awpc\     : out std_logic;
    tse4a       : in  std_logic;
    apassenb    : out std_logic;
    \-apassenb\ : out std_logic
    );
end;

architecture ttl of cadr_actl is
begin
  actl_3a06 : sn74s258 port map(
    sel => clk3e,          -- p1
    d0 => wadr0,           -- p2
    d1 => ir32,            -- p3
    dy => \-aadr0b\,       -- p4
    c0 => wadr1,           -- p5
    c1 => ir33,            -- p6
    cy => \-aadr1b\,       -- p7
    by => \-aadr2b\,       -- p9
    b1 => ir34,            -- p10
    b0 => wadr2,           -- p11
    ay => \-aadr3b\,       -- p12
    a1 => ir35,            -- p13
    a0 => wadr3,           -- p14
    enb_n => gnd           -- p15
  );
  actl_3a12 : sn74s258 port map(
    sel => clk3d,          -- p1
    d0 => wadr4,           -- p2
    d1 => ir36,            -- p3
    dy => \-aadr4b\,       -- p4
    c0 => wadr5,           -- p5
    c1 => ir37,            -- p6
    cy => \-aadr5b\,       -- p7
    by => \-aadr6b\,       -- p9
    b1 => ir38,            -- p10
    b0 => wadr6,           -- p11
    ay => \-aadr7b\,       -- p12
    a1 => ir39,            -- p13
    a0 => wadr7,           -- p14
    enb_n => gnd           -- p15
  );
  actl_3a16 : sn74s258 port map(
    sel => clk3d,          -- p1
    d0 => wadr0,           -- p2
    d1 => ir32,            -- p3
    dy => \-aadr0a\,       -- p4
    c0 => wadr1,           -- p5
    c1 => ir33,            -- p6
    cy => \-aadr1a\,       -- p7
    by => \-aadr2a\,       -- p9
    b1 => ir34,            -- p10
    b0 => wadr2,           -- p11
    ay => \-aadr3a\,       -- p12
    a1 => ir35,            -- p13
    a0 => wadr3,           -- p14
    enb_n => gnd           -- p15
  );
  actl_3a21 : sn74s258 port map(
    sel => clk3d,          -- p1
    d0 => wadr4,           -- p2
    d1 => ir36,            -- p3
    dy => \-aadr4a\,       -- p4
    c0 => wadr5,           -- p5
    c1 => ir37,            -- p6
    cy => \-aadr5a\,       -- p7
    by => \-aadr6a\,       -- p9
    b1 => ir38,            -- p10
    b0 => wadr6,           -- p11
    ay => \-aadr7a\,       -- p12
    a1 => ir39,            -- p13
    a0 => wadr7,           -- p14
    enb_n => gnd           -- p15
  );
  actl_3b15 : sn74s258 port map(
    sel => clk3d,          -- p1
    d0 => wadr8,           -- p2
    d1 => ir40,            -- p3
    dy => \-aadr8a\,       -- p4
    c0 => wadr9,           -- p5
    c1 => ir41,            -- p6
    cy => \-aadr9a\,       -- p7
    by => \-aadr8b\,       -- p9
    b1 => ir40,            -- p10
    b0 => wadr8,           -- p11
    ay => \-aadr9b\,       -- p12
    a1 => ir41,            -- p13
    a0 => wadr9,           -- p14
    enb_n => gnd           -- p15
  );
  actl_3b16 : sn7400 port map(
    g1a   => apass1,         -- p1 (APASS1)
    g1b   => apass2,         -- p2 (APASS2)
    g1q_n => \-apass\,       -- p3 (-APASS)
    g2a   => \-apass\,       -- p4 (-APASS)
    g2b   => tse3a,          -- p5 (TSE3A)
    g2q_n => \-amemenb\,     -- p6 (-AMEMENB)
    g3a   => '0',            -- p9 (Typically 3A)
    g3b   => '0',            -- p10 (Typically 3B)
    g3q_n => open,          -- p8 (NC in netlist implies this gate output is unused, typical pin 8 is 3Y)
    g4a   => '0',            -- p12 (Typically 4A)
    g4b   => '0',            -- p13 (Typically 4B)
    g4q_n => open           -- p11 (NC in netlist implies this gate output is unused, typical pin 11 is 4Y)
  );
  actl_3b21 : dm93s46 port map(
    a0 => ir32,            -- p1
    b0 => wadr0,           -- p2
    a1 => ir33,            -- p3
    b1 => wadr1,           -- p4
    a2 => ir34,            -- p5
    b2 => wadr2,           -- p6
    enb => hi3,            -- p7
    eq => apass1,          -- p9
    a3 => ir35,            -- p10
    b3 => wadr3,           -- p11
    a4 => ir36,            -- p12
    b4 => wadr4,           -- p13
    a5 => ir37,            -- p14
    b5 => wadr5            -- p15
  );
  actl_3b26 : sn74s174 port map(
    clr_n => \-reset\,     -- p1
    q1 => wadr0,           -- p2
    d1 => ir14,            -- p3
    d2 => ir15,            -- p4
    q2 => wadr1,           -- p5
    d3 => ir16,            -- p6
    q3 => wadr2,           -- p7
    clk => clk3d,         -- p9
    q4 => wadr3,           -- p10
    d4 => ir17,            -- p11
    q5 => destmd,          -- p12
    d5 => destm,           -- p13
    d6 => dest,            -- p14
    q6 => destd            -- p15
  );
  actl_3b27 : dm93s46 port map(
    a0 => ir38,            -- p1
    b0 => wadr6,           -- p2
    a1 => ir39,            -- p3
    b1 => wadr7,           -- p4
    a2 => ir40,            -- p5
    b2 => wadr8,           -- p6
    enb => hi3,            -- p7
    eq => apass2,          -- p9
    a3 => ir41,            -- p10
    b3 => wadr9,           -- p11
    a4 => hi3,             -- p12
    b4 => destd,           -- p13
    a5 => gnd,             -- p14
    b5 => gnd              -- p15
  );
  actl_3b28 : am25s09 port map(
    sel => destm,          -- p1
    aq => wadr7,           -- p2
    a0 => ir21,            -- p3
    a1 => gnd,             -- p4 (netlist has GND for A1 which is pin 4 of 25S09 for this part)
    b1 => gnd,             -- p5 (netlist has GND for B1 which is pin 5 of 25S09 for this part)
    b0 => ir20,            -- p6
    bq => wadr6,           -- p7
    clk => clk3d,         -- p9
    cq => wadr5,           -- p10
    c0 => ir19,            -- p11
    c1 => gnd,             -- p12 (netlist has GND for C1 which is pin 12 of 25S09 for this part)
    d1 => ir18,            -- p13
    d0 => ir18,            -- p14
    dq => wadr4            -- p15
  );
  actl_3b29 : am25s09 port map(
    sel => destm,          -- p1
    aq => open,           -- p2 (NC in netlist)
    a0 => '0',           -- p3 (NC in netlist)
    a1 => '0',           -- p4 (NC in netlist)
    b1 => '0',           -- p5 (NC in netlist)
    b0 => '0',           -- p6 (NC in netlist)
    bq => open,           -- p7 (NC in netlist)
    clk => clk3d,         -- p9
    cq => wadr9,           -- p10
    c0 => ir23,            -- p11
    c1 => gnd,             -- p12
    d1 => gnd,             -- p13 (netlist has GND for D1 which is pin 13 of 25S09 for this part)
    d0 => ir22,            -- p14
    dq => wadr8            -- p15
  );
  actl_3b30 : sn74s37 port map(
    g1a => wp3a,           -- p1
    g1b => destd,          -- p2
    g1y => \-awpa\,        -- p3
    g2a => wp3a,           -- p4
    g2b => destd,          -- p5
    g2y => \-awpb\,        -- p6
    g3a => destd,          -- p9
    g3b => wp3a,           -- p10
    g3y => \-awpc\,        -- p8
    g4a => '0',
    g4b => '0'
  );
  actl_4b11 : sn74s11 port map(
    g2a => apass1,         -- p3 in netlist (g1a in VHDL component, but netlist uses p3 for g2a)
    g2b => apass2,         -- p4 in netlist (g1b in VHDL component, but netlist uses p4 for g2b)
    g2c => tse4a,          -- p5 in netlist (g1c in VHDL component, but netlist uses p5 for g2c)
    g2y => apassenb,       -- p6 in netlist (g1y in VHDL component, but netlist uses p6 for g2y)
    g1a => '0',
    g1b => '0',
    g1c => '0',
    g3a => '0',
    g3b => '0',
    g3c => '0'
  );
  actl_4b14 : sn74s10 port map(
    g3y_n => \-apassenb\,  -- p8
    g3a => tse4a,          -- p9
    g3b => apass2,         -- p10
    g3c => apass1,         -- p11
    g1a => '0',
    g1b => '0',
    g1c => '0',
    g2a => '0',
    g2b => '0',
    g2c => '0'
  );
end architecture;
