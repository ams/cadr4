library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr;
use cadr.utilities.all;

entity cadr_contrl is
  port (
    spushd           : out std_logic;
    tse3a            : in  std_logic;
    spcwpass         : out std_logic;
    \-ipopj\         : out std_logic;
    \-iwrited\       : out std_logic;
    \-popj\          : out std_logic;
    spcdrive         : out std_logic;
    spcenb           : out std_logic;
    \-reset\         : in  std_logic;
    inop             : out std_logic;
    \-inop\          : out std_logic;
    n                : out std_logic;
    clk3c            : in  std_logic;
    \-spushd\        : out std_logic;
    spush            : out std_logic;
    iwrite           : out std_logic;
    iwrited          : out std_logic;
    \-srcspc\        : in  std_logic;
    \-srcspcpop\     : in  std_logic;
    \-spcdrive\      : out std_logic;
    \-spcpass\       : out std_logic;
    \-spcwpass\      : out std_logic;
    ir42             : in  std_logic;
    \-nop\           : out std_logic;
    nop              : out std_logic;
    \-srcspcpopreal\ : out std_logic;
    \-nopa\          : out std_logic;
    \-nop11\         : in  std_logic;
    \-irdisp\        : in  std_logic;
    dr               : in  std_logic;
    \-ignpopj\       : out std_logic;
    \-destspc\       : out std_logic;
    destspc          : out std_logic;
    dp               : in  std_logic;
    \-dfall\         : out std_logic;
    \-trap\          : in  std_logic;
    irdisp           : in  std_logic;
    \-funct2\        : in  std_logic;
    dispenb          : out std_logic;
    irjump           : in  std_logic;
    ir6              : in  std_logic;
    jfalse           : out std_logic;
    jcalf            : out std_logic;
    ir8              : in  std_logic;
    jretf            : out std_logic;
    jret             : out std_logic;
    ir7              : in  std_logic;
    dn               : out std_logic;
    \-jcond\         : in  std_logic;
    hi4              : in  std_logic;
    jcond            : in  std_logic;
    \-ir6\           : out std_logic;
    \-dr\            : out std_logic;
    \-spush\         : out std_logic;
    pcs1             : out std_logic;
    popj             : out std_logic;
    \-dp\            : out std_logic;
    \-spop\          : out std_logic;
    \-ir8\           : out std_logic;
    ir9              : in  std_logic;
    pcs0             : out std_logic;
    \-spcnt\         : out std_logic;
    \-destspcd\      : out std_logic;
    destspcd         : out std_logic;
    wp4c             : in  std_logic;
    \-swpb\          : out std_logic;
    \-swpa\          : out std_logic);
end;

architecture ttl of cadr_contrl is
  signal internal31 : std_logic;
  signal internal32 : std_logic;
