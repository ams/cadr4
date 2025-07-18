library ieee;
use ieee.std_logic_1164.all;

entity cadr_contrl is
  port (
    spushd           : out std_logic;
    tse3a            : in  std_logic;
    spcwpass         : out std_logic;
    \-ipopj\         : out std_logic;
    \-iwrited\       : out std_logic;
    \-popj\          : out std_logic;
    spcdrive         : out std_logic;
    spcenb           : out std_logic;
    \-reset\         : in  std_logic;
    inop             : out std_logic;
    \-inop\          : out std_logic;
    n                : out std_logic;
    clk3c            : in  std_logic;
    \-spushd\        : out std_logic;
    spush            : out std_logic;
    iwrite           : out std_logic;
    iwrited          : out std_logic;
    \-srcspc\        : in  std_logic;
    \-srcspcpop\     : in  std_logic;
    \-spcdrive\      : out std_logic;
    \-spcpass\       : out std_logic;
    \-spcwpass\      : out std_logic;
    ir42             : in  std_logic;
    \-nop\           : out std_logic;
    nop              : out std_logic;
    \-srcspcpopreal\ : out std_logic;
    \-nopa\          : out std_logic;
    \-nop11\         : in  std_logic;
    \-irdisp\        : in  std_logic;
    dr               : in  std_logic;
    \-ignpopj\       : out std_logic;
    \-destspc\       : out std_logic;
    destspc          : out std_logic;
    dp               : in  std_logic;
    \-dfall\         : out std_logic;
    \-trap\          : in  std_logic;
    irdisp           : in  std_logic;
    \-funct2\        : in  std_logic;
    dispenb          : out std_logic;
    irjump           : in  std_logic;
    ir6              : in  std_logic;
    jfalse           : out std_logic;
    jcalf            : out std_logic;
    ir8              : in  std_logic;
    jretf            : out std_logic;
    jret             : out std_logic;
    ir7              : in  std_logic;
    dn               : out std_logic;
    \-jcond\         : in  std_logic;
    hi4              : in  std_logic;
    jcond            : in  std_logic;
    \-ir6\           : out std_logic;
    \-dr\            : out std_logic;
    \-spush\         : out std_logic;
    pcs1             : out std_logic;
    popj             : out std_logic;
    \-dp\            : out std_logic;
    \-spop\          : out std_logic;
    \-ir8\           : out std_logic;
    ir9              : in  std_logic;
    pcs0             : out std_logic;
    \-spcnt\         : out std_logic;
    \-destspcd\      : out std_logic;
    destspcd         : out std_logic;
    \-swpb\          : out std_logic;
    \-swpa\          : out std_logic;
    wp4c             : in  std_logic
    );
end;
