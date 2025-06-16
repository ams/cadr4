library ieee;
use ieee.std_logic_1164.all;
use work.cadr.all;

entity imem is
  port (
    -- Bus signals
    PC : in std_logic_vector(13 downto 0);
    IWR : in std_logic_vector(48 downto 0);
    I : out std_logic_vector(48 downto 0);
    
    -- Control signals
    idebug : in std_logic;
    promdisabled : in std_logic;
    \-wp5\ : in std_logic;
    \-iwrited\ : in std_logic;
    
    -- Output control signals  
    ramdisable : out std_logic;
    \-iwriteda\ : out std_logic;
    \-promdisabled\ : out std_logic;
    iwriteda : out std_logic;
    wp5c : out std_logic;
    wp5b : out std_logic;
    wp5a : out std_logic;
    iwritedd : out std_logic;
    iwritedc : out std_logic;
    iwritedb : out std_logic
  );
end;

architecture structural of imem is
  
  -- Internal signals for address decoding and control
  signal pcb : std_logic_vector(13 downto 0);
  signal pcc : std_logic_vector(11 downto 0);
  signal pcd : std_logic_vector(11 downto 0);
  signal ice : std_logic_vector(15 downto 0);
  signal iwe : std_logic_vector(15 downto 0);
  
  -- PC outputs from individual IRAM components
  signal pc0d, pc1d, pc2d, pc3d, pc4d, pc5d, pc6d, pc7d, pc8d, pc9d, pc10d, pc11d : std_logic;
  signal pc0e, pc1e, pc2e, pc3e, pc4e, pc5e, pc6e, pc7e, pc8e, pc9e, pc10e, pc11e : std_logic;
  signal pc0f, pc1f, pc2f, pc3f, pc4f, pc5f, pc6f, pc7f, pc8f, pc9f, pc10f, pc11f : std_logic;
  signal pc0g, pc1g, pc2g, pc3g, pc4g, pc5g, pc6g, pc7g, pc8g, pc9g, pc10g, pc11g : std_logic;
  signal pc0h, pc1h, pc2h, pc3h, pc4h, pc5h, pc6h, pc7h, pc8h, pc9h, pc10h, pc11h : std_logic;
  signal pc0i, pc1i, pc2i, pc3i, pc4i, pc5i, pc6i, pc7i, pc8i, pc9i, pc10i, pc11i : std_logic;
  signal pc0j, pc1j, pc2j, pc3j, pc4j, pc5j, pc6j, pc7j, pc8j, pc9j, pc10j, pc11j : std_logic;
  signal pc0k, pc1k, pc2k, pc3k, pc4k, pc5k, pc6k, pc7k, pc8k, pc9k, pc10k, pc11k : std_logic;
  signal pc0l, pc1l, pc2l, pc3l, pc4l, pc5l, pc6l, pc7l, pc8l, pc9l, pc10l, pc11l : std_logic;
  signal pc0m, pc1m, pc2m, pc3m, pc4m, pc5m, pc6m, pc7m, pc8m, pc9m, pc10m, pc11m : std_logic;
  signal pc0n, pc1n, pc2n, pc3n, pc4n, pc5n, pc6n, pc7n, pc8n, pc9n, pc10n, pc11n : std_logic;
  signal pc0o, pc1o, pc2o, pc3o, pc4o, pc5o, pc6o, pc7o, pc8o, pc9o, pc10o, pc11o : std_logic;
  signal pc0p, pc1p, pc2p, pc3p, pc4p, pc5p, pc6p, pc7p, pc8p, pc9p, pc10p, pc11p : std_logic;

