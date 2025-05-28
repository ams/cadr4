library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_ictl is
  port (
    ramdisable      : out std_logic;
    hi1             : in  std_logic;
    \-iwriteda\     : out std_logic;
    \-promdisabled\ : out std_logic;
    idebug          : in  std_logic;
    iwriteda        : out std_logic;
    promdisabled    : in  std_logic;
    \-wp5\          : in  std_logic;
    wp5d            : out std_logic;
    wp5c            : out std_logic;
    wp5b            : out std_logic;
    wp5a            : out std_logic;
    pc0             : in  std_logic;
    \-pcb0\         : out std_logic;
    pc1             : in  std_logic;
    \-pcb1\         : out std_logic;
    pc2             : in  std_logic;
    \-pcb2\         : out std_logic;
    \-pcb3\         : out std_logic;
    pc3             : in  std_logic;
    \-pcb4\         : out std_logic;
    pc4             : in  std_logic;
    \-pcb5\         : out std_logic;
    pc5             : in  std_logic;
    \-iwea\         : out std_logic;
    \-iweb\         : out std_logic;
    \-iwei\         : out std_logic;
    \-iwej\         : out std_logic;
    pc13            : in  std_logic;
    \-pc13b\        : out std_logic;
    pc12            : in  std_logic;
    \-pc12b\        : out std_logic;
    \-iwrited\      : in  std_logic;
    iwritedd        : out std_logic;
    iwritedc        : out std_logic;
    iwritedb        : out std_logic;
    pc6             : in  std_logic;
    \-pcb6\         : out std_logic;
    pc7             : in  std_logic;
    \-pcb7\         : out std_logic;
    pc8             : in  std_logic;
    \-pcb8\         : out std_logic;
    \-pcb9\         : out std_logic;
    pc9             : in  std_logic;
    \-pcb10\        : out std_logic;
    pc10            : in  std_logic;
    \-pcb11\        : out std_logic;
    pc11            : in  std_logic;
    \-ice3a\        : out std_logic;
    \-ice2a\        : out std_logic;
    \-ice1a\        : out std_logic;
    \-ice0a\        : out std_logic;
    \-ice0b\        : out std_logic;
    \-ice1b\        : out std_logic;
    \-ice2b\        : out std_logic;
    \-ice3b\        : out std_logic;
    \-iwec\         : out std_logic;
    \-iwed\         : out std_logic;
    \-iwek\         : out std_logic;
    \-iwel\         : out std_logic;
    \-pcc0\         : out std_logic;
    \-pcc1\         : out std_logic;
    \-pcc2\         : out std_logic;
    \-pcc3\         : out std_logic;
    \-pcc4\         : out std_logic;
    \-pcc5\         : out std_logic;
    \-pcc6\         : out std_logic;
    \-pcc7\         : out std_logic;
    \-pcc8\         : out std_logic;
    \-pcc9\         : out std_logic;
    \-pcc10\        : out std_logic;
    \-pcc11\        : out std_logic;
    \-iwee\         : out std_logic;
    \-iwef\         : out std_logic;
    \-iwem\         : out std_logic;
    \-iwen\         : out std_logic;
    \-ice3c\        : out std_logic;
    \-ice2c\        : out std_logic;
    \-ice1c\        : out std_logic;
    \-ice0c\        : out std_logic;
    \-ice0d\        : out std_logic;
    \-ice1d\        : out std_logic;
    \-ice2d\        : out std_logic;
    \-ice3d\        : out std_logic;
    \-iweg\         : out std_logic;
    \-iweh\         : out std_logic;
    \-iweo\         : out std_logic;
    \-iwep\         : out std_logic);
end;

