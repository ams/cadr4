library ieee;
use ieee.std_logic_1164.all;

entity busint_clm is
  port (
    \-mclk7\        : inout  std_logic;
    \-memrq\        : inout  std_logic;
    \-xbus power reset\ : inout  std_logic;
    \hi 15-30\      : inout  std_logic;
    wrcyc           : inout  std_logic;
    \-clk\          : out    std_logic;
    clk0            : out    std_logic
  );
end entity busint_clm;
