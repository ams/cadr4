library ieee;
use ieee.std_logic_1164.all;
use work.cadr.all;

entity set_vmaps is
  port (
    -- Clock signals
    tse1a : in std_logic;
    
    -- Bus inputs
    VMA : in std_logic_vector(31 downto 0);
    MAPI : in std_logic_vector(23 downto 8);
    VMAP : in std_logic_vector(4 downto 0);
    VMO : in std_logic_vector(23 downto 0);
    
    -- Other inputs
    memstart : in std_logic;
    \-pfr\ : in std_logic;
    \-pfw\ : in std_logic;
    \-srcmap\ : in std_logic;
    srcmap : in std_logic;
    \-vm0wpa\ : in std_logic;
    \-vm0wpb\ : in std_logic;
    \-vm1wpa\ : in std_logic;
    \-vm1wpb\ : in std_logic;
    vmoparodd : in std_logic;
    
    -- Bus outputs
    MF : out std_logic_vector(31 downto 0);
    VMAP_OUT : out std_logic_vector(4 downto 0);
    VMO_OUT : out std_logic_vector(23 downto 0);
    
    -- Other outputs
    \-mapdrive\ : out std_logic;
    \-mapi23\ : out std_logic;
    \-use.map\ : out std_logic;
    v0parok : out std_logic;
    vm0pari : out std_logic;
    vmoparok : out std_logic;
    vpari : out std_logic;
    vm1mpar : out std_logic;
    vm1pari : out std_logic;
    \-vm1lpar\ : out std_logic;
    vmoparm : out std_logic;
    vmopar : out std_logic;
    vmoparl : out std_logic;
    vmoparck : out std_logic;
    \-lvmo22\ : out std_logic;
    \-lvmo23\ : out std_logic;
    \-adrpar\ : out std_logic
  );
end set_vmaps;

architecture rtl of set_vmaps is
  -- Internal signals
  signal int_vmap : std_logic_vector(4 downto 0);
  signal int_vmo : std_logic_vector(23 downto 0);
  signal int_mapi_internal : std_logic_vector(12 downto 8);

