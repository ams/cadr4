-- The MIT CADR --- Clock generation testbench

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.icmem_book.cadr_olord2;
use work.icmem_book.cadr_clock1;
use work.icmem_book.cadr_clock2;
use work.cadr_book.cadr_clockd;
use work.icmem_book.cadr_olord1;

entity boot_tb is
end;

architecture structural of boot_tb is

  -- olord2 inputs
  signal \-busint.lm.reset\  : std_logic := '1';
  
  -- from parity generators
  signal aparok              : std_logic := '1';
  signal mmemparok           : std_logic := '1';
  signal pdlparok            : std_logic := '1';
  signal dparok              : std_logic := '1';
  signal iparok              : std_logic := '1';
  signal spcparok            : std_logic := '1';
  signal memparok            : std_logic := '1';
  signal v0parok             : std_logic := '1';
  signal vmoparok            : std_logic := '1';
  
  -- from mcpins
  signal \-halt\             : std_logic := '1';

  -- from spyX
  signal spy6                : std_logic := '0';
  signal spy7                : std_logic := '0'; 
  signal \-ldmode\           : std_logic := '1';

  -- olord2 outputs
  signal \-ape\              : std_logic;
  signal \-boot\             : std_logic;
  signal \-boot1\            : std_logic;
  signal \-boot2\            : std_logic;
  signal \-bus.reset\        : std_logic;
  signal \-clock reset a\    : std_logic;
  signal \-clock reset b\    : std_logic;
  signal \-clk5\             : std_logic;
  signal \-dpe\              : std_logic;
  signal \-errhalt\          : std_logic;
  signal \-higherr\          : std_logic;
  signal \-ipe\              : std_logic;
  signal \-lowerhighok\      : std_logic;
  signal \-mclk5\            : std_logic;
  signal \-mempe\            : std_logic;
  signal \-mpe\              : std_logic;
  signal \-pdlpe\            : std_logic;
  signal \-power reset\      : std_logic;
  signal \-prog.reset\       : std_logic;
  signal \-reset\            : std_logic;
  signal \-spe\              : std_logic;
  signal \-v0pe\             : std_logic;
  signal \-v1pe\             : std_logic;
  signal \boot.trap\         : std_logic;
  signal \bus.power.reset l\ : std_logic;
  signal \power reset a\     : std_logic;
  signal \prog.bus.reset\    : std_logic;
  signal \prog.boot\         : std_logic;
  signal clk5a               : std_logic;
  signal err                 : std_logic;
  -- these are H because they are pulled up in spc
  signal hi1                 : std_logic := 'H';
  signal hi2                 : std_logic := 'H';
  signal highok              : std_logic;
  signal \-halted\           : std_logic;
  signal ldmode              : std_logic;
  signal mclk5a              : std_logic;
  signal reset               : std_logic;
  signal statstop            : std_logic;

  -- clock 1 inputs
  -- from vctl1
  signal \-hang\    : std_logic := '1';
  -- from olord1
  signal sspeed1    : std_logic := '0';
  signal sspeed0    : std_logic := '0';
  -- from flags
  signal \-ilong\   : std_logic := '1';

  -- clock 1 outputs
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
  signal tprend           : std_logic;
  
  -- clock 2 inputs

  -- clock 2 outputs
  signal clk5             : std_logic;
  signal mclk5            : std_logic;
  signal clk4             : std_logic;
  signal \-clk0\          : std_logic;
  signal mclk7            : std_logic;
  signal \-mclk0\         : std_logic;
  signal \-wp1\           : std_logic;
  signal tpwp             : std_logic;
  signal \-wp2\           : std_logic;
  signal \-wp3\           : std_logic;
  signal \-wp4\           : std_logic;
  signal tpclk            : std_logic;
  signal \-tptse\         : std_logic;
  signal \-tpclk\         : std_logic;
  signal tptse            : std_logic;  
  signal tpwpiram         : std_logic;
  signal \-wp5\           : std_logic;
  signal \-tse1\          : std_logic;
  signal \-tse2\          : std_logic;
  signal \-tse3\          : std_logic;
  signal \-tse4\          : std_logic;
  signal clk1             : std_logic;
  signal clk2             : std_logic;
  signal clk3             : std_logic;
  signal mclk1            : std_logic;
  
  -- clockd inputs
  -- pulled up in spc
  signal hi3            : std_logic := 'H';
  signal hi4            : std_logic := 'H';
  signal hi5            : std_logic := 'H';
  signal hi6            : std_logic := 'H';
  signal hi7            : std_logic := 'H';
  signal hi8            : std_logic := 'H';
  signal hi9            : std_logic := 'H';
  signal hi10           : std_logic := 'H';
  signal hi11           : std_logic := 'H';
  signal hi12           : std_logic := 'H';
  -- from lcc
  signal lcry3          : std_logic := '0';
  -- from source
  signal \-srcpdlptr\   : std_logic := '1';
  signal \-srcpdlidx\   : std_logic := '1';

  -- clockd outputs
  signal \-clk1\        : std_logic;
  signal clk1a          : std_logic;
  signal mclk1a         : std_logic;
  signal \-mclk1\       : std_logic;
  signal wp1b           : std_logic;
  signal wp1a           : std_logic;
  signal tse1b          : std_logic;
  signal tse1a          : std_logic;
  signal \-lcry3\       : std_logic;
  signal \-clk2c\       : std_logic;
  signal \-clk2a\       : std_logic;
  signal wp2            : std_logic;
  signal tse2           : std_logic;
  signal clk2a          : std_logic;
  signal clk2b          : std_logic;
  signal clk2c          : std_logic;
  signal \-clk3a\       : std_logic;
  signal clk3a          : std_logic;
  signal clk3b          : std_logic;
  signal clk3c          : std_logic;
  signal \-clk3g\       : std_logic;
  signal \-clk3d\       : std_logic;
  signal wp3a           : std_logic;
  signal tse3a          : std_logic;
  signal clk3d          : std_logic;
  signal clk3e          : std_logic;
  signal clk3f          : std_logic;
  signal \-clk4a\       : std_logic;
  signal clk4a          : std_logic;
  signal clk4b          : std_logic;
  signal clk4c          : std_logic;
  signal \-clk4e\       : std_logic;
  signal \-clk4d\       : std_logic;
  signal wp4c           : std_logic;
  signal wp4b           : std_logic;
  signal wp4a           : std_logic;
  signal clk4d          : std_logic;
  signal clk4e          : std_logic;
  signal clk4f          : std_logic;
  signal tse4b          : std_logic;
  signal tse4a          : std_logic;
  signal srcpdlptr      : std_logic;
  signal srcpdlidx      : std_logic;
  signal \-upperhighok\ : std_logic;

  -- olord1 inputs
  -- from spy
  signal spy0           : std_logic := '0';
  signal spy1           : std_logic := '0';
  signal spy2           : std_logic := '0';
  signal spy3           : std_logic := '0';
  signal spy4           : std_logic := '0';
  signal spy5           : std_logic := '0';

  -- from vctl1
  signal \-wait\        : std_logic := '1';

  -- olord1 outputs
  signal speed1a        : std_logic;
  signal speedclk       : std_logic;
  signal speed0a        : std_logic;
  signal speed1         : std_logic;
  signal speed0         : std_logic;
  signal stathenb       : std_logic;
  signal trapenb        : std_logic;
  signal promdisable    : std_logic;
  signal \-opcinh\      : std_logic;
  signal opcinh         : std_logic;
  signal \-ldopc\       : std_logic;
  signal opcclk         : std_logic;
  signal \-opcclk\      : std_logic;
  signal \-lpc.hold\    : std_logic;
  signal \lpc.hold\     : std_logic;
  signal ldstat         : std_logic;
  signal \-ldstat\      : std_logic;
  signal \-idebug\      : std_logic;
  signal idebug         : std_logic;
  signal \-ldclk\       : std_logic;
  signal nop11          : std_logic;
  signal \-nop11\       : std_logic;
  signal \-step\        : std_logic;
  signal step           : std_logic;
  signal promdisabled   : std_logic;
  signal sstep          : std_logic;
  signal ssdone         : std_logic;
  signal run            : std_logic;
  signal \-run\         : std_logic;
  signal \-ssdone\      : std_logic;
  signal \-stathalt\    : std_logic;
  signal \-stc32\       : std_logic;
  signal \-machrun\     : std_logic;
  signal machrun        : std_logic;
  signal \-machruna\    : std_logic;
  signal \stat.ovf\     : std_logic;
  signal srun           : std_logic;
  signal errstop        : std_logic;

