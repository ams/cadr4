-- The MIT CADR

library ieee;
use ieee.std_logic_1164.all;

use std.env.finish;

library work;
use work.cadr_book.cadr_clockd;
use work.icmem_book.cadr_clock1;
use work.icmem_book.cadr_clock2;
use work.icmem_book.cadr_olord1;
use work.icmem_book.cadr_olord2;

entity boot_tb is
end;

architecture structural of boot_tb is

  constant gnd : std_logic := '0';
  constant vcc : std_logic := '1';

  -- clock 1 inputs

  signal \-hang\          : std_logic := '1';
  signal \-ilong\         : std_logic := '1';
  signal sspeed0          : std_logic := '0';
  signal sspeed1          : std_logic := '0';

  -- clock 1 outputs / all the timing signals (tpr, tpw etc.)

  signal \-tpr0\          : std_logic := '1';
  signal \-tpr100\        : std_logic := '1';
  signal \-tpr105\        : std_logic := '1';
  signal \-tpr10\         : std_logic := '1';
  signal \-tpr110\        : std_logic := '1';
  signal \-tpr115\        : std_logic := '1';
  signal \-tpr120\        : std_logic := '1';
  signal \-tpr120a\       : std_logic := '1';
  signal \-tpr125\        : std_logic := '1';
  signal \-tpr140\        : std_logic := '1';
  signal \-tpr15\         : std_logic := '1';
  signal \-tpr160\        : std_logic := '1';
  signal \-tpr180\        : std_logic := '1';
  signal \-tpr200\        : std_logic := '1';
  signal \-tpr20\         : std_logic := '1';
  signal \-tpr20a\        : std_logic := '1';
  signal \-tpr25\         : std_logic := '1';
  signal \-tpr40\         : std_logic := '1';
  signal \-tpr5\          : std_logic := '1';
  signal \-tpr60\         : std_logic := '1';
  signal \-tpr65\         : std_logic := '1';
  signal \-tpr70\         : std_logic := '1';
  signal \-tpr75\         : std_logic := '1';
  signal \-tpr80\         : std_logic := '1';
  signal \-tpr80a\        : std_logic := '1';
  signal \-tpr85\         : std_logic := '1';
  signal \-tprend\        : std_logic := '1';
  signal \-tpw10\         : std_logic := '1';
  signal \-tpw20\         : std_logic := '1';
  signal \-tpw25\         : std_logic := '1';
  signal \-tpw30\         : std_logic := '1';
  signal \-tpw30a\        : std_logic := '1';
  signal \-tpw35\         : std_logic := '1';
  signal \-tpw40\         : std_logic := '1';
  signal \-tpw40a\        : std_logic := '1';
  signal \-tpw45\         : std_logic := '1';
  signal \-tpw50\         : std_logic := '1';
  signal \-tpw55\         : std_logic := '1';
  signal \-tpw60\         : std_logic := '1';
  signal \-tpw65\         : std_logic := '1';
  signal \-tpw70\         : std_logic := '1';
  signal \-tpw75\         : std_logic := '1';
  signal cyclecompleted   : std_logic := '0';  
  signal tprend           : std_logic := '0';
  
  -- clock 2 inputs

  signal \machruna l\     : std_logic := '0';
  signal machrun          : std_logic := '0';
  signal hi1              : std_logic := '0';

  -- clock 2 outputs / clock and control signals (clk, wp etc.)

  signal clk4             : std_logic := '0';
  signal \-clk0\          : std_logic := '1';
  signal mclk7            : std_logic := '0';
  signal \-mclk0\         : std_logic := '1';
  signal \-wp1\           : std_logic := '1';
  signal tpwp             : std_logic := '0';
  signal \-wp2\           : std_logic := '1';
  signal \-wp3\           : std_logic := '1';
  signal \-wp4\           : std_logic := '1';
  signal tpclk            : std_logic := '0';
  signal \-tptse\         : std_logic := '1';
  signal \-tpclk\         : std_logic := '1';
  signal tptse            : std_logic := '0';  
  signal tpwpiram         : std_logic := '0';
  signal \-wp5\           : std_logic := '1';
  signal clk5             : std_logic := '0';
  signal mclk5            : std_logic := '0';
  signal \-tse1\          : std_logic := '1';
  signal \-tse2\          : std_logic := '1';
  signal \-tse3\          : std_logic := '1';
  signal \-tse4\          : std_logic := '1';
  signal clk1             : std_logic := '0';
  signal clk2             : std_logic := '0';
  signal clk3             : std_logic := '0';
  signal mclk1            : std_logic := '0';
  
  -- clockd inputs
  
  signal reset          : std_logic := '0';
  signal hi2            : std_logic := '0';
  signal hi3            : std_logic := '0';
  signal hi4            : std_logic := '0';
  signal hi5            : std_logic := '0';
  signal hi6            : std_logic := '0';
  signal hi7            : std_logic := '0';
  signal hi8            : std_logic := '0';
  signal hi9            : std_logic := '0';
  signal hi10           : std_logic := '0';
  signal hi11           : std_logic := '0';
  signal hi12           : std_logic := '0';
  signal lcry3          : std_logic := '0';
  signal \-srcpdlptr\   : std_logic := '1';
  signal \-srcpdlidx\   : std_logic := '1';

  -- clockd outputs / clock distribution and reset (clk*, wp* etc.)

  signal \-clk1\        : std_logic := '1';
  signal clk1a          : std_logic := '0';
  signal \-reset\       : std_logic := '1';
  signal mclk1a         : std_logic := '0';
  signal \-mclk1\       : std_logic := '1';
  signal wp1b           : std_logic := '0';
  signal wp1a           : std_logic := '0';
  signal tse1b          : std_logic := '0';
  signal tse1a          : std_logic := '0';
  signal \-upperhighok\ : std_logic := '1';
  signal \-lcry3\       : std_logic := '1';
  signal \-clk2c\       : std_logic := '1';
  signal \-clk2a\       : std_logic := '1';
  signal wp2            : std_logic := '0';
  signal tse2           : std_logic := '0';
  signal clk2a          : std_logic := '0';
  signal clk2b          : std_logic := '0';
  signal clk2c          : std_logic := '0';
  signal \-clk3a\       : std_logic := '1';
  signal clk3a          : std_logic := '0';
  signal clk3b          : std_logic := '0';
  signal clk3c          : std_logic := '0';
  signal \-clk3g\       : std_logic := '1';
  signal \-clk3d\       : std_logic := '1';
  signal wp3a           : std_logic := '0';
  signal tse3a          : std_logic := '0';
  signal clk3d          : std_logic := '0';
  signal clk3e          : std_logic := '0';
  signal clk3f          : std_logic := '0';
  signal \-clk4a\       : std_logic := '1';
  signal clk4a          : std_logic := '0';
  signal clk4b          : std_logic := '0';
  signal clk4c          : std_logic := '0';
  signal \-clk4e\       : std_logic := '1';
  signal \-clk4d\       : std_logic := '1';
  signal wp4c           : std_logic := '0';
  signal wp4b           : std_logic := '0';
  signal wp4a           : std_logic := '0';
  signal clk4d          : std_logic := '0';
  signal clk4e          : std_logic := '0';
  signal clk4f          : std_logic := '0';
  signal tse4b          : std_logic := '0';
  signal tse4a          : std_logic := '0';
  signal srcpdlptr      : std_logic := '0';
  signal srcpdlidx      : std_logic := '0';

  -- cadr_olord1 inputs 

  signal \-boot\          : std_logic := '1';  
  signal \-errhalt\       : std_logic := '1';
  signal \-ldclk\         : std_logic := '1';
  signal \-ldmode\        : std_logic := '1';
  signal \-ldopc\         : std_logic := '1';
  signal \-stc32\         : std_logic := '1';
  signal \-wait\          : std_logic := '1';
  signal spy0             : std_logic := '0';
  signal spy1             : std_logic := '0';
  signal spy2             : std_logic := '0';
  signal spy3             : std_logic := '0';
  signal spy4             : std_logic := '0';
  signal spy5             : std_logic := '0';
  signal statstop         : std_logic := '0';

  -- cadr_olord1 outputs / control and status signals (speed*, run, step etc.)

  signal \-idebug\        : std_logic := '1';
  signal \-ldstat\        : std_logic := '1';
  signal \-lpc.hold\      : std_logic := '1';
  signal \-machruna\      : std_logic := '1';
  signal \-machrun\       : std_logic := '1';
  signal \-nop11\         : std_logic := '1';
  signal \-opcclk\        : std_logic := '1';
  signal \-opcinh\        : std_logic := '1';
  signal \-run\           : std_logic := '1';
  signal \-ssdone\        : std_logic := '1';
  signal \-stathalt\      : std_logic := '1';
  signal \-step\          : std_logic := '1';
  signal \stat.ovf\       : std_logic := '0';
  signal errstop          : std_logic := '0';
  signal idebug           : std_logic := '0';
  signal ldstat           : std_logic := '0';
  signal \lpc.hold\       : std_logic := '0';
  signal nop11            : std_logic := '0';
  signal opcclk           : std_logic := '0';
  signal opcinh           : std_logic := '0';
  signal promdisable      : std_logic := '0';
  signal promdisabled     : std_logic := '0';
  signal run              : std_logic := '0';
  signal speed0           : std_logic := '0';
  signal speed0a          : std_logic := '0';
  signal speed1           : std_logic := '0';
  signal speed1a          : std_logic := '0';
  signal speedclk         : std_logic := '0';
  signal srun             : std_logic := '0';
  signal ssdone           : std_logic := '0';
  signal sstep            : std_logic := '0';
  signal stathenb         : std_logic := '0';
  signal step             : std_logic := '0';
  signal trapenb          : std_logic := '0';

  -- cadr_olord2 inputs

  signal \-boot1\            : std_logic := '1';
  signal \-boot2\            : std_logic := '1';
  signal \-busint.lm.reset\  : std_logic := '1';
  signal \-halt\             : std_logic := '1';
  signal aparok              : std_logic := '0';
  signal dparok              : std_logic := '0';
  signal iparok              : std_logic := '0';
  signal memparok            : std_logic := '0';
  signal mmemparok           : std_logic := '0';
  signal pdlparok            : std_logic := '0';
  signal spcparok            : std_logic := '0';
  signal spy6                : std_logic := '0';
  signal spy7                : std_logic := '0';
  signal v0parok             : std_logic := '0';
  signal vmoparok            : std_logic := '0';

  -- cadr_olord2 outputs / reset and error signals (clock reset, err, highok etc.)

  signal \-ape\              : std_logic := '1';
  signal \-bus.reset\        : std_logic := '1';
  signal \-clk5\             : std_logic := '1';
  signal \-clock reset a\    : std_logic := '1';
  signal \-clock reset b\    : std_logic := '1';
  signal \-dpe\              : std_logic := '1';
  signal \-higherr\          : std_logic := '1';
  signal \-halted\           : std_logic := '1';
  signal \-ipe\              : std_logic := '1';
  signal \-lowerhighok\      : std_logic := '1';
  signal \-mclk5\            : std_logic := '1';
  signal \-mempe\            : std_logic := '1';
  signal \-mpe\              : std_logic := '1';
  signal \-pdlpe\            : std_logic := '1';
  signal \-power reset\      : std_logic := '1';
  signal \-prog.reset\       : std_logic := '1';
  signal \-spe\              : std_logic := '1';
  signal \-v0pe\             : std_logic := '1';
  signal \-v1pe\             : std_logic := '1';
  signal \boot.trap\         : std_logic := '0';
  signal \bus.power.reset l\ : std_logic := '0';
  signal clk5a               : std_logic := '0';
  signal err                 : std_logic := '0';
  signal highok              : std_logic := '0';
  signal ldmode              : std_logic := '0';
  signal mclk5a              : std_logic := '0';
  signal \power reset a\     : std_logic := '0';
  signal \prog.boot\         : std_logic := '0';
  signal \prog.bus.reset\    : std_logic := '0';

