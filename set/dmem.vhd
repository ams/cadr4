library ieee;
use ieee.std_logic_1164.all;
use work.cadr.all;

entity dmem is
  port (
    -- Clock
    clk3e       : in  std_logic;
    
    -- Instruction register bus
    IR          : in  std_logic_vector(41 downto 5);
    
    -- Address bus from A register
    A           : in  std_logic_vector(17 downto 0);
    
    -- Address bus to memory
    AA          : out std_logic_vector(17 downto 0);
    
    -- Display control signals
    dispenb     : in  std_logic;
    \-irdisp\   : in  std_logic;
    \-funct2\   : in  std_logic;
    
    -- Write control
    wp2         : in  std_logic;
    
    -- R register bus (for DRAM data)
    R           : in  std_logic_vector(6 downto 0);
    
    -- Display memory control outputs
    dispwr      : out std_logic;
    \-dmapbenb\ : out std_logic;
    
    -- DRAM control outputs
    \-dwea\     : out std_logic;
    \-dweb\     : out std_logic;
    \-dwec\     : out std_logic;
    
    -- Display address outputs
    DADR        : out std_logic_vector(10 downto 0);
    \-DADR\     : out std_logic_vector(10 downto 0);
    
    -- Display data control
    dpar        : out std_logic;
    dn          : out std_logic;
    dp          : out std_logic;
    dr          : out std_logic;
    
    -- Display parity control
    dpareven    : out std_logic;
    dparok      : out std_logic;
    \-dparh\    : out std_logic;
    dparl       : out std_logic;
    
    -- Display PC outputs
    DPC         : out std_logic_vector(13 downto 0);
    
    -- Video memory outputs
    vmo18       : out std_logic;
    vmo19       : out std_logic;
    \-vmo18\    : out std_logic;
    \-vmo19\    : out std_logic;
    
    -- Display mask outputs
    DMASK       : out std_logic_vector(6 downto 0)
  );
end;

architecture rtl of dmem is
  -- Internal signals for interconnections
  signal dmask_int     : std_logic_vector(6 downto 0);
  signal dc_int        : std_logic_vector(9 downto 0);
  signal aa_int        : std_logic_vector(17 downto 0);
  signal dpc_int       : std_logic_vector(13 downto 0);
  signal dispwr_int    : std_logic;
  signal dmapbenb_int  : std_logic;
  
  -- IR bit signals for component connections (inverted versions)
  signal ir8b, ir9b, ir12b, ir13b, ir14b, ir15b, ir16b, ir17b, ir18b, ir19b, ir20b, ir21b, ir22b : std_logic;
  
  -- DRAM address signals
  signal dadr10a_int   : std_logic;
  signal dadr10a_n_int : std_logic;
  signal dadr10c_int   : std_logic;
  signal dadr10c_n_int : std_logic;
  
  signal vmo18_int     : std_logic;
  signal vmo19_int     : std_logic;

