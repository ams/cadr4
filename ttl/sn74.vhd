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
      i1, i2, i3, i4, i5 : in  std_logic;
      o1                 : out std_logic
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

end package sn74;

package body sn74 is

end package body sn74;