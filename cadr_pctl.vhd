library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr;
use cadr.utilities.all;

entity cadr_pctl is
  port (
    \-promenable\   : out std_logic;
    gnd             : in  std_logic;
    i46             : out std_logic;
    hi2             : in  std_logic;
    pc0             : in  std_logic;
    \-prompc0\      : out std_logic;
    pc1             : in  std_logic;
    \-prompc1\      : out std_logic;
    pc2             : in  std_logic;
    \-prompc2\      : out std_logic;
    \-prompc3\      : out std_logic;
    pc3             : in  std_logic;
    \-prompc4\      : out std_logic;
    pc4             : in  std_logic;
    pc9             : in  std_logic;
    \-promce0\      : out std_logic;
    \-prompc9\      : out std_logic;
    \-promce1\      : out std_logic;
    \bottom.1k\     : out std_logic;
    \-idebug\       : in  std_logic;
    \-promdisabled\ : in  std_logic;
    \-iwriteda\     : in  std_logic;
    pc13            : in  std_logic;
    pc12            : in  std_logic;
    pc11            : in  std_logic;
    pc10            : in  std_logic;
    pc5             : in  std_logic;
    \-prompc5\      : out std_logic;
    pc6             : in  std_logic;
    \-prompc6\      : out std_logic;
    pc7             : in  std_logic;
    \-prompc7\      : out std_logic;
    \-prompc8\      : out std_logic;
    pc8             : in  std_logic;
    \-ape\          : in  std_logic;
    \-pdlpe\        : in  std_logic;
    \-spe\          : in  std_logic;
    \-mpe\          : in  std_logic;
    tilt1           : out std_logic;
    tilt0           : out std_logic;
    \-mempe\        : in  std_logic;
    \-v1pe\         : in  std_logic;
    \-v0pe\         : in  std_logic;
    promenable      : out std_logic;
    dpe             : out std_logic;
    \-dpe\          : in  std_logic;
    ipe             : out std_logic;
    \-ipe\          : in  std_logic);
end;

architecture ttl of cadr_pctl is
  signal nc10 : std_logic;
  signal nc11 : std_logic;
  signal nc12 : std_logic;
  signal nc13 : std_logic;
  signal nc14 : std_logic;
  signal nc15 : std_logic;
  signal nc16 : std_logic;
  signal nc17 : std_logic;
  signal nc18 : std_logic;
  signal nc19 : std_logic;
  signal nc20 : std_logic;
  signal nc21 : std_logic;
  signal nc22 : std_logic;
  signal nc23 : std_logic;
  signal nc24 : std_logic;
  signal nc25 : std_logic;
  signal nc26 : std_logic;
  signal nc27 : std_logic;
  signal nc28 : std_logic;
  signal nc29 : std_logic;
  signal nc30 : std_logic;
  signal nc31 : std_logic;
  signal nc32 : std_logic;
  signal nc33 : std_logic;
  signal nc34 : std_logic;
  signal nc35 : std_logic;
  signal nc36 : std_logic;
  signal nc37 : std_logic;
  signal nc38 : std_logic;
  signal nc39 : std_logic;
  signal nc4  : std_logic;
  signal nc40 : std_logic;
  signal nc41 : std_logic;
  signal nc42 : std_logic;
  signal nc43 : std_logic;
  signal nc44 : std_logic;
  signal nc45 : std_logic;
  signal nc46 : std_logic;
  signal nc47 : std_logic;
  signal nc5  : std_logic;
  signal nc6  : std_logic;
  signal nc7  : std_logic;
  signal nc8  : std_logic;
  signal nc9  : std_logic;
