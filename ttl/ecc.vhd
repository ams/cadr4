-- Engineered Components Company

library ieee;
use ieee.std_logic_1164.all;

package ecc is

  -- 25ns time delay, 5ns increments
  component ttldm_25 is
    port (
      input                                 : in  std_logic;
      o_5ns, o_10ns, o_15ns, o_20ns, o_25ns : out std_logic
      );
  end component;

  -- 50ns time delay, 10ns increments
  component ttldm_50 is
    port (
      input                                  : in  std_logic;
      o_10ns, o_20ns, o_30ns, o_40ns, o_50ns : out std_logic
      );
  end component;

  -- 100ns time delay, 20ns increments
  component ttldm_100 is
    port (
      input                                   : in  std_logic;
      o_20ns, o_40ns, o_60ns, o_80ns, o_100ns : out std_logic
      );
  end component;

  -- 250ns time delay, 50ns increments
  component ttldm_250 is
    port (
      input                                      : in  std_logic;
      o_50ns, o_100ns, o_150ns, o_200ns, o_250ns : out std_logic
      );
  end component;

end;
