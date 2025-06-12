-- Octal Buffers and Line Drivers With 3-State Outputs
-- SN74244 Octal Buffer and Line Driver with 3-State Outputs
-- Datasheet: Texas Instruments SNx4LS24x, SNx4S24x Octal Buffers and Line Drivers With 3-State Outputs (Rev. D)
--            https://www.ti.com/lit/ds/symlink/sn74s244.pdf (PDIP (N) package)

library ieee;
use ieee.std_logic_1164.all;

entity sn74244 is
  port (
    aenb_n : in  std_logic; -- Pin 1 (1G) - Note: VHDL is active high, datasheet is active low (1G with bar)
    ain0   : in  std_logic; -- Pin 2 (1A1)
    ain1   : in  std_logic; -- Pin 4 (1A2)
    ain2   : in  std_logic; -- Pin 6 (1A3)
    ain3   : in  std_logic; -- Pin 8 (1A4)
    aout0  : out std_logic; -- Pin 18 (1Y1)
    aout1  : out std_logic; -- Pin 16 (1Y2)
    aout2  : out std_logic; -- Pin 14 (1Y3)
    aout3  : out std_logic; -- Pin 12 (1Y4)

    benb_n : in  std_logic; -- Pin 19 (2/G) - Note: VHDL is active high, datasheet is active low (2/G with bar)
    bin0   : in  std_logic; -- Pin 11 (2A1)
    bin1   : in  std_logic; -- Pin 13 (2A2)
    bin2   : in  std_logic; -- Pin 15 (2A3)
    bin3   : in  std_logic; -- Pin 17 (2A4)
    bout0  : out std_logic; -- Pin 9 (2Y1)
    bout1  : out std_logic; -- Pin 7 (2Y2)
    bout2  : out std_logic; -- Pin 5 (2Y3)
    bout3  : out std_logic  -- Pin 3 (2Y4)
    );
end;

architecture ttl of sn74244 is
begin

  process (aenb_n, ain0, ain1, ain2, ain3)
  begin
    if aenb_n = '0' then
      -- Enabled: pass data, but handle unknown inputs
      aout0 <= 'X' when (ain0 /= '0' and ain0 /= '1') else ain0;
      aout1 <= 'X' when (ain1 /= '0' and ain1 /= '1') else ain1;
      aout2 <= 'X' when (ain2 /= '0' and ain2 /= '1') else ain2;
      aout3 <= 'X' when (ain3 /= '0' and ain3 /= '1') else ain3;
    elsif aenb_n = '1' then
      -- Disabled: high impedance
      aout0 <= 'Z'; aout1 <= 'Z'; aout2 <= 'Z'; aout3 <= 'Z';
    else
      -- Unknown enable signal: outputs unknown
      aout0 <= 'X'; aout1 <= 'X'; aout2 <= 'X'; aout3 <= 'X';
    end if;
  end process;

  process (benb_n, bin0, bin1, bin2, bin3)
  begin
    if benb_n = '0' then
      -- Enabled: pass data, but handle unknown inputs
      bout0 <= 'X' when (bin0 /= '0' and bin0 /= '1') else bin0;
      bout1 <= 'X' when (bin1 /= '0' and bin1 /= '1') else bin1;
      bout2 <= 'X' when (bin2 /= '0' and bin2 /= '1') else bin2;
      bout3 <= 'X' when (bin3 /= '0' and bin3 /= '1') else bin3;
    elsif benb_n = '1' then
      -- Disabled: high impedance
      bout0 <= 'Z'; bout1 <= 'Z'; bout2 <= 'Z'; bout3 <= 'Z';
    else
      -- Unknown enable signal: outputs unknown
      bout0 <= 'X'; bout1 <= 'X'; bout2 <= 'X'; bout3 <= 'X';
    end if;
  end process;

end;
