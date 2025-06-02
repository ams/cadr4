library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr;
use cadr.utilities.all;

entity cadr_iram00 is
  port (
    pc0a     : out std_logic;
    pc1a     : out std_logic;
    pc2a     : out std_logic;
    pc3a     : out std_logic;
    pc4a     : out std_logic;
    pc5a     : out std_logic;
    i10      : out std_logic;
    \-iwea\  : in  std_logic;
    \-ice0a\ : in  std_logic;
    iwr10    : in  std_logic;
    pc11a    : out std_logic;
    pc10a    : out std_logic;
    pc9a     : out std_logic;
    pc8a     : out std_logic;
    pc7a     : out std_logic;
    pc6a     : out std_logic;
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

architecture ttl of cadr_iram00 is
begin
  iram00_1d21 : am2147 port map(a0   => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i10, we_n => \-iwea\, ce_n => \-ice0a\, di => iwr10, a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a, a6 => pc6a);
  iram00_1d22 : am2147 port map(a0   => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i11, we_n => \-iwea\, ce_n => \-ice0a\, di => iwr11, a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a, a6 => pc6a);
  iram00_1d23 : sn74s04 port map(g1a => \-pcb6\, g1q_n => pc6a, g2a => \-pcb7\, g2q_n => pc7a, g3a => \-pcb8\, g3q_n => pc8a, g4q_n => pc9a, g4a => \-pcb9\, g5q_n => pc10a, g5a => \-pcb10\, g6q_n => pc11a, g6a => \-pcb11\);
  iram00_1d24 : sn74s04 port map(g1a => \-pcb0\, g1q_n => pc0a, g2a => \-pcb1\, g2q_n => pc1a, g3a => \-pcb2\, g3q_n => pc2a, g4q_n => pc3a, g4a => \-pcb3\, g5q_n => pc4a, g5a => \-pcb4\, g6q_n => pc5a, g6a => \-pcb5\);
  iram00_1e21 : am2147 port map(a0   => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i5, we_n => \-iwea\, ce_n => \-ice0a\, di => iwr5, a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a, a6 => pc6a);
  iram00_1e22 : am2147 port map(a0   => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i6, we_n => \-iwea\, ce_n => \-ice0a\, di => iwr6, a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a, a6 => pc6a);
  iram00_1e23 : am2147 port map(a0   => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i7, we_n => \-iwea\, ce_n => \-ice0a\, di => iwr7, a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a, a6 => pc6a);
  iram00_1e24 : am2147 port map(a0   => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i8, we_n => \-iwea\, ce_n => \-ice0a\, di => iwr8, a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a, a6 => pc6a);
  iram00_1e25 : am2147 port map(a0   => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i9, we_n => \-iwea\, ce_n => \-ice0a\, di => iwr9, a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a, a6 => pc6a);
  iram00_1f21 : am2147 port map(a0   => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i0, we_n => \-iwea\, ce_n => \-ice0a\, di => iwr0, a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a, a6 => pc6a);
  iram00_1f22 : am2147 port map(a0   => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i1, we_n => \-iwea\, ce_n => \-ice0a\, di => iwr1, a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a, a6 => pc6a);
  iram00_1f23 : am2147 port map(a0   => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i2, we_n => \-iwea\, ce_n => \-ice0a\, di => iwr2, a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a, a6 => pc6a);
  iram00_1f24 : am2147 port map(a0   => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i3, we_n => \-iwea\, ce_n => \-ice0a\, di => iwr3, a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a, a6 => pc6a);
  iram00_1f25 : am2147 port map(a0   => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i4, we_n => \-iwea\, ce_n => \-ice0a\, di => iwr4, a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a, a6 => pc6a);
end architecture;
