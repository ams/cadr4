library ieee;
use ieee.std_logic_1164.all;
use work.cadr.all;

entity olord is
  port (
    -- Clock and reset signals
    \-clock reset a\ : in  std_logic;
    \-reset\         : in  std_logic;
    \-ldclk\         : in  std_logic;
    mclk5a           : in  std_logic;
    mclk5            : in  std_logic;
    clk5             : in  std_logic;
    \-mclk5\         : out std_logic;
    clk5a            : out std_logic;
    \-clk5\          : out std_logic;
    reset            : out std_logic;
    \bus.power.reset l\ : out std_logic;
    \power reset a\  : out std_logic;
    \-upperhighok\   : in  std_logic;
    \-lowerhighok\   : out std_logic;
    \-boot\          : in  std_logic;
    \-boot1\         : in  std_logic;
    \prog.bus.reset\ : out std_logic;
    \-bus.reset\     : out std_logic;
    \-clock reset b\ : out std_logic;
    \-clock reset a out\ : out std_logic;
    \-power reset\   : out std_logic;
    \boot.trap\      : out std_logic;
    \-boot2\         : out std_logic;
    \-ldmode\        : in  std_logic;
    ldmode           : out std_logic;
    \-busint.lm.reset\ : in  std_logic;
    \-prog.reset\    : out std_logic;
    \prog.boot\      : out std_logic;
    
    -- Speed control signals
    speed1a          : out std_logic;
    sspeed1          : out std_logic;
    speedclk         : out std_logic;
    sspeed0          : out std_logic;
    speed0a          : out std_logic;
    speed1           : out std_logic;
    speed0           : out std_logic;
    
    -- Spy signals
    SPY : in std_logic_vector(7 downto 0);
    
    -- Control signals
    errstop          : out std_logic;
    stathenb         : out std_logic;
    trapenb          : out std_logic;
    promdisable      : out std_logic;
    \-opcinh\        : out std_logic;
    opcinh           : out std_logic;
    \-ldopc\         : in  std_logic;
    opcclk           : out std_logic;
    \-opcclk\        : out std_logic;
    \-lpc.hold\      : out std_logic;
    \lpc.hold\       : out std_logic;
    ldstat           : out std_logic;
    \-ldstat\        : out std_logic;
    \-idebug\        : out std_logic;
    idebug           : out std_logic;
    nop11            : out std_logic;
    \-nop11\         : out std_logic;
    \-step\          : out std_logic;
    step             : out std_logic;
    promdisabled     : out std_logic;
    sstep            : out std_logic;
    ssdone           : out std_logic;
    srun             : out std_logic;
    run              : out std_logic;
    \-run\           : out std_logic;
    \-ssdone\        : out std_logic;
    \-errhalt\       : in  std_logic;
    \-wait\          : in  std_logic;
    \-stathalt\      : out std_logic;
    \stat.ovf\       : out std_logic;
    \-stc32\         : in  std_logic;
    \-tpr60\         : in  std_logic;
    statstop         : in  std_logic;
    \-machruna\      : out std_logic;
    \-machrun\       : out std_logic;
    machrun          : out std_logic;
    
    -- Error/parity signals
    \-ape\           : out std_logic;
    \-mpe\           : out std_logic;
    \-pdlpe\         : out std_logic;
    \-dpe\           : out std_logic;
    \-ipe\           : out std_logic;
    \-spe\           : out std_logic;
    \-higherr\       : out std_logic;
    err              : out std_logic;
    \-mempe\         : out std_logic;
    \-v0pe\          : out std_logic;
    \-v1pe\          : out std_logic;
    \-halted\        : out std_logic;
    aparok           : in  std_logic;
    mmemparok        : in  std_logic;
    pdlparok         : in  std_logic;
    dparok           : in  std_logic;
    iparok           : in  std_logic;
    spcparok         : in  std_logic;
    highok           : out std_logic;
    memparok         : in  std_logic;
    v0parok          : in  std_logic;
    vmoparok         : in  std_logic;
    statstop_out     : out std_logic;
    \-halt\          : in  std_logic;
    \-ldmode_out\    : out std_logic;
    errstop_in       : in  std_logic;
    \-errhalt_out\   : out std_logic
  );
end entity;

architecture rtl of olord is
  
  -- Internal signals
  signal stat_ovf : std_logic;
  signal srun : std_logic;
  signal errstop : std_logic;
  signal ldmode : std_logic;

