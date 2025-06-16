library ieee;
use ieee.std_logic_1164.all;
use work.cadr.all;

entity spc_set is
  port (
    clk4a           : in  std_logic;
    clk4b           : in  std_logic;
    clk4c           : in  std_logic;
    \-destspc\      : in  std_logic;
    destspc         : in  std_logic;
    \-destspcd\     : in  std_logic;
    destspcd        : in  std_logic;
    \-ignpopj\      : in  std_logic;
    jcalf           : in  std_logic;
    jret            : in  std_logic;
    jretf           : in  std_logic;
    popj            : in  std_logic;
    spcdrive        : in  std_logic;
    \-spcdrive\     : in  std_logic;
    spcenb          : in  std_logic;
    \-spcpass\      : in  std_logic;
    spcwpass        : in  std_logic;
    \-spcwpass\     : in  std_logic;
    spush           : in  std_logic;
    \-spush\        : in  std_logic;
    spushd          : in  std_logic;
    \-spushd\       : in  std_logic;
    tse2            : in  std_logic;
    tse3a           : in  std_logic;
    wp4a            : in  std_logic;
    wp4b            : in  std_logic;
    L               : in  std_logic_vector(31 downto 0);
    LPC             : in  std_logic_vector(13 downto 0);
    SPC             : out std_logic_vector(31 downto 0);
    lparity         : in  std_logic;
    lpc13           : in  std_logic;
    spcparok        : out std_logic
  );
end entity;

architecture rtl of spc_set is

  signal spc_all : std_logic_vector(31 downto 0);
  signal spco_all : std_logic_vector(31 downto 0);
  signal spcw_all : std_logic_vector(31 downto 0);
  signal spcptr_all : std_logic_vector(4 downto 0);
  signal spc_par, spcw_par : std_logic;
  signal spc_parok, spcw_parok : std_logic;