architecture ttl of cadr4_ictl is
begin
  ictl_1a15 : dm9s42_1 port map(
    g1a1   => '0',            -- p1 (NC)
    g1b1   => '0',            -- p2 (NC)
    g2a1   => '0',            -- p3 (NC)
    g2b1   => '0',            -- p4 (NC)
    g2c1   => '0',            -- p5 (NC)
    g2d1   => '0',            -- p6 (NC)
    g1a2   => idebug,         -- p15 (IDEBUG)
    g1b2   => hi1,            -- p14 (HI1)
    g2a2   => \-promdisabled\, -- p13 (-PROMDISABLED) -- Note: signal name mismatch with netlist PROMDISABLED
    g2b2   => \-iwriteda\,   -- p12 (-IWRITEDA) -- Note: signal name mismatch with netlist IWRITEDA
    g2c2   => hi1,            -- p11 (HI1)
    g2d2   => hi1,            -- p10 (HI1)
    out2   => ramdisable      -- p9 (RAMDISABLE)
    );
  ictl_1c16 : sn74s04 port map(
    g1a   => iwriteda,         -- p1 (IWRITEDA)
    g1q_n => \-iwriteda\,     -- p2 (-IWRITEDA) -- Note: signal name mismatch with netlist IWRITEDA
    g2a   => promdisabled,     -- p3 (PROMDISABLED)
    g2q_n => \-promdisabled\, -- p4 (-PROMDISABLED) -- Note: signal name mismatch with netlist PROMDISABLED
    g3a   => \-wp5\,          -- p5 (-WP5)
    g3q_n => wp5d,             -- p6 (WP5D)
    g4a   => \-wp5\,          -- p9 (-WP5)
    g4q_n => wp5c,             -- p8 (WP5C)
    g5a   => \-wp5\,          -- p11 (-WP5)
    g5q_n => wp5b,             -- p10 (WP5B)
    g6a   => \-wp5\,          -- p13 (-WP5)
    g6q_n => wp5a              -- p12 (WP5A)
    );
  ictl_1c21 : sn74s04 port map(
    g1a   => pc0,     -- p1 (PC0)
    g1q_n => \-pcb0\, -- p2 (-PCB0)
    g2a   => pc1,     -- p3 (PC1)
    g2q_n => \-pcb1\, -- p4 (-PCB1)
    g3a   => pc2,     -- p5 (PC2)
    g3q_n => \-pcb2\, -- p6 (-PCB2)
    g4a   => pc3,     -- p9 (PC3)
    g4q_n => \-pcb3\, -- p8 (-PCB3)
    g5a   => pc4,     -- p11 (PC4)
    g5q_n => \-pcb4\, -- p10 (-PCB4)
    g6a   => pc5,     -- p13 (PC5)
    g6q_n => \-pcb5\  -- p12 (-PCB5)
    );
  ictl_1c26 : sn74s37 port map(
    g1a   => wp5a,         -- p1 (WP5A)
    g1b   => iwriteda,     -- p2 (IWRITEDA)
    g1y   => \-iwea\,     -- p3 (-IWEA)
    g2a   => wp5a,         -- p4 (WP5A)
    g2b   => iwriteda,     -- p5 (IWRITEDA)
    g2y   => \-iweb\,     -- p6 (-IWEB)
    g3a   => iwriteda,     -- p9 (IWRITEDA)
    g3b   => wp5a,         -- p10 (WP5A)
    g3y   => \-iwei\,     -- p8 (-IWEI)
    g4a   => iwriteda,     -- p12 (IWRITEDA)
    g4b   => wp5a,         -- p13 (WP5A)
    g4y   => \-iwej\      -- p11 (-IWEJ)
    );
  ictl_1d20 : sn74s04 port map(
    g1a   => pc13,         -- p1 (PC13)
    g1q_n => \-pc13b\,     -- p2 (-PC13B)
    g2a   => pc12,         -- p3 (PC12)
    g2q_n => \-pc12b\,     -- p4 (-PC12B)
    g3a   => \-iwrited\,  -- p5 (-IWRITED)
    g3q_n => iwritedd,     -- p6 (IWRITEDD)
    g4a   => \-iwrited\,  -- p9 (-IWRITED)
    g4q_n => iwritedc,     -- p8 (IWRITEDC)
    g5a   => \-iwrited\,  -- p11 (-IWRITED)
    g5q_n => iwritedb,     -- p10 (IWRITEDB)
    g6a   => \-iwrited\,  -- p13 (-IWRITED)
    g6q_n => iwriteda      -- p12 (IWRITEDA)
    );
  ictl_1d25 : sn74s04 port map(
    g1a   => pc6,      -- p1 (PC6)
    g1q_n => \-pcb6\,  -- p2 (-PCB6)
    g2a   => pc7,      -- p3 (PC7)
    g2q_n => \-pcb7\,  -- p4 (-PCB7)
    g3a   => pc8,      -- p5 (PC8)
    g3q_n => \-pcb8\,  -- p6 (-PCB8)
    g4a   => pc9,      -- p9 (PC9)
    g4q_n => \-pcb9\,  -- p8 (-PCB9)
    g5a   => pc10,     -- p11 (PC10)
    g5q_n => \-pcb10\, -- p10 (-PCB10)
    g6a   => pc11,     -- p13 (PC11)
    g6q_n => \-pcb11\  -- p12 (-PCB11)
    );
  ictl_1d30 : sn74s139 port map(
    g1    => ramdisable, -- p1 (RAMDISABLE)
    a1    => \-pc12b\,   -- p2 (-PC12B)
    b1    => \-pc13b\,   -- p3 (-PC13B)
    g1y0  => \-ice3a\,   -- p4 (-ICE3A)
    g1y1  => \-ice2a\,   -- p5 (-ICE2A)
    g1y2  => \-ice1a\,   -- p6 (-ICE1A)
    g1y3  => \-ice0a\,   -- p7 (-ICE0A)
    g2y3  => \-ice0b\,   -- p9 (-ICE0B)
    g2y2  => \-ice1b\,   -- p10 (-ICE1B)
    g2y1  => \-ice2b\,   -- p11 (-ICE2B)
    g2y0  => \-ice3b\,   -- p12 (-ICE3B)
    b2    => \-pc13b\,   -- p13 (-PC13B)
    a2    => \-pc12b\,   -- p14 (-PC12B)
    g2    => ramdisable  -- p15 (RAMDISABLE)
    );
  ictl_2c01 : sn74s37 port map(
    g1a   => wp5b,         -- p1 (WP5B)
    g1b   => iwritedb,     -- p2 (IWRITEDB)
    g1y   => \-iwec\,     -- p3 (-IWEC)
    g2a   => wp5b,         -- p4 (WP5B)
    g2b   => iwritedb,     -- p5 (IWRITEDB)
    g2y   => \-iwed\,     -- p6 (-IWED)
    g3a   => iwritedb,     -- p9 (IWRITEDB)
    g3b   => wp5b,         -- p10 (WP5B)
    g3y   => \-iwek\,     -- p8 (-IWEK)
    g4a   => iwritedb,     -- p12 (IWRITEDB)
    g4b   => wp5b,         -- p13 (WP5B)
    g4y   => \-iwel\      -- p11 (-IWEL)
    );
  ictl_2c06 : sn74s04 port map(
    g1a   => pc0,     -- p1 (PC0)
    g1q_n => \-pcc0\, -- p2 (-PCC0)
    g2a   => pc1,     -- p3 (PC1)
    g2q_n => \-pcc1\, -- p4 (-PCC1)
    g3a   => pc2,     -- p5 (PC2)
    g3q_n => \-pcc2\, -- p6 (-PCC2)
    g4a   => pc3,     -- p9 (PC3)
    g4q_n => \-pcc3\, -- p8 (-PCC3)
    g5a   => pc4,     -- p11 (PC4)
    g5q_n => \-pcc4\, -- p10 (-PCC4)
    g6a   => pc5,     -- p13 (PC5)
    g6q_n => \-pcc5\  -- p12 (-PCC5)
    );
  ictl_2d10 : sn74s04 port map(
    g1a   => pc6,      -- p1 (PC6)
    g1q_n => \-pcc6\,  -- p2 (-PCC6)
    g2a   => pc7,      -- p3 (PC7)
    g2q_n => \-pcc7\,  -- p4 (-Pcc7)
    g3a   => pc8,      -- p5 (PC8)
    g3q_n => \-pcc8\,  -- p6 (-PCC8)
    g4a   => pc9,      -- p9 (PC9)
    g4q_n => \-pcc9\,  -- p8 (-PCC9)
    g5a   => pc10,     -- p11 (PC10)
    g5q_n => \-pcc10\, -- p10 (-PCC10)
    g6a   => pc11,     -- p13 (PC11)
    g6q_n => \-pcc11\  -- p12 (-PCC11)
    );
  ictl_2d15 : sn74s37 port map(
    g1a   => wp5c,         -- p1 (WP5C)
    g1b   => iwritedc,     -- p2 (IWRITEDC)
    g1y   => \-iwee\,     -- p3 (-IWEE)
    g2a   => wp5c,         -- p4 (WP5C)
    g2b   => iwritedc,     -- p5 (IWRITEDC)
    g2y   => \-iwef\,     -- p6 (-IWEF)
    g3a   => iwritedc,     -- p9 (IWRITEDC)
    g3b   => wp5c,         -- p10 (WP5C)
    g3y   => \-iwem\,     -- p8 (-IWEM)
    g4a   => iwritedc,     -- p12 (IWRITEDC)
    g4b   => wp5c,         -- p13 (WP5C)
    g4y   => \-iwen\      -- p11 (-IWEN)
    );
  ictl_2d25 : sn74s139 port map(
    g1    => ramdisable, -- p1 (RAMDISABLE)
    a1    => \-pc12b\,   -- p2 (-PC12B)
    b1    => \-pc13b\,   -- p3 (-PC13B)
    g1y0  => \-ice3c\,   -- p4 (-ICE3C)
    g1y1  => \-ice2c\,   -- p5 (-ICE2C)
    g1y2  => \-ice1c\,   -- p6 (-ICE1C)
    g1y3  => \-ice0c\,   -- p7 (-ICE0C)
    g2y3  => \-ice0d\,   -- p9 (-ICE0D)
    g2y2  => \-ice1d\,   -- p10 (-ICE1D)
    g2y1  => \-ice2d\,   -- p11 (-ICE2D)
    g2y0  => \-ice3d\,   -- p12 (-ICE3D)
    b2    => \-pc13b\,   -- p13 (-PC13B)
    a2    => \-pc12b\,   -- p14 (-PC12B)
    g2    => ramdisable  -- p15 (RAMDISABLE)
    );
  ictl_2d30 : sn74s37 port map(
    g1a   => wp5d,         -- p1 (WP5D)
    g1b   => iwritedd,     -- p2 (IWRITEDD)
    g1y   => \-iweg\,     -- p3 (-IWEG)
    g2a   => wp5d,         -- p4 (WP5D)
    g2b   => iwritedd,     -- p5 (IWRITEDD)
    g2y   => \-iweh\,     -- p6 (-IWEH)
    g3a   => iwritedd,     -- p9 (IWRITEDD)
    g3b   => wp5d,         -- p10 (WP5D)
    g3y   => \-iweo\,     -- p8 (-IWEO)
    g4a   => iwritedd,     -- p12 (IWRITEDD)
    g4b   => wp5d,         -- p13 (WP5D)
    g4y   => \-iwep\      -- p11 (-IWEP)
    );
end architecture;
