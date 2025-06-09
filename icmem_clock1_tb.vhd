-- The MIT CADR

library ieee;
use ieee.std_logic_1164.all;

use std.env.finish;

library work;
use work.icmem_book.all;

entity icmem_clock1_tb is
end;

architecture structural of icmem_clock1_tb is
  signal \-clock_reset_b\ : std_logic;
  signal \-hang\          : std_logic;
  signal \-ilong\         : std_logic;
  signal \-tpdone\        : std_logic;
  signal \-tpr0\          : std_logic;
  signal \-tpr100\        : std_logic;
  signal \-tpr105\        : std_logic;
  signal \-tpr10\         : std_logic;
  signal \-tpr110\        : std_logic;
  signal \-tpr115\        : std_logic;
  signal \-tpr120\        : std_logic;
  signal \-tpr120a\       : std_logic;
  signal \-tpr125\        : std_logic;
  signal \-tpr140\        : std_logic;
  signal \-tpr15\         : std_logic;
  signal \-tpr160\        : std_logic;
  signal \-tpr180\        : std_logic;
  signal \-tpr200\        : std_logic;
  signal \-tpr20\         : std_logic;
  signal \-tpr20a\        : std_logic;
  signal \-tpr25\         : std_logic;
  signal \-tpr40\         : std_logic;
  signal \-tpr5\          : std_logic;
  signal \-tpr60\         : std_logic;
  signal \-tpr65\         : std_logic;
  signal \-tpr70\         : std_logic;
  signal \-tpr75\         : std_logic;
  signal \-tpr80\         : std_logic;
  signal \-tpr80a\        : std_logic;
  signal \-tpr85\         : std_logic;
  signal \-tprend\        : std_logic;
  signal \-tpw10\         : std_logic;
  signal \-tpw20\         : std_logic;
  signal \-tpw25\         : std_logic;
  signal \-tpw30\         : std_logic;
  signal \-tpw30a\        : std_logic;
  signal \-tpw35\         : std_logic;
  signal \-tpw40\         : std_logic;
  signal \-tpw40a\        : std_logic;
  signal \-tpw45\         : std_logic;
  signal \-tpw50\         : std_logic;
  signal \-tpw55\         : std_logic;
  signal \-tpw60\         : std_logic;
  signal \-tpw65\         : std_logic;
  signal \-tpw70\         : std_logic;
  signal \-tpw75\         : std_logic;
  signal cyclecompleted   : std_logic;
  signal gnd              : std_logic;
  signal sspeed0          : std_logic;
  signal sspeed1          : std_logic;
  signal tprend           : std_logic;
begin

  i_clock1 : clock1 port map(\-clock_reset_b\ => \-clock_reset_b\, \-tpdone\ => \-tpdone\, \-hang\ => \-hang\, cyclecompleted => cyclecompleted, \-tpr0\ => \-tpr0\, \-tpr40\ => \-tpr40\, gnd => gnd, \-tprend\ => \-tprend\, \-tpw20\ => \-tpw20\, \-tpw40\ => \-tpw40\, \-tpw50\ => \-tpw50\, \-tpw30\ => \-tpw30\, \-tpw10\ => \-tpw10\, \-tpw60\ => \-tpw60\, \-tpw70\ => \-tpw70\, \-tpw75\ => \-tpw75\, \-tpw65\ => \-tpw65\, \-tpw55\ => \-tpw55\, \-tpw30a\ => \-tpw30a\, \-tpw40a\ => \-tpw40a\, \-tpw45\ => \-tpw45\, \-tpw35\ => \-tpw35\, \-tpw25\ => \-tpw25\, \-tpr100\ => \-tpr100\, \-tpr140\ => \-tpr140\, \-tpr160\ => \-tpr160\, tprend => tprend, sspeed1 => sspeed1, sspeed0 => sspeed0, \-ilong\ => \-ilong\, \-tpr75\ => \-tpr75\, \-tpr115\ => \-tpr115\, \-tpr85\ => \-tpr85\, \-tpr125\ => \-tpr125\, \-tpr10\ => \-tpr10\, \-tpr20a\ => \-tpr20a\, \-tpr25\ => \-tpr25\, \-tpr15\ => \-tpr15\, \-tpr5\ => \-tpr5\, \-tpr80\ => \-tpr80\, \-tpr60\ => \-tpr60\, \-tpr20\ => \-tpr20\, \-tpr180\ => \-tpr180\, \-tpr200\ => \-tpr200\, \-tpr120\ => \-tpr120\, \-tpr110\ => \-tpr110\, \-tpr120a\ => \-tpr120a\, \-tpr105\ => \-tpr105\, \-tpr70\ => \-tpr70\, \-tpr80a\ => \-tpr80a\, \-tpr65\ => \-tpr65\);

  gnd <= '0';

  -- Manual Overlord.

  sspeed0   <= '0';
  sspeed1   <= '0';
  \-ilong\ <= not '0';

  process
  begin
    \-hang\          <= not '0';
    \-clock_reset_b\ <= not '0';
    wait for 20 ns;
    \-clock_reset_b\ <= not '1';
    wait;
  end process;

end architecture;
