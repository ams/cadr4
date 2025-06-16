library ieee;
use ieee.std_logic_1164.all;

package set is

  component prom is
    port (
      hi2             : in  std_logic;
      PC              : in  std_logic_vector(13 downto 0);
      \-idebug\       : in  std_logic;
      \-promdisabled\ : in  std_logic;
      \-iwriteda\     : in  std_logic;
      \-ape\          : in  std_logic;
      \-pdlpe\        : in  std_logic;
      \-spe\          : in  std_logic;
      \-mpe\          : in  std_logic;
      \-mempe\        : in  std_logic;
      \-v1pe\         : in  std_logic;
      \-v0pe\         : in  std_logic;
      \-dpe\          : in  std_logic;
      \-ipe\          : in  std_logic;
      dpe             : out std_logic;
      ipe             : out std_logic;
      I               : out std_logic_vector(48 downto 0)
    );
  end component;

end package;