begin

  -- Instruction control component
  ictl: cadr_ictl port map (
    ramdisable => ramdisable,
    \-iwriteda\ => \-iwriteda\,
    \-promdisabled\ => \-promdisabled\,
    idebug => idebug,
    iwriteda => iwriteda,
    promdisabled => promdisabled,
    \-wp5\ => \-wp5\,
    wp5c => wp5c,
    wp5b => wp5b,
    wp5a => wp5a,
    pc0 => PC(0), \-pcb0\ => pcb(0),
    pc1 => PC(1), \-pcb1\ => pcb(1),
    pc2 => PC(2), \-pcb2\ => pcb(2),
    pc3 => PC(3), \-pcb3\ => pcb(3),
    pc4 => PC(4), \-pcb4\ => pcb(4),
    pc5 => PC(5), \-pcb5\ => pcb(5),
    pc6 => PC(6), \-pcb6\ => pcb(6),
    pc7 => PC(7), \-pcb7\ => pcb(7),
    pc8 => PC(8), \-pcb8\ => pcb(8),
    pc9 => PC(9), \-pcb9\ => pcb(9),
    pc10 => PC(10), \-pcb10\ => pcb(10),
    pc11 => PC(11), \-pcb11\ => pcb(11),
    pc12 => PC(12), \-pc12b\ => open,
    pc13 => PC(13), \-pc13b\ => open,
    \-iwrited\ => \-iwrited\,
    iwritedd => iwritedd,
    iwritedc => iwritedc,
    iwritedb => iwritedb,
    \-iwea\ => iwe(0), \-iweb\ => iwe(1), \-iwei\ => iwe(8), \-iwej\ => iwe(9),
    \-ice0a\ => ice(0), \-ice1a\ => ice(1), \-ice2a\ => ice(2), \-ice3a\ => ice(3),
    \-ice0b\ => ice(4), \-ice1b\ => ice(5), \-ice2b\ => ice(6), \-ice3b\ => ice(7),
    \-ice0c\ => ice(8), \-ice1c\ => ice(9), \-ice2c\ => ice(10), \-ice3c\ => ice(11),
    \-ice0d\ => ice(12), \-ice1d\ => ice(13), \-ice2d\ => ice(14), \-ice3d\ => ice(15),
    \-iwec\ => iwe(2), \-iwed\ => iwe(3), \-iwee\ => iwe(4), \-iwef\ => iwe(5),
    \-iweg\ => iwe(6), \-iweh\ => iwe(7), \-iwek\ => iwe(10), \-iwel\ => iwe(11),
    \-iwem\ => iwe(12), \-iwen\ => iwe(13), \-iweo\ => iwe(14), \-iwep\ => iwe(15),
    \-pcc0\ => pcc(0), \-pcc1\ => pcc(1), \-pcc2\ => pcc(2), \-pcc3\ => pcc(3),
    \-pcc4\ => pcc(4), \-pcc5\ => pcc(5), \-pcc6\ => pcc(6), \-pcc7\ => pcc(7),
    \-pcc8\ => pcc(8), \-pcc9\ => pcc(9), \-pcc10\ => pcc(10), \-pcc11\ => pcc(11)
  );

  -- IRAM bank 0 (bits 0-11)
  iram00: cadr_iram00 port map (\-ice0a\ => ice(0), \-iwea\ => iwe(0), iwr0 => IWR(0), iwr1 => IWR(1), iwr2 => IWR(2), iwr3 => IWR(3), iwr4 => IWR(4), iwr5 => IWR(5), iwr6 => IWR(6), iwr7 => IWR(7), iwr8 => IWR(8), iwr9 => IWR(9), iwr10 => IWR(10), iwr11 => IWR(11), \-pcb0\ => pcb(0), \-pcb1\ => pcb(1), \-pcb2\ => pcb(2), \-pcb3\ => pcb(3), \-pcb4\ => pcb(4), \-pcb5\ => pcb(5), \-pcb6\ => pcb(6), \-pcb7\ => pcb(7), \-pcb8\ => pcb(8), \-pcb9\ => pcb(9), \-pcb10\ => pcb(10), \-pcb11\ => pcb(11), i0 => I(0), i1 => I(1), i2 => I(2), i3 => I(3), i4 => I(4), i5 => I(5), i6 => I(6), i7 => I(7), i8 => I(8), i9 => I(9), i10 => I(10), i11 => I(11), pc0a => open, pc1a => open, pc2a => open, pc3a => open, pc4a => open, pc5a => open, pc6a => open, pc7a => open, pc8a => open, pc9a => open, pc10a => open, pc11a => open);

  iram01: cadr_iram01 port map (\-ice1a\ => ice(1), \-iweb\ => iwe(1), iwr0 => IWR(0), iwr1 => IWR(1), iwr2 => IWR(2), iwr3 => IWR(3), iwr4 => IWR(4), iwr5 => IWR(5), iwr6 => IWR(6), iwr7 => IWR(7), iwr8 => IWR(8), iwr9 => IWR(9), iwr10 => IWR(10), iwr11 => IWR(11), \-pcb0\ => pcb(0), \-pcb1\ => pcb(1), \-pcb2\ => pcb(2), \-pcb3\ => pcb(3), \-pcb4\ => pcb(4), \-pcb5\ => pcb(5), \-pcb6\ => pcb(6), \-pcb7\ => pcb(7), \-pcb8\ => pcb(8), \-pcb9\ => pcb(9), \-pcb10\ => pcb(10), \-pcb11\ => pcb(11), i0 => I(0), i1 => I(1), i2 => I(2), i3 => I(3), i4 => I(4), i5 => I(5), i6 => I(6), i7 => I(7), i8 => I(8), i9 => I(9), i10 => I(10), i11 => I(11), pc0b => open, pc1b => open, pc2b => open, pc3b => open, pc4b => open, pc5b => open, pc6b => open, pc7b => open, pc8b => open, pc9b => open, pc10b => open, pc11b => open);

  iram02: cadr_iram02 port map (\-ice2a\ => ice(2), \-iwec\ => iwe(2), iwr0 => IWR(0), iwr1 => IWR(1), iwr2 => IWR(2), iwr3 => IWR(3), iwr4 => IWR(4), iwr5 => IWR(5), iwr6 => IWR(6), iwr7 => IWR(7), iwr8 => IWR(8), iwr9 => IWR(9), iwr10 => IWR(10), iwr11 => IWR(11), \-pcb0\ => pcb(0), \-pcb1\ => pcb(1), \-pcb2\ => pcb(2), \-pcb3\ => pcb(3), \-pcb4\ => pcb(4), \-pcb5\ => pcb(5), \-pcb6\ => pcb(6), \-pcb7\ => pcb(7), \-pcb8\ => pcb(8), \-pcb9\ => pcb(9), \-pcb10\ => pcb(10), \-pcb11\ => pcb(11), i0 => I(0), i1 => I(1), i2 => I(2), i3 => I(3), i4 => I(4), i5 => I(5), i6 => I(6), i7 => I(7), i8 => I(8), i9 => I(9), i10 => I(10), i11 => I(11), pc0c => open, pc1c => open, pc2c => open, pc3c => open, pc4c => open, pc5c => open, pc6c => open, pc7c => open, pc8c => open, pc9c => open, pc10c => open, pc11c => open);

  iram03: cadr_iram03 port map (\-ice3a\ => ice(3), \-iwed\ => iwe(3), iwr0 => IWR(0), iwr1 => IWR(1), iwr2 => IWR(2), iwr3 => IWR(3), iwr4 => IWR(4), iwr5 => IWR(5), iwr6 => IWR(6), iwr7 => IWR(7), iwr8 => IWR(8), iwr9 => IWR(9), iwr10 => IWR(10), iwr11 => IWR(11), \-pcb0\ => pcb(0), \-pcb1\ => pcb(1), \-pcb2\ => pcb(2), \-pcb3\ => pcb(3), \-pcb4\ => pcb(4), \-pcb5\ => pcb(5), \-pcb6\ => pcb(6), \-pcb7\ => pcb(7), \-pcb8\ => pcb(8), \-pcb9\ => pcb(9), \-pcb10\ => pcb(10), \-pcb11\ => pcb(11), i0 => I(0), i1 => I(1), i2 => I(2), i3 => I(3), i4 => I(4), i5 => I(5), i6 => I(6), i7 => I(7), i8 => I(8), i9 => I(9), i10 => I(10), i11 => I(11), pc0d => pc0d, pc1d => pc1d, pc2d => pc2d, pc3d => pc3d, pc4d => pc4d, pc5d => pc5d, pc6d => pc6d, pc7d => pc7d, pc8d => pc8d, pc9d => pc9d, pc10d => pc10d, pc11d => pc11d);

  -- IRAM bank 1 (bits 12-23)
  iram10: cadr_iram10 port map (\-ice0b\ => ice(4), \-iwee\ => iwe(4), iwr12 => IWR(12), iwr13 => IWR(13), iwr14 => IWR(14), iwr15 => IWR(15), iwr16 => IWR(16), iwr17 => IWR(17), iwr18 => IWR(18), iwr19 => IWR(19), iwr20 => IWR(20), iwr21 => IWR(21), iwr22 => IWR(22), iwr23 => IWR(23), \-pcb0\ => pcb(0), \-pcb1\ => pcb(1), \-pcb2\ => pcb(2), \-pcb3\ => pcb(3), \-pcb4\ => pcb(4), \-pcb5\ => pcb(5), \-pcb6\ => pcb(6), \-pcb7\ => pcb(7), \-pcb8\ => pcb(8), \-pcb9\ => pcb(9), \-pcb10\ => pcb(10), \-pcb11\ => pcb(11), i12 => I(12), i13 => I(13), i14 => I(14), i15 => I(15), i16 => I(16), i17 => I(17), i18 => I(18), i19 => I(19), i20 => I(20), i21 => I(21), i22 => I(22), i23 => I(23), pc0e => pc0e, pc1e => pc1e, pc2e => pc2e, pc3e => pc3e, pc4e => pc4e, pc5e => pc5e, pc6e => pc6e, pc7e => pc7e, pc8e => pc8e, pc9e => pc9e, pc10e => pc10e, pc11e => pc11e);

  iram11: cadr_iram11 port map (\-ice1b\ => ice(5), \-iwef\ => iwe(5), iwr12 => IWR(12), iwr13 => IWR(13), iwr14 => IWR(14), iwr15 => IWR(15), iwr16 => IWR(16), iwr17 => IWR(17), iwr18 => IWR(18), iwr19 => IWR(19), iwr20 => IWR(20), iwr21 => IWR(21), iwr22 => IWR(22), iwr23 => IWR(23), \-pcb0\ => pcb(0), \-pcb1\ => pcb(1), \-pcb2\ => pcb(2), \-pcb3\ => pcb(3), \-pcb4\ => pcb(4), \-pcb5\ => pcb(5), \-pcb6\ => pcb(6), \-pcb7\ => pcb(7), \-pcb8\ => pcb(8), \-pcb9\ => pcb(9), \-pcb10\ => pcb(10), \-pcb11\ => pcb(11), i12 => I(12), i13 => I(13), i14 => I(14), i15 => I(15), i16 => I(16), i17 => I(17), i18 => I(18), i19 => I(19), i20 => I(20), i21 => I(21), i22 => I(22), i23 => I(23), pc0f => pc0f, pc1f => pc1f, pc2f => pc2f, pc3f => pc3f, pc4f => pc4f, pc5f => pc5f, pc6f => pc6f, pc7f => pc7f, pc8f => pc8f, pc9f => pc9f, pc10f => pc10f, pc11f => pc11f);

  iram12: cadr_iram12 port map (\-ice2b\ => ice(6), \-iweg\ => iwe(6), iwr12 => IWR(12), iwr13 => IWR(13), iwr14 => IWR(14), iwr15 => IWR(15), iwr16 => IWR(16), iwr17 => IWR(17), iwr18 => IWR(18), iwr19 => IWR(19), iwr20 => IWR(20), iwr21 => IWR(21), iwr22 => IWR(22), iwr23 => IWR(23), \-pcb0\ => pcb(0), \-pcb1\ => pcb(1), \-pcb2\ => pcb(2), \-pcb3\ => pcb(3), \-pcb4\ => pcb(4), \-pcb5\ => pcb(5), \-pcb6\ => pcb(6), \-pcb7\ => pcb(7), \-pcb8\ => pcb(8), \-pcb9\ => pcb(9), \-pcb10\ => pcb(10), \-pcb11\ => pcb(11), i12 => I(12), i13 => I(13), i14 => I(14), i15 => I(15), i16 => I(16), i17 => I(17), i18 => I(18), i19 => I(19), i20 => I(20), i21 => I(21), i22 => I(22), i23 => I(23), pc0g => pc0g, pc1g => pc1g, pc2g => pc2g, pc3g => pc3g, pc4g => pc4g, pc5g => pc5g, pc6g => pc6g, pc7g => pc7g, pc8g => pc8g, pc9g => pc9g, pc10g => pc10g, pc11g => pc11g);

  iram13: cadr_iram13 port map (\-ice3b\ => ice(7), \-iweh\ => iwe(7), iwr12 => IWR(12), iwr13 => IWR(13), iwr14 => IWR(14), iwr15 => IWR(15), iwr16 => IWR(16), iwr17 => IWR(17), iwr18 => IWR(18), iwr19 => IWR(19), iwr20 => IWR(20), iwr21 => IWR(21), iwr22 => IWR(22), iwr23 => IWR(23), \-pcb0\ => pcb(0), \-pcb1\ => pcb(1), \-pcb2\ => pcb(2), \-pcb3\ => pcb(3), \-pcb4\ => pcb(4), \-pcb5\ => pcb(5), \-pcb6\ => pcb(6), \-pcb7\ => pcb(7), \-pcb8\ => pcb(8), \-pcb9\ => pcb(9), \-pcb10\ => pcb(10), \-pcb11\ => pcb(11), i12 => I(12), i13 => I(13), i14 => I(14), i15 => I(15), i16 => I(16), i17 => I(17), i18 => I(18), i19 => I(19), i20 => I(20), i21 => I(21), i22 => I(22), i23 => I(23), pc0h => pc0h, pc1h => pc1h, pc2h => pc2h, pc3h => pc3h, pc4h => pc4h, pc5h => pc5h, pc6h => pc6h, pc7h => pc7h, pc8h => pc8h, pc9h => pc9h, pc10h => pc10h, pc11h => pc11h);

  -- IRAM bank 2 (bits 24-35)
  iram20: cadr_iram20 port map (\-ice0c\ => ice(8), \-iwei\ => iwe(8), iwr24 => IWR(24), iwr25 => IWR(25), iwr26 => IWR(26), iwr27 => IWR(27), iwr28 => IWR(28), iwr29 => IWR(29), iwr30 => IWR(30), iwr31 => IWR(31), iwr32 => IWR(32), iwr33 => IWR(33), iwr34 => IWR(34), iwr35 => IWR(35), \-pcc0\ => pcc(0), \-pcc1\ => pcc(1), \-pcc2\ => pcc(2), \-pcc3\ => pcc(3), \-pcc4\ => pcc(4), \-pcc5\ => pcc(5), \-pcc6\ => pcc(6), \-pcc7\ => pcc(7), \-pcc8\ => pcc(8), \-pcc9\ => pcc(9), \-pcc10\ => pcc(10), \-pcc11\ => pcc(11), i24 => I(24), i25 => I(25), i26 => I(26), i27 => I(27), i28 => I(28), i29 => I(29), i30 => I(30), i31 => I(31), i32 => I(32), i33 => I(33), i34 => I(34), i35 => I(35), pc0i => pc0i, pc1i => pc1i, pc2i => pc2i, pc3i => pc3i, pc4i => pc4i, pc5i => pc5i, pc6i => pc6i, pc7i => pc7i, pc8i => pc8i, pc9i => pc9i, pc10i => pc10i, pc11i => pc11i);

  iram21: cadr_iram21 port map (\-ice1c\ => ice(9), \-iwej\ => iwe(9), iwr24 => IWR(24), iwr25 => IWR(25), iwr26 => IWR(26), iwr27 => IWR(27), iwr28 => IWR(28), iwr29 => IWR(29), iwr30 => IWR(30), iwr31 => IWR(31), iwr32 => IWR(32), iwr33 => IWR(33), iwr34 => IWR(34), iwr35 => IWR(35), \-pcc0\ => pcc(0), \-pcc1\ => pcc(1), \-pcc2\ => pcc(2), \-pcc3\ => pcc(3), \-pcc4\ => pcc(4), \-pcc5\ => pcc(5), \-pcc6\ => pcc(6), \-pcc7\ => pcc(7), \-pcc8\ => pcc(8), \-pcc9\ => pcc(9), \-pcc10\ => pcc(10), \-pcc11\ => pcc(11), i24 => I(24), i25 => I(25), i26 => I(26), i27 => I(27), i28 => I(28), i29 => I(29), i30 => I(30), i31 => I(31), i32 => I(32), i33 => I(33), i34 => I(34), i35 => I(35), pc0j => pc0j, pc1j => pc1j, pc2j => pc2j, pc3j => pc3j, pc4j => pc4j, pc5j => pc5j, pc6j => pc6j, pc7j => pc7j, pc8j => pc8j, pc9j => pc9j, pc10j => pc10j, pc11j => pc11j);

  iram22: cadr_iram22 port map (\-ice2c\ => ice(10), \-iwek\ => iwe(10), iwr24 => IWR(24), iwr25 => IWR(25), iwr26 => IWR(26), iwr27 => IWR(27), iwr28 => IWR(28), iwr29 => IWR(29), iwr30 => IWR(30), iwr31 => IWR(31), iwr32 => IWR(32), iwr33 => IWR(33), iwr34 => IWR(34), iwr35 => IWR(35), \-pcc0\ => pcc(0), \-pcc1\ => pcc(1), \-pcc2\ => pcc(2), \-pcc3\ => pcc(3), \-pcc4\ => pcc(4), \-pcc5\ => pcc(5), \-pcc6\ => pcc(6), \-pcc7\ => pcc(7), \-pcc8\ => pcc(8), \-pcc9\ => pcc(9), \-pcc10\ => pcc(10), \-pcc11\ => pcc(11), i24 => I(24), i25 => I(25), i26 => I(26), i27 => I(27), i28 => I(28), i29 => I(29), i30 => I(30), i31 => I(31), i32 => I(32), i33 => I(33), i34 => I(34), i35 => I(35), pc0k => pc0k, pc1k => pc1k, pc2k => pc2k, pc3k => pc3k, pc4k => pc4k, pc5k => pc5k, pc6k => pc6k, pc7k => pc7k, pc8k => pc8k, pc9k => pc9k, pc10k => pc10k, pc11k => pc11k);

  iram23: cadr_iram23 port map (\-ice3c\ => ice(11), \-iwel\ => iwe(11), iwr24 => IWR(24), iwr25 => IWR(25), iwr26 => IWR(26), iwr27 => IWR(27), iwr28 => IWR(28), iwr29 => IWR(29), iwr30 => IWR(30), iwr31 => IWR(31), iwr32 => IWR(32), iwr33 => IWR(33), iwr34 => IWR(34), iwr35 => IWR(35), \-pcc0\ => pcc(0), \-pcc1\ => pcc(1), \-pcc2\ => pcc(2), \-pcc3\ => pcc(3), \-pcc4\ => pcc(4), \-pcc5\ => pcc(5), \-pcc6\ => pcc(6), \-pcc7\ => pcc(7), \-pcc8\ => pcc(8), \-pcc9\ => pcc(9), \-pcc10\ => pcc(10), \-pcc11\ => pcc(11), i24 => I(24), i25 => I(25), i26 => I(26), i27 => I(27), i28 => I(28), i29 => I(29), i30 => I(30), i31 => I(31), i32 => I(32), i33 => I(33), i34 => I(34), i35 => I(35), pc0l => pc0l, pc1l => pc1l, pc2l => pc2l, pc3l => pc3l, pc4l => pc4l, pc5l => pc5l, pc6l => pc6l, pc7l => pc7l, pc8l => pc8l, pc9l => pc9l, pc10l => pc10l, pc11l => pc11l);

  -- IRAM bank 3 (bits 36-48)
  iram30: cadr_iram30 port map (\-ice0d\ => ice(12), \-iwem\ => iwe(12), iwr36 => IWR(36), iwr37 => IWR(37), iwr38 => IWR(38), iwr39 => IWR(39), iwr40 => IWR(40), iwr41 => IWR(41), iwr42 => IWR(42), iwr43 => IWR(43), iwr44 => IWR(44), iwr45 => IWR(45), iwr46 => IWR(46), iwr47 => IWR(47), iwr48 => IWR(48), \-pcc0\ => pcc(0), \-pcc1\ => pcc(1), \-pcc2\ => pcc(2), \-pcc3\ => pcc(3), \-pcc4\ => pcc(4), \-pcc5\ => pcc(5), \-pcc6\ => pcc(6), \-pcc7\ => pcc(7), \-pcc8\ => pcc(8), \-pcc9\ => pcc(9), \-pcc10\ => pcc(10), \-pcc11\ => pcc(11), i36 => I(36), i37 => I(37), i38 => I(38), i39 => I(39), i40 => I(40), i41 => I(41), i42 => I(42), i43 => I(43), i44 => I(44), i45 => I(45), i46 => I(46), i47 => I(47), i48 => I(48), pc0m => pc0m, pc1m => pc1m, pc2m => pc2m, pc3m => pc3m, pc4m => pc4m, pc5m => pc5m, pc6m => pc6m, pc7m => pc7m, pc8m => pc8m, pc9m => pc9m, pc10m => pc10m, pc11m => pc11m);

  iram31: cadr_iram31 port map (\-ice1d\ => ice(13), \-iwen\ => iwe(13), iwr36 => IWR(36), iwr37 => IWR(37), iwr38 => IWR(38), iwr39 => IWR(39), iwr40 => IWR(40), iwr41 => IWR(41), iwr42 => IWR(42), iwr43 => IWR(43), iwr44 => IWR(44), iwr45 => IWR(45), iwr46 => IWR(46), iwr47 => IWR(47), iwr48 => IWR(48), \-pcc0\ => pcc(0), \-pcc1\ => pcc(1), \-pcc2\ => pcc(2), \-pcc3\ => pcc(3), \-pcc4\ => pcc(4), \-pcc5\ => pcc(5), \-pcc6\ => pcc(6), \-pcc7\ => pcc(7), \-pcc8\ => pcc(8), \-pcc9\ => pcc(9), \-pcc10\ => pcc(10), \-pcc11\ => pcc(11), i36 => I(36), i37 => I(37), i38 => I(38), i39 => I(39), i40 => I(40), i41 => I(41), i42 => I(42), i43 => I(43), i44 => I(44), i45 => I(45), i46 => I(46), i47 => I(47), i48 => I(48), pc0n => pc0n, pc1n => pc1n, pc2n => pc2n, pc3n => pc3n, pc4n => pc4n, pc5n => pc5n, pc6n => pc6n, pc7n => pc7n, pc8n => pc8n, pc9n => pc9n, pc10n => pc10n, pc11n => pc11n);

  iram32: cadr_iram32 port map (\-ice2d\ => ice(14), \-iweo\ => iwe(14), iwr36 => IWR(36), iwr37 => IWR(37), iwr38 => IWR(38), iwr39 => IWR(39), iwr40 => IWR(40), iwr41 => IWR(41), iwr42 => IWR(42), iwr43 => IWR(43), iwr44 => IWR(44), iwr45 => IWR(45), iwr46 => IWR(46), iwr47 => IWR(47), iwr48 => IWR(48), \-pcc0\ => pcc(0), \-pcc1\ => pcc(1), \-pcc2\ => pcc(2), \-pcc3\ => pcc(3), \-pcc4\ => pcc(4), \-pcc5\ => pcc(5), \-pcc6\ => pcc(6), \-pcc7\ => pcc(7), \-pcc8\ => pcc(8), \-pcc9\ => pcc(9), \-pcc10\ => pcc(10), \-pcc11\ => pcc(11), i36 => I(36), i37 => I(37), i38 => I(38), i39 => I(39), i40 => I(40), i41 => I(41), i42 => I(42), i43 => I(43), i44 => I(44), i45 => I(45), i46 => I(46), i47 => I(47), i48 => I(48), pc0o => pc0o, pc1o => pc1o, pc2o => pc2o, pc3o => pc3o, pc4o => pc4o, pc5o => pc5o, pc6o => pc6o, pc7o => pc7o, pc8o => pc8o, pc9o => pc9o, pc10o => pc10o, pc11o => pc11o);

  iram33: cadr_iram33 port map (\-ice3d\ => ice(15), \-iwep\ => iwe(15), iwr36 => IWR(36), iwr37 => IWR(37), iwr38 => IWR(38), iwr39 => IWR(39), iwr40 => IWR(40), iwr41 => IWR(41), iwr42 => IWR(42), iwr43 => IWR(43), iwr44 => IWR(44), iwr45 => IWR(45), iwr46 => IWR(46), iwr47 => IWR(47), iwr48 => IWR(48), \-pcc0\ => pcc(0), \-pcc1\ => pcc(1), \-pcc2\ => pcc(2), \-pcc3\ => pcc(3), \-pcc4\ => pcc(4), \-pcc5\ => pcc(5), \-pcc6\ => pcc(6), \-pcc7\ => pcc(7), \-pcc8\ => pcc(8), \-pcc9\ => pcc(9), \-pcc10\ => pcc(10), \-pcc11\ => pcc(11), i36 => I(36), i37 => I(37), i38 => I(38), i39 => I(39), i40 => I(40), i41 => I(41), i42 => I(42), i43 => I(43), i44 => I(44), i45 => I(45), i46 => I(46), i47 => I(47), i48 => I(48), pc0p => pc0p, pc1p => pc1p, pc2p => pc2p, pc3p => pc3p, pc4p => pc4p, pc5p => pc5p, pc6p => pc6p, pc7p => pc7p, pc8p => pc8p, pc9p => pc9p, pc10p => pc10p, pc11p => pc11p);

end architecture; 