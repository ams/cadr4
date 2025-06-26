-- High Speed 6-Bit Identity Comparator
-- Fairchild Semiconductor 93S46
-- doc/ttl/dm93s46.pdf

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

entity dm93s46 is
  port (
    a0  : in  std_logic;
    b0  : in  std_logic;
    a1  : in  std_logic;
    b1  : in  std_logic;
    a2  : in  std_logic;
    b2  : in  std_logic;
    enb : in  std_logic;
    eq  : out std_logic;
    a3  : in  std_logic;
    b3  : in  std_logic;
    a4  : in  std_logic;
    b4  : in  std_logic;
    a5  : in  std_logic;
    b5  : in  std_logic
    );
end entity;

architecture ttl of dm93s46 is
  signal a0_i, b0_i, a1_i, b1_i, a2_i, b2_i, enb_i, a3_i, b3_i, a4_i, b4_i, a5_i, b5_i : std_logic;
begin

  a0_i <= ttl_input(a0);
  b0_i <= ttl_input(b0);
  a1_i <= ttl_input(a1);
  b1_i <= ttl_input(b1);
  a2_i <= ttl_input(a2);
  b2_i <= ttl_input(b2);
  enb_i <= ttl_input(enb);
  a3_i <= ttl_input(a3);
  b3_i <= ttl_input(b3);
  a4_i <= ttl_input(a4);
  b4_i <= ttl_input(b4);
  a5_i <= ttl_input(a5);
  b5_i <= ttl_input(b5);

  -- according to the logic equation on the datasheet
  eq <= enb_i and (
    (a0_i xnor b0_i) and
    (a1_i xnor b1_i) and
    (a2_i xnor b2_i) and
    (a3_i xnor b3_i) and
    (a4_i xnor b4_i) and
    (a5_i xnor b5_i)
  );

end architecture;
