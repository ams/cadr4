library ieee;
use ieee.std_logic_1164.all;
use work.cadr.all;

entity trap is
  port (
    -- Input control signals
    \boot.trap\ : in  std_logic;
    mdhaspar    : in  std_logic;
    mdpar       : in  std_logic;
    trapenb     : in  std_logic;
    \use.md\    : in  std_logic;
    \-wait\     : in  std_logic;
    
    -- Bus signals  
    MD : in std_logic_vector(31 downto 0);
    
    -- Output control signals
    mdparerr   : out std_logic;
    mdpareven  : out std_logic;
    mdparl     : out std_logic;
    mdparm     : out std_logic;
    mdparodd   : out std_logic;
    \-memparok\ : out std_logic;
    memparok   : out std_logic;
    \-parerr\  : out std_logic;
    \-trap\    : out std_logic;
    trapa      : out std_logic;
    trapb      : out std_logic;
    \-trapenb\ : out std_logic
  );
end entity;

architecture structure of trap is
begin

  u_cadr_trap : cadr_trap
    port map (
      mdparerr    => mdparerr,
      mdpareven   => mdpareven,
      mdpar       => mdpar,
      \-md5\      => not MD(5),
      \-md6\      => not MD(6),
      \-md7\      => not MD(7),
      \-md8\      => not MD(8),
      \-md9\      => not MD(9),
      \-md10\     => not MD(10),
      \-md11\     => not MD(11),
      mdparl      => mdparl,
      \-md0\      => not MD(0),
      \-md1\      => not MD(1),
      \-md2\      => not MD(2),
      \-md3\      => not MD(3),
      \-md4\      => not MD(4),
      \-md17\     => not MD(17),
      \-md18\     => not MD(18),
      \-md19\     => not MD(19),
      \-md20\     => not MD(20),
      \-md21\     => not MD(21),
      \-md22\     => not MD(22),
      \-md23\     => not MD(23),
      mdparm      => mdparm,
      \-md12\     => not MD(12),
      \-md13\     => not MD(13),
      \-md14\     => not MD(14),
      \-md15\     => not MD(15),
      \-md16\     => not MD(16),
      \-md29\     => not MD(29),
      \-md30\     => not MD(30),
      \-md31\     => not MD(31),
      mdparodd    => mdparodd,
      \-md24\     => not MD(24),
      \-md25\     => not MD(25),
      \-md26\     => not MD(26),
      \-md27\     => not MD(27),
      \-md28\     => not MD(28),
      mdhaspar    => mdhaspar,
      \use.md\    => \use.md\,
      \-wait\     => \-wait\,
      \-parerr\   => \-parerr\,
      \-trap\     => \-trap\,
      \boot.trap\ => \boot.trap\,
      \-trapenb\  => \-trapenb\,
      \-memparok\ => \-memparok\,
      trapb       => trapb,
      trapa       => trapa,
      memparok    => memparok,
      trapenb     => trapenb
    );

end architecture; 