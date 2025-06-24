-- Intel components

library ieee;
use ieee.std_logic_1164.all;

-- the component names in this package are exact
-- there should not be any aliases

package intel is

  component d2147
    port(
      a0   : in  std_logic;
      a1   : in  std_logic;
      a2   : in  std_logic;
      a3   : in  std_logic;
      a4   : in  std_logic;
      a5   : in  std_logic;
      do   : out std_logic;
      we_n : in  std_logic;
      ce_n : in  std_logic;
      di   : in  std_logic;
      a11  : in  std_logic;
      a10  : in  std_logic;
      a9   : in  std_logic;
      a8   : in  std_logic;
      a7   : in  std_logic;
      a6   : in  std_logic);
  end component;

end;
