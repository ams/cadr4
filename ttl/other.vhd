library ieee;
use ieee.std_logic_1164.all;

package other is

  component td25 is
    port (
      clk                                   : in  std_logic;
      o_5ns, o_10ns, o_15ns, o_20ns, o_25ns : out std_logic
      );
  end component td25;

  component td50 is
    port (
      clk                                    : in  std_logic;
      o_10ns, o_20ns, o_30ns, o_40ns, o_50ns : out std_logic
      );
  end component td50;

  component td100 is
    port (
      clk                                     : in  std_logic;
      o_20ns, o_40ns, o_60ns, o_80ns, o_100ns : out std_logic
      );
  end component td100;

  component td250 is
    port (
      clk                                        : in  std_logic;
      o_50ns, o_100ns, o_150ns, o_200ns, o_250ns : out std_logic
      );
  end component td250;

end package other;

package body other is

end package body other;
