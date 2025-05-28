library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_dram1 is
  port (
    wp2         : in  std_logic;
    dispwr      : in  std_logic;
    \-dweb\     : out std_logic;
    \-vmo19\    : out std_logic;
    vmo19       : out std_logic;
    \-vmo18\    : out std_logic;
    vmo18       : out std_logic;
    \-dadr9b\   : out std_logic;
    ir21b       : out std_logic;
    \-dadr8b\   : out std_logic;
    ir20b       : out std_logic;
    \-dadr7b\   : out std_logic;
    ir19b       : in  std_logic;
    ir12b       : in  std_logic;
    ir9b        : out std_logic;
    r0          : in  std_logic;
    dmask0      : in  std_logic;
    \-dmapbenb\ : in  std_logic;
    \-dadr0b\   : out std_logic;
    ir8b        : out std_logic;
    hi6         : in  std_logic;
    dadr10a     : in  std_logic;
    \-dadr1b\   : out std_logic;
    \-dadr2b\   : out std_logic;
    \-dadr3b\   : out std_logic;
    \-dadr4b\   : out std_logic;
    dpc11       : out std_logic;
    \-dadr5b\   : out std_logic;
    \-dadr6b\   : out std_logic;
    aa11        : in  std_logic;
    \-dadr10a\  : in  std_logic;
    dpc10       : out std_logic;
    aa10        : in  std_logic;
    r3          : in  std_logic;
    ir18b       : in  std_logic;
    dmask6      : in  std_logic;
    r6          : in  std_logic;
    ir15b       : in  std_logic;
    dmask3      : in  std_logic;
    dpc9        : out std_logic;
    aa9         : in  std_logic;
    dadr10c     : in  std_logic;
    dpc8        : out std_logic;
    aa8         : in  std_logic;
    \-dadr10c\  : in  std_logic;
    r2          : in  std_logic;
    ir17b       : in  std_logic;
    dmask5      : in  std_logic;
    r5          : in  std_logic;
    ir14b       : in  std_logic;
    dmask2      : in  std_logic;
    dpc7        : out std_logic;
    aa7         : in  std_logic;
    dpc6        : out std_logic;
    aa6         : in  std_logic;
    r1          : in  std_logic;
    ir16b       : in  std_logic;
    dmask4      : in  std_logic;
    r4          : in  std_logic;
    ir13b       : in  std_logic;
    dmask1      : in  std_logic;
    gnd         : in  std_logic;
    ir20        : in  std_logic;
    ir21        : in  std_logic;
    ir22        : in  std_logic;
    ir8         : in  std_logic;
    ir9         : in  std_logic;
    ir22b       : out std_logic);
end;