begin

  -- Map bus outputs
  SPC <= spc_all;
  SPCO <= spco_all;
  SPCW <= spcw_all;
  SPCPTR <= spcptr_all;
  spcparity <= spc_par;
  spcwparity <= spcw_par;
  spcparok <= spc_parok;
  spcwparok <= spcw_parok;

  spc_inst: cadr_spc port map (
    clk4a           => clk4a,
    \-destspc\      => \-destspc\,
    destspc         => destspc,
    \-destspcd\     => \-destspcd\,
    destspcd        => destspcd,
    \-ignpopj\      => \-ignpopj\,
    jcalf           => jcalf,
    jret            => jret,
    jretf           => jretf,
    l0              => L(0),
    l1              => L(1),
    l2              => L(2),
    l3              => L(3),
    l4              => L(4),
    l5              => L(5),
    l6              => L(6),
    l7              => L(7),
    l8              => L(8),
    l9              => L(9),
    l10             => L(10),
    l11             => L(11),
    l12             => L(12),
    l13             => L(13),
    lpc0            => LPC(0),
    lpc1            => LPC(1),
    lpc2            => LPC(2),
    lpc3            => LPC(3),
    lpc4            => LPC(4),
    lpc5            => LPC(5),
    lpc6            => LPC(6),
    lpc7            => LPC(7),
    lpc8            => LPC(8),
    lpc9            => LPC(9),
    lpc10           => LPC(10),
    lpc11           => LPC(11),
    lpc12           => LPC(12),
    lpc13           => lpc13,
    lparity         => lparity,
    popj            => popj,
    spcdrive        => spcdrive,
    \-spcdrive\     => \-spcdrive\,
    spcenb          => spcenb,
    \-spcpass\      => \-spcpass\,
    spush           => spush,
    \-spush\        => \-spush\,
    spushd          => spushd,
    \-spushd\       => \-spushd\,
    spc0            => spc_all(0),
    spc1            => spc_all(1),
    spc2            => spc_all(2),
    spc3            => spc_all(3),
    spc4            => spc_all(4),
    spc5            => spc_all(5),
    spc6            => spc_all(6),
    spc7            => spc_all(7),
    spc8            => spc_all(8),
    spc9            => spc_all(9),
    spc10           => spc_all(10),
    spc11           => spc_all(11),
    spc12           => spc_all(12),
    spc13           => spc_all(13),
    spc14           => spc_all(14),
    spc15           => spc_all(15),
    spc16           => spc_all(16),
    spc17           => spc_all(17),
    spc18           => spc_all(18),
    spc19           => spc_all(19),
    spc20           => spc_all(20),
    spc21           => spc_all(21),
    spc22           => spc_all(22),
    spc23           => spc_all(23),
    spc24           => spc_all(24),
    spc25           => spc_all(25),
    spc26           => spc_all(26),
    spc27           => spc_all(27),
    spc28           => spc_all(28),
    spc29           => spc_all(29),
    spc30           => spc_all(30),
    spc31           => spc_all(31),
    spcparity       => spc_par,
    spcptr0         => spcptr_all(0),
    spcptr1         => spcptr_all(1),
    spcptr2         => spcptr_all(2),
    spcptr3         => spcptr_all(3),
    spcptr4         => spcptr_all(4)
  );

  spclch_inst: cadr_spclch port map (
    clk4b           => clk4b,
    spc0            => spc_all(0),
    spc1            => spc_all(1),
    spc2            => spc_all(2),
    spc3            => spc_all(3),
    spc4            => spc_all(4),
    spc5            => spc_all(5),
    spc6            => spc_all(6),
    spc7            => spc_all(7),
    spc8            => spc_all(8),
    spc9            => spc_all(9),
    spc10           => spc_all(10),
    spc11           => spc_all(11),
    spc12           => spc_all(12),
    spc13           => spc_all(13),
    spc14           => spc_all(14),
    spc15           => spc_all(15),
    spc16           => spc_all(16),
    spc17           => spc_all(17),
    spc18           => spc_all(18),
    spc19           => spc_all(19),
    spc20           => spc_all(20),
    spc21           => spc_all(21),
    spc22           => spc_all(22),
    spc23           => spc_all(23),
    spc24           => spc_all(24),
    spc25           => spc_all(25),
    spc26           => spc_all(26),
    spc27           => spc_all(27),
    spc28           => spc_all(28),
    spc29           => spc_all(29),
    spc30           => spc_all(30),
    spc31           => spc_all(31),
    spcparity       => spc_par,
    spco0           => spco_all(0),
    spco1           => spco_all(1),
    spco2           => spco_all(2),
    spco3           => spco_all(3),
    spco4           => spco_all(4),
    spco5           => spco_all(5),
    spco6           => spco_all(6),
    spco7           => spco_all(7),
    spco8           => spco_all(8),
    spco9           => spco_all(9),
    spco10          => spco_all(10),
    spco11          => spco_all(11),
    spco12          => spco_all(12),
    spco13          => spco_all(13),
    spco14          => spco_all(14),
    spco15          => spco_all(15),
    spco16          => spco_all(16),
    spco17          => spco_all(17),
    spco18          => spco_all(18),
    spco19          => spco_all(19),
    spco20          => spco_all(20),
    spco21          => spco_all(21),
    spco22          => spco_all(22),
    spco23          => spco_all(23),
    spco24          => spco_all(24),
    spco25          => spco_all(25),
    spco26          => spco_all(26),
    spco27          => spco_all(27),
    spco28          => spco_all(28),
    spco29          => spco_all(29),
    spco30          => spco_all(30),
    spco31          => spco_all(31)
  );

  spcw_inst: cadr_spcw port map (
    clk4c           => clk4c,
    spcwpass        => spcwpass,
    \-spcwpass\     => \-spcwpass\,
    tse2            => tse2,
    tse3a           => tse3a,
    wp4a            => wp4a,
    wp4b            => wp4b,
    spco0           => spco_all(0),
    spco1           => spco_all(1),
    spco2           => spco_all(2),
    spco3           => spco_all(3),
    spco4           => spco_all(4),
    spco5           => spco_all(5),
    spco6           => spco_all(6),
    spco7           => spco_all(7),
    spco8           => spco_all(8),
    spco9           => spco_all(9),
    spco10          => spco_all(10),
    spco11          => spco_all(11),
    spco12          => spco_all(12),
    spco13          => spco_all(13),
    spco14          => spco_all(14),
    spco15          => spco_all(15),
    spco16          => spco_all(16),
    spco17          => spco_all(17),
    spco18          => spco_all(18),
    spco19          => spco_all(19),
    spco20          => spco_all(20),
    spco21          => spco_all(21),
    spco22          => spco_all(22),
    spco23          => spco_all(23),
    spco24          => spco_all(24),
    spco25          => spco_all(25),
    spco26          => spco_all(26),
    spco27          => spco_all(27),
    spco28          => spco_all(28),
    spco29          => spco_all(29),
    spco30          => spco_all(30),
    spco31          => spco_all(31),
    spcw0           => spcw_all(0),
    spcw1           => spcw_all(1),
    spcw2           => spcw_all(2),
    spcw3           => spcw_all(3),
    spcw4           => spcw_all(4),
    spcw5           => spcw_all(5),
    spcw6           => spcw_all(6),
    spcw7           => spcw_all(7),
    spcw8           => spcw_all(8),
    spcw9           => spcw_all(9),
    spcw10          => spcw_all(10),
    spcw11          => spcw_all(11),
    spcw12          => spcw_all(12),
    spcw13          => spcw_all(13),
    spcw14          => spcw_all(14),
    spcw15          => spcw_all(15),
    spcw16          => spcw_all(16),
    spcw17          => spcw_all(17),
    spcw18          => spcw_all(18),
    spcw19          => spcw_all(19),
    spcw20          => spcw_all(20),
    spcw21          => spcw_all(21),
    spcw22          => spcw_all(22),
    spcw23          => spcw_all(23),
    spcw24          => spcw_all(24),
    spcw25          => spcw_all(25),
    spcw26          => spcw_all(26),
    spcw27          => spcw_all(27),
    spcw28          => spcw_all(28),
    spcw29          => spcw_all(29),
    spcw30          => spcw_all(30),
    spcw31          => spcw_all(31),
    spcwparity      => spcw_par
  );

  -- Note: cadr_lpc would be instantiated here if needed for the LPC functionality

end architecture; 