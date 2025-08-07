-- Quadruple 2-Input Positive-NAND Buffers with Open-Collector Outputs

library ieee;
use ieee.std_logic_1164.all;

use work.misc.all;

entity sn7438 is
  port (
    g1a   : in  std_logic;
    g1b   : in  std_logic;
    g1q_n : out std_logic;

    g2a   : in  std_logic;
    g2b   : in  std_logic;
    g2q_n : out std_logic;

    g3a   : in  std_logic;
    g3b   : in  std_logic;
    g3q_n : out std_logic;

    g4a   : in  std_logic;
    g4b   : in  std_logic;
    g4q_n : out std_logic
    );
end;

architecture functional of sn7438 is
  signal g1a_i, g1b_i, g2a_i, g2b_i, g3a_i, g3b_i, g4a_i, g4b_i : std_logic;
  signal g1_nand, g2_nand, g3_nand, g4_nand : std_logic;
begin

  g1a_i <= ttl_input(g1a);
  g1b_i <= ttl_input(g1b);
  g2a_i <= ttl_input(g2a);
  g2b_i <= ttl_input(g2b);
  g3a_i <= ttl_input(g3a);
  g3b_i <= ttl_input(g3b);
  g4a_i <= ttl_input(g4a);
  g4b_i <= ttl_input(g4b);

  g1_nand <= not (g1a_i and g1b_i);
  g2_nand <= not (g2a_i and g2b_i);
  g3_nand <= not (g3a_i and g3b_i);
  g4_nand <= not (g4a_i and g4b_i);

  -- Open-collector outputs: can only drive low or high-z
  -- External pull-up resistor required for high
  g1q_n <= '0' when g1_nand = '0' else 'Z' when g1_nand = '1' else g1_nand;
  g2q_n <= '0' when g2_nand = '0' else 'Z' when g2_nand = '1' else g2_nand;
  g3q_n <= '0' when g3_nand = '0' else 'Z' when g3_nand = '1' else g3_nand;
  g4q_n <= '0' when g4_nand = '0' else 'Z' when g4_nand = '1' else g4_nand;

end;