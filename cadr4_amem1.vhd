library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_amem1 is
  port (
    gnd       : out std_logic;
    \-aadr0a\ : in  std_logic;
    \-aadr1a\ : in  std_logic;
    \-aadr2a\ : in  std_logic;
    \-aadr3a\ : in  std_logic;
    \-aadr4a\ : in  std_logic;
    amem6     : out std_logic;
    \-aadr5a\ : in  std_logic;
    \-aadr6a\ : in  std_logic;
    \-aadr7a\ : in  std_logic;
    \-aadr8a\ : in  std_logic;
    \-aadr9a\ : in  std_logic;
    \-awpc\   : in  std_logic;
    l6        : in  std_logic;
    amem4     : out std_logic;
    l4        : in  std_logic;
    amem2     : out std_logic;
    l2        : in  std_logic;
    amem0     : out std_logic;
    l0        : in  std_logic;
    amem7     : out std_logic;
    l7        : in  std_logic;
    amem5     : out std_logic;
    l5        : in  std_logic;
    amem3     : out std_logic;
    l3        : in  std_logic;
    amem1     : out std_logic;
    l1        : in  std_logic;
    amem14    : out std_logic;
    \-awpb\   : in  std_logic;
    l14       : in  std_logic;
    amem12    : out std_logic;
    l12       : in  std_logic;
    amem10    : out std_logic;
    l10       : in  std_logic;
    amem8     : out std_logic;
    l8        : in  std_logic;
    amem15    : out std_logic;
    l15       : in  std_logic;
    amem13    : out std_logic;
    l13       : in  std_logic;
    amem11    : out std_logic;
    l11       : in  std_logic;
    amem9     : out std_logic;
    l9        : in  std_logic);
end;

