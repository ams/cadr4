library ieee;
use ieee.std_logic_1164.all;

package sn74 is

  component sn7400 is
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

  component sn7402 is
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

  component sn7404 is
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

  component sn7408 is
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

  component sn7410 is
    port (
      g1a, g1b, g1c : in  std_logic;
      g1y_n         : out std_logic;

      g2a, g2b, g2c : in  std_logic;
      g2y_n         : out std_logic;

      g3a, g3b, g3c : in  std_logic;
      g3y_n         : out std_logic
      );
  end component sn7410;

  component sn7411 is
    port (
      g1a, g1b, g1c : in  std_logic;
      g1y           : out std_logic;
      g2a, g2b, g2c : in  std_logic;
      g2y           : out std_logic;
      g3a, g3b, g3c : in  std_logic;
      g3y           : out std_logic
      );
  end component sn7411;

  component sn7420 is
    port (
      g1a, g1b, g1c, g1d : in  std_logic;
      g1y_n              : out std_logic;

      g2a, g2b, g2c, g2d : in  std_logic;
      g2y_n              : out std_logic
      );
  end component sn7420;

  component sn74260 is
    port (
      g1a, g2a, g3a, g4a, g5a : in  std_logic;
      g1y_n                   : out std_logic
      );
  end component sn74260;

  component sn7432 is
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

  component sn7451 is
    port (
      g1a, g1b, g1c, g1d : in  std_logic;
      g1y                : out std_logic;

      g2a, g2b, g2c, g2d : in  std_logic;
      g2y                : out std_logic
      );
  end component sn7451;

  component sn7486 is
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

  component sn74244 is
    port (
      aenb_n                     : in  std_logic;
      ain0, ain1, ain2, ain3     : in  std_logic;
      aout0, aout1, aout2, aout3 : out std_logic;

      benb_n                     : in  std_logic;
      bin0                       : in  std_logic;
      bin1, bin2, bin3           : in  std_logic;
      bout0, bout1, bout2, bout3 : out std_logic
      );
  end component sn74244;

  component sn7414 is
    port (
      g1a, g2a, g3a, g4a, g5a, g6a             : in  std_logic;
      g1q_n, g2q_n, g3q_n, g4q_n, g5q_n, g6q_n : out std_logic
      );
  end component sn7414;

  component sn7428 is
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

  component sn7437 is
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

  component sn74240 is
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