begin

  -- CADR OLORD1 instance
  u_olord1: cadr_olord1
    port map (
      \-clock reset a\ => \-clock reset a\,
      speed1a          => speed1a,
      sspeed1          => sspeed1,
      speedclk         => speedclk,
      sspeed0          => sspeed0,
      speed0a          => speed0a,
      speed1           => speed1,
      speed0           => speed0,
      \-reset\         => \-reset\,
      spy0             => SPY(0),
      spy1             => SPY(1),
      spy2             => SPY(2),
      errstop          => errstop,
      \-ldmode\        => ldmode,
      stathenb         => stathenb,
      spy3             => SPY(3),
      trapenb          => trapenb,
      spy4             => SPY(4),
      spy5             => SPY(5),
      promdisable      => promdisable,
      \-opcinh\        => \-opcinh\,
      opcinh           => opcinh,
      \-ldopc\         => \-ldopc\,
      opcclk           => opcclk,
      \-opcclk\        => \-opcclk\,
      \-lpc.hold\      => \-lpc.hold\,
      \lpc.hold\       => \lpc.hold\,
      ldstat           => ldstat,
      \-ldstat\        => \-ldstat\,
      \-idebug\        => \-idebug\,
      idebug           => idebug,
      \-ldclk\         => \-ldclk\,
      nop11            => nop11,
      \-nop11\         => \-nop11\,
      \-step\          => \-step\,
      step             => step,
      promdisabled     => promdisabled,
      sstep            => sstep,
      ssdone           => ssdone,
      mclk5a           => mclk5a,
      srun             => srun,
      run              => run,
      \-boot\          => \-boot\,
      \-run\           => \-run\,
      \-ssdone\        => \-ssdone\,
      \-errhalt\       => \-errhalt\,
      \-wait\          => \-wait\,
      \-stathalt\      => \-stathalt\,
      \stat.ovf\       => stat_ovf,
      \-stc32\         => \-stc32\,
      \-tpr60\         => \-tpr60\,
      statstop         => statstop,
      \-machruna\      => \-machruna\,
      \-machrun\       => \-machrun\,
      machrun          => machrun
    );
  
  -- CADR OLORD2 instance
  u_olord2: cadr_olord2
    port map (
      \-ape\              => \-ape\,
      \-mpe\              => \-mpe\,
      \-pdlpe\            => \-pdlpe\,
      \-dpe\              => \-dpe\,
      \-ipe\              => \-ipe\,
      \-spe\              => \-spe\,
      \-higherr\          => \-higherr\,
      err                 => err,
      \-mempe\            => \-mempe\,
      \-v0pe\             => \-v0pe\,
      \-v1pe\             => \-v1pe\,
      \-halted\           => \-halted\,
      aparok              => aparok,
      mmemparok           => mmemparok,
      pdlparok            => pdlparok,
      dparok              => dparok,
      clk5a               => clk5a,
      iparok              => iparok,
      spcparok            => spcparok,
      highok              => highok,
      memparok            => memparok,
      v0parok             => v0parok,
      vmoparok            => vmoparok,
      statstop            => statstop_out,
      \stat.ovf\          => stat_ovf,
      \-halt\             => \-halt\,
      \-mclk5\            => \-mclk5\,
      mclk5a              => mclk5a,
      \-clk5\             => \-clk5\,
      \-reset\            => \-reset\,
      reset               => reset,
      \bus.power.reset l\ => \bus.power.reset l\,
      \power reset a\     => \power reset a\,
      \-upperhighok\      => \-upperhighok\,
      \-lowerhighok\      => \-lowerhighok\,
      \-boot\             => \-boot\,
      \prog.bus.reset\    => \prog.bus.reset\,
      \-bus.reset\        => \-bus.reset\,
      \-clock reset b\    => \-clock reset b\,
      \-clock reset a\    => \-clock reset a out\,
      \-power reset\      => \-power reset\,
      srun                => srun,
      \boot.trap\         => \boot.trap\,
      \-boot2\            => \-boot2\,
      \-boot1\            => \-boot1\,
      \-ldmode\           => ldmode,
      ldmode              => ldmode,
      mclk5               => mclk5,
      clk5                => clk5,
      \-busint.lm.reset\  => \-busint.lm.reset\,
      \-prog.reset\       => \-prog.reset\,
      spy6                => SPY(6),
      \-errhalt\          => \-errhalt_out\,
      errstop             => errstop,
      spy7                => SPY(7),
      \prog.boot\         => \prog.boot\
    );

      -- Output assignments handled by direct component connections

end architecture; 