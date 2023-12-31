library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_npc is
  port (
    ipc13   : out std_logic;
    gnd     : in  std_logic;
    pc13    : out std_logic;
    ipc12   : out std_logic;
    pc12    : out std_logic;
    pccry11 : out std_logic;
    ipc9    : out std_logic;
    pc9     : out std_logic;
    ipc8    : out std_logic;
    pc8     : out std_logic;
    pccry7  : out std_logic;
    ipc11   : out std_logic;
    pc11    : out std_logic;
    ipc10   : out std_logic;
    pc10    : out std_logic;
    ipc5    : out std_logic;
    pc5     : out std_logic;
    ipc4    : out std_logic;
    pc4     : out std_logic;
    pccry3  : out std_logic;
    ipc7    : out std_logic;
    pc7     : out std_logic;
    ipc6    : out std_logic;
    pc6     : out std_logic;
    ipc1    : out std_logic;
    pc1     : out std_logic;
    ipc0    : out std_logic;
    pc0     : out std_logic;
    hi4     : in  std_logic;
    ipc3    : out std_logic;
    pc3     : out std_logic;
    ipc2    : out std_logic;
    pc2     : out std_logic;
    trapb   : in  std_logic;
    pcs1    : in  std_logic;
    dpc3    : out std_logic;
    ir15    : in  std_logic;
    spc3    : out std_logic;
    npc3    : out std_logic;
    npc2    : out std_logic;
    spc2    : out std_logic;
    ir14    : in  std_logic;
    dpc2    : out std_logic;
    pcs0    : in  std_logic;
    dpc1    : out std_logic;
    ir13    : in  std_logic;
    spc1a   : in  std_logic;
    npc1    : out std_logic;
    npc0    : out std_logic;
    spc0    : out std_logic;
    ir12    : in  std_logic;
    dpc0    : out std_logic;
    npc13   : out std_logic;
    npc12   : out std_logic;
    clk4b   : in  std_logic;
    npc11   : out std_logic;
    npc10   : out std_logic;
    npc9    : out std_logic;
    npc8    : out std_logic;
    npc7    : out std_logic;
    npc6    : out std_logic;
    npc5    : out std_logic;
    npc4    : out std_logic;
    trapa   : in  std_logic;
    dpc13   : out std_logic;
    ir25    : in  std_logic;
    spc13   : out std_logic;
    spc12   : out std_logic;
    ir24    : in  std_logic;
    dpc12   : out std_logic;
    dpc11   : out std_logic;
    ir23    : in  std_logic;
    spc11   : out std_logic;
    spc10   : out std_logic;
    ir22    : in  std_logic;
    dpc10   : out std_logic;
    dpc9    : out std_logic;
    ir21    : in  std_logic;
    spc9    : out std_logic;
    spc8    : out std_logic;
    ir20    : in  std_logic;
    dpc8    : out std_logic;
    dpc7    : out std_logic;
    ir19    : in  std_logic;
    spc7    : out std_logic;
    spc6    : out std_logic;
    ir18    : in  std_logic;
    dpc6    : out std_logic;
    dpc5    : out std_logic;
    ir17    : in  std_logic;
    spc5    : out std_logic;
    spc4    : out std_logic;
    ir16    : in  std_logic;
    dpc4    : in  std_logic);
end;

architecture ttl of cadr4_npc is
  signal nc243 : std_logic;
  signal nc244 : std_logic;
  signal nc245 : std_logic;
  signal nc246 : std_logic;
  signal nc247 : std_logic;
  signal nc248 : std_logic;
  signal nc249 : std_logic;
  signal nc250 : std_logic;
  signal nc251 : std_logic;
