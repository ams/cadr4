library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr;
use cadr.utilities.all;

entity cadr_iram10 is
  port (
    pc0e     : out std_logic;
    pc1e     : out std_logic;
    pc2e     : out std_logic;
    pc3e     : out std_logic;
    pc4e     : out std_logic;
    pc5e     : out std_logic;
    i22      : out std_logic;
    \-iwee\  : in  std_logic;
    \-ice0b\ : in  std_logic;
    iwr22    : in  std_logic;
    pc11e    : out std_logic;
    pc10e    : out std_logic;
    pc9e     : out std_logic;
    pc8e     : out std_logic;
    pc7e     : out std_logic;
    pc6e     : out std_logic;
    i23      : out std_logic;
    iwr23    : in  std_logic;
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
    i17      : out std_logic;
    iwr17    : in  std_logic;
    i18      : out std_logic;
    iwr18    : in  std_logic;
    i19      : out std_logic;
    iwr19    : in  std_logic;
    i20      : out std_logic;
    iwr20    : in  std_logic;
    i21      : out std_logic;
    iwr21    : in  std_logic;
    i12      : out std_logic;
    iwr12    : in  std_logic;
    i13      : out std_logic;
    iwr13    : in  std_logic;
    i14      : out std_logic;
    iwr14    : in  std_logic;
    i15      : out std_logic;
    iwr15    : in  std_logic;
    i16      : out std_logic;
    iwr16    : in  std_logic);
end;

architecture ttl of cadr_iram10 is
begin
  iram10_2d11 : am2147 port map(a0   => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i22, we_n => \-iwee\, ce_n => \-ice0b\, di => iwr22, a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e, a6 => pc6e);
  iram10_2d12 : am2147 port map(a0   => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i23, we_n => \-iwee\, ce_n => \-ice0b\, di => iwr23, a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e, a6 => pc6e);
  iram10_2d13 : sn74s04 port map(g1a => \-pcb6\, g1q_n => pc6e, g2a => \-pcb7\, g2q_n => pc7e, g3a => \-pcb8\, g3q_n => pc8e, g4q_n => pc9e, g4a => \-pcb9\, g5q_n => pc10e, g5a => \-pcb10\, g6q_n => pc11e, g6a => \-pcb11\);
  iram10_2d14 : sn74s04 port map(g1a => \-pcb0\, g1q_n => pc0e, g2a => \-pcb1\, g2q_n => pc1e, g3a => \-pcb2\, g3q_n => pc2e, g4q_n => pc3e, g4a => \-pcb3\, g5q_n => pc4e, g5a => \-pcb4\, g6q_n => pc5e, g6a => \-pcb5\);
  iram10_2e11 : am2147 port map(a0   => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i17, we_n => \-iwee\, ce_n => \-ice0b\, di => iwr17, a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e, a6 => pc6e);
  iram10_2e12 : am2147 port map(a0   => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i18, we_n => \-iwee\, ce_n => \-ice0b\, di => iwr18, a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e, a6 => pc6e);
  iram10_2e13 : am2147 port map(a0   => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i19, we_n => \-iwee\, ce_n => \-ice0b\, di => iwr19, a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e, a6 => pc6e);
  iram10_2e14 : am2147 port map(a0   => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i20, we_n => \-iwee\, ce_n => \-ice0b\, di => iwr20, a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e, a6 => pc6e);
  iram10_2e15 : am2147 port map(a0   => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i21, we_n => \-iwee\, ce_n => \-ice0b\, di => iwr21, a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e, a6 => pc6e);
  iram10_2f11 : am2147 port map(a0   => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i12, we_n => \-iwee\, ce_n => \-ice0b\, di => iwr12, a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e, a6 => pc6e);
  iram10_2f12 : am2147 port map(a0   => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i13, we_n => \-iwee\, ce_n => \-ice0b\, di => iwr13, a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e, a6 => pc6e);
  iram10_2f13 : am2147 port map(a0   => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i14, we_n => \-iwee\, ce_n => \-ice0b\, di => iwr14, a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e, a6 => pc6e);
  iram10_2f14 : am2147 port map(a0   => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i15, we_n => \-iwee\, ce_n => \-ice0b\, di => iwr15, a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e, a6 => pc6e);
  iram10_2f15 : am2147 port map(a0   => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i16, we_n => \-iwee\, ce_n => \-ice0b\, di => iwr16, a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e, a6 => pc6e);
end architecture;
