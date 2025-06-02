library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr;
use cadr.utilities.all;

entity cadr_dram0 is
  port (
    wp2         : in  std_logic;
    dispwr      : in  std_logic;
    \-dwea\     : out std_logic;
    \-dadr10a\  : out std_logic;
    dadr10a     : out std_logic;
    ir22b       : in  std_logic;
    \-dadr9a\   : out std_logic;
    ir21b       : in  std_logic;
    \-dadr8a\   : out std_logic;
    ir20b       : in  std_logic;
    \-dadr7a\   : out std_logic;
    ir19b       : out std_logic;
    ir12b       : out std_logic;
    vmo19       : in  std_logic;
    ir9b        : in  std_logic;
    r0          : in  std_logic;
    dmask0      : in  std_logic;
    \-dmapbenb\ : in  std_logic;
    \-dadr0a\   : out std_logic;
    vmo18       : in  std_logic;
    ir8b        : in  std_logic;
    hi6         : in  std_logic;
    gnd         : in  std_logic;
    ir12        : in  std_logic;
    ir13        : in  std_logic;
    ir18b       : out std_logic;
    ir14        : in  std_logic;
    ir17b       : out std_logic;
    ir15        : in  std_logic;
    ir16b       : out std_logic;
    ir16        : in  std_logic;
    ir15b       : out std_logic;
    ir17        : in  std_logic;
    ir14b       : out std_logic;
    ir18        : in  std_logic;
    ir13b       : out std_logic;
    ir19        : in  std_logic;
    \-dadr1a\   : out std_logic;
    \-dadr2a\   : out std_logic;
    \-dadr3a\   : out std_logic;
    \-dadr4a\   : out std_logic;
    dpc5        : out std_logic;
    \-dadr5a\   : out std_logic;
    \-dadr6a\   : out std_logic;
    aa5         : in  std_logic;
    dpc4        : out std_logic;
    aa4         : in  std_logic;
    r3          : in  std_logic;
    dmask6      : in  std_logic;
    r6          : in  std_logic;
    dmask3      : in  std_logic;
    dpc3        : out std_logic;
    aa3         : in  std_logic;
    dpc2        : out std_logic;
    aa2         : in  std_logic;
    r2          : in  std_logic;
    hi4         : in  std_logic;
    dmask5      : in  std_logic;
    r5          : in  std_logic;
    dmask2      : in  std_logic;
    dpc1        : out std_logic;
    aa1         : in  std_logic;
    dpc0        : out std_logic;
    aa0         : in  std_logic;
    r1          : in  std_logic;
    dmask4      : in  std_logic;
    r4          : in  std_logic;
    dmask1      : in  std_logic);
end;

