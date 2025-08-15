library ieee;
use ieee.std_logic_1164.all;

entity cosim_test_tb is
end entity;

architecture testbench of cosim_test_tb is
begin
  process

    procedure cosim_p is 
    begin assert false severity failure; end;
    attribute foreign of cosim_p : procedure is "VHPIDIRECT cosim_p";

    procedure cosim_pargs(x : integer) is 
    begin assert false severity failure; end;
    attribute foreign of cosim_pargs : procedure is "VHPIDIRECT cosim_pargs";

    function cosim_f return integer is 
    begin assert false severity failure; end;
    attribute foreign of cosim_f : function is "VHPIDIRECT cosim_f";
 
    function cosim_fargs(x : integer) return integer is 
    begin assert false severity failure; end;
    attribute foreign of cosim_fargs : function is "VHPIDIRECT cosim_fargs";

    procedure cosim_get_bus(
      abus : std_logic_vector(0 to 3); 
      len : integer) is 
    begin assert false severity failure; end;
    attribute foreign of cosim_get_bus : procedure is "VHPIDIRECT cosim_get_bus";

    variable input_bus : std_logic_vector(3 downto 0);

  begin

    cosim_p;
    cosim_pargs(1);
    report "cosim_f = " & integer'image(cosim_f);
    report "cosim_fargs(1) = " & integer'image(cosim_fargs(1));
    input_bus := "1000";
    report "input_bus = " & to_bstring(input_bus);
    cosim_get_bus(input_bus, input_bus'length);
    report "cosim_get_bus = " & to_bstring(input_bus);
    wait;

  end process;

end architecture;