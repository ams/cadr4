library ieee;
use ieee.std_logic_1164.all;

library work;
use work.ecc.ttldm_250;

entity dip_td250 is
  port (
    p1  : in  std_logic;
    p4  : out std_logic;
    p6  : out std_logic;
    p8  : out std_logic;
    p10 : out std_logic;
    p12 : out std_logic
    );
end entity;

architecture dip of dip_td250 is
begin
  U1 : ttldm_250
    port map (
      input   => p1,
      o_50ns  => p12,
      o_100ns => p4,
      o_150ns => p10,
      o_200ns => p6,
      o_250ns => p8
      );
end architecture;
