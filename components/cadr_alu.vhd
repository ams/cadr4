library IEEE;
use IEEE.std_logic_1164.all;

entity cadr_alu is
  port(
  signal A: in std_logic_vector (31 downto 0);
  signal M: in std_logic_vector (31 downto 0);
  signal nCIN0: in std_logic;

  signal ALUMODE: in std_logic;
  signal F: in std_logic_vector (3 downto 0);

  signal ALU: out std_logic_vector (32 downto 0)
  );
end cadr_alu;

architecture rtl of cadr_alu is
  signal A_EQ_B, XOUT3, YOUT3, XOUT7, YOUT7, XOUT11, YOUT11, XOUT15, YOUT15, XOUT19, YOUT19, XOUT23, YOUT23, XOUT27, YOUT27, XOUT31, YOUT31, XX0, YY0, XX1, YY1, nCIN4, nCIN8, nCIN12, nCIN16, nCIN20, nCIN24, nCIN28, nCIN32: std_logic;
begin
  p2A23: entity work.sn74181(rtl) port map (M => ALUMODE, S3 => F(3), S2 => F(2), S1 => F(1), S0 => F(0), nC_in => nCIN12,
                                            A0 => M(12), A1 => M(13), A2 => M(14), A3 => M(15), B0 => A(12), B1 => A(13), B2 => A(14), B3 => A(15),
                                            F0 => ALU(12), F1 => ALU(13), F2 => ALU(14), F3 => ALU(15),
                                            A_EQ_B => A_EQ_B, X => XOUT15, Y => YOUT15
                                            );
  p2B23: entity work.sn74181(rtl) port map (M => ALUMODE, S3 => F(3), S2 => F(2), S1 => F(1), S0 => F(0), nC_in => nCIN8,
                                            A0 => M(8), A1 => M(9), A2 => M(10), A3 => M(11), B0 => A(8), B1 => A(9), B2 => A(10), B3 => A(11),
                                            F0 => ALU(8), F1 => ALU(9), F2 => ALU(10), F3 => ALU(11),
                                            A_EQ_B => A_EQ_B, X => XOUT11, Y => YOUT11
                                            );
  p2A28: entity work.sn74181(rtl) port map (M => ALUMODE, S3 => F(3), S2 => F(2), S1 => F(1), S0 => F(0), nC_in => nCIN4,
                                            A0 => M(4), A1 => M(5), A2 => M(6), A3 => M(7), B0 => A(4), B1 => A(5), B2 => A(6), B3 => A(7),
                                            F0 => ALU(4), F1 => ALU(5), F2 => ALU(6), F3 => ALU(7),
                                            A_EQ_B => A_EQ_B, X => XOUT7, Y => YOUT7
                                            );
  p2B28: entity work.sn74181(rtl) port map (M => ALUMODE, S3 => F(3), S2 => F(2), S1 => F(1), S0 => F(0), nC_in => nCIN0,
                                            A0 => M(0), A1 => M(1), A2 => M(2), A3 => M(3), B0 => A(0), B1 => A(1), B2 => A(2), B3 => A(3),
                                            F0 => ALU(0), F1 => ALU(1), F2 => ALU(2), F3 => ALU(3),
                                            A_EQ_B => A_EQ_B, X => XOUT3, Y => YOUT3
                                            );
  p2A03: entity work.sn74181(rtl) port map (M => ALUMODE, S3 => F(3), S2 => F(2), S1 => F(1), S0 => F(0), nC_in => nCIN32,
                                            A0 => M(31), A1 => '0', A2 => '0', A3 => '0', B0 => A(31), B1 => '0', B2 => '0', B3 => '0',
                                            F0 => ALU(32), F1 => open, F2 => open, F3 => open,
                                            A_EQ_B => open, X => open, Y => open
                                            );
  p2A08: entity work.sn74181(rtl) port map (M => ALUMODE, S3 => F(3), S2 => F(2), S1 => F(1), S0 => F(0), nC_in => nCIN28,
                                            A0 => M(28), A1 => M(29), A2 => M(30), A3 => M(31), B0 => A(28), B1 => A(29), B2 => A(30), B3 => A(31),
                                            F0 => ALU(28), F1 => ALU(29), F2 => ALU(30), F3 => ALU(31),
                                            A_EQ_B => A_EQ_B, X => XOUT31, Y => YOUT31
                                            );
  p2B08: entity work.sn74181(rtl) port map (M => ALUMODE, S3 => F(3), S2 => F(2), S1 => F(1), S0 => F(0), nC_in => nCIN24,
                                            A0 => M(24), A1 => M(25), A2 => M(26), A3 => M(27), B0 => A(24), B1 => A(25), B2 => A(26), B3 => A(27),
                                            F0 => ALU(24), F1 => ALU(25), F2 => ALU(26), F3 => ALU(27),
                                            A_EQ_B => A_EQ_B, X => XOUT27, Y => YOUT27
                                            );
  p2A13: entity work.sn74181(rtl) port map (M => ALUMODE, S3 => F(3), S2 => F(2), S1 => F(1), S0 => F(0), nC_in => nCIN20,
                                            A0 => M(20), A1 => M(21), A2 => M(22), A3 => M(23), B0 => A(20), B1 => A(21), B2 => A(22), B3 => A(23),
                                            F0 => ALU(20), F1 => ALU(21), F2 => ALU(22), F3 => ALU(23),
                                            A_EQ_B => A_EQ_B, X => XOUT23, Y => YOUT23
                                            );
  p2B13: entity work.sn74181(rtl) port map (M => ALUMODE, S3 => F(3), S2 => F(2), S1 => F(1), S0 => F(0), nC_in => nCIN16,
                                            A0 => M(16), A1 => M(17), A2 => M(18), A3 => M(19), B0 => A(16), B1 => A(17), B2 => A(18), B3 => A(19),
                                            F0 => ALU(16), F1 => ALU(17), F2 => ALU(18), F3 => ALU(19),
                                            A_EQ_B => A_EQ_B, X => XOUT19, Y => YOUT19
                                            );
  p2A20: entity work.sn74182(rtl) port map (nC => nCIN0, nCOUT0 => nCIN4, nCOUT1 => nCIN8, nCOUT2 => nCIN12, YOUT => YY0, XOUT => XX0,
                                            X0 => XOUT3, Y0 => YOUT3, X1 => XOUT7, Y1 => YOUT7, X2 => XOUT11, Y2 => YOUT11, X3 => XOUT15, Y3 => YOUT15
                                            );
  p2A19: entity work.sn74182(rtl) port map (nC => nCIN16, nCOUT0 => nCIN20, nCOUT1 => nCIN24, nCOUT2 => nCIN28, YOUT => YY1, XOUT => XX1,
                                            X0 => XOUT19, Y0 => YOUT19, X1 => XOUT23, Y1 => YOUT23, X2 => XOUT27, Y2 => YOUT27, X3 => XOUT31, Y3 => YOUT31
                                            );
  p2A18: entity work.sn74182(rtl) port map (nC => nCIN0, nCOUT0 => nCIN16, nCOUT1 => nCIN32, nCOUT2 => open, YOUT => open, XOUT => open,
                                            X0 => XX0, Y0 => YY0, X1 => XX1, Y1 => YY1, X2 => '0', Y2 => '0', X3 => '0', Y3 => '0'
                                            );
end rtl;
