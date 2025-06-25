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
  signal aenb_n_i, ain0_i, ain1_i, ain2_i, ain3_i : std_logic;
  signal benb_i, bin0_i, bin1_i, bin2_i, bin3_i : std_logic;
begin

  aenb_n_i <= 'H';
  ain0_i <= 'H';
  ain1_i <= 'H';
  ain2_i <= 'H';
  ain3_i <= 'H';
  benb_i <= 'H';
  bin0_i <= 'H';
  bin1_i <= 'H';
  bin2_i <= 'H';
  bin3_i <= 'H';

  aenb_n_i <= aenb_n;
  ain0_i <= ain0;
  ain1_i <= ain1;
  ain2_i <= ain2;
  ain3_i <= ain3;
  benb_i <= benb;
  bin0_i <= bin0;
  bin1_i <= bin1;
  bin2_i <= bin2;
  bin3_i <= bin3;

  process (all)
  begin
    if to_x01(aenb_n_i) = '0' then
      -- Enabled: pass data through, but handle unknown inputs
      aout0 <= 'X' when (ain0_i /= '0' and ain0_i /= '1') else ain0_i;
      aout1 <= 'X' when (ain1_i /= '0' and ain1_i /= '1') else ain1_i;
      aout2 <= 'X' when (ain2_i /= '0' and ain2_i /= '1') else ain2_i;
      aout3 <= 'X' when (ain3_i /= '0' and ain3_i /= '1') else ain3_i;
    elsif to_x01(aenb_n_i) = '1' then
      -- Disabled: high impedance
      aout0 <= 'Z'; aout1 <= 'Z'; aout2 <= 'Z'; aout3 <= 'Z';
    else
      aout0 <= 'X'; aout1 <= 'X'; aout2 <= 'X'; aout3 <= 'X';
    end if;
  end process;

  process (all)
  begin
    if to_x01(benb_i) = '1' then
      -- Enabled: pass data through, but handle unknown inputs
      bout0 <= 'X' when (bin0_i /= '0' and bin0_i /= '1') else bin0_i;
      bout1 <= 'X' when (bin1_i /= '0' and bin1_i /= '1') else bin1_i;
      bout2 <= 'X' when (bin2_i /= '0' and bin2_i /= '1') else bin2_i;
      bout3 <= 'X' when (bin3_i /= '0' and bin3_i /= '1') else bin3_i;
    elsif to_x01(benb_i) = '0' then
      -- Disabled: high impedance
      bout0 <= 'Z'; bout1 <= 'Z'; bout2 <= 'Z'; bout3 <= 'Z';
    else
      bout0 <= 'X'; bout1 <= 'X'; bout2 <= 'X'; bout3 <= 'X';
    end if;
  end process;

end;
