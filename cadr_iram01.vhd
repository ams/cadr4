library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr;
use cadr.utilities.all;

entity cadr_iram01 is
  port (
    pc0b     : out std_logic;
    pc1b     : out std_logic;
    pc2b     : out std_logic;
    pc3b     : out std_logic;
    pc4b     : out std_logic;
    pc5b     : out std_logic;
    i10      : out std_logic;
    \-iweb\  : in  std_logic;
    \-ice1a\ : in  std_logic;
    iwr10    : in  std_logic;
    pc11b    : out std_logic;
    pc10b    : out std_logic;
    pc9b     : out std_logic;
    pc8b     : out std_logic;
    pc7b     : out std_logic;
    pc6b     : out std_logic;
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

architecture ttl of cadr_iram01 is
begin
  iram01_1d26 : am2147 port map(a0   => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i10, we_n => \-iweb\, ce_n => \-ice1a\, di => iwr10, a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b, a6 => pc6b);
  iram01_1d27 : am2147 port map(a0   => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i11, we_n => \-iweb\, ce_n => \-ice1a\, di => iwr11, a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b, a6 => pc6b);
  iram01_1d28 : sn74s04 port map(g1a => \-pcb6\, g1q_n => pc6b, g2a => \-pcb7\, g2q_n => pc7b, g3a => \-pcb8\, g3q_n => pc8b, g4q_n => pc9b, g4a => \-pcb9\, g5q_n => pc10b, g5a => \-pcb10\, g6q_n => pc11b, g6a => \-pcb11\);
  iram01_1d29 : sn74s04 port map(g1a => \-pcb0\, g1q_n => pc0b, g2a => \-pcb1\, g2q_n => pc1b, g3a => \-pcb2\, g3q_n => pc2b, g4q_n => pc3b, g4a => \-pcb3\, g5q_n => pc4b, g5a => \-pcb4\, g6q_n => pc5b, g6a => \-pcb5\);
  iram01_1e26 : am2147 port map(a0   => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i5, we_n => \-iweb\, ce_n => \-ice1a\, di => iwr5, a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b, a6 => pc6b);
  iram01_1e27 : am2147 port map(a0   => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i6, we_n => \-iweb\, ce_n => \-ice1a\, di => iwr6, a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b, a6 => pc6b);
  iram01_1e28 : am2147 port map(a0   => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i7, we_n => \-iweb\, ce_n => \-ice1a\, di => iwr7, a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b, a6 => pc6b);
  iram01_1e29 : am2147 port map(a0   => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i8, we_n => \-iweb\, ce_n => \-ice1a\, di => iwr8, a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b, a6 => pc6b);
  iram01_1e30 : am2147 port map(a0   => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i9, we_n => \-iweb\, ce_n => \-ice1a\, di => iwr9, a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b, a6 => pc6b);
  iram01_1f26 : am2147 port map(a0   => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i0, we_n => \-iweb\, ce_n => \-ice1a\, di => iwr0, a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b, a6 => pc6b);
  iram01_1f27 : am2147 port map(a0   => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i1, we_n => \-iweb\, ce_n => \-ice1a\, di => iwr1, a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b, a6 => pc6b);
  iram01_1f28 : am2147 port map(a0   => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i2, we_n => \-iweb\, ce_n => \-ice1a\, di => iwr2, a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b, a6 => pc6b);
  iram01_1f29 : am2147 port map(a0   => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i3, we_n => \-iweb\, ce_n => \-ice1a\, di => iwr3, a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b, a6 => pc6b);
  iram01_1f30 : am2147 port map(a0   => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i4, we_n => \-iweb\, ce_n => \-ice1a\, di => iwr4, a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b, a6 => pc6b);
end architecture;
