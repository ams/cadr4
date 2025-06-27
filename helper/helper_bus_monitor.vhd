library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity helper_bus_monitor is 
    port (
      ipc0    : in std_logic;
      ipc1    : in std_logic;
      ipc2    : in std_logic;
      ipc3    : in std_logic;
      ipc4    : in std_logic;
      ipc5    : in std_logic;
      ipc6    : in std_logic;
      ipc7    : in std_logic;
      ipc8    : in std_logic;
      ipc9    : in std_logic;
      ipc10   : in std_logic;
      ipc11   : in std_logic;
      ipc12   : in std_logic;
      ipc13   : in std_logic;
      ir0     : in std_logic;
      ir1     : in std_logic;
      ir2     : in std_logic;
      ir3     : in std_logic;
      ir4     : in std_logic;
      ir5     : in std_logic;
      ir6     : in std_logic;
      ir7     : in std_logic;
      ir8     : in std_logic;
      ir9     : in std_logic;
      ir10    : in std_logic;
      ir11    : in std_logic;
      ir12    : in std_logic;
      ir13    : in std_logic;
      ir14    : in std_logic;
      ir15    : in std_logic;
      ir16    : in std_logic;
      ir17    : in std_logic;
      ir18    : in std_logic;
      ir19    : in std_logic;
      ir20    : in std_logic;
      ir21    : in std_logic;
      ir22    : in std_logic;
      ir23    : in std_logic;
      ir24    : in std_logic;
      ir25    : in std_logic;
      ir26    : in std_logic;
      ir27    : in std_logic;
      ir28    : in std_logic;
      ir29    : in std_logic;
      ir30    : in std_logic;
      ir31    : in std_logic;
      npc0    : in std_logic;
      npc1    : in std_logic;
      npc2    : in std_logic;
      npc3    : in std_logic;
      npc4    : in std_logic;
      npc5    : in std_logic;
      npc6    : in std_logic;
      npc7    : in std_logic;
      npc8    : in std_logic;
      npc9    : in std_logic;
      npc10   : in std_logic;
      npc11   : in std_logic;
      npc12   : in std_logic;
      npc13   : in std_logic;
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
      pc13    : in std_logic
    );
  end entity;

  architecture structural of helper_bus_monitor is
    signal ipc : std_logic_vector(13 downto 0);
    signal ir : std_logic_vector(31 downto 0);
    signal npc : std_logic_vector(13 downto 0);
    signal pc : std_logic_vector(13 downto 0);
  begin
    ipc <= ipc13 & ipc12 & ipc11 & ipc10 & ipc9 & ipc8 & ipc7 & ipc6 & ipc5 & ipc4 & ipc3 & ipc2 & ipc1 & ipc0;
    ir <= ir31 & ir30 & ir29 & ir28 & ir27 & ir26 & ir25 & ir24 & ir23 & ir22 & ir21 & ir20 & ir19 & ir18 & ir17 & ir16 & ir15 & ir14 & ir13 & ir12 & ir11 & ir10 & ir9 & ir8 & ir7 & ir6 & ir5 & ir4 & ir3 & ir2 & ir1 & ir0;
    npc <= npc13 & npc12 & npc11 & npc10 & npc9 & npc8 & npc7 & npc6 & npc5 & npc4 & npc3 & npc2 & npc1 & npc0;
    pc <= pc13 & pc12 & pc11 & pc10 & pc9 & pc8 & pc7 & pc6 & pc5 & pc4 & pc3 & pc2 & pc1 & pc0;

    process (PC)
    begin
      if not is_x(PC) then
        if ((unsigned(PC) > 1) and (unsigned(PC) < 8#45#)) then
          report "PROM stucked at " & to_ostring(PC);
          std.env.stop;
        end if;
      end if;
    end process;

  end architecture;