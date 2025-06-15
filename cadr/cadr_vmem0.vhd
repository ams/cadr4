library ieee;
use ieee.std_logic_1164.all;

entity cadr_vmem0 is
  port (
    \-vmap0\   : out std_logic;
    \-vmap1\   : out std_logic;
    \-vmap2\   : out std_logic;
    \-vmap3\   : out std_logic;
    \-vmap4\   : out std_logic;
    vpari      : out std_logic;
    gnd        : in  std_logic;
    \-vma27\   : in  std_logic;
    \-vma28\   : in  std_logic;
    \-vma29\   : in  std_logic;
    vm0pari    : out std_logic;
    \-vma30\   : in  std_logic;
    \-vma31\   : in  std_logic;
    \-mapi23\  : out std_logic;
    mapi22     : in  std_logic;
    mapi21     : in  std_logic;
    mapi20     : in  std_logic;
    mapi19     : in  std_logic;
    mapi18     : in  std_logic;
    mapi17     : in  std_logic;
    mapi16     : in  std_logic;
    mapi15     : in  std_logic;
    mapi14     : in  std_logic;
    mapi13     : in  std_logic;
    \-vm0wpb\  : in  std_logic;
    mapi23     : in  std_logic;
    \-vm0wpa\  : in  std_logic;
    memstart   : in  std_logic;
    srcmap     : in  std_logic;
    \-use.map\ : out std_logic;
    v0parok    : out std_logic;
    vmoparodd  : in  std_logic;
    vmoparok   : out std_logic
    );
end;
