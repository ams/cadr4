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

    process (pc)
    begin
      if is_x(pc) then
      elsif (unsigned(pc) = 8#313#) then
        std.env.stop;
      end if;
    end process;

  end architecture;