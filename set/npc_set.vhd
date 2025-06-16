library ieee;
use ieee.std_logic_1164.all;
use work.cadr.all;

entity npc is
  port (
    -- Clock signal
    clk4b  : in  std_logic;
    
    -- Input signals
    dpc4   : in  std_logic;
    pcs0   : in  std_logic;
    pcs1   : in  std_logic;
    spc1a  : in  std_logic;
    trapa  : in  std_logic;
    trapb  : in  std_logic;
    
    -- Bus signals
    IR     : in  std_logic_vector(25 downto 12);
    
    -- Output bus signals
    DPC    : out std_logic_vector(13 downto 0);
    IPC    : out std_logic_vector(13 downto 0);
    NPC    : out std_logic_vector(13 downto 0);
    PC     : out std_logic_vector(13 downto 0);
    SPC    : out std_logic_vector(13 downto 0);
    SPCO   : out std_logic_vector(13 downto 0);
    
    -- Individual outputs
    pccry3  : out std_logic;
    pccry7  : out std_logic;
    pccry11 : out std_logic
  );
end entity;

architecture structure of npc is
begin

  u_cadr_npc : cadr_npc
    port map (
      clk4b   => clk4b,
      dpc4    => dpc4,
      ir12    => IR(12),
      ir13    => IR(13),
      ir14    => IR(14),
      ir15    => IR(15),
      ir16    => IR(16),
      ir17    => IR(17),
      ir18    => IR(18),
      ir19    => IR(19),
      ir20    => IR(20),
      ir21    => IR(21),
      ir22    => IR(22),
      ir23    => IR(23),
      ir24    => IR(24),
      ir25    => IR(25),
      pcs0    => pcs0,
      pcs1    => pcs1,
      spc1a   => spc1a,
      trapa   => trapa,
      trapb   => trapb,
      dpc0    => DPC(0),
      dpc1    => DPC(1),
      dpc2    => DPC(2),
      dpc3    => DPC(3),
      dpc5    => DPC(5),
      dpc6    => DPC(6),
      dpc7    => DPC(7),
      dpc8    => DPC(8),
      dpc9    => DPC(9),
      dpc10   => DPC(10),
      dpc11   => DPC(11),
      dpc12   => DPC(12),
      dpc13   => DPC(13),
      ipc0    => IPC(0),
      ipc1    => IPC(1),
      ipc2    => IPC(2),
      ipc3    => IPC(3),
      ipc4    => IPC(4),
      ipc5    => IPC(5),
      ipc6    => IPC(6),
      ipc7    => IPC(7),
      ipc8    => IPC(8),
      ipc9    => IPC(9),
      ipc10   => IPC(10),
      ipc11   => IPC(11),
      ipc12   => IPC(12),
      ipc13   => IPC(13),
      npc0    => NPC(0),
      npc1    => NPC(1),
      npc2    => NPC(2),
      npc3    => NPC(3),
      npc4    => NPC(4),
      npc5    => NPC(5),
      npc6    => NPC(6),
      npc7    => NPC(7),
      npc8    => NPC(8),
      npc9    => NPC(9),
      npc10   => NPC(10),
      npc11   => NPC(11),
      npc12   => NPC(12),
      npc13   => NPC(13),
      pc0     => PC(0),
      pc1     => PC(1),
      pc2     => PC(2),
      pc3     => PC(3),
      pc4     => PC(4),
      pc5     => PC(5),
      pc6     => PC(6),
      pc7     => PC(7),
      pc8     => PC(8),
      pc9     => PC(9),
      pc10    => PC(10),
      pc11    => PC(11),
      pc12    => PC(12),
      pc13    => PC(13),
      spc0    => SPC(0),
      spc2    => SPC(2),
      spc3    => SPC(3),
      spc4    => SPC(4),
      spc5    => SPC(5),
      spc6    => SPC(6),
      spc7    => SPC(7),
      spc8    => SPC(8),
      spc9    => SPC(9),
      spc10   => SPC(10),
      spc11   => SPC(11),
      spc12   => SPC(12),
      spc13   => SPC(13),
      pccry3  => pccry3,
      pccry7  => pccry7,
      pccry11 => pccry11
    );

  -- Map SPC outputs to SPCO bus (same as SPC)
  SPCO <= SPC;
  
  -- Handle missing DPC(4) mapping
  DPC(4) <= dpc4;

end structure; 