begin
  npc_3f26 : sn74s283 port map(s1     => ipc13, b1 => gnd, a1 => pc13, s0 => ipc12, a0 => pc12, b0 => gnd, c0 => pccry11, c4 => nc243, s3 => nc244, b3 => gnd, a3 => nc245, s2 => nc246, a2 => nc247, b2 => gnd);
  npc_3f27 : sn74s283 port map(s1     => ipc9, b1 => gnd, a1 => pc9, s0 => ipc8, a0 => pc8, b0 => gnd, c0 => pccry7, c4 => pccry11, s3 => ipc11, b3 => gnd, a3 => pc11, s2 => ipc10, a2 => pc10, b2 => gnd);
  npc_3f28 : sn74s283 port map(s1     => ipc5, b1 => gnd, a1 => pc5, s0 => ipc4, a0 => pc4, b0 => gnd, c0 => pccry3, c4 => pccry7, s3 => ipc7, b3 => gnd, a3 => pc7, s2 => ipc6, a2 => pc6, b2 => gnd);
  npc_3f29 : sn74s283 port map(s1     => ipc1, b1 => gnd, a1 => pc1, s0 => ipc0, a0 => pc0, b0 => gnd, c0 => hi4, c4 => pccry3, s3 => ipc3, b3 => gnd, a3 => pc3, s2 => ipc2, a2 => pc2, b2 => gnd);
  npc_4e01 : sn74s153 port map(enb1_n => trapb, sel1 => pcs1, g1c3 => ipc3, g1c2 => dpc3, g1c1 => ir15, g1c0 => spc3, g1q => npc3, g2q => npc2, g2c0 => spc2, g2c1 => ir14, g2c2 => dpc2, g2c3 => ipc2, sel0 => pcs0, enb2_n => trapb);
  npc_4e02 : sn74s153 port map(enb1_n => trapb, sel1 => pcs1, g1c3 => ipc1, g1c2 => dpc1, g1c1 => ir13, g1c0 => spc1a, g1q => npc1, g2q => npc0, g2c0 => spc0, g2c1 => ir12, g2c2 => dpc0, g2c3 => ipc0, sel0 => pcs0, enb2_n => trapb);
  npc_4e04 : sn74s374 port map(oenb_n => gnd, o0 => nc248, i0 => nc249, i1 => nc250, o1 => nc251, o2 => pc13, i2 => npc13, i3 => npc12, o3 => pc12, clk => clk4b, o4 => pc11, i4 => npc11, i5 => npc10, o5 => pc10, o6 => pc9, i6 => npc9, i7 => npc8, o7 => pc8);
  npc_4e05 : sn74s374 port map(oenb_n => gnd, o0 => pc7, i0 => npc7, i1 => npc6, o1 => pc6, o2 => pc5, i2 => npc5, i3 => npc4, o3 => pc4, clk => clk4b, o4 => pc3, i4 => npc3, i5 => npc2, o5 => pc2, o6 => pc1, i6 => npc1, i7 => npc0, o7 => pc0);
  npc_4f01 : sn74s153 port map(enb1_n => trapa, sel1 => pcs1, g1c3 => ipc13, g1c2 => dpc13, g1c1 => ir25, g1c0 => spc13, g1q => npc13, g2q => npc12, g2c0 => spc12, g2c1 => ir24, g2c2 => dpc12, g2c3 => ipc12, sel0 => pcs0, enb2_n => trapa);
  npc_4f02 : sn74s153 port map(enb1_n => trapa, sel1 => pcs1, g1c3 => ipc11, g1c2 => dpc11, g1c1 => ir23, g1c0 => spc11, g1q => npc11, g2q => npc10, g2c0 => spc10, g2c1 => ir22, g2c2 => dpc10, g2c3 => ipc10, sel0 => pcs0, enb2_n => trapa);
  npc_4f03 : sn74s153 port map(enb1_n => trapa, sel1 => pcs1, g1c3 => ipc9, g1c2 => dpc9, g1c1 => ir21, g1c0 => spc9, g1q => npc9, g2q => npc8, g2c0 => spc8, g2c1 => ir20, g2c2 => dpc8, g2c3 => ipc8, sel0 => pcs0, enb2_n => trapa);
  npc_4f04 : sn74s153 port map(enb1_n => trapa, sel1 => pcs1, g1c3 => ipc7, g1c2 => dpc7, g1c1 => ir19, g1c0 => spc7, g1q => npc7, g2q => npc6, g2c0 => spc6, g2c1 => ir18, g2c2 => dpc6, g2c3 => ipc6, sel0 => pcs0, enb2_n => trapb);
  npc_4f05 : sn74s153 port map(enb1_n => trapb, sel1 => pcs1, g1c3 => ipc5, g1c2 => dpc5, g1c1 => ir17, g1c0 => spc5, g1q => npc5, g2q => npc4, g2c0 => spc4, g2c1 => ir16, g2c2 => dpc4, g2c3 => ipc4, sel0 => pcs0, enb2_n => trapb);
end architecture;
