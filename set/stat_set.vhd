library ieee;
use ieee.std_logic_1164.all;
use work.cadr.all;

entity stat is
  port (
    -- Clock signal
    clk5a     : in  std_logic;
    
    -- Control signals
    \-ldstat\ : in  std_logic;
    \-statbit\ : in  std_logic;
    \-spy.sth\ : in  std_logic;
    \-spy.stl\ : in  std_logic;
    
    -- Bus signals
    IWR : in  std_logic_vector(31 downto 0);
    
    -- Output bus signals
    SPY : out std_logic_vector(15 downto 0);
    ST  : out std_logic_vector(31 downto 0);
    
    -- Carry outputs
    \-stc4\  : out std_logic;
    \-stc8\  : out std_logic;
    \-stc12\ : out std_logic;
    \-stc16\ : out std_logic;
    \-stc20\ : out std_logic;
    \-stc24\ : out std_logic;
    \-stc28\ : out std_logic;
    \-stc32\ : out std_logic
  );
end entity;

architecture structure of stat is
begin

  u_cadr_stat : cadr_stat
    port map (
      clk5a      => clk5a,
      iwr12      => IWR(12),
      iwr13      => IWR(13),
      iwr14      => IWR(14),
      iwr15      => IWR(15),
      \-ldstat\  => \-ldstat\,
      st15       => ST(15),
      st14       => ST(14),
      st13       => ST(13),
      st12       => ST(12),
      \-stc16\   => \-stc16\,
      iwr16      => IWR(16),
      iwr17      => IWR(17),
      iwr18      => IWR(18),
      iwr19      => IWR(19),
      st19       => ST(19),
      st18       => ST(18),
      st17       => ST(17),
      st16       => ST(16),
      \-stc20\   => \-stc20\,
      iwr20      => IWR(20),
      iwr21      => IWR(21),
      iwr22      => IWR(22),
      iwr23      => IWR(23),
      st23       => ST(23),
      st22       => ST(22),
      st21       => ST(21),
      st20       => ST(20),
      \-stc24\   => \-stc24\,
      iwr24      => IWR(24),
      iwr25      => IWR(25),
      iwr26      => IWR(26),
      iwr27      => IWR(27),
      st27       => ST(27),
      st26       => ST(26),
      st25       => ST(25),
      st24       => ST(24),
      \-stc28\   => \-stc28\,
      iwr28      => IWR(28),
      iwr29      => IWR(29),
      iwr30      => IWR(30),
      iwr31      => IWR(31),
      st31       => ST(31),
      st30       => ST(30),
      st29       => ST(29),
      st28       => ST(28),
      \-stc32\   => \-stc32\,
      \-spy.sth\ => \-spy.sth\,
      spy8       => SPY(8),
      spy9       => SPY(9),
      spy10      => SPY(10),
      spy11      => SPY(11),
      spy12      => SPY(12),
      spy13      => SPY(13),
      spy14      => SPY(14),
      spy15      => SPY(15),
      spy0       => SPY(0),
      spy1       => SPY(1),
      spy2       => SPY(2),
      spy3       => SPY(3),
      spy4       => SPY(4),
      spy5       => SPY(5),
      spy6       => SPY(6),
      spy7       => SPY(7),
      \-spy.stl\ => \-spy.stl\,
      st11       => ST(11),
      st10       => ST(10),
      st9        => ST(9),
      st8        => ST(8),
      st7        => ST(7),
      st6        => ST(6),
      st5        => ST(5),
      st4        => ST(4),
      st3        => ST(3),
      st2        => ST(2),
      st1        => ST(1),
      st0        => ST(0),
      iwr0       => IWR(0),
      iwr1       => IWR(1),
      iwr2       => IWR(2),
      iwr3       => IWR(3),
      \-statbit\ => \-statbit\,
      \-stc4\    => \-stc4\,
      iwr4       => IWR(4),
      iwr5       => IWR(5),
      iwr6       => IWR(6),
      iwr7       => IWR(7),
      \-stc8\    => \-stc8\,
      iwr8       => IWR(8),
      iwr9       => IWR(9),
      iwr10      => IWR(10),
      iwr11      => IWR(11),
      \-stc12\   => \-stc12\
    );

end architecture; 