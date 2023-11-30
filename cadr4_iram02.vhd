library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_iram02 is
  port (
    pc0c     : out std_logic;
    pc1c     : out std_logic;
    pc2c     : out std_logic;
    pc3c     : out std_logic;
    pc4c     : out std_logic;
    pc5c     : out std_logic;
    i10      : out std_logic;
    \-iwec\  : in  std_logic;
    \-ice2a\ : in  std_logic;
    iwr10    : in  std_logic;
    pc11c    : out std_logic;
    pc10c    : out std_logic;
    pc9c     : out std_logic;
    pc8c     : out std_logic;
    pc7c     : out std_logic;
    pc6c     : out std_logic;
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

architecture ttl of cadr4_iram02 is
begin
  iram02_2d01 : am2147 port map(a0   => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i10, we_n => \-iwec\, ce_n => \-ice2a\, di => iwr10, a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c, a6 => pc6c);
  iram02_2d02 : am2147 port map(a0   => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i11, we_n => \-iwec\, ce_n => \-ice2a\, di => iwr11, a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c, a6 => pc6c);
  iram02_2d03 : sn74s04 port map(g1a => \-pcb6\, g1q_n => pc6c, g2a => \-pcb7\, g2q_n => pc7c, g3a => \-pcb8\, g3q_n => pc8c, g4q_n => pc9c, g4a => \-pcb9\, g5q_n => pc10c, g5a => \-pcb10\, g6q_n => pc11c, g6a => \-pcb11\);
  iram02_2d04 : sn74s04 port map(g1a => \-pcb0\, g1q_n => pc0c, g2a => \-pcb1\, g2q_n => pc1c, g3a => \-pcb2\, g3q_n => pc2c, g4q_n => pc3c, g4a => \-pcb3\, g5q_n => pc4c, g5a => \-pcb4\, g6q_n => pc5c, g6a => \-pcb5\);
  iram02_2e01 : am2147 port map(a0   => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i5, we_n => \-iwec\, ce_n => \-ice2a\, di => iwr5, a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c, a6 => pc6c);
  iram02_2e02 : am2147 port map(a0   => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i6, we_n => \-iwec\, ce_n => \-ice2a\, di => iwr6, a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c, a6 => pc6c);
  iram02_2e03 : am2147 port map(a0   => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i7, we_n => \-iwec\, ce_n => \-ice2a\, di => iwr7, a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c, a6 => pc6c);
  iram02_2e04 : am2147 port map(a0   => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i8, we_n => \-iwec\, ce_n => \-ice2a\, di => iwr8, a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c, a6 => pc6c);
  iram02_2e05 : am2147 port map(a0   => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i9, we_n => \-iwec\, ce_n => \-ice2a\, di => iwr9, a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c, a6 => pc6c);
  iram02_2f01 : am2147 port map(a0   => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i0, we_n => \-iwec\, ce_n => \-ice2a\, di => iwr0, a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c, a6 => pc6c);
  iram02_2f02 : am2147 port map(a0   => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i1, we_n => \-iwec\, ce_n => \-ice2a\, di => iwr1, a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c, a6 => pc6c);
  iram02_2f03 : am2147 port map(a0   => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i2, we_n => \-iwec\, ce_n => \-ice2a\, di => iwr2, a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c, a6 => pc6c);
  iram02_2f04 : am2147 port map(a0   => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i3, we_n => \-iwec\, ce_n => \-ice2a\, di => iwr3, a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c, a6 => pc6c);
  iram02_2f05 : am2147 port map(a0   => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i4, we_n => \-iwec\, ce_n => \-ice2a\, di => iwr4, a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c, a6 => pc6c);
end architecture;