begin

  i_clock1 : entity work.cadr_clock1(mete) port map(\-clock reset b\ => \-clock reset b\, \-hang\ => \-hang\, cyclecompleted => cyclecompleted, \-tpr0\ => \-tpr0\, \-tpr40\ => \-tpr40\, gnd => gnd, \-tprend\ => \-tprend\, \-tpw20\ => \-tpw20\, \-tpw40\ => \-tpw40\, \-tpw50\ => \-tpw50\, \-tpw30\ => \-tpw30\, \-tpw10\ => \-tpw10\, \-tpw60\ => \-tpw60\, \-tpw70\ => \-tpw70\, \-tpw75\ => \-tpw75\, \-tpw65\ => \-tpw65\, \-tpw55\ => \-tpw55\, \-tpw30a\ => \-tpw30a\, \-tpw40a\ => \-tpw40a\, \-tpw45\ => \-tpw45\, \-tpw35\ => \-tpw35\, \-tpw25\ => \-tpw25\, \-tpr100\ => \-tpr100\, \-tpr140\ => \-tpr140\, \-tpr160\ => \-tpr160\, tprend => tprend, sspeed1 => sspeed1, sspeed0 => sspeed0, \-ilong\ => \-ilong\, \-tpr75\ => \-tpr75\, \-tpr115\ => \-tpr115\, \-tpr85\ => \-tpr85\, \-tpr125\ => \-tpr125\, \-tpr10\ => \-tpr10\, \-tpr20a\ => \-tpr20a\, \-tpr25\ => \-tpr25\, \-tpr15\ => \-tpr15\, \-tpr5\ => \-tpr5\, \-tpr80\ => \-tpr80\, \-tpr60\ => \-tpr60\, \-tpr20\ => \-tpr20\, \-tpr180\ => \-tpr180\, \-tpr200\ => \-tpr200\, \-tpr120\ => \-tpr120\, \-tpr110\ => \-tpr110\, \-tpr120a\ => \-tpr120a\, \-tpr105\ => \-tpr105\, \-tpr70\ => \-tpr70\, \-tpr80a\ => \-tpr80a\, \-tpr65\ => \-tpr65\);
  i_clock2 : entity work.cadr_clock2(mete) port map(clk4 => clk4, \-clk0\ => \-clk0\, gnd => gnd, mclk7 => mclk7, \-mclk0\ => \-mclk0\, \-wp1\ => \-wp1\, tpwp => tpwp, \-wp2\ => \-wp2\, \-wp3\ => \-wp3\, \-wp4\ => \-wp4\, \-tprend\ => \-tprend\, tpclk => tpclk, \-tptse\ => \-tptse\, \-tpr25\ => \-tpr25\, \-clock reset b\ => \-clock reset b\, tptse => tptse, \-tpw70\ => \-tpw70\, \-tpclk\ => \-tpclk\, \-tpr0\ => \-tpr0\, \-tpr5\ => \-tpr5\, \-tpw30\ => \-tpw30\, \machruna l\ => \machruna l\, tpwpiram => tpwpiram, \-wp5\ => \-wp5\, clk5 => clk5, mclk5 => mclk5, \-tpw45\ => \-tpw45\, \-tse1\ => \-tse1\, \-tse2\ => \-tse2\, \-tse3\ => \-tse3\, \-tse4\ => \-tse4\, clk1 => clk1, clk2 => clk2, clk3 => clk3, mclk1 => mclk1, machrun => machrun, hi1 => hi1);
  i_clockd : cadr_clockd port map(\-clk1\ => \-clk1\, hi12 => hi12, clk1a => clk1a, reset => reset, \-reset\ => \-reset\, mclk1a => mclk1a, \-mclk1\ => \-mclk1\, mclk1 => mclk1, clk1 => clk1, \-wp1\ => \-wp1\, wp1b => wp1b, wp1a => wp1a, tse1b => tse1b, \-tse1\ => \-tse1\, tse1a => tse1a, hi1 => hi1, hi2 => hi2, hi3 => hi3, hi4 => hi4, hi5 => hi5, hi6 => hi6, hi7 => hi7, \-upperhighok\ => \-upperhighok\, hi8 => hi8, hi9 => hi9, hi10 => hi10, hi11 => hi11, lcry3 => lcry3, \-lcry3\ => \-lcry3\, clk2 => clk2, \-clk2c\ => \-clk2c\, \-clk2a\ => \-clk2a\, wp2 => wp2, \-wp2\ => \-wp2\, tse2 => tse2, \-tse2\ => \-tse2\, clk2a => clk2a, clk2b => clk2b, clk2c => clk2c, \-clk3a\ => \-clk3a\, clk3a => clk3a, clk3b => clk3b, clk3c => clk3c, clk3 => clk3, \-clk3g\ => \-clk3g\, \-clk3d\ => \-clk3d\, wp3a => wp3a, \-wp3\ => \-wp3\, tse3a => tse3a, \-tse3\ => \-tse3\, clk3d => clk3d, clk3e => clk3e, clk3f => clk3f, \-clk4a\ => \-clk4a\, clk4a => clk4a, clk4b => clk4b, clk4c => clk4c, clk4 => clk4, \-clk4e\ => \-clk4e\, \-clk4d\ => \-clk4d\, wp4c => wp4c, \-wp4\ => \-wp4\, wp4b => wp4b, wp4a => wp4a, clk4d => clk4d, clk4e => clk4e, clk4f => clk4f, \-tse4\ => \-tse4\, tse4b => tse4b, tse4a => tse4a, srcpdlptr => srcpdlptr, \-srcpdlptr\ => \-srcpdlptr\, srcpdlidx => srcpdlidx, \-srcpdlidx\ => \-srcpdlidx\);

  i_olord1 : cadr_olord1 port map(\-clock reset a\ => \-clock reset a\, speed1a => speed1a, sspeed1 => sspeed1, speedclk => speedclk, sspeed0 => sspeed0, speed0a => speed0a, speed1 => speed1, speed0 => speed0, \-reset\ => \-reset\, spy0 => spy0, spy1 => spy1, spy2 => spy2, errstop => errstop, \-ldmode\ => \-ldmode\, stathenb => stathenb, spy3 => spy3, trapenb => trapenb, spy4 => spy4, spy5 => spy5, promdisable => promdisable, \-opcinh\ => \-opcinh\, opcinh => opcinh, \-ldopc\ => \-ldopc\, opcclk => opcclk, \-opcclk\ => \-opcclk\, \-lpc.hold\ => \-lpc.hold\, \lpc.hold\ => \lpc.hold\, ldstat => ldstat, \-ldstat\ => \-ldstat\, \-idebug\ => \-idebug\, idebug => idebug, \-ldclk\ => \-ldclk\, nop11 => nop11, \-nop11\ => \-nop11\, \-step\ => \-step\, step => step, promdisabled => promdisabled, sstep => sstep, ssdone => ssdone, mclk5a => mclk5a, srun => srun, run => run, \-boot\ => \-boot\, \-run\ => \-run\, \-ssdone\ => \-ssdone\, \-errhalt\ => \-errhalt\, \-wait\ => \-wait\, \-stathalt\ => \-stathalt\, machrun => machrun, \stat.ovf\ => \stat.ovf\, \-stc32\ => \-stc32\, \-tpr60\ => \-tpr60\, gnd => gnd, statstop => statstop, \-machruna\ => \-machruna\, \-machrun\ => \-machrun\);
  i_olord2 : cadr_olord2 port map(vcc => vcc, \-ape\ => \-ape\, \-mpe\ => \-mpe\, \-pdlpe\ => \-pdlpe\, \-dpe\ => \-dpe\, \-ipe\ => \-ipe\, \-spe\ => \-spe\, \-higherr\ => \-higherr\, err => err, \-mempe\ => \-mempe\, \-v0pe\ => \-v0pe\, \-v1pe\ => \-v1pe\, \-halted\ => \-halted\, hi1 => hi1, gnd => gnd, aparok => aparok, mmemparok => mmemparok, pdlparok => pdlparok, dparok => dparok, clk5a => clk5a, iparok => iparok, spcparok => spcparok, highok => highok, memparok => memparok, v0parok => v0parok, vmoparok => vmoparok, statstop => statstop, \stat.ovf\ => \stat.ovf\, \-halt\ => \-halt\, \-mclk5\ => \-mclk5\, mclk5a => mclk5a, \-clk5\ => \-clk5\, \-reset\ => \-reset\, reset => reset, \bus.power.reset l\ => \bus.power.reset l\, \power reset a\ => \power reset a\, \-upperhighok\ => \-upperhighok\, \-lowerhighok\ => \-lowerhighok\, \-boot\ => \-boot\, \prog.bus.reset\ => \prog.bus.reset\, \-bus.reset\ => \-bus.reset\, \-clock reset b\ => \-clock reset b\, \-clock reset a\ => \-clock reset a\, \-power reset\ => \-power reset\, srun => srun, \boot.trap\ => \boot.trap\, hi2 => hi2, \-boot1\ => \-boot1\, \-boot2\ => \-boot2\, \-ldmode\ => \-ldmode\, ldmode => ldmode, mclk5 => mclk5, clk5 => clk5, \-busint.lm.reset\ => \-busint.lm.reset\, \-prog.reset\ => \-prog.reset\, spy6 => spy6, \-errhalt\ => \-errhalt\, errstop => errstop, \prog.boot\ => \prog.boot\, spy7 => spy7);

  -- the signals below have to be manually set
  -- other inputs to the 5 components above are outputs also from the 5 components above

  -- clock1
  \-ilong\  <= not '0';
  \-hang\   <= not '0';

  -- clock2
  \machruna l\ <= not machrun; -- -machrun

  -- clockd
  hi3            <= '1';
  hi4            <= '1';
  hi5            <= '1';
  hi6            <= '1';
  hi7            <= '1';
  hi8            <= '1';
  hi9            <= '1';
  hi10           <= '1';
  hi11           <= '1';
  hi12           <= '1';
  lcry3          <= '0';
  \-srcpdlptr\   <= not '0';
  \-srcpdlidx\   <= not '0';

  -- cadr_olord1 inputs
  \-boot\          <= not '0';
  \-ldclk\         <= not '0';
  \-ldopc\         <= not '0';
  \-stc32\         <= not '0';
  \-wait\          <= not '0';
  spy0             <= '0';
  spy1             <= '0';
  spy2             <= '0';
  spy3             <= '0';
  spy4             <= '0';
  spy5             <= '0';

  -- cadr_olord2 inputs
  aparok              <= '1';
  \-busint.lm.reset\  <= not '0';
  dparok              <= '1';
  \-halt\             <= not '0';
  iparok              <= '1';
  memparok            <= '1';
  mmemparok           <= '1';
  pdlparok            <= '1';
  spcparok            <= '1';
  spy6                <= '0';
  spy7                <= '0';
  v0parok             <= '1';
  vmoparok            <= '1';

  process
  begin
    wait for 1000 ns;
    finish;
  end process;

end architecture;