begin

  -- cadr_vmem0 instance
  u_vmem0: cadr_vmem0 port map (
    \-vma27\ => VMA(27), \-vma28\ => VMA(28), \-vma29\ => VMA(29), \-vma30\ => VMA(30), \-vma31\ => VMA(31),
    mapi13 => MAPI(13), mapi14 => MAPI(14), mapi15 => MAPI(15), mapi16 => MAPI(16), mapi17 => MAPI(17),
    mapi18 => MAPI(18), mapi19 => MAPI(19), mapi20 => MAPI(20), mapi21 => MAPI(21), mapi22 => MAPI(22), mapi23 => MAPI(23),
    \-vm0wpa\ => \-vm0wpa\, \-vm0wpb\ => \-vm0wpb\, memstart => memstart, srcmap => srcmap, vmoparodd => vmoparodd,
    \-vmap0\ => int_vmap(0), \-vmap1\ => int_vmap(1), \-vmap2\ => int_vmap(2), \-vmap3\ => int_vmap(3), \-vmap4\ => int_vmap(4),
    vpari => vpari, vm0pari => vm0pari, \-mapi23\ => \-mapi23\, \-use.map\ => \-use.map\,
    v0parok => v0parok, vmoparok => vmoparok
  );

  -- cadr_vmem1 instance
  u_vmem1: cadr_vmem1 port map (
    \-vma0\ => VMA(0), \-vma1\ => VMA(1), \-vma2\ => VMA(2), \-vma3\ => VMA(3), \-vma4\ => VMA(4), \-vma5\ => VMA(5),
    \-vma7\ => VMA(7), \-vma8\ => VMA(8), \-vma9\ => VMA(9), \-vma10\ => VMA(10), \-vma11\ => VMA(11),
    \-vma12\ => VMA(12), \-vma13\ => VMA(13), \-vma14\ => VMA(14), \-vma15\ => VMA(15), \-vma16\ => VMA(16),
    \-vma17\ => VMA(17), \-vma18\ => VMA(18), \-vma19\ => VMA(19), \-vma20\ => VMA(20), \-vma21\ => VMA(21),
    \-vma22\ => VMA(22), \-vma23\ => VMA(23),
    mapi8 => MAPI(8), mapi9 => MAPI(9), mapi10 => MAPI(10), mapi11 => MAPI(11), mapi12 => MAPI(12),
    \-vm1wpa\ => \-vm1wpa\,
    \-vmap0\ => int_vmap(0), \-vmap1\ => int_vmap(1), \-vmap2\ => int_vmap(2), \-vmap3\ => int_vmap(3), \-vmap4\ => int_vmap(4),
    \-mapi8a\ => int_mapi_internal(8), \-mapi8b\ => open, \-mapi9a\ => int_mapi_internal(9), \-mapi9b\ => open,
    \-mapi10a\ => int_mapi_internal(10), \-mapi10b\ => open, \-mapi11a\ => int_mapi_internal(11), \-mapi11b\ => open,
    \-mapi12a\ => int_mapi_internal(12), \-mapi12b\ => open,
    \-vm1lpar\ => \-vm1lpar\, vm1mpar => vm1mpar, vm1pari => vm1pari,
    vmap0a => open, vmap1a => open, vmap2a => open, vmap3a => open, vmap4a => open,
    \-vmo0\ => int_vmo(0), \-vmo2\ => int_vmo(2), \-vmo3\ => int_vmo(3), \-vmo4\ => int_vmo(4), \-vmo5\ => int_vmo(5),
    \-vmo9\ => int_vmo(9), \-vmo10\ => int_vmo(10), \-vmo11\ => int_vmo(11)
  );

  -- cadr_vmem2 instance
  u_vmem2: cadr_vmem2 port map (
    \-vma12\ => VMA(12), \-vma13\ => VMA(13), \-vma14\ => VMA(14), \-vma15\ => VMA(15), \-vma16\ => VMA(16),
    \-vma17\ => VMA(17), \-vma18\ => VMA(18), \-vma19\ => VMA(19), \-vma20\ => VMA(20), \-vma21\ => VMA(21),
    \-vma22\ => VMA(22), \-vma23\ => VMA(23),
    \-mapi8b\ => int_mapi_internal(8), \-mapi9b\ => int_mapi_internal(9), \-mapi10b\ => int_mapi_internal(10),
    \-mapi11b\ => int_mapi_internal(11), \-mapi12b\ => int_mapi_internal(12),
    \-vm1wpb\ => \-vm1wpb\,
    \-vmap0\ => int_vmap(0), \-vmap1\ => int_vmap(1), \-vmap2\ => int_vmap(2), \-vmap3\ => int_vmap(3), \-vmap4\ => int_vmap(4),
    vm1pari => vm1pari,
    \-vmo0\ => int_vmo(0), \-vmo1\ => int_vmo(1), \-vmo2\ => int_vmo(2), \-vmo3\ => int_vmo(3), \-vmo4\ => int_vmo(4),
    \-vmo5\ => int_vmo(5), \-vmo6\ => int_vmo(6), \-vmo7\ => int_vmo(7), \-vmo8\ => int_vmo(8), \-vmo9\ => int_vmo(9),
    \-vmo10\ => int_vmo(10), \-vmo11\ => int_vmo(11),
    vmap0b => open, vmap1b => open, vmap2b => open, vmap3b => open, vmap4b => open,
    \-vmo12\ => int_vmo(12), \-vmo13\ => int_vmo(13), \-vmo14\ => int_vmo(14), \-vmo15\ => int_vmo(15),
    \-vmo16\ => int_vmo(16), \-vmo17\ => int_vmo(17), \-vmo18\ => int_vmo(18), \-vmo19\ => int_vmo(19),
    \-vmo20\ => int_vmo(20), \-vmo21\ => int_vmo(21), \-vmo22\ => int_vmo(22), \-vmo23\ => int_vmo(23),
    vmoparm => vmoparm, vmopar => vmopar, vmoparl => vmoparl, vmoparodd => open, vmoparck => vmoparck
  );

  -- cadr_vmemdr instance
  u_vmemdr: cadr_vmemdr port map (
    memstart => memstart, \-pfr\ => \-pfr\, \-pfw\ => \-pfw\, \-srcmap\ => \-srcmap\, tse1a => tse1a,
    \-vma0\ => VMA(0), \-vma1\ => VMA(1), \-vma2\ => VMA(2), \-vma3\ => VMA(3), \-vma4\ => VMA(4),
    \-vma5\ => VMA(5), \-vma6\ => VMA(6), \-vma7\ => VMA(7),
    \-vmap0\ => int_vmap(0), \-vmap1\ => int_vmap(1), \-vmap2\ => int_vmap(2), \-vmap3\ => int_vmap(3), \-vmap4\ => int_vmap(4),
    \-vmo0\ => int_vmo(0), \-vmo1\ => int_vmo(1), \-vmo2\ => int_vmo(2), \-vmo3\ => int_vmo(3), \-vmo4\ => int_vmo(4),
    \-vmo5\ => int_vmo(5), \-vmo6\ => int_vmo(6), \-vmo7\ => int_vmo(7), \-vmo8\ => int_vmo(8), \-vmo9\ => int_vmo(9),
    \-vmo10\ => int_vmo(10), \-vmo11\ => int_vmo(11), \-vmo12\ => int_vmo(12), \-vmo13\ => int_vmo(13), \-vmo14\ => int_vmo(14),
    \-vmo15\ => int_vmo(15), \-vmo16\ => int_vmo(16), \-vmo17\ => int_vmo(17), \-vmo18\ => int_vmo(18), \-vmo19\ => int_vmo(19),
    \-vmo20\ => int_vmo(20), \-vmo21\ => int_vmo(21), \-vmo22\ => int_vmo(22), \-vmo23\ => int_vmo(23),
    \-adrpar\ => \-adrpar\, \-lvmo22\ => \-lvmo22\, \-lvmo23\ => \-lvmo23\, \-mapdrive\ => \-mapdrive\,
    mf0 => MF(0), mf1 => MF(1), mf2 => MF(2), mf3 => MF(3), mf8 => MF(8), mf9 => MF(9), mf10 => MF(10), mf11 => MF(11),
    mf12 => MF(12), mf13 => MF(13), mf14 => MF(14), mf15 => MF(15), mf16 => MF(16), mf17 => MF(17), mf18 => MF(18), mf19 => MF(19),
    mf20 => MF(20), mf21 => MF(21), mf22 => MF(22), mf23 => MF(23), mf24 => MF(24), mf25 => MF(25), mf26 => MF(26), mf27 => MF(27),
    mf28 => MF(28), mf29 => MF(29), mf30 => MF(30), mf31 => MF(31),
    srcmap => open  -- This should connect to input srcmap if needed
  );

  -- Connect output buses (invert the internal signals)
  VMAP_OUT <= not int_vmap;
  VMO_OUT <= not int_vmo;

end rtl; 