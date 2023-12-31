library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_contrl is
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

architecture ttl of cadr4_contrl is
  signal internal31 : std_logic;
  signal internal32 : std_logic;
  signal nc420      : std_logic;
  signal nc421      : std_logic;
  signal nc422      : std_logic;
begin
  contrl_3d21 : sn74s08 port map(g1b    => spushd, g1a => tse3a, g1q => spcwpass, g2b => \-ipopj\, g2a => \-iwrited\, g2q => \-popj\, g3q => spcdrive, g3a => spcenb, g3b => tse3a, g4a => '0', g4b => '0');
  contrl_3d26 : sn74s175 port map(clr_n => \-reset\, q0 => inop, q0_n => \-inop\, d0 => n, d1 => nc420, q1_n => nc421, q1 => nc422, clk => clk3c, q2 => spushd, q2_n => \-spushd\, d2 => spush, d3 => iwrite, q3_n => \-iwrited\, q3 => iwrited);
  contrl_3d28 : sn74s00 port map(g1b    => \-srcspc\, g1a => \-srcspcpop\, g1q_n => spcenb, g2b => spcenb, g2a => tse3a, g2q_n => \-spcdrive\, g3q_n => \-spcpass\, g3b => tse3a, g3a => \-spushd\, g4q_n => \-spcwpass\, g4a => tse3a, g4b => spushd);
  contrl_3e07 : sn74s00 port map(g2b    => ir42, g2a => \-nop\, g2q_n => \-ipopj\, g1b => '0', g1a => '0', g3b => '0', g3a => '0', g4a => '0', g4b => '0');
  contrl_3e09 : sn74s32 port map(g1a    => \-srcspcpop\, g1b => nop, g1y => \-srcspcpopreal\, g2a => '0', g2b => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');
  contrl_3e14 : sn74s08 port map(g4q    => \-nopa\, g4a => \-nop11\, g4b => \-inop\, g1b => '0', g1a => '0', g2b => '0', g2a => '0', g3a => '0', g3b => '0');
  contrl_3e18 : sn74s32 port map(g1a    => \-irdisp\, g1b => dr, g1y => \-ignpopj\, g2a => '0', g2b => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');
  contrl_3e22 : sn74s04 port map(g1a    => \-destspc\, g1q_n => destspc, g2a => nop, g2q_n => \-nop\, g3a => '0', g4a => '0', g5a => '0', g6a => '0');
  contrl_3e23 : sn74s00 port map(g1b    => dr, g1a => dp, g1q_n => \-dfall\, g2b => \-trap\, g2a => internal32, g2q_n => n, g3q_n => internal31, g3b => \-popj\, g3a => \-srcspcpopreal\, g4q_n => nop, g4a => \-trap\, g4b => \-nopa\);
  contrl_3e24 : sn74s08 port map(g1b    => irdisp, g1a => \-funct2\, g1q => dispenb, g2b => irjump, g2a => ir6, g2q => jfalse, g3q => jcalf, g3a => ir8, g3b => jfalse, g4q => jretf, g4a => ir6, g4b => jret);
  contrl_3e25 : sn74s64 port map(d4     => ir7, b2 => dn, a2 => dispenb, c3 => ir7, b3 => \-jcond\, a3 => jfalse, \out\ => internal32, a1 => hi4, b1 => iwrited, c4 => jcond, b4 => \-ir6\, a4 => irjump);
  contrl_3e26 : sn74s64 port map(d4     => jcond, b2 => \-jcond\, a2 => jcalf, c3 => \-dr\, b3 => dp, a3 => dispenb, \out\ => \-spush\, a1 => hi4, b1 => destspc, c4 => ir8, b4 => \-ir6\, a4 => irjump);
  contrl_3e27 : sn74s64 port map(d4     => hi4, b2 => \-jcond\, a2 => jfalse, c3 => jcond, b3 => \-ir6\, a3 => irjump, \out\ => pcs1, a1 => \-ignpopj\, b1 => popj, c4 => \-dp\, b4 => dr, a4 => dispenb);
  contrl_3e28 : sn74s64 port map(d4     => hi4, b2 => \-jcond\, a2 => jretf, c3 => jcond, b3 => \-ir6\, a3 => jret, \out\ => \-spop\, a1 => \-ignpopj\, b1 => internal31, c4 => \-dp\, b4 => dr, a4 => dispenb);
  contrl_3e29 : sn74s11 port map(g1a    => \-ir8\, g1b => irjump, g2a => irjump, g2b => ir8, g2c => ir9, g2y => iwrite, g1y => jret, g1c => ir9, g3a => '0', g3b => '0', g3c => '0');
  contrl_3f20 : sn74s04 port map(g1a    => \-popj\, g1q_n => popj, g2a => ir8, g2q_n => \-ir8\, g3a => ir6, g3q_n => \-ir6\, g4q_n => spush, g4a => \-spush\, g5q_n => \-dp\, g5a => dp, g6q_n => \-dr\, g6a => dr);
  contrl_3f30 : sn74s64 port map(d4     => hi4, b2 => \-dfall\, a2 => dispenb, c3 => hi4, b3 => \-jcond\, a3 => jretf, \out\ => pcs0, a1 => hi4, b1 => popj, c4 => jcond, b4 => \-ir6\, a4 => jret);
  contrl_4d09 : sn74s08 port map(g1b    => \-spush\, g1a => \-spop\, g1q => \-spcnt\, g2b => '0', g2a => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');
  contrl_4e30 : sn74s37 port map(g1a    => \-destspcd\, g1b => \-destspcd\, g1y => destspcd, g2a => wp4c, g2b => spushd, g2y => \-swpb\, g3y => \-swpa\, g3a => spushd, g3b => wp4c, g4a => '0', g4b => '0');
end architecture;
