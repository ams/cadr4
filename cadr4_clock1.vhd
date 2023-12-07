library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_clock1 is
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

architecture ttl of cadr4_clock1 is
  signal internal12 : std_logic;
  signal internal11 : std_logic;
begin
  clock1_1c08 : sn74s10 port map(g1a => \-clock_reset_b\, g1b => \-tpdone\, g2a => \-hang\, g2b => \-clock_reset_b\, g2c => cyclecompleted, g2y_n => \-tpr0\, g1y_n => internal12, g1c => internal11, g3a => '0', g3b => '0', g3c => '0');
  clock1_1c09 : sn74s00 port map(g1b => internal12, g1a => \-tpr40\, g1q_n => internal11, g2b => '0', g2a => '0', g3b => '0', g3a => '0', g4a => '0', g4b => '0');
  clock1_1c10 : sn74s02 port map(g4b => internal11, g4a => gnd, g4q_n => cyclecompleted, g1a => '0', g1b => '0', g2a => '0', g2b => '0', g3b => '0', g3a => '0');
  clock1_1c12 : td50 port map(input  => \-tprend\, o_20ns => \-tpw20\, o_40ns => \-tpw40\, o_50ns => \-tpw50\, o_30ns => \-tpw30\, o_10ns => \-tpw10\);
  clock1_1c14 : td25 port map(input  => \-tpw50\, o_10ns => \-tpw60\, o_20ns => \-tpw70\, o_25ns => \-tpw75\, o_15ns => \-tpw65\, o_5ns => \-tpw55\);
  clock1_1c15 : td25 port map(input  => \-tpw20\, o_10ns => \-tpw30a\, o_20ns => \-tpw40a\, o_25ns => \-tpw45\, o_15ns => \-tpw35\, o_5ns => \-tpw25\);
  clock1_1d08 : sn74s151 port map(i3 => \-tpr100\, i2 => \-tpr140\, i1 => \-tpr160\, i0 => \-tpr160\, q => \-tprend\, q_n => tprend, ce_n => gnd, sel2 => sspeed1, sel1 => sspeed0, sel0 => \-ilong\, i7 => \-tpr75\, i6 => \-tpr115\, i5 => \-tpr85\, i4 => \-tpr125\);
  clock1_1d11 : td25 port map(input  => \-tpr0\, o_10ns => \-tpr10\, o_20ns => \-tpr20a\, o_25ns => \-tpr25\, o_15ns => \-tpr15\, o_5ns => \-tpr5\);
  clock1_1d12 : td100 port map(input => \-tpr0\, o_40ns => \-tpr40\, o_80ns => \-tpr80\, o_100ns => \-tpr100\, o_60ns => \-tpr60\, o_20ns => \-tpr20\);
  clock1_1d13 : td100 port map(input => \-tpr100\, o_40ns => \-tpr140\, o_80ns => \-tpr180\, o_100ns => \-tpr200\, o_60ns => \-tpr160\, o_20ns => \-tpr120\);
  clock1_1d14 : td25 port map(input  => \-tpr100\, o_10ns => \-tpr110\, o_20ns => \-tpr120a\, o_25ns => \-tpr125\, o_15ns => \-tpr115\, o_5ns => \-tpr105\);
  clock1_1d15 : td25 port map(input  => \-tpr60\, o_10ns => \-tpr70\, o_20ns => \-tpr80a\, o_25ns => \-tpr85\, o_15ns => \-tpr75\, o_5ns => \-tpr65\);
end architecture;
