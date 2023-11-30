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
    internal7        : out std_logic;
    \-tpw70\         : in  std_logic;
    internal10       : out std_logic;
    \-tpclk\         : out std_logic;
    \-tpr0\          : in  std_logic;
    \-tpr5\          : in  std_logic;
    \-tpw30\         : in  std_logic;
    \machruna_l\     : in  std_logic;
    internal8        : out std_logic;
    tpwpiram         : out std_logic;
    \-wp5\           : out std_logic;
    clk5             : out std_logic;
    mclk5            : out std_logic;
    internal9        : out std_logic;
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
begin
  clock2_1c01 : sn7428 port map(g1q_n  => clk4, g1a => \-clk0\, g1b => gnd, g2q_n => mclk7, g2a => \-mclk0\, g2b => gnd, g3a => '0', g4a => '0', g4b => '0', g3b => '0');
  clock2_1c02 : sn7428 port map(g1q_n  => \-wp1\, g1a => tpwp, g1b => gnd, g2q_n => \-wp2\, g2a => tpwp, g2b => gnd, g3a => gnd, g3b => tpwp, g3q_n => \-wp3\, g4a => gnd, g4b => tpwp, g4q_n => \-wp4\);
  clock2_1c06 : sn74s10 port map(g1a   => \-tprend\, g1b => tpclk, g2a => \-tptse\, g2b => \-tpr25\, g2c => \-clock_reset_b\, g2y_n => tptse, g3y_n => internal7, g3a => \-clock_reset_b\, g3b => \-tpw70\, g3c => internal10, g1y_n => \-tpclk\, g1c => \-clock_reset_b\);
  clock2_1c07 : sn74s00 port map(g1b   => \-tpr0\, g1a => \-tpclk\, g1q_n => tpclk, g2b => \-tpr5\, g2a => tptse, g2q_n => \-tptse\, g3q_n => internal10, g3b => internal7, g3a => \-tpw30\, g4a => '0', g4b => '0');
  clock2_1c10 : sn74s02 port map(g2q_n => tpwp, g2a => internal7, g2b => \machruna_l\, g3b => \machruna_l\, g3a => internal8, g3q_n => tpwpiram, g1a => '0', g1b => '0', g4b => '0', g4a => '0');
  clock2_1c11 : sn7428 port map(g1q_n  => \-wp5\, g1a => tpwpiram, g1b => gnd, g2q_n => clk5, g2a => \-clk0\, g2b => gnd, g3a => gnd, g3b => \-mclk0\, g3q_n => mclk5, g4a => '0', g4b => '0');
  clock2_1c13 : sn74s10 port map(g2a   => \-tprend\, g2b => internal8, g2c => internal8, g2y_n => internal9, g3y_n => internal8, g3a => \-tpw45\, g3b => \-clock_reset_b\, g3c => internal9, g1a => '0', g1b => '0', g1c => '0');
  clock2_1d04 : sn7428 port map(g1q_n  => \-tse1\, g1a => tptse, g1b => gnd, g2q_n => \-tse2\, g2a => tptse, g2b => gnd, g3a => gnd, g3b => tptse, g3q_n => \-tse3\, g4a => gnd, g4b => tptse, g4q_n => \-tse4\);
  clock2_1d05 : sn7428 port map(g1q_n  => clk1, g1a => \-clk0\, g1b => gnd, g2q_n => clk2, g2a => \-clk0\, g2b => gnd, g3a => gnd, g3b => \-clk0\, g3q_n => clk3, g4a => gnd, g4b => \-mclk0\, g4q_n => mclk1);
  clock2_1d10 : sn74s08 port map(g1b   => \-tpclk\, g1a => machrun, g1q => \-clk0\, g3q => \-mclk0\, g3a => hi1, g3b => \-tpclk\, g2b => '0', g2a => '0', g4a => '0', g4b => '0');
end architecture;
