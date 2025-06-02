library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr;
use cadr.utilities.all;

entity cadr_iram31 is
  port (
    pc0n     : out std_logic;
    pc1n     : out std_logic;
    pc2n     : out std_logic;
    pc3n     : out std_logic;
    pc4n     : out std_logic;
    pc5n     : out std_logic;
    i44      : out std_logic;
    \-iwen\  : in  std_logic;
    \-ice1d\ : in  std_logic;
    iwr44    : in  std_logic;
    pc11n    : out std_logic;
    pc10n    : out std_logic;
    pc9n     : out std_logic;
    pc8n     : out std_logic;
    pc7n     : out std_logic;
    pc6n     : out std_logic;
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

architecture ttl of cadr_iram31 is
begin
  iram31_2a16 : am2147 port map(a0   => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i44, we_n => \-iwen\, ce_n => \-ice1d\, di => iwr44, a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n, a6 => pc6n);
  iram31_2a17 : am2147 port map(a0   => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i45, we_n => \-iwen\, ce_n => \-ice1d\, di => iwr45, a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n, a6 => pc6n);
  iram31_2a18 : am2147 port map(a0   => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i46, we_n => \-iwen\, ce_n => \-ice1d\, di => iwr46, a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n, a6 => pc6n);
  iram31_2a19 : am2147 port map(a0   => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i47, we_n => \-iwen\, ce_n => \-ice1d\, di => iwr47, a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n, a6 => pc6n);
  iram31_2a20 : am2147 port map(a0   => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i48, we_n => \-iwen\, ce_n => \-ice1d\, di => iwr48, a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n, a6 => pc6n);
  iram31_2b16 : am2147 port map(a0   => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i39, we_n => \-iwen\, ce_n => \-ice1d\, di => iwr39, a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n, a6 => pc6n);
  iram31_2b17 : am2147 port map(a0   => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i40, we_n => \-iwen\, ce_n => \-ice1d\, di => iwr40, a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n, a6 => pc6n);
  iram31_2b18 : am2147 port map(a0   => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i41, we_n => \-iwen\, ce_n => \-ice1d\, di => iwr41, a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n, a6 => pc6n);
  iram31_2b19 : am2147 port map(a0   => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i42, we_n => \-iwen\, ce_n => \-ice1d\, di => iwr42, a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n, a6 => pc6n);
  iram31_2b20 : am2147 port map(a0   => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i43, we_n => \-iwen\, ce_n => \-ice1d\, di => iwr43, a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n, a6 => pc6n);
  iram31_2c16 : sn74s04 port map(g1a => \-pcc6\, g1q_n => pc6n, g2a => \-pcc7\, g2q_n => pc7n, g3a => \-pcc8\, g3q_n => pc8n, g4q_n => pc9n, g4a => \-pcc9\, g5q_n => pc10n, g5a => \-pcc10\, g6q_n => pc11n, g6a => \-pcc11\);
  iram31_2c17 : sn74s04 port map(g1a => \-pcc0\, g1q_n => pc0n, g2a => \-pcc1\, g2q_n => pc1n, g3a => \-pcc2\, g3q_n => pc2n, g4q_n => pc3n, g4a => \-pcc3\, g5q_n => pc4n, g5a => \-pcc4\, g6q_n => pc5n, g6a => \-pcc5\);
  iram31_2c18 : am2147 port map(a0   => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i36, we_n => \-iwen\, ce_n => \-ice1d\, di => iwr36, a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n, a6 => pc6n);
  iram31_2c19 : am2147 port map(a0   => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i37, we_n => \-iwen\, ce_n => \-ice1d\, di => iwr37, a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n, a6 => pc6n);
  iram31_2c20 : am2147 port map(a0   => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i38, we_n => \-iwen\, ce_n => \-ice1d\, di => iwr38, a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n, a6 => pc6n);
end architecture;
