library ieee;
use ieee.std_logic_1164.all;

entity cadr_vctl2 is
  port (
    mapwr0d        : out std_logic;
    \-wmapd\       : out std_logic;
    \-vma26\       : in  std_logic;
    mapwr1d        : out std_logic;
    \-vma25\       : in  std_logic;
    wp1a           : in  std_logic;
    \-vm0wpa\      : out std_logic;
    \-vm0wpb\      : out std_logic;
    \-vm1wpa\      : out std_logic;
    wp1b           : in  std_logic;
    \-vm1wpb\      : out std_logic;
    \-lvmo23\      : in  std_logic;
    \-pfr\         : out std_logic;
    \-wmap\        : out std_logic;
    wmap           : out std_logic;
    \-memrq\       : out std_logic;
    memrq          : in  std_logic;
    \-memprepare\  : out std_logic;
    memprepare     : in  std_logic;
    destmem        : out std_logic;
    \-destmem\     : in  std_logic;
    mdsela         : out std_logic;
    \-destmdr\     : in  std_logic;
    clk2c          : in  std_logic;
    mdselb         : out std_logic;
    \-destvma\     : in  std_logic;
    \-ifetch\      : in  std_logic;
    \-vmaenb\      : out std_logic;
    vmasela        : out std_logic;
    vmaselb        : out std_logic;
    wrcyc          : in  std_logic;
    \lm drive enb\ : in  std_logic;
    \-memdrive.a\  : out std_logic;
    \-memdrive.b\  : out std_logic;
    \-memwr\       : out std_logic;
    \-memrd\       : out std_logic;
    ir20           : in  std_logic;
    ir19           : in  std_logic;
    \use.md\       : out std_logic;
    \-srcmd\       : in  std_logic;
    nopa           : out std_logic;
    \-nopa\        : in  std_logic
    );
end;
