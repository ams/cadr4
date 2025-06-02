library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr;
use cadr.utilities.all;

entity cadr_iram33 is
  port (
    pc0p     : out std_logic;
    pc1p     : out std_logic;
    pc2p     : out std_logic;
    pc3p     : out std_logic;
    pc4p     : out std_logic;
    pc5p     : out std_logic;
    i44      : out std_logic;
    \-iwep\  : in  std_logic;
    \-ice3d\ : in  std_logic;
    iwr44    : in  std_logic;
    pc11p    : out std_logic;
    pc10p    : out std_logic;
    pc9p     : out std_logic;
    pc8p     : out std_logic;
    pc7p     : out std_logic;
    pc6p     : out std_logic;
    i45      : out std_logic;
    iwr45    : in  std_logic;
    i46      : out std_logic;
    iwr46    : in  std_logic;
    i47      : out std_logic;
    iwr47    : in  std_logic;
    i48      : out std_logic;
    iwr48    : in  std_logic;
    i39      : out std_logic;
    iwr39    : in  std_logic;
    i40      : out std_logic;
    iwr40    : in  std_logic;
    i41      : out std_logic;
    iwr41    : in  std_logic;
    i42      : out std_logic;
    iwr42    : in  std_logic;
    i43      : out std_logic;
    iwr43    : in  std_logic;
    \-pcc6\  : in  std_logic;
    \-pcc7\  : in  std_logic;
    \-pcc8\  : in  std_logic;
    \-pcc9\  : in  std_logic;
    \-pcc10\ : in  std_logic;
    \-pcc11\ : in  std_logic;
    \-pcc0\  : in  std_logic;
    \-pcc1\  : in  std_logic;
    \-pcc2\  : in  std_logic;
    \-pcc3\  : in  std_logic;
    \-pcc4\  : in  std_logic;
    \-pcc5\  : in  std_logic;
    i36      : out std_logic;
    iwr36    : in  std_logic;
    i37      : out std_logic;
    iwr37    : in  std_logic;
    i38      : out std_logic;
    iwr38    : in  std_logic);
end;

architecture ttl of cadr_iram33 is
begin
  iram33_2a26 : am2147 port map(a0   => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i44, we_n => \-iwep\, ce_n => \-ice3d\, di => iwr44, a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p, a6 => pc6p);
  iram33_2a27 : am2147 port map(a0   => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i45, we_n => \-iwep\, ce_n => \-ice3d\, di => iwr45, a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p, a6 => pc6p);
  iram33_2a28 : am2147 port map(a0   => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i46, we_n => \-iwep\, ce_n => \-ice3d\, di => iwr46, a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p, a6 => pc6p);
  iram33_2a29 : am2147 port map(a0   => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i47, we_n => \-iwep\, ce_n => \-ice3d\, di => iwr47, a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p, a6 => pc6p);
  iram33_2a30 : am2147 port map(a0   => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i48, we_n => \-iwep\, ce_n => \-ice3d\, di => iwr48, a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p, a6 => pc6p);
  iram33_2b26 : am2147 port map(a0   => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i39, we_n => \-iwep\, ce_n => \-ice3d\, di => iwr39, a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p, a6 => pc6p);
  iram33_2b27 : am2147 port map(a0   => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i40, we_n => \-iwep\, ce_n => \-ice3d\, di => iwr40, a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p, a6 => pc6p);
  iram33_2b28 : am2147 port map(a0   => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i41, we_n => \-iwep\, ce_n => \-ice3d\, di => iwr41, a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p, a6 => pc6p);
  iram33_2b29 : am2147 port map(a0   => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i42, we_n => \-iwep\, ce_n => \-ice3d\, di => iwr42, a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p, a6 => pc6p);
  iram33_2b30 : am2147 port map(a0   => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i43, we_n => \-iwep\, ce_n => \-ice3d\, di => iwr43, a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p, a6 => pc6p);
  iram33_2c26 : sn74s04 port map(g1a => \-pcc6\, g1q_n => pc6p, g2a => \-pcc7\, g2q_n => pc7p, g3a => \-pcc8\, g3q_n => pc8p, g4q_n => pc9p, g4a => \-pcc9\, g5q_n => pc10p, g5a => \-pcc10\, g6q_n => pc11p, g6a => \-pcc11\);
  iram33_2c27 : sn74s04 port map(g1a => \-pcc0\, g1q_n => pc0p, g2a => \-pcc1\, g2q_n => pc1p, g3a => \-pcc2\, g3q_n => pc2p, g4q_n => pc3p, g4a => \-pcc3\, g5q_n => pc4p, g5a => \-pcc4\, g6q_n => pc5p, g6a => \-pcc5\);
  iram33_2c28 : am2147 port map(a0   => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i36, we_n => \-iwep\, ce_n => \-ice3d\, di => iwr36, a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p, a6 => pc6p);
  iram33_2c29 : am2147 port map(a0   => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i37, we_n => \-iwep\, ce_n => \-ice3d\, di => iwr37, a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p, a6 => pc6p);
  iram33_2c30 : am2147 port map(a0   => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i38, we_n => \-iwep\, ce_n => \-ice3d\, di => iwr38, a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p, a6 => pc6p);
end architecture;
