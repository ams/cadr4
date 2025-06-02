library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr;
use cadr.utilities.all;

entity cadr_iram03 is
  port (
    pc0d     : out std_logic;
    pc1d     : out std_logic;
    pc2d     : out std_logic;
    pc3d     : out std_logic;
    pc4d     : out std_logic;
    pc5d     : out std_logic;
    i10      : out std_logic;
    \-iwed\  : in  std_logic;
    \-ice3a\ : in  std_logic;
    iwr10    : in  std_logic;
    pc11d    : out std_logic;
    pc10d    : out std_logic;
    pc9d     : out std_logic;
    pc8d     : out std_logic;
    pc7d     : out std_logic;
    pc6d     : out std_logic;
    i11      : out std_logic;
    iwr11    : in  std_logic;
    \-pcb6\  : in  std_logic;
    \-pcb7\  : in  std_logic;
    \-pcb8\  : in  std_logic;
    \-pcb9\  : in  std_logic;
    \-pcb10\ : in  std_logic;
    \-pcb11\ : in  std_logic;
    \-pcb0\  : in  std_logic;
    \-pcb1\  : in  std_logic;
    \-pcb2\  : in  std_logic;
    \-pcb3\  : in  std_logic;
    \-pcb4\  : in  std_logic;
    \-pcb5\  : in  std_logic;
    i5       : out std_logic;
    iwr5     : in  std_logic;
    i6       : out std_logic;
    iwr6     : in  std_logic;
    i7       : out std_logic;
    iwr7     : in  std_logic;
    i8       : out std_logic;
    iwr8     : in  std_logic;
    i9       : out std_logic;
    iwr9     : in  std_logic;
    i0       : out std_logic;
    iwr0     : in  std_logic;
    i1       : out std_logic;
    iwr1     : in  std_logic;
    i2       : out std_logic;
    iwr2     : in  std_logic;
    i3       : out std_logic;
    iwr3     : in  std_logic;
    i4       : out std_logic;
    iwr4     : in  std_logic);
end;

architecture ttl of cadr_iram03 is
begin
  iram03_2d06 : am2147 port map(a0   => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i10, we_n => \-iwed\, ce_n => \-ice3a\, di => iwr10, a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d, a6 => pc6d);
  iram03_2d07 : am2147 port map(a0   => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i11, we_n => \-iwed\, ce_n => \-ice3a\, di => iwr11, a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d, a6 => pc6d);
  iram03_2d08 : sn74s04 port map(g1a => \-pcb6\, g1q_n => pc6d, g2a => \-pcb7\, g2q_n => pc7d, g3a => \-pcb8\, g3q_n => pc8d, g4q_n => pc9d, g4a => \-pcb9\, g5q_n => pc10d, g5a => \-pcb10\, g6q_n => pc11d, g6a => \-pcb11\);
  iram03_2d09 : sn74s04 port map(g1a => \-pcb0\, g1q_n => pc0d, g2a => \-pcb1\, g2q_n => pc1d, g3a => \-pcb2\, g3q_n => pc2d, g4q_n => pc3d, g4a => \-pcb3\, g5q_n => pc4d, g5a => \-pcb4\, g6q_n => pc5d, g6a => \-pcb5\);
  iram03_2e06 : am2147 port map(a0   => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i5, we_n => \-iwed\, ce_n => \-ice3a\, di => iwr5, a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d, a6 => pc6d);
  iram03_2e07 : am2147 port map(a0   => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i6, we_n => \-iwed\, ce_n => \-ice3a\, di => iwr6, a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d, a6 => pc6d);
  iram03_2e08 : am2147 port map(a0   => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i7, we_n => \-iwed\, ce_n => \-ice3a\, di => iwr7, a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d, a6 => pc6d);
  iram03_2e09 : am2147 port map(a0   => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i8, we_n => \-iwed\, ce_n => \-ice3a\, di => iwr8, a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d, a6 => pc6d);
  iram03_2e10 : am2147 port map(a0   => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i9, we_n => \-iwed\, ce_n => \-ice3a\, di => iwr9, a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d, a6 => pc6d);
  iram03_2f06 : am2147 port map(a0   => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i0, we_n => \-iwed\, ce_n => \-ice3a\, di => iwr0, a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d, a6 => pc6d);
  iram03_2f07 : am2147 port map(a0   => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i1, we_n => \-iwed\, ce_n => \-ice3a\, di => iwr1, a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d, a6 => pc6d);
  iram03_2f08 : am2147 port map(a0   => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i2, we_n => \-iwed\, ce_n => \-ice3a\, di => iwr2, a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d, a6 => pc6d);
  iram03_2f09 : am2147 port map(a0   => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i3, we_n => \-iwed\, ce_n => \-ice3a\, di => iwr3, a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d, a6 => pc6d);
  iram03_2f10 : am2147 port map(a0   => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i4, we_n => \-iwed\, ce_n => \-ice3a\, di => iwr4, a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d, a6 => pc6d);
end architecture;