architecture ttl of cadr4_amem1 is
begin
  amem1_3a17 : am93425a port map(
    ce_n => gnd,       -- p1 (GND)
    a0   => \-aadr0a\, -- p2 (-AADR0A)
    a1   => \-aadr1a\, -- p3 (-AADR1A)
    a2   => \-aadr2a\, -- p4 (-AADR2A)
    a3   => \-aadr3a\, -- p5 (-AADR3A)
    a4   => \-aadr4a\, -- p6 (-AADR4A)
    do   => amem6,     -- p7 (AMEM6)
    a5   => \-aadr5a\, -- p9 (-AADR5A)
    a6   => \-aadr6a\, -- p10 (-AADR6A)
    a7   => \-aadr7a\, -- p11 (-AADR7A)
    a8   => \-aadr8a\, -- p12 (-AADR8A)
    a9   => \-aadr9a\, -- p13 (-AADR9A)
    we_n => \-awpc\,   -- p14 (-AWPC)
    di   => l6         -- p15 (L6)
  );
  amem1_3a18 : am93425a port map(
    ce_n => gnd,       -- p1 (GND)
    a0   => \-aadr0a\, -- p2 (-AADR0A)
    a1   => \-aadr1a\, -- p3 (-AADR1A)
    a2   => \-aadr2a\, -- p4 (-AADR2A)
    a3   => \-aadr3a\, -- p5 (-AADR3A)
    a4   => \-aadr4a\, -- p6 (-AADR4A)
    do   => amem4,     -- p7 (AMEM4)
    a5   => \-aadr5a\, -- p9 (-AADR5A)
    a6   => \-aadr6a\, -- p10 (-AADR6A)
    a7   => \-aadr7a\, -- p11 (-AADR7A)
    a8   => \-aadr8a\, -- p12 (-AADR8A)
    a9   => \-aadr9a\, -- p13 (-AADR9A)
    we_n => \-awpc\,   -- p14 (-AWPC)
    di   => l4         -- p15 (L4)
  );
  amem1_3a19 : am93425a port map(
    ce_n => gnd,       -- p1 (GND)
    a0   => \-aadr0a\, -- p2 (-AADR0A)
    a1   => \-aadr1a\, -- p3 (-AADR1A)
    a2   => \-aadr2a\, -- p4 (-AADR2A)
    a3   => \-aadr3a\, -- p5 (-AADR3A)
    a4   => \-aadr4a\, -- p6 (-AADR4A)
    do   => amem2,     -- p7 (AMEM2)
    a5   => \-aadr5a\, -- p9 (-AADR5A)
    a6   => \-aadr6a\, -- p10 (-AADR6A)
    a7   => \-aadr7a\, -- p11 (-AADR7A)
    a8   => \-aadr8a\, -- p12 (-AADR8A)
    a9   => \-aadr9a\, -- p13 (-AADR9A)
    we_n => \-awpc\,   -- p14 (-AWPC)
    di   => l2         -- p15 (L2)
  );
  amem1_3a20 : am93425a port map(
    ce_n => gnd,       -- p1 (GND)
    a0   => \-aadr0a\, -- p2 (-AADR0A)
    a1   => \-aadr1a\, -- p3 (-AADR1A)
    a2   => \-aadr2a\, -- p4 (-AADR2A)
    a3   => \-aadr3a\, -- p5 (-AADR3A)
    a4   => \-aadr4a\, -- p6 (-AADR4A)
    do   => amem0,     -- p7 (AMEM0)
    a5   => \-aadr5a\, -- p9 (-AADR5A)
    a6   => \-aadr6a\, -- p10 (-AADR6A)
    a7   => \-aadr7a\, -- p11 (-AADR7A)
    a8   => \-aadr8a\, -- p12 (-AADR8A)
    a9   => \-aadr9a\, -- p13 (-AADR9A)
    we_n => \-awpc\,   -- p14 (-AWPC)
    di   => l0         -- p15 (L0)
  );
  amem1_3a22 : am93425a port map(
    ce_n => gnd,       -- p1 (GND)
    a0   => \-aadr0a\, -- p2 (-AADR0A)
    a1   => \-aadr1a\, -- p3 (-AADR1A)
    a2   => \-aadr2a\, -- p4 (-AADR2A)
    a3   => \-aadr3a\, -- p5 (-AADR3A)
    a4   => \-aadr4a\, -- p6 (-AADR4A)
    do   => amem7,     -- p7 (AMEM7)
    a5   => \-aadr5a\, -- p9 (-AADR5A)
    a6   => \-aadr6a\, -- p10 (-AADR6A)
    a7   => \-aadr7a\, -- p11 (-AADR7A)
    a8   => \-aadr8a\, -- p12 (-AADR8A)
    a9   => \-aadr9a\, -- p13 (-AADR9A)
    we_n => \-awpc\,   -- p14 (-AWPC)
    di   => l7         -- p15 (L7)
  );
  amem1_3a23 : am93425a port map(
    ce_n => gnd,       -- p1 (GND)
    a0   => \-aadr0a\, -- p2 (-AADR0A)
    a1   => \-aadr1a\, -- p3 (-AADR1A)
    a2   => \-aadr2a\, -- p4 (-AADR2A)
    a3   => \-aadr3a\, -- p5 (-AADR3A)
    a4   => \-aadr4a\, -- p6 (-AADR4A)
    do   => amem5,     -- p7 (AMEM5)
    a5   => \-aadr5a\, -- p9 (-AADR5A)
    a6   => \-aadr6a\, -- p10 (-AADR6A)
    a7   => \-aadr7a\, -- p11 (-AADR7A)
    a8   => \-aadr8a\, -- p12 (-AADR8A)
    a9   => \-aadr9a\, -- p13 (-AADR9A)
    we_n => \-awpc\,   -- p14 (-AWPC)
    di   => l5         -- p15 (L5)
  );
  amem1_3a24 : am93425a port map(
    ce_n => gnd,       -- p1 (GND)
    a0   => \-aadr0a\, -- p2 (-AADR0A)
    a1   => \-aadr1a\, -- p3 (-AADR1A)
    a2   => \-aadr2a\, -- p4 (-AADR2A)
    a3   => \-aadr3a\, -- p5 (-AADR3A)
    a4   => \-aadr4a\, -- p6 (-AADR4A)
    do   => amem3,     -- p7 (AMEM3)
    a5   => \-aadr5a\, -- p9 (-AADR5A)
    a6   => \-aadr6a\, -- p10 (-AADR6A)
    a7   => \-aadr7a\, -- p11 (-AADR7A)
    a8   => \-aadr8a\, -- p12 (-AADR8A)
    a9   => \-aadr9a\, -- p13 (-AADR9A)
    we_n => \-awpc\,   -- p14 (-AWPC)
    di   => l3         -- p15 (L3)
  );
  amem1_3a25 : am93425a port map(
    ce_n => gnd,       -- p1 (GND)
    a0   => \-aadr0a\, -- p2 (-AADR0A)
    a1   => \-aadr1a\, -- p3 (-AADR1A)
    a2   => \-aadr2a\, -- p4 (-AADR2A)
    a3   => \-aadr3a\, -- p5 (-AADR3A)
    a4   => \-aadr4a\, -- p6 (-AADR4A)
    do   => amem1,     -- p7 (AMEM1)
    a5   => \-aadr5a\, -- p9 (-AADR5A)
    a6   => \-aadr6a\, -- p10 (-AADR6A)
    a7   => \-aadr7a\, -- p11 (-AADR7A)
    a8   => \-aadr8a\, -- p12 (-AADR8A)
    a9   => \-aadr9a\, -- p13 (-AADR9A)
    we_n => \-awpc\,   -- p14 (-AWPC)
    di   => l1         -- p15 (L1)
  );
  amem1_3b17 : am93425a port map(
    ce_n => gnd,       -- p1 (GND)
    a0   => \-aadr0a\, -- p2 (-AADR0A)
    a1   => \-aadr1a\, -- p3 (-AADR1A)
    a2   => \-aadr2a\, -- p4 (-AADR2A)
    a3   => \-aadr3a\, -- p5 (-AADR3A)
    a4   => \-aadr4a\, -- p6 (-AADR4A)
    do   => amem14,    -- p7 (AMEM14)
    a5   => \-aadr5a\, -- p9 (-AADR5A)
    a6   => \-aadr6a\, -- p10 (-AADR6A)
    a7   => \-aadr7a\, -- p11 (-AADR7A)
    a8   => \-aadr8a\, -- p12 (-AADR8A)
    a9   => \-aadr9a\, -- p13 (-AADR9A)
    we_n => \-awpb\,   -- p14 (-AWPB)
    di   => l14        -- p15 (L14)
  );
  amem1_3b18 : am93425a port map(
    ce_n => gnd,       -- p1 (GND)
    a0   => \-aadr0a\, -- p2 (-AADR0A)
    a1   => \-aadr1a\, -- p3 (-AADR1A)
    a2   => \-aadr2a\, -- p4 (-AADR2A)
    a3   => \-aadr3a\, -- p5 (-AADR3A)
    a4   => \-aadr4a\, -- p6 (-AADR4A)
    do   => amem12,    -- p7 (AMEM12)
    a5   => \-aadr5a\, -- p9 (-AADR5A)
    a6   => \-aadr6a\, -- p10 (-AADR6A)
    a7   => \-aadr7a\, -- p11 (-AADR7A)
    a8   => \-aadr8a\, -- p12 (-AADR8A)
    a9   => \-aadr9a\, -- p13 (-AADR9A)
    we_n => \-awpb\,   -- p14 (-AWPB)
    di   => l12        -- p15 (L12)
  );
  amem1_3b19 : am93425a port map(
    ce_n => gnd,       -- p1 (GND)
    a0   => \-aadr0a\, -- p2 (-AADR0A)
    a1   => \-aadr1a\, -- p3 (-AADR1A)
    a2   => \-aadr2a\, -- p4 (-AADR2A)
    a3   => \-aadr3a\, -- p5 (-AADR3A)
    a4   => \-aadr4a\, -- p6 (-AADR4A)
    do   => amem10,    -- p7 (AMEM10)
    a5   => \-aadr5a\, -- p9 (-AADR5A)
    a6   => \-aadr6a\, -- p10 (-AADR6A)
    a7   => \-aadr7a\, -- p11 (-AADR7A)
    a8   => \-aadr8a\, -- p12 (-AADR8A)
    a9   => \-aadr9a\, -- p13 (-AADR9A)
    we_n => \-awpc\,   -- p14 (-AWPC)
    di   => l10        -- p15 (L10)
  );
  amem1_3b20 : am93425a port map(
    ce_n => gnd,       -- p1 (GND)
    a0   => \-aadr0a\, -- p2 (-AADR0A)
    a1   => \-aadr1a\, -- p3 (-AADR1A)
    a2   => \-aadr2a\, -- p4 (-AADR2A)
    a3   => \-aadr3a\, -- p5 (-AADR3A)
    a4   => \-aadr4a\, -- p6 (-AADR4A)
    do   => amem8,     -- p7 (AMEM8)
    a5   => \-aadr5a\, -- p9 (-AADR5A)
    a6   => \-aadr6a\, -- p10 (-AADR6A)
    a7   => \-aadr7a\, -- p11 (-AADR7A)
    a8   => \-aadr8a\, -- p12 (-AADR8A)
    a9   => \-aadr9a\, -- p13 (-AADR9A)
    we_n => \-awpc\,   -- p14 (-AWPC)
    di   => l8         -- p15 (L8)
  );
  amem1_3b22 : am93425a port map(
    ce_n => gnd,       -- p1 (GND)
    a0   => \-aadr0a\, -- p2 (-AADR0A)
    a1   => \-aadr1a\, -- p3 (-AADR1A)
    a2   => \-aadr2a\, -- p4 (-AADR2A)
    a3   => \-aadr3a\, -- p5 (-AADR3a) -- Mismatch: netlist has -AADR3a, vhd has -aadr3a
    a4   => \-aadr4a\, -- p6 (-AADR4a) -- Mismatch: netlist has -AADR4a, vhd has -aadr4a
    do   => amem15,    -- p7 (AMEM15)
    a5   => \-aadr5a\, -- p9 (-AADR5A)
    a6   => \-aadr6a\, -- p10 (-AADR6A)
    a7   => \-aadr7a\, -- p11 (-AADR7A)
    a8   => \-aadr8a\, -- p12 (-AADR8A)
    a9   => \-aadr9a\, -- p13 (-AADR9A)
    we_n => \-awpb\,   -- p14 (-AWPB)
    di   => l15        -- p15 (L15)
  );
  amem1_3b23 : am93425a port map(
    ce_n => gnd,       -- p1 (GND)
    a0   => \-aadr0a\, -- p2 (-AADR0A)
    a1   => \-aadr1a\, -- p3 (-AADR1A)
    a2   => \-aadr2a\, -- p4 (-AADR2A)
    a3   => \-aadr3a\, -- p5 (-AADR3a) -- Mismatch: netlist has -AADR3a, vhd has -aadr3a
    a4   => \-aadr4a\, -- p6 (-AADR4a) -- Mismatch: netlist has -AADR4a, vhd has -aadr4a
    do   => amem13,    -- p7 (AMEM13)
    a5   => \-aadr5a\, -- p9 (-AADR5A)
    a6   => \-aadr6a\, -- p10 (-AADR6A)
    a7   => \-aadr7a\, -- p11 (-AADR7A)
    a8   => \-aadr8a\, -- p12 (-AADR8A)
    a9   => \-aadr9a\, -- p13 (-AADR9A)
    we_n => \-awpb\,   -- p14 (-AWPB)
    di   => l13        -- p15 (L13)
  );
  amem1_3b24 : am93425a port map(
    ce_n => gnd,       -- p1 (GND)
    a0   => \-aadr0a\, -- p2 (-AADR0A)
    a1   => \-aadr1a\, -- p3 (-AADR1A)
    a2   => \-aadr2a\, -- p4 (-AADR2A)
    a3   => \-aadr3a\, -- p5 (-AADR3a) -- Mismatch: netlist has -AADR3a, vhd has -aadr3a
    a4   => \-aadr4a\, -- p6 (-AADR4a) -- Mismatch: netlist has -AADR4a, vhd has -aadr4a
    do   => amem11,    -- p7 (AMEM11)
    a5   => \-aadr5a\, -- p9 (-AADR5A)
    a6   => \-aadr6a\, -- p10 (-AADR6A)
    a7   => \-aadr7a\, -- p11 (-AADR7A)
    a8   => \-aadr8a\, -- p12 (-AADR8A)
    a9   => \-aadr9a\, -- p13 (-AADR9A)
    we_n => \-awpb\,   -- p14 (-AWPB)
    di   => l11        -- p15 (L11)
  );
  amem1_3b25 : am93425a port map(
    ce_n => gnd,       -- p1 (GND)
    a0   => \-aadr0a\, -- p2 (-AADR0A)
    a1   => \-aadr1a\, -- p3 (-AADR1A)
    a2   => \-aadr2a\, -- p4 (-AADR2A)
    a3   => \-aadr3a\, -- p5 (-AADR3a) -- Mismatch: netlist has -AADR3a, vhd has -aadr3a
    a4   => \-aadr4a\, -- p6 (-AADR4a) -- Mismatch: netlist has -AADR4a, vhd has -aadr4a
    do   => amem9,     -- p7 (AMEM9)
    a5   => \-aadr5a\, -- p9 (-AADR5A)
    a6   => \-aadr6a\, -- p10 (-AADR6A)
    a7   => \-aadr7a\, -- p11 (-AADR7A)
    a8   => \-aadr8a\, -- p12 (-AADR8A)
    a9   => \-aadr9a\, -- p13 (-AADR9A)
    we_n => \-awpc\,   -- p14 (-AWPC)
    di   => l9         -- p15 (L9)
  );
end architecture;
