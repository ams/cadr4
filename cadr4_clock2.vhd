library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_clock2 is
  port (
    clk4             : out std_logic;
    \-clk0\          : out std_logic;
    gnd              : in  std_logic;
    mclk7            : out std_logic;
    \-mclk0\         : out std_logic;
    \-wp1\           : out std_logic;
    tpwp             : out std_logic;
    \-wp2\           : out std_logic;
    \-wp3\           : out std_logic;
    \-wp4\           : out std_logic;
    \-tprend\        : in  std_logic;
    tpclk            : out std_logic;
    \-tptse\         : out std_logic;
    \-tpr25\         : in  std_logic;
    \-clock_reset_b\ : in  std_logic;
    tptse            : out std_logic;
    \-tpw70\         : in  std_logic;
    \-tpclk\         : out std_logic;
    \-tpr0\          : in  std_logic;
    \-tpr5\          : in  std_logic;
    \-tpw30\         : in  std_logic;
    \machruna_l\     : in  std_logic;
    tpwpiram         : out std_logic;
    \-wp5\           : out std_logic;
    clk5             : out std_logic;
    mclk5            : out std_logic;
    \-tpw45\         : in  std_logic;
    \-tse1\          : out std_logic;
    \-tse2\          : out std_logic;
    \-tse3\          : out std_logic;
    \-tse4\          : out std_logic;
    clk1             : out std_logic;
    clk2             : out std_logic;
    clk3             : out std_logic;
    mclk1            : out std_logic;
    machrun          : in  std_logic;
    hi1              : in  std_logic);
end;

architecture ttl of cadr4_clock2 is
  signal internal10 : std_logic;
  signal internal8  : std_logic;
  signal internal9  : std_logic;
  signal internal7  : std_logic;