begin
  pctl_1a16 : sn74ls244 port map(aenb_n => \-promenable\, ain0 => gnd, bout3 => nc29, ain1 => nc30, bout2 => nc31, ain2 => nc32, bout1 => nc33, ain3 => nc34, bout0 => nc35, bin0 => nc36, aout3 => nc37, bin1 => nc38, aout2 => nc39, bin2 => nc40, aout1 => nc41, bin3 => nc42, aout0 => i46, benb_n => hi2);
  pctl_1c17 : sn74s04 port map(g1a      => pc0, g1q_n => \-prompc0\, g2a => pc1, g2q_n => \-prompc1\, g3a => pc2, g3q_n => \-prompc2\, g4q_n => \-prompc3\, g4a => pc3, g5q_n => \-prompc4\, g5a => pc4, g6q_n => nc45, g6a => nc46);
  pctl_1c18 : sn74s32 port map(g1a      => \-promenable\, g1b => pc9, g1y => \-promce0\, g2a => \-prompc9\, g2b => \-promenable\, g2y => \-promce1\, g3a => '0', g3b => '0', g4a => '0', g4b => '0');
  pctl_1c19 : sn74s20 port map(g1a      => \bottom.1k\, g1b => \-idebug\, g1c => \-promdisabled\, g1d => \-iwriteda\, g1y_n => \-promenable\, g2a => '0', g2b => '0', g2c => '0', g2d => '0');
  pctl_1d18 : sn74s260 port map(g1a     => gnd,
                                g2a     => pc13,
                                g3a     => pc12,
                                g4a     => pc11,
                                g5a     => pc10,
                                g1y_n   => \bottom.1k\,
                                g1b     => '0',
                                g2b     => '0',
                                g3b     => '0',
                                g4b     => '0',
                                g5b     => '0',
                                g2y_n   => nc47);
  pctl_1d19 : sn74s04 port map(g1a      => pc5, g1q_n => \-prompc5\, g2a => pc6, g2q_n => \-prompc6\, g3a => pc7, g3q_n => \-prompc7\, g4q_n => \-prompc8\, g4a => pc8, g5q_n => \-prompc9\, g5a => pc9, g6q_n => nc43, g6a => nc44);
  pctl_1e16 : sn74s20 port map(g1a      => \-ape\, g1b => \-pdlpe\, g1c => \-spe\, g1d => \-mpe\, g1y_n => tilt1, g2y_n => tilt0, g2a => hi2, g2b => \-mempe\, g2c => \-v1pe\, g2d => \-v0pe\);
  pctl_1f10 : sn74s04 port map(g3a      => \-promenable\, g3q_n => promenable, g5q_n => dpe, g5a => \-dpe\, g6q_n => ipe, g6a => \-ipe\, g1a => '0', g2a => '0', g4a => '0');
  pctl_1f16 : til309 port map(l2        => nc4, l4 => nc5, l8 => nc6, l1 => nc7, latch => gnd, i4 => pc2, i8 => gnd, i2 => pc1, blank_n => hi2, dp => tilt1, test_n => hi2, ldp => nc8, i1 => pc0);
  pctl_1f17 : til309 port map(l2        => nc9, l4 => nc10, l8 => nc11, l1 => nc12, latch => gnd, i4 => pc5, i8 => gnd, i2 => pc4, blank_n => hi2, dp => tilt0, test_n => hi2, ldp => nc13, i1 => pc3);
  pctl_1f18 : til309 port map(l2        => nc14, l4 => nc15, l8 => nc16, l1 => nc17, latch => gnd, i4 => pc8, i8 => gnd, i2 => pc7, blank_n => hi2, dp => dpe, test_n => hi2, ldp => nc18, i1 => pc6);
  pctl_1f19 : til309 port map(l2        => nc19, l4 => nc20, l8 => nc21, l1 => nc22, latch => gnd, i4 => pc11, i8 => gnd, i2 => pc10, blank_n => hi2, dp => ipe, test_n => hi2, ldp => nc23, i1 => pc9);
  pctl_1f20 : til309 port map(l2        => nc24, l4 => nc25, l8 => nc26, l1 => nc27, latch => gnd, i4 => gnd, i8 => gnd, i2 => pc13, blank_n => hi2, dp => promenable, test_n => hi2, ldp => nc28, i1 => pc12);
end architecture;
