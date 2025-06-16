library ieee;
use ieee.std_logic_1164.all;
use work.cadr.all;

entity jumpc is
  port (
    -- Clock and reset signals
    clk3c         : in  std_logic;
    \-reset\      : in  std_logic;
    
    -- Input control signals
    \a=m\         : in  std_logic;
    alu32         : in  std_logic;
    \-destintctl\ : in  std_logic;
    \-nopa\       : in  std_logic;
    r0            : in  std_logic;
    sintr         : in  std_logic;
    \-vmaok\      : in  std_logic;
    
    -- Bus signals
    IR : in std_logic_vector(46 downto 0);
    OB : in std_logic_vector(29 downto 26);
    
    -- Output control signals
    \-alu32\            : out std_logic;
    aluneg              : out std_logic;
    conds0              : out std_logic;
    conds1              : out std_logic;
    conds2              : out std_logic;
    \-ilong\            : out std_logic;
    \int.enable\        : out std_logic;
    jcond               : out std_logic;
    \-jcond\            : out std_logic;
    \lc byte mode\      : out std_logic;
    \pgf.or.int\        : out std_logic;
    \pgf.or.int.or.sb\  : out std_logic;
    \prog.unibus.reset\ : out std_logic;
    \sequence.break\    : out std_logic;
    sint                : out std_logic;
    \-statbit\          : out std_logic
  );
end entity;

architecture structure of jumpc is
begin

  u_cadr_flag : cadr_flag
    port map (
      \a=m\               => \a=m\,
      alu32               => alu32,
      clk3c               => clk3c,
      \-destintctl\       => \-destintctl\,
      ir0                 => IR(0),
      ir1                 => IR(1),
      ir2                 => IR(2),
      ir5                 => IR(5),
      ir45                => IR(45),
      ir46                => IR(46),
      \-nopa\             => \-nopa\,
      ob26                => OB(26),
      ob27                => OB(27),
      ob28                => OB(28),
      ob29                => OB(29),
      r0                  => r0,
      \-reset\            => \-reset\,
      sintr               => sintr,
      \-vmaok\            => \-vmaok\,
      \-alu32\            => \-alu32\,
      aluneg              => aluneg,
      conds0              => conds0,
      conds1              => conds1,
      conds2              => conds2,
      \-ilong\            => \-ilong\,
      \int.enable\        => \int.enable\,
      jcond               => jcond,
      \-jcond\            => \-jcond\,
      \lc byte mode\      => \lc byte mode\,
      \pgf.or.int\        => \pgf.or.int\,
      \pgf.or.int.or.sb\  => \pgf.or.int.or.sb\,
      \prog.unibus.reset\ => \prog.unibus.reset\,
      \sequence.break\    => \sequence.break\,
      sint                => sint,
      \-statbit\          => \-statbit\
    );

end structure; 