begin
  clock2_1c01 : sn7428
    port map(
      g1q_n => clk4,    -- p1 (CLK4)
      g1a   => \-clk0\,  -- p2 (-CLK0)
      g1b   => gnd,     -- p3 (GND)
      g2q_n => mclk7,   -- p4 (MCLK7)
      g2a   => \-mclk0\, -- p5 (-MCLK0)
      g2b   => gnd,     -- p6 (GND)
      g3b   => '0',   -- p8 (NC)
      g3a   => '0',   -- p9 (NC)
      g3q_n => open,   -- p10 (NC)
      g4q_n => open,   -- p11 (NC)
      g4a   => '0',   -- p12 (NC)
      g4b   => '0'    -- p13 (NC)
    );
  clock2_1c02 : sn7428
    port map(
      g1q_n => \-wp1\,  -- p1 (-WP1)
      g1a   => tpwp,   -- p2 (TPWP)
      g1b   => gnd,    -- p3 (GND)
      g2q_n => \-wp2\,  -- p4 (-WP2)
      g2a   => tpwp,   -- p5 (TPWP)
      g2b   => gnd,    -- p6 (GND)
      g3b   => tpwp,   -- p8 (TPWP)
      g3a   => gnd,    -- p9 (GND)
      g3q_n => \-wp3\,  -- p10 (-WP3)
      g4q_n => \-wp4\,  -- p11 (-WP4)
      g4a   => tpwp,   -- p12 (TPWP)
      g4b   => gnd     -- p13 (GND)
    );
  clock2_1c06 : sn74s10
    port map(
      g1a   => \-tprend\,       -- p1 (-TPREND)
      g1b   => tpclk,          -- p2 (TPCLK)
      g2a   => \-tptse\,        -- p3 (-TPTSE)
      g2b   => \-tpr25\,        -- p4 (-TPR25)
      g2c   => \-clock_reset_b\, -- p5 (-CLOCK RESET B)
      g2y_n => tptse,          -- p6 (TPTSE) -- Note: netlist signal TPTSE is connected to g2y_n which is active low. Assuming TPTSE should be active high here based on context.
      g3a   => \-clock_reset_b\, -- p8 (-CLOCK RESET B)
      g3b   => \-tpw70\,        -- p9 (-TPW70)
      g3c   => internal10,     -- p10 (@1C07,p9) -- Note: internal10 is used in VHDL, netlist shows @1C07,p9
      g3y_n => internal7,      -- p11 (@1C07,p8) -- Note: internal7 is used in VHDL, netlist shows @1C07,p8
      g1y_n => \-tpclk\,        -- p12 (-TPCLK)
      g1c   => \-clock_reset_b\ -- p13 (-CLOCK RESET B)
    );
  clock2_1c07 : sn74s00
    port map(
      g1a   => \-tpclk\,    -- p1 (-TPCLK)
      g1b   => \-tpr0\,     -- p2 (-TPR0)
      g1q_n => tpclk,      -- p3 (TPCLK) -- Note: netlist signal TPCLK is connected to g1q_n which is active low. Assuming TPCLK should be active high here based on context.
      g2a   => tptse,      -- p4 (TPTSE)
      g2b   => \-tpr5\,     -- p5 (-TPR5)
      g2q_n => \-tptse\,    -- p6 (-TPTSE)
      g3b   => internal7,  -- p8 (@1C06,p11) -- Note: internal7 is used in VHDL, netlist shows @1C06,p11
      g3a   => \-tpw30\,    -- p10 (-TPW30)
      g3q_n => internal10, -- p9 (@1C06,p9) -- Note: internal10 is used in VHDL, netlist shows @1C06,p9
      g4q_n => open,      -- p11 (NC)
      g4b   => '0',      -- p12 (NC)
      g4a   => '0'       -- p13 (NC)
    );
  clock2_1c10 : sn74s02
    port map(
      g1q_n => open,        -- p1 (NC)
      g1b   => '0',        -- p2 (NC)
      g1a   => '0',        -- p3 (NC)
      g2q_n => tpwp,         -- p4 (TPWP) -- Note: netlist signal TPWP is connected to g2q_n which is active low. Assuming TPWP should be active high here based on context.
      g2a   => internal7,    -- p5 (@1C07,p9) -- Note: internal7 is used in VHDL, netlist shows @1C07,p9
      g2b   => \machruna_l\,  -- p6 (MACHRUNA L)
      g3b   => \machruna_l\,  -- p8 (MACHRUNA L)
      g3a   => internal8,    -- p9 (@1C13,p5) -- Note: internal8 is used in VHDL, netlist shows @1C13,p5
      g3q_n => tpwpiram,     -- p10 (TPWPIRAM)
      g4q_n => open,        -- p11 (NC)
      g4b   => '0',        -- p12 (NC)
      g4a   => '0'         -- p13 (NC)
    );
  clock2_1c11 : sn7428
    port map(
      g1q_n => \-wp5\,    -- p1 (-WP5)
      g1a   => tpwpiram, -- p2 (TPWPIRAM)
      g1b   => gnd,      -- p3 (GND)
      g2q_n => clk5,     -- p4 (CLK5)
      g2a   => \-clk0\,   -- p5 (-CLK0)
      g2b   => gnd,      -- p6 (GND)
      g3a   => gnd,      -- p8 (GND)
      g3b   => \-mclk0\,  -- p9 (-MCLK0)
      g3q_n => mclk5,    -- p10 (MCLK5)
      g4q_n => open,    -- p11 (NC)
      g4a   => '0',    -- p12 (NC)
      g4b   => '0'     -- p13 (NC)
    );
  clock2_1c13 : sn74s10
    port map(
      g1a   => '0',         -- p1 (NC)
      g1b   => '0',         -- p2 (NC)
      g2a   => \-tprend\,      -- p3 (-TPREND)
      g2b   => internal8,     -- p4 (@1C13,p5) -- Note: internal8 is used in VHDL, netlist shows @1C13,p5
      g2c   => internal8,     -- p5 (@1C13,p8) -- Note: internal8 is used in VHDL, netlist shows @1C13,p8
      g2y_n => internal9,     -- p6 (@1C13,p11) -- Note: internal9 is used in VHDL, netlist shows @1C13,p11
      g3y_n => internal8,     -- p8 (@1C13,p5) -- Note: internal8 is used in VHDL, netlist shows @1C13,p5
      g3a   => \-tpw45\,       -- p9 (-TPW45)
      g3b   => \-clock_reset_b\, -- p10 (-CLOCK RESET B)
      g3c   => internal9,     -- p11 (@1C13,p6) -- Note: internal9 is used in VHDL, netlist shows @1C13,p6
      g1y_n => open,         -- p12 (NC)
      g1c   => '0'          -- p13 (NC)
    );
  clock2_1d04 : sn7428
    port map(
      g1q_n => \-tse1\,  -- p1 (-TSE1)
      g1a   => tptse,   -- p2 (TPTSE)
      g1b   => gnd,     -- p3 (GND)
      g2q_n => \-tse2\,  -- p4 (-TSE2)
      g2a   => tptse,   -- p5 (TPTSE)
      g2b   => gnd,     -- p6 (GND)
      g3b   => tptse,   -- p8 (TPTSE)
      g3a   => gnd,     -- p9 (GND)
      g3q_n => \-tse3\,  -- p10 (-TSE3)
      g4q_n => open,   -- p11 (NC)
      g4a   => '0',   -- p12 (NC)
      g4b   => '0'     -- p13 (NC)
    );
  clock2_1d05 : sn7428
    port map(
      g1q_n => clk1,    -- p1 (CLK1)
      g1a   => \-clk0\,  -- p2 (-CLK0)
      g1b   => gnd,     -- p3 (GND)
      g2q_n => clk2,    -- p4 (CLK2)
      g2a   => \-clk0\,  -- p5 (-CLK0)
      g2b   => gnd,     -- p6 (GND)
      g3a   => gnd,     -- p8 (GND)
      g3b   => \-clk0\,  -- p9 (-CLK0)
      g3q_n => clk3,    -- p10 (CLK3)
      g4a   => gnd,     -- p11 (GND)
      g4b   => \-mclk0\, -- p12 (-MCLK0)
      g4q_n => mclk1    -- p13 (MCLK1)
    );
  clock2_1d10 : sn74s08
    port map(
      g1a => \-tpclk\, -- p1 (-TPCLK)
      g1b => machrun, -- p2 (MACHRUN)
      g1q => \-clk0\,  -- p3 (-CLK0) -- Note: netlist signal -CLK0 is connected to g1q which is active high. Assuming -CLK0 should be active low here based on context.
      g2q => open,   -- p4 (NC)
      g2b => '0',   -- p5 (NC)
      g2a => '0',   -- p6 (NC)
      g3q => \-mclk0\, -- p8 (-MCLK0) -- Note: netlist signal -MCLK0 is connected to g3q which is active high. Assuming -Mclk0 should be active low here based on context.
      g3a => hi1,     -- p9 (HI1)
      g3b => \-tpclk\, -- p10 (-TPCLK)
      g4q => open,   -- p11 (NC)
      g4a => '0',   -- p12 (NC)
      g4b => '0'    -- p13 (NC)
    );
end architecture;
