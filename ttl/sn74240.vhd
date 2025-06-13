-- Octal Buffers and Line Drivers With 3-State Outputs
-- Datasheet: Texas Instruments SNx4LS24x, SNx4S24x Octal Buffers and Line Drivers With 3-State Outputs, PDIP (N) Package
-- URL: https://www.ti.com/lit/gpn/SN74LS240

library ieee;
use ieee.std_logic_1164.all;

entity sn74240 is
  port (
    aenb_n : in  std_logic := 'H'; -- Pin 1 (1G_bar) : Channel 1 Output Enable (Active Low)
    ain0   : in  std_logic := 'H'; -- Pin 2 (1A1)
    ain1   : in  std_logic := 'H'; -- Pin 4 (1A2)
    ain2   : in  std_logic := 'H'; -- Pin 6 (1A3)
    ain3   : in  std_logic := 'H'; -- Pin 8 (1A4)
    aout0  : out std_logic; -- Pin 18 (1Y1)
    aout1  : out std_logic; -- Pin 16 (1Y2)
    aout2  : out std_logic; -- Pin 14 (1Y3)
    aout3  : out std_logic; -- Pin 12 (1Y4)

    benb_n : in  std_logic := 'H'; -- Pin 19 (2G_bar) : Channel 2 Output Enable (Active Low)
    bin0   : in  std_logic := 'H'; -- Pin 11 (2A1)
    bin1   : in  std_logic := 'H'; -- Pin 13 (2A2)
    bin2   : in  std_logic := 'H'; -- Pin 15 (2A3)
    bin3   : in  std_logic := 'H'; -- Pin 17 (2A4)
    bout0  : out std_logic; -- Pin 9 (2Y1)
    bout1  : out std_logic; -- Pin 7 (2Y2)
    bout2  : out std_logic; -- Pin 5 (2Y3)
    bout3  : out std_logic  -- Pin 3 (2Y4)
    );
end;

architecture ttl of sn74240 is
begin

  process (all)
  begin
    if aenb_n = '0' then
      -- Enabled: pass inverted data, but handle unknown inputs
      aout0 <= 'X' when (ain0 /= '0' and ain0 /= '1') else not ain0;
      aout1 <= 'X' when (ain1 /= '0' and ain1 /= '1') else not ain1;
      aout2 <= 'X' when (ain2 /= '0' and ain2 /= '1') else not ain2;
      aout3 <= 'X' when (ain3 /= '0' and ain3 /= '1') else not ain3;
    elsif aenb_n = '1' then
      -- Disabled: high impedance
      aout0 <= 'Z'; aout1 <= 'Z'; aout2 <= 'Z'; aout3 <= 'Z';
    else
      -- Unknown enable signal: outputs unknown
      aout0 <= 'X'; aout1 <= 'X'; aout2 <= 'X'; aout3 <= 'X';
    end if;
  end process;

  process (all)
  begin
    if benb_n = '0' then
      -- Enabled: pass inverted data, but handle unknown inputs
      bout0 <= 'X' when (bin0 /= '0' and bin0 /= '1') else not bin0;
      bout1 <= 'X' when (bin1 /= '0' and bin1 /= '1') else not bin1;
      bout2 <= 'X' when (bin2 /= '0' and bin2 /= '1') else not bin2;
      bout3 <= 'X' when (bin3 /= '0' and bin3 /= '1') else not bin3;
    elsif benb_n = '1' then
      -- Disabled: high impedance
      bout0 <= 'Z'; bout1 <= 'Z'; bout2 <= 'Z'; bout3 <= 'Z';
    else
      -- Unknown enable signal: outputs unknown
      bout0 <= 'X'; bout1 <= 'X'; bout2 <= 'X'; bout3 <= 'X';
    end if;
  end process;

end;
