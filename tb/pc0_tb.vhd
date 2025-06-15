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
use work.icmem_book.cadr_pctl;
use work.icmem_book.cadr_prom0;
use work.icmem_book.cadr_prom1;
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
  signal spy6                : std_logic := '0';
  signal spy7                : std_logic := '0'; 
  signal \-ldmode\           : std_logic := '1';

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

  -- trap inputs
  signal mdpar          : std_logic;
  signal \-md0\         : std_logic;
  signal \-md1\         : std_logic;
  signal \-md2\         : std_logic;
  signal \-md3\         : std_logic;
  signal \-md4\         : std_logic;
  signal \-md5\         : std_logic;
  signal \-md6\         : std_logic;
  signal \-md7\         : std_logic;
  signal \-md8\         : std_logic;
  signal \-md9\         : std_logic;
  signal \-md10\        : std_logic;
  signal \-md11\        : std_logic;
  signal \-md12\        : std_logic;
  signal \-md13\        : std_logic;
  signal \-md14\        : std_logic;
  signal \-md15\        : std_logic;
  signal \-md16\        : std_logic;
  signal \-md17\        : std_logic;
  signal \-md18\        : std_logic;
  signal \-md19\        : std_logic;
  signal \-md20\        : std_logic;
  signal \-md21\        : std_logic;
  signal \-md22\        : std_logic;
  signal \-md23\        : std_logic;
  signal \-md24\        : std_logic;
  signal \-md25\        : std_logic;
  signal \-md26\        : std_logic;
  signal \-md27\        : std_logic;
  signal \-md28\        : std_logic;
  signal \-md29\        : std_logic;
  signal \-md30\        : std_logic;
  signal \-md31\        : std_logic;
  signal mdhaspar       : std_logic;
  signal \use.md\       : std_logic;

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

  -- npc inputs
  signal ir12           : std_logic := '0';
  signal ir13           : std_logic := '0';
  signal ir14           : std_logic := '0';
  signal ir15           : std_logic := '0';
  signal ir16           : std_logic := '0';
  signal ir17           : std_logic := '0';
  signal ir18           : std_logic := '0';
  signal ir19           : std_logic := '0';
  signal ir20           : std_logic := '0';
  signal ir21           : std_logic := '0';
  signal ir22           : std_logic := '0';
  signal ir23           : std_logic := '0';
  signal ir24           : std_logic := '0';
  signal ir25           : std_logic := '0';
  signal pcs0           : std_logic := '0';
  signal pcs1           : std_logic := '0';
  signal spc1a          : std_logic := '0';
  signal dpc4           : std_logic := '0';

  -- npc outputs
  signal ipc0           : std_logic;
  signal ipc1           : std_logic;
  signal ipc2           : std_logic;
  signal ipc3           : std_logic;
  signal ipc4           : std_logic;
  signal ipc5           : std_logic;
  signal ipc6           : std_logic;
  signal ipc7           : std_logic;
  signal ipc8           : std_logic;
  signal ipc9           : std_logic;
  signal ipc10          : std_logic;
  signal ipc11          : std_logic;
  signal ipc12          : std_logic;
  signal ipc13          : std_logic;
  signal pc0            : std_logic;
  signal pc1            : std_logic;
  signal pc2            : std_logic;
  signal pc3            : std_logic;
  signal pc4            : std_logic;
  signal pc5            : std_logic;
  signal pc6            : std_logic;
  signal pc7            : std_logic;
  signal pc8            : std_logic;
  signal pc9            : std_logic;
  signal pc10           : std_logic;
  signal pc11           : std_logic;
  signal pc12           : std_logic;
  signal pc13           : std_logic;
  signal pccry3         : std_logic;
  signal pccry7         : std_logic;
  signal pccry11        : std_logic;
  signal dpc0           : std_logic;
  signal dpc1           : std_logic;
  signal dpc2           : std_logic;
  signal dpc3           : std_logic;
  signal dpc5           : std_logic;
  signal dpc6           : std_logic;
  signal dpc7           : std_logic;
  signal dpc8           : std_logic;
  signal dpc9           : std_logic;
  signal dpc10          : std_logic;
  signal dpc11          : std_logic;
  signal dpc12          : std_logic;
  signal dpc13          : std_logic;
  signal spc0           : std_logic;
  signal spc1           : std_logic;
  signal spc2           : std_logic;
  signal spc3           : std_logic;
  signal spc4           : std_logic;
  signal spc5           : std_logic;
  signal spc6           : std_logic;
  signal spc7           : std_logic;
  signal spc8           : std_logic;
  signal spc9           : std_logic;
  signal spc10          : std_logic;
  signal spc11          : std_logic;
  signal spc12          : std_logic;
  signal spc13          : std_logic;
  signal npc0           : std_logic;
  signal npc1           : std_logic;
  signal npc2           : std_logic;
  signal npc3           : std_logic;
  signal npc4           : std_logic;
  signal npc5           : std_logic;
  signal npc6           : std_logic;
  signal npc7           : std_logic;
  signal npc8           : std_logic;
  signal npc9           : std_logic;
  signal npc10          : std_logic;
  signal npc11          : std_logic;
  signal npc12          : std_logic;
  signal npc13          : std_logic;

  -- pctl outputs
  signal \-promenable\   : std_logic;
  signal i46             : std_logic;
  signal \-prompc0\      : std_logic;
  signal \-prompc1\      : std_logic;
  signal \-prompc2\      : std_logic;
  signal \-prompc3\      : std_logic;
  signal \-prompc4\      : std_logic;
  signal \-promce0\      : std_logic;
  signal \-prompc9\      : std_logic;
  signal \-promce1\      : std_logic;
  signal \bottom.1k\     : std_logic;
  signal \-prompc5\      : std_logic;
  signal \-prompc6\      : std_logic;
  signal \-prompc7\      : std_logic;
  signal \-prompc8\      : std_logic;
  signal tilt1           : std_logic;
  signal tilt0           : std_logic;
  signal promenable      : std_logic;
  signal dpe             : std_logic;
  signal ipe             : std_logic;

  -- pctl inputs
  signal \-promdisabled\ : std_logic;
  signal \-iwriteda\     : std_logic := '1';

  -- prom0 and prom1 outputs (i signals)
  signal i0              : std_logic;
  signal i1              : std_logic;
  signal i2              : std_logic;
  signal i3              : std_logic;
  signal i4              : std_logic;
  signal i5              : std_logic;
  signal i6              : std_logic;
  signal i7              : std_logic;
  signal i8              : std_logic;
  signal i9              : std_logic;
  signal i10             : std_logic;
  signal i11             : std_logic;
  signal i12             : std_logic;
  signal i13             : std_logic;
  signal i14             : std_logic;
  signal i15             : std_logic;
  signal i16             : std_logic;
  signal i17             : std_logic;
  signal i18             : std_logic;
  signal i19             : std_logic;
  signal i20             : std_logic;
  signal i21             : std_logic;
  signal i22             : std_logic;
  signal i23             : std_logic;
  signal i24             : std_logic;
  signal i25             : std_logic;
  signal i26             : std_logic;
  signal i27             : std_logic;
  signal i28             : std_logic;
  signal i29             : std_logic;
  signal i30             : std_logic;
  signal i31             : std_logic;
  signal i32             : std_logic;
  signal i33             : std_logic;
  signal i34             : std_logic;
  signal i35             : std_logic;
  signal i36             : std_logic;
  signal i37             : std_logic;
  signal i38             : std_logic;
  signal i39             : std_logic;
  signal i40             : std_logic;
  signal i41             : std_logic;
  signal i42             : std_logic;
  signal i43             : std_logic;
  signal i44             : std_logic;
  signal i45             : std_logic;
  signal i47             : std_logic;
  signal i48             : std_logic;

  -- Bus for monitoring all i signals
  signal i_bus           : std_logic_vector(48 downto 0);

  -- Buses for monitoring pc and prompc signals
  signal pc_bus          : std_logic_vector(13 downto 0);
  signal \-prompc_bus\   : std_logic_vector(9 downto 0);

  -- Bus for monitoring ir signals
  signal ir_bus          : std_logic_vector(48 downto 0);

  -- Bus for monitoring iob signals
  signal iob_bus         : std_logic_vector(47 downto 0);

  -- ireg outputs (ir signals)
  signal ir0             : std_logic;
  signal ir1             : std_logic;
  signal ir2             : std_logic;
  signal ir3             : std_logic;
  signal ir4             : std_logic;
  signal ir5             : std_logic;
  signal ir6             : std_logic;
  signal ir7             : std_logic;
  signal ir8             : std_logic;
  signal ir9             : std_logic;
  signal ir10            : std_logic;
  signal ir11            : std_logic;
  signal ir26            : std_logic;
  signal ir27            : std_logic;
  signal ir28            : std_logic;
  signal ir29            : std_logic;
  signal ir30            : std_logic;
  signal ir31            : std_logic;
  signal ir32            : std_logic;
  signal ir33            : std_logic;
  signal ir34            : std_logic;
  signal ir35            : std_logic;
  signal ir36            : std_logic;
  signal ir37            : std_logic;
  signal ir38            : std_logic;
  signal ir39            : std_logic;
  signal ir40            : std_logic;
  signal ir41            : std_logic;
  signal ir42            : std_logic;
  signal ir43            : std_logic;
  signal ir44            : std_logic;
  signal ir45            : std_logic;
  signal ir46            : std_logic;
  signal ir47            : std_logic;
  signal ir48            : std_logic;

  -- ireg inputs (iob signals)
  signal iob0            : std_logic;
  signal iob1            : std_logic;
  signal iob2            : std_logic;
  signal iob3            : std_logic;
  signal iob4            : std_logic;
  signal iob5            : std_logic;
  signal iob6            : std_logic;
  signal iob7            : std_logic;
  signal iob8            : std_logic;
  signal iob9            : std_logic;
  signal iob10           : std_logic;
  signal iob11           : std_logic;
  signal iob12           : std_logic;
  signal iob13           : std_logic;
  signal iob14           : std_logic;
  signal iob15           : std_logic;
  signal iob16           : std_logic;
  signal iob17           : std_logic;
  signal iob18           : std_logic;
  signal iob19           : std_logic;
  signal iob20           : std_logic;
  signal iob21           : std_logic;
  signal iob22           : std_logic;
  signal iob23           : std_logic;
  signal iob24           : std_logic;
  signal iob25           : std_logic;
  signal iob26           : std_logic;
  signal iob27           : std_logic;
  signal iob28           : std_logic;
  signal iob29           : std_logic;
  signal iob30           : std_logic;
  signal iob31           : std_logic;
  signal iob32           : std_logic;
  signal iob33           : std_logic;
  signal iob34           : std_logic;
  signal iob35           : std_logic;
  signal iob36           : std_logic;
  signal iob37           : std_logic;
  signal iob38           : std_logic;
  signal iob39           : std_logic;
  signal iob40           : std_logic;
  signal iob41           : std_logic;
  signal iob42           : std_logic;
  signal iob43           : std_logic;
  signal iob44           : std_logic;
  signal iob45           : std_logic;
  signal iob46           : std_logic;
  signal iob47           : std_logic;

  -- ireg inputs (destimod signals)
  signal \-destimod0\    : std_logic := '1';
  signal \-destimod1\    : std_logic := '1';

