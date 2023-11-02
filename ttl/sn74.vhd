library ieee;
use ieee.std_logic_1164.all;

package sn74 is

  component sn7400 is  -- Quadruple 2-input Positive-NAND Gates
    port (
      g1a, g1b : in  std_logic;
      g1q_n    : out std_logic;

      g2a, g2b : in  std_logic;
      g2q_n    : out std_logic;

      g3a, g3b : in  std_logic;
      g3q_n    : out std_logic;

      g4a, g4b : in  std_logic;
      g4q_n    : out std_logic
      );
  end component sn7400;

  component sn7402 is                   -- Quadruple 2-Input Positive-NOR Gates
    port (
      g1a, g1b : in  std_logic;
      g1q_n    : out std_logic;

      g2b, g2a : in  std_logic;
      g2q_n    : out std_logic;

      g3a, g3b : in  std_logic;
      g3q_n    : out std_logic;

      g4a, g4b : in  std_logic;
      g4q_n    : out std_logic
      );
  end component sn7402;

  component sn7404 is                   -- Hex Inverters
    port (
      g1a   : in  std_logic;
      g1q_n : out std_logic;

      g2a   : in  std_logic;
      g2q_n : out std_logic;

      g3a   : in  std_logic;
      g3q_n : out std_logic;

      g4a   : in  std_logic;
      g4q_n : out std_logic;

      g5a   : in  std_logic;
      g5q_n : out std_logic;

      g6a   : in  std_logic;
      g6q_n : out std_logic
      );
  end component sn7404;

  component sn7408 is                   -- Quadruple 2-Input Positive-AND Gates
    port (
      g1a, g1b : in  std_logic;
      g1q      : out std_logic;

      g2a, g2b : in  std_logic;
      g2q      : out std_logic;

      g3a, g3b : in  std_logic;
      g3q      : out std_logic;

      g4a, g4b : in  std_logic;
      g4q      : out std_logic
      );
  end component sn7408;

  component sn7410 is                   -- Tripple 3-Input Positive-NAND Gates
    port (
      g1a, g1b, g1c : in  std_logic;
      g1y_n         : out std_logic;

      g2a, g2b, g2c : in  std_logic;
      g2y_n         : out std_logic;

      g3a, g3b, g3c : in  std_logic;
      g3y_n         : out std_logic
      );
  end component sn7410;

  component sn7411 is                   -- Triple 3-Input Positive-AND Gates
    port (
      g1a, g1b, g1c : in  std_logic;
      g1y           : out std_logic;
      g2a, g2b, g2c : in  std_logic;
      g2y           : out std_logic;
      g3a, g3b, g3c : in  std_logic;
      g3y           : out std_logic
      );
  end component sn7411;

  component sn7420 is                   -- Dual 4-Input Positive-NAND Gates
    port (
      g1a, g1b, g1c, g1d : in  std_logic;
      g1y_n              : out std_logic;

      g2a, g2b, g2c, g2d : in  std_logic;
      g2y_n              : out std_logic
      );
  end component sn7420;

  component sn7428 is                   -- Quadruple 2-input Positive-NOR Gates
    port (
      g1a, g1b : in  std_logic;
      g1q_n    : out std_logic;

      g2a, g2b : in  std_logic;
      g2q_n    : out std_logic;

      g3a, g3b : in  std_logic;
      g3q_n    : out std_logic;

      g4a, g4b : in  std_logic;
      g4q_n    : out std_logic
      );
  end component sn7428;

  component sn7432 is                   -- Quadruple 2-Input Positive-OR Gates
    port (
      g1a, g1b : in  std_logic;
      g1y      : out std_logic;

      g2a, g2b : in  std_logic;
      g2y      : out std_logic;

      g3a, g3b : in  std_logic;
      g3y      : out std_logic;

      g4a, g4b : in  std_logic;
      g4y      : out std_logic
      );
  end component sn7432;

  component sn7437 is  -- Quadruple 2-Input Positive-NAND Buffers
    port (
      g1a, g1b : in  std_logic;
      g1y      : out std_logic;

      g2a, g2b : in  std_logic;
      g2y      : out std_logic;

      g3a, g3b : in  std_logic;
      g3y      : out std_logic;

      g4a, g4b : in  std_logic;
      g4y      : out std_logic
      );
  end component sn7437;

  component sn7451 is                   -- AND-OR-invert gates
    port (
      g1a, g1b, g1c, g1d : in  std_logic;
      g1y                : out std_logic;

      g2a, g2b, g2c, g2d : in  std_logic;
      g2y                : out std_logic
      );
  end component sn7451;

  --- Unsorted

  component sn7486 is                   -- Quadruple 2-input Exclusive-OR Gates
    port (
      g1a, g1b : in  std_logic;
      g1y      : out std_logic;

      g2a, g2b : in  std_logic;
      g2y      : out std_logic;

      g3a, g3b : in  std_logic;
      g3y      : out std_logic;

      g4a, g4b : in  std_logic;
      g4y      : out std_logic
      );
  end component sn7486;

  component sn74260 is                  -- Dual 5-Input Positive-NOR Gates
    port (
      g1a, g2a, g3a, g4a, g5a : in  std_logic;
      g1y_n                   : out std_logic
      );
  end component sn74260;

  component sn74240 is  -- Octal Buffers and Line Drivers With 3-State Outputs
    port (
      aenb_n                     : in  std_logic;
      ain0, ain1, ain2, ain3     : in  std_logic;
      aout0, aout1, aout2, aout3 : out std_logic;

      benb_n                     : in  std_logic;
      bin0                       : in  std_logic;
      bin1, bin2, bin3           : in  std_logic;
      bout0, bout1, bout2, bout3 : out std_logic
      );
  end component sn74240;

end package sn74;

package body sn74 is

end package body sn74;
