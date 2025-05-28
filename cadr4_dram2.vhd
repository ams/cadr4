library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_dram2 is
  port (
    dadr10c     : out std_logic;
    \-dadr0c\   : out std_logic;
    \-dadr1c\   : out std_logic;
    \-dadr2c\   : out std_logic;
    \-dadr3c\   : out std_logic;
    \-dadr4c\   : out std_logic;
    dpar        : out std_logic;
    \-dadr5c\   : out std_logic;
    \-dadr6c\   : out std_logic;
    \-dadr7c\   : out std_logic;
    \-dadr8c\   : out std_logic;
    \-dadr9c\   : out std_logic;
    \-dwec\     : out std_logic;
    aa17        : in  std_logic;
    \-dadr10c\  : out std_logic;
    dr          : out std_logic;
    aa16        : in  std_logic;
    r3          : in  std_logic;
    ir18b       : in  std_logic;
    hi11        : in  std_logic;
    dmask6      : in  std_logic;
    r6          : in  std_logic;
    ir15b       : in  std_logic;
    dmask3      : in  std_logic;
    dp          : out std_logic;
    aa15        : in  std_logic;
    dn          : out std_logic;
    aa14        : in  std_logic;
    r2          : in  std_logic;
    ir17b       : in  std_logic;
    dmask5      : in  std_logic;
    r5          : in  std_logic;
    ir14b       : in  std_logic;
    dmask2      : in  std_logic;
    dpc13       : out std_logic;
    aa13        : in  std_logic;
    dpc12       : out std_logic;
    aa12        : in  std_logic;
    r1          : in  std_logic;
    ir16b       : in  std_logic;
    dmask4      : in  std_logic;
    r4          : in  std_logic;
    ir13b       : in  std_logic;
    dmask1      : in  std_logic;
    ir12b       : in  std_logic;
    vmo19       : in  std_logic;
    ir9b        : in  std_logic;
    r0          : in  std_logic;
    dmask0      : in  std_logic;
    \-dmapbenb\ : in  std_logic;
    vmo18       : in  std_logic;
    ir8b        : in  std_logic;
    hi6         : in  std_logic;
    ir22b       : in  std_logic;
    ir21b       : in  std_logic;
    ir20b       : in  std_logic;
    ir19b       : in  std_logic;
    dispwr      : in  std_logic;
    wp2         : in  std_logic);
end;

architecture ttl of cadr4_dram2 is
  signal nc100 : std_logic;
  signal nc101 : std_logic;
  signal nc102 : std_logic;
  signal nc103 : std_logic;
  signal nc104 : std_logic;
  signal nc105 : std_logic;
  signal nc106 : std_logic;
  signal nc107 : std_logic;
  signal nc108 : std_logic;
  signal nc109 : std_logic;
  signal nc110 : std_logic;
  signal nc111 : std_logic;
  signal nc112 : std_logic;
  signal nc113 : std_logic;
  signal nc114 : std_logic;
  signal nc115 : std_logic;
  signal nc116 : std_logic;
  signal nc117 : std_logic;
  signal nc118 : std_logic;
  signal nc119 : std_logic;
  signal nc120 : std_logic;
  signal nc121 : std_logic;
  signal nc122 : std_logic;
  signal nc123 : std_logic;
  signal nc124 : std_logic;
  signal nc125 : std_logic;
  signal nc126 : std_logic;
  signal nc127 : std_logic;
  signal nc128 : std_logic;
  signal nc129 : std_logic;
  signal nc130 : std_logic;
  signal nc131 : std_logic;
  signal nc132 : std_logic;
  signal nc133 : std_logic;
  signal nc134 : std_logic;
  signal nc135 : std_logic;
  signal nc136 : std_logic;
  signal nc137 : std_logic;
  signal nc138 : std_logic;
  signal nc139 : std_logic;
  signal nc140 : std_logic;
  signal nc141 : std_logic;
  signal nc142 : std_logic;
