-- Dual 2-Line To 4-Line Decoders/Demultiplexers

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74139 is
  port (
    SEL  : in  std_logic_vector (1 downto 0);
    nENB : in  std_logic;
    nY   : out std_logic_vector (3 downto 0)
    );
end;

architecture rtl of sn74139 is
  signal enable : std_logic;
  signal S0, nS0, S1, nS1 : std_logic;
begin
  enable <= not nENB;
  S0 <= SEL(0);
  nS0 <= not SEL(0);
  S1 <= SEL(1);
  nS1 <= not SEL(1);

  nY(0) <= not (enable and nS1 and nS0);
  nY(1) <= not (enable and nS1 and  S0);
  nY(2) <= not (enable and  S1 and nS0);
  nY(3) <= not (enable and  S1 and  S0);
end;
