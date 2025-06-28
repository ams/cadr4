-- Octal D-Type Transparent Latches

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

entity sn74373 is
  port (
    -- in the datasheet, instead of -hold, C is given
    -- when C is high, output follows input
    -- hence this is effectively same as having a -hold input
    -- when -hold is low, output is latched (does not follow input)
    hold_n : in  std_logic; -- Pin 11 (LE) - Latch Enable
    oenb_n : in  std_logic; -- Pin 1 (OE_n)
    i0     : in  std_logic; -- Pin 3 (1D)
    i1     : in  std_logic; -- Pin 4 (2D)
    i2     : in  std_logic; -- Pin 7 (3D)
    i3     : in  std_logic; -- Pin 8 (4D)
    i4     : in  std_logic; -- Pin 13 (5D)
    i5     : in  std_logic; -- Pin 14 (6D)
    i6     : in  std_logic; -- Pin 17 (7D)
    i7     : in  std_logic; -- Pin 18 (8D)
    o0     : out std_logic; -- Pin 2 (1Q)
    o1     : out std_logic; -- Pin 5 (2Q)
    o2     : out std_logic; -- Pin 6 (3Q)
    o3     : out std_logic; -- Pin 10 (4Q)
    o4     : out std_logic; -- Pin 12 (5Q)
    o5     : out std_logic; -- Pin 15 (6Q)
    o6     : out std_logic; -- Pin 16 (7Q)
    o7     : out std_logic  -- Pin 19 (8Q)
    );
end;

architecture behavioral of sn74373 is
  signal hold_n_i, oenb_n_i, i0_i, i1_i, i2_i, i3_i, i4_i, i5_i, i6_i, i7_i : std_logic;
  signal data : std_logic_vector(7 downto 0);
begin

  hold_n_i <= ttl_input(hold_n);
  oenb_n_i <= ttl_input(oenb_n);
  i0_i <= ttl_input(i0);
  i1_i <= ttl_input(i1);
  i2_i <= ttl_input(i2);
  i3_i <= ttl_input(i3);
  i4_i <= ttl_input(i4);
  i5_i <= ttl_input(i5);
  i6_i <= ttl_input(i6);
  i7_i <= ttl_input(i7);

  -- Latch process with proper X/U handling
  process (all)
    variable input_data : std_logic_vector(7 downto 0);
  begin
    input_data := i7_i & i6_i & i5_i & i4_i & i3_i & i2_i & i1_i & i0_i;
    
    if hold_n_i = '1' then
      -- Transparent mode: pass input data (including X/U)
      data <= input_data;
    elsif hold_n_i = '0' then
      -- Hold mode: maintain current data
      null;  -- data unchanged
    else
      -- Unknown hold signal: outputs become unknown
      data <= (others => 'X');
    end if;
  end process;

  -- Tri-state output process with proper X/U handling
  process (all)
  begin
    if oenb_n_i = '0' then
      -- Enabled: pass latched data
      o0 <= data(0); o1 <= data(1); o2 <= data(2); o3 <= data(3);
      o4 <= data(4); o5 <= data(5); o6 <= data(6); o7 <= data(7);
    elsif oenb_n_i = '1' then
      -- Disabled: high impedance
      o0 <= 'Z'; o1 <= 'Z'; o2 <= 'Z'; o3 <= 'Z';
      o4 <= 'Z'; o5 <= 'Z'; o6 <= 'Z'; o7 <= 'Z';
    else
      o0 <= 'X'; o1 <= 'X'; o2 <= 'X'; o3 <= 'X';
      o4 <= 'X'; o5 <= 'X'; o6 <= 'X'; o7 <= 'X';
    end if;
  end process;

end;
