library ieee;
use ieee.std_logic_1164.all;
use work.cadr.all;

entity vma_set is
  port (
    clk1a : in std_logic;
    clk2a : in std_logic;
    clk2c : in std_logic;
    OB : in std_logic_vector(31 downto 0);
    LC : in std_logic_vector(31 downto 0);
    MD : in std_logic_vector(31 downto 0);
    VMAS : in std_logic_vector(31 downto 0);
    \-srcvma\ : in std_logic;
    tse2 : in std_logic;
    \-vmaenb\ : in std_logic;
    vmasela : in std_logic;
    vmaselb : in std_logic;
    \-memstart\ : in std_logic;
    VMA : out std_logic_vector(31 downto 0);
    MF : out std_logic_vector(31 downto 0);
    MAPI : out std_logic_vector(23 downto 12)
  );
end vma_set;

architecture rtl of vma_set is
  -- Internal signals
  signal vmas : std_logic_vector(31 downto 0);

begin

  -- cadr_vma instance
  u_vma: cadr_vma port map (
    clk1a => clk1a, clk2a => clk2a, clk2c => clk2c,
    \-srcvma\ => \-srcvma\, tse2 => tse2, \-vmaenb\ => \-vmaenb\,
    \-vmas0\ => vmas(0), \-vmas1\ => vmas(1), \-vmas2\ => vmas(2), \-vmas3\ => vmas(3),
    \-vmas4\ => vmas(4), \-vmas5\ => vmas(5), \-vmas6\ => vmas(6), \-vmas7\ => vmas(7),
    \-vmas8\ => vmas(8), \-vmas9\ => vmas(9), \-vmas10\ => vmas(10), \-vmas11\ => vmas(11),
    \-vmas12\ => vmas(12), \-vmas13\ => vmas(13), \-vmas14\ => vmas(14), \-vmas15\ => vmas(15),
    \-vmas16\ => vmas(16), \-vmas17\ => vmas(17), \-vmas18\ => vmas(18), \-vmas19\ => vmas(19),
    \-vmas20\ => vmas(20), \-vmas21\ => vmas(21), \-vmas22\ => vmas(22), \-vmas23\ => vmas(23),
    \-vmas24\ => vmas(24), \-vmas25\ => vmas(25), \-vmas26\ => vmas(26), \-vmas27\ => vmas(27),
    \-vmas28\ => vmas(28), \-vmas29\ => vmas(29), \-vmas30\ => vmas(30), \-vmas31\ => vmas(31),
    \-vma0\ => VMA(0), \-vma1\ => VMA(1), \-vma2\ => VMA(2), \-vma3\ => VMA(3), \-vma4\ => VMA(4), \-vma5\ => VMA(5),
    \-vma6\ => VMA(6), \-vma7\ => VMA(7), \-vma8\ => VMA(8), \-vma9\ => VMA(9), \-vma10\ => VMA(10), \-vma11\ => VMA(11),
    \-vma12\ => VMA(12), \-vma13\ => VMA(13), \-vma14\ => VMA(14), \-vma15\ => VMA(15), \-vma16\ => VMA(16), \-vma17\ => VMA(17),
    \-vma18\ => VMA(18), \-vma19\ => VMA(19), \-vma20\ => VMA(20), \-vma21\ => VMA(21), \-vma22\ => VMA(22), \-vma23\ => VMA(23),
    \-vma24\ => VMA(24), \-vma25\ => VMA(25), \-vma26\ => VMA(26), \-vma27\ => VMA(27), \-vma28\ => VMA(28), \-vma29\ => VMA(29),
    \-vma30\ => VMA(30), \-vma31\ => VMA(31),
    mf0 => MF(0), mf1 => MF(1), mf2 => MF(2), mf3 => MF(3), mf4 => MF(4), mf5 => MF(5), mf6 => MF(6), mf7 => MF(7),
    mf8 => MF(8), mf9 => MF(9), mf10 => MF(10), mf11 => MF(11), mf12 => MF(12), mf13 => MF(13), mf14 => MF(14), mf15 => MF(15),
    mf16 => MF(16), mf17 => MF(17), mf18 => MF(18), mf19 => MF(19), mf20 => MF(20), mf21 => MF(21), mf22 => MF(22), mf23 => MF(23),
    mf24 => MF(24), mf25 => MF(25), mf26 => MF(26), mf27 => MF(27), mf28 => MF(28), mf29 => MF(29), mf30 => MF(30), mf31 => MF(31),
    \-vmadrive\ => \-vmadrive\, srcvma => \-srcvma\
  );

  -- cadr_vmas instance
  u_vmas: cadr_vmas port map (
    vmasela => vmasela, vmaselb => vmaselb,
    lc2 => LC(2), lc3 => LC(3), lc14 => LC(14), lc15 => LC(15), lc16 => LC(16), lc17 => LC(17), lc18 => LC(18), lc19 => LC(19),
    lc20 => LC(20), lc21 => LC(21), lc22 => LC(22), lc23 => LC(23), lc24 => LC(24), lc25 => LC(25),
    ob0 => OB(0), ob1 => OB(1), ob10 => OB(10), ob11 => OB(11), ob12 => OB(12), ob13 => OB(13), ob14 => OB(14), ob15 => OB(15),
    ob16 => OB(16), ob17 => OB(17), ob18 => OB(18), ob19 => OB(19), ob20 => OB(20), ob21 => OB(21), ob22 => OB(22), ob23 => OB(23),
    ob28 => OB(28), ob29 => OB(29), ob30 => OB(30), ob31 => OB(31),
    \-memstart\ => \-memstart\,
    \-vma12\ => VMA(12), \-vma13\ => VMA(13), \-vma14\ => VMA(14), \-vma15\ => VMA(15), \-vma16\ => VMA(16), \-vma17\ => VMA(17),
    \-vma18\ => VMA(18), \-vma19\ => VMA(19), \-vma20\ => VMA(20), \-vma21\ => VMA(21), \-vma22\ => VMA(22), \-vma23\ => VMA(23),
    \-md8\ => MD(8), \-md9\ => MD(9), \-md10\ => MD(10), \-md11\ => MD(11), \-md12\ => MD(12), \-md13\ => MD(13),
    \-md14\ => MD(14), \-md15\ => MD(15), \-md16\ => MD(16), \-md17\ => MD(17), \-md18\ => MD(18), \-md19\ => MD(19),
    \-md20\ => MD(20), \-md21\ => MD(21), \-md22\ => MD(22), \-md23\ => MD(23),
    \-vmas0\ => vmas(0), \-vmas1\ => vmas(1), \-vmas2\ => vmas(2), \-vmas3\ => vmas(3),
    \-vmas4\ => vmas(4), \-vmas5\ => vmas(5), \-vmas6\ => vmas(6), \-vmas7\ => vmas(7),
    \-vmas8\ => vmas(8), \-vmas9\ => vmas(9), \-vmas10\ => vmas(10), \-vmas11\ => vmas(11),
    \-vmas12\ => vmas(12), \-vmas13\ => vmas(13), \-vmas14\ => vmas(14), \-vmas15\ => vmas(15),
    \-vmas16\ => vmas(16), \-vmas17\ => vmas(17), \-vmas18\ => vmas(18), \-vmas19\ => vmas(19),
    \-vmas20\ => vmas(20), \-vmas21\ => vmas(21), \-vmas22\ => vmas(22), \-vmas23\ => vmas(23),
    \-vmas28\ => vmas(28), \-vmas29\ => vmas(29), \-vmas30\ => vmas(30), \-vmas31\ => vmas(31),
    mapi12 => MAPI(12), mapi13 => MAPI(13), mapi14 => MAPI(14), mapi15 => MAPI(15), mapi16 => MAPI(16), mapi17 => MAPI(17),
    mapi18 => MAPI(18), mapi19 => MAPI(19), mapi20 => MAPI(20), mapi21 => MAPI(21), mapi22 => MAPI(22), mapi23 => MAPI(23)
  );

  -- Connect VMAS bus (invert the internal signals)
  VMAS <= not vmas;

end rtl; 