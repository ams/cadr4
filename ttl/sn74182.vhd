-- Look-Ahead Carry Generators
-- SN74182 Look-Ahead Carry Generator

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

entity sn74182 is
  port (
    Xo_e    : out std_logic;  -- Group Propagate output
    Yo_e    : out std_logic;  -- Group Generate output
    CNZ_e   : out std_logic;  -- Carry out 2 (active-low)
    CNY_e   : out std_logic;  -- Carry out 1 (active-low)
    CNX_e   : out std_logic;  -- Carry out 0 (active-low)
    X_e     : in  std_logic_vector(3 downto 0);  -- Propagate inputs [3:0]
    Y_e     : in  std_logic_vector(3 downto 0);  -- Generate inputs [3:0]
    CNB_e   : in  std_logic   -- Carry in (active-low)
    );
end;

-- Functional architecture based on official TI datasheet equations

architecture functional of sn74182 is
  -- Input conditioning signals
  signal PB_i : std_logic_vector(3 downto 0);
  signal GB_i : std_logic_vector(3 downto 0);
  signal CNB_i : std_logic;
  
  -- Internal signals
  signal CN : std_logic;  -- Active-high carry (used in equations)

begin

  -- Input conditioning
  PB_i <= ttl_input(X_e(3)) & ttl_input(X_e(2)) & ttl_input(X_e(1)) & ttl_input(X_e(0));
  GB_i <= ttl_input(Y_e(3)) & ttl_input(Y_e(2)) & ttl_input(Y_e(1)) & ttl_input(Y_e(0));
  CNB_i <= ttl_input(CNB_e);

  -- Convert active-low carry input to active-high for use in equations
  CN <= not CNB_i;

  -- Functional equations from TI datasheet:
  
  -- CNX_e (Carry out 0) = NOT(PB[0]·GB[0] + CN·GB[0])
  CNX_e <= not ((PB_i(0) and GB_i(0)) or (CN and GB_i(0)));
  
  -- CNY_e (Carry out 1) = NOT(PB[1]·GB[1] + PB[0]·GB[0]·GB[1] + CN·GB[0]·GB[1])
  CNY_e <= not ((PB_i(1) and GB_i(1)) or 
                (PB_i(0) and GB_i(0) and GB_i(1)) or 
                (CN and GB_i(0) and GB_i(1)));
  
  -- CNZ_e (Carry out 2) = NOT(PB[2]·GB[2] + PB[1]·GB[1]·GB[2] + PB[0]·GB[0]·GB[1]·GB[2] + CN·GB[0]·GB[1]·GB[2])
  CNZ_e <= not ((PB_i(2) and GB_i(2)) or 
                (PB_i(1) and GB_i(1) and GB_i(2)) or 
                (PB_i(0) and GB_i(0) and GB_i(1) and GB_i(2)) or 
                (CN and GB_i(0) and GB_i(1) and GB_i(2)));
  
  -- Xo_e (Group Propagate) = PB[0] + PB[1] + PB[2] + PB[3]
  Xo_e <= PB_i(0) or PB_i(1) or PB_i(2) or PB_i(3);
  
  -- Yo_e (Group Generate) = PB[3]·GB[3] + PB[2]·GB[2]·GB[3] + PB[1]·GB[1]·GB[2]·GB[3] + GB[0]·GB[1]·GB[2]·GB[3]
  Yo_e <= (PB_i(3) and GB_i(3)) or 
         (PB_i(2) and GB_i(2) and GB_i(3)) or 
         (PB_i(1) and GB_i(1) and GB_i(2) and GB_i(3)) or 
         (GB_i(0) and GB_i(1) and GB_i(2) and GB_i(3));

end architecture;
