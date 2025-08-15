library ieee;
use ieee.std_logic_1164.all;

entity cosim_lashup_debugee is
  port (
    dbd0 : inout std_logic;
    dbd1 : inout std_logic;
    dbd2 : inout std_logic;
    dbd3 : inout std_logic;
    dbd4 : inout std_logic;
    dbd5 : inout std_logic;
    dbd6 : inout std_logic;
    dbd7 : inout std_logic; 
    dbd8 : inout std_logic;
    dbd9 : inout std_logic;
    dbd10 : inout std_logic;
    dbd11 : inout std_logic;
    dbd12 : inout std_logic;
    dbd13 : inout std_logic;
    dbd14 : inout std_logic;
    dbd15 : inout std_logic;
    \debug in a0\ : out std_logic;
    \debug in a1\ : out std_logic;
    \debug in wr\ : out std_logic;
    \-debug in req\ : out std_logic;
    \debug in ack\ : out std_logic
  );
end entity;

architecture behavioral of cosim_lashup_debugee is
begin
  process

    function cosim_lashup_read_from_j05(j05 : std_logic_vector(1 to 25)) return integer is 
    begin assert false severity failure; end;
    attribute foreign of cosim_lashup_read : procedure is "VHPIDIRECT cosim_lashup_read";

    variable j05 : std_logic_vector(1 to 25);

    variable read_ret : integer;

  begin

    while true loop

      read_ret := cosim_lashup_read_from_j05(j05);

      if read_ret = 0 then

        dbd0 <= j05(1);
        dbd1 <= j05(2);
        dbd2 <= j05(3);
        dbd3 <= j05(4);
        dbd4 <= j05(5);
        dbd5 <= j05(6);
        dbd6 <= j05(7);
        dbd7 <= j05(8);
        dbd8 <= j05(9);
        dbd9 <= j05(10);
        dbd10 <= j05(11);
        dbd11 <= j05(12);
        dbd12 <= j05(13);
        dbd13 <= j05(14);
        dbd14 <= j05(15);
        dbd15 <= j05(16);
        \debug in a0\ <= j05(17);
        \debug in a1\ <= j05(18);
        \debug in wr\ <= j05(19);
        \-debug in req\ <= j05(20);
        \debug in ack\ <= j05(21);

        -- if it is not write (but read), a response should be sent 
        if \debug in wr\ = '0' then

          

        end if;

      end if;

      wait for 1 ms;

    end loop;

  end process;

end architecture;