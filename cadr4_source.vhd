library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_source is
  port (
    \-iralu\      : out std_logic;
    \-irbyte\     : out std_logic;
    dest          : out std_logic;
    \-destmem\    : out std_logic;
    ir23          : in  std_logic;
    destm         : out std_logic;
    \-specalu\    : out std_logic;
    ir8           : in  std_logic;
    iralu         : out std_logic;
    ir22          : in  std_logic;
    \-ir22\       : out std_logic;
    ir25          : in  std_logic;
    \-ir25\       : out std_logic;
    irdisp        : out std_logic;
    \-irdisp\     : out std_logic;
    irjump        : out std_logic;
    \-irjump\     : out std_logic;
    ir3           : in  std_logic;
    ir4           : in  std_logic;
    \-mul\        : out std_logic;
    \-div\        : out std_logic;
    nop           : in  std_logic;
    ir43          : in  std_logic;
    ir44          : in  std_logic;
    \-funct3\     : out std_logic;
    \-funct2\     : out std_logic;
    \-funct1\     : out std_logic;
    \-funct0\     : out std_logic;
    ir11          : in  std_logic;
    ir10          : in  std_logic;
    ir19          : in  std_logic;
    ir20          : in  std_logic;
    ir21          : in  std_logic;
    \-destintctl\ : out std_logic;
    \-destlc\     : out std_logic;
    \-destimod1\  : out std_logic;
    \-destimod0\  : out std_logic;
    \-destspc\    : out std_logic;
    \-destpdlp\   : out std_logic;
    \-destpdlx\   : out std_logic;
    \-destpdl(x)\ : out std_logic;
    \-destpdl(p)\ : out std_logic;
    \-destpdltop\ : out std_logic;
    ir26          : in  std_logic;
    ir27          : in  std_logic;
    ir28          : in  std_logic;
    \-ir31\       : in  std_logic;
    ir29          : in  std_logic;
    hi5           : in  std_logic;
    \-srcq\       : out std_logic;
    \-srcopc\     : out std_logic;
    \-srcpdltop\  : out std_logic;
    \-srcpdlpop\  : out std_logic;
    \-srcpdlidx\  : out std_logic;
    \-srcpdlptr\  : out std_logic;
    \-srcspc\     : out std_logic;
    \-srcdc\      : out std_logic;
    gnd           : in  std_logic;
    \-srcspcpop\  : out std_logic;
    \-srclc\      : out std_logic;
    \-srcmd\      : out std_logic;
    \-srcmap\     : out std_logic;
    \-srcvma\     : out std_logic;
    \destimod0_l\ : in  std_logic;
    \iwrited_l\   : in  std_logic;
    \-destmdr\    : out std_logic;
    \-destvma\    : out std_logic;
    \-idebug\     : in  std_logic;
    imod          : out std_logic);
end;

architecture ttl of cadr4_source is
  signal internal18 : std_logic;
  signal nc196      : std_logic;
  signal nc197      : std_logic;
  signal nc198      : std_logic;
  signal nc199      : std_logic;
  signal nc200      : std_logic;
  signal nc201      : std_logic;
  signal nc202      : std_logic;
  signal nc203      : std_logic;
  signal nc204      : std_logic;
  signal nc205      : std_logic;
  signal nc206      : std_logic;
  signal nc207      : std_logic;
  signal nc208      : std_logic;
begin
  source_3d02 : sn74s00 port map(g2b => \-iralu\, g2a => \-irbyte\, g2q_n => dest, g3q_n => \-destmem\, g3b => ir23, g3a => destm, g4q_n => \-specalu\, g4a => ir8, g4b => iralu, g1b => '0', g1a => '0');
  source_3d03 : sn74s04 port map(g1a => ir22, g1q_n => \-ir22\, g2a => ir25, g2q_n => \-ir25\, g3a => nc198, g3q_n => nc199, g4q_n => irdisp, g4a => \-irdisp\, g5q_n => irjump, g5a => \-irjump\, g6q_n => iralu, g6a => \-iralu\);
  source_3d04 : sn74s139 port map(g1 => \-specalu\, a1 => ir3, b1 => ir4, g1y0 => \-mul\, g1y1 => \-div\, g1y2 => nc196, g1y3 => nc197, b2 => '0', a2 => '0', g2 => '0');
  source_3d05 : sn74s139 port map(g1 => nop, a1 => ir43, b1 => ir44, g1y0 => \-iralu\, g1y1 => \-irjump\, g1y2 => \-irdisp\, g1y3 => \-irbyte\, g2y3 => \-funct3\, g2y2 => \-funct2\, g2y1 => \-funct1\, g2y0 => \-funct0\, b2 => ir11, a2 => ir10, g2 => nop);
  source_3d11 : sn74s138 port map(a  => ir19, b => ir20, c => ir21, g2a => ir22, g2b => ir23, g1 => destm, y7 => nc200, y6 => nc201, y5 => nc202, y4 => nc203, y3 => nc204, y2 => \-destintctl\, y1 => \-destlc\, y0 => nc205);
  source_3d12 : sn74s138 port map(a  => ir19, b => ir20, c => ir21, g2a => \-ir22\, g2b => ir23, g1 => destm, y7 => \-destimod1\, y6 => \-destimod0\, y5 => \-destspc\, y4 => \-destpdlp\, y3 => \-destpdlx\, y2 => \-destpdl(x)\, y1 => \-destpdl(p)\, y0 => \-destpdltop\);
  source_3d21 : sn74s08 port map(g4q => destm, g4a => \-ir25\, g4b => dest, g1b => '0', g1a => '0', g2b => '0', g2a => '0', g3a => '0', g3b => '0');
  source_3d22 : sn74s138 port map(a  => ir26, b => ir27, c => ir28, g2a => \-ir31\, g2b => ir29, g1 => hi5, y7 => \-srcq\, y6 => \-srcopc\, y5 => \-srcpdltop\, y4 => \-srcpdlpop\, y3 => \-srcpdlidx\, y2 => \-srcpdlptr\, y1 => \-srcspc\, y0 => \-srcdc\);
  source_3d23 : sn74s138 port map(a  => ir26, b => ir27, c => ir28, g2a => \-ir31\, g2b => gnd, g1 => ir29, y7 => nc206, y6 => nc207, y5 => nc208, y4 => \-srcspcpop\, y3 => \-srclc\, y2 => \-srcmd\, y1 => \-srcmap\, y0 => \-srcvma\);
  source_3e05 : sn74s08 port map(g2b => \destimod0_l\, g2a => \iwrited_l\, g2q => internal18, g1b => '0', g1a => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');
  source_3e09 : sn74s32 port map(g2a => \-destmem\, g2b => \-ir22\, g2y => \-destmdr\, g3y => \-destvma\, g3a => ir22, g3b => \-destmem\, g1a => '0', g1b => '0', g4a => '0', g4b => '0');
  source_4d10 : sn74s10 port map(g2a => internal18, g2b => \-destimod1\, g2c => \-idebug\, g2y_n => imod, g1a => '0', g1b => '0', g3a => '0', g3b => '0', g3c => '0', g1c => '0');
end architecture;
