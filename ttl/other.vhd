library ieee;
use ieee.std_logic_1164.all;

package other is

  component td25 is                     -- 25ns time delay, 5ns increments
    port (
      input                                 : in  std_logic;
      o_5ns, o_10ns, o_15ns, o_20ns, o_25ns : out std_logic
      );
  end component;

  component td50 is                     -- 50ns time delay, 10ns increments
    port (
      input                                  : in  std_logic;
      o_10ns, o_20ns, o_30ns, o_40ns, o_50ns : out std_logic
      );
  end component;

  component td100 is                    -- 100ns time delay, 20ns increments
    port (
      input                                   : in  std_logic;
      o_20ns, o_40ns, o_60ns, o_80ns, o_100ns : out std_logic
      );
  end component;

  component td250 is                    -- 250ns time delay, 50ns increments
    port (
      input                                      : in  std_logic;
      o_50ns, o_100ns, o_150ns, o_200ns, o_250ns : out std_logic
      );
  end component;

  component am93s48 is                  -- 12-input parity checker/generator
    port (
      i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11 : in  std_logic;
      pe                                               : out std_logic;
      po                                               : out std_logic
      );
  end component;

  component til309 is
    port (
      i1, i2, i4, i8 : in  std_logic;
      dp             : in  std_logic;
      latch          : in  std_logic;
      blank_n        : in  std_logic;
      ldp            : in  std_logic;
      test_n         : in  std_logic;
      l1, l2, l4, l8 : out std_logic
      );
  end component;

end;

package body other is

end;