begin
  dram2_1f16 : am93425a port map(
    ce_n  => dadr10c,       -- p1 (DADR10C)
    a0    => \-dadr0c\,     -- p2 (-DADR0C)
    a1    => \-dadr1c\,     -- p3 (-DADR1C)
    a2    => \-dadr2c\,     -- p4 (-DADR2C)
    a3    => \-dadr3c\,     -- p5 (-DADR3C)
    a4    => \-dadr4c\,     -- p6 (-DADR4C)
    do    => dpar,          -- p7 (DPAR)
    a5    => \-dadr5c\,     -- p9 (-DADR5C)
    a6    => \-dadr6c\,     -- p10 (SIGNAL name mismatch in netlist, -DADR6C expected)
    a7    => \-dadr7c\,     -- p11 (-DADR7C)
    a8    => \-dadr8c\,     -- p12 (-DADR8C)
    a9    => \-dadr9c\,     -- p13 (-DADR9C)
    we_n  => \-dwec\,       -- p14 (-DWEC)
    di    => aa17           -- p15 (AA17)
  );
  dram2_1f17 : am93425a port map(
    ce_n  => \-dadr10c\,    -- p1 (-DADR10C)
    a0    => \-dadr0c\,     -- p2 (-DADR0C)
    a1    => \-dadr1c\,     -- p3 (-DADR1C)
    a2    => \-dadr2c\,     -- p4 (-DADR2C)
    a3    => \-dadr3c\,     -- p5 (-DADR3C)
    a4    => \-dadr4c\,     -- p6 (-DADR4C)
    do    => dpar,          -- p7 (DPAR)
    a5    => \-dadr5c\,     -- p9 (-DADR5C)
    a6    => \-dadr6c\,     -- p10 (SIGNAL name mismatch in netlist, -DADR6C expected)
    a7    => \-dadr7c\,     -- p11 (-DADR7C)
    a8    => \-dadr8c\,     -- p12 (-DADR8C)
    a9    => \-dadr9c\,     -- p13 (-DADR9C)
    we_n  => \-dwec\,       -- p14 (-DWEC)
    di    => aa17           -- p15 (AA17)
  );
  dram2_1f18 : am93425a port map(
    ce_n  => dadr10c,       -- p1 (DADR10C)
    a0    => \-dadr0c\,     -- p2 (-DADR0C)
    a1    => \-dadr1c\,     -- p3 (-DADR1C)
    a2    => \-dadr2c\,     -- p4 (-DADR2C)
    a3    => \-dadr3c\,     -- p5 (-DADR3C)
    a4    => \-dadr4c\,     -- p6 (-DADR4C)
    do    => dr,            -- p7 (DR)
    a5    => \-dadr5c\,     -- p9 (-DADR5C)
    a6    => \-dadr6c\,     -- p10 (SIGNAL name mismatch in netlist, -DADR6C expected)
    a7    => \-dadr7c\,     -- p11 (-DADR7C)
    a8    => \-dadr8c\,     -- p12 (-DADR8C)
    a9    => \-dadr9c\,     -- p13 (-DADR9C)
    we_n  => \-dwec\,       -- p14 (-DWEC)
    di    => aa16           -- p15 (AA16)
  );
  dram2_1f19 : am93425a port map(
    ce_n  => \-dadr10c\,    -- p1 (-DADR10C)
    a0    => \-dadr0c\,     -- p2 (-DADR0C)
    a1    => \-dadr1c\,     -- p3 (-DADR1C)
    a2    => \-dadr2c\,     -- p4 (-DADR2C)
    a3    => \-dadr3c\,     -- p5 (-DADR3C)
    a4    => \-dadr4c\,     -- p6 (-DADR4C)
    do    => dr,            -- p7 (DR)
    a5    => \-dadr5c\,     -- p9 (-DADR5C)
    a6    => \-dadr6c\,     -- p10 (SIGNAL name mismatch in netlist, -DADR6C expected)
    a7    => \-dadr7c\,     -- p11 (-DADR7C)
    a8    => \-dadr8c\,     -- p12 (-DADR8C)
    a9    => \-dadr9c\,     -- p13 (-DADR9C)
    we_n  => \-dwec\,       -- p14 (-DWEC)
    di    => aa16           -- p15 (AA16)
  );
  dram2_1f20 : sn74s51 port map(
    g1a   => r3,            -- p1 (R3)
    g2a   => ir18b,         -- p2 (IR18B)
    g2b   => hi11,          -- p3 (HI11)
    g2c   => dmask6,        -- p4 (DMASK6)
    g2d   => r6,            -- p5 (R6)
    g2y   => \-dadr6c\,     -- p6 (-DADR6C)    
    g1y   => \-dadr3c\,     -- p8 (-DADR3C)
    g1c   => ir15b,         -- p9 (IR15B)
    g1d   => hi11,          -- p10 (HI11)    
    g1b   => dmask3         -- p13 (DMASK3)
  );
  dram2_1f21 : am93425a port map(
    ce_n  => dadr10c,       -- p1 (DADR10C)
    a0    => \-dadr0c\,     -- p2 (-DADR0C)
    a1    => \-dadr1c\,     -- p3 (-DADR1C)
    a2    => \-dadr2c\,     -- p4 (-DADR2C)
    a3    => \-dadr3c\,     -- p5 (-DADR3C)
    a4    => \-dadr4c\,     -- p6 (-DADR4C)
    do    => dp,            -- p7 (DP)
    a5    => \-dadr5c\,     -- p9 (-DADR5C)
    a6    => \-dadr6c\,     -- p10 (SIGNAL name mismatch in netlist, -DADR6C expected)
    a7    => \-dadr7c\,     -- p11 (-DADR7C)
    a8    => \-dadr8c\,     -- p12 (-DADR8C)
    a9    => \-dadr9c\,     -- p13 (-DADR9C)
    we_n  => \-dwec\,       -- p14 (-DWEC)
    di    => aa15           -- p15 (AA15)
  );
  dram2_1f22 : am93425a port map(
    ce_n  => \-dadr10c\,    -- p1 (-DADR10C)
    a0    => \-dadr0c\,     -- p2 (-DADR0C)
    a1    => \-dadr1c\,     -- p3 (-DADR1C)
    a2    => \-dadr2c\,     -- p4 (-DADR2C)
    a3    => \-dadr3c\,     -- p5 (-DADR3C)
    a4    => \-dadr4c\,     -- p6 (-DADR4C)
    do    => dp,            -- p7 (DP)
    a5    => \-dadr5c\,     -- p9 (-DADR5C)
    a6    => \-dadr6c\,     -- p10 (SIGNAL name mismatch in netlist, -DADR6C expected)
    a7    => \-dadr7c\,     -- p11 (-DADR7C)
    a8    => \-dadr8c\,     -- p12 (-DADR8C)
    a9    => \-dadr9c\,     -- p13 (-DADR9C)
    we_n  => \-dwec\,       -- p14 (-DWEC)
    di    => aa15           -- p15 (AA15)
  );
  dram2_1f23 : am93425a port map(
    ce_n  => dadr10c,       -- p1 (DADR10C)
    a0    => \-dadr0c\,     -- p2 (-DADR0C)
    a1    => \-dadr1c\,     -- p3 (-DADR1C)
    a2    => \-dadr2c\,     -- p4 (-DADR2C)
    a3    => \-dadr3c\,     -- p5 (-DADR3C)
    a4    => \-dadr4c\,     -- p6 (-DADR4C)
    do    => dn,            -- p7 (DN)
    a5    => \-dadr5c\,     -- p9 (-DADR5C)
    a6    => \-dadr6c\,     -- p10 (SIGNAL name mismatch in netlist, -DADR6C expected)
    a7    => \-dadr7c\,     -- p11 (-DADR7C)
    a8    => \-dadr8c\,     -- p12 (-DADR8C)
    a9    => \-dadr9c\,     -- p13 (-DADR9C)
    we_n  => \-dwec\,       -- p14 (-DWEC)
    di    => aa14           -- p15 (AA14)
  );
  dram2_1f24 : am93425a port map(
    ce_n  => \-dadr10c\,    -- p1 (-DADR10C)
    a0    => \-dadr0c\,     -- p2 (-DADR0C)
    a1    => \-dadr1c\,     -- p3 (-DADR1C)
    a2    => \-dadr2c\,     -- p4 (-DADR2C)
    a3    => \-dadr3c\,     -- p5 (-DADR3C)
    a4    => \-dadr4c\,     -- p6 (-DADR4C)
    do    => dn,            -- p7 (DN)
    a5    => \-dadr5c\,     -- p9 (-DADR5C)
    a6    => \-dadr6c\,     -- p10 (SIGNAL name mismatch in netlist, -DADR6C expected)
    a7    => \-dadr7c\,     -- p11 (-DADR7C)
    a8    => \-dadr8c\,     -- p12 (-DADR8C)
    a9    => \-dadr9c\,     -- p13 (-DADR9C)
    we_n  => \-dwec\,       -- p14 (-DWEC)
    di    => aa14           -- p15 (AA14)
  );
  dram2_1f25 : sn74s51 port map(
    g1a   => r2,            -- p1 (R2)
    g2a   => ir17b,         -- p2 (IR17B)
    g2b   => hi11,          -- p3 (HI11)
    g2c   => dmask5,        -- p4 (DMASK5)
    g2d   => r5,            -- p5 (R5)
    g2y   => \-dadr5c\,     -- p6 (-DADR5C)    
    g1y   => \-dadr2c\,     -- p8 (-DADR2C)
    g1c   => ir14b,         -- p9 (IR14B)
    g1d   => hi11,          -- p10 (HI11)  
    g1b   => dmask2         -- p13 (DMASK2)
  );
  dram2_1f26 : am93425a port map(
    ce_n  => dadr10c,       -- p1 (DADR10C)
    a0    => \-dadr0c\,     -- p2 (-DADR0C)
    a1    => \-dadr1c\,     -- p3 (-DADR1C)
    a2    => \-dadr2c\,     -- p4 (-DADR2C)
    a3    => \-dadr3c\,     -- p5 (-DADR3C)
    a4    => \-dadr4c\,     -- p6 (-DADR4C)
    do    => dpc13,         -- p7 (DPC13)
    a5    => \-dadr5c\,     -- p9 (-DADR5C)
    a6    => \-dadr6c\,     -- p10 (SIGNAL name mismatch in netlist, -DADR6C expected)
    a7    => \-dadr7c\,     -- p11 (-DADR7C)
    a8    => \-dadr8c\,     -- p12 (-DADR8C)
    a9    => \-dadr9c\,     -- p13 (-DADR9C)
    we_n  => \-dwec\,       -- p14 (-DWEC)
    di    => aa13           -- p15 (AA13)
  );
  dram2_1f27 : am93425a port map(
    ce_n  => \-dadr10c\,    -- p1 (-DADR10C)
    a0    => \-dadr0c\,     -- p2 (-DADR0C)
    a1    => \-dadr1c\,     -- p3 (-DADR1C)
    a2    => \-dadr2c\,     -- p4 (-DADR2C)
    a3    => \-dadr3c\,     -- p5 (-DADR3C)
    a4    => \-dadr4c\,     -- p6 (-DADR4C)
    do    => dpc13,         -- p7 (DPC13)
    a5    => \-dadr5c\,     -- p9 (-DADR5C)
    a6    => \-dadr6c\,     -- p10 (SIGNAL name mismatch in netlist, -DADR6C expected)
    a7    => \-dadr7c\,     -- p11 (-DADR7C)
    a8    => \-dadr8c\,     -- p12 (-DADR8C)
    a9    => \-dadr9c\,     -- p13 (-DADR9C)
    we_n  => \-dwec\,       -- p14 (-DWEC)
    di    => aa13           -- p15 (AA13)
  );
  dram2_1f28 : am93425a port map(
    ce_n  => dadr10c,       -- p1 (DADR10C)
    a0    => \-dadr0c\,     -- p2 (-DADR0C)
    a1    => \-dadr1c\,     -- p3 (-DADR1C)
    a2    => \-dadr2c\,     -- p4 (-DADR2C)
    a3    => \-dadr3c\,     -- p5 (-DADR3C)
    a4    => \-dadr4c\,     -- p6 (-DADR4C)
    do    => dpc12,         -- p7 (DPC12)
    a5    => \-dadr5c\,     -- p9 (-DADR5C)
    a6    => \-dadr6c\,     -- p10 (SIGNAL name mismatch in netlist, -DADR6C expected)
    a7    => \-dadr7c\,     -- p11 (-DADR7C)
    a8    => \-dadr8c\,     -- p12 (-DADR8C)
    a9    => \-dadr9c\,     -- p13 (-DADR9C)
    we_n  => \-dwec\,       -- p14 (-DWEC)
    di    => aa12           -- p15 (AA12)
  );
  dram2_1f29 : am93425a port map(
    ce_n  => \-dadr10c\,    -- p1 (-DADR10C)
    a0    => \-dadr0c\,     -- p2 (-DADR0C)
    a1    => \-dadr1c\,     -- p3 (-DADR1C)
    a2    => \-dadr2c\,     -- p4 (-DADR2C)
    a3    => \-dadr3c\,     -- p5 (-DADR3C)
    a4    => \-dadr4c\,     -- p6 (-DADR4C)
    do    => dpc12,         -- p7 (DPC12)
    a5    => \-dadr5c\,     -- p9 (-DADR5C)
    a6    => \-dadr6c\,     -- p10 (SIGNAL name mismatch in netlist, -DADR6C expected)
    a7    => \-dadr7c\,     -- p11 (-DADR7C)
    a8    => \-dadr8c\,     -- p12 (-DADR8C)
    a9    => \-dadr9c\,     -- p13 (-DADR9C)
    we_n  => \-dwec\,       -- p14 (-DWEC)
    di    => aa12           -- p15 (AA12)
  );
  dram2_1f30 : sn74s51 port map(
    g1a   => r1,            -- p1 (R1)
    g2a   => ir16b,         -- p2 (IR16B)
    g2b   => hi11,          -- p3 (HI11)
    g2c   => dmask4,        -- p4 (DMASK4)
    g2d   => r4,            -- p5 (R4)
    g2y   => \-dadr4c\,     -- p6 (-DADR4C)
    g1y   => \-dadr1c\,     -- p8 (-DADR1C)
    g1c   => ir13b,         -- p9 (IR13B)
    g1d   => hi11,          -- p10 (HI11)    
    g1b   => dmask1         -- p13 (DMASK1)
  );
  dram2_2f01 : sn74s64 port map(
    d4    => ir12b,         -- p1 (IR12B)
    b2    => vmo19,         -- p2 (VMO19)
    a2    => ir9b,          -- p3 (IR9B)
    c3    => r0,            -- p4 (R0)
    b3    => dmask0,        -- p5 (DMASK0)
    a3    => \-dmapbenb\,   -- p6 (-DMAPBENB)
    \out\ => \-dadr0c\,     -- p8 (-DADR0C)
    a1    => vmo18,         -- p9 (VMO18)
    b1    => ir8b,          -- p10 (IR8B)
    c4    => hi6,           -- p11 (HI6)
    b4    => hi6,           -- p12 (HI6)
    a4    => hi6            -- p13 (HI6)
  );
  dram2_2f02 : sn74s04 port map(
    g1a   => nc110,         -- p1 (NC)
    g1q_n => nc111,         -- p2 (NC)
    g2a   => \-dadr10c\,    -- p3 (-DADR10C)
    g2q_n => dadr10c,       -- p4 (DADR10C)
    g3a   => ir22b,         -- p5 (IR22B)
    g3q_n => \-dadr10c\,    -- p6 (-DADR10C)    
    g4q_n => \-dadr9c\,     -- p8 (-DADR9C)
    g4a   => ir21b,         -- p9 (IR21B)
    g5q_n => \-dadr8c\,     -- p10 (-DADR8C)
    g5a   => ir20b,         -- p11 (IR20B)
    g6q_n => \-dadr7c\,     -- p12 (-DADR7C)
    g6a   => ir19b          -- p13 (IR19B)
  );
  dram2_2f03 : sn74s37 port map(    
    g1a   => nc134, -- p1
    g1b   => nc135, -- p2
    g1y   => nc136, -- p3
    g2a   => nc137, -- p4
    g2b   => nc138, -- p5
    g2y   => nc139, -- p6    
    g3y   => \-dwec\,       -- p8 (-DWEC)
    g3a   => dispwr,        -- p9 (DISPWR)
    g3b   => wp2,           -- p10 (WP2)
    g4y   => nc140, --p11
    g4a   => nc141, -- p12
    g4b   => nc142 -- p13    
  );
end architecture;
