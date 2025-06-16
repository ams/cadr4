library ieee;
use ieee.std_logic_1164.all;
use work.cadr.all;

entity decode is
  port (
    -- Input control signals
    \destimod0 l\ : in std_logic;
    \-idebug\     : in std_logic;
    \-ir31\       : in std_logic;
    \iwrited l\   : in std_logic;
    nop           : in std_logic;
    
    -- Bus signals
    IR : in std_logic_vector(44 downto 3);
    
    -- Output control signals
    dest          : out std_logic;
    destm         : out std_logic;
    imod          : out std_logic;
    iralu         : out std_logic;
    irdisp        : out std_logic;
    irjump        : out std_logic;
    
    -- Function outputs  
    \-funct0\     : out std_logic;
    \-funct1\     : out std_logic;
    \-funct2\     : out std_logic;
    \-funct3\     : out std_logic;
    
    -- Destination outputs
    \-destimod0\  : out std_logic;
    \-destimod1\  : out std_logic;
    \-destintctl\ : out std_logic;
    \-destlc\     : out std_logic;
    \-destmdr\    : out std_logic;
    \-destmem\    : out std_logic;
    \-destpdl(p)\ : out std_logic;
    \-destpdl(x)\ : out std_logic;
    \-destpdlp\   : out std_logic;
    \-destpdltop\ : out std_logic;
    \-destpdlx\   : out std_logic;
    \-destspc\    : out std_logic;
    \-destvma\    : out std_logic;
    
    -- Source outputs
    \-srcdc\      : out std_logic;
    \-srclc\      : out std_logic;
    \-srcmap\     : out std_logic;
    \-srcmd\      : out std_logic;
    \-srcopc\     : out std_logic;
    \-srcpdlidx\  : out std_logic;
    \-srcpdlpop\  : out std_logic;
    \-srcpdlptr\  : out std_logic;
    \-srcpdltop\  : out std_logic;
    \-srcq\       : out std_logic;
    \-srcspc\     : out std_logic;
    \-srcspcpop\  : out std_logic;
    \-srcvma\     : out std_logic;
    
    -- ALU function outputs
    \-div\        : out std_logic;
    \-iralu\      : out std_logic;
    \-irbyte\     : out std_logic;
    \-irdisp\     : out std_logic;
    \-irjump\     : out std_logic;
    \-ir22\       : out std_logic;
    \-ir25\       : out std_logic;
    \-mul\        : out std_logic;
    \-specalu\    : out std_logic
  );
end entity;

architecture structure of decode is
begin

  u_cadr_source : cadr_source
    port map (
      \destimod0 l\ => \destimod0 l\,
      \-idebug\     => \-idebug\,
      ir3           => IR(3),
      ir4           => IR(4),
      ir8           => IR(8),
      ir10          => IR(10),
      ir11          => IR(11),
      ir19          => IR(19),
      ir20          => IR(20),
      ir21          => IR(21),
      ir22          => IR(22),
      ir23          => IR(23),
      ir25          => IR(25),
      ir26          => IR(26),
      ir27          => IR(27),
      ir28          => IR(28),
      ir29          => IR(29),
      \-ir31\       => \-ir31\,
      ir43          => IR(43),
      ir44          => IR(44),
      \iwrited l\   => \iwrited l\,
      nop           => nop,
      dest          => dest,
      destm         => destm,
      imod          => imod,
      iralu         => iralu,
      irdisp        => irdisp,
      irjump        => irjump,
      \-funct0\     => \-funct0\,
      \-funct1\     => \-funct1\,
      \-funct2\     => \-funct2\,
      \-funct3\     => \-funct3\,
      \-destimod0\  => \-destimod0\,
      \-destimod1\  => \-destimod1\,
      \-destintctl\ => \-destintctl\,
      \-destlc\     => \-destlc\,
      \-destmdr\    => \-destmdr\,
      \-destmem\    => \-destmem\,
      \-destpdl(p)\ => \-destpdl(p)\,
      \-destpdl(x)\ => \-destpdl(x)\,
      \-destpdlp\   => \-destpdlp\,
      \-destpdltop\ => \-destpdltop\,
      \-destpdlx\   => \-destpdlx\,
      \-destspc\    => \-destspc\,
      \-destvma\    => \-destvma\,
      \-srcdc\      => \-srcdc\,
      \-srclc\      => \-srclc\,
      \-srcmap\     => \-srcmap\,
      \-srcmd\      => \-srcmd\,
      \-srcopc\     => \-srcopc\,
      \-srcpdlidx\  => \-srcpdlidx\,
      \-srcpdlpop\  => \-srcpdlpop\,
      \-srcpdlptr\  => \-srcpdlptr\,
      \-srcpdltop\  => \-srcpdltop\,
      \-srcq\       => \-srcq\,
      \-srcspc\     => \-srcspc\,
      \-srcspcpop\  => \-srcspcpop\,
      \-srcvma\     => \-srcvma\,
      \-div\        => \-div\,
      \-iralu\      => \-iralu\,
      \-irbyte\     => \-irbyte\,
      \-irdisp\     => \-irdisp\,
      \-irjump\     => \-irjump\,
      \-ir22\       => \-ir22\,
      \-ir25\       => \-ir25\,
      \-mul\        => \-mul\,
      \-specalu\    => \-specalu\
    );

end structure; 