-- 4 Bit Binary Full Adders With Fast Carry

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74283 is
  port (
    ci : in std_logic;  -- Pin 7
    a0 : in std_logic;  -- Pin 5
    a1 : in std_logic;  -- Pin 3
    a2 : in std_logic;  -- Pin 14
    a3 : in std_logic;  -- Pin 13
    b0 : in std_logic;  -- Pin 6
    b1 : in std_logic;  -- Pin 2
    b2 : in std_logic;  -- Pin 15
    b3 : in std_logic;  -- Pin 11
    s0 : out std_logic; -- Pin 4
    s1 : out std_logic; -- Pin 1
    s2 : out std_logic; -- Pin 13
    s3 : out std_logic; -- Pin 10
    co : out std_logic  -- Pin 9
    );
end;

architecture behavioral of sn74283 is
  signal a_vec : std_logic_vector(3 downto 0);
  signal b_vec : std_logic_vector(3 downto 0);
  signal sum_result : std_logic_vector(4 downto 0);
begin
  -- Convert individual bits to vectors
  a_vec <= a3 & a2 & a1 & a0;
  b_vec <= b3 & b2 & b1 & b0;
  
  -- Perform 5-bit addition using VHDL numeric operations
  sum_result <= std_logic_vector(unsigned('0' & a_vec) + unsigned('0' & b_vec) + unsigned'("0000" & ci));
  
  -- Assign outputs
  s0 <= sum_result(0);
  s1 <= sum_result(1);
  s2 <= sum_result(2);
  s3 <= sum_result(3);
  co <= sum_result(4);

end;
