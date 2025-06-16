-- The MIT CADR --- Clock generation testbench

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.icmem_book.cadr_olord2;
use work.icmem_book.cadr_clock1;
use work.icmem_book.cadr_clock2;
use work.cadr_book.cadr_clockd;
use work.icmem_book.cadr_olord1;
use work.cadr_book.cadr_trap;
use work.cadr_book.cadr_npc;
use work.set.prom;
use work.cadr_book.cadr_ireg;

entity pc0_tb is
end;

architecture structural of pc0_tb is  

  -- olord2 inputs
  signal \-boot1\            : std_logic := '1';  
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
  signal \-ldmode\           : std_logic := '1';

  -- Bus for spy signals
  signal SPY                 : std_logic_vector(7 downto 0) := (others => '0');

  -- olord2 outputs
  signal \-ape\              : std_logic;
  signal \-boot\             : std_logic;  
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
  signal hi1                 : std_logic;
  signal hi2                 : std_logic;
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
  signal sspeed1    : std_logic;
  signal sspeed0    : std_logic;
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
  signal hi3            : std_logic := '1';
  signal hi4            : std_logic := '1';
  signal hi5            : std_logic := '1';
  signal hi6            : std_logic := '1';
  signal hi7            : std_logic := '1';
  signal hi8            : std_logic := '1';
  signal hi9            : std_logic := '1';
  signal hi10           : std_logic := '1';
  signal hi11           : std_logic := '1';
  signal hi12           : std_logic := '1';
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
  -- from spy (using spy_bus)

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

  -- trap inputs
  signal mdpar          : std_logic;
  signal mdhaspar       : std_logic;
  signal \use.md\       : std_logic;

  -- Bus for -md signals
  signal \-MD\           : std_logic_vector(31 downto 0);

  -- trap outputs
  signal mdparerr       : std_logic;
  signal mdpareven      : std_logic;
  signal mdparl         : std_logic;
  signal mdparm         : std_logic;
  signal mdparodd       : std_logic;
  signal \-parerr\      : std_logic;
  signal \-trap\        : std_logic;
  signal \-trapenb\     : std_logic;
  signal \-memparok\    : std_logic;
  signal trapb          : std_logic;
  signal trapa          : std_logic;

  -- npc inputs (using ir_bus for ir signals)
  signal pcs0           : std_logic := '0';
  signal pcs1           : std_logic := '0';
  signal spc1a          : std_logic := '0';
  signal dpc4           : std_logic := '0';

  -- npc outputs
  signal pccry3         : std_logic;
  signal pccry7         : std_logic;
  signal pccry11        : std_logic;

  -- Buses for npc signals
  signal IPC            : std_logic_vector(13 downto 0);
  signal DPC            : std_logic_vector(13 downto 0);
  signal SPC            : std_logic_vector(13 downto 0);
  signal NPC            : std_logic_vector(13 downto 0);

  -- prom outputs (now combined in cadr_prom)
  signal \-promenable\   : std_logic;
  signal i46             : std_logic;
  signal \-prompc9\      : std_logic;
  signal \bottom.1k\     : std_logic;
  signal tilt1           : std_logic;
  signal tilt0           : std_logic;
  signal promenable      : std_logic;
  signal dpe             : std_logic;
  signal ipe             : std_logic;

  -- prom inputs
  signal \-promdisabled\ : std_logic;
  signal \-iwriteda\     : std_logic := '1';

  -- Bus for all i signals (prom outputs)
  signal I               : std_logic_vector(48 downto 0);

  -- Buses for pc signals
  signal PC              : std_logic_vector(13 downto 0);

  -- Bus for ir signals (ireg outputs)
  signal IR              : std_logic_vector(48 downto 0);

  -- Bus for iob signals (ireg inputs)
  signal IOB             : std_logic_vector(47 downto 0);

  -- ireg inputs (destimod signals)
  signal \-destimod0\    : std_logic := '1';
  signal \-destimod1\    : std_logic := '1';

begin

  i_olord2 : cadr_olord2 port map(\-ape\ => \-ape\, \-mpe\ => \-mpe\, \-pdlpe\ => \-pdlpe\, \-dpe\ => \-dpe\, \-ipe\ => \-ipe\, \-spe\ => \-spe\, \-higherr\ => \-higherr\, err => err, \-mempe\ => \-mempe\, \-v0pe\ => \-v0pe\, \-v1pe\ => \-v1pe\, \-halted\ => \-halted\, hi1 => hi1, aparok => aparok, mmemparok => mmemparok, pdlparok => pdlparok, dparok => dparok, clk5a => clk5a, iparok => iparok, spcparok => spcparok, highok => highok, memparok => memparok, v0parok => v0parok, vmoparok => vmoparok, statstop => statstop, \stat.ovf\ => \stat.ovf\, \-halt\ => \-halt\, \-mclk5\ => \-mclk5\, mclk5a => mclk5a, \-clk5\ => \-clk5\, \-reset\ => \-reset\, reset => reset, \bus.power.reset l\ => \bus.power.reset l\, \power reset a\ => \power reset a\, \-upperhighok\ => \-upperhighok\, \-lowerhighok\ => \-lowerhighok\, \-boot\ => \-boot\, \prog.bus.reset\ => \prog.bus.reset\, \-bus.reset\ => \-bus.reset\, \-clock reset b\ => \-clock reset b\, \-clock reset a\ => \-clock reset a\, \-power reset\ => \-power reset\, srun => srun, \boot.trap\ => \boot.trap\, hi2 => hi2, \-boot1\ => \-boot1\, \-boot2\ => \-boot2\, \-ldmode\ => \-ldmode\, ldmode => ldmode, mclk5 => mclk5, clk5 => clk5, \-busint.lm.reset\ => \-busint.lm.reset\, \-prog.reset\ => \-prog.reset\, spy6 => SPY(6), \-errhalt\ => \-errhalt\, errstop => errstop, \prog.boot\ => \prog.boot\, spy7 => SPY(7));
  i_clock1 : entity work.cadr_clock1 port map(\-clock reset b\ => \-clock reset b\, \-hang\ => \-hang\, cyclecompleted => cyclecompleted, \-tpr0\ => \-tpr0\, \-tpr40\ => \-tpr40\, \-tprend\ => \-tprend\, \-tpw20\ => \-tpw20\, \-tpw40\ => \-tpw40\, \-tpw50\ => \-tpw50\, \-tpw30\ => \-tpw30\, \-tpw10\ => \-tpw10\, \-tpw60\ => \-tpw60\, \-tpw70\ => \-tpw70\, \-tpw75\ => \-tpw75\, \-tpw65\ => \-tpw65\, \-tpw55\ => \-tpw55\, \-tpw30a\ => \-tpw30a\, \-tpw40a\ => \-tpw40a\, \-tpw45\ => \-tpw45\, \-tpw35\ => \-tpw35\, \-tpw25\ => \-tpw25\, \-tpr100\ => \-tpr100\, \-tpr140\ => \-tpr140\, \-tpr160\ => \-tpr160\, tprend => tprend, sspeed1 => sspeed1, sspeed0 => sspeed0, \-ilong\ => \-ilong\, \-tpr75\ => \-tpr75\, \-tpr115\ => \-tpr115\, \-tpr85\ => \-tpr85\, \-tpr125\ => \-tpr125\, \-tpr10\ => \-tpr10\, \-tpr20a\ => \-tpr20a\, \-tpr25\ => \-tpr25\, \-tpr15\ => \-tpr15\, \-tpr5\ => \-tpr5\, \-tpr80\ => \-tpr80\, \-tpr60\ => \-tpr60\, \-tpr20\ => \-tpr20\, \-tpr180\ => \-tpr180\, \-tpr200\ => \-tpr200\, \-tpr120\ => \-tpr120\, \-tpr110\ => \-tpr110\, \-tpr120a\ => \-tpr120a\, \-tpr105\ => \-tpr105\, \-tpr70\ => \-tpr70\, \-tpr80a\ => \-tpr80a\, \-tpr65\ => \-tpr65\);
  i_clock2 : entity work.cadr_clock2 port map(clk4 => clk4, \-clk0\ => \-clk0\, mclk7 => mclk7, \-mclk0\ => \-mclk0\, \-wp1\ => \-wp1\, tpwp => tpwp, \-wp2\ => \-wp2\, \-wp3\ => \-wp3\, \-wp4\ => \-wp4\, \-tprend\ => \-tprend\, tpclk => tpclk, \-tptse\ => \-tptse\, \-tpr25\ => \-tpr25\, \-clock reset b\ => \-clock reset b\, tptse => tptse, \-tpw70\ => \-tpw70\, \-tpclk\ => \-tpclk\, \-tpr0\ => \-tpr0\, \-tpr5\ => \-tpr5\, \-tpw30\ => \-tpw30\, tpwpiram => tpwpiram, \-wp5\ => \-wp5\, clk5 => clk5, mclk5 => mclk5, \-tpw45\ => \-tpw45\, \-tse1\ => \-tse1\, \-tse2\ => \-tse2\, \-tse3\ => \-tse3\, \-tse4\ => \-tse4\, clk1 => clk1, clk2 => clk2, clk3 => clk3, mclk1 => mclk1, machrun => machrun, \-machruna\ => \-machruna\, hi1 => hi1);
  i_clockd : cadr_clockd port map(\-clk1\ => \-clk1\, hi12 => hi12, clk1a => clk1a, reset => reset, \-reset\ => \-reset\, mclk1a => mclk1a, \-mclk1\ => \-mclk1\, mclk1 => mclk1, clk1 => clk1, \-wp1\ => \-wp1\, wp1b => wp1b, wp1a => wp1a, tse1b => tse1b, \-tse1\ => \-tse1\, tse1a => tse1a, hi1 => hi1, hi2 => hi2, hi3 => hi3, hi4 => hi4, hi5 => hi5, hi6 => hi6, hi7 => hi7, \-upperhighok\ => \-upperhighok\, hi8 => hi8, hi9 => hi9, hi10 => hi10, hi11 => hi11, lcry3 => lcry3, \-lcry3\ => \-lcry3\, clk2 => clk2, \-clk2c\ => \-clk2c\, \-clk2a\ => \-clk2a\, wp2 => wp2, \-wp2\ => \-wp2\, tse2 => tse2, \-tse2\ => \-tse2\, clk2a => clk2a, clk2b => clk2b, clk2c => clk2c, \-clk3a\ => \-clk3a\, clk3a => clk3a, clk3b => clk3b, clk3c => clk3c, clk3 => clk3, \-clk3g\ => \-clk3g\, \-clk3d\ => \-clk3d\, wp3a => wp3a, \-wp3\ => \-wp3\, tse3a => tse3a, \-tse3\ => \-tse3\, clk3d => clk3d, clk3e => clk3e, clk3f => clk3f, \-clk4a\ => \-clk4a\, clk4a => clk4a, clk4b => clk4b, clk4c => clk4c, clk4 => clk4, \-clk4e\ => \-clk4e\, \-clk4d\ => \-clk4d\, wp4c => wp4c, \-wp4\ => \-wp4\, wp4b => wp4b, wp4a => wp4a, clk4d => clk4d, clk4e => clk4e, clk4f => clk4f, \-tse4\ => \-tse4\, tse4b => tse4b, tse4a => tse4a, srcpdlptr => srcpdlptr, \-srcpdlptr\ => \-srcpdlptr\, srcpdlidx => srcpdlidx, \-srcpdlidx\ => \-srcpdlidx\);
  i_olord1 : cadr_olord1 port map(\-clock reset a\ => \-clock reset a\, speed1a => speed1a, sspeed1 => sspeed1, speedclk => speedclk, sspeed0 => sspeed0, speed0a => speed0a, speed1 => speed1, speed0 => speed0, \-reset\ => \-reset\, spy0 => SPY(0), spy1 => SPY(1), spy2 => SPY(2), errstop => errstop, \-ldmode\ => \-ldmode\, stathenb => stathenb, spy3 => SPY(3), trapenb => trapenb, spy4 => SPY(4), spy5 => SPY(5), promdisable => promdisable, \-opcinh\ => \-opcinh\, opcinh => opcinh, \-ldopc\ => \-ldopc\, opcclk => opcclk, \-opcclk\ => \-opcclk\, \-lpc.hold\ => \-lpc.hold\, \lpc.hold\ => \lpc.hold\, ldstat => ldstat, \-ldstat\ => \-ldstat\, \-idebug\ => \-idebug\, idebug => idebug, \-ldclk\ => \-ldclk\, nop11 => nop11, \-nop11\ => \-nop11\, \-step\ => \-step\, step => step, promdisabled => promdisabled, sstep => sstep, ssdone => ssdone, mclk5a => mclk5a, srun => srun, run => run, \-boot\ => \-boot\, \-run\ => \-run\, \-ssdone\ => \-ssdone\, \-errhalt\ => \-errhalt\, \-wait\ => \-wait\, \-stathalt\ => \-stathalt\, machrun => machrun, \stat.ovf\ => \stat.ovf\, \-stc32\ => \-stc32\, \-tpr60\ => \-tpr60\, statstop => statstop, \-machruna\ => \-machruna\, \-machrun\ => \-machrun\);
  i_trap : cadr_trap port map(mdparerr => mdparerr, mdpareven => mdpareven, mdpar => mdpar, \-md5\ => \-MD\(5), \-md6\ => \-MD\(6), \-md7\ => \-MD\(7), \-md8\ => \-MD\(8), \-md9\ => \-MD\(9), \-md10\ => \-MD\(10), \-md11\ => \-MD\(11), mdparl => mdparl, \-md0\ => \-MD\(0), \-md1\ => \-MD\(1), \-md2\ => \-MD\(2), \-md3\ => \-MD\(3), \-md4\ => \-MD\(4), \-md17\ => \-MD\(17), \-md18\ => \-MD\(18), \-md19\ => \-MD\(19), \-md20\ => \-MD\(20), \-md21\ => \-MD\(21), \-md22\ => \-MD\(22), \-md23\ => \-MD\(23), mdparm => mdparm, \-md12\ => \-MD\(12), \-md13\ => \-MD\(13), \-md14\ => \-MD\(14), \-md15\ => \-MD\(15), \-md16\ => \-MD\(16), \-md29\ => \-MD\(29), \-md30\ => \-MD\(30), \-md31\ => \-MD\(31), mdparodd => mdparodd, \-md24\ => \-MD\(24), \-md25\ => \-MD\(25), \-md26\ => \-MD\(26), \-md27\ => \-MD\(27), \-md28\ => \-MD\(28), mdhaspar => mdhaspar, \use.md\ => \use.md\, \-wait\ => \-wait\, \-parerr\ => \-parerr\, \-trap\ => \-trap\, \boot.trap\ => \boot.trap\, \-trapenb\ => \-trapenb\, trapenb => trapenb, \-memparok\ => \-memparok\, trapb => trapb, trapa => trapa, memparok => memparok);
  i_npc : cadr_npc port map(ipc13 => IPC(13), pc13 => PC(13), ipc12 => IPC(12), pc12 => PC(12), pccry11 => pccry11, ipc9 => IPC(9), pc9 => PC(9), ipc8 => IPC(8), pc8 => PC(8), pccry7 => pccry7, ipc11 => IPC(11), pc11 => PC(11), ipc10 => IPC(10), pc10 => PC(10), ipc5 => IPC(5), pc5 => PC(5), ipc4 => IPC(4), pc4 => PC(4), pccry3 => pccry3, ipc7 => IPC(7), pc7 => PC(7), ipc6 => IPC(6), pc6 => PC(6), ipc1 => IPC(1), pc1 => PC(1), ipc0 => IPC(0), pc0 => PC(0), hi4 => hi4, ipc3 => IPC(3), pc3 => PC(3), ipc2 => IPC(2), pc2 => PC(2), trapb => trapb, pcs1 => pcs1, dpc3 => DPC(3), ir15 => IR(15), spc3 => SPC(3), npc3 => NPC(3), npc2 => NPC(2), spc2 => SPC(2), ir14 => IR(14), dpc2 => DPC(2), pcs0 => pcs0, dpc1 => DPC(1), ir13 => IR(13), spc1a => spc1a, npc1 => NPC(1), npc0 => NPC(0), spc0 => SPC(0), ir12 => IR(12), dpc0 => DPC(0), npc13 => NPC(13), npc12 => NPC(12), clk4b => clk4b, npc11 => NPC(11), npc10 => NPC(10), npc9 => NPC(9), npc8 => NPC(8), npc7 => NPC(7), npc6 => NPC(6), npc5 => NPC(5), npc4 => NPC(4), trapa => trapa, dpc13 => DPC(13), ir25 => IR(25), spc13 => SPC(13), spc12 => SPC(12), ir24 => IR(24), dpc12 => DPC(12), dpc11 => DPC(11), ir23 => IR(23), spc11 => SPC(11), spc10 => SPC(10), ir22 => IR(22), dpc10 => DPC(10), dpc9 => DPC(9), ir21 => IR(21), spc9 => SPC(9), spc8 => SPC(8), ir20 => IR(20), dpc8 => DPC(8), dpc7 => DPC(7), ir19 => IR(19), spc7 => SPC(7), spc6 => SPC(6), ir18 => IR(18), dpc6 => DPC(6), dpc5 => DPC(5), ir17 => IR(17), spc5 => SPC(5), spc4 => SPC(4), ir16 => IR(16), dpc4 => dpc4);

  i_prom : prom port map(
    hi2 => hi2, PC => PC,
    \-idebug\ => \-idebug\, \-promdisabled\ => \-promdisabled\, \-iwriteda\ => \-iwriteda\,
    \-ape\ => \-ape\, \-pdlpe\ => \-pdlpe\, \-spe\ => \-spe\, \-mpe\ => \-mpe\,
    \-mempe\ => \-mempe\, \-v1pe\ => \-v1pe\, \-v0pe\ => \-v0pe\,
    \-dpe\ => \-dpe\, \-ipe\ => \-ipe\,
    dpe => dpe, ipe => ipe, I => I
  );
  
  i_ireg : cadr_ireg port map(\-destimod0\ => \-destimod0\, ir15 => IR(15), iob15 => IOB(15), i15 => I(15), i14 => I(14), iob14 => IOB(14), ir14 => IR(14), clk3a => clk3a, ir13 => IR(13), iob13 => IOB(13), i13 => I(13), i12 => I(12), iob12 => IOB(12), ir12 => IR(12), ir11 => IR(11), iob11 => IOB(11), i11 => I(11), i10 => I(10), iob10 => IOB(10), ir10 => IR(10), ir9 => IR(9), iob9 => IOB(9), i9 => I(9), i8 => I(8), iob8 => IOB(8), ir8 => IR(8), ir7 => IR(7), iob7 => IOB(7), i7 => I(7), i6 => I(6), iob6 => IOB(6), ir6 => IR(6), ir5 => IR(5), iob5 => IOB(5), i5 => I(5), i4 => I(4), iob4 => IOB(4), ir4 => IR(4), ir3 => IR(3), iob3 => IOB(3), i3 => I(3), i2 => I(2), iob2 => IOB(2), ir2 => IR(2), ir1 => IR(1), iob1 => IOB(1), i1 => I(1), i0 => I(0), iob0 => IOB(0), ir0 => IR(0), ir23 => IR(23), iob23 => IOB(23), i23 => I(23), i22 => I(22), iob22 => IOB(22), ir22 => IR(22), clk3b => clk3b, ir21 => IR(21), iob21 => IOB(21), i21 => I(21), i20 => I(20), iob20 => IOB(20), ir20 => IR(20), ir19 => IR(19), iob19 => IOB(19), i19 => I(19), i18 => I(18), iob18 => IOB(18), ir18 => IR(18), ir17 => IR(17), iob17 => IOB(17), i17 => I(17), i16 => I(16), iob16 => IOB(16), ir16 => IR(16), \-destimod1\ => \-destimod1\, i48 => I(48), ir48 => IR(48), ir47 => IR(47), iob47 => IOB(47), i47 => I(47), i46 => i46, iob46 => IOB(46), ir46 => IR(46), ir45 => IR(45), iob45 => IOB(45), i45 => I(45), i44 => I(44), iob44 => IOB(44), ir44 => IR(44), ir43 => IR(43), iob43 => IOB(43), i43 => I(43), i42 => I(42), iob42 => IOB(42), ir42 => IR(42), ir41 => IR(41), iob41 => IOB(41), i41 => I(41), i40 => I(40), iob40 => IOB(40), ir40 => IR(40), ir39 => IR(39), iob39 => IOB(39), i39 => I(39), i38 => I(38), iob38 => IOB(38), ir38 => IR(38), ir37 => IR(37), iob37 => IOB(37), i37 => I(37), i36 => I(36), iob36 => IOB(36), ir36 => IR(36), ir35 => IR(35), iob35 => IOB(35), i35 => I(35), i34 => I(34), iob34 => IOB(34), ir34 => IR(34), ir33 => IR(33), iob33 => IOB(33), i33 => I(33), i32 => I(32), iob32 => IOB(32), ir32 => IR(32), ir31 => IR(31), iob31 => IOB(31), i31 => I(31), i30 => I(30), iob30 => IOB(30), ir30 => IR(30), ir29 => IR(29), iob29 => IOB(29), i29 => I(29), i28 => I(28), iob28 => IOB(28), ir28 => IR(28), ir27 => IR(27), iob27 => IOB(27), i27 => I(27), i26 => I(26), iob26 => IOB(26), ir26 => IR(26), ir25 => IR(25), iob25 => IOB(25), i25 => I(25), i24 => I(24), iob24 => IOB(24), ir24 => IR(24));

  \-promdisabled\ <= not promdisabled;

  -- Connect i46 to I bus
  I(46) <= i46;

  process
  begin 

    wait for 500 ns;

    \-boot1\ <= '0';
    wait for 5 ns;
    assert \-trap\ = '0' report "trap is not 0" severity error;
    assert trapa = '1' report "trapa is not 1" severity error;
    assert trapb = '1' report "trapb is not 1" severity error;
    wait for 5 ns;
    \-boot1\ <= '1';

    -- continue for 2 tpclk
    wait for 2000 ns;

    std.env.finish;
  end process;

end architecture;
