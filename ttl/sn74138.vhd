-- 3-Line To 8-Line Decoders/Demultiplexers

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74138 is
  port (
    SEL             : in  std_logic_vector (2 downto 0);
    nY              : out std_logic_vector (7 downto 0);
    nCE0, nCE1, CE2 : in  std_logic
    );
end;

architecture rtl of sn74138 is
  signal enable : std_logic;
  signal nS0, nS1, nS2 : std_logic;
  signal S0, S1, S2 : std_logic;
begin
  S0 <= SEL(0);
  S1 <= SEL(1);
  S2 <= SEL(2);
  nS0 <= not SEL(0);
  nS1 <= not SEL(1);
  nS2 <= not SEL(2);
  enable <= CE2 and (not nCE1) and (not nCE0);
  nY(0) <= not (enable and nS0 and nS1 and nS2);
  nY(1) <= not (enable and  S0 and nS1 and nS2);
  nY(2) <= not (enable and nS0 and  S1 and nS2);
  nY(3) <= not (enable and  S0 and  S1 and nS2);
  nY(4) <= not (enable and nS0 and nS1 and  S2);
  nY(5) <= not (enable and  S0 and nS1 and  S2);
  nY(6) <= not (enable and nS0 and  S1 and  S2);
  nY(7) <= not (enable and  S0 and  S1 and  S2);
end;
