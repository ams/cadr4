library ieee;
use ieee.std_logic_1164.all;

use work.misc.all;

entity am26s10 is
  port (
    e_n : in  std_logic; -- Active-low enable 
    i0  : in  std_logic; -- Input 0
    i1  : in  std_logic; -- Input 1  
    i2  : in  std_logic; -- Input 2
    i3  : in  std_logic; -- Input 3
    b0  : inout std_logic; -- Inverting bidirectional bus 0
    b1  : inout std_logic; -- Inverting bidirectional bus 1
    b2  : inout std_logic; -- Inverting bidirectional bus 2
    b3  : inout std_logic; -- Inverting bidirectional bus 3
    z0  : out std_logic; -- Non-inverting output 0
    z1  : out std_logic; -- Non-inverting output 1
    z2  : out std_logic; -- Non-inverting output 2
    z3  : out std_logic  -- Non-inverting output 3
    );
end entity;

architecture behavioral of am26s10 is
  signal e_n_i, i0_i, i1_i, i2_i, i3_i : std_logic;
begin
  
  -- TTL input handling
  e_n_i <= ttl_input(e_n);
  i0_i <= ttl_input(i0);
  i1_i <= ttl_input(i1);
  i2_i <= ttl_input(i2);
  i3_i <= ttl_input(i3);

  process (all)
  begin
    if e_n_i = '0' then
      -- Enabled: transmitting, inverting bus outputs and non-inverting outputs
      b0 <= not i0_i;
      b1 <= not i1_i;
      b2 <= not i2_i;
      b3 <= not i3_i;
      z0 <= i0_i;
      z1 <= i1_i;
      z2 <= i2_i;
      z3 <= i3_i;
    elsif e_n_i = '1' then
      -- Disabled: receiving, open collector outputs (high impedance)
      b0 <= 'Z';
      b1 <= 'Z';
      b2 <= 'Z';
      b3 <= 'Z';
      z0 <= not b0;
      z1 <= not b1;
      z2 <= not b2;
      z3 <= not b3;
    else
      -- Unknown state
      b0 <= 'X';
      b1 <= 'X';
      b2 <= 'X';
      b3 <= 'X';
      z0 <= 'X';
      z1 <= 'X';
      z2 <= 'X';
      z3 <= 'X';
    end if;
  end process;

end architecture;