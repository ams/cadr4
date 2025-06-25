-- Octal Buffers And Line Drivers With 3-State Outputs

library ieee;
use ieee.std_logic_1164.all;

entity sn74241 is
  port (
    aenb_n : in  std_logic; -- Pin 1 (1G) : Channel 1 Output Enable (Active Low)
    ain0   : in  std_logic; -- Pin 2 (1A1)
    ain1   : in  std_logic; -- Pin 4 (1A2)
    ain2   : in  std_logic; -- Pin 6 (1A3)
    ain3   : in  std_logic; -- Pin 8 (1A4)
    aout0  : out std_logic; -- Pin 18 (1Y1)
    aout1  : out std_logic; -- Pin 16 (1Y2)
    aout2  : out std_logic; -- Pin 14 (1Y3)
    aout3  : out std_logic; -- Pin 12 (1Y4)

    -- In the TI datasheet of SN74LS241, BENB (2G) is active high.
    -- The VHDL implementation matches this behavior.
    benb  : in  std_logic; -- Pin 19 (2G) : Channel 2 Output Enable (Active High)
    bin0  : in  std_logic; -- Pin 11 (2A1)
    bin1  : in  std_logic; -- Pin 13 (2A2)
    bin2  : in  std_logic; -- Pin 15 (2A3)
    bin3  : in  std_logic; -- Pin 17 (2A4)
    bout0 : out std_logic; -- Pin 9 (2Y1)
    bout1 : out std_logic; -- Pin 7 (2Y2)
    bout2 : out std_logic; -- Pin 5 (2Y3)
    bout3 : out std_logic  -- Pin 3 (2Y4)
    );
end;

architecture ttl of sn74241 is
begin

  process (all)
  begin
    if to_x01(aenb_n) = '0' then
      -- Enabled: pass data through using to_x01 to handle unknown inputs
      aout0 <= to_x01(ain0);
      aout1 <= to_x01(ain1);
      aout2 <= to_x01(ain2);
      aout3 <= to_x01(ain3);
    elsif to_x01(aenb_n) = '1' then
      -- Disabled: high impedance
      aout0 <= 'Z'; aout1 <= 'Z'; aout2 <= 'Z'; aout3 <= 'Z';
    else
      -- Unknown enable state: outputs unknown
      aout0 <= 'X'; aout1 <= 'X'; aout2 <= 'X'; aout3 <= 'X';
    end if;
  end process;

  process (all)
  begin
    if to_x01(benb) = '1' then
      -- Enabled: pass data through using to_x01 to handle unknown inputs
      bout0 <= to_x01(bin0);
      bout1 <= to_x01(bin1);
      bout2 <= to_x01(bin2);
      bout3 <= to_x01(bin3);
    elsif to_x01(benb) = '0' then
      -- Disabled: high impedance
      bout0 <= 'Z'; bout1 <= 'Z'; bout2 <= 'Z'; bout3 <= 'Z';
    else
      -- Unknown enable state: outputs unknown
      bout0 <= 'X'; bout1 <= 'X'; bout2 <= 'X'; bout3 <= 'X';
    end if;
  end process;

end;
