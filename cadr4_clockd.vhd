library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_clockd is
  port (
    \-clk1\        : out std_logic;
    hi12           : in  std_logic;
    clk1a          : out std_logic;
    reset          : in  std_logic;
    \-reset\       : out std_logic;
    mclk1a         : out std_logic;
    \-mclk1\       : out std_logic;
    mclk1          : in  std_logic;
    clk1           : in  std_logic;
    \-wp1\         : in  std_logic;
    wp1b           : out std_logic;
    wp1a           : out std_logic;
    tse1b          : out std_logic;
    \-tse1\        : in  std_logic;
    tse1a          : out std_logic;
    hi1            : in  std_logic;
    hi2            : in  std_logic;
    hi3            : in  std_logic;
    hi4            : in  std_logic;
    hi5            : in  std_logic;
    hi6            : in  std_logic;
    hi7            : in  std_logic;
    \-upperhighok\ : out std_logic;
    hi8            : in  std_logic;
    hi9            : in  std_logic;
    hi10           : in  std_logic;
    hi11           : in  std_logic;
    lcry3          : in  std_logic;
    \-lcry3\       : out std_logic;
    clk2           : in  std_logic;
    \-clk2c\       : out std_logic;
    \-clk2a\       : out std_logic;
    wp2            : out std_logic;
    \-wp2\         : in  std_logic;
    tse2           : out std_logic;
    \-tse2\        : in  std_logic;
    clk2a          : out std_logic;
    clk2b          : out std_logic;
    clk2c          : out std_logic;
    \-clk3a\       : out std_logic;
    clk3a          : out std_logic;
    clk3b          : out std_logic;
    clk3c          : out std_logic;
    clk3           : in  std_logic;
    \-clk3g\       : out std_logic;
    \-clk3d\       : out std_logic;
    wp3a           : out std_logic;
    \-wp3\         : in  std_logic;
    tse3a          : out std_logic;
    \-tse3\        : in  std_logic;
    clk3d          : out std_logic;
    clk3e          : out std_logic;
    clk3f          : out std_logic;
    \-clk4a\       : out std_logic;
    clk4a          : out std_logic;
    clk4b          : out std_logic;
    clk4c          : out std_logic;
    clk4           : in  std_logic;
    \-clk4e\       : out std_logic;
    \-clk4d\       : out std_logic;
    wp4c           : out std_logic;
    \-wp4\         : in  std_logic;
    wp4b           : out std_logic;
    wp4a           : out std_logic;
    clk4d          : out std_logic;
    clk4e          : out std_logic;
    clk4f          : out std_logic;
    \-tse4\        : in  std_logic;
    tse4b          : out std_logic;
    tse4a          : out std_logic;
    srcpdlptr      : out std_logic;
    \-srcpdlptr\   : in  std_logic;
    srcpdlidx      : out std_logic;
    \-srcpdlidx\   : in  std_logic);
end;