begin
  -- Output assignments
  AA <= aa_int;
  DPC <= dpc_int;
  DMASK <= dmask_int;
  dispwr <= dispwr_int;
  \-dmapbenb\ <= dmapbenb_int;
  
  -- Generate inverted IR bit signals for DRAM components
  ir8b <= not IR(8);
  ir9b <= not IR(9);
  ir12b <= not IR(12);
  ir13b <= not IR(13);
  ir14b <= not IR(14);
  ir15b <= not IR(15);
  ir16b <= not IR(16);
  ir17b <= not IR(17);
  ir18b <= not IR(18);
  ir19b <= not IR(19);
  ir20b <= not IR(20);
  ir21b <= not IR(21);
  ir22b <= not IR(22);
  
  -- Display control component
  u_dspctl: cadr_dspctl port map (
    dmask0 => dmask_int(0), dmask1 => dmask_int(1), dmask2 => dmask_int(2), dmask3 => dmask_int(3),
    dmask4 => dmask_int(4), dmask5 => dmask_int(5), dmask6 => dmask_int(6),
    ir5 => IR(5), ir6 => IR(6), ir7 => IR(7), ir8 => IR(8), ir9 => IR(9),
    ir32 => IR(32), ir33 => IR(33), ir34 => IR(34), ir35 => IR(35), ir36 => IR(36), ir37 => IR(37),
    ir38 => IR(38), ir39 => IR(39), ir40 => IR(40), ir41 => IR(41),
    \-irdisp\ => \-irdisp\, clk3e => clk3e, dispenb => dispenb,
    dc0 => dc_int(0), dc1 => dc_int(1), dc2 => dc_int(2), dc3 => dc_int(3), dc4 => dc_int(4),
    dc5 => dc_int(5), dc6 => dc_int(6), dc7 => dc_int(7), dc8 => dc_int(8), dc9 => dc_int(9),
    dpareven => dpareven, dparok => dparok, \-dparh\ => \-dparh\, dparl => dparl,
    aa0 => aa_int(0), aa1 => aa_int(1), aa2 => aa_int(2), aa3 => aa_int(3), aa4 => aa_int(4),
    aa5 => aa_int(5), aa6 => aa_int(6), aa7 => aa_int(7), aa8 => aa_int(8), aa9 => aa_int(9),
    aa10 => aa_int(10), aa11 => aa_int(11), aa12 => aa_int(12), aa13 => aa_int(13), aa14 => aa_int(14),
    aa15 => aa_int(15), aa16 => aa_int(16), aa17 => aa_int(17),
    a0 => A(0), a1 => A(1), a2 => A(2), a3 => A(3), a4 => A(4), a5 => A(5), a6 => A(6), a7 => A(7),
    a8 => A(8), a9 => A(9), a10 => A(10), a11 => A(11), a12 => A(12), a13 => A(13), a14 => A(14),
    a15 => A(15), a16 => A(16), a17 => A(17),
    \-dmapbenb\ => dmapbenb_int, dispwr => dispwr_int, \-funct2\ => \-funct2\,
    dpc0 => dpc_int(0), dpc1 => dpc_int(1), dpc2 => dpc_int(2), dpc3 => dpc_int(3), dpc4 => dpc_int(4),
    dpc5 => dpc_int(5), dpc6 => dpc_int(6), dpc7 => dpc_int(7), dpc8 => dpc_int(8), dpc9 => dpc_int(9),
    dpc10 => dpc_int(10), dpc11 => dpc_int(11), dpc12 => dpc_int(12), dpc13 => dpc_int(13),
    dn => dn, dp => dp, dr => dr, dpar => dpar
  );
  
  -- DRAM0 component
  u_dram0: cadr_dram0 port map (
    wp2 => wp2, dispwr => dispwr_int, \-dwea\ => \-dwea\,
    \-dadr10a\ => dadr10a_n_int, dadr10a => dadr10a_int,
    ir22b => ir22b, \-dadr9a\ => \-DADR\(9), ir21b => ir21b, \-dadr8a\ => \-DADR\(8),
    ir20b => ir20b, \-dadr7a\ => \-DADR\(7), ir19b => ir19b, ir12b => ir12b,
    vmo19 => vmo19_int, ir9b => ir9b, r0 => R(0), dmask0 => dmask_int(0),
    \-dmapbenb\ => dmapbenb_int, \-dadr0a\ => \-DADR\(0), vmo18 => vmo18_int, ir8b => ir8b,
    ir12 => IR(12), ir13 => IR(13), ir18b => ir18b, ir14 => IR(14), ir17b => ir17b,
    ir15 => IR(15), ir16b => ir16b, ir16 => IR(16), ir15b => ir15b,
    ir17 => IR(17), ir14b => ir14b, ir18 => IR(18), ir13b => ir13b,
    ir19 => IR(19), \-dadr1a\ => \-DADR\(1), \-dadr2a\ => \-DADR\(2), \-dadr3a\ => \-DADR\(3),
    \-dadr4a\ => \-DADR\(4), dpc5 => dpc_int(5), \-dadr5a\ => \-DADR\(5), \-dadr6a\ => \-DADR\(6),
    aa5 => aa_int(5), dpc4 => dpc_int(4), aa4 => aa_int(4), r3 => R(3), dmask6 => dmask_int(6),
    r6 => R(6), dmask3 => dmask_int(3), dpc3 => dpc_int(3), aa3 => aa_int(3), dpc2 => dpc_int(2),
    aa2 => aa_int(2), r2 => R(2), dmask5 => dmask_int(5), r5 => R(5), dmask2 => dmask_int(2),
    dpc1 => dpc_int(1), aa1 => aa_int(1), dpc0 => dpc_int(0), aa0 => aa_int(0), r1 => R(1),
    dmask4 => dmask_int(4), r4 => R(4), dmask1 => dmask_int(1)
  );
  
  -- DRAM1 component
  u_dram1: cadr_dram1 port map (
    wp2 => wp2, dispwr => dispwr_int, \-dweb\ => \-dweb\,
    \-vmo19\ => \-vmo19\, vmo19 => vmo19_int, \-vmo18\ => \-vmo18\, vmo18 => vmo18_int,
    \-dadr9b\ => \-DADR\(9), ir21b => ir21b, \-dadr8b\ => \-DADR\(8), ir20b => ir20b,
    \-dadr7b\ => \-DADR\(7), ir19b => ir19b, ir12b => ir12b, ir9b => ir9b,
    r0 => R(0), dmask0 => dmask_int(0), \-dmapbenb\ => dmapbenb_int, \-dadr0b\ => \-DADR\(0),
    ir8b => ir8b, dadr10a => dadr10a_int, \-dadr1b\ => \-DADR\(1), \-dadr2b\ => \-DADR\(2),
    \-dadr3b\ => \-DADR\(3), \-dadr4b\ => \-DADR\(4), dpc11 => dpc_int(11), \-dadr5b\ => \-DADR\(5),
    \-dadr6b\ => \-DADR\(6), aa11 => aa_int(11), \-dadr10a\ => dadr10a_n_int, dpc10 => dpc_int(10),
    aa10 => aa_int(10), r3 => R(3), ir18b => ir18b, dmask6 => dmask_int(6), r6 => R(6),
    ir15b => ir15b, dmask3 => dmask_int(3), dpc9 => dpc_int(9), aa9 => aa_int(9),
    dadr10c => dadr10c_int, dpc8 => dpc_int(8), aa8 => aa_int(8), \-dadr10c\ => dadr10c_n_int,
    r2 => R(2), ir17b => ir17b, dmask5 => dmask_int(5), r5 => R(5), ir14b => ir14b,
    dmask2 => dmask_int(2), dpc7 => dpc_int(7), aa7 => aa_int(7), dpc6 => dpc_int(6), aa6 => aa_int(6),
    r1 => R(1), ir16b => ir16b, dmask4 => dmask_int(4), r4 => R(4), ir13b => ir13b,
    dmask1 => dmask_int(1), ir20 => IR(20), ir21 => IR(21), ir22 => IR(22), ir8 => IR(8), ir9 => IR(9),
    ir22b => ir22b
  );
  
  -- DRAM2 component
  u_dram2: cadr_dram2 port map (
    dadr10c => dadr10c_int, \-dadr0c\ => \-DADR\(0), \-dadr1c\ => \-DADR\(1), \-dadr2c\ => \-DADR\(2),
    \-dadr3c\ => \-DADR\(3), \-dadr4c\ => \-DADR\(4), dpar => dpar, \-dadr5c\ => \-DADR\(5),
    \-dadr6c\ => \-DADR\(6), \-dadr7c\ => \-DADR\(7), \-dadr8c\ => \-DADR\(8), \-dadr9c\ => \-DADR\(9),
    \-dwec\ => \-dwec\, aa17 => aa_int(17), \-dadr10c\ => dadr10c_n_int, dr => dr, aa16 => aa_int(16),
    r3 => R(3), ir18b => ir18b, dmask6 => dmask_int(6), r6 => R(6), ir15b => ir15b,
    dmask3 => dmask_int(3), dp => dp, aa15 => aa_int(15), dn => dn, aa14 => aa_int(14), r2 => R(2),
    ir17b => ir17b, dmask5 => dmask_int(5), r5 => R(5), ir14b => ir14b,
    dmask2 => dmask_int(2), dpc13 => dpc_int(13), aa13 => aa_int(13), dpc12 => dpc_int(12),
    aa12 => aa_int(12), r1 => R(1), ir16b => ir16b, dmask4 => dmask_int(4), r4 => R(4),
    ir13b => ir13b, dmask1 => dmask_int(1), ir12b => ir12b, vmo19 => vmo19_int,
    ir9b => ir9b, r0 => R(0), dmask0 => dmask_int(0), \-dmapbenb\ => dmapbenb_int,
    vmo18 => vmo18_int, ir8b => ir8b, ir22b => ir22b, ir21b => ir21b,
    ir20b => ir20b, ir19b => ir19b, dispwr => dispwr_int, wp2 => wp2
  );
  
  -- Output DADR positive signals (derived from negative signals)
  DADR(0) <= not \-DADR\(0);
  DADR(1) <= not \-DADR\(1);
  DADR(2) <= not \-DADR\(2);
  DADR(3) <= not \-DADR\(3);
  DADR(4) <= not \-DADR\(4);
  DADR(5) <= not \-DADR\(5);
  DADR(6) <= not \-DADR\(6);
  DADR(7) <= not \-DADR\(7);
  DADR(8) <= not \-DADR\(8);
  DADR(9) <= not \-DADR\(9);
  DADR(10) <= dadr10c_int;
  
  -- Output video memory signals
  vmo18 <= vmo18_int;
  vmo19 <= vmo19_int;

end; 