architecture ttl of cadr_dram0 is
begin
  dram0_2f03 : sn74s37 port map(
    g1a     => wp2,        -- p1 (WP2)
    g1b     => dispwr,     -- p2 (DISPWR)
    g1y     => \-dwea\,    -- p3 (-DWEA)
    g2a     => '0',      -- p4 (NC)
    g2b     => '0',      -- p5 (NC)
    g2y     => open,      -- p6 (NC)
    g3a     => '0',      -- p9 (NC)
    g3b     => '0',      -- p10 (NC)
    g3y     => open,      -- p8 (NC)
    g4a     => '0',      -- p12 (NC)
    g4b     => '0',      -- p13 (NC)
    g4y     => open       -- p11 (NC)
    );
  dram0_2f21 : sn74s04 port map(
    g1a     => '0',      -- p1 (NC)
    g1q_n   => open,      -- p2 (NC)
    g2a     => \-dadr10a\, -- p3 (-DADR10A)
    g2q_n   => dadr10a,    -- p4 (DADR10A)
    g3a     => ir22b,      -- p5 (IR22B)
    g3q_n   => \-dadr10a\, -- p6 (-DADR10A)
    g4q_n   => \-dadr9a\,  -- p8 (-DADR9A)
    g4a     => ir21b,      -- p9 (IR21B)
    g5q_n   => \-dadr8a\,  -- p10 (-DADR8A)
    g5a     => ir20b,      -- p11 (IR20B)
    g6q_n   => \-dadr7a\,  -- p12 (-DADR7A)
    g6a     => ir19b       -- p13 (IR19B)
    );
  dram0_2f24 : sn74s64 port map(
    d4      => ir12b,      -- p1 (IR12B)
    b2      => vmo19,      -- p2 (VMO19)
    a2      => ir9b,       -- p3 (IR9B)
    c3      => r0,         -- p4 (R0)
    b3      => dmask0,     -- p5 (DMASK0)
    a3      => \-dmapbenb\,-- p6 (-DMAPBENB)
    \out\   => \-dadr0a\,  -- p8 (-DADR0A)
    a1      => vmo18,      -- p9 (VMO18)
    b1      => ir8b,       -- p10 (IR8B)
    c4      => hi6,        -- p11 (HI6)
    b4      => hi6,        -- p12 (HI6)
    a4      => hi6         -- p13 (HI6)
    );
  dram0_2f25 : sn74s241 port map(
    aenb_n  => gnd,        -- p1 (GND)
    ain0    => ir12,       -- p2 (IR12)
    bout3   => ir19b,      -- p3 (IR19B)
    ain1    => ir13,       -- p4 (IR13)
    bout2   => ir18b,      -- p5 (IR18B)
    ain2    => ir14,       -- p6 (IR14)
    bout1   => ir17b,      -- p7 (IR17B)
    ain3    => ir15,       -- p8 (IR15)
    bout0   => ir16b,      -- p9 (IR16B)
    bin0    => ir16,       -- p11 (IR16)
    aout3   => ir15b,      -- p12 (IR15B)
    bin1    => ir17,       -- p13 (IR17)
    aout2   => ir14b,      -- p14 (IR14B)
    bin2    => ir18,       -- p15 (IR18)
    aout1   => ir13b,      -- p16 (IR13B)
    bin3    => ir19,       -- p17 (IR19)
    aout0   => ir12b,      -- p18 (IR12B)
    benb    => hi6         -- p19 (HI6)
    );
  dram0_2f26 : am93425a port map(
    ce_n    => dadr10a,    -- p1 (DADR10A)
    a0      => \-dadr0a\,  -- p2 (-DADR0A)
    a1      => \-dadr1a\,  -- p3 (-DADR1A)
    a2      => \-dadr2a\,  -- p4 (-DADR2A)
    a3      => \-dadr3a\,  -- p5 (-DADR3A)
    a4      => \-dadr4a\,  -- p6 (-DADR4A)
    do      => dpc5,       -- p7 (DPC5)
    a5      => \-dadr5a\,  -- p9 (-DADR5A)
    a6      => \-dadr6a\,  -- p10 (-DADR6A)
    a7      => \-dadr7a\,  -- p11 (-DADR7A)
    a8      => \-dadr8a\,  -- p12 (-DADR8A)
    a9      => \-dadr9a\,  -- p13 (-DADR9A)
    we_n    => \-dwea\,    -- p14 (-DWEA)
    di      => aa5         -- p15 (AA5)
    );
  dram0_2f27 : am93425a port map(
    ce_n    => \-dadr10a\, -- p1 (-DADR10A)
    a0      => \-dadr0a\,  -- p2 (-DADR0A)
    a1      => \-dadr1a\,  -- p3 (-DADR1A)
    a2      => \-dadr2a\,  -- p4 (-DADR2A)
    a3      => \-dadr3a\,  -- p5 (-DADR3A)
    a4      => \-dadr4a\,  -- p6 (-DADR4A)
    do      => dpc5,       -- p7 (DPC5)
    a5      => \-dadr5a\,  -- p9 (-DADR5A)
    a6      => \-dadr6a\,  -- p10 (-DADR6A)
    a7      => \-dadr7a\,  -- p11 (-DADR7A)
    a8      => \-dadr8a\,  -- p12 (-DADR8A)
    a9      => \-dadr9a\,  -- p13 (-DADR9A)
    we_n    => \-dwea\,    -- p14 (-DWEA)
    di      => aa5         -- p15 (AA5)
    );
  dram0_2f28 : am93425a port map(
    ce_n    => dadr10a,    -- p1 (DADR10A)
    a0      => \-dadr0a\,  -- p2 (-DADR0A)
    a1      => \-dadr1a\,  -- p3 (-DADR1A)
    a2      => \-dadr2a\,  -- p4 (-DADR2A)
    a3      => \-dadr3a\,  -- p5 (-DADR3A)
    a4      => \-dadr4a\,  -- p6 (-DADR4A)
    do      => dpc4,       -- p7 (DPC4)
    a5      => \-dadr5a\,  -- p9 (-DADR5A)
    a6      => \-dadr6a\,  -- p10 (-DADR6A)
    a7      => \-dadr7a\,  -- p11 (-DADR7A)
    a8      => \-dadr8a\,  -- p12 (-DADR8A)
    a9      => \-dadr9a\,  -- p13 (-DADR9A)
    we_n    => \-dwea\,    -- p14 (-DWEA)
    di      => aa4         -- p15 (AA4)
    );
  dram0_2f29 : am93425a port map(
    ce_n    => \-dadr10a\, -- p1 (-DADR10A)
    a0      => \-dadr0a\,  -- p2 (-DADR0A)
    a1      => \-dadr1a\,  -- p3 (-DADR1A)
    a2      => \-dadr2a\,  -- p4 (-DADR2A)
    a3      => \-dadr3a\,  -- p5 (-DADR3A)
    a4      => \-dadr4a\,  -- p6 (-DADR4A)
    do      => dpc4,       -- p7 (DPC4)
    a5      => \-dadr5a\,  -- p9 (-DADR5A)
    a6      => \-dadr6a\,  -- p10 (-DADR6A)
    a7      => \-dadr7a\,  -- p11 (-DADR7A)
    a8      => \-dadr8a\,  -- p12 (-DADR8A)
    a9      => \-dadr9a\,  -- p13 (-DADR9A)
    we_n    => \-dwea\,    -- p14 (-DWEA)
    di      => aa4         -- p15 (AA4)
    );
  dram0_2f30 : sn74s51 port map(
    g1a     => r3,         -- p1 (R3)
    g2a     => ir18b,      -- p2 (IR18B)
    g2b     => hi6,        -- p3 (HI6)
    g2c     => dmask6,     -- p4 (DMASK6)
    g2d     => r6,         -- p5 (R6)
    g2y     => \-dadr6a\,  -- p6 (-DADR6A)
    g1y     => \-dadr3a\,  -- p8 (-DADR3A)
    g1c     => ir15b,      -- p9 (IR15B)
    g1d     => hi6,        -- p10 (HI6)
    g1b     => dmask3      -- p13 (DMASK3)
    );
  dram0_3f01 : am93425a port map(
    ce_n    => dadr10a,    -- p1 (DADR10A)
    a0      => \-dadr0a\,  -- p2 (-DADR0A)
    a1      => \-dadr1a\,  -- p3 (-DADR1A)
    a2      => \-dadr2a\,  -- p4 (-DADR2A)
    a3      => \-dadr3a\,  -- p5 (-DADR3A)
    a4      => \-dadr4a\,  -- p6 (-DADR4A)
    do      => dpc3,       -- p7 (DPC3)
    a5      => \-dadr5a\,  -- p9 (-DADR5A)
    a6      => \-dadr6a\,  -- p10 (-DADR6A)
    a7      => \-dadr7a\,  -- p11 (-DADR7A)
    a8      => \-dadr8a\,  -- p12 (-DADR8A)
    a9      => \-dadr9a\,  -- p13 (-DADR9A)
    we_n    => \-dwea\,    -- p14 (-DWEA)
    di      => aa3         -- p15 (AA3)
    );
  dram0_3f02 : am93425a port map(
    ce_n    => \-dadr10a\, -- p1 (-DADR10A)
    a0      => \-dadr0a\,  -- p2 (-DADR0A)
    a1      => \-dadr1a\,  -- p3 (-DADR1A)
    a2      => \-dadr2a\,  -- p4 (-DADR2A)
    a3      => \-dadr3a\,  -- p5 (-DADR3A)
    a4      => \-dadr4a\,  -- p6 (-DADR4A)
    do      => dpc3,       -- p7 (DPC3)
    a5      => \-dadr5a\,  -- p9 (-DADR5A)
    a6      => \-dadr6a\,  -- p10 (-DADR6A)
    a7      => \-dadr7a\,  -- p11 (-DADR7A)
    a8      => \-dadr8a\,  -- p12 (-DADR8A)
    a9      => \-dadr9a\,  -- p13 (-DADR9A)
    we_n    => \-dwea\,    -- p14 (-DWEA)
    di      => aa3         -- p15 (AA3)
    );
  dram0_3f03 : am93425a port map(
    ce_n    => dadr10a,    -- p1 (DADR10A)
    a0      => \-dadr0a\,  -- p2 (-DADR0A)
    a1      => \-dadr1a\,  -- p3 (-DADR1A)
    a2      => \-dadr2a\,  -- p4 (-DADR2A)
    a3      => \-dadr3a\,  -- p5 (-DADR3A)
    a4      => \-dadr4a\,  -- p6 (-DADR4A)
    do      => dpc2,       -- p7 (DPC2)
    a5      => \-dadr5a\,  -- p9 (-DADR5A)
    a6      => \-dadr6a\,  -- p10 (-DADR6A)
    a7      => \-dadr7a\,  -- p11 (-DADR7A)
    a8      => \-dadr8a\,  -- p12 (-DADR8A)
    a9      => \-dadr9a\,  -- p13 (-DADR9A)
    we_n    => \-dwea\,    -- p14 (-DWEA)
    di      => aa2         -- p15 (AA2)
    );
  dram0_3f04 : am93425a port map(
    ce_n    => \-dadr10a\, -- p1 (-DADR10A)
    a0      => \-dadr0a\,  -- p2 (-DADR0A)
    a1      => \-dadr1a\,  -- p3 (-DADR1A)
    a2      => \-dadr2a\,  -- p4 (-DADR2A)
    a3      => \-dadr3a\,  -- p5 (-DADR3A)
    a4      => \-dadr4a\,  -- p6 (-DADR4A)
    do      => dpc2,       -- p7 (DPC2)
    a5      => \-dadr5a\,  -- p9 (-DADR5A)
    a6      => \-dadr6a\,  -- p10 (-DADR6A)
    a7      => \-dadr7a\,  -- p11 (-DADR7A)
    a8      => \-dadr8a\,  -- p12 (-DADR8A)
    a9      => \-dadr9a\,  -- p13 (-DADR9A)
    we_n    => \-dwea\,    -- p14 (-DWEA)
    di      => aa2         -- p15 (AA2)
    );
  dram0_3f05 : sn74s51 port map(
    g1a     => r2,         -- p1 (R2)
    g2a     => ir17b,      -- p2 (IR17B)
    g2b     => hi4,        -- p3 (HI4)
    g2c     => dmask5,     -- p4 (DMASK5)
    g2d     => r5,         -- p5 (R5)
    g2y     => \-dadr5a\,  -- p6 (-DADR5A)
    g1y     => \-dadr2a\,  -- p8 (-DADR2A)
    g1c     => ir14b,      -- p9 (IR14B)
    g1d     => hi4,        -- p10 (HI4)
    g1b     => dmask2      -- p13 (DMASK2)
    );
  dram0_3f06 : am93425a port map(
    ce_n    => dadr10a,    -- p1 (DADR10A)
    a0      => \-dadr0a\,  -- p2 (-DADR0A)
    a1      => \-dadr1a\,  -- p3 (-DADR1A)
    a2      => \-dadr2a\,  -- p4 (-DADR2A)
    a3      => \-dadr3a\,  -- p5 (-DADR3A)
    a4      => \-dadr4a\,  -- p6 (-DADR4A)
    do      => dpc1,       -- p7 (DPC1)
    a5      => \-dadr5a\,  -- p9 (-DADR5A)
    a6      => \-dadr6a\,  -- p10 (-DADR6A)
    a7      => \-dadr7a\,  -- p11 (-DADR7A)
    a8      => \-dadr8a\,  -- p12 (-DADR8A)
    a9      => \-dadr9a\,  -- p13 (-DADR9A)
    we_n    => \-dwea\,    -- p14 (-DWEA)
    di      => aa1         -- p15 (AA1)
    );
  dram0_3f07 : am93425a port map(
    ce_n    => \-dadr10a\, -- p1 (-DADR10A)
    a0      => \-dadr0a\,  -- p2 (-DADR0A)
    a1      => \-dadr1a\,  -- p3 (-DADR1A)
    a2      => \-dadr2a\,  -- p4 (-DADR2A)
    a3      => \-dadr3a\,  -- p5 (-DADR3A)
    a4      => \-dadr4a\,  -- p6 (-DADR4A)
    do      => dpc1,       -- p7 (DPC1)
    a5      => \-dadr5a\,  -- p9 (-DADR5A)
    a6      => \-dadr6a\,  -- p10 (-DADR6A)
    a7      => \-dadr7a\,  -- p11 (-DADR7A)
    a8      => \-dadr8a\,  -- p12 (-DADR8A)
    a9      => \-dadr9a\,  -- p13 (-DADR9A)
    we_n    => \-dwea\,    -- p14 (-DWEA)
    di      => aa1         -- p15 (AA1)
    );
  dram0_3f08 : am93425a port map(
    ce_n    => dadr10a,    -- p1 (DADR10A)
    a0      => \-dadr0a\,  -- p2 (-DADR0A)
    a1      => \-dadr1a\,  -- p3 (-DADR1A)
    a2      => \-dadr2a\,  -- p4 (-DADR2A)
    a3      => \-dadr3a\,  -- p5 (-DADR3A)
    a4      => \-dadr4a\,  -- p6 (-DADR4A)
    do      => dpc0,       -- p7 (DPC0)
    a5      => \-dadr5a\,  -- p9 (-DADR5A)
    a6      => \-dadr6a\,  -- p10 (-DADR6A)
    a7      => \-dadr7a\,  -- p11 (-DADR7A)
    a8      => \-dadr8a\,  -- p12 (-DADR8A)
    a9      => \-dadr9a\,  -- p13 (-DADR9A)
    we_n    => \-dwea\,    -- p14 (-DWEA)
    di      => aa0         -- p15 (AA0)
    );
  dram0_3f09 : am93425a port map(
    ce_n    => \-dadr10a\, -- p1 (-DADR10A)
    a0      => \-dadr0a\,  -- p2 (-DADR0A)
    a1      => \-dadr1a\,  -- p3 (-DADR1A)
    a2      => \-dadr2a\,  -- p4 (-DADR2A)
    a3      => \-dadr3a\,  -- p5 (-DADR3A)
    a4      => \-dadr4a\,  -- p6 (-DADR4A)
    do      => dpc0,       -- p7 (DPC0)
    a5      => \-dadr5a\,  -- p9 (-DADR5A)
    a6      => \-dadr6a\,  -- p10 (-DADR6A)
    a7      => \-dadr7a\,  -- p11 (-DADR7A)
    a8      => \-dadr8a\,  -- p12 (-DADR8A)
    a9      => \-dadr9a\,  -- p13 (-DADR9A)
    we_n    => \-dwea\,    -- p14 (-DWEA)
    di      => aa0         -- p15 (AA0)
    );
  dram0_3f10 : sn74s51 port map(
    g1a     => r1,         -- p1 (R1)
    g2a     => ir16b,      -- p2 (IR16B)
    g2b     => hi4,        -- p3 (HI4)
    g2c     => dmask4,     -- p4 (DMASK4)
    g2d     => r4,         -- p5 (R4)
    g2y     => \-dadr4a\,  -- p6 (-DADR4A)
    g1y     => \-dadr1a\,  -- p8 (-DADR1A)
    g1c     => ir13b,      -- p9 (IR13B)
    g1d     => hi4,        -- p10 (HI4)
    g1b     => dmask1      -- p13 (DMASK1)
    );
end architecture;
