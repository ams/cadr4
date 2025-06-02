library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr;
use cadr.utilities.all;

entity cadr_trap is
  port (
    mdparerr    : out std_logic;
    mdpareven   : out std_logic;
    mdpar       : in  std_logic;
    \-md5\      : in  std_logic;
    \-md6\      : in  std_logic;
    \-md7\      : in  std_logic;
    \-md8\      : in  std_logic;
    \-md9\      : in  std_logic;
    \-md10\     : in  std_logic;
    \-md11\     : in  std_logic;
    mdparl      : out std_logic;
    \-md0\      : in  std_logic;
    \-md1\      : in  std_logic;
    \-md2\      : in  std_logic;
    \-md3\      : in  std_logic;
    \-md4\      : in  std_logic;
    \-md17\     : in  std_logic;
    \-md18\     : in  std_logic;
    \-md19\     : in  std_logic;
    \-md20\     : in  std_logic;
    \-md21\     : in  std_logic;
    \-md22\     : in  std_logic;
    \-md23\     : in  std_logic;
    mdparm      : out std_logic;
    \-md12\     : in  std_logic;
    \-md13\     : in  std_logic;
    \-md14\     : in  std_logic;
    \-md15\     : in  std_logic;
    \-md16\     : in  std_logic;
    \-md29\     : in  std_logic;
    \-md30\     : in  std_logic;
    \-md31\     : in  std_logic;
    gnd         : in  std_logic;
    mdparodd    : out std_logic;
    \-md24\     : in  std_logic;
    \-md25\     : in  std_logic;
    \-md26\     : in  std_logic;
    \-md27\     : in  std_logic;
    \-md28\     : in  std_logic;
    mdhaspar    : in  std_logic;
    \use.md\    : in  std_logic;
    \-wait\     : in  std_logic;
    \-parerr\   : out std_logic;
    \-trap\     : out std_logic;
    \boot.trap\ : in  std_logic;
    \-trapenb\  : out std_logic;
    trapenb     : in  std_logic;
    \-memparok\ : out std_logic;
    trapb       : out std_logic;
    trapa       : out std_logic;
    memparok    : out std_logic);
end;

architecture ttl of cadr_trap is
  signal internal17 : std_logic;
  signal nc147      : std_logic;
  signal nc148      : std_logic;
begin
  trap_1d12 : sn74s86 port map(g4y   => mdparerr, g4a => mdpareven, g4b => mdpar, g1a => '0', g1b => '0', g2a => '0', g2b => '0', g3a => '0', g3b => '0');
  trap_1e28 : am93s48 port map(i6    => \-md5\, i5 => \-md6\, i4 => \-md7\, i3 => \-md8\, i2 => \-md9\, i1 => \-md10\, i0 => \-md11\, po => mdparl, pe => nc148, i11 => \-md0\, i10 => \-md1\, i9 => \-md2\, i8 => \-md3\, i7 => \-md4\);
  trap_1e29 : am93s48 port map(i6    => \-md17\, i5 => \-md18\, i4 => \-md19\, i3 => \-md20\, i2 => \-md21\, i1 => \-md22\, i0 => \-md23\, po => mdparm, pe => nc147, i11 => \-md12\, i10 => \-md13\, i9 => \-md14\, i8 => \-md15\, i7 => \-md16\);
  trap_1e30 : am93s48 port map(i6    => \-md29\, i5 => \-md30\, i4 => \-md31\, i3 => mdparl, i2 => mdparm, i1 => gnd, i0 => gnd, po => mdparodd, pe => mdpareven, i11 => \-md24\, i10 => \-md25\, i9 => \-md26\, i8 => \-md27\, i7 => \-md28\);
  trap_3e30 : sn74s20 port map(g1a   => mdparerr, g1b => mdhaspar, g1c => \use.md\, g1d => \-wait\, g1y_n => \-parerr\, g2a => '0', g2b => '0', g2c => '0', g2d => '0');
  trap_3f18 : sn74s02 port map(g2q_n => \-trap\, g2a => internal17, g2b => \boot.trap\, g3b => \-trapenb\, g3a => \-parerr\, g3q_n => internal17, g4b => trapenb, g4a => \-parerr\, g4q_n => \-memparok\, g1a => '0', g1b => '0');
  trap_3f19 : sn74s04 port map(g1a   => \-trap\, g1q_n => trapb, g2a => \-trap\, g2q_n => trapa, g3a => \-memparok\, g3q_n => memparok, g4q_n => \-trapenb\, g4a => trapenb, g5a => '0', g6a => '0');
end architecture;
