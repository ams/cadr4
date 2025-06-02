library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr;
use cadr.utilities.all;

entity cadr_iram12 is
  port (
    pc0g     : out std_logic;
    pc1g     : out std_logic;
    pc2g     : out std_logic;
    pc3g     : out std_logic;
    pc4g     : out std_logic;
    pc5g     : out std_logic;
    i22      : out std_logic;
    \-iweg\  : in  std_logic;
    \-ice2b\ : in  std_logic;
    iwr22    : in  std_logic;
    pc11g    : out std_logic;
    pc10g    : out std_logic;
    pc9g     : out std_logic;
    pc8g     : out std_logic;
    pc7g     : out std_logic;
    pc6g     : out std_logic;
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

architecture ttl of cadr_iram12 is
begin
  iram12_2d21 : am2147 port map(a0   => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i22, we_n => \-iweg\, ce_n => \-ice2b\, di => iwr22, a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g, a6 => pc6g);
  iram12_2d22 : am2147 port map(a0   => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i23, we_n => \-iweg\, ce_n => \-ice2b\, di => iwr23, a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g, a6 => pc6g);
  iram12_2d23 : sn74s04 port map(g1a => \-pcb6\, g1q_n => pc6g, g2a => \-pcb7\, g2q_n => pc7g, g3a => \-pcb8\, g3q_n => pc8g, g4q_n => pc9g, g4a => \-pcb9\, g5q_n => pc10g, g5a => \-pcb10\, g6q_n => pc11g, g6a => \-pcb11\);
  iram12_2d24 : sn74s04 port map(g1a => \-pcb0\, g1q_n => pc0g, g2a => \-pcb1\, g2q_n => pc1g, g3a => \-pcb2\, g3q_n => pc2g, g4q_n => pc3g, g4a => \-pcb3\, g5q_n => pc4g, g5a => \-pcb4\, g6q_n => pc5g, g6a => \-pcb5\);
  iram12_2e21 : am2147 port map(a0   => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i17, we_n => \-iweg\, ce_n => \-ice2b\, di => iwr17, a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g, a6 => pc6g);
  iram12_2e22 : am2147 port map(a0   => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i18, we_n => \-iweg\, ce_n => \-ice2b\, di => iwr18, a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g, a6 => pc6g);
  iram12_2e23 : am2147 port map(a0   => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i19, we_n => \-iweg\, ce_n => \-ice2b\, di => iwr19, a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g, a6 => pc6g);
  iram12_2e24 : am2147 port map(a0   => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i20, we_n => \-iweg\, ce_n => \-ice2b\, di => iwr20, a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g, a6 => pc6g);
  iram12_2e25 : am2147 port map(a0   => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i21, we_n => \-iweg\, ce_n => \-ice2b\, di => iwr21, a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g, a6 => pc6g);
  iram12_2f21 : am2147 port map(a0   => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i12, we_n => \-iweg\, ce_n => \-ice2b\, di => iwr12, a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g, a6 => pc6g);
  iram12_2f22 : am2147 port map(a0   => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i13, we_n => \-iweg\, ce_n => \-ice2b\, di => iwr13, a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g, a6 => pc6g);
  iram12_2f23 : am2147 port map(a0   => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i14, we_n => \-iweg\, ce_n => \-ice2b\, di => iwr14, a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g, a6 => pc6g);
  iram12_2f24 : am2147 port map(a0   => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i15, we_n => \-iweg\, ce_n => \-ice2b\, di => iwr15, a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g, a6 => pc6g);
  iram12_2f25 : am2147 port map(a0   => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i16, we_n => \-iweg\, ce_n => \-ice2b\, di => iwr16, a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g, a6 => pc6g);
end architecture;
