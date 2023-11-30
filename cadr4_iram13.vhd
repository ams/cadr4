library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_iram13 is
  port (
    pc0h     : out std_logic;
    pc1h     : out std_logic;
    pc2h     : out std_logic;
    pc3h     : out std_logic;
    pc4h     : out std_logic;
    pc5h     : out std_logic;
    i22      : out std_logic;
    \-iweh\  : in  std_logic;
    \-ice3b\ : in  std_logic;
    iwr22    : in  std_logic;
    pc11h    : out std_logic;
    pc10h    : out std_logic;
    pc9h     : out std_logic;
    pc8h     : out std_logic;
    pc7h     : out std_logic;
    pc6h     : out std_logic;
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

architecture ttl of cadr4_iram13 is
begin
  iram13_2d26 : am2147 port map(a0   => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i22, we_n => \-iweh\, ce_n => \-ice3b\, di => iwr22, a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h, a6 => pc6h);
  iram13_2d27 : am2147 port map(a0   => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i23, we_n => \-iweh\, ce_n => \-ice3b\, di => iwr23, a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h, a6 => pc6h);
  iram13_2d28 : sn74s04 port map(g1a => \-pcb6\, g1q_n => pc6h, g2a => \-pcb7\, g2q_n => pc7h, g3a => \-pcb8\, g3q_n => pc8h, g4q_n => pc9h, g4a => \-pcb9\, g5q_n => pc10h, g5a => \-pcb10\, g6q_n => pc11h, g6a => \-pcb11\);
  iram13_2d29 : sn74s04 port map(g1a => \-pcb0\, g1q_n => pc0h, g2a => \-pcb1\, g2q_n => pc1h, g3a => \-pcb2\, g3q_n => pc2h, g4q_n => pc3h, g4a => \-pcb3\, g5q_n => pc4h, g5a => \-pcb4\, g6q_n => pc5h, g6a => \-pcb5\);
  iram13_2e26 : am2147 port map(a0   => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i17, we_n => \-iweh\, ce_n => \-ice3b\, di => iwr17, a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h, a6 => pc6h);
  iram13_2e27 : am2147 port map(a0   => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i18, we_n => \-iweh\, ce_n => \-ice3b\, di => iwr18, a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h, a6 => pc6h);
  iram13_2e28 : am2147 port map(a0   => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i19, we_n => \-iweh\, ce_n => \-ice3b\, di => iwr19, a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h, a6 => pc6h);
  iram13_2e29 : am2147 port map(a0   => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i20, we_n => \-iweh\, ce_n => \-ice3b\, di => iwr20, a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h, a6 => pc6h);
  iram13_2e30 : am2147 port map(a0   => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i21, we_n => \-iweh\, ce_n => \-ice3b\, di => iwr21, a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h, a6 => pc6h);
  iram13_2f26 : am2147 port map(a0   => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i12, we_n => \-iweh\, ce_n => \-ice3b\, di => iwr12, a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h, a6 => pc6h);
  iram13_2f27 : am2147 port map(a0   => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i13, we_n => \-iweh\, ce_n => \-ice3b\, di => iwr13, a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h, a6 => pc6h);
  iram13_2f28 : am2147 port map(a0   => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i14, we_n => \-iweh\, ce_n => \-ice3b\, di => iwr14, a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h, a6 => pc6h);
  iram13_2f29 : am2147 port map(a0   => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i15, we_n => \-iweh\, ce_n => \-ice3b\, di => iwr15, a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h, a6 => pc6h);
  iram13_2f30 : am2147 port map(a0   => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i16, we_n => \-iweh\, ce_n => \-ice3b\, di => iwr16, a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h, a6 => pc6h);
end architecture;
