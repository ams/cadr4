-- SN74374: Octal D-Type Flip-Flops
-- Datasheet: Texas Instruments SN74LS374A Octal D-Type Edge-Triggered Flip-Flops With 3-State Outputs, PDIP (N) Package
-- URL: https://www.ti.com/lit/ds/symlink/sn74ls374a.pdf

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

entity sn74374 is
  port (
    clk   : in  std_logic; -- pin 10
    oenb_n : in  std_logic; -- pin 1
    i0 : in  std_logic; -- pin 3
    i1 : in  std_logic; -- pin 4
    i2 : in  std_logic; -- pin 9
    i3 : in  std_logic; -- pin 11
    i4 : in  std_logic; -- pin 13
    i5 : in  std_logic; -- pin 14
    i6 : in  std_logic; -- pin 17
    i7 : in  std_logic; -- pin 18
    o0 : out std_logic; -- pin 2
    o1 : out std_logic; -- pin 5
    o2 : out std_logic; -- pin 6
    o3 : out std_logic; -- pin 7
    o4 : out std_logic; -- pin 12
    o5 : out std_logic; -- pin 15
    o6 : out std_logic; -- pin 16
    o7 : out std_logic  -- pin 19
    );
end;

architecture ttl of sn74374 is
  signal data : std_logic_vector(7 downto 0) := (others => 'U');
begin

  process(all)
    variable input_data : std_logic_vector(7 downto 0);
  begin
    if oenb_n = '0' then
      if rising_edge(clk) then
        input_data := i7 & i6 & i5 & i4 & i3 & i2 & i1 & i0;
        o0 <= input_data(0); o1 <= input_data(1); o2 <= input_data(2); o3 <= input_data(3);
        o4 <= input_data(4); o5 <= input_data(5); o6 <= input_data(6); o7 <= input_data(7);
      elsif clk = '0' then
        o0 <= input_data(0); o1 <= input_data(1); o2 <= input_data(2); o3 <= input_data(3);
        o4 <= input_data(4); o5 <= input_data(5); o6 <= input_data(6); o7 <= input_data(7);
      else
        o0 <= 'X'; o1 <= 'X'; o2 <= 'X'; o3 <= 'X';
        o4 <= 'X'; o5 <= 'X'; o6 <= 'X'; o7 <= 'X';
      end if;
    elsif oenb_n = '1' then
      o0 <= 'Z'; o1 <= 'Z'; o2 <= 'Z'; o3 <= 'Z';
      o4 <= 'Z'; o5 <= 'Z'; o6 <= 'Z'; o7 <= 'Z';
    else
      o0 <= 'X'; o1 <= 'X'; o2 <= 'X'; o3 <= 'X';
      o4 <= 'X'; o5 <= 'X'; o6 <= 'X'; o7 <= 'X';
    end if;
  end process;

end;
