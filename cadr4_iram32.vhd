library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_iram32 is
  port (
    pc0o     : out std_logic;
    pc1o     : out std_logic;
    pc2o     : out std_logic;
    pc3o     : out std_logic;
    pc4o     : out std_logic;
    pc5o     : out std_logic;
    i44      : out std_logic;
    \-iweo\  : in  std_logic;
    \-ice2d\ : in  std_logic;
    iwr44    : in  std_logic;
    pc11o    : out std_logic;
    pc10o    : out std_logic;
    pc9o     : out std_logic;
    pc8o     : out std_logic;
    pc7o     : out std_logic;
    pc6o     : out std_logic;
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

architecture ttl of cadr4_iram32 is
begin
  iram32_2a21 : am2147 port map(a0   => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i44, we_n => \-iweo\, ce_n => \-ice2d\, di => iwr44, a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o, a6 => pc6o);
  iram32_2a22 : am2147 port map(a0   => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i45, we_n => \-iweo\, ce_n => \-ice2d\, di => iwr45, a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o, a6 => pc6o);
  iram32_2a23 : am2147 port map(a0   => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i46, we_n => \-iweo\, ce_n => \-ice2d\, di => iwr46, a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o, a6 => pc6o);
  iram32_2a24 : am2147 port map(a0   => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i47, we_n => \-iweo\, ce_n => \-ice2d\, di => iwr47, a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o, a6 => pc6o);
  iram32_2a25 : am2147 port map(a0   => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i48, we_n => \-iweo\, ce_n => \-ice2d\, di => iwr48, a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o, a6 => pc6o);
  iram32_2b21 : am2147 port map(a0   => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i39, we_n => \-iweo\, ce_n => \-ice2d\, di => iwr39, a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o, a6 => pc6o);
  iram32_2b22 : am2147 port map(a0   => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i40, we_n => \-iweo\, ce_n => \-ice2d\, di => iwr40, a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o, a6 => pc6o);
  iram32_2b23 : am2147 port map(a0   => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i41, we_n => \-iweo\, ce_n => \-ice2d\, di => iwr41, a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o, a6 => pc6o);
  iram32_2b24 : am2147 port map(a0   => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i42, we_n => \-iweo\, ce_n => \-ice2d\, di => iwr42, a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o, a6 => pc6o);
  iram32_2b25 : am2147 port map(a0   => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i43, we_n => \-iweo\, ce_n => \-ice2d\, di => iwr43, a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o, a6 => pc6o);
  iram32_2c21 : sn74s04 port map(g1a => \-pcc6\, g1q_n => pc6o, g2a => \-pcc7\, g2q_n => pc7o, g3a => \-pcc8\, g3q_n => pc8o, g4q_n => pc9o, g4a => \-pcc9\, g5q_n => pc10o, g5a => \-pcc10\, g6q_n => pc11o, g6a => \-pcc11\);
  iram32_2c22 : sn74s04 port map(g1a => \-pcc0\, g1q_n => pc0o, g2a => \-pcc1\, g2q_n => pc1o, g3a => \-pcc2\, g3q_n => pc2o, g4q_n => pc3o, g4a => \-pcc3\, g5q_n => pc4o, g5a => \-pcc4\, g6q_n => pc5o, g6a => \-pcc5\);
  iram32_2c23 : am2147 port map(a0   => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i36, we_n => \-iweo\, ce_n => \-ice2d\, di => iwr36, a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o, a6 => pc6o);
  iram32_2c24 : am2147 port map(a0   => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i37, we_n => \-iweo\, ce_n => \-ice2d\, di => iwr37, a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o, a6 => pc6o);
  iram32_2c25 : am2147 port map(a0   => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i38, we_n => \-iweo\, ce_n => \-ice2d\, di => iwr38, a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o, a6 => pc6o);
end architecture;
