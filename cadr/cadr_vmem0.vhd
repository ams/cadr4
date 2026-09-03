library ieee;
use ieee.std_logic_1164.all;

entity cadr_vmem0 is
  port (
    \-vm0wpa\       : in     std_logic;
    \-vm0wpb\       : in     std_logic;
    \-vma27\        : in     std_logic;
    \-vma28\        : in     std_logic;
    \-vma29\        : in     std_logic;
    \-vma30\        : in     std_logic;
    \-vma31\        : in     std_logic;
    mapi13          : in     std_logic;
    mapi14          : in     std_logic;
    mapi15          : in     std_logic;
    mapi16          : in     std_logic;
    mapi17          : in     std_logic;
    mapi18          : in     std_logic;
    mapi19          : in     std_logic;
    mapi20          : in     std_logic;
    mapi21          : in     std_logic;
    mapi22          : in     std_logic;
    mapi23          : in     std_logic;
    memstart        : in     std_logic;
    srcmap          : in     std_logic;
    vmoparodd       : in     std_logic;
    \-mapi23\       : inout  std_logic;
    \-use.map\      : inout  std_logic;
    \-vmap0\        : inout  std_logic;
    \-vmap1\        : inout  std_logic;
    \-vmap2\        : inout  std_logic;
    \-vmap3\        : inout  std_logic;
    \-vmap4\        : inout  std_logic;
    vm0pari         : inout  std_logic;
    vpari           : inout  std_logic;
    v0parok         : out    std_logic;
    vmoparok        : out    std_logic
  );
end entity;