begin
  contrl_3d21 : sn74s08
    port map(
      g1a    => tse3a,        -- p2 (TSE3A)
      g1b    => spushd,       -- p1 (SPUSHD)
      g1q    => spcwpass,     -- p3 (SPCWPASS)
      g2a    => \-iwrited\,   -- p5 (-IWRITED)
      g2b    => \-ipopj\,    -- p4 (-IPOPJ)
      g2q    => \-popj\,     -- p6 (-POPJ)
      g3a    => tse3a,        -- p10 (TSE3A)
      g3b    => spcenb,       -- p9 (SPCENB)
      g3q    => spcdrive,     -- p8 (SPCDRIVE)
      g4a    => '0',          -- p12 (NC)
      g4b    => '0',          -- p13 (NC)
      g4q    => open          -- p11 (NC)
      );
  contrl_3d26 : sn74s175
    port map(
      clr_n  => \-reset\,     -- p1 (-RESET)
      d0     => n,            -- p4 (N)
      d1     => '0',          -- p5 (NC)
      d2     => spush,        -- p12 (SPUSH)
      d3     => iwrite,       -- p13 (IWRITE)
      clk    => clk3c,        -- p9 (CLK3C)
      q0     => inop,         -- p2 (INOP)
      q0_n   => \-inop\,      -- p3 (-INOP)
      q1     => open,        -- p6 (NC)
      q1_n   => open,        -- p7 (NC)
      q2     => spushd,       -- p10 (SPUSHD)
      q2_n   => \-spushd\,    -- p11 (-SPUSHD)
      q3     => iwrited,      -- p15 (IWRITED)
      q3_n   => \-iwrited\    -- p14 (-IWRITED)
      );
  contrl_3d28 : sn74s00
    port map(
      g1a    => \-srcspcpop\,  -- p2 (-SRCSPCPOP)
      g1b    => \-srcspc\,    -- p1 (-SRCSPC)
      g1q_n  => spcenb,       -- p3 (SPCENB)
      g2a    => tse3a,        -- p5 (TSE3A)
      g2b    => spcenb,       -- p4 (SPCENB)
      g2q_n  => \-spcdrive\,  -- p6 (-SPCDRIVE)
      g3a    => \-spushd\,    -- p10 (-SPUSHD)
      g3b    => tse3a,        -- p9 (TSE3A)
      g3q_n  => \-spcpass\,   -- p8 (-SPCPASS)
      g4a    => spushd,       -- p13 (SPUSHD)
      g4b    => tse3a,        -- p12 (TSE3A)
      g4q_n  => \-spcwpass\   -- p11 (-SPCWPASS)
      );
  contrl_3e07 : sn74s00
    port map(
      g1a    => '0',          -- p1 (NC)
      g1b    => '0',          -- p2 (NC)
      g1q_n  => open,        -- p3 (NC)
      g2a    => \-nop\,       -- p5 (-NOP)
      g2b    => ir42,         -- p4 (IR42)
      g2q_n  => \-ipopj\,    -- p6 (-IPOPJ)
      g3a    => '0',          -- p9 (NC)
      g3b    => '0',          -- p8 (NC)
      g3q_n  => open,        -- p10 (NC)
      g4a    => '0',          -- p12 (NC)
      g4b    => '0',          -- p13 (NC)
      g4q_n  => open         -- p11 (NC)
      );
  contrl_3e09 : sn74s32
    port map(
      g1a    => \-srcspcpop\,  -- p1 (-SRCSPCPOP)
      g1b    => nop,          -- p2 (NOP)
      g1y    => \-srcspcpopreal\, -- p3 (-SRCSPCPOPREAL)
      g2a    => '0',          -- p4 (NC)
      g2b    => '0',          -- p5 (NC)
      g2y    => open,        -- p6 (NC)
      g3a    => '0',          -- p9 (NC)
      g3b    => '0',          -- p8 (NC)
      g3y    => open,        -- p10 (NC)
      g4a    => '0',          -- p12 (NC)
      g4b    => '0',          -- p13 (NC)
      g4y    => open         -- p11 (NC)
      );
  contrl_3e14 : sn74s08
    port map(
      g1a    => '0',          -- p1 (NC)
      g1b    => '0',          -- p2 (NC)
      g1q    => open,        -- p3 (NC)
      g2a    => '0',          -- p4 (NC)
      g2b    => '0',          -- p5 (NC)
      g2q    => open,        -- p6 (NC)
      g3a    => '0',          -- p9 (NC)
      g3b    => '0',          -- p8 (NC)
      g3q    => open,        -- p10 (NC)
      g4a    => \-inop\,      -- p13 (-INOP)
      g4b    => \-nop11\,     -- p12 (-NOP11)
      g4q    => \-nopa\       -- p11 (-NOPA)
      );
  contrl_3e18 : sn74s32
    port map(
      g1a    => \-irdisp\,    -- p1 (-IRDISP)
      g1b    => dr,           -- p2 (DR)
      g1y    => \-ignpopj\,   -- p3 (-IGNPOPJ)
      g2a    => '0',          -- p4 (NC)
      g2b    => '0',          -- p5 (NC)
      g2y    => open,        -- p6 (NC)
      g3a    => '0',          -- p9 (NC)
      g3b    => '0',          -- p8 (NC)
      g3y    => open,        -- p10 (NC)
      g4a    => '0',          -- p12 (NC)
      g4b    => '0',          -- p13 (NC)
      g4y    => open         -- p11 (NC)
      );
  contrl_3e22 : sn74s04
    port map(
      g1a    => \-destspc\,   -- p1 (-DESTSPC)
      g1q_n  => destspc,      -- p2 (DESTSPC)
      g2a    => nop,          -- p3 (NOP)
      g2q_n  => \-nop\,       -- p4 (-NOP)
      g3a    => '0',          -- p5 (NC)
      g3q_n  => open,        -- p6 (NC)
      g4a    => '0',          -- p7 (NC)
      g4q_n  => open,        -- p8 (NC)
      g5a    => '0',          -- p9 (NC)
      g5q_n  => open,        -- p10 (NC)
      g6a    => '0',          -- p11 (NC)
      g6q_n  => open         -- p12 (NC)
      );
  contrl_3e23 : sn74s00
    port map(
      g1a    => dp,           -- p2 (DP)
      g1b    => dr,           -- p1 (DR)
      g1q_n  => \-dfall\,     -- p3 (-DFALL)
      g2a    => internal32,   -- p5 (@3E25,p8)
      g2b    => \-trap\,      -- p4 (-TRAP)
      g2q_n  => n,            -- p6 (N)
      g3a    => \-srcspcpopreal\, -- p10 (-SRCSPCPOPREAL)
      g3b    => \-popj\,      -- p9 (-POPJ)
      g3q_n  => internal31,   -- p8 (@3E28,p10)
      g4a    => \-nopa\,      -- p13 (-NOPA)
      g4b    => \-trap\,      -- p12 (-TRAP)
      g4q_n  => nop           -- p11 (NOP)
      );
  contrl_3e24 : sn74s08
    port map(
      g1a    => \-funct2\,    -- p2 (-FUNCT2)
      g1b    => irdisp,       -- p1 (IRDISP)
      g1q    => dispenb,      -- p3 (DISPENB)
      g2a    => ir6,          -- p5 (IR6)
      g2b    => irjump,       -- p4 (IRJUMP)
      g2q    => jfalse,       -- p6 (JFALSE)
      g3a    => jfalse,       -- p9 (JFALSE)
      g3b    => ir8,          -- p8 (IR8)
      g3q    => jcalf,        -- p10 (JCALF)
      g4a    => jret,         -- p13 (JRET)
      g4b    => ir6,          -- p12 (IR6)
      g4q    => jretf         -- p11 (JRETF)
      );
  contrl_3e25 : sn74s64
    port map(
      a1     => hi4,          -- p9 (HI4)
      a2     => dispenb,      -- p3 (DISPENB)
      a3     => jfalse,       -- p6 (JFALSE)
      a4     => irjump,       -- p13 (IRJUMP)
      b1     => iwrited,      -- p10 (IWRITED)
      b2     => dn,           -- p2 (DN)
      b3     => \-jcond\,     -- p5 (-JCOND)
      b4     => \-ir6\,       -- p12 (-IR6)
      c3     => ir7,          -- p4 (IR7)
      c4     => jcond,        -- p11 (JCOND)
      d4     => ir7,          -- p1 (IR7)
      \out\  => internal32    -- p8 (@3E23,p5)
      );
  contrl_3e26 : sn74s64
    port map(
      a1     => hi4,          -- p9 (HI4)
      a2     => jcalf,        -- p3 (JCALF)
      a3     => dispenb,      -- p6 (DISPENB)
      a4     => irjump,       -- p13 (IRJUMP)
      b1     => destspc,      -- p10 (DESTSPC)
      b2     => \-jcond\,     -- p2 (-JCOND)
      b3     => dp,           -- p5 (DP)
      b4     => \-ir6\,       -- p12 (-IR6)
      c3     => \-dr\,        -- p4 (-DR)
      c4     => ir8,          -- p11 (IR8)
      d4     => jcond,        -- p1 (JCOND)
      \out\  => \-spush\     -- p8 (-SPUSH)
      );
  contrl_3e27 : sn74s64
    port map(
      a1     => \-ignpopj\,   -- p9 (-IGNPOPJ)
      a2     => jfalse,       -- p3 (JFALSE)
      a3     => irjump,       -- p6 (IRJUMP)
      a4     => dispenb,      -- p13 (DISPENB)
      b1     => popj,         -- p10 (POPJ)
      b2     => \-jcond\,     -- p2 (-JCOND)
      b3     => \-ir6\,       -- p5 (-IR6)
      b4     => dr,           -- p12 (DR)
      c3     => jcond,        -- p4 (JCOND)
      c4     => \-dp\,        -- p11 (-DP)
      d4     => hi4,          -- p1 (HI4)
      \out\  => pcs1          -- p8 (PCS1)
      );
  contrl_3e28 : sn74s64
    port map(
      a1     => \-ignpopj\,   -- p9 (-IGNPOPJ)
      a2     => jretf,        -- p3 (JRETF)
      a3     => jret,         -- p6 (JRET)
      a4     => dispenb,      -- p13 (DISPENB)
      b1     => internal31,   -- p10 (@3E23,p8)
      b2     => \-jcond\,     -- p2 (-JCOND)
      b3     => \-ir6\,       -- p5 (-IR6)
      b4     => dr,           -- p12 (DR)
      c3     => jcond,        -- p4 (JCOND)
      c4     => \-dp\,        -- p11 (-DP)
      d4     => hi4,          -- p1 (HI4)
      \out\  => \-spop\      -- p8 (-SPOP)
      );
  contrl_3e29 : sn74s11
    port map(
      g1a    => irjump,       -- p2 (IRJUMP)
      g1b    => \-ir8\,       -- p1 (-IR8)
      g1c    => ir9,          -- p13 (IR9)
      g1y    => jret,         -- p1 (JRET)
      g2a    => irjump,       -- p4 (IRJUMP)
      g2b    => ir8,          -- p5 (IR8)
      g2c    => ir9,          -- p6 (IR9)
      g2y    => iwrite,       -- p7 (IWRITE)
      g3a    => '0',          -- p9 (NC)
      g3b    => '0',          -- p10 (NC)
      g3c    => '0',          -- p11 (NC)
      g3y    => open         -- p12 (NC)
      );
  contrl_3f20 : sn74s04
    port map(
      g1a    => \-popj\,      -- p1 (-POPJ)
      g1q_n  => popj,         -- p2 (POPJ)
      g2a    => ir8,          -- p3 (IR8)
      g2q_n  => \-ir8\,       -- p4 (-IR8)
      g3a    => ir6,          -- p5 (IR6)
      g3q_n  => \-ir6\,       -- p6 (-IR6)
      g4a    => \-spush\,     -- p9 (-SPUSH)
      g4q_n  => spush,        -- p8 (SPUSH)
      g5a    => dp,           -- p11 (DP)
      g5q_n  => \-dp\,        -- p10 (-DP)
      g6a    => dr,           -- p13 (DR)
      g6q_n  => \-dr\         -- p12 (-DR)
      );
  contrl_3f30 : sn74s64
    port map(
      a1     => hi4,          -- p9 (HI4)
      a2     => \-dfall\,     -- p2 (-DFALL)
      a3     => jretf,        -- p6 (JRETF)
      a4     => jret,         -- p13 (JRET)
      b1     => popj,         -- p10 (POPJ)
      b2     => \-jcond\,     -- p5 (-JCOND)
      b3     => hi4,          -- p4 (HI4)
      b4     => \-ir6\,       -- p12 (-IR6)
      c3     => hi4,          -- p3 (HI4)
      c4     => jcond,        -- p11 (JCOND)
      d4     => hi4,          -- p1 (HI4)
      \out\  => pcs0          -- p8 (PCS0)
      );
  contrl_4d09 : sn74s08
    port map(
      g1a    => \-spop\,      -- p2 (-SPOP)
      g1b    => \-spush\,     -- p1 (-SPUSH)
      g1q    => \-spcnt\,     -- p3 (-SPCNT)
      g2a    => '0',          -- p4 (NC)
      g2b    => '0',          -- p5 (NC)
      g2q    => open,        -- p6 (NC)
      g3a    => '0',          -- p9 (NC)
      g3b    => '0',          -- p8 (NC)
      g3q    => open,        -- p10 (NC)
      g4a    => '0',          -- p12 (NC)
      g4b    => '0',          -- p13 (NC)
      g4q    => open         -- p11 (NC)
      );
  contrl_4e30 : sn74s37
    port map(
      g1a    => \-destspcd\,  -- p1 (-DESTSPCD)
      g1b    => \-destspcd\,  -- p2 (-DESTSPCD)
      g1y    => destspcd,     -- p3 (DESTSPCD)
      g2a    => spushd,       -- p5 (SPUSHD)
      g2b    => wp4c,         -- p4 (WP4C)
      g2y    => \-swpb\,      -- p6 (-SWPB)
      g3a    => wp4c,         -- p10 (WP4C)
      g3b    => spushd,       -- p9 (SPUSHD)
      g3y    => \-swpa\,      -- p8 (-SWPA)
      g4a    => '0',          -- p12 (NC)
      g4b    => '0',          -- p13 (NC)
      g4y    => open         -- p11 (NC)
      );
end architecture;
