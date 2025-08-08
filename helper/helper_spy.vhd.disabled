library ieee;
use ieee.std_logic_1164.all;

entity helper_spy is
  port (
    -- below are all spy related
    eadr0: out std_logic;
    eadr1: out std_logic;
    eadr2: out std_logic;
    eadr3: out std_logic;
    \-dbread\: out std_logic;
    \-dbwrite\: out std_logic;
    -- SPY bus - 16 bits
    spy0  : inout std_logic;
    spy1  : inout std_logic;
    spy2  : inout std_logic;
    spy3  : inout std_logic;
    spy4  : inout std_logic;
    spy5  : inout std_logic;
    spy6  : inout std_logic;
    spy7  : inout std_logic;
    spy8  : inout std_logic;
    spy9  : inout std_logic;
    spy10 : inout std_logic;
    spy11 : inout std_logic;
    spy12 : inout std_logic;
    spy13 : inout std_logic;
    spy14 : inout std_logic;
    spy15 : inout std_logic
  );
end entity;

architecture behavioral of helper_spy is
  signal eadr : std_logic_vector(3 downto 0);
  signal spy : std_logic_vector(15 downto 0);
begin
  eadr0 <= eadr(0);
  eadr1 <= eadr(1);
  eadr2 <= eadr(2);
  eadr3 <= eadr(3);
  spy0 <= spy(0);
  spy1 <= spy(1);
  spy2 <= spy(2);
  spy3 <= spy(3);
  spy4 <= spy(4);
  spy5 <= spy(5);
  spy6 <= spy(6);
  spy7 <= spy(7);
  spy8 <= spy(8);
  spy9 <= spy(9);
  spy10 <= spy(10);
  spy11 <= spy(11);
  spy12 <= spy(12);
  spy13 <= spy(13);
  spy14 <= spy(14);
  spy15 <= spy(15);
  process
  begin
    eadr <= (others => '0');
    spy <= (others => 'Z');
    \-dbread\ <= '1';
    \-dbwrite\ <= '1';
    wait for 100 ns;
    spy7 <= '1';
    eadr <= "0101";
    \-dbwrite\ <= '0';
    wait for 20 ns;
    \-dbwrite\ <= '1';
    spy7 <= 'Z';
    wait;
  end process;
end architecture;