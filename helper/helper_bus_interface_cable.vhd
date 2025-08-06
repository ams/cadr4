library ieee;
use ieee.std_logic_1164.all;

use work.helper.all;

-- cadr1 connectors are given in cadr1:clm
-- cadr connectors are given in cadr:bcpins and cadr:mbcpin

-- bcpins has 80 signals/4 connectors, mbcpin 20 signals/1 connector

entity helper_bus_interface_cable is
  port (
    -- cadr:bcpins
    \mempar in\: out std_logic;
    \-pma21\: in std_logic;
    \-pma20\: in std_logic;
    \-pma19\: in std_logic;
    \-pma18\: in std_logic;
    \-pma17\: in std_logic;
    \-pma16\: in std_logic;
    \-pma15\: in std_logic;
    \-pma14\: in std_logic;
    \-pma13\: in std_logic;
    \-pma12\: in std_logic;
    \-pma11\: in std_logic;
    \-pma10\: in std_logic;
    \-pma9\: in std_logic;
    \-pma8\: in std_logic;
    \-vma7\: in std_logic;
    \-vma6\: in std_logic;
    \-vma5\: in std_logic;
    \-vma4\: in std_logic;
    \-vma3\: in std_logic;
    \-vma2\: in std_logic;
    \-vma1\: in std_logic;
    \-vma0\: in std_logic;    
    \-memack\: in std_logic;
    \-ignpar\: in std_logic;
    \-memgrant\: in std_logic;    
    \int\: in std_logic;
    \mempar out\: in std_logic;
    -- cadr:mbcpin
    mclk7: in std_logic;
    eadr0: in std_logic;
    eadr1: in std_logic;
    eadr2: in std_logic;
    eadr3: in std_logic;
    \-dbread\: in std_logic;
    \-dbwrite\: in std_logic;
    \-busint.lm.reset\: out std_logic;
    \-boot1\: in std_logic;
    \-bus.reset\: in std_logic;
    \lm drive enb\: out std_logic;
    \-bus.power.reset\: in std_logic;
    -- cadr1:clm
    \mempar to lm\: in std_logic;
    \-adr21\: out std_logic;
    \-adr20\: out std_logic;
    \-adr19\: out std_logic;
    \-adr18\: out std_logic;
    \-adr17\: out std_logic;
    \-adr16\: out std_logic;
    \-adr15\: out std_logic;
    \-adr14\: out std_logic;
    \-adr13\: out std_logic;
    \-adr12\: out std_logic;
    \-adr11\: out std_logic;
    \-adr10\: out std_logic;
    \-adr9\: out std_logic;
    \-adr8\: out std_logic;
    \-adr7\: out std_logic;
    \-adr6\: out std_logic;
    \-adr5\: out std_logic;
    \-adr4\: out std_logic;
    \-adr3\: out std_logic;
    \-adr2\: out std_logic;
    \-adr1\: out std_logic;
    \-adr0\: out std_logic;
    \-lm ack\: out std_logic;
    \-lm ignpar\: out std_logic;
    \-lm grant\: out std_logic;
    \-lm int\: out std_logic;
    \mempar from lm\: out std_logic;
    \-mclk7\: out std_logic;
    \spy adr1\: out std_logic;
    \spy adr2\: out std_logic;
    \spy adr3\: out std_logic;
    \spy adr4\: out std_logic;
    \-spy read\: out std_logic;
    \-spy write\: out std_logic;
    \-busint lm reset\: in std_logic;
    \-lm boot\: out std_logic;
    \-lm unibus reset\: out std_logic;
    \-lm memdrive enb\: in std_logic;
    \-lm power reset\: out std_logic
  );
end entity;

architecture structural of helper_bus_interface_cable is
begin

  -- J11
  -- mem31:12 same

  -- J12
  -- mem11:0 same
  \mempar in\ <= \mempar to lm\;
  -- -adrpar same
  -- -pma21:8 and -vma7:0 becomes -adr
  \-adr21\ <= \-pma21\;
  \-adr20\ <= \-pma20\;
  \-adr19\ <= \-pma19\;
  \-adr18\ <= \-pma18\;
  \-adr17\ <= \-pma17\;
  \-adr16\ <= \-pma16\;

  -- J09
  \-adr15\ <= \-pma15\;
  \-adr14\ <= \-pma14\;
  \-adr13\ <= \-pma13\;
  \-adr12\ <= \-pma12\;
  \-adr11\ <= \-pma11\;
  \-adr10\ <= \-pma10\;
  \-adr9\ <= \-pma9\;
  \-adr8\ <= \-pma8\;
  \-adr7\ <= \-vma7\;
  \-adr6\ <= \-vma6\;
  \-adr5\ <= \-vma5\;
  \-adr4\ <= \-vma4\;
  \-adr3\ <= \-vma3\;
  \-adr2\ <= \-vma2\;
  \-adr1\ <= \-vma1\;
  \-adr0\ <= \-vma0\;
  -- -memrq same
  \-lm ack\ <= \-memack\;
  -- -loadmd same  
  \-lm ignpar\ <= \-ignpar\;

  -- J07
  -- spy0:15 same
  \-lm grant\ <= \-memgrant\;  
  -- wrcyc same
  \-lm int\ <= \int\;
  \mempar from lm\ <= \mempar out\;

  -- J08
  \-mclk7\ <= mclk7;
  \spy adr1\ <= eadr0;
  \spy adr2\ <= eadr1;
  \spy adr3\ <= eadr2;
  \spy adr4\ <= eadr3;
  \-spy read\ <= \-dbread\;
  \-spy write\ <= \-dbwrite\;
  \-busint.lm.reset\ <= \-busint lm reset\;
  \-lm boot\ <= \-boot1\;
  \-lm unibus reset\ <= \-bus.reset\;
  \lm drive enb\ <= \-lm memdrive enb\;
  \-lm power reset\ <= \-bus.power.reset\;

end architecture;