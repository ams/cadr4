library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_iram11 is
  port (
    pc0f     : out std_logic;
    pc1f     : out std_logic;
    pc2f     : out std_logic;
    pc3f     : out std_logic;
    pc4f     : out std_logic;
    pc5f     : out std_logic;
    i22      : out std_logic;
    \-iwef\  : in  std_logic;
    \-ice1b\ : in  std_logic;
    iwr22    : in  std_logic;
    pc11f    : out std_logic;
    pc10f    : out std_logic;
    pc9f     : out std_logic;
    pc8f     : out std_logic;
    pc7f     : out std_logic;
    pc6f     : out std_logic;
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

architecture ttl of cadr4_iram11 is
begin
  iram11_2d16 : am2147 port map(a0   => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i22, we_n => \-iwef\, ce_n => \-ice1b\, di => iwr22, a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f, a6 => pc6f);
  iram11_2d17 : am2147 port map(a0   => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i23, we_n => \-iwef\, ce_n => \-ice1b\, di => iwr23, a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f, a6 => pc6f);
  iram11_2d18 : sn74s04 port map(g1a => \-pcb6\, g1q_n => pc6f, g2a => \-pcb7\, g2q_n => pc7f, g3a => \-pcb8\, g3q_n => pc8f, g4q_n => pc9f, g4a => \-pcb9\, g5q_n => pc10f, g5a => \-pcb10\, g6q_n => pc11f, g6a => \-pcb11\);
  iram11_2d19 : sn74s04 port map(g1a => \-pcb0\, g1q_n => pc0f, g2a => \-pcb1\, g2q_n => pc1f, g3a => \-pcb2\, g3q_n => pc2f, g4q_n => pc3f, g4a => \-pcb3\, g5q_n => pc4f, g5a => \-pcb4\, g6q_n => pc5f, g6a => \-pcb5\);
  iram11_2e16 : am2147 port map(a0   => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i17, we_n => \-iwef\, ce_n => \-ice1b\, di => iwr17, a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f, a6 => pc6f);
  iram11_2e17 : am2147 port map(a0   => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i18, we_n => \-iwef\, ce_n => \-ice1b\, di => iwr18, a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f, a6 => pc6f);
  iram11_2e18 : am2147 port map(a0   => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i19, we_n => \-iwef\, ce_n => \-ice1b\, di => iwr19, a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f, a6 => pc6f);
  iram11_2e19 : am2147 port map(a0   => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i20, we_n => \-iwef\, ce_n => \-ice1b\, di => iwr20, a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f, a6 => pc6f);
  iram11_2e20 : am2147 port map(a0   => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i21, we_n => \-iwef\, ce_n => \-ice1b\, di => iwr21, a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f, a6 => pc6f);
  iram11_2f16 : am2147 port map(a0   => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i12, we_n => \-iwef\, ce_n => \-ice1b\, di => iwr12, a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f, a6 => pc6f);
  iram11_2f17 : am2147 port map(a0   => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i13, we_n => \-iwef\, ce_n => \-ice1b\, di => iwr13, a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f, a6 => pc6f);
  iram11_2f18 : am2147 port map(a0   => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i14, we_n => \-iwef\, ce_n => \-ice1b\, di => iwr14, a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f, a6 => pc6f);
  iram11_2f19 : am2147 port map(a0   => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i15, we_n => \-iwef\, ce_n => \-ice1b\, di => iwr15, a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f, a6 => pc6f);
  iram11_2f20 : am2147 port map(a0   => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i16, we_n => \-iwef\, ce_n => \-ice1b\, di => iwr16, a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f, a6 => pc6f);
end architecture;
