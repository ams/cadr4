library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_flag is
  port (
    ir45                : in  std_logic;
    \-nopa\             : in  std_logic;
    \-ilong\            : out std_logic;
    ob29                : in  std_logic;
    \lc_byte_mode\      : out std_logic;
    ob28                : in  std_logic;
    \prog.unibus.reset\ : out std_logic;
    hi4                 : in  std_logic;
    gnd                 : in  std_logic;
    clk3c               : in  std_logic;
    \int.enable\        : out std_logic;
    ob27                : in  std_logic;
    \sequence.break\    : out std_logic;
    ob26                : in  std_logic;
    \-destintctl\       : in  std_logic;
    \-reset\            : in  std_logic;
    \-statbit\          : out std_logic;
    ir46                : in  std_logic;
    aeqm                : in  std_logic;
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
    sintr               : in  std_logic);
end;

architecture ttl of cadr4_flag is
  signal internal30 : std_logic;
  signal nc385      : std_logic;
  signal nc386      : std_logic;
  signal nc387      : std_logic;
  signal nc388      : std_logic;
  signal nc389      : std_logic;
  signal nc390      : std_logic;
  signal nc391      : std_logic;
  signal nc392      : std_logic;
  signal nc393      : std_logic;
  signal nc394      : std_logic;
  signal nc395      : std_logic;
  signal nc396      : std_logic;
  signal nc397      : std_logic;
  signal nc398      : std_logic;
  signal nc399      : std_logic;
  signal nc400      : std_logic;
  signal nc401      : std_logic;
  signal nc402      : std_logic;
  signal nc403      : std_logic;
  signal nc404      : std_logic;
  signal nc405      : std_logic;
  signal nc406      : std_logic;
  signal nc407      : std_logic;
  signal nc408      : std_logic;
  signal nc409      : std_logic;
  signal nc410      : std_logic;
  signal nc411      : std_logic;
  signal nc412      : std_logic;
  signal nc413      : std_logic;
  signal nc414      : std_logic;
  signal nc415      : std_logic;
  signal nc416      : std_logic;
  signal nc417      : std_logic;
  signal nc418      : std_logic;
  signal nc419      : std_logic;
  signal nc420      : std_logic;
  signal nc421      : std_logic;
  signal nc422      : std_logic;
  signal nc423      : std_logic;
  signal nc424      : std_logic;
  signal nc425      : std_logic;
  signal nc426      : std_logic;
  signal nc427      : std_logic;
  signal nc428      : std_logic;
  signal nc429      : std_logic;
  signal nc430      : std_logic;
  signal nc431      : std_logic;
  signal nc432      : std_logic;
  signal nc433      : std_logic;
  signal nc434      : std_logic;
  signal nc435      : std_logic;
  signal nc436      : std_logic;
  signal nc437      : std_logic;
  signal nc438      : std_logic;
  signal nc439      : std_logic;
  signal nc440      : std_logic;
