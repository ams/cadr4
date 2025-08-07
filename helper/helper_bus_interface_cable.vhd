library ieee;
use ieee.std_logic_1164.all;

-- cadr1 connectors are given in cadr1:clm
-- cadr connectors are given in cadr:bcpins and cadr:mbcpin

-- bcpins has 80 signals/4 connectors, mbcpin 20 signals/1 connector

-- there are two independent busses on this cable: memory and diagnostic

-- only different signals are given below, the rest are the same so they are 
-- automatically connected in VHDL. These signals are written in comments.

-- mem and spy are bidirectional data lines
-- -ignpar is from busint, XBUS.IGNPAR
-- -adr and -adrpar is from cpu
-- -memrq is from cpu, -memack and -memgrant are from busint
-- -loadmd from busint

entity helper_bus_interface_cable is
  port (
    -- cadr:bcpins

    -- connector 1AJ1
    -- mem31:12  

    -- connector 1BJ1
    -- mem31:12
    \mempar in\: out std_logic;
    -- -adrpar
    \-pma21\: in std_logic;
    \-pma20\: in std_logic;
    \-pma19\: in std_logic;
    \-pma18\: in std_logic;
    \-pma17\: in std_logic;
    \-pma16\: in std_logic;

    -- connector 1CJ1
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
    -- -memrq
    \-memack\: out std_logic;
    -- -loadmd
    \-ignpar\: out std_logic;

    -- connector 3AJ1
    -- spy0:15
    \-memgrant\: out std_logic;    
    -- wrcyc
    \int\: in std_logic;
    \mempar out\: in std_logic;

    -- cadr:mbcpin
    -- connector 1AJ1
    mclk7: in std_logic;
    eadr0: out std_logic;
    eadr1: out std_logic;
    eadr2: out std_logic;
    eadr3: out std_logic;
    \-dbread\: out std_logic;
    \-dbwrite\: out std_logic;
    \-busint.lm.reset\: out std_logic;
    \-boot1\: out std_logic;
    \-bus.reset\: in std_logic;
    \lm drive enb\: out std_logic;
    \-bus.power.reset\: in std_logic;

    -- cadr1:clm

    -- connector J11
    -- mem31:12

    -- connector J12
    -- mem11:0
    \mempar to lm\: in std_logic;
    -- -adrpar
    \-adr21\: out std_logic;
    \-adr20\: out std_logic;
    \-adr19\: out std_logic;
    \-adr18\: out std_logic;
    \-adr17\: out std_logic;
    \-adr16\: out std_logic;

    -- connector J09
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
    -- -memrq
    \-lm ack\: in std_logic;
    -- -loadmd
    \-lm ignpar\: in std_logic;

    -- connector J07
    -- spy0:15
    \-lm grant\: in std_logic;
    -- wrcyc
    \lm int\: out std_logic;
    \mempar from lm\: out std_logic;

    -- connector J08
    \-mclk7\: out std_logic;
    \spy adr1\: in std_logic;
    \spy adr2\: in std_logic;
    \spy adr3\: in std_logic;
    \spy adr4\: in std_logic;
    \-spy read\: in std_logic;
    \-spy write\: in std_logic;
    \-busint lm reset\: in std_logic;
    \-lm boot\: in std_logic;
    \-lm unibus reset\: out std_logic;
    \lm memdrive enb\: in std_logic;
    \-lm power reset\: out std_logic
  );
end entity;

architecture structural of helper_bus_interface_cable is
begin

  -- J11
  -- mem31:12

  -- J12
  -- mem11:0
  \mempar in\ <= \mempar to lm\;
  -- -adrpar
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
  -- -memrq
  \-memack\ <= \-lm ack\;
  -- -loadmd
  \-ignpar\ <= \-lm ignpar\;

  -- J07
  -- spy0:15
  \-memgrant\ <= \-lm grant\;  
  -- wrcyc
  \lm int\ <= \int\;
  \mempar from lm\ <= \mempar out\;

  -- J08
  \-mclk7\ <= mclk7;
  eadr0 <= \spy adr1\;
  eadr1 <= \spy adr2\;
  eadr2 <= \spy adr3\;
  eadr3 <= \spy adr4\;
  \-dbread\ <= \-spy read\;
  \-dbwrite\ <= \-spy write\;
  \-busint.lm.reset\ <= \-busint lm reset\;
  \-boot1\ <= \-lm boot\;
  \-lm unibus reset\ <= \-bus.reset\;
  \lm drive enb\ <= \lm memdrive enb\;
  \-lm power reset\ <= \-bus.power.reset\;

end architecture;