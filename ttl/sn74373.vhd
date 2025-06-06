-- SN74373: Octal D-Type Transparent Latches

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74373 is
  port (
    hold_n : in  std_logic;
    oenb_n : in  std_logic;
    i0     : in  std_logic;
    i1     : in  std_logic;
    i2     : in  std_logic;
    i3     : in  std_logic;
    i4     : in  std_logic;
    i5     : in  std_logic;
    i6     : in  std_logic;
    i7     : in  std_logic;
    o0     : out std_logic;
    o1     : out std_logic;
    o2     : out std_logic;
    o3     : out std_logic;
    o4     : out std_logic;
    o5     : out std_logic;
    o6     : out std_logic;
    o7     : out std_logic
    );
end;

architecture ttl of sn74373 is
  signal data      : std_logic_vector(7 downto 0);
  signal next_data : std_logic_vector(7 downto 0);
begin
  -- transparent latch when hold_n = 1, hold when hold_n = 0
  next_data <= i7 & i6 & i5 & i4 & i3 & i2 & i1 & i0;

  process(hold_n, next_data)
  begin
    if hold_n = '1' then
      data <= next_data;
    end if;
  end process;

  process(oenb_n, data)
  begin
    if oenb_n = '1' then
      o7 <= 'Z'; o6 <= 'Z'; o5 <= 'Z'; o4 <= 'Z';
      o3 <= 'Z'; o2 <= 'Z'; o1 <= 'Z'; o0 <= 'Z';
    else
      o7 <= data(7); o6 <= data(6); o5 <= data(5); o4 <= data(4);
      o3 <= data(3); o2 <= data(2); o1 <= data(1); o0 <= data(0);
    end if;
  end process;
end;
