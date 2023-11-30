library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_iram20 is
  port (
    pc0i     : out std_logic;
    pc1i     : out std_logic;
    pc2i     : out std_logic;
    pc3i     : out std_logic;
    pc4i     : out std_logic;
    pc5i     : out std_logic;
    i31      : out std_logic;
    \-iwei\  : in  std_logic;
    \-ice0c\ : in  std_logic;
    iwr31    : in  std_logic;
    pc11i    : out std_logic;
    pc10i    : out std_logic;
    pc9i     : out std_logic;
    pc8i     : out std_logic;
    pc7i     : out std_logic;
    pc6i     : out std_logic;
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

architecture ttl of cadr4_iram20 is
begin
  iram20_1a21 : am2147 port map(a0   => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i31, we_n => \-iwei\, ce_n => \-ice0c\, di => iwr31, a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i, a6 => pc6i);
  iram20_1a22 : am2147 port map(a0   => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i32, we_n => \-iwei\, ce_n => \-ice0c\, di => iwr32, a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i, a6 => pc6i);
  iram20_1a23 : am2147 port map(a0   => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i33, we_n => \-iwei\, ce_n => \-ice0c\, di => iwr33, a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i, a6 => pc6i);
  iram20_1a24 : am2147 port map(a0   => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i34, we_n => \-iwei\, ce_n => \-ice0c\, di => iwr34, a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i, a6 => pc6i);
  iram20_1a25 : am2147 port map(a0   => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i35, we_n => \-iwei\, ce_n => \-ice0c\, di => iwr35, a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i, a6 => pc6i);
  iram20_1b21 : am2147 port map(a0   => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i26, we_n => \-iwei\, ce_n => \-ice0c\, di => iwr26, a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i, a6 => pc6i);
  iram20_1b22 : am2147 port map(a0   => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i27, we_n => \-iwei\, ce_n => \-ice0c\, di => iwr27, a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i, a6 => pc6i);
  iram20_1b23 : am2147 port map(a0   => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i28, we_n => \-iwei\, ce_n => \-ice0c\, di => iwr28, a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i, a6 => pc6i);
  iram20_1b24 : am2147 port map(a0   => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i29, we_n => \-iwei\, ce_n => \-ice0c\, di => iwr29, a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i, a6 => pc6i);
  iram20_1b25 : am2147 port map(a0   => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i30, we_n => \-iwei\, ce_n => \-ice0c\, di => iwr30, a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i, a6 => pc6i);
  iram20_1c22 : sn74s04 port map(g1a => \-pcc6\, g1q_n => pc6i, g2a => \-pcc7\, g2q_n => pc7i, g3a => \-pcc8\, g3q_n => pc8i, g4q_n => pc9i, g4a => \-pcc9\, g5q_n => pc10i, g5a => \-pcc10\, g6q_n => pc11i, g6a => \-pcc11\);
  iram20_1c23 : sn74s04 port map(g1a => \-pcc0\, g1q_n => pc0i, g2a => \-pcc1\, g2q_n => pc1i, g3a => \-pcc2\, g3q_n => pc2i, g4q_n => pc3i, g4a => \-pcc3\, g5q_n => pc4i, g5a => \-pcc4\, g6q_n => pc5i, g6a => \-pcc5\);
  iram20_1c24 : am2147 port map(a0   => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i24, we_n => \-iwei\, ce_n => \-ice0c\, di => iwr24, a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i, a6 => pc6i);
  iram20_1c25 : am2147 port map(a0   => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i25, we_n => \-iwei\, ce_n => \-ice0c\, di => iwr25, a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i, a6 => pc6i);
end architecture;
