library ieee;
use ieee.std_logic_1164.all;

entity cadr_clock2 is
  port (
    clk4             : out std_logic;
    \-clk0\          : out std_logic;
    mclk7            : out std_logic;
    \-mclk0\         : out std_logic;
    \-wp1\           : out std_logic;
    tpwp             : out std_logic;
    \-wp2\           : out std_logic;
    \-wp3\           : out std_logic;
    \-wp4\           : out std_logic;
    \-tprend\        : in  std_logic;
    tpclk            : out std_logic;
    \-tptse\         : out std_logic;
    \-tpr25\         : in  std_logic;
    \-clock reset b\ : in  std_logic;
    tptse            : out std_logic;
    \-tpw70\         : in  std_logic;
    \-tpr0\          : in  std_logic;
    \-tpr5\          : in  std_logic;
    \-tpw30\         : in  std_logic;
    \-machruna\      : in  std_logic;
    tpwpiram         : out std_logic;
    \-wp5\           : out std_logic;
    clk5             : out std_logic;
    mclk5            : out std_logic;
    \-tpw45\         : in  std_logic;
    \-tse1\          : out std_logic;
    \-tse2\          : out std_logic;
    \-tse3\          : out std_logic;
    \-tse4\          : out std_logic;
    clk1             : out std_logic;
    clk2             : out std_logic;
    clk3             : out std_logic;
    mclk1            : out std_logic;
    machrun          : in  std_logic;
    \-tpclk\         : out std_logic
    );
end;