begin
  flag_3e07 : sn74s00 port map(  -- Quadruple 2-input Positive-NAND Gates
    g1b   => ir45,       -- p2 (IR45)
    g1a   => \-nopa\,    -- p1 (-NOPA)
    g1q_n => \-ilong\,   -- p3 (-ILONG)
    g2b   => '0',        -- p6 (NC)
    g2a   => '0',        -- p5 (NC)
    g3b   => '0',        -- p10 (NC)
    g3a   => '0',        -- p9 (NC)
    g4a   => '0',        -- p12 (NC)
    g4b   => '0'         -- p13 (NC)
  );
  flag_3e08 : am25ls2519 port map(  -- 4X (2 input) universal MUX + latch
    i0         => ob29,                -- p1 (OB29)
    q0a        => nc385,               -- p20 (Q0A)
    q0b        => \lc_byte_mode\,      -- p3 ('LC BYTE MODE')
    i1         => ob28,                -- p4 (OB28)
    q1a        => nc386,               -- p21 (Q1A)
    q1b        => \prog.unibus.reset\, -- p6 (PROG.UNIBUS.RESET)
    o_enb_n    => hi4,                 -- p7 (HI4)
    out_enb_n  => gnd,                 -- p8 (GND)
    clk        => clk3c,               -- p9 (CLK3C)
    q2b        => \int.enable\,        -- p11 (INT.ENABLE)
    q2a        => nc387,               -- p22 (Q2A)
    i2         => ob27,                -- p13 (OB27)
    q3b        => \sequence.break\,    -- p14 (SEQUENCE.BREAK)
    q3a        => nc388,               -- p23 (Q3A)
    i3         => ob26,                -- p16 (OB26)
    clk_enb_n  => \-destintctl\,       -- p17 (-DESTINTCTL)
    inv        => hi4,                 -- p18 (HI4)
    asyn_clr_n => \-reset\             -- p19 (-RESET)
  );
  flag_3e11 : sn74s00 port map(  -- Quadruple 2-input Positive-NAND Gates
    g4q_n => \-statbit\,  -- p14 (-STATBIT)
    g4a   => \-nopa\,    -- p12 (-NOPA)
    g4b   => ir46,       -- p13 (IR46)
    g1b   => '0',        -- p2 (NC)
    g1a   => '0',        -- p1 (NC)
    g2b   => '0',        -- p6 (NC)
    g2a   => '0',        -- p5 (NC)
    g3b   => '0',        -- p10 (NC)
    g3a   => '0'         -- p9 (NC)
  );
  flag_3e13 : sn74s151 port map(  -- 8-input multiplexer
    i3   => aeqm,                  -- p4 (AEQM)
    i2   => alu32,                 -- p3 (ALU32)
    i1   => aluneg,                -- p2 (ALUNEG)
    i0   => r0,                    -- p1 (R0)
    q    => jcond,                 -- p5 (JCOND)
    q_n  => \-jcond\,              -- p6 (-JCOND)
    ce_n => gnd,                   -- p7 (GND)
    sel2 => conds2,                -- p9 (CONDS2)
    sel1 => conds1,                -- p10 (CONDS1)
    sel0 => conds0,                -- p11 (CONDS0)
    i7   => hi4,                   -- p12 (HI4)
    i6   => \pgf.or.int.or.sb\,    -- p13 (PGF.OR.INT.OR.SB)
    i5   => \pgf.or.int\,          -- p14 (PGF.OR.INT)
    i4   => \-vmaok\               -- p15 (-VMAOK)
  );
  flag_3e14 : sn74s08 port map(  -- Quadruple 2-Input Positive-AND Gates
    g1b => ir2,      -- p2 (IR2)
    g1a => ir5,      -- p1 (IR5)
    g1q => conds2,   -- p3 (CONDS2)
    g2b => ir1,      -- p5 (IR1)
    g2a => ir5,      -- p4 (IR5)
    g2q => conds1,   -- p6 (CONDS1)
    g3q => conds0,   -- p8 (CONDS0)
    g3a => ir5,      -- p9 (IR5)
    g3b => ir0,      -- p10 (IR0)
    g4a => '0',      -- p12 (NC)
    g4b => '0'       -- p13 (NC)
  );
  flag_3e17 : sn74s02 port map(  -- Quadruple 2-Input Positive-NOR Gates
    g4b   => \-alu32\,  -- p11 (-ALU32)
    g4a   => aeqm,      -- p12 (AEQM)
    g4q_n => aluneg,    -- p13 (ALUNEG)
    g1a   => '0',       -- p1 (NC)
    g1b   => '0',       -- p2 (NC)
    g2a   => '0',       -- p4 (NC)
    g2b   => '0',       -- p5 (NC)
    g3b   => '0',       -- p10 (NC)
    g3a   => '0'        -- p9 (NC)
  );
  flag_3e18 : sn74s32 port map(  -- Quadruple 2-Input Positive-OR Gates
    g2a   => \-vmaok\,   -- p4 (-VMAOK)
    g2b   => sint,       -- p5 (SINT)
    g2y   => \pgf.or.int\, -- p6 (PGF.OR.INT)
    g3y   => internal30, -- p8 (@3E18,p12)
    g3a   => \sequence.break\, -- p9 (SEQUENCE.BREAK)
    g3b   => sint,       -- p10 (SINT)
    g4y   => \pgf.or.int.or.sb\, -- p11 (PGF.OR.INT.OR.SB)
    g4a   => internal30, -- p12 (@3E18,p8)
    g4b   => \-vmaok\,   -- p13 (-VMAOK)
    g1a   => '0',        -- p1 (NC)
    g1b   => '0'         -- p2 (NC)
  );
  flag_3e22 : sn74s04 port map(  -- Hex Inverters
    g4q_n => \-alu32\,  -- p8 (-ALU32)
    g4a   => alu32,      -- p9 (ALU32)
    g1a   => '0',       -- p1 (NC)
    g2a   => '0',       -- p3 (NC)
    g3a   => '0',       -- p5 (NC)
    g5a   => '0',       -- p11 (NC)
    g6a   => '0'        -- p13 (NC)
  );
  flag_4d09 : sn74s08 port map(  -- Quadruple 2-Input Positive-AND Gates
    g3q   => sint,       -- p8 (SINT)
    g3a   => \int.enable\, -- p9 (INT.ENABLE)
    g3b   => sintr,      -- p10 (SINTR)
    g1b   => '0',        -- p2 (NC)
    g1a   => '0',        -- p1 (NC)
    g2b   => '0',        -- p5 (NC)
    g2a   => '0',        -- p4 (NC)
    g4a   => '0',        -- p12 (NC)
    g4b   => '0'         -- p13 (NC)
  );
end architecture;
