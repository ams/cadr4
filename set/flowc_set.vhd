library ieee;
use ieee.std_logic_1164.all;
use work.cadr.all;

entity flowc is
  port (
    -- Clock and reset signals
    clk3c    : in  std_logic;
    \-reset\ : in  std_logic;
    tse3a    : in  std_logic;
    
    -- Input control signals
    \-funct2\    : in  std_logic;
    \-irdisp\    : in  std_logic;
    irdisp       : in  std_logic;
    irjump       : in  std_logic;
    \-jcond\     : in  std_logic;
    jcond        : in  std_logic;
    \-nop11\     : in  std_logic;
    \-srcspc\    : in  std_logic;
    \-srcspcpop\ : in  std_logic;
    \-trap\      : in  std_logic;
    
    -- Bus signals
    IR : in std_logic_vector(42 downto 6);
    
    -- Output control signals
    \-dfall\         : out std_logic;
    \-destspc\       : out std_logic;
    destspc          : out std_logic;
    dispenb          : out std_logic;
    dn               : out std_logic;
    dp               : out std_logic;
    dr               : out std_logic;
    \-ignpopj\       : out std_logic;
    \-inop\          : out std_logic;
    inop             : out std_logic;
    \-ipopj\         : out std_logic;
    \-iwrited\       : out std_logic;
    iwrite           : out std_logic;
    iwrited          : out std_logic;
    jcalf            : out std_logic;
    jfalse           : out std_logic;
    jret             : out std_logic;
    jretf            : out std_logic;
    n                : out std_logic;
    \-nop\           : out std_logic;
    nop              : out std_logic;
    \-nopa\          : out std_logic;
    \-popj\          : out std_logic;
    \-spcdrive\      : out std_logic;
    spcdrive         : out std_logic;
    spcenb           : out std_logic;
    \-spcpass\       : out std_logic;
    \-spcwpass\      : out std_logic;
    spcwpass         : out std_logic;
    \-spushd\        : out std_logic;
    spush            : out std_logic;
    spushd           : out std_logic;
    \-srcspcpopreal\ : out std_logic
  );
end entity;

architecture structure of flowc is
begin

  u_cadr_contrl : cadr_contrl
    port map (
      clk3c            => clk3c,
      \-reset\         => \-reset\,
      tse3a            => tse3a,
      \-funct2\        => \-funct2\,
      \-irdisp\        => \-irdisp\,
      irdisp           => irdisp,
      irjump           => irjump,
      \-jcond\         => \-jcond\,
      jcond            => jcond,
      \-nop11\         => \-nop11\,
      \-srcspc\        => \-srcspc\,
      \-srcspcpop\     => \-srcspcpop\,
      \-trap\          => \-trap\,
      ir6              => IR(6),
      ir7              => IR(7),
      ir8              => IR(8),
      ir42             => IR(42),
      dp               => dp,
      dr               => dr,
      \-dfall\         => \-dfall\,
      \-destspc\       => \-destspc\,
      destspc          => destspc,
      dispenb          => dispenb,
      dn               => dn,
      \-ignpopj\       => \-ignpopj\,
      \-inop\          => \-inop\,
      inop             => inop,
      \-ipopj\         => \-ipopj\,
      \-iwrited\       => \-iwrited\,
      iwrite           => iwrite,
      iwrited          => iwrited,
      jcalf            => jcalf,
      jfalse           => jfalse,
      jret             => jret,
      jretf            => jretf,
      n                => n,
      \-nop\           => \-nop\,
      nop              => nop,
      \-nopa\          => \-nopa\,
      \-popj\          => \-popj\,
      \-spcdrive\      => \-spcdrive\,
      spcdrive         => spcdrive,
      spcenb           => spcenb,
      \-spcpass\       => \-spcpass\,
      \-spcwpass\      => \-spcwpass\,
      spcwpass         => spcwpass,
      \-spushd\        => \-spushd\,
      spush            => spush,
      spushd           => spushd,
      \-srcspcpopreal\ => \-srcspcpopreal\
    );

end structure; 