begin

  i_olord2 : cadr_olord2 port map(\-ape\ => \-ape\, \-mpe\ => \-mpe\, \-pdlpe\ => \-pdlpe\, \-dpe\ => \-dpe\, \-ipe\ => \-ipe\, \-spe\ => \-spe\, \-higherr\ => \-higherr\, err => err, \-mempe\ => \-mempe\, \-v0pe\ => \-v0pe\, \-v1pe\ => \-v1pe\, \-halted\ => \-halted\, hi1 => hi1, aparok => aparok, mmemparok => mmemparok, pdlparok => pdlparok, dparok => dparok, clk5a => clk5a, iparok => iparok, spcparok => spcparok, highok => highok, memparok => memparok, v0parok => v0parok, vmoparok => vmoparok, statstop => statstop, \stat.ovf\ => \stat.ovf\, \-halt\ => \-halt\, \-mclk5\ => \-mclk5\, mclk5a => mclk5a, \-clk5\ => \-clk5\, \-reset\ => \-reset\, reset => reset, \bus.power.reset l\ => \bus.power.reset l\, \power reset a\ => \power reset a\, \-upperhighok\ => \-upperhighok\, \-lowerhighok\ => \-lowerhighok\, \-boot\ => open, \prog.bus.reset\ => \prog.bus.reset\, \-bus.reset\ => \-bus.reset\, \-clock reset b\ => \-clock reset b\, \-clock reset a\ => \-clock reset a\, \-power reset\ => \-power reset\, srun => srun, \boot.trap\ => \boot.trap\, hi2 => hi2, \-boot1\ => \-boot1\, \-boot2\ => \-boot2\, \-ldmode\ => \-ldmode\, ldmode => ldmode, mclk5 => mclk5, clk5 => clk5, \-busint.lm.reset\ => \-busint.lm.reset\, \-prog.reset\ => \-prog.reset\, spy6 => spy6, \-errhalt\ => \-errhalt\, errstop => errstop, \prog.boot\ => \prog.boot\, spy7 => spy7);

  i_clock1 : entity work.cadr_clock1 port map(\-clock reset b\ => \-clock reset b\, \-hang\ => \-hang\, cyclecompleted => cyclecompleted, \-tpr0\ => \-tpr0\, \-tpr40\ => \-tpr40\, \-tprend\ => \-tprend\, \-tpw20\ => \-tpw20\, \-tpw40\ => \-tpw40\, \-tpw50\ => \-tpw50\, \-tpw30\ => \-tpw30\, \-tpw10\ => \-tpw10\, \-tpw60\ => \-tpw60\, \-tpw70\ => \-tpw70\, \-tpw75\ => \-tpw75\, \-tpw65\ => \-tpw65\, \-tpw55\ => \-tpw55\, \-tpw30a\ => \-tpw30a\, \-tpw40a\ => \-tpw40a\, \-tpw45\ => \-tpw45\, \-tpw35\ => \-tpw35\, \-tpw25\ => \-tpw25\, \-tpr100\ => \-tpr100\, \-tpr140\ => \-tpr140\, \-tpr160\ => \-tpr160\, tprend => tprend, sspeed1 => sspeed1, sspeed0 => sspeed0, \-ilong\ => \-ilong\, \-tpr75\ => \-tpr75\, \-tpr115\ => \-tpr115\, \-tpr85\ => \-tpr85\, \-tpr125\ => \-tpr125\, \-tpr10\ => \-tpr10\, \-tpr20a\ => \-tpr20a\, \-tpr25\ => \-tpr25\, \-tpr15\ => \-tpr15\, \-tpr5\ => \-tpr5\, \-tpr80\ => \-tpr80\, \-tpr60\ => \-tpr60\, \-tpr20\ => \-tpr20\, \-tpr180\ => \-tpr180\, \-tpr200\ => \-tpr200\, \-tpr120\ => \-tpr120\, \-tpr110\ => \-tpr110\, \-tpr120a\ => \-tpr120a\, \-tpr105\ => \-tpr105\, \-tpr70\ => \-tpr70\, \-tpr80a\ => \-tpr80a\, \-tpr65\ => \-tpr65\);

  i_clock2 : entity work.cadr_clock2 port map(clk4 => clk4, \-clk0\ => \-clk0\, mclk7 => mclk7, \-mclk0\ => \-mclk0\, \-wp1\ => \-wp1\, tpwp => tpwp, \-wp2\ => \-wp2\, \-wp3\ => \-wp3\, \-wp4\ => \-wp4\, \-tprend\ => \-tprend\, tpclk => tpclk, \-tptse\ => \-tptse\, \-tpr25\ => \-tpr25\, \-clock reset b\ => \-clock reset b\, tptse => tptse, \-tpw70\ => \-tpw70\, \-tpclk\ => \-tpclk\, \-tpr0\ => \-tpr0\, \-tpr5\ => \-tpr5\, \-tpw30\ => \-tpw30\, tpwpiram => tpwpiram, \-wp5\ => \-wp5\, clk5 => clk5, mclk5 => mclk5, \-tpw45\ => \-tpw45\, \-tse1\ => \-tse1\, \-tse2\ => \-tse2\, \-tse3\ => \-tse3\, \-tse4\ => \-tse4\, clk1 => clk1, clk2 => clk2, clk3 => clk3, mclk1 => mclk1, machrun => machrun, \-machruna\ => \-machruna\, hi1 => hi1);

  i_clockd : cadr_clockd port map(\-clk1\ => \-clk1\, hi12 => hi12, clk1a => clk1a, reset => reset, \-reset\ => \-reset\, mclk1a => mclk1a, \-mclk1\ => \-mclk1\, mclk1 => mclk1, clk1 => clk1, \-wp1\ => \-wp1\, wp1b => wp1b, wp1a => wp1a, tse1b => tse1b, \-tse1\ => \-tse1\, tse1a => tse1a, hi1 => hi1, hi2 => hi2, hi3 => hi3, hi4 => hi4, hi5 => hi5, hi6 => hi6, hi7 => hi7, \-upperhighok\ => \-upperhighok\, hi8 => hi8, hi9 => hi9, hi10 => hi10, hi11 => hi11, lcry3 => lcry3, \-lcry3\ => \-lcry3\, clk2 => clk2, \-clk2c\ => \-clk2c\, \-clk2a\ => \-clk2a\, wp2 => wp2, \-wp2\ => \-wp2\, tse2 => tse2, \-tse2\ => \-tse2\, clk2a => clk2a, clk2b => clk2b, clk2c => clk2c, \-clk3a\ => \-clk3a\, clk3a => clk3a, clk3b => clk3b, clk3c => clk3c, clk3 => clk3, \-clk3g\ => \-clk3g\, \-clk3d\ => \-clk3d\, wp3a => wp3a, \-wp3\ => \-wp3\, tse3a => tse3a, \-tse3\ => \-tse3\, clk3d => clk3d, clk3e => clk3e, clk3f => clk3f, \-clk4a\ => \-clk4a\, clk4a => clk4a, clk4b => clk4b, clk4c => clk4c, clk4 => clk4, \-clk4e\ => \-clk4e\, \-clk4d\ => \-clk4d\, wp4c => wp4c, \-wp4\ => \-wp4\, wp4b => wp4b, wp4a => wp4a, clk4d => clk4d, clk4e => clk4e, clk4f => clk4f, \-tse4\ => \-tse4\, tse4b => tse4b, tse4a => tse4a, srcpdlptr => srcpdlptr, \-srcpdlptr\ => \-srcpdlptr\, srcpdlidx => srcpdlidx, \-srcpdlidx\ => \-srcpdlidx\);

  i_olord1 : cadr_olord1 port map(\-clock reset a\ => \-clock reset a\, speed1a => speed1a, sspeed1 => sspeed1, speedclk => speedclk, sspeed0 => sspeed0, speed0a => speed0a, speed1 => speed1, speed0 => speed0, \-reset\ => \-reset\, spy0 => spy0, spy1 => spy1, spy2 => spy2, errstop => errstop, \-ldmode\ => \-ldmode\, stathenb => stathenb, spy3 => spy3, trapenb => trapenb, spy4 => spy4, spy5 => spy5, promdisable => promdisable, \-opcinh\ => \-opcinh\, opcinh => opcinh, \-ldopc\ => \-ldopc\, opcclk => opcclk, \-opcclk\ => \-opcclk\, \-lpc.hold\ => \-lpc.hold\, \lpc.hold\ => \lpc.hold\, ldstat => ldstat, \-ldstat\ => \-ldstat\, \-idebug\ => \-idebug\, idebug => idebug, \-ldclk\ => \-ldclk\, nop11 => nop11, \-nop11\ => \-nop11\, \-step\ => \-step\, step => step, promdisabled => promdisabled, sstep => sstep, ssdone => ssdone, mclk5a => mclk5a, srun => srun, run => run, \-boot\ => \-boot\, \-run\ => \-run\, \-ssdone\ => \-ssdone\, \-errhalt\ => \-errhalt\, \-wait\ => \-wait\, \-stathalt\ => \-stathalt\, machrun => machrun, \stat.ovf\ => \stat.ovf\, \-stc32\ => \-stc32\, \-tpr60\ => \-tpr60\, statstop => statstop, \-machruna\ => \-machruna\, \-machrun\ => \-machrun\);

  process
  begin

    \-boot\ <= '1';
    
    -- check 3 tpclk periods
    wait until rising_edge(\-tpclk\);
    wait until falling_edge(\-tpclk\);
    wait until rising_edge(\-tpclk\);
    wait until falling_edge(\-tpclk\);

    \-boot\ <= '0';
    wait for 20 ns;
    \-boot\ <= '1';

    -- check 3 tpclk periods
    wait until rising_edge(\-tpclk\);
    wait until falling_edge(\-tpclk\);
    wait until rising_edge(\-tpclk\);
    wait until falling_edge(\-tpclk\);
    wait until rising_edge(\-tpclk\);
    wait until falling_edge(\-tpclk\);
    wait until rising_edge(\-tpclk\);
    wait until falling_edge(\-tpclk\);

    std.env.finish;
  end process;

end architecture;
