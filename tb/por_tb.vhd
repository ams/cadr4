-- The MIT CADR --- Power-on-Reset testbench

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.icmem_book.cadr_olord2;

entity por_tb is
end;

architecture structural of por_tb is

  -- Input signals
  -- external
  signal \-boot1\            : std_logic := '1';
  signal \-busint.lm.reset\  : std_logic := '1';

  -- from spyX
  signal spy6                : std_logic := '0';
  signal spy7                : std_logic := '0'; 
  signal \-ldmode\           : std_logic := '1';

  signal aparok              : std_logic;
  signal clk5                : std_logic;
  signal dparok              : std_logic;
  signal errstop             : std_logic;  
  signal iparok              : std_logic;
  signal mclk5               : std_logic;
  signal memparok            : std_logic;
  signal mmemparok           : std_logic;
  signal pdlparok            : std_logic;
  signal srun                : std_logic;
  signal spcparok            : std_logic;
  signal \stat.ovf\          : std_logic;  
  signal \-halt\             : std_logic;
  signal \-upperhighok\      : std_logic;
  signal v0parok             : std_logic;
  signal vmoparok            : std_logic;

  -- Output signals
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
  signal hi1                 : std_logic;
  signal hi2                 : std_logic;
  signal highok              : std_logic;
  signal \-halted\           : std_logic;
  signal ldmode              : std_logic;
  signal mclk5a              : std_logic;
  signal reset               : std_logic;
  signal statstop            : std_logic;

begin

  i_olord2 : cadr_olord2 port map(\-ape\ => \-ape\, \-mpe\ => \-mpe\, \-pdlpe\ => \-pdlpe\, \-dpe\ => \-dpe\, \-ipe\ => \-ipe\, \-spe\ => \-spe\, \-higherr\ => \-higherr\, err => err, \-mempe\ => \-mempe\, \-v0pe\ => \-v0pe\, \-v1pe\ => \-v1pe\, \-halted\ => \-halted\, hi1 => hi1, aparok => aparok, mmemparok => mmemparok, pdlparok => pdlparok, dparok => dparok, clk5a => clk5a, iparok => iparok, spcparok => spcparok, highok => highok, memparok => memparok, v0parok => v0parok, vmoparok => vmoparok, statstop => statstop, \stat.ovf\ => \stat.ovf\, \-halt\ => \-halt\, \-mclk5\ => \-mclk5\, mclk5a => mclk5a, \-clk5\ => \-clk5\, \-reset\ => \-reset\, reset => reset, \bus.power.reset l\ => \bus.power.reset l\, \power reset a\ => \power reset a\, \-upperhighok\ => \-upperhighok\, \-lowerhighok\ => \-lowerhighok\, \-boot\ => \-boot\, \prog.bus.reset\ => \prog.bus.reset\, \-bus.reset\ => \-bus.reset\, \-clock reset b\ => \-clock reset b\, \-clock reset a\ => \-clock reset a\, \-power reset\ => \-power reset\, srun => srun, \boot.trap\ => \boot.trap\, hi2 => hi2, \-boot1\ => \-boot1\, \-boot2\ => \-boot2\, \-ldmode\ => \-ldmode\, ldmode => ldmode, mclk5 => mclk5, clk5 => clk5, \-busint.lm.reset\ => \-busint.lm.reset\, \-prog.reset\ => \-prog.reset\, spy6 => spy6, \-errhalt\ => \-errhalt\, errstop => errstop, \prog.boot\ => \prog.boot\, spy7 => spy7);

  process
  begin
    wait for 1 ns;
    assert \-boot2\ = '1' report "-boot2 is not 1" severity error;
    assert \-boot\ = '1' report "-boot is not 1" severity error;
    assert \-power reset\ = '0' report "-power reset is not 0" severity error;
    assert \-clock reset a\ = '0' report "-clock reset a is not 0" severity error;
    assert \-clock reset b\ = '0' report "-clock reset a is not 0" severity error;
    assert reset = '1' report "reset is not 1" severity error;
    wait for 20 ns;
    assert \-power reset\ = '1' report "-power reset is not 1" severity error;
    assert \-clock reset a\ = '1' report "clock reset a is not 1" severity error;
    assert \-clock reset b\ = '1' report "clock reset a is not 1" severity error;
    assert reset = '0' report "reset is not 0" severity error;
    wait;    
    std.env.finish;
  end process;

end architecture;
