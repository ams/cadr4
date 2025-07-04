library ieee;
use ieee.std_logic_1164.all;

entity cadr_clock1 is
  port (
    \-clock reset b\ : in  std_logic;
    \-hang\          : in  std_logic;
    cyclecompleted   : out std_logic;
    \-tpr0\          : out std_logic;
    \-tpr40\         : out std_logic;
    \-tprend\        : out std_logic;
    \-tpw20\         : out std_logic;
    \-tpw40\         : out std_logic;
    \-tpw50\         : out std_logic;
    \-tpw30\         : out std_logic;
    \-tpw10\         : out std_logic;
    -- -tpdone = -tpw60
    \-tpw60\         : out std_logic;
    \-tpw70\         : out std_logic;
    \-tpw75\         : out std_logic;
    \-tpw65\         : out std_logic;
    \-tpw55\         : out std_logic;
    \-tpw30a\        : out std_logic;
    \-tpw40a\        : out std_logic;
    \-tpw45\         : out std_logic;
    \-tpw35\         : out std_logic;
    \-tpw25\         : out std_logic;
    \-tpr100\        : out std_logic;
    \-tpr140\        : out std_logic;
    \-tpr160\        : out std_logic;
    tprend           : out std_logic;
    sspeed1          : in  std_logic;
    sspeed0          : in  std_logic;
    \-ilong\         : in  std_logic;
    \-tpr75\         : out std_logic;
    \-tpr115\        : out std_logic;
    \-tpr85\         : out std_logic;
    \-tpr125\        : out std_logic;
    \-tpr10\         : out std_logic;
    \-tpr20a\        : out std_logic;
    \-tpr25\         : out std_logic;
    \-tpr15\         : out std_logic;
    \-tpr5\          : out std_logic;
    \-tpr80\         : out std_logic;
    \-tpr60\         : out std_logic;
    \-tpr20\         : out std_logic;
    \-tpr180\        : out std_logic;
    \-tpr200\        : out std_logic;
    \-tpr120\        : out std_logic;
    \-tpr110\        : out std_logic;
    \-tpr120a\       : out std_logic;
    \-tpr105\        : out std_logic;
    \-tpr70\         : out std_logic;
    \-tpr80a\        : out std_logic;
    \-tpr65\         : out std_logic
    );
end;
