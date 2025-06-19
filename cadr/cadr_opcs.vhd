library ieee;
use ieee.std_logic_1164.all;

entity cadr_opcs is
  port (
    hi2       : in  std_logic;
    opc13     : out std_logic;
    pc13      : in  std_logic;
    opcinha   : out std_logic;
    opcclka   : out std_logic;
    pc12      : in  std_logic;
    opc12     : out std_logic;
    opc11     : out std_logic;
    pc11      : in  std_logic;
    pc10      : in  std_logic;
    opc10     : out std_logic;
    opc9      : out std_logic;
    pc9       : in  std_logic;
    pc8       : in  std_logic;
    opc8      : out std_logic;
    opc7      : out std_logic;
    pc7       : in  std_logic;
    pc6       : in  std_logic;
    opc6      : out std_logic;
    \-opcinh\ : in  std_logic;
    opcinhb   : out std_logic;
    opc5      : out std_logic;
    pc5       : in  std_logic;
    opcclkb   : out std_logic;
    pc4       : in  std_logic;
    opc4      : out std_logic;
    opc3      : out std_logic;
    pc3       : in  std_logic;
    pc2       : in  std_logic;
    opc2      : out std_logic;
    opc1      : out std_logic;
    pc1       : in  std_logic;
    pc0       : in  std_logic;
    opc0      : out std_logic;
    \-clk5\   : in  std_logic;
    opcclk    : in  std_logic;
    opcclkc   : out std_logic
    );
end;
