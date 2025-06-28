-- 4 Bit Binary Full Adders With Fast Carry

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.misc.ttl_input;

entity sn74283 is
  port (
    ci : in std_logic;  -- Pin 7
    a0 : in std_logic;  -- Pin 5
    a1 : in std_logic;  -- Pin 3
    a2 : in std_logic;  -- Pin 14
    a3 : in std_logic;  -- Pin 12
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
  signal ci_i, a0_i, a1_i, a2_i, a3_i : std_logic;
  signal b0_i, b1_i, b2_i, b3_i : std_logic;
  signal a_vec : std_logic_vector(3 downto 0);
  signal b_vec : std_logic_vector(3 downto 0);
  signal sum_result : std_logic_vector(4 downto 0);
begin
  -- Apply TTL input function to all inputs
  ci_i <= ttl_input(ci);
  a0_i <= ttl_input(a0);
  a1_i <= ttl_input(a1);
  a2_i <= ttl_input(a2);
  a3_i <= ttl_input(a3);
  b0_i <= ttl_input(b0);
  b1_i <= ttl_input(b1);
  b2_i <= ttl_input(b2);
  b3_i <= ttl_input(b3);

  -- Convert individual bits to vectors
  a_vec <= a3_i & a2_i & a1_i & a0_i;
  b_vec <= b3_i & b2_i & b1_i & b0_i;
  
  -- Perform 5-bit addition using VHDL numeric operations with X-state checking
  process(a_vec, b_vec, ci_i)
  begin
    -- Check for X or Z states in input vectors
    if is_x(a_vec) or is_x(b_vec) or is_x(ci_i) then
      sum_result <= (others => 'X');
    else
      sum_result <= std_logic_vector(unsigned('0' & a_vec) + unsigned('0' & b_vec) + unsigned'("0000" & ci_i));
    end if;
  end process;
  
  -- Assign outputs
  s0 <= sum_result(0);
  s1 <= sum_result(1);
  s2 <= sum_result(2);
  s3 <= sum_result(3);
  co <= sum_result(4);

end;
