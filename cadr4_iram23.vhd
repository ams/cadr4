library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_iram23 is
  port (
    pc0l     : out std_logic;
    pc1l     : out std_logic;
    pc2l     : out std_logic;
    pc3l     : out std_logic;
    pc4l     : out std_logic;
    pc5l     : out std_logic;
    i31      : out std_logic;
    \-iwel\  : in  std_logic;
    \-ice3c\ : in  std_logic;
    iwr31    : in  std_logic;
    pc11l    : out std_logic;
    pc10l    : out std_logic;
    pc9l     : out std_logic;
    pc8l     : out std_logic;
    pc7l     : out std_logic;
    pc6l     : out std_logic;
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

architecture ttl of cadr4_iram23 is
begin
  iram23_2a06 : am2147 port map(a0   => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i31, we_n => \-iwel\, ce_n => \-ice3c\, di => iwr31, a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l, a6 => pc6l);
  iram23_2a07 : am2147 port map(a0   => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i32, we_n => \-iwel\, ce_n => \-ice3c\, di => iwr32, a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l, a6 => pc6l);
  iram23_2a08 : am2147 port map(a0   => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i33, we_n => \-iwel\, ce_n => \-ice3c\, di => iwr33, a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l, a6 => pc6l);
  iram23_2a09 : am2147 port map(a0   => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i34, we_n => \-iwel\, ce_n => \-ice3c\, di => iwr34, a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l, a6 => pc6l);
  iram23_2a10 : am2147 port map(a0   => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i35, we_n => \-iwel\, ce_n => \-ice3c\, di => iwr35, a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l, a6 => pc6l);
  iram23_2b06 : am2147 port map(a0   => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i26, we_n => \-iwel\, ce_n => \-ice3c\, di => iwr26, a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l, a6 => pc6l);
  iram23_2b07 : am2147 port map(a0   => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i27, we_n => \-iwel\, ce_n => \-ice3c\, di => iwr27, a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l, a6 => pc6l);
  iram23_2b08 : am2147 port map(a0   => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i28, we_n => \-iwel\, ce_n => \-ice3c\, di => iwr28, a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l, a6 => pc6l);
  iram23_2b09 : am2147 port map(a0   => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i29, we_n => \-iwel\, ce_n => \-ice3c\, di => iwr29, a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l, a6 => pc6l);
  iram23_2b10 : am2147 port map(a0   => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i30, we_n => \-iwel\, ce_n => \-ice3c\, di => iwr30, a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l, a6 => pc6l);
  iram23_2c07 : sn74s04 port map(g1a => \-pcc6\, g1q_n => pc6l, g2a => \-pcc7\, g2q_n => pc7l, g3a => \-pcc8\, g3q_n => pc8l, g4q_n => pc9l, g4a => \-pcc9\, g5q_n => pc10l, g5a => \-pcc10\, g6q_n => pc11l, g6a => \-pcc11\);
  iram23_2c08 : sn74s04 port map(g1a => \-pcc0\, g1q_n => pc0l, g2a => \-pcc1\, g2q_n => pc1l, g3a => \-pcc2\, g3q_n => pc2l, g4q_n => pc3l, g4a => \-pcc3\, g5q_n => pc4l, g5a => \-pcc4\, g6q_n => pc5l, g6a => \-pcc5\);
  iram23_2c09 : am2147 port map(a0   => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i24, we_n => \-iwel\, ce_n => \-ice3c\, di => iwr24, a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l, a6 => pc6l);
  iram23_2c10 : am2147 port map(a0   => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i25, we_n => \-iwel\, ce_n => \-ice3c\, di => iwr25, a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l, a6 => pc6l);
end architecture;
