library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_source is
  port (
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
    \-div\        : out std_logic;
    \-funct0\     : out std_logic;
    \-funct1\     : out std_logic;
    \-funct2\     : out std_logic;
    \-funct3\     : out std_logic;
    \-idebug\     : in  std_logic;
    \-ir22\       : out std_logic;
    \-ir25\       : out std_logic;
    \-ir31\       : in  std_logic;
    \-iralu\      : out std_logic;
    \-irbyte\     : out std_logic;
    \-irdisp\     : out std_logic;
    \-irjump\     : out std_logic;
    \-mul\        : out std_logic;
    \-specalu\    : out std_logic;
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
    \destimod0_l\ : in  std_logic;
    \iwrited_l\   : in  std_logic;
    dest          : out std_logic;
    destm         : out std_logic;
    gnd           : in  std_logic;
    hi5           : in  std_logic;
    imod          : out std_logic;
    ir            : in  std_logic_vector(0 to 48);
    iralu         : out std_logic;
    irdisp        : out std_logic;
    irjump        : out std_logic;
    nc            : out std_logic_vector(0 to 500)
    );
end;

architecture ttl of cadr4_source is

  signal nop        : std_logic;
  signal internal18 : std_logic;

begin

  source_3d02 : sn74s00 port map(g2b => \-iralu\, g2a => \-irbyte\, g2q_n => dest, g3q_n => \-destmem\, g3b => ir(23), g3a => destm, g4q_n => \-specalu\, g4a => ir(8), g4b => iralu, g1b => '0', g1a => '0');
  source_3d03 : sn74s04 port map(g1a => ir(22), g1q_n => \-ir22\, g2a => ir(25), g2q_n => \-ir25\, g3a => nc(198), g3q_n => nc(199), g4q_n => irdisp, g4a => \-irdisp\, g5q_n => irjump, g5a => \-irjump\, g6q_n => iralu, g6a => \-iralu\);
  source_3d04 : sn74s139 port map(nENB  => \-specalu\, SEL(0) => ir(3), SEL(1) => ir(4),
                                  nY(0) => \-mul\, nY(1) => \-div\, nY(2) => nc(196), nY(3) => nc(197));
  source_3d05u : sn74s139 port map(nENB  => nop, SEL(0) => ir(43), SEL(1) => ir(44),
                                   nY(0) => \-iralu\, nY(1) => \-irjump\, nY(2) => \-irdisp\, nY(3) => \-irbyte\);
  source_3d05l : sn74s139 port map(nY(3)  => \-funct3\, nY(2) => \-funct2\, nY(1) => \-funct1\, nY(0) => \-funct0\,
                                   SEL(1) => ir(11), SEL(0) => ir(10), nENB => nop);
  source_3d11 : sn74s138 port map(SEL(0) => ir(19), SEL(1) => ir(20), SEL(2) => ir(21),
                                  nCE0   => ir(22), nCE1 => ir(23), CE2 => destm,
                                  nY(7)  => nc(200), nY(6) => nc(201), nY(5) => nc(202), nY(4) => nc(203),
                                  nY(3)  => nc(204), nY(2) => \-destintctl\, nY(1) => \-destlc\, nY(0) => nc(205));
  source_3d12 : sn74s138 port map(SEL(0) => ir(19), SEL(1) => ir(20), SEL(2) => ir(21),
                                  nCE0   => \-ir22\, nCE1 => ir(23), CE2 => destm,
                                  nY(7)  => \-destimod1\, nY(6) => \-destimod0\, nY(5) => \-destspc\, nY(4) => \-destpdlp\,
                                  nY(3)  => \-destpdlx\, nY(2) => \-destpdl(x)\, nY(1) => \-destpdl(p)\, nY(0) => \-destpdltop\);
  source_3d21 : sn74s08 port map(g4q => destm, g4a => \-ir25\, g4b => dest, g1b => '0', g1a => '0', g2b => '0', g2a => '0', g3a => '0', g3b => '0');
  source_3d22 : sn74s138 port map(SEL(0) => ir(26), SEL(1) => ir(27), SEL(2) => ir(28),
                                  nCE0   => \-ir31\, nCE1 => ir(29), CE2 => hi5,
                                  nY(7)  => \-srcq\, nY(6) => \-srcopc\, nY(5) => \-srcpdltop\, nY(4) => \-srcpdlpop\,
                                  nY(3)  => \-srcpdlidx\, nY(2) => \-srcpdlptr\, nY(1) => \-srcspc\, nY(0) => \-srcdc\);
  source_3d23 : sn74s138 port map(SEL(0) => ir(26), SEL(1) => ir(27), SEL(2) => ir(28),
                                  nCE0   => \-ir31\, nCE1 => gnd, CE2 => ir(29),
                                  nY(7)  => nc(206), nY(6) => nc(207), nY(5) => nc(208), nY(4) => \-srcspcpop\,
                                  nY(3)  => \-srclc\, nY(2) => \-srcmd\, nY(1) => \-srcmap\, nY(0) => \-srcvma\);
  source_3e05 : sn74s08 port map(g2b => \destimod0_l\, g2a => \iwrited_l\, g2q => internal18, g1b => '0', g1a => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');
  source_3e09 : sn74s32 port map(g2a => \-destmem\, g2b => \-ir22\, g2y => \-destmdr\, g3y => \-destvma\, g3a => ir(22), g3b => \-destmem\, g1a => '0', g1b => '0', g4a => '0', g4b => '0');
  source_4d10 : sn74s10 port map(g2a => internal18, g2b => \-destimod1\, g2c => \-idebug\, g2y_n => imod, g1a => '0', g1b => '0', g3a => '0', g3b => '0', g3c => '0', g1c => '0');

end architecture;
