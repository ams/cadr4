library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity helper_stop_if_prom_fails is 
    port (
      pc0     : in std_logic;
      pc1     : in std_logic;
      pc2     : in std_logic;
      pc3     : in std_logic;
      pc4     : in std_logic;
      pc5     : in std_logic;
      pc6     : in std_logic;
      pc7     : in std_logic;
      pc8     : in std_logic;
      pc9     : in std_logic;
      pc10    : in std_logic;
      pc11    : in std_logic;
      pc12    : in std_logic;
      pc13    : in std_logic;
      \-promenable\ : in std_logic
    );
end entity;

architecture behavioral of helper_stop_if_prom_fails is
    signal pc : std_logic_vector(13 downto 0);
  begin
    pc <= pc13 & pc12 & pc11 & pc10 & pc9 & pc8 & pc7 & pc6 & pc5 & pc4 & pc3 & pc2 & pc1 & pc0;

    process (\-promenable\, pc)
       variable last_reported_pc : std_logic_vector(13 downto 0) := (others => '0');
    begin
      if \-promenable\ = '0' then
        if (is_x(pc)) then
          report "PC is invalid: " & to_ostring(pc);
          std.env.stop;
        elsif ((unsigned(pc) > 1) and (unsigned(pc) < 8#45#)) then
          report "PROM stucked at PC=" & to_ostring(pc);
          std.env.stop;
        elsif ((unsigned(pc) > unsigned(last_reported_pc))) then
          report "PC=" & to_ostring(pc);
          last_reported_pc := pc;
        end if;
      end if;
    end process;

  end architecture;