begin

  i_olord2 : cadr_olord2 port map(\-ape\ => \-ape\, \-mpe\ => \-mpe\, \-pdlpe\ => \-pdlpe\, \-dpe\ => \-dpe\, \-ipe\ => \-ipe\, \-spe\ => \-spe\, \-higherr\ => \-higherr\, err => err, \-mempe\ => \-mempe\, \-v0pe\ => \-v0pe\, \-v1pe\ => \-v1pe\, \-halted\ => \-halted\, hi1 => hi1, aparok => aparok, mmemparok => mmemparok, pdlparok => pdlparok, dparok => dparok, clk5a => clk5a, iparok => iparok, spcparok => spcparok, highok => highok, memparok => memparok, v0parok => v0parok, vmoparok => vmoparok, statstop => statstop, \stat.ovf\ => \stat.ovf\, \-halt\ => \-halt\, \-mclk5\ => \-mclk5\, mclk5a => mclk5a, \-clk5\ => \-clk5\, \-reset\ => \-reset\, reset => reset, \bus.power.reset l\ => \bus.power.reset l\, \power reset a\ => \power reset a\, \-upperhighok\ => \-upperhighok\, \-lowerhighok\ => \-lowerhighok\, \-boot\ => \-boot\, \prog.bus.reset\ => \prog.bus.reset\, \-bus.reset\ => \-bus.reset\, \-clock reset b\ => \-clock reset b\, \-clock reset a\ => \-clock reset a\, \-power reset\ => \-power reset\, srun => srun, \boot.trap\ => \boot.trap\, hi2 => hi2, \-boot1\ => \-boot1\, \-boot2\ => \-boot2\, \-ldmode\ => \-ldmode\, ldmode => ldmode, mclk5 => mclk5, clk5 => clk5, \-busint.lm.reset\ => \-busint.lm.reset\, \-prog.reset\ => \-prog.reset\, spy6 => spy6, \-errhalt\ => \-errhalt\, errstop => errstop, \prog.boot\ => \prog.boot\, spy7 => spy7);
  i_clock1 : entity work.cadr_clock1 port map(\-clock reset b\ => \-clock reset b\, \-hang\ => \-hang\, cyclecompleted => cyclecompleted, \-tpr0\ => \-tpr0\, \-tpr40\ => \-tpr40\, \-tprend\ => \-tprend\, \-tpw20\ => \-tpw20\, \-tpw40\ => \-tpw40\, \-tpw50\ => \-tpw50\, \-tpw30\ => \-tpw30\, \-tpw10\ => \-tpw10\, \-tpw60\ => \-tpw60\, \-tpw70\ => \-tpw70\, \-tpw75\ => \-tpw75\, \-tpw65\ => \-tpw65\, \-tpw55\ => \-tpw55\, \-tpw30a\ => \-tpw30a\, \-tpw40a\ => \-tpw40a\, \-tpw45\ => \-tpw45\, \-tpw35\ => \-tpw35\, \-tpw25\ => \-tpw25\, \-tpr100\ => \-tpr100\, \-tpr140\ => \-tpr140\, \-tpr160\ => \-tpr160\, tprend => tprend, sspeed1 => sspeed1, sspeed0 => sspeed0, \-ilong\ => \-ilong\, \-tpr75\ => \-tpr75\, \-tpr115\ => \-tpr115\, \-tpr85\ => \-tpr85\, \-tpr125\ => \-tpr125\, \-tpr10\ => \-tpr10\, \-tpr20a\ => \-tpr20a\, \-tpr25\ => \-tpr25\, \-tpr15\ => \-tpr15\, \-tpr5\ => \-tpr5\, \-tpr80\ => \-tpr80\, \-tpr60\ => \-tpr60\, \-tpr20\ => \-tpr20\, \-tpr180\ => \-tpr180\, \-tpr200\ => \-tpr200\, \-tpr120\ => \-tpr120\, \-tpr110\ => \-tpr110\, \-tpr120a\ => \-tpr120a\, \-tpr105\ => \-tpr105\, \-tpr70\ => \-tpr70\, \-tpr80a\ => \-tpr80a\, \-tpr65\ => \-tpr65\);
  i_clock2 : entity work.cadr_clock2 port map(clk4 => clk4, \-clk0\ => \-clk0\, mclk7 => mclk7, \-mclk0\ => \-mclk0\, \-wp1\ => \-wp1\, tpwp => tpwp, \-wp2\ => \-wp2\, \-wp3\ => \-wp3\, \-wp4\ => \-wp4\, \-tprend\ => \-tprend\, tpclk => tpclk, \-tptse\ => \-tptse\, \-tpr25\ => \-tpr25\, \-clock reset b\ => \-clock reset b\, tptse => tptse, \-tpw70\ => \-tpw70\, \-tpclk\ => \-tpclk\, \-tpr0\ => \-tpr0\, \-tpr5\ => \-tpr5\, \-tpw30\ => \-tpw30\, tpwpiram => tpwpiram, \-wp5\ => \-wp5\, clk5 => clk5, mclk5 => mclk5, \-tpw45\ => \-tpw45\, \-tse1\ => \-tse1\, \-tse2\ => \-tse2\, \-tse3\ => \-tse3\, \-tse4\ => \-tse4\, clk1 => clk1, clk2 => clk2, clk3 => clk3, mclk1 => mclk1, machrun => machrun, \-machruna\ => \-machruna\, hi1 => hi1);
  i_clockd : cadr_clockd port map(\-clk1\ => \-clk1\, hi12 => hi12, clk1a => clk1a, reset => reset, \-reset\ => \-reset\, mclk1a => mclk1a, \-mclk1\ => \-mclk1\, mclk1 => mclk1, clk1 => clk1, \-wp1\ => \-wp1\, wp1b => wp1b, wp1a => wp1a, tse1b => tse1b, \-tse1\ => \-tse1\, tse1a => tse1a, hi1 => hi1, hi2 => hi2, hi3 => hi3, hi4 => hi4, hi5 => hi5, hi6 => hi6, hi7 => hi7, \-upperhighok\ => \-upperhighok\, hi8 => hi8, hi9 => hi9, hi10 => hi10, hi11 => hi11, lcry3 => lcry3, \-lcry3\ => \-lcry3\, clk2 => clk2, \-clk2c\ => \-clk2c\, \-clk2a\ => \-clk2a\, wp2 => wp2, \-wp2\ => \-wp2\, tse2 => tse2, \-tse2\ => \-tse2\, clk2a => clk2a, clk2b => clk2b, clk2c => clk2c, \-clk3a\ => \-clk3a\, clk3a => clk3a, clk3b => clk3b, clk3c => clk3c, clk3 => clk3, \-clk3g\ => \-clk3g\, \-clk3d\ => \-clk3d\, wp3a => wp3a, \-wp3\ => \-wp3\, tse3a => tse3a, \-tse3\ => \-tse3\, clk3d => clk3d, clk3e => clk3e, clk3f => clk3f, \-clk4a\ => \-clk4a\, clk4a => clk4a, clk4b => clk4b, clk4c => clk4c, clk4 => clk4, \-clk4e\ => \-clk4e\, \-clk4d\ => \-clk4d\, wp4c => wp4c, \-wp4\ => \-wp4\, wp4b => wp4b, wp4a => wp4a, clk4d => clk4d, clk4e => clk4e, clk4f => clk4f, \-tse4\ => \-tse4\, tse4b => tse4b, tse4a => tse4a, srcpdlptr => srcpdlptr, \-srcpdlptr\ => \-srcpdlptr\, srcpdlidx => srcpdlidx, \-srcpdlidx\ => \-srcpdlidx\);
  i_olord1 : cadr_olord1 port map(\-clock reset a\ => \-clock reset a\, speed1a => speed1a, sspeed1 => sspeed1, speedclk => speedclk, sspeed0 => sspeed0, speed0a => speed0a, speed1 => speed1, speed0 => speed0, \-reset\ => \-reset\, spy0 => spy0, spy1 => spy1, spy2 => spy2, errstop => errstop, \-ldmode\ => \-ldmode\, stathenb => stathenb, spy3 => spy3, trapenb => trapenb, spy4 => spy4, spy5 => spy5, promdisable => promdisable, \-opcinh\ => \-opcinh\, opcinh => opcinh, \-ldopc\ => \-ldopc\, opcclk => opcclk, \-opcclk\ => \-opcclk\, \-lpc.hold\ => \-lpc.hold\, \lpc.hold\ => \lpc.hold\, ldstat => ldstat, \-ldstat\ => \-ldstat\, \-idebug\ => \-idebug\, idebug => idebug, \-ldclk\ => \-ldclk\, nop11 => nop11, \-nop11\ => \-nop11\, \-step\ => \-step\, step => step, promdisabled => promdisabled, sstep => sstep, ssdone => ssdone, mclk5a => mclk5a, srun => srun, run => run, \-boot\ => \-boot\, \-run\ => \-run\, \-ssdone\ => \-ssdone\, \-errhalt\ => \-errhalt\, \-wait\ => \-wait\, \-stathalt\ => \-stathalt\, machrun => machrun, \stat.ovf\ => \stat.ovf\, \-stc32\ => \-stc32\, \-tpr60\ => \-tpr60\, statstop => statstop, \-machruna\ => \-machruna\, \-machrun\ => \-machrun\);
  i_trap : cadr_trap port map(mdparerr => mdparerr, mdpareven => mdpareven, mdpar => mdpar, \-md5\ => \-md5\, \-md6\ => \-md6\, \-md7\ => \-md7\, \-md8\ => \-md8\, \-md9\ => \-md9\, \-md10\ => \-md10\, \-md11\ => \-md11\, mdparl => mdparl, \-md0\ => \-md0\, \-md1\ => \-md1\, \-md2\ => \-md2\, \-md3\ => \-md3\, \-md4\ => \-md4\, \-md17\ => \-md17\, \-md18\ => \-md18\, \-md19\ => \-md19\, \-md20\ => \-md20\, \-md21\ => \-md21\, \-md22\ => \-md22\, \-md23\ => \-md23\, mdparm => mdparm, \-md12\ => \-md12\, \-md13\ => \-md13\, \-md14\ => \-md14\, \-md15\ => \-md15\, \-md16\ => \-md16\, \-md29\ => \-md29\, \-md30\ => \-md30\, \-md31\ => \-md31\, mdparodd => mdparodd, \-md24\ => \-md24\, \-md25\ => \-md25\, \-md26\ => \-md26\, \-md27\ => \-md27\, \-md28\ => \-md28\, mdhaspar => mdhaspar, \use.md\ => \use.md\, \-wait\ => \-wait\, \-parerr\ => \-parerr\, \-trap\ => \-trap\, \boot.trap\ => \boot.trap\, \-trapenb\ => \-trapenb\, trapenb => trapenb, \-memparok\ => \-memparok\, trapb => trapb, trapa => trapa, memparok => memparok);
  i_npc : cadr_npc port map(ipc13 => ipc13, pc13 => pc13, ipc12 => ipc12, pc12 => pc12, pccry11 => pccry11, ipc9 => ipc9, pc9 => pc9, ipc8 => ipc8, pc8 => pc8, pccry7 => pccry7, ipc11 => ipc11, pc11 => pc11, ipc10 => ipc10, pc10 => pc10, ipc5 => ipc5, pc5 => pc5, ipc4 => ipc4, pc4 => pc4, pccry3 => pccry3, ipc7 => ipc7, pc7 => pc7, ipc6 => ipc6, pc6 => pc6, ipc1 => ipc1, pc1 => pc1, ipc0 => ipc0, pc0 => pc0, hi4 => hi4, ipc3 => ipc3, pc3 => pc3, ipc2 => ipc2, pc2 => pc2, trapb => trapb, pcs1 => pcs1, dpc3 => dpc3, ir15 => ir15, spc3 => spc3, npc3 => npc3, npc2 => npc2, spc2 => spc2, ir14 => ir14, dpc2 => dpc2, pcs0 => pcs0, dpc1 => dpc1, ir13 => ir13, spc1a => spc1a, npc1 => npc1, npc0 => npc0, spc0 => spc0, ir12 => ir12, dpc0 => dpc0, npc13 => npc13, npc12 => npc12, clk4b => clk4b, npc11 => npc11, npc10 => npc10, npc9 => npc9, npc8 => npc8, npc7 => npc7, npc6 => npc6, npc5 => npc5, npc4 => npc4, trapa => trapa, dpc13 => dpc13, ir25 => ir25, spc13 => spc13, spc12 => spc12, ir24 => ir24, dpc12 => dpc12, dpc11 => dpc11, ir23 => ir23, spc11 => spc11, spc10 => spc10, ir22 => ir22, dpc10 => dpc10, dpc9 => dpc9, ir21 => ir21, spc9 => spc9, spc8 => spc8, ir20 => ir20, dpc8 => dpc8, dpc7 => dpc7, ir19 => ir19, spc7 => spc7, spc6 => spc6, ir18 => ir18, dpc6 => dpc6, dpc5 => dpc5, ir17 => ir17, spc5 => spc5, spc4 => spc4, ir16 => ir16, dpc4 => dpc4);

  i_pctl : cadr_pctl port map(\-promenable\ => \-promenable\, i46 => i46, hi2 => hi2, pc0 => pc0, \-prompc0\ => \-prompc0\, pc1 => pc1, \-prompc1\ => \-prompc1\, pc2 => pc2, \-prompc2\ => \-prompc2\, \-prompc3\ => \-prompc3\, pc3 => pc3, \-prompc4\ => \-prompc4\, pc4 => pc4, pc9 => pc9, \-promce0\ => \-promce0\, \-prompc9\ => \-prompc9\, \-promce1\ => \-promce1\, \bottom.1k\ => \bottom.1k\, \-idebug\ => \-idebug\, \-promdisabled\ => \-promdisabled\, \-iwriteda\ => \-iwriteda\, pc13 => pc13, pc12 => pc12, pc11 => pc11, pc10 => pc10, pc5 => pc5, \-prompc5\ => \-prompc5\, pc6 => pc6, \-prompc6\ => \-prompc6\, pc7 => pc7, \-prompc7\ => \-prompc7\, \-prompc8\ => \-prompc8\, pc8 => pc8, \-ape\ => \-ape\, \-pdlpe\ => \-pdlpe\, \-spe\ => \-spe\, \-mpe\ => \-mpe\, tilt1 => tilt1, tilt0 => tilt0, \-mempe\ => \-mempe\, \-v1pe\ => \-v1pe\, \-v0pe\ => \-v0pe\, promenable => promenable, dpe => dpe, \-dpe\ => \-dpe\, ipe => ipe, \-ipe\ => \-ipe\);
  i_prom0 : cadr_prom0 port map(\-prompc0\ => \-prompc0\, \-prompc1\ => \-prompc1\, \-prompc2\ => \-prompc2\, \-prompc3\ => \-prompc3\, \-prompc4\ => \-prompc4\, i32 => i32, i33 => i33, i34 => i34, i35 => i35, i36 => i36, i37 => i37, i38 => i38, i39 => i39, \-promce0\ => \-promce0\, \-prompc5\ => \-prompc5\, \-prompc6\ => \-prompc6\, \-prompc7\ => \-prompc7\, \-prompc8\ => \-prompc8\, i40 => i40, i41 => i41, i42 => i42, i43 => i43, i44 => i44, i45 => i45, i47 => i47, i48 => i48, i24 => i24, i25 => i25, i26 => i26, i27 => i27, i28 => i28, i29 => i29, i30 => i30, i31 => i31, i16 => i16, i17 => i17, i18 => i18, i19 => i19, i20 => i20, i21 => i21, i22 => i22, i23 => i23, i0 => i0, i1 => i1, i2 => i2, i3 => i3, i4 => i4, i5 => i5, i6 => i6, i7 => i7, i8 => i8, i9 => i9, i10 => i10, i11 => i11, i12 => i12, i13 => i13, i14 => i14, i15 => i15);
  i_prom1 : cadr_prom1 port map(\-prompc0\ => \-prompc0\, \-prompc1\ => \-prompc1\, \-prompc2\ => \-prompc2\, \-prompc3\ => \-prompc3\, \-prompc4\ => \-prompc4\, i24 => i24, i25 => i25, i26 => i26, i27 => i27, i28 => i28, i29 => i29, i30 => i30, i31 => i31, \-promce1\ => \-promce1\, \-prompc5\ => \-prompc5\, \-prompc6\ => \-prompc6\, \-prompc7\ => \-prompc7\, \-prompc8\ => \-prompc8\, i32 => i32, i33 => i33, i34 => i34, i35 => i35, i36 => i36, i37 => i37, i38 => i38, i39 => i39, i40 => i40, i41 => i41, i42 => i42, i43 => i43, i44 => i44, i45 => i45, i47 => i47, i48 => i48, i16 => i16, i17 => i17, i18 => i18, i19 => i19, i20 => i20, i21 => i21, i22 => i22, i23 => i23, i0 => i0, i1 => i1, i2 => i2, i3 => i3, i4 => i4, i5 => i5, i6 => i6, i7 => i7, i8 => i8, i9 => i9, i10 => i10, i11 => i11, i12 => i12, i13 => i13, i14 => i14, i15 => i15);
  i_ireg : cadr_ireg port map(\-destimod0\ => \-destimod0\, ir15 => ir15, iob15 => iob15, i15 => i15, i14 => i14, iob14 => iob14, ir14 => ir14, clk3a => clk3a, ir13 => ir13, iob13 => iob13, i13 => i13, i12 => i12, iob12 => iob12, ir12 => ir12, ir11 => ir11, iob11 => iob11, i11 => i11, i10 => i10, iob10 => iob10, ir10 => ir10, ir9 => ir9, iob9 => iob9, i9 => i9, i8 => i8, iob8 => iob8, ir8 => ir8, ir7 => ir7, iob7 => iob7, i7 => i7, i6 => i6, iob6 => iob6, ir6 => ir6, ir5 => ir5, iob5 => iob5, i5 => i5, i4 => i4, iob4 => iob4, ir4 => ir4, ir3 => ir3, iob3 => iob3, i3 => i3, i2 => i2, iob2 => iob2, ir2 => ir2, ir1 => ir1, iob1 => iob1, i1 => i1, i0 => i0, iob0 => iob0, ir0 => ir0, ir23 => ir23, iob23 => iob23, i23 => i23, i22 => i22, iob22 => iob22, ir22 => ir22, clk3b => clk3b, ir21 => ir21, iob21 => iob21, i21 => i21, i20 => i20, iob20 => iob20, ir20 => ir20, ir19 => ir19, iob19 => iob19, i19 => i19, i18 => i18, iob18 => iob18, ir18 => ir18, ir17 => ir17, iob17 => iob17, i17 => i17, i16 => i16, iob16 => iob16, ir16 => ir16, \-destimod1\ => \-destimod1\, i48 => i48, ir48 => ir48, ir47 => ir47, iob47 => iob47, i47 => i47, i46 => i46, iob46 => iob46, ir46 => ir46, ir45 => ir45, iob45 => iob45, i45 => i45, i44 => i44, iob44 => iob44, ir44 => ir44, ir43 => ir43, iob43 => iob43, i43 => i43, i42 => i42, iob42 => iob42, ir42 => ir42, ir41 => ir41, iob41 => iob41, i41 => i41, i40 => i40, iob40 => iob40, ir40 => ir40, ir39 => ir39, iob39 => iob39, i39 => i39, i38 => i38, iob38 => iob38, ir38 => ir38, ir37 => ir37, iob37 => iob37, i37 => i37, i36 => i36, iob36 => iob36, ir36 => ir36, ir35 => ir35, iob35 => iob35, i35 => i35, i34 => i34, iob34 => iob34, ir34 => ir34, ir33 => ir33, iob33 => iob33, i33 => i33, i32 => i32, iob32 => iob32, ir32 => ir32, ir31 => ir31, iob31 => iob31, i31 => i31, i30 => i30, iob30 => iob30, ir30 => ir30, ir29 => ir29, iob29 => iob29, i29 => i29, i28 => i28, iob28 => iob28, ir28 => ir28, ir27 => ir27, iob27 => iob27, i27 => i27, i26 => i26, iob26 => iob26, ir26 => ir26, ir25 => ir25, iob25 => iob25, i25 => i25, i24 => i24, iob24 => iob24, ir24 => ir24);

  \-promdisabled\ <= not promdisabled;

  -- Assign all i signals to the bus for easy monitoring
  i_bus(0)  <= i0;
  i_bus(1)  <= i1;
  i_bus(2)  <= i2;
  i_bus(3)  <= i3;
  i_bus(4)  <= i4;
  i_bus(5)  <= i5;
  i_bus(6)  <= i6;
  i_bus(7)  <= i7;
  i_bus(8)  <= i8;
  i_bus(9)  <= i9;
  i_bus(10) <= i10;
  i_bus(11) <= i11;
  i_bus(12) <= i12;
  i_bus(13) <= i13;
  i_bus(14) <= i14;
  i_bus(15) <= i15;
  i_bus(16) <= i16;
  i_bus(17) <= i17;
  i_bus(18) <= i18;
  i_bus(19) <= i19;
  i_bus(20) <= i20;
  i_bus(21) <= i21;
  i_bus(22) <= i22;
  i_bus(23) <= i23;
  i_bus(24) <= i24;
  i_bus(25) <= i25;
  i_bus(26) <= i26;
  i_bus(27) <= i27;
  i_bus(28) <= i28;
  i_bus(29) <= i29;
  i_bus(30) <= i30;
  i_bus(31) <= i31;
  i_bus(32) <= i32;
  i_bus(33) <= i33;
  i_bus(34) <= i34;
  i_bus(35) <= i35;
  i_bus(36) <= i36;
  i_bus(37) <= i37;
  i_bus(38) <= i38;
  i_bus(39) <= i39;
  i_bus(40) <= i40;
  i_bus(41) <= i41;
  i_bus(42) <= i42;
  i_bus(43) <= i43;
  i_bus(44) <= i44;
  i_bus(45) <= i45;
  i_bus(46) <= i46;
  i_bus(47) <= i47;
  i_bus(48) <= i48;

  -- Assign pc and prompc signals to buses for easy monitoring
  pc_bus(0)  <= pc0;
  pc_bus(1)  <= pc1;
  pc_bus(2)  <= pc2;
  pc_bus(3)  <= pc3;
  pc_bus(4)  <= pc4;
  pc_bus(5)  <= pc5;
  pc_bus(6)  <= pc6;
  pc_bus(7)  <= pc7;
  pc_bus(8)  <= pc8;
  pc_bus(9)  <= pc9;
  pc_bus(10) <= pc10;
  pc_bus(11) <= pc11;
  pc_bus(12) <= pc12;
  pc_bus(13) <= pc13;

  \-prompc_bus\(0) <= \-prompc0\;
  \-prompc_bus\(1) <= \-prompc1\;
  \-prompc_bus\(2) <= \-prompc2\;
  \-prompc_bus\(3) <= \-prompc3\;
  \-prompc_bus\(4) <= \-prompc4\;
  \-prompc_bus\(5) <= \-prompc5\;
  \-prompc_bus\(6) <= \-prompc6\;
  \-prompc_bus\(7) <= \-prompc7\;
  \-prompc_bus\(8) <= \-prompc8\;
  \-prompc_bus\(9) <= \-prompc9\;

  -- Assign ir signals to the ir_bus for easy monitoring
  ir_bus(0)  <= ir0;
  ir_bus(1)  <= ir1;
  ir_bus(2)  <= ir2;
  ir_bus(3)  <= ir3;
  ir_bus(4)  <= ir4;
  ir_bus(5)  <= ir5;
  ir_bus(6)  <= ir6;
  ir_bus(7)  <= ir7;
  ir_bus(8)  <= ir8;
  ir_bus(9)  <= ir9;
  ir_bus(10) <= ir10;
  ir_bus(11) <= ir11;
  ir_bus(12) <= ir12;
  ir_bus(13) <= ir13;
  ir_bus(14) <= ir14;
  ir_bus(15) <= ir15;
  ir_bus(16) <= ir16;
  ir_bus(17) <= ir17;
  ir_bus(18) <= ir18;
  ir_bus(19) <= ir19;
  ir_bus(20) <= ir20;
  ir_bus(21) <= ir21;
  ir_bus(22) <= ir22;
  ir_bus(23) <= ir23;
  ir_bus(24) <= ir24;
  ir_bus(25) <= ir25;
  ir_bus(26) <= ir26;
  ir_bus(27) <= ir27;
  ir_bus(28) <= ir28;
  ir_bus(29) <= ir29;
  ir_bus(30) <= ir30;
  ir_bus(31) <= ir31;
  ir_bus(32) <= ir32;
  ir_bus(33) <= ir33;
  ir_bus(34) <= ir34;
  ir_bus(35) <= ir35;
  ir_bus(36) <= ir36;
  ir_bus(37) <= ir37;
  ir_bus(38) <= ir38;
  ir_bus(39) <= ir39;
  ir_bus(40) <= ir40;
  ir_bus(41) <= ir41;
  ir_bus(42) <= ir42;
  ir_bus(43) <= ir43;
  ir_bus(44) <= ir44;
  ir_bus(45) <= ir45;
  ir_bus(46) <= ir46;
  ir_bus(47) <= ir47;
  ir_bus(48) <= ir48;

  -- Assign iob signals to the iob_bus for easy monitoring
  iob_bus(0)  <= iob0;
  iob_bus(1)  <= iob1;
  iob_bus(2)  <= iob2;
  iob_bus(3)  <= iob3;
  iob_bus(4)  <= iob4;
  iob_bus(5)  <= iob5;
  iob_bus(6)  <= iob6;
  iob_bus(7)  <= iob7;
  iob_bus(8)  <= iob8;
  iob_bus(9)  <= iob9;
  iob_bus(10) <= iob10;
  iob_bus(11) <= iob11;
  iob_bus(12) <= iob12;
  iob_bus(13) <= iob13;
  iob_bus(14) <= iob14;
  iob_bus(15) <= iob15;
  iob_bus(16) <= iob16;
  iob_bus(17) <= iob17;
  iob_bus(18) <= iob18;
  iob_bus(19) <= iob19;
  iob_bus(20) <= iob20;
  iob_bus(21) <= iob21;
  iob_bus(22) <= iob22;
  iob_bus(23) <= iob23;
  iob_bus(24) <= iob24;
  iob_bus(25) <= iob25;
  iob_bus(26) <= iob26;
  iob_bus(27) <= iob27;
  iob_bus(28) <= iob28;
  iob_bus(29) <= iob29;
  iob_bus(30) <= iob30;
  iob_bus(31) <= iob31;
  iob_bus(32) <= iob32;
  iob_bus(33) <= iob33;
  iob_bus(34) <= iob34;
  iob_bus(35) <= iob35;
  iob_bus(36) <= iob36;
  iob_bus(37) <= iob37;
  iob_bus(38) <= iob38;
  iob_bus(39) <= iob39;
  iob_bus(40) <= iob40;
  iob_bus(41) <= iob41;
  iob_bus(42) <= iob42;
  iob_bus(43) <= iob43;
  iob_bus(44) <= iob44;
  iob_bus(45) <= iob45;
  iob_bus(46) <= iob46;
  iob_bus(47) <= iob47;

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