architecture ttl of cadr4_dram1 is
  signal nc410 : std_logic;
  signal nc411 : std_logic;
  signal nc412 : std_logic;
  signal nc413 : std_logic;
  signal nc414 : std_logic;
  signal nc415 : std_logic;
  signal nc416 : std_logic;
  signal nc417 : std_logic;
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
begin
  dram1_2f03 : sn74s37 port map(            -- 74S37 (Quad 2-Input NAND Buffer)
    g1a => nc100,                           -- p1 (NC)
    g1b => nc101,                           -- p2 (NC)
    g1y => nc102,                           -- p3 (NC)
    g2a => wp2,                             -- p4 (WP2)
    g2b => dispwr,                          -- p5 (DISPWR)
    g2y => \-dweb\,                         -- p6 (-DWEB)
    g3y => nc103,                           -- p9 (NC)
    g3a => nc104,                           -- p10 (NC)
    g3b => nc105,                           -- p11 (NC)
    g4y => nc106,                           -- p8 (NC)
    g4a => nc107,                           -- p13 (NC)
    g4b => nc108                            -- p12 (NC)
    );
  dram1_2f04 : sn74s04 port map(            -- 74S04 (Hex Inverter)
    g1a   => nc109,                         -- p1 (NC)
    g1q_n => nc110,                         -- p2 (NC)
    g2a   => \-vmo19\,                      -- p3 (-VMO19)
    g2q_n => vmo19,                         -- p4 (VMO19)
    g3a   => \-vmo18\,                      -- p5 (-VMO18)
    g3q_n => vmo18,                         -- p6 (VMO18)
    g4q_n => \-dadr9b\,                     -- p8 (-DADR9B)
    g4a   => ir21b,                         -- p9 (IR21B)
    g5q_n => \-dadr8b\,                     -- p10 (-DADR8B)
    g5a   => ir20b,                         -- p11 (IR20B)
    g6q_n => \-dadr7b\,                     -- p12 (-DADR7B)
    g6a   => ir19b                          -- p13 (IR19B)
    );
  dram1_2f05 : sn74s64 port map(            -- 74S64 (4-2-3-2-Input AND-OR-INVERT Gate)
    d4    => ir12b,                        -- p1 (IR12B)
    b2    => vmo19,                        -- p2 (VMO19)
    a2    => ir9b,                         -- p3 (IR9B)
    c3    => r0,                           -- p4 (R0)    
    b3    => dmask0,                       -- p5 (DMASK0)
    a3    => \-dmapbenb\,                  -- p6 (-DMAPBENB)
    \out\ => \-dadr0b\,                    -- p8 (-DADR0B)
    b1    => vmo18,                        -- p9 (VMO18)
    a1    => ir8b,                         -- p10 (IR8B)
    c4    => hi6,                          -- p11 (HI6)
    b4    => hi6,                          -- p12 (HI6)
    a4    => hi6                           -- p13 (HI6)
    );
  dram1_2f06 : am93425a port map(           -- 93425A (1Kx1 bit RAM)
    ce_n => dadr10a,                        -- p1 (DADR10A)
    a0   => \-dadr0b\,                      -- p2 (-DADR0B)
    a1   => \-dadr1b\,                      -- p3 (-DADR1B)
    a2   => \-dadr2b\,                      -- p4 (-DADR2B)
    a3   => \-dadr3b\,                      -- p5 (-DADR3B)
    a4   => \-dadr4b\,                      -- p6 (-DADR4B)
    do   => dpc11,                          -- p7 (DPC11)
    a5   => \-dadr5b\,                      -- p9 (-DADR5B)
    a6   => \-dadr6b\,                      -- p10 (-DADR6B)
    a7   => \-dadr7b\,                      -- p11 (-DADR7B)
    a8   => \-dadr8b\,                      -- p12 (-DADR8B)
    a9   => \-dadr9b\,                      -- p13 (-DADR9B)
    we_n => \-dweb\,                        -- p14 (-DWEB)
    di   => aa11                           -- p15 (AA11)
    );
  dram1_2f07 : am93425a port map(           -- 93425A (1Kx1 bit RAM)
    ce_n => \-dadr10a\,                     -- p1 (-DADR10A)
    a0   => \-dadr0b\,                      -- p2 (-DADR0B)
    a1   => \-dadr1b\,                      -- p3 (-DADR1B)
    a2   => \-dadr2b\,                      -- p4 (-DADR2B)
    a3   => \-dadr3b\,                      -- p5 (-DADR3B)
    a4   => \-dadr4b\,                      -- p6 (-DADR4B)
    do   => dpc11,                          -- p7 (DPC11)
    a5   => \-dadr5b\,                      -- p9 (-DADR5B)
    a6   => \-dadr6b\,                      -- p10 (-DADR6B)
    a7   => \-dadr7b\,                      -- p11 (-DADR7B)
    a8   => \-dadr8b\,                      -- p12 (-DADR8B)
    a9   => \-dadr9b\,                      -- p13 (-DADR9B)
    we_n => \-dweb\,                        -- p14 (-DWEB)
    di   => aa11                           -- p15 (AA11)
    );
  dram1_2f08 : am93425a port map(           -- 93425A (1Kx1 bit RAM)
    ce_n => dadr10a,                        -- p1 (DADR10A)
    a0   => \-dadr0b\,                      -- p2 (-DADR0B)
    a1   => \-dadr1b\,                      -- p3 (-DADR1B)
    a2   => \-dadr2b\,                      -- p4 (-DADR2B)
    a3   => \-dadr3b\,                      -- p5 (-DADR3B)
    a4   => \-dadr4b\,                      -- p6 (-DADR4B)
    do   => dpc10,                          -- p7 (DPC10)
    a5   => \-dadr5b\,                      -- p9 (-DADR5B)
    a6   => \-dadr6b\,                      -- p10 (-DADR6B)
    a7   => \-dadr7b\,                      -- p11 (-DADR7B)
    a8   => \-dadr8b\,                      -- p12 (-DADR8B)
    a9   => \-dadr9b\,                      -- p13 (-DADR9B)
    we_n => \-dweb\,                        -- p14 (-DWEB)
    di   => aa10                           -- p15 (AA10)
    );
  dram1_2f09 : am93425a port map(           -- 93425A (1Kx1 bit RAM)
    ce_n => \-dadr10a\,                     -- p1 (-DADR10A)
    a0   => \-dadr0b\,                      -- p2 (-DADR0B)
    a1   => \-dadr1b\,                      -- p3 (-DADR1B)
    a2   => \-dadr2b\,                      -- p4 (-DADR2B)
    a3   => \-dadr3b\,                      -- p5 (-DADR3B)
    a4   => \-dadr4b\,                      -- p6 (-DADR4B)
    do   => dpc10,                          -- p7 (DPC10)
    a5   => \-dadr5b\,                      -- p9 (-DADR5B)
    a6   => \-dadr6b\,                      -- p10 (-DADR6B)
    a7   => \-dadr7b\,                      -- p11 (-DADR7B)
    a8   => \-dadr8b\,                      -- p12 (-DADR8B)
    a9   => \-dadr9b\,                      -- p13 (-DADR9B)
    we_n => \-dweb\,                        -- p14 (-DWEB)
    di   => aa10                           -- p15 (AA10)
    );
  dram1_2f10 : sn74s51 port map(            -- 74S51 (AND-OR-INVERT Gates)
    g1a => r3,                              -- p1 (R3)
    g1b => dmask3,                          -- p13 (DMASK3)
    g1c => ir15b,                           -- p9 (IR15B)
    g1d => hi6,                             -- p10 (HI6)
    g1y => \-dadr3b\,                       -- p8 (-DADR3B)
    g2a => ir18b,                           -- p2 (IR18B)
    g2b => hi6,                             -- p3 (HI6)
    g2c => dmask6,                          -- p4 (DMASK6)
    g2d => r6,                              -- p5 (R6)
    g2y => \-dadr6b\                         -- p6 (-DADR6B)
    );
  dram1_2f11 : am93425a port map(           -- 93425A (1Kx1 bit RAM)
    ce_n => dadr10a,                        -- p1 (DADR10A)
    a0   => \-dadr0b\,                      -- p2 (-DADR0B)
    a1   => \-dadr1b\,                      -- p3 (-DADR1B)
    a2   => \-dadr2b\,                      -- p4 (-DADR2B)
    a3   => \-dadr3b\,                      -- p5 (-DADR3B)
    a4   => \-dadr4b\,                      -- p6 (-DADR4B)
    do   => dpc9,                           -- p7 (DPC9)
    a5   => \-dadr5b\,                      -- p9 (-DADR5B)
    a6   => \-dadr6b\,                      -- p10 (-DADR6B)
    a7   => \-dadr7b\,                      -- p11 (-DADR7B)
    a8   => \-dadr8b\,                      -- p12 (-DADR8B)
    a9   => \-dadr9b\,                      -- p13 (-DADR9B)
    we_n => \-dweb\,                        -- p14 (-DWEB)
    di   => aa9                            -- p15 (AA9)
    );
  dram1_2f12 : am93425a port map(           -- 93425A (1Kx1 bit RAM)
    ce_n => \-dadr10a\,                     -- p1 (-DADR10A)
    a0   => \-dadr0b\,                      -- p2 (-DADR0B)
    a1   => \-dadr1b\,                      -- p3 (-DADR1B)
    a2   => \-dadr2b\,                      -- p4 (-DADR2B)
    a3   => \-dadr3b\,                      -- p5 (-DADR3B)
    a4   => \-dadr4b\,                      -- p6 (-DADR4B)
    do   => dpc9,                           -- p7 (DPC9)
    a5   => \-dadr5b\,                      -- p9 (-DADR5B)
    a6   => \-dadr6b\,                      -- p10 (-DADR6B)
    a7   => \-dadr7b\,                      -- p11 (-DADR7B)
    a8   => \-dadr8b\,                      -- p12 (-DADR8B)
    a9   => \-dadr9b\,                      -- p13 (-DADR9B)
    we_n => \-dweb\,                        -- p14 (-DWEB)
    di   => aa9                            -- p15 (AA9)
    );
  dram1_2f13 : am93425a port map(           -- 93425A (1Kx1 bit RAM)
    ce_n => dadr10c,                        -- p1 (DADR10C)
    a0   => \-dadr0b\,                      -- p2 (-DADR0B)
    a1   => \-dadr1b\,                      -- p3 (-DADR1B)
    a2   => \-dadr2b\,                      -- p4 (-DADR2B)
    a3   => \-dadr3b\,                      -- p5 (-DADR3B)
    a4   => \-dadr4b\,                      -- p6 (-DADR4B)
    do   => dpc8,                           -- p7 (DPC8)
    a5   => \-dadr5b\,                      -- p9 (-DADR5B)
    a6   => \-dadr6b\,                      -- p10 (-DADR6B)
    a7   => \-dadr7b\,                      -- p11 (-DADR7B)
    a8   => \-dadr8b\,                      -- p12 (-DADR8B)
    a9   => \-dadr9b\,                      -- p13 (-DADR9B)
    we_n => \-dweb\,                        -- p14 (-DWEB)
    di   => aa8                            -- p15 (AA8)
    );
  dram1_2f14 : am93425a port map(           -- 93425A (1Kx1 bit RAM)
    ce_n => \-dadr10c\,                     -- p1 (-DADR10C)
    a0   => \-dadr0b\,                      -- p2 (-DADR0B)
    a1   => \-dadr1b\,                      -- p3 (-DADR1B)
    a2   => \-dadr2b\,                      -- p4 (-DADR2B)
    a3   => \-dadr3b\,                      -- p5 (-DADR3B)
    a4   => \-dadr4b\,                      -- p6 (-DADR4B)
    do   => dpc8,                           -- p7 (DPC8)
    a5   => \-dadr5b\,                      -- p9 (-DADR5B)
    a6   => \-dadr6b\,                      -- p10 (-DADR6B)
    a7   => \-dadr7b\,                      -- p11 (-DADR7B)
    a8   => \-dadr8b\,                      -- p12 (-DADR8B)
    a9   => \-dadr9b\,                      -- p13 (-DADR9B)
    we_n => \-dweb\,                        -- p14 (-DWEB)
    di   => aa8                            -- p15 (AA8)
    );
  dram1_2f15 : sn74s51 port map(            -- 74S51 (AND-OR-INVERT Gates)
    g1a => r2,                              -- p1 (R2)
    g1b => dmask2,                          -- p13 (DMASK2)
    g1c => ir14b,                           -- p9 (IR14B)
    g1d => hi6,                             -- p10 (HI6)
    g1y => \-dadr2b\,                       -- p8 (-DADR2B)
    g2a => ir17b,                           -- p2 (IR17B)
    g2b => hi6,                             -- p3 (HI6)
    g2c => dmask5,                          -- p4 (DMASK5)
    g2d => r5,                              -- p5 (R5)
    g2y => \-dadr5b\                         -- p6 (-DADR5B)
    );
  dram1_2f16 : am93425a port map(           -- 93425A (1Kx1 bit RAM)
    ce_n => dadr10c,                        -- p1 (DADR10C)
    a0   => \-dadr0b\,                      -- p2 (-DADR0B)
    a1   => \-dadr1b\,                      -- p3 (-DADR1B)
    a2   => \-dadr2b\,                      -- p4 (-DADR2B)
    a3   => \-dadr3b\,                      -- p5 (-DADR3B)
    a4   => \-dadr4b\,                      -- p6 (-DADR4B)
    do   => dpc7,                           -- p7 (DPC7)
    a5   => \-dadr5b\,                      -- p9 (-DADR5B)
    a6   => \-dadr6b\,                      -- p10 (-DADR6B)
    a7   => \-dadr7b\,                      -- p11 (-DADR7B)
    a8   => \-dadr8b\,                      -- p12 (-DADR8B)
    a9   => \-dadr9b\,                      -- p13 (-DADR9B)
    we_n => \-dweb\,                        -- p14 (-DWEB)
    di   => aa7                            -- p15 (AA7)
    );
  dram1_2f17 : am93425a port map(           -- 93425A (1Kx1 bit RAM)
    ce_n => \-dadr10c\,                     -- p1 (-DADR10C)
    a0   => \-dadr0b\,                      -- p2 (-DADR0B)
    a1   => \-dadr1b\,                      -- p3 (-DADR1B)
    a2   => \-dadr2b\,                      -- p4 (-DADR2B)
    a3   => \-dadr3b\,                      -- p5 (-DADR3B)
    a4   => \-dadr4b\,                      -- p6 (-DADR4B)
    do   => dpc7,                           -- p7 (DPC7)
    a5   => \-dadr5b\,                      -- p9 (-DADR5B)
    a6   => \-dadr6b\,                      -- p10 (-DADR6B)
    a7   => \-dadr7b\,                      -- p11 (-DADR7B)
    a8   => \-dadr8b\,                      -- p12 (-DADR8B)
    a9   => \-dadr9b\,                      -- p13 (-DADR9B)
    we_n => \-dweb\,                        -- p14 (-DWEB)
    di   => aa7                            -- p15 (AA7)
    );
  dram1_2f18 : am93425a port map(           -- 93425A (1Kx1 bit RAM)
    ce_n => dadr10c,                        -- p1 (DADR10C)
    a0   => \-dadr0b\,                      -- p2 (-DADR0B)
    a1   => \-dadr1b\,                      -- p3 (-DADR1B)
    a2   => \-dadr2b\,                      -- p4 (-DADR2B)
    a3   => \-dadr3b\,                      -- p5 (-DADR3B)
    a4   => \-dadr4b\,                      -- p6 (-DADR4B)
    do   => dpc6,                           -- p7 (DPC6)
    a5   => \-dadr5b\,                      -- p9 (-DADR5B)
    a6   => \-dadr6b\,                      -- p10 (-DADR6B)
    a7   => \-dadr7b\,                      -- p11 (-DADR7B)
    a8   => \-dadr8b\,                      -- p12 (-DADR8B)
    a9   => \-dadr9b\,                      -- p13 (-DADR9B)
    we_n => \-dweb\,                        -- p14 (-DWEB)
    di   => aa6                            -- p15 (AA6)
    );
  dram1_2f19 : am93425a port map(           -- 93425A (1Kx1 bit RAM)
    ce_n => \-dadr10c\,                     -- p1 (-DADR10C)
    a0   => \-dadr0b\,                      -- p2 (-DADR0B)
    a1   => \-dadr1b\,                      -- p3 (-DADR1B)
    a2   => \-dadr2b\,                      -- p4 (-DADR2B)
    a3   => \-dadr3b\,                      -- p5 (-DADR3B)
    a4   => \-dadr4b\,                      -- p6 (-DADR4B)
    do   => dpc6,                           -- p7 (DPC6)
    a5   => \-dadr5b\,                      -- p9 (-DADR5B)
    a6   => \-dadr6b\,                      -- p10 (-DADR6B)
    a7   => \-dadr7b\,                      -- p11 (-DADR7B)
    a8   => \-dadr8b\,                      -- p12 (-DADR8B)
    a9   => \-dadr9b\,                      -- p13 (-DADR9B)
    we_n => \-dweb\,                        -- p14 (-DWEB)
    di   => aa6                            -- p15 (AA6)
    );
  dram1_2f20 : sn74s51 port map(            -- 74S51 (AND-OR-INVERT Gates)
    g1a => r1,                              -- p1 (R1)
    g1b => dmask1,                          -- p13 (DMASK1)
    g1c => ir13b,                           -- p9 (IR13B)
    g1d => hi6,                             -- p10 (HI6)
    g1y => \-dadr1b\,                       -- p8 (-DADR1B)
    g2a => ir16b,                           -- p2 (IR16B)
    g2b => hi6,                             -- p3 (HI6)
    g2c => dmask4,                          -- p4 (DMASK4)
    g2d => r4,                              -- p5 (R4)
    g2y => \-dadr4b\                         -- p6 (-DADR4B)
    );
  dram1_2f23 : sn74s241 port map(           -- 74S241 (Octal Buffer/Line Driver)
    aenb_n => gnd,                          -- p1 (GND)
    ain0   => ir20,                         -- p2 (IR20)
    aout0  => ir20b,                        -- p18 (IR20B)
    ain1   => ir21,                         -- p4 (IR21)
    aout1  => ir21b,                        -- p16 (IR21B)
    ain2   => ir22,                         -- p6 (IR22)
    aout2  => ir22b,                        -- p14 (IR22B)
    ain3   => ir8,                          -- p8 (IR8)
    aout3  => ir8b,                         -- p12 (IR8B)
    benb   => hi6,                          -- p19 (HI6)
    bin0   => ir9,                          -- p11 (IR9)
    bout0  => ir9b,                         -- p9 (IR9B)
    bin1   => nc116,                        -- p13 (NC)
    bout1  => nc117,                        -- p3 (NC)
    bin2   => nc414,                        -- p15 (NC)
    bout2  => nc411,                        -- p4 (NC) Note: p4 maps to bin1 and bout2 in 74S241 VHDL
    bin3   => nc415,                        -- p17 (NC)
    bout3  => nc410                         -- p6 (NC) Note: p6 maps to bin2 and bout3 in 74S241 VHDL
    );
end architecture;
