-- Look-Ahead Carry Generators
-- SN74182 Look-Ahead Carry Generator

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

entity sn74182 is
  port (
    PBo_e   : out std_logic;  -- Propagate output
    GBo_e   : out std_logic;  -- Generate output
    CNZ_e   : out std_logic;  -- Carry out 2 (active-low)
    CNY_e   : out std_logic;  -- Carry out 1 (active-low)
    CNX_e   : out std_logic;  -- Carry out 0 (active-low)

    PB_e    : in  std_logic_vector(3 downto 0);  -- Propagate inputs [3:0]
    GB_e    : in  std_logic_vector(3 downto 0);  -- Generate inputs [3:0]
    CN_e    : in  std_logic   -- Carry in
    );
end;

-- Gate-level architecture translated line by line from ISCAS 74182 Verilog model
architecture gate_level of sn74182 is
  -- Input conditioning signals
  signal PB_i : std_logic_vector(3 downto 0);
  signal GB_i : std_logic_vector(3 downto 0);
  signal CN_i : std_logic;
  
  -- Internal signals matching Verilog model exactly
  signal CNB : std_logic;
  
  -- AND gate outputs - first level
  signal PB0GB0 : std_logic;
  signal CNBGB0 : std_logic;
  
  -- AND gate outputs - second level
  signal PB1GB1 : std_logic;
  signal PB0GB01 : std_logic;
  signal CNBGB01 : std_logic;
  
  -- AND gate outputs - third level
  signal PB2GB2 : std_logic;
  signal PB1GB12 : std_logic;
  signal PB0GB012 : std_logic;
  signal CNBGB012 : std_logic;
  
  -- AND gate outputs - fourth level
  signal PB3GB3 : std_logic;
  signal PB2GB23 : std_logic;
  signal PB1GB123 : std_logic;
  signal GB0123 : std_logic;
  
  -- Output signals
  signal PBo : std_logic;
  signal GBo : std_logic;
  signal CNX : std_logic;
  signal CNY : std_logic;
  signal CNZ : std_logic;

begin

  -- Input conditioning
  PB_i <= ttl_input(PB_e(3)) & ttl_input(PB_e(2)) & ttl_input(PB_e(1)) & ttl_input(PB_e(0));
  GB_i <= ttl_input(GB_e(3)) & ttl_input(GB_e(2)) & ttl_input(GB_e(1)) & ttl_input(GB_e(0));
  CN_i <= ttl_input(CN_e);

  -- Line-by-line translation of Verilog gates:
  
  -- not CNBgate(CNB, CN);
  CNB <= not CN_i;

  -- and PB0GB0gate(PB0GB0, PB[0], GB[0]);
  PB0GB0 <= PB_i(0) and GB_i(0);
  
  -- and CNBGB0gate(CNBGB0, CNB, GB[0]);
  CNBGB0 <= CNB and GB_i(0);

  -- and PB1GB1gate(PB1GB1, PB[1], GB[1]);
  PB1GB1 <= PB_i(1) and GB_i(1);
  
  -- and PB0GB01gate(PB0GB01, PB[0], GB[0], GB[1]);
  PB0GB01 <= PB_i(0) and GB_i(0) and GB_i(1);
  
  -- and CNBGB01gate(CNBGB01, CNB, GB[0], GB[1]);
  CNBGB01 <= CNB and GB_i(0) and GB_i(1);

  -- and PB2GB2gate(PB2GB2, PB[2], GB[2]);
  PB2GB2 <= PB_i(2) and GB_i(2);
  
  -- and PB1GB12gate(PB1GB12, PB[1], GB[1], GB[2]);
  PB1GB12 <= PB_i(1) and GB_i(1) and GB_i(2);
  
  -- and PB0GB012gate(PB0GB012, PB[0], GB[0], GB[1], GB[2]);
  PB0GB012 <= PB_i(0) and GB_i(0) and GB_i(1) and GB_i(2);
  
  -- and CNBGB012gate(CNBGB012, CNB, GB[0], GB[1], GB[2]);
  CNBGB012 <= CNB and GB_i(0) and GB_i(1) and GB_i(2);

  -- and PB3GB3gate(PB3GB3, PB[3], GB[3]);
  PB3GB3 <= PB_i(3) and GB_i(3);
  
  -- and PB2GB23gate(PB2GB23, PB[2], GB[2], GB[3]);
  PB2GB23 <= PB_i(2) and GB_i(2) and GB_i(3);
  
  -- and PB1GB123gate(PB1GB123, PB[1], GB[1], GB[2], GB[3]);
  PB1GB123 <= PB_i(1) and GB_i(1) and GB_i(2) and GB_i(3);
  
  -- and GB0123gate(GB0123, GB[0], GB[1], GB[2], GB[3]);
  GB0123 <= GB_i(0) and GB_i(1) and GB_i(2) and GB_i(3);

  -- or PBogate(PBo,PB[0],PB[1],PB[2],PB[3]);
  PBo <= PB_i(0) or PB_i(1) or PB_i(2) or PB_i(3);

  -- or GBogate(GBo,PB3GB3,PB2GB23,PB1GB123,GB0123);
  GBo <= PB3GB3 or PB2GB23 or PB1GB123 or GB0123;

  -- nor CNZgate(CNZ,PB2GB2,PB1GB12,PB0GB012,CNBGB012);
  CNZ <= not (PB2GB2 or PB1GB12 or PB0GB012 or CNBGB012);

  -- nor CNYgate(CNY,PB1GB1,PB0GB01,CNBGB01);
  CNY <= not (PB1GB1 or PB0GB01 or CNBGB01);

  -- nor CNXgate(CNX,PB0GB0,CNBGB0);
  CNX <= not (PB0GB0 or CNBGB0);

  -- Output assignments
  PBo_e <= PBo;
  GBo_e <= GBo;
  CNZ_e <= CNZ;  -- NOR output is active-low as required
  CNY_e <= CNY;  -- NOR output is active-low as required
  CNX_e <= CNX;  -- NOR output is active-low as required

end architecture;
