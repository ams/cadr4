library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_iram30 is
  port (
    pc0m     : out std_logic;
    pc1m     : out std_logic;
    pc2m     : out std_logic;
    pc3m     : out std_logic;
    pc4m     : out std_logic;
    pc5m     : out std_logic;
    i44      : out std_logic;
    \-iwem\  : in  std_logic;
    \-ice0d\ : in  std_logic;
    iwr44    : in  std_logic;
    pc11m    : out std_logic;
    pc10m    : out std_logic;
    pc9m     : out std_logic;
    pc8m     : out std_logic;
    pc7m     : out std_logic;
    pc6m     : out std_logic;
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

architecture ttl of cadr4_iram30 is
begin
  iram30_2a11 : am2147 port map(a0   => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i44, we_n => \-iwem\, ce_n => \-ice0d\, di => iwr44, a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m, a6 => pc6m);
  iram30_2a12 : am2147 port map(a0   => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i45, we_n => \-iwem\, ce_n => \-ice0d\, di => iwr45, a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m, a6 => pc6m);
  iram30_2a13 : am2147 port map(a0   => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i46, we_n => \-iwem\, ce_n => \-ice0d\, di => iwr46, a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m, a6 => pc6m);
  iram30_2a14 : am2147 port map(a0   => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i47, we_n => \-iwem\, ce_n => \-ice0d\, di => iwr47, a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m, a6 => pc6m);
  iram30_2a15 : am2147 port map(a0   => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i48, we_n => \-iwem\, ce_n => \-ice0d\, di => iwr48, a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m, a6 => pc6m);
  iram30_2b11 : am2147 port map(a0   => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i39, we_n => \-iwem\, ce_n => \-ice0d\, di => iwr39, a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m, a6 => pc6m);
  iram30_2b12 : am2147 port map(a0   => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i40, we_n => \-iwem\, ce_n => \-ice0d\, di => iwr40, a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m, a6 => pc6m);
  iram30_2b13 : am2147 port map(a0   => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i41, we_n => \-iwem\, ce_n => \-ice0d\, di => iwr41, a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m, a6 => pc6m);
  iram30_2b14 : am2147 port map(a0   => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i42, we_n => \-iwem\, ce_n => \-ice0d\, di => iwr42, a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m, a6 => pc6m);
  iram30_2b15 : am2147 port map(a0   => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i43, we_n => \-iwem\, ce_n => \-ice0d\, di => iwr43, a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m, a6 => pc6m);
  iram30_2c11 : sn74s04 port map(g1a => \-pcc6\, g1q_n => pc6m, g2a => \-pcc7\, g2q_n => pc7m, g3a => \-pcc8\, g3q_n => pc8m, g4q_n => pc9m, g4a => \-pcc9\, g5q_n => pc10m, g5a => \-pcc10\, g6q_n => pc11m, g6a => \-pcc11\);
  iram30_2c12 : sn74s04 port map(g1a => \-pcc0\, g1q_n => pc0m, g2a => \-pcc1\, g2q_n => pc1m, g3a => \-pcc2\, g3q_n => pc2m, g4q_n => pc3m, g4a => \-pcc3\, g5q_n => pc4m, g5a => \-pcc4\, g6q_n => pc5m, g6a => \-pcc5\);
  iram30_2c13 : am2147 port map(a0   => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i36, we_n => \-iwem\, ce_n => \-ice0d\, di => iwr36, a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m, a6 => pc6m);
  iram30_2c14 : am2147 port map(a0   => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i37, we_n => \-iwem\, ce_n => \-ice0d\, di => iwr37, a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m, a6 => pc6m);
  iram30_2c15 : am2147 port map(a0   => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i38, we_n => \-iwem\, ce_n => \-ice0d\, di => iwr38, a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m, a6 => pc6m);
end architecture;
