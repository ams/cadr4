library IEEE;
use IEEE.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74182_tb is
end sn74182_tb;

architecture behaviour of sn74182_tb is
  signal X, Y: std_logic_vector (3 downto 0);
  signal nC, X_out, Y_out, C_0, C_1, C_2 : std_logic;
begin
  dut: sn74182 port map (nC => nC, X0 => X(0), Y0 => Y(0), X1 => X(1), Y1 => Y(1), X2 => X(2), Y2 => Y(2), X3 => X(3), Y3 => Y(3),
                         XOUT => X_out, YOUT => Y_out, nCOUT0 => C_0, nCOUT1 => C_1, nCOUT2 => C_2
                         );
  process begin
    report "Not implemented yet" severity error;
    wait;
  end process;
end behaviour;
