library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr;
use cadr.utilities.all;

entity cadr_iram21 is
  port (
    pc0j     : out std_logic;
    pc1j     : out std_logic;
    pc2j     : out std_logic;
    pc3j     : out std_logic;
    pc4j     : out std_logic;
    pc5j     : out std_logic;
    i31      : out std_logic;
    \-iwej\  : in  std_logic;
    \-ice1c\ : in  std_logic;
    iwr31    : in  std_logic;
    pc11j    : out std_logic;
    pc10j    : out std_logic;
    pc9j     : out std_logic;
    pc8j     : out std_logic;
    pc7j     : out std_logic;
    pc6j     : out std_logic;
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

architecture ttl of cadr_iram21 is
begin
  iram21_1a26 : am2147 port map(a0   => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i31, we_n => \-iwej\, ce_n => \-ice1c\, di => iwr31, a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j, a6 => pc6j);
  iram21_1a27 : am2147 port map(a0   => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i32, we_n => \-iwej\, ce_n => \-ice1c\, di => iwr32, a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j, a6 => pc6j);
  iram21_1a28 : am2147 port map(a0   => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i33, we_n => \-iwej\, ce_n => \-ice1c\, di => iwr33, a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j, a6 => pc6j);
  iram21_1a29 : am2147 port map(a0   => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i34, we_n => \-iwej\, ce_n => \-ice1c\, di => iwr34, a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j, a6 => pc6j);
  iram21_1a30 : am2147 port map(a0   => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i35, we_n => \-iwej\, ce_n => \-ice1c\, di => iwr35, a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j, a6 => pc6j);
  iram21_1b26 : am2147 port map(a0   => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i26, we_n => \-iwej\, ce_n => \-ice1c\, di => iwr26, a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j, a6 => pc6j);
  iram21_1b27 : am2147 port map(a0   => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i27, we_n => \-iwej\, ce_n => \-ice1c\, di => iwr27, a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j, a6 => pc6j);
  iram21_1b28 : am2147 port map(a0   => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i28, we_n => \-iwej\, ce_n => \-ice1c\, di => iwr28, a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j, a6 => pc6j);
  iram21_1b29 : am2147 port map(a0   => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i29, we_n => \-iwej\, ce_n => \-ice1c\, di => iwr29, a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j, a6 => pc6j);
  iram21_1b30 : am2147 port map(a0   => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i30, we_n => \-iwej\, ce_n => \-ice1c\, di => iwr30, a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j, a6 => pc6j);
  iram21_1c27 : sn74s04 port map(g1a => \-pcc6\, g1q_n => pc6j, g2a => \-pcc7\, g2q_n => pc7j, g3a => \-pcc8\, g3q_n => pc8j, g4q_n => pc9j, g4a => \-pcc9\, g5q_n => pc10j, g5a => \-pcc10\, g6q_n => pc11j, g6a => \-pcc11\);
  iram21_1c28 : sn74s04 port map(g1a => \-pcc0\, g1q_n => pc0j, g2a => \-pcc1\, g2q_n => pc1j, g3a => \-pcc2\, g3q_n => pc2j, g4q_n => pc3j, g4a => \-pcc3\, g5q_n => pc4j, g5a => \-pcc4\, g6q_n => pc5j, g6a => \-pcc5\);
  iram21_1c29 : am2147 port map(a0   => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i24, we_n => \-iwej\, ce_n => \-ice1c\, di => iwr24, a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j, a6 => pc6j);
  iram21_1c30 : am2147 port map(a0   => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i25, we_n => \-iwej\, ce_n => \-ice1c\, di => iwr25, a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j, a6 => pc6j);
end architecture;
