library ieee;
use ieee.std_logic_1164.all;

library work;
use work.cadr.all;

entity opc is
  port (
    -- Clock and control signals
    \-clk5\         : in  std_logic;
    opcclk          : in  std_logic;
    \-opcinh\       : in  std_logic;
    tse1b           : in  std_logic;
    
    -- Control signals for opcd
    \-srcopc\       : in  std_logic;
    \-srcdc\        : in  std_logic;
    \-srcpdlidx\    : in  std_logic;
    \-srcpdlptr\    : in  std_logic;
    
    -- Bus signals
    PC              : in  std_logic_vector(13 downto 0);
    DC              : in  std_logic_vector(9 downto 0);
    
    -- Output bus signals
    OPC             : out std_logic_vector(13 downto 0);
    MF              : out std_logic_vector(31 downto 0);
    
    -- Individual control output signals
    opcclka         : out std_logic;
    opcclkb         : out std_logic;
    opcclkc         : out std_logic;
    opcinha         : out std_logic;
    opcinhb         : out std_logic;
    \-opcdrive\     : out std_logic;
    dcdrive         : out std_logic;
    \-zero16.drive\ : out std_logic;
    zero16          : out std_logic;
    \zero16.drive\  : out std_logic;
    \zero12.drive\  : out std_logic
  );
end opc;

architecture structure of opc is

  -- Internal OPC signals connecting opcs to opcd
  signal opc_internal : std_logic_vector(13 downto 0);

begin

  -- Map the internal OPC signals to the output OPC bus
  OPC <= opc_internal;

  -- OPCS component (Old PC Save)
  u_opcs : cadr_opcs port map(
    \-clk5\ => \-clk5\,
    opcclk => opcclk,
    \-opcinh\ => \-opcinh\,
    pc0 => PC(0), pc1 => PC(1), pc2 => PC(2), pc3 => PC(3), pc4 => PC(4), pc5 => PC(5), pc6 => PC(6), pc7 => PC(7), pc8 => PC(8), pc9 => PC(9), pc10 => PC(10), pc11 => PC(11), pc12 => PC(12), pc13 => PC(13),
    opc0 => opc_internal(0), opc1 => opc_internal(1), opc2 => opc_internal(2), opc3 => opc_internal(3), opc4 => opc_internal(4), opc5 => opc_internal(5), opc6 => opc_internal(6), opc7 => opc_internal(7), opc8 => opc_internal(8), opc9 => opc_internal(9), opc10 => opc_internal(10), opc11 => opc_internal(11), opc12 => opc_internal(12), opc13 => opc_internal(13),
    opcclka => opcclka, opcclkb => opcclkb, opcclkc => opcclkc, opcinha => opcinha, opcinhb => opcinhb
  );

  -- OPCD component (OPC Drive)
  u_opcd : cadr_opcd port map(
    \-srcopc\ => \-srcopc\,
    \-srcdc\ => \-srcdc\,
    \-srcpdlidx\ => \-srcpdlidx\,
    \-srcpdlptr\ => \-srcpdlptr\,
    tse1b => tse1b,
    opc0 => opc_internal(0), opc1 => opc_internal(1), opc2 => opc_internal(2), opc3 => opc_internal(3), opc4 => opc_internal(4), opc5 => opc_internal(5), opc6 => opc_internal(6), opc7 => opc_internal(7), opc8 => opc_internal(8), opc9 => opc_internal(9), opc10 => opc_internal(10), opc11 => opc_internal(11), opc12 => opc_internal(12), opc13 => opc_internal(13),
    dc0 => DC(0), dc1 => DC(1), dc2 => DC(2), dc3 => DC(3), dc4 => DC(4), dc5 => DC(5), dc6 => DC(6), dc7 => DC(7), dc8 => DC(8), dc9 => DC(9),
    mf0 => MF(0), mf1 => MF(1), mf2 => MF(2), mf3 => MF(3), mf4 => MF(4), mf5 => MF(5), mf6 => MF(6), mf7 => MF(7), mf8 => MF(8), mf9 => MF(9), mf10 => MF(10), mf11 => MF(11), mf12 => MF(12), mf13 => MF(13), mf14 => MF(14), mf15 => MF(15), mf16 => MF(16), mf17 => MF(17), mf18 => MF(18), mf19 => MF(19), mf20 => MF(20), mf21 => MF(21), mf22 => MF(22), mf23 => MF(23), mf24 => MF(24), mf25 => MF(25), mf26 => MF(26), mf27 => MF(27), mf28 => MF(28), mf29 => MF(29), mf30 => MF(30), mf31 => MF(31),
    \-opcdrive\ => \-opcdrive\,
    dcdrive => dcdrive,
    \-zero16.drive\ => \-zero16.drive\,
    zero16 => zero16,
    \zero16.drive\ => \zero16.drive\,
    \zero12.drive\ => \zero12.drive\
  );

end structure; 