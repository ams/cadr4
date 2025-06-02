library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr;
use cadr.utilities.all;

entity cadr_clock1 is
  port (
    \-clock_reset_b\ : in  std_logic;
    \-tpdone\        : in  std_logic;
    \-hang\          : in  std_logic;
    cyclecompleted   : out std_logic;
    \-tpr0\          : out std_logic;
    \-tpr40\         : out std_logic;
    gnd              : in  std_logic;
    \-tprend\        : out std_logic;
    \-tpw20\         : out std_logic;
    \-tpw40\         : out std_logic;
    \-tpw50\         : out std_logic;
    \-tpw30\         : out std_logic;
    \-tpw10\         : out std_logic;
    \-tpw60\         : out std_logic;
    \-tpw70\         : out std_logic;
    \-tpw75\         : out std_logic;
    \-tpw65\         : out std_logic;
    \-tpw55\         : out std_logic;
    \-tpw30a\        : out std_logic;
    \-tpw40a\        : out std_logic;
    \-tpw45\         : out std_logic;
    \-tpw35\         : out std_logic;
    \-tpw25\         : out std_logic;
    \-tpr100\        : out std_logic;
    \-tpr140\        : out std_logic;
    \-tpr160\        : out std_logic;
    tprend           : out std_logic;
    sspeed1          : in  std_logic;
    sspeed0          : in  std_logic;
    \-ilong\         : in  std_logic;
    \-tpr75\         : out std_logic;
    \-tpr115\        : out std_logic;
    \-tpr85\         : out std_logic;
    \-tpr125\        : out std_logic;
    \-tpr10\         : out std_logic;
    \-tpr20a\        : out std_logic;
    \-tpr25\         : out std_logic;
    \-tpr15\         : out std_logic;
    \-tpr5\          : out std_logic;
    \-tpr80\         : out std_logic;
    \-tpr60\         : out std_logic;
    \-tpr20\         : out std_logic;
    \-tpr180\        : out std_logic;
    \-tpr200\        : out std_logic;
    \-tpr120\        : out std_logic;
    \-tpr110\        : out std_logic;
    \-tpr120a\       : out std_logic;
    \-tpr105\        : out std_logic;
    \-tpr70\         : out std_logic;
    \-tpr80a\        : out std_logic;
    \-tpr65\         : out std_logic);
end;

architecture ttl of cadr_clock1 is
  signal internal12 : std_logic;
  signal internal11 : std_logic;
begin
  clock1_1c08 : sn74s10 port map(
    g1a   => \-clock_reset_b\, -- p1 ('-CLOCK RESET B')
    g1b   => \-tpdone\,        -- p2 (-TPDONE)
    g2a   => \-hang\,          -- p3 (-HANG)
    g2b   => \-clock_reset_b\, -- p4 ('-CLOCK RESET B')
    g2c   => cyclecompleted,   -- p5 (CYCLECOMPLETED)
    g2y_n => \-tpr0\,          -- p6 (-TPR0)
    g3y_n => open,            -- p8 (no connect)
    g3a   => '0',            -- p9 (no connect)
    g3b   => '0',            -- p10 (no connect)
    g3c   => '0',            -- p11 (no connect)
    g1y_n => internal12,       -- p12 (@1C09,p1)
    g1c   => internal11        -- p13 (@1C09,p3)
  );
  clock1_1c09 : sn74s00 port map(
    g1a   => internal12, -- p1 (@1C08,p12)
    g1b   => \-tpr40\,   -- p2 (-TPR40)
    g1q_n => internal11, -- p3 (@1C08,p13)
    g2a   => '0',      -- p4 (no connect)
    g3a   => '0',      -- p5 (no connect)
    g4a   => '0',      -- p6 (no connect)
    g2b   => '0',      -- p8 (no connect)
    g3b   => '0',      -- p9 (no connect)
    g4b   => '0',      -- p10 (no connect)
    g4q_n => open,      -- p11 (no connect)
    g3q_n => open,      -- p12 (no connect)
    g2q_n => open       -- p13 (no connect)
  );
  clock1_1c10 : sn74s02 port map(
    g1a   => '0',          -- p1 (no connect)
    g2a   => '0',          -- p2 (no connect)
    g3q_n => open,          -- p3 (no connect)
    g2q_n => open,          -- p4 (no connect)
    g4q_n => cyclecompleted, -- p5 (CYCLECOMPLETED) -- Note: Netlist says p13, VHDL port is g4q_n which is p5.
    g3a   => '0',          -- p6 (no connect)
    g1b   => '0',          -- p8 (no connect)
    g2b   => '0',          -- p9 (no connect)
    g3b   => '0',          -- p10 (no connect)
    g4b   => internal11,     -- p11 (@1C08,p13)
    g4a   => gnd,            -- p12 (GND)
    g1q_n => open           -- p13 (@1C08,p13) -- Note: Netlist says p13 connected to @1C08,p13. This p13 is g1q_n.
  );
  clock1_1c12 : td50 port map(
    input  => \-tprend\, -- p1 (-TPREND)
    o_20ns => \-tpw20\,  -- p4 (-TPW20)
    o_40ns => \-tpw40\,  -- p6 (-TPW40)
    o_50ns => \-tpw50\,  -- p8 (-TPW50)
    o_30ns => \-tpw30\,  -- p10 (-TPW30)
    o_10ns => \-tpw10\   -- p12 (-TPW10)
  );
  clock1_1c14 : td25 port map(
    input  => \-tpw50\,  -- p1 (-TPW50)
    o_10ns => \-tpw60\,  -- p4 (-TPW60)
    o_20ns => \-tpw70\,  -- p6 (-TPW70)
    o_25ns => \-tpw75\,  -- p8 (-TPW75)
    o_15ns => \-tpw65\,  -- p10 (-TPW65)
    o_5ns  => \-tpw55\   -- p12 (-TPW55)
  );
  clock1_1c15 : td25 port map(
    input  => \-tpw20\,  -- p1 (-TPW20)
    o_10ns => \-tpw30a\, -- p4 (-TPW30A)
    o_20ns => \-tpw40a\, -- p6 (-TPW40A)
    o_25ns => \-tpw45\,  -- p8 (-TPW45)
    o_15ns => \-tpw35\,  -- p10 (-TPW35)
    o_5ns  => \-tpw25\   -- p12 (-TPW25)
  );
  clock1_1d08 : sn74s151 port map(
    i3     => \-tpr100\,  -- p1 (-TPR100)
    i2     => \-tpr140\,  -- p2 (-TPR140)
    i1     => \-tpr160\,  -- p3 (-TPR160)
    i0     => \-tpr160\,  -- p4 (-TPR160)
    q      => \-tprend\,  -- p5 (-TPREND)
    q_n    => tprend,    -- p6 (TPREND)
    ce_n   => gnd,       -- p7 (GND)
    sel2   => sspeed1,   -- p9 (SSPEED1)
    sel1   => sspeed0,   -- p10 (SSPEED0)
    sel0   => \-ilong\,   -- p11 (-ILONG)
    i7     => \-tpr75\,   -- p12 (-TPR75)
    i6     => \-tpr115\,  -- p13 (-TPR115)
    i5     => \-tpr85\,   -- p14 (-TPR85)
    i4     => \-tpr125\  -- p15 (-TPR125)
  );
  clock1_1d11 : td25 port map(
    input  => \-tpr0\,   -- p1 (-TPR0)
    o_10ns => \-tpr10\,  -- p4 (-TPR10)
    o_20ns => \-tpr20a\, -- p6 (-TPR20A)
    o_25ns => \-tpr25\,  -- p8 (-TPR25)
    o_15ns => \-tpr15\,  -- p10 (-TPR15)
    o_5ns  => \-tpr5\   -- p12 (-TPR5)
  );
  clock1_1d12 : td100 port map(
    input   => \-tpr0\,   -- p1 (-TPR0)
    o_20ns  => \-tpr20\,  -- p12 (-TPR20)
    o_40ns  => \-tpr40\,  -- p4 (-TPR40)
    o_60ns  => \-tpr60\,  -- p10 (-TPR60)
    o_80ns  => \-tpr80\,  -- p6 (-TPR80)
    o_100ns => \-tpr100\  -- p8 (-TPR100)
  );
  clock1_1d13 : td100 port map(
    input   => \-tpr100\, -- p1 (-TPR100)
    o_40ns  => \-tpr140\, -- p4 (-TPR140)
    o_80ns  => \-tpr180\, -- p6 (-TPR180)
    o_100ns => \-tpr200\, -- p8 (-TPR200)
    o_60ns  => \-tpr160\, -- p10 (-TPR160)
    o_20ns  => \-tpr120\  -- p12 (-TPR120)
  );
  clock1_1d14 : td25 port map(
    input  => \-tpr100\, -- p1 (-TPR100)
    o_10ns => \-tpr110\, -- p4 (-TPR110)
    o_20ns => \-tpr120a\,-- p6 (-TPR120A)
    o_25ns => \-tpr125\,  -- p8 (-TPR125)
    o_15ns => \-tpr115\, -- p10 (-TPR115)
    o_5ns  => \-tpr105\   -- p12 (-TPR105)
  );
  clock1_1d15 : td25 port map(
    input  => \-tpr60\,  -- p1 (-TPR60)
    o_10ns => \-tpr70\,  -- p4 (-TPR70)
    o_20ns => \-tpr80a\, -- p6 (-TPR80A)
    o_25ns => \-tpr85\,  -- p8 (-TPR85)
    o_15ns => \-tpr75\,  -- p10 (-TPR75)
    o_5ns  => \-tpr65\   -- p12 (-TPR65)
  );
end architecture;
