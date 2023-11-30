library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_iram22 is
  port (
    pc0k     : out std_logic;
    pc1k     : out std_logic;
    pc2k     : out std_logic;
    pc3k     : out std_logic;
    pc4k     : out std_logic;
    pc5k     : out std_logic;
    i31      : out std_logic;
    \-iwek\  : in  std_logic;
    \-ice2c\ : in  std_logic;
    iwr31    : in  std_logic;
    pc11k    : out std_logic;
    pc10k    : out std_logic;
    pc9k     : out std_logic;
    pc8k     : out std_logic;
    pc7k     : out std_logic;
    pc6k     : out std_logic;
    i32      : out std_logic;
    iwr32    : in  std_logic;
    i33      : out std_logic;
    iwr33    : in  std_logic;
    i34      : out std_logic;
    iwr34    : in  std_logic;
    i35      : out std_logic;
    iwr35    : in  std_logic;
    i26      : out std_logic;
    iwr26    : in  std_logic;
    i27      : out std_logic;
    iwr27    : in  std_logic;
    i28      : out std_logic;
    iwr28    : in  std_logic;
    i29      : out std_logic;
    iwr29    : in  std_logic;
    i30      : out std_logic;
    iwr30    : in  std_logic;
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
    i24      : out std_logic;
    iwr24    : in  std_logic;
    i25      : out std_logic;
    iwr25    : in  std_logic);
end;

architecture ttl of cadr4_iram22 is
begin
  iram22_2a01 : am2147 port map(a0   => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i31, we_n => \-iwek\, ce_n => \-ice2c\, di => iwr31, a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k, a6 => pc6k);
  iram22_2a02 : am2147 port map(a0   => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i32, we_n => \-iwek\, ce_n => \-ice2c\, di => iwr32, a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k, a6 => pc6k);
  iram22_2a03 : am2147 port map(a0   => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i33, we_n => \-iwek\, ce_n => \-ice2c\, di => iwr33, a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k, a6 => pc6k);
  iram22_2a04 : am2147 port map(a0   => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i34, we_n => \-iwek\, ce_n => \-ice2c\, di => iwr34, a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k, a6 => pc6k);
  iram22_2a05 : am2147 port map(a0   => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i35, we_n => \-iwek\, ce_n => \-ice2c\, di => iwr35, a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k, a6 => pc6k);
  iram22_2b01 : am2147 port map(a0   => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i26, we_n => \-iwek\, ce_n => \-ice2c\, di => iwr26, a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k, a6 => pc6k);
  iram22_2b02 : am2147 port map(a0   => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i27, we_n => \-iwek\, ce_n => \-ice2c\, di => iwr27, a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k, a6 => pc6k);
  iram22_2b03 : am2147 port map(a0   => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i28, we_n => \-iwek\, ce_n => \-ice2c\, di => iwr28, a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k, a6 => pc6k);
  iram22_2b04 : am2147 port map(a0   => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i29, we_n => \-iwek\, ce_n => \-ice2c\, di => iwr29, a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k, a6 => pc6k);
  iram22_2b05 : am2147 port map(a0   => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i30, we_n => \-iwek\, ce_n => \-ice2c\, di => iwr30, a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k, a6 => pc6k);
  iram22_2c02 : sn74s04 port map(g1a => \-pcc6\, g1q_n => pc6k, g2a => \-pcc7\, g2q_n => pc7k, g3a => \-pcc8\, g3q_n => pc8k, g4q_n => pc9k, g4a => \-pcc9\, g5q_n => pc10k, g5a => \-pcc10\, g6q_n => pc11k, g6a => \-pcc11\);
  iram22_2c03 : sn74s04 port map(g1a => \-pcc0\, g1q_n => pc0k, g2a => \-pcc1\, g2q_n => pc1k, g3a => \-pcc2\, g3q_n => pc2k, g4q_n => pc3k, g4a => \-pcc3\, g5q_n => pc4k, g5a => \-pcc4\, g6q_n => pc5k, g6a => \-pcc5\);
  iram22_2c04 : am2147 port map(a0   => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i24, we_n => \-iwek\, ce_n => \-ice2c\, di => iwr24, a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k, a6 => pc6k);
  iram22_2c05 : am2147 port map(a0   => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i25, we_n => \-iwek\, ce_n => \-ice2c\, di => iwr25, a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k, a6 => pc6k);
end architecture;