architecture ttl of cadr4_clockd is
begin
  clockd_1b19 : sn74s04 port map(
    g1a => mclk1,       -- p1 (MCLK1)
    g1q_n => \-mclk1\,   -- p2 (-MCLK1)
    g2a => clk1,        -- p3 (CLK1)
    g2q_n => \-clk1\,    -- p4 (-CLK1)
    g3a => \-wp1\,      -- p5 (-WP1)
    g3q_n => wp1b,      -- p6 (WP1B)
    g4q_n => wp1a,      -- p8 (WP1A)
    g4a => \-wp1\,      -- p9 (-WP1)
    g5q_n => tse1b,     -- p10 (TSE1B)
    g5a => \-tse1\,     -- p11 (-TSE1)
    g6q_n => tse1a,     -- p12 (TSE1A)
    g6a => \-tse1\      -- p13 (-TSE1)
  );
  clockd_1b18 : sn74s37 port map(
    g1a => \-clk1\,     -- p1 (-CLK1)
    g1b => hi12,        -- p2 (HI12)
    g1y => clk1a,       -- p3 (CLK1A)
    g2a => reset,       -- p4 (RESET)
    g2b => hi12,        -- p5 (HI12)
    g2y => \-reset\,    -- p6 (-RESET)
    g3y => mclk1a,      -- p8 (MCLK1A)
    g3a => hi12,        -- p9 (HI12)
    g3b => \-mclk1\,    -- p10 (-MCLK1)
    g4a => '0',         -- p11 (NC - tied to 0)
    g4b => '0',         -- p12 (NC - tied to 0)
    g4y => open         -- p13 (NC)
  );
  clockd_2c02 : sn74s04 port map(
    g1a => lcry3,       -- p1 (LCRY3)
    g1q_n => \-lcry3\,   -- p2 (-LCRY3)
    g2a => '0',       -- p3 (NC)
    g2q_n => open,     -- p4 (NC)
    g3a => clk2,        -- p5 (CLK2)
    g3q_n => \-clk2c\,   -- p6 (-CLK2C)
    g4q_n => \-clk2a\,   -- p8 (-CLK2A)
    g4a => clk2,        -- p9 (CLK2)
    g5q_n => wp2,       -- p10 (WP2)
    g5a => \-wp2\,      -- p11 (-WP2)
    g6q_n => tse2,      -- p12 (TSE2)
    g6a => \-tse2\      -- p13 (-TSE2)
  );
  clockd_2c03 : sn74s37 port map(
    g1a => \-clk2a\,    -- p1 (-CLK2A)
    g1b => hi7,         -- p2 (HI7)
    g1y => clk2a,       -- p3 (CLK2A)
    g2a => \-clk2a\,    -- p4 (-CLK2A)
    g2b => hi7,         -- p5 (HI7)
    g2y => clk2b,       -- p6 (CLK2B)
    g3y => clk2c,       -- p8 (CLK2C)
    g3a => hi7,         -- p9 (HI7)
    g3b => \-clk2c\,    -- p10 (-CLK2C)
    g4a => '0',         -- p11 (NC - tied to 0)
    g4b => '0',         -- p12 (NC - tied to 0)
    g4y => open         -- p13 (NC)
  );
  clockd_3c12 : sn74s04 port map(
    g1a => '0',       -- p1 (NC)
    g1q_n => open,     -- p2 (NC)
    g3a => clk3,        -- p3 (CLK3)
    g3q_n => \-clk3g\,   -- p4 (-CLK3G)
    g5a => clk3,        -- p5 (CLK3)
    g5q_n => \-clk3d\,   -- p6 (-CLK3D)
    g4q_n => \-clk3a\,   -- p8 (-CLK3A)
    g4a => clk3,        -- p9 (CLK3)
    g6q_n => wp3a,      -- p10 (WP3A)
    g6a => \-wp3\,      -- p11 (-WP3)
    g2q_n => tse3a,     -- p12 (TSE3A) NOTE: This mapping is g2q_n in VHDL but p12 is TSE3A
    g2a => \-tse3\      -- p13 (-TSE3) NOTE: This mapping is g2a in VHDL but p13 is -TSE3
  );
  clockd_3c11 : sn74s37 port map(
    g1a => \-clk3a\,    -- p1 (-CLK3A)
    g1b => hi5,         -- p2 (HI5)
    g1y => clk3a,       -- p3 (CLK3A)
    g2a => \-clk3a\,    -- p4 (-CLK3A)
    g2b => hi5,         -- p5 (HI5)
    g2y => clk3b,       -- p6 (CLK3B)
    g3y => clk3c,       -- p8 (CLK3C)
    g3a => hi5,         -- p9 (HI5)
    g3b => \-clk3a\,    -- p10 (-CLK3A)
    g4a => '0',         -- p11 (NC - tied to 0)
    g4b => '0',         -- p12 (NC - tied to 0)
    g4y => open         -- p13 (NC)
  );
  clockd_3c13 : sn74s37 port map(
    g1a => \-clk3d\,    -- p1 (-CLK3D)
    g1b => hi5,         -- p2 (HI5)
    g1y => clk3d,       -- p3 (CLK3D)
    g2a => \-clk3d\,    -- p4 (-CLK3D)
    g2b => hi5,         -- p5 (HI5)
    g2y => clk3e,       -- p6 (CLK3E)
    g3y => clk3f,       -- p8 (CLK3F)
    g3a => hi5,         -- p9 (HI5)
    g3b => \-clk3d\,    -- p10 (-CLK3D)
    g4a => '0',         -- p11 (NC - tied to 0)
    g4b => '0',         -- p12 (NC - tied to 0)
    g4y => open         -- p13 (NC)
  );
  clockd_4c06 : sn74s04 port map(
    g1a => clk4,        -- p1 (CLK4)
    g1q_n => \-clk4e\,   -- p2 (-CLK4E)
    g2a => clk4,        -- p3 (CLK4)
    g2q_n => \-clk4d\,   -- p4 (-CLK4D)
    g3a => clk4,        -- p5 (CLK4)
    g3q_n => \-clk4a\,   -- p6 (-CLK4A)
    g4q_n => wp4c,      -- p8 (WP4C)
    g4a => \-wp4\,      -- p9 (-WP4)
    g5q_n => wp4b,      -- p10 (WP4B)
    g5a => \-wp4\,      -- p11 (-WP4)
    g6q_n => wp4a,      -- p12 (WP4A)
    g6a => \-wp4\       -- p13 (-WP4)
  );
  clockd_4c02 : sn74s37 port map(
    g1a => \-clk4a\,    -- p1 (-CLK4A)
    g1b => hi5,         -- p2 (HI5)
    g1y => clk4a,       -- p3 (CLK4A)
    g2a => \-clk4a\,    -- p4 (-CLK4A)
    g2b => hi5,         -- p5 (HI5)
    g2y => clk4b,       -- p6 (CLK4B)
    g3y => clk4c,       -- p8 (CLK4C)
    g3a => hi5,         -- p9 (HI5)
    g3b => \-clk4a\,    -- p10 (-CLK4A)
    g4a => '0',         -- p11 (NC - tied to 0)
    g4b => '0',         -- p12 (NC - tied to 0)
    g4y => open         -- p13 (NC)
  );
  clockd_4c07 : sn74s37 port map(
    g1a => \-clk4d\,    -- p1 (-CLK4D)
    g1b => hi2,         -- p2 (HI2)
    g1y => clk4d,       -- p3 (CLK4D)
    g2a => \-clk4d\,    -- p4 (-CLK4D)
    g2b => hi2,         -- p5 (HI2)
    g2y => clk4e,       -- p6 (CLK4E)
    g3y => clk4f,       -- p8 (CLK4F)
    g3a => hi2,         -- p9 (HI2)
    g3b => \-clk4d\,    -- p10 (-CLK4D)
    g4a => '0',         -- p11 (NC - tied to 0)
    g4b => '0',         -- p12 (NC - tied to 0)
    g4y => open         -- p13 (NC)
  );
  clockd_4d03 : sn74s04 port map(
    g1a => '0',       -- p1 (NC)
    g1q_n => open,     -- p2 (NC)
    g2a => '0',       -- p3 (NC)
    g2q_n => open,     -- p4 (NC)
    g3a => \-tse4\,     -- p5 (-TSE4)
    g3q_n => tse4b,     -- p6 (TSE4B)
    g4q_n => tse4a,     -- p8 (TSE4A)
    g4a => \-tse4\,     -- p9 (-TSE4)
    g5q_n => srcpdlptr,  -- p10 (SRCPDLPTR)
    g5a => \-srcpdlptr\, -- p11 (-SRCPDLPTR)
    g6q_n => srcpdlidx,  -- p12 (SRCPDLIDX)
    g6a => \-srcpdlidx\  -- p13 (-SRCPDLIDX)
  );
  clockd_1f05 : sn74s133 port map(
    a => hi1,           -- p1 (HI1)
    b => hi2,           -- p2 (HI2)
    c => hi3,           -- p3 (HI3)
    d => hi4,           -- p4 (HI4)
    e => hi5,           -- p5 (HI5)
    f => hi6,           -- p6 (HI6)
    g => hi7,           -- p7 (HI7)
    q_n => \-upperhighok\, -- p9 (-UPPERHIGHOK)
    h => hi8,           -- p10 (HI8)
    i => hi9,           -- p11 (HI9)
    j => hi10,          -- p12 (HI10)
    k => hi11,          -- p13 (HI11)
    l => hi12,          -- p14 (HI12)
    m => hi11           -- p15 (HI11)
  );
end architecture;
