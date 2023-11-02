-- The MIT CADR

library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

use work.utilities.all;

entity cadr4 is
end;

architecture structural of cadr4 is

  signal pc0, pc1, pc2, pc3, pc4, pc5, pc6, pc7, pc8, pc9, pc10, pc11, pc12, pc13 : std_logic;

  signal tilt1 : std_logic;
  signal tilt0 : std_logic;
  signal dpe : std_logic;
  signal ipe : std_logic;
  signal promenable : std_logic;
  signal cyclecompleted : std_logic;

  --- Aliases for some of the above signals to make life easier.

  signal pc : std_logic_vector(0 to 13);  -- Same as PC0, ..., PC13.

begin
  --- Clock Generation

--  clock1_1c10 : sn74s02 port map(g4a => gnd);
--  clock1_1d11 : td25 port map(input => \-tpr0\, o_10ns => \-tpr10\, o_20ns => \-tpr20a\, o_25ns => \-tpr25\, o_15ns => \-tpr15\);
--  clock1_1c14 : td25 port map(input => \-tpw50\, o_10ns => \-tpw60\, o_20ns => \-tpw70\, o_25ns => \-tpw75\, o_15ns => \-tpw65\);
--  clock1_1c15 : td25 port map(input => \-tpw20\, o_10ns => \-tpw30a\, o_20ns => \-tpw40a\, o_25ns => \-tpw45\, o_15ns => \-tpw35\);
--  clock1_1c12 : td50 port map(input => \-tprend\, o_20ns => \-tpw20\, o_50ns => \-tpw50\, o_30ns => \-tpw30\);
--  clock1_1d08 : sn74s151 port map(i3 => \-tpr100\, i2 => \-tpr140\, i1 => \-tpr160\, i0 => \-tpr160\, q => \-tprend\, q_n => tprend, ce_n => gnd, sel2 => sspeed1, sel1 => sspeed0, sel0 => \-ilong\, i7 => \-tpr75\, i6 => \-tpr115\, i5 => \-tpr85\);
--  clock1_1d15 : td25 port map(input => \-tpr60\, o_10ns => \-tpr70\, o_20ns => \-tpr80a\, o_25ns => \-tpr85\, o_15ns => \-tpr75\);
--  clock1_1d14 : td25 port map(input => \-tpr100\, o_10ns => \-tpr110\, o_20ns => \-tpr120a\, o_25ns => \-tpr125\, o_15ns => \-tpr115\);
--  clock1_1d13 : td100 port map(input => \-tpr100\, o_40ns => \-tpr140\, o_80ns => \-tpr180\, o_100ns => \-tpr200\, o_60ns => \-tpr160\);
--  clock1_1d12 : td100 port map(input => \-tpr0\, o_40ns => \-tpr40\, o_80ns => \-tpr80\, o_100ns => \-tpr100\, o_60ns => \-tpr60\);
--  clock1_1c09 : sn74s00 port map(g1a => \-tpr40\);
--  clock1_1c08 : sn74s10 port map(g1a => \-clock_reset_b\, g1b => \-tpdone\, g2a => \-hang\, g2b => \-clock_reset_b\, g2c => cyclecompleted, g2y_n => \-tpr0\, g1y_n => internal15);

--  clock2_1c10 : sn74s02 port map(g2q_n => tpwp, g2b => machruna_l, g3b => machruna_l, g3q_n => tpwpiram);
--  clock2_1c13 : sn74s10 port map(g2a => \-tprend\, g2c => internal9, g3y_n => internal10, g3a => \-tpw45\, g3b => \-clock_reset_b\, g3c => internal11);
--  clock2_1d04 : sn7428 port map(g1q_n => \-tse1\, g1a => tptse, g1b => gnd, g2q_n => \-tse2\, g2a => tptse, g2b => gnd, g3a => gnd, g3b => tptse, g3q_n => \-tse3\, g4a => gnd, g4b => tptse);
--  clock2_1c02 : sn7428 port map(g1q_n => \-wp1\, g1a => tpwp, g1b => gnd, g2q_n => \-wp2\, g2a => tpwp, g2b => gnd, g3a => gnd, g3b => tpwp, g3q_n => \-wp3\, g4a => gnd, g4b => tpwp);
--  clock2_1c11 : sn7428 port map(g1q_n => \-wp5\, g1a => tpwpiram, g1b => gnd, g2q_n => clk5, g2a => \-clk0\, g2b => gnd, g3a => gnd, g3b => \-mclk0\, g3q_n => mclk5);
--  clock2_1c01 : sn7428 port map(g1q_n => clk4, g1a => \-clk0\, g1b => gnd, g2q_n => mclk7, g2a => \-mclk0\, g2b => gnd);
--  clock2_1d05 : sn7428 port map(g1q_n => clk1, g1a => \-clk0\, g1b => gnd, g2q_n => clk2, g2a => \-clk0\, g2b => gnd, g3a => gnd, g3b => \-clk0\, g3q_n => clk3, g4a => gnd, g4b => \-mclk0\);
--  clock2_1d10 : sn74s08 port map(g1b => \-tpclk\, g1a => machrun, g1q => \-clk0\, g3q => \-mclk0\, g3a => hi1, g3b => \-tpclk\);
--  clock2_1c07 : sn74s00 port map(g1b => \-tpr0\, g1a => \-tpclk\, g1q_n => tpclk, g2b => \-tpr5\, g2a => tptse, g2q_n => \-tptse\, g3b => internal8, g3a => \-tpw30\);
--  clock2_1c06 : sn74s10 port map(g1a => \-tprend\, g1b => tpclk, g2a => \-tptse\, g2b => \-tpr25\, g2c => \-clock_reset_b\, g2y_n => tptse, g3y_n => internal13, g3a => \-clock_reset_b\, g3b => \-tpw70\, g3c => internal12, g1y_n => \-tpclk\);

--  clockd_1f05 : sn74s133 port map(g => hi1, f => hi2, e => hi3, d => hi4, c => hi5, b => hi6, a => hi7, q_n => \-upperhighok\, h => hi8, i => hi9, j => hi10, k => hi11, l => hi12);
--  clockd_4d03 : sn74s04 port map(g1a => nc, g1q_n => nc, g2a => nc, g2q_n => nc, g3a => \-tse4\, g3q_n => tse4b, g4q => tse4a, g4a => \-tse4\, g5q_n => srcpdlptr, g5a => \-srcpdlptr\, g6q_n => srcpdlidx);
--  clockd_4c07 : sn74s37 port map(g1a => \-clk4d\, g1b => hi2, g1y => clk4d, g2a => \-clk4d\, g2b => hi2, g2y => clk4e, g3y => clk4f, g3a => hi2, g3b => \-clk4d\);
--  clockd_4c02 : sn74s37 port map(g1a => \-clk4a\, g1b => hi5, g1y => clk4a, g2a => \-clk4a\, g2b => hi5, g2y => clk4b, g3y => clk4c, g3a => hi5, g3b => \-clk4a\);
--  clockd_4c06 : sn74s04 port map(g1a => clk4, g1q_n => \-clk4e\, g2a => clk4, g2q_n => \-clk4d\, g3a => clk4, g3q_n => \-clk4a\, g4q => wp4c, g4a => \-wp4\, g5q_n => wp4b, g5a => \-wp4\, g6q_n => wp4a);
--  clockd_3c13 : sn74s37 port map(g1a => \-clk3d\, g1b => hi5, g1y => clk3d, g2a => \-clk3d\, g2b => hi5, g2y => clk3e, g3y => clk3f, g3a => hi5, g3b => \-clk3d\);
--  clockd_3c11 : sn74s37 port map(g1a => \-clk3a\, g1b => hi5, g1y => clk3a, g2a => \-clk3a\, g2b => hi5, g2y => clk3b, g3y => clk3c, g3a => hi5, g3b => \-clk3a\);
--  clockd_3c12 : sn74s04 port map(g1a => nc, g1q_n => nc, g2a => clk3, g2q_n => \-clk3g\, g3a => clk3, g3q_n => \-clk3d\, g4q => \-clk3a\, g4a => clk3, g5q_n => wp3a, g5a => \-wp3\, g6q_n => tse3a);
--  clockd_2c03 : sn74s37 port map(g1a => \-clk2a\, g1b => hi7, g1y => clk2a, g2a => \-clk2a\, g2b => hi7, g2y => clk2b, g3y => clk2c, g3a => hi7, g3b => \-clk2c\);
--  clockd_2c02 : sn74s04 port map(g1a => lcry3, g1q_n => \-lcry3\, g2a => nc, g2q_n => nc, g3a => clk2, g3q_n => \-clk2c\, g4q => \-clk2a\, g4a => clk2, g5q_n => wp2, g5a => \-wp2\, g6q_n => tse2);
--  clockd_1b18 : sn74s37 port map(g1a => \-clk1\, g1b => hi12, g1y => clk1a, g2a => reset, g2b => hi12, g2y => \-reset\, g3y => mclk1a, g3a => hi12, g3b => \-mclk1\);
--  clockd_1b19 : sn74s04 port map(g1a => mclk1, g1q_n => \-mclk1\, g2a => clk1, g2q_n => \-clk1\, g3a => \-wp1\, g3q_n => wp1b, g4q => wp1a, g4a => \-wp1\, g5q_n => tse1b, g5a => \-tse1\, g6q_n => tse1a);

  --- Microinstruction Fetch

--  ictl_1a15 : 9s42_1 port map(out2 => ramdisable, g2d2 => hi1, g2c2 => hi1, g2b2 => \-iwriteda\, g2a2 => \-promdisabled\, g1b2 => hi1);
--  ictl_2d25 : sn74s139 port map(g1 => ramdisable, a1 => \-pc12b\, b1 => \-pc13b\, g1y0 => \-ice3c\, g1y1 => \-ice2c\, g1y2 => \-ice1c\, g1y3 => \-ice0c\, g2y3 => \-ice0d\, g2y2 => \-ice1d\, g2y1 => \-ice2d\, g2y0 => \-ice3d\, b2 => \-pc13b\, a2 => \-pc12b\);
--  ictl_1c16 : sn74s04 port map(g1a => iwriteda, g1q_n => \-iwriteda\, g2a => promdisabled, g2q_n => \-promdisabled\, g3a => \-wp5\, g3q_n => wp5d, g4q => wp5c, g4a => \-wp5\, g5q_n => wp5b, g5a => \-wp5\, g6q_n => wp5a);
--  ictl_1d20 : sn74s04 port map(g1a => pc13, g1q_n => \-pc13b\, g2a => pc12, g2q_n => \-pc12b\, g3a => \-iwrited\, g3q_n => iwritedd, g4q => iwritedc, g4a => \-iwrited\, g5q_n => iwritedb, g5a => \-iwrited\, g6q_n => iwriteda);
--  ictl_2d30 : sn74s37 port map(g1a => wp5d, g1b => iwritedd, g1y => \-iweg\, g2a => wp5d, g2b => iwritedd, g2y => \-iweh\, g3y => \-iweo\, g3a => iwritedd, g3b => wp5d, g4y => \-iwep\, g4a => iwritedd);
--  ictl_2d15 : sn74s37 port map(g1a => wp5c, g1b => iwritedc, g1y => \-iwee\, g2a => wp5c, g2b => iwritedc, g2y => \-iwef\, g3y => \-iwem\, g3a => iwritedc, g3b => wp5c, g4y => \-iwen\, g4a => iwritedc);
--  ictl_2c01 : sn74s37 port map(g1a => wp5b, g1b => iwritedb, g1y => \-iwec\, g2a => wp5b, g2b => iwritedb, g2y => \-iwed\, g3y => \-iwek\, g3a => iwritedb, g3b => wp5b, g4y => \-iwel\, g4a => iwritedb);
--  ictl_1c26 : sn74s37 port map(g1a => wp5a, g1b => iwriteda, g1y => \-iwea\, g2a => wp5a, g2b => iwriteda, g2y => \-iweb\, g3y => \-iwei\, g3a => iwriteda, g3b => wp5a, g4y => \-iwej\, g4a => iwriteda);
--  ictl_2c06 : sn74s04 port map(g1a => pc0, g1q_n => \-pcc0\, g2a => pc1, g2q_n => \-pcc1\, g3a => pc2, g3q_n => \-pcc2\, g4q => \-pcc3\, g4a => pc3, g5q_n => \-pcc4\, g5a => pc4, g6q_n => \-pcc5\);
--  ictl_2d10 : sn74s04 port map(g1a => pc6, g1q_n => \-pcc6\, g2a => pc7, g2q_n => \-pcc7\, g3a => pc8, g3q_n => \-pcc8\, g4q => \-pcc9\, g4a => pc9, g5q_n => \-pcc10\, g5a => pc10, g6q_n => \-pcc11\);
--  ictl_1c21 : sn74s04 port map(g1a => pc0, g1q_n => \-pcb0\, g2a => pc1, g2q_n => \-pcb1\, g3a => pc2, g3q_n => \-pcb2\, g4q => \-pcb3\, g4a => pc3, g5q_n => \-pcb4\, g5a => pc4, g6q_n => \-pcb5\);
--  ictl_1d25 : sn74s04 port map(g1a => pc6, g1q_n => \-pcb6\, g2a => pc7, g2q_n => \-pcb7\, g3a => pc8, g3q_n => \-pcb8\, g4q => \-pcb9\, g4a => pc9, g5q_n => \-pcb10\, g5a => pc10, g6q_n => \-pcb11\);
--  ictl_1d30 : sn74s139 port map(g1 => ramdisable, a1 => \-pc12b\, b1 => \-pc13b\, g1y0 => \-ice3a\, g1y1 => \-ice2a\, g1y2 => \-ice1a\, g1y3 => \-ice0a\, g2y3 => \-ice0b\, g2y2 => \-ice1b\, g2y1 => \-ice2b\, g2y0 => \-ice3b\, b2 => \-pc13b\, a2 => \-pc12b\);

--  iram00_1d23 : sn74s04 port map(g1a => \-pcb6\, g1q_n => pc6a, g2a => \-pcb7\, g2q_n => pc7a, g3a => \-pcb8\, g3q_n => pc8a, g4q => pc9a, g4a => \-pcb9\, g5q_n => pc10a, g5a => \-pcb10\, g6q_n => pc11a);
--  iram00_1d24 : sn74s04 port map(g1a => \-pcb0\, g1q_n => pc0a, g2a => \-pcb1\, g2q_n => pc1a, g3a => \-pcb2\, g3q_n => pc2a, g4q => pc3a, g4a => \-pcb3\, g5q_n => pc4a, g5a => \-pcb4\, g6q_n => pc5a);
--  iram00_1e21 : 2147 port map(a0 => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i5, we_n => \-iwea\, ce_n => \-ice0a\, di => iwr5, a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a);
--  iram00_1f25 : 2147 port map(a0 => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i4, we_n => \-iwea\, ce_n => \-ice0a\, di => iwr4, a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a);
--  iram00_1f24 : 2147 port map(a0 => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i3, we_n => \-iwea\, ce_n => \-ice0a\, di => iwr3, a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a);
--  iram00_1f23 : 2147 port map(a0 => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i2, we_n => \-iwea\, ce_n => \-ice0a\, di => iwr2, a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a);
--  iram00_1f22 : 2147 port map(a0 => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i1, we_n => \-iwea\, ce_n => \-ice0a\, di => iwr1, a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a);
--  iram00_1f21 : 2147 port map(a0 => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i0, we_n => \-iwea\, ce_n => \-ice0a\, di => iwr0, a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a);
--  iram00_1d22 : 2147 port map(a0 => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i11, we_n => \-iwea\, ce_n => \-ice0a\, di => iwr11, a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a);
--  iram00_1d21 : 2147 port map(a0 => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i10, we_n => \-iwea\, ce_n => \-ice0a\, di => iwr10, a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a);
--  iram00_1e25 : 2147 port map(a0 => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i9, we_n => \-iwea\, ce_n => \-ice0a\, di => iwr9, a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a);
--  iram00_1e24 : 2147 port map(a0 => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i8, we_n => \-iwea\, ce_n => \-ice0a\, di => iwr8, a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a);
--  iram00_1e23 : 2147 port map(a0 => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i7, we_n => \-iwea\, ce_n => \-ice0a\, di => iwr7, a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a);
--  iram00_1e22 : 2147 port map(a0 => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i6, we_n => \-iwea\, ce_n => \-ice0a\, di => iwr6, a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a);

--  iram01_1d28 : sn74s04 port map(g1a => \-pcb6\, g1q_n => pc6b, g2a => \-pcb7\, g2q_n => pc7b, g3a => \-pcb8\, g3q_n => pc8b, g4q => pc9b, g4a => \-pcb9\, g5q_n => pc10b, g5a => \-pcb10\, g6q_n => pc11b);
--  iram01_1d29 : sn74s04 port map(g1a => \-pcb0\, g1q_n => pc0b, g2a => \-pcb1\, g2q_n => pc1b, g3a => \-pcb2\, g3q_n => pc2b, g4q => pc3b, g4a => \-pcb3\, g5q_n => pc4b, g5a => \-pcb4\, g6q_n => pc5b);
--  iram01_1e26 : 2147 port map(a0 => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i5, we_n => \-iweb\, ce_n => \-ice1a\, di => iwr5, a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b);
--  iram01_1f30 : 2147 port map(a0 => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i4, we_n => \-iweb\, ce_n => \-ice1a\, di => iwr4, a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b);
--  iram01_1f29 : 2147 port map(a0 => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i3, we_n => \-iweb\, ce_n => \-ice1a\, di => iwr3, a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b);
--  iram01_1f28 : 2147 port map(a0 => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i2, we_n => \-iweb\, ce_n => \-ice1a\, di => iwr2, a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b);
--  iram01_1f27 : 2147 port map(a0 => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i1, we_n => \-iweb\, ce_n => \-ice1a\, di => iwr1, a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b);
--  iram01_1f26 : 2147 port map(a0 => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i0, we_n => \-iweb\, ce_n => \-ice1a\, di => iwr0, a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b);
--  iram01_1d27 : 2147 port map(a0 => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i11, we_n => \-iweb\, ce_n => \-ice1a\, di => iwr11, a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b);
--  iram01_1d26 : 2147 port map(a0 => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i10, we_n => \-iweb\, ce_n => \-ice1a\, di => iwr10, a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b);
--  iram01_1e30 : 2147 port map(a0 => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i9, we_n => \-iweb\, ce_n => \-ice1a\, di => iwr9, a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b);
--  iram01_1e29 : 2147 port map(a0 => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i8, we_n => \-iweb\, ce_n => \-ice1a\, di => iwr8, a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b);
--  iram01_1e28 : 2147 port map(a0 => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i7, we_n => \-iweb\, ce_n => \-ice1a\, di => iwr7, a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b);
--  iram01_1e27 : 2147 port map(a0 => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i6, we_n => \-iweb\, ce_n => \-ice1a\, di => iwr6, a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b);

--  iram02_2d03 : sn74s04 port map(g1a => \-pcb6\, g1q_n => pc6c, g2a => \-pcb7\, g2q_n => pc7c, g3a => \-pcb8\, g3q_n => pc8c, g4q => pc9c, g4a => \-pcb9\, g5q_n => pc10c, g5a => \-pcb10\, g6q_n => pc11c);
--  iram02_2d04 : sn74s04 port map(g1a => \-pcb0\, g1q_n => pc0c, g2a => \-pcb1\, g2q_n => pc1c, g3a => \-pcb2\, g3q_n => pc2c, g4q => pc3c, g4a => \-pcb3\, g5q_n => pc4c, g5a => \-pcb4\, g6q_n => pc5c);
--  iram02_2e01 : 2147 port map(a0 => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i5, we_n => \-iwec\, ce_n => \-ice2a\, di => iwr5, a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c);
--  iram02_2f05 : 2147 port map(a0 => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i4, we_n => \-iwec\, ce_n => \-ice2a\, di => iwr4, a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c);
--  iram02_2f04 : 2147 port map(a0 => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i3, we_n => \-iwec\, ce_n => \-ice2a\, di => iwr3, a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c);
--  iram02_2f03 : 2147 port map(a0 => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i2, we_n => \-iwec\, ce_n => \-ice2a\, di => iwr2, a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c);
--  iram02_2f02 : 2147 port map(a0 => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i1, we_n => \-iwec\, ce_n => \-ice2a\, di => iwr1, a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c);
--  iram02_2f01 : 2147 port map(a0 => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i0, we_n => \-iwec\, ce_n => \-ice2a\, di => iwr0, a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c);
--  iram02_2d02 : 2147 port map(a0 => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i11, we_n => \-iwec\, ce_n => \-ice2a\, di => iwr11, a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c);
--  iram02_2d01 : 2147 port map(a0 => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i10, we_n => \-iwec\, ce_n => \-ice2a\, di => iwr10, a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c);
--  iram02_2e05 : 2147 port map(a0 => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i9, we_n => \-iwec\, ce_n => \-ice2a\, di => iwr9, a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c);
--  iram02_2e04 : 2147 port map(a0 => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i8, we_n => \-iwec\, ce_n => \-ice2a\, di => iwr8, a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c);
--  iram02_2e03 : 2147 port map(a0 => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i7, we_n => \-iwec\, ce_n => \-ice2a\, di => iwr7, a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c);
--  iram02_2e02 : 2147 port map(a0 => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i6, we_n => \-iwec\, ce_n => \-ice2a\, di => iwr6, a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c);

--  iram03_2d08 : sn74s04 port map(g1a => \-pcb6\, g1q_n => pc6d, g2a => \-pcb7\, g2q_n => pc7d, g3a => \-pcb8\, g3q_n => pc8d, g4q => pc9d, g4a => \-pcb9\, g5q_n => pc10d, g5a => \-pcb10\, g6q_n => pc11d);
--  iram03_2d09 : sn74s04 port map(g1a => \-pcb0\, g1q_n => pc0d, g2a => \-pcb1\, g2q_n => pc1d, g3a => \-pcb2\, g3q_n => pc2d, g4q => pc3d, g4a => \-pcb3\, g5q_n => pc4d, g5a => \-pcb4\, g6q_n => pc5d);
--  iram03_2e06 : 2147 port map(a0 => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i5, we_n => \-iwed\, ce_n => \-ice3a\, di => iwr5, a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d);
--  iram03_2f10 : 2147 port map(a0 => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i4, we_n => \-iwed\, ce_n => \-ice3a\, di => iwr4, a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d);
--  iram03_2f09 : 2147 port map(a0 => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i3, we_n => \-iwed\, ce_n => \-ice3a\, di => iwr3, a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d);
--  iram03_2f08 : 2147 port map(a0 => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i2, we_n => \-iwed\, ce_n => \-ice3a\, di => iwr2, a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d);
--  iram03_2f07 : 2147 port map(a0 => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i1, we_n => \-iwed\, ce_n => \-ice3a\, di => iwr1, a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d);
--  iram03_2f06 : 2147 port map(a0 => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i0, we_n => \-iwed\, ce_n => \-ice3a\, di => iwr0, a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d);
--  iram03_2d07 : 2147 port map(a0 => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i11, we_n => \-iwed\, ce_n => \-ice3a\, di => iwr11, a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d);
--  iram03_2d06 : 2147 port map(a0 => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i10, we_n => \-iwed\, ce_n => \-ice3a\, di => iwr10, a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d);
--  iram03_2e10 : 2147 port map(a0 => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i9, we_n => \-iwed\, ce_n => \-ice3a\, di => iwr9, a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d);
--  iram03_2e09 : 2147 port map(a0 => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i8, we_n => \-iwed\, ce_n => \-ice3a\, di => iwr8, a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d);
--  iram03_2e08 : 2147 port map(a0 => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i7, we_n => \-iwed\, ce_n => \-ice3a\, di => iwr7, a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d);
--  iram03_2e07 : 2147 port map(a0 => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i6, we_n => \-iwed\, ce_n => \-ice3a\, di => iwr6, a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d);

--  iram10_2e12 : 2147 port map(a0 => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i18, we_n => \-iwee\, ce_n => \-ice0b\, di => iwr18, a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e);
--  iram10_2e13 : 2147 port map(a0 => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i19, we_n => \-iwee\, ce_n => \-ice0b\, di => iwr19, a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e);
--  iram10_2e14 : 2147 port map(a0 => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i20, we_n => \-iwee\, ce_n => \-ice0b\, di => iwr20, a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e);
--  iram10_2e15 : 2147 port map(a0 => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i21, we_n => \-iwee\, ce_n => \-ice0b\, di => iwr21, a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e);
--  iram10_2d11 : 2147 port map(a0 => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i22, we_n => \-iwee\, ce_n => \-ice0b\, di => iwr22, a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e);
--  iram10_2d12 : 2147 port map(a0 => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i23, we_n => \-iwee\, ce_n => \-ice0b\, di => iwr23, a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e);
--  iram10_2f11 : 2147 port map(a0 => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i12, we_n => \-iwee\, ce_n => \-ice0b\, di => iwr12, a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e);
--  iram10_2f12 : 2147 port map(a0 => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i13, we_n => \-iwee\, ce_n => \-ice0b\, di => iwr13, a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e);
--  iram10_2f13 : 2147 port map(a0 => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i14, we_n => \-iwee\, ce_n => \-ice0b\, di => iwr14, a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e);
--  iram10_2f14 : 2147 port map(a0 => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i15, we_n => \-iwee\, ce_n => \-ice0b\, di => iwr15, a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e);
--  iram10_2f15 : 2147 port map(a0 => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i16, we_n => \-iwee\, ce_n => \-ice0b\, di => iwr16, a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e);
--  iram10_2e11 : 2147 port map(a0 => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i17, we_n => \-iwee\, ce_n => \-ice0b\, di => iwr17, a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e);
--  iram10_2d14 : sn74s04 port map(g1a => \-pcb0\, g1q_n => pc0e, g2a => \-pcb1\, g2q_n => pc1e, g3a => \-pcb2\, g3q_n => pc2e, g4q => pc3e, g4a => \-pcb3\, g5q_n => pc4e, g5a => \-pcb4\, g6q_n => pc5e);
--  iram10_2d13 : sn74s04 port map(g1a => \-pcb6\, g1q_n => pc6e, g2a => \-pcb7\, g2q_n => pc7e, g3a => \-pcb8\, g3q_n => pc8e, g4q => pc9e, g4a => \-pcb9\, g5q_n => pc10e, g5a => \-pcb10\, g6q_n => pc11e);

--  iram11_2e17 : 2147 port map(a0 => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i18, we_n => \-iwef\, ce_n => \-ice1b\, di => iwr18, a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f);
--  iram11_2e18 : 2147 port map(a0 => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i19, we_n => \-iwef\, ce_n => \-ice1b\, di => iwr19, a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f);
--  iram11_2e19 : 2147 port map(a0 => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i20, we_n => \-iwef\, ce_n => \-ice1b\, di => iwr20, a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f);
--  iram11_2e20 : 2147 port map(a0 => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i21, we_n => \-iwef\, ce_n => \-ice1b\, di => iwr21, a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f);
--  iram11_2d16 : 2147 port map(a0 => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i22, we_n => \-iwef\, ce_n => \-ice1b\, di => iwr22, a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f);
--  iram11_2d17 : 2147 port map(a0 => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i23, we_n => \-iwef\, ce_n => \-ice1b\, di => iwr23, a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f);
--  iram11_2f16 : 2147 port map(a0 => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i12, we_n => \-iwef\, ce_n => \-ice1b\, di => iwr12, a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f);
--  iram11_2f17 : 2147 port map(a0 => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i13, we_n => \-iwef\, ce_n => \-ice1b\, di => iwr13, a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f);
--  iram11_2f18 : 2147 port map(a0 => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i14, we_n => \-iwef\, ce_n => \-ice1b\, di => iwr14, a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f);
--  iram11_2f19 : 2147 port map(a0 => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i15, we_n => \-iwef\, ce_n => \-ice1b\, di => iwr15, a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f);
--  iram11_2f20 : 2147 port map(a0 => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i16, we_n => \-iwef\, ce_n => \-ice1b\, di => iwr16, a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f);
--  iram11_2e16 : 2147 port map(a0 => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i17, we_n => \-iwef\, ce_n => \-ice1b\, di => iwr17, a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f);
--  iram11_2d19 : sn74s04 port map(g1a => \-pcb0\, g1q_n => pc0f, g2a => \-pcb1\, g2q_n => pc1f, g3a => \-pcb2\, g3q_n => pc2f, g4q => pc3f, g4a => \-pcb3\, g5q_n => pc4f, g5a => \-pcb4\, g6q_n => pc5f);
--  iram11_2d18 : sn74s04 port map(g1a => \-pcb6\, g1q_n => pc6f, g2a => \-pcb7\, g2q_n => pc7f, g3a => \-pcb8\, g3q_n => pc8f, g4q => pc9f, g4a => \-pcb9\, g5q_n => pc10f, g5a => \-pcb10\, g6q_n => pc11f);

--  iram12_2e22 : 2147 port map(a0 => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i18, we_n => \-iweg\, ce_n => \-ice2b\, di => iwr18, a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g);
--  iram12_2e23 : 2147 port map(a0 => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i19, we_n => \-iweg\, ce_n => \-ice2b\, di => iwr19, a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g);
--  iram12_2e24 : 2147 port map(a0 => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i20, we_n => \-iweg\, ce_n => \-ice2b\, di => iwr20, a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g);
--  iram12_2e25 : 2147 port map(a0 => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i21, we_n => \-iweg\, ce_n => \-ice2b\, di => iwr21, a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g);
--  iram12_2d21 : 2147 port map(a0 => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i22, we_n => \-iweg\, ce_n => \-ice2b\, di => iwr22, a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g);
--  iram12_2d22 : 2147 port map(a0 => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i23, we_n => \-iweg\, ce_n => \-ice2b\, di => iwr23, a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g);
--  iram12_2f21 : 2147 port map(a0 => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i12, we_n => \-iweg\, ce_n => \-ice2b\, di => iwr12, a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g);
--  iram12_2f22 : 2147 port map(a0 => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i13, we_n => \-iweg\, ce_n => \-ice2b\, di => iwr13, a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g);
--  iram12_2f23 : 2147 port map(a0 => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i14, we_n => \-iweg\, ce_n => \-ice2b\, di => iwr14, a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g);
--  iram12_2f24 : 2147 port map(a0 => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i15, we_n => \-iweg\, ce_n => \-ice2b\, di => iwr15, a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g);
--  iram12_2f25 : 2147 port map(a0 => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i16, we_n => \-iweg\, ce_n => \-ice2b\, di => iwr16, a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g);
--  iram12_2e21 : 2147 port map(a0 => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i17, we_n => \-iweg\, ce_n => \-ice2b\, di => iwr17, a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g);
--  iram12_2d24 : sn74s04 port map(g1a => \-pcb0\, g1q_n => pc0g, g2a => \-pcb1\, g2q_n => pc1g, g3a => \-pcb2\, g3q_n => pc2g, g4q => pc3g, g4a => \-pcb3\, g5q_n => pc4g, g5a => \-pcb4\, g6q_n => pc5g);
--  iram12_2d23 : sn74s04 port map(g1a => \-pcb6\, g1q_n => pc6g, g2a => \-pcb7\, g2q_n => pc7g, g3a => \-pcb8\, g3q_n => pc8g, g4q => pc9g, g4a => \-pcb9\, g5q_n => pc10g, g5a => \-pcb10\, g6q_n => pc11g);

--  iram13_2e27 : 2147 port map(a0 => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i18, we_n => \-iweh\, ce_n => \-ice3b\, di => iwr18, a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h);
--  iram13_2e28 : 2147 port map(a0 => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i19, we_n => \-iweh\, ce_n => \-ice3b\, di => iwr19, a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h);
--  iram13_2e29 : 2147 port map(a0 => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i20, we_n => \-iweh\, ce_n => \-ice3b\, di => iwr20, a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h);
--  iram13_2e30 : 2147 port map(a0 => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i21, we_n => \-iweh\, ce_n => \-ice3b\, di => iwr21, a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h);
--  iram13_2d26 : 2147 port map(a0 => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i22, we_n => \-iweh\, ce_n => \-ice3b\, di => iwr22, a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h);
--  iram13_2d27 : 2147 port map(a0 => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i23, we_n => \-iweh\, ce_n => \-ice3b\, di => iwr23, a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h);
--  iram13_2f26 : 2147 port map(a0 => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i12, we_n => \-iweh\, ce_n => \-ice3b\, di => iwr12, a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h);
--  iram13_2f27 : 2147 port map(a0 => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i13, we_n => \-iweh\, ce_n => \-ice3b\, di => iwr13, a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h);
--  iram13_2f28 : 2147 port map(a0 => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i14, we_n => \-iweh\, ce_n => \-ice3b\, di => iwr14, a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h);
--  iram13_2f29 : 2147 port map(a0 => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i15, we_n => \-iweh\, ce_n => \-ice3b\, di => iwr15, a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h);
--  iram13_2f30 : 2147 port map(a0 => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i16, we_n => \-iweh\, ce_n => \-ice3b\, di => iwr16, a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h);
--  iram13_2e26 : 2147 port map(a0 => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i17, we_n => \-iweh\, ce_n => \-ice3b\, di => iwr17, a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h);
--  iram13_2d29 : sn74s04 port map(g1a => \-pcb0\, g1q_n => pc0h, g2a => \-pcb1\, g2q_n => pc1h, g3a => \-pcb2\, g3q_n => pc2h, g4q => pc3h, g4a => \-pcb3\, g5q_n => pc4h, g5a => \-pcb4\, g6q_n => pc5h);
--  iram13_2d28 : sn74s04 port map(g1a => \-pcb6\, g1q_n => pc6h, g2a => \-pcb7\, g2q_n => pc7h, g3a => \-pcb8\, g3q_n => pc8h, g4q => pc9h, g4a => \-pcb9\, g5q_n => pc10h, g5a => \-pcb10\, g6q_n => pc11h);

--  iram20_1b25 : 2147 port map(a0 => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i30, we_n => \-iwei\, ce_n => \-ice0c\, di => iwr30, a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i);
--  iram20_1a21 : 2147 port map(a0 => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i31, we_n => \-iwei\, ce_n => \-ice0c\, di => iwr31, a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i);
--  iram20_1a22 : 2147 port map(a0 => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i32, we_n => \-iwei\, ce_n => \-ice0c\, di => iwr32, a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i);
--  iram20_1a23 : 2147 port map(a0 => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i33, we_n => \-iwei\, ce_n => \-ice0c\, di => iwr33, a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i);
--  iram20_1a24 : 2147 port map(a0 => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i34, we_n => \-iwei\, ce_n => \-ice0c\, di => iwr34, a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i);
--  iram20_1a25 : 2147 port map(a0 => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i35, we_n => \-iwei\, ce_n => \-ice0c\, di => iwr35, a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i);
--  iram20_1c24 : 2147 port map(a0 => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i24, we_n => \-iwei\, ce_n => \-ice0c\, di => iwr24, a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i);
--  iram20_1c25 : 2147 port map(a0 => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i25, we_n => \-iwei\, ce_n => \-ice0c\, di => iwr25, a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i);
--  iram20_1b21 : 2147 port map(a0 => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i26, we_n => \-iwei\, ce_n => \-ice0c\, di => iwr26, a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i);
--  iram20_1b22 : 2147 port map(a0 => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i27, we_n => \-iwei\, ce_n => \-ice0c\, di => iwr27, a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i);
--  iram20_1b23 : 2147 port map(a0 => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i28, we_n => \-iwei\, ce_n => \-ice0c\, di => iwr28, a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i);
--  iram20_1b24 : 2147 port map(a0 => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i29, we_n => \-iwei\, ce_n => \-ice0c\, di => iwr29, a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i);
--  iram20_1c23 : sn74s04 port map(g1a => \-pcc0\, g1q_n => pc0i, g2a => \-pcc1\, g2q_n => pc1i, g3a => \-pcc2\, g3q_n => pc2i, g4q => pc3i, g4a => \-pcc3\, g5q_n => pc4i, g5a => \-pcc4\, g6q_n => pc5i);
--  iram20_1c22 : sn74s04 port map(g1a => \-pcc6\, g1q_n => pc6i, g2a => \-pcc7\, g2q_n => pc7i, g3a => \-pcc8\, g3q_n => pc8i, g4q => pc9i, g4a => \-pcc9\, g5q_n => pc10i, g5a => \-pcc10\, g6q_n => pc11i);

--  iram21_1b30 : 2147 port map(a0 => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i30, we_n => \-iwej\, ce_n => \-ice1c\, di => iwr30, a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j);
--  iram21_1a26 : 2147 port map(a0 => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i31, we_n => \-iwej\, ce_n => \-ice1c\, di => iwr31, a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j);
--  iram21_1a27 : 2147 port map(a0 => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i32, we_n => \-iwej\, ce_n => \-ice1c\, di => iwr32, a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j);
--  iram21_1a28 : 2147 port map(a0 => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i33, we_n => \-iwej\, ce_n => \-ice1c\, di => iwr33, a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j);
--  iram21_1a29 : 2147 port map(a0 => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i34, we_n => \-iwej\, ce_n => \-ice1c\, di => iwr34, a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j);
--  iram21_1a30 : 2147 port map(a0 => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i35, we_n => \-iwej\, ce_n => \-ice1c\, di => iwr35, a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j);
--  iram21_1c29 : 2147 port map(a0 => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i24, we_n => \-iwej\, ce_n => \-ice1c\, di => iwr24, a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j);
--  iram21_1c30 : 2147 port map(a0 => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i25, we_n => \-iwej\, ce_n => \-ice1c\, di => iwr25, a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j);
--  iram21_1b26 : 2147 port map(a0 => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i26, we_n => \-iwej\, ce_n => \-ice1c\, di => iwr26, a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j);
--  iram21_1b27 : 2147 port map(a0 => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i27, we_n => \-iwej\, ce_n => \-ice1c\, di => iwr27, a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j);
--  iram21_1b28 : 2147 port map(a0 => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i28, we_n => \-iwej\, ce_n => \-ice1c\, di => iwr28, a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j);
--  iram21_1b29 : 2147 port map(a0 => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i29, we_n => \-iwej\, ce_n => \-ice1c\, di => iwr29, a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j);
--  iram21_1c28 : sn74s04 port map(g1a => \-pcc0\, g1q_n => pc0j, g2a => \-pcc1\, g2q_n => pc1j, g3a => \-pcc2\, g3q_n => pc2j, g4q => pc3j, g4a => \-pcc3\, g5q_n => pc4j, g5a => \-pcc4\, g6q_n => pc5j);
--  iram21_1c27 : sn74s04 port map(g1a => \-pcc6\, g1q_n => pc6j, g2a => \-pcc7\, g2q_n => pc7j, g3a => \-pcc8\, g3q_n => pc8j, g4q => pc9j, g4a => \-pcc9\, g5q_n => pc10j, g5a => \-pcc10\, g6q_n => pc11j);

--  iram22_2b05 : 2147 port map(a0 => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i30, we_n => \-iwek\, ce_n => \-ice2c\, di => iwr30, a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k);
--  iram22_2a01 : 2147 port map(a0 => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i31, we_n => \-iwek\, ce_n => \-ice2c\, di => iwr31, a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k);
--  iram22_2a02 : 2147 port map(a0 => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i32, we_n => \-iwek\, ce_n => \-ice2c\, di => iwr32, a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k);
--  iram22_2a03 : 2147 port map(a0 => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i33, we_n => \-iwek\, ce_n => \-ice2c\, di => iwr33, a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k);
--  iram22_2a04 : 2147 port map(a0 => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i34, we_n => \-iwek\, ce_n => \-ice2c\, di => iwr34, a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k);
--  iram22_2a05 : 2147 port map(a0 => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i35, we_n => \-iwek\, ce_n => \-ice2c\, di => iwr35, a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k);
--  iram22_2c04 : 2147 port map(a0 => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i24, we_n => \-iwek\, ce_n => \-ice2c\, di => iwr24, a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k);
--  iram22_2c05 : 2147 port map(a0 => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i25, we_n => \-iwek\, ce_n => \-ice2c\, di => iwr25, a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k);
--  iram22_2b01 : 2147 port map(a0 => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i26, we_n => \-iwek\, ce_n => \-ice2c\, di => iwr26, a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k);
--  iram22_2b02 : 2147 port map(a0 => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i27, we_n => \-iwek\, ce_n => \-ice2c\, di => iwr27, a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k);
--  iram22_2b03 : 2147 port map(a0 => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i28, we_n => \-iwek\, ce_n => \-ice2c\, di => iwr28, a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k);
--  iram22_2b04 : 2147 port map(a0 => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i29, we_n => \-iwek\, ce_n => \-ice2c\, di => iwr29, a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k);
--  iram22_2c03 : sn74s04 port map(g1a => \-pcc0\, g1q_n => pc0k, g2a => \-pcc1\, g2q_n => pc1k, g3a => \-pcc2\, g3q_n => pc2k, g4q => pc3k, g4a => \-pcc3\, g5q_n => pc4k, g5a => \-pcc4\, g6q_n => pc5k);
--  iram22_2c02 : sn74s04 port map(g1a => \-pcc6\, g1q_n => pc6k, g2a => \-pcc7\, g2q_n => pc7k, g3a => \-pcc8\, g3q_n => pc8k, g4q => pc9k, g4a => \-pcc9\, g5q_n => pc10k, g5a => \-pcc10\, g6q_n => pc11k);

--  iram23_2b10 : 2147 port map(a0 => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i30, we_n => \-iwel\, ce_n => \-ice3c\, di => iwr30, a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l);
--  iram23_2a06 : 2147 port map(a0 => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i31, we_n => \-iwel\, ce_n => \-ice3c\, di => iwr31, a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l);
--  iram23_2a07 : 2147 port map(a0 => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i32, we_n => \-iwel\, ce_n => \-ice3c\, di => iwr32, a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l);
--  iram23_2a08 : 2147 port map(a0 => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i33, we_n => \-iwel\, ce_n => \-ice3c\, di => iwr33, a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l);
--  iram23_2a09 : 2147 port map(a0 => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i34, we_n => \-iwel\, ce_n => \-ice3c\, di => iwr34, a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l);
--  iram23_2a10 : 2147 port map(a0 => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i35, we_n => \-iwel\, ce_n => \-ice3c\, di => iwr35, a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l);
--  iram23_2c09 : 2147 port map(a0 => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i24, we_n => \-iwel\, ce_n => \-ice3c\, di => iwr24, a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l);
--  iram23_2c10 : 2147 port map(a0 => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i25, we_n => \-iwel\, ce_n => \-ice3c\, di => iwr25, a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l);
--  iram23_2b06 : 2147 port map(a0 => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i26, we_n => \-iwel\, ce_n => \-ice3c\, di => iwr26, a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l);
--  iram23_2b07 : 2147 port map(a0 => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i27, we_n => \-iwel\, ce_n => \-ice3c\, di => iwr27, a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l);
--  iram23_2b08 : 2147 port map(a0 => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i28, we_n => \-iwel\, ce_n => \-ice3c\, di => iwr28, a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l);
--  iram23_2b09 : 2147 port map(a0 => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i29, we_n => \-iwel\, ce_n => \-ice3c\, di => iwr29, a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l);
--  iram23_2c08 : sn74s04 port map(g1a => \-pcc0\, g1q_n => pc0l, g2a => \-pcc1\, g2q_n => pc1l, g3a => \-pcc2\, g3q_n => pc2l, g4q => pc3l, g4a => \-pcc3\, g5q_n => pc4l, g5a => \-pcc4\, g6q_n => pc5l);
--  iram23_2c07 : sn74s04 port map(g1a => \-pcc6\, g1q_n => pc6l, g2a => \-pcc7\, g2q_n => pc7l, g3a => \-pcc8\, g3q_n => pc8l, g4q => pc9l, g4a => \-pcc9\, g5q_n => pc10l, g5a => \-pcc10\, g6q_n => pc11l);

--  iram30_2b15 : 2147 port map(a0 => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i43, we_n => \-iwem\, ce_n => \-ice0d\, di => iwr43, a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m);
--  iram30_2a11 : 2147 port map(a0 => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i44, we_n => \-iwem\, ce_n => \-ice0d\, di => iwr44, a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m);
--  iram30_2a12 : 2147 port map(a0 => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i45, we_n => \-iwem\, ce_n => \-ice0d\, di => iwr45, a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m);
--  iram30_2a13 : 2147 port map(a0 => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i46, we_n => \-iwem\, ce_n => \-ice0d\, di => iwr46, a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m);
--  iram30_2a14 : 2147 port map(a0 => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i47, we_n => \-iwem\, ce_n => \-ice0d\, di => iwr47, a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m);
--  iram30_2a15 : 2147 port map(a0 => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i48, we_n => \-iwem\, ce_n => \-ice0d\, di => iwr48, a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m);
--  iram30_2c13 : 2147 port map(a0 => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i36, we_n => \-iwem\, ce_n => \-ice0d\, di => iwr36, a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m);
--  iram30_2c14 : 2147 port map(a0 => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i37, we_n => \-iwem\, ce_n => \-ice0d\, di => iwr37, a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m);
--  iram30_2c15 : 2147 port map(a0 => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i38, we_n => \-iwem\, ce_n => \-ice0d\, di => iwr38, a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m);
--  iram30_2b11 : 2147 port map(a0 => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i39, we_n => \-iwem\, ce_n => \-ice0d\, di => iwr39, a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m);
--  iram30_2b12 : 2147 port map(a0 => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i40, we_n => \-iwem\, ce_n => \-ice0d\, di => iwr40, a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m);
--  iram30_2b13 : 2147 port map(a0 => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i41, we_n => \-iwem\, ce_n => \-ice0d\, di => iwr41, a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m);
--  iram30_2c12 : sn74s04 port map(g1a => \-pcc0\, g1q_n => pc0m, g2a => \-pcc1\, g2q_n => pc1m, g3a => \-pcc2\, g3q_n => pc2m, g4q => pc3m, g4a => \-pcc3\, g5q_n => pc4m, g5a => \-pcc4\, g6q_n => pc5m);
--  iram30_2c11 : sn74s04 port map(g1a => \-pcc6\, g1q_n => pc6m, g2a => \-pcc7\, g2q_n => pc7m, g3a => \-pcc8\, g3q_n => pc8m, g4q => pc9m, g4a => \-pcc9\, g5q_n => pc10m, g5a => \-pcc10\, g6q_n => pc11m);
--  iram30_2b14 : 2147 port map(a0 => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i42, we_n => \-iwem\, ce_n => \-ice0d\, di => iwr42, a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m);

--  iram31_2b20 : 2147 port map(a0 => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i43, we_n => \-iwen\, ce_n => \-ice1d\, di => iwr43, a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n);
--  iram31_2a16 : 2147 port map(a0 => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i44, we_n => \-iwen\, ce_n => \-ice1d\, di => iwr44, a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n);
--  iram31_2a17 : 2147 port map(a0 => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i45, we_n => \-iwen\, ce_n => \-ice1d\, di => iwr45, a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n);
--  iram31_2a18 : 2147 port map(a0 => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i46, we_n => \-iwen\, ce_n => \-ice1d\, di => iwr46, a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n);
--  iram31_2a19 : 2147 port map(a0 => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i47, we_n => \-iwen\, ce_n => \-ice1d\, di => iwr47, a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n);
--  iram31_2a20 : 2147 port map(a0 => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i48, we_n => \-iwen\, ce_n => \-ice1d\, di => iwr48, a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n);
--  iram31_2c18 : 2147 port map(a0 => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i36, we_n => \-iwen\, ce_n => \-ice1d\, di => iwr36, a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n);
--  iram31_2c19 : 2147 port map(a0 => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i37, we_n => \-iwen\, ce_n => \-ice1d\, di => iwr37, a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n);
--  iram31_2c20 : 2147 port map(a0 => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i38, we_n => \-iwen\, ce_n => \-ice1d\, di => iwr38, a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n);
--  iram31_2b16 : 2147 port map(a0 => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i39, we_n => \-iwen\, ce_n => \-ice1d\, di => iwr39, a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n);
--  iram31_2b17 : 2147 port map(a0 => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i40, we_n => \-iwen\, ce_n => \-ice1d\, di => iwr40, a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n);
--  iram31_2b18 : 2147 port map(a0 => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i41, we_n => \-iwen\, ce_n => \-ice1d\, di => iwr41, a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n);
--  iram31_2c17 : sn74s04 port map(g1a => \-pcc0\, g1q_n => pc0n, g2a => \-pcc1\, g2q_n => pc1n, g3a => \-pcc2\, g3q_n => pc2n, g4q => pc3n, g4a => \-pcc3\, g5q_n => pc4n, g5a => \-pcc4\, g6q_n => pc5n);
--  iram31_2c16 : sn74s04 port map(g1a => \-pcc6\, g1q_n => pc6n, g2a => \-pcc7\, g2q_n => pc7n, g3a => \-pcc8\, g3q_n => pc8n, g4q => pc9n, g4a => \-pcc9\, g5q_n => pc10n, g5a => \-pcc10\, g6q_n => pc11n);
--  iram31_2b19 : 2147 port map(a0 => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i42, we_n => \-iwen\, ce_n => \-ice1d\, di => iwr42, a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n);

--  iram32_2b25 : 2147 port map(a0 => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i43, we_n => \-iweo\, ce_n => \-ice2d\, di => iwr43, a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o);
--  iram32_2a21 : 2147 port map(a0 => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i44, we_n => \-iweo\, ce_n => \-ice2d\, di => iwr44, a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o);
--  iram32_2a22 : 2147 port map(a0 => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i45, we_n => \-iweo\, ce_n => \-ice2d\, di => iwr45, a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o);
--  iram32_2a23 : 2147 port map(a0 => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i46, we_n => \-iweo\, ce_n => \-ice2d\, di => iwr46, a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o);
--  iram32_2a24 : 2147 port map(a0 => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i47, we_n => \-iweo\, ce_n => \-ice2d\, di => iwr47, a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o);
--  iram32_2a25 : 2147 port map(a0 => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i48, we_n => \-iweo\, ce_n => \-ice2d\, di => iwr48, a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o);
--  iram32_2c23 : 2147 port map(a0 => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i36, we_n => \-iweo\, ce_n => \-ice2d\, di => iwr36, a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o);
--  iram32_2c24 : 2147 port map(a0 => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i37, we_n => \-iweo\, ce_n => \-ice2d\, di => iwr37, a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o);
--  iram32_2c25 : 2147 port map(a0 => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i38, we_n => \-iweo\, ce_n => \-ice2d\, di => iwr38, a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o);
--  iram32_2b21 : 2147 port map(a0 => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i39, we_n => \-iweo\, ce_n => \-ice2d\, di => iwr39, a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o);
--  iram32_2b22 : 2147 port map(a0 => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i40, we_n => \-iweo\, ce_n => \-ice2d\, di => iwr40, a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o);
--  iram32_2b23 : 2147 port map(a0 => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i41, we_n => \-iweo\, ce_n => \-ice2d\, di => iwr41, a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o);
--  iram32_2c22 : sn74s04 port map(g1a => \-pcc0\, g1q_n => pc0o, g2a => \-pcc1\, g2q_n => pc1o, g3a => \-pcc2\, g3q_n => pc2o, g4q => pc3o, g4a => \-pcc3\, g5q_n => pc4o, g5a => \-pcc4\, g6q_n => pc5o);
--  iram32_2c21 : sn74s04 port map(g1a => \-pcc6\, g1q_n => pc6o, g2a => \-pcc7\, g2q_n => pc7o, g3a => \-pcc8\, g3q_n => pc8o, g4q => pc9o, g4a => \-pcc9\, g5q_n => pc10o, g5a => \-pcc10\, g6q_n => pc11o);
--  iram32_2b24 : 2147 port map(a0 => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i42, we_n => \-iweo\, ce_n => \-ice2d\, di => iwr42, a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o);

--  iram33_2b30 : 2147 port map(a0 => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i43, we_n => \-iwep\, ce_n => \-ice3d\, di => iwr43, a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p);
--  iram33_2a26 : 2147 port map(a0 => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i44, we_n => \-iwep\, ce_n => \-ice3d\, di => iwr44, a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p);
--  iram33_2a27 : 2147 port map(a0 => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i45, we_n => \-iwep\, ce_n => \-ice3d\, di => iwr45, a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p);
--  iram33_2a28 : 2147 port map(a0 => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i46, we_n => \-iwep\, ce_n => \-ice3d\, di => iwr46, a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p);
--  iram33_2a29 : 2147 port map(a0 => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i47, we_n => \-iwep\, ce_n => \-ice3d\, di => iwr47, a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p);
--  iram33_2a30 : 2147 port map(a0 => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i48, we_n => \-iwep\, ce_n => \-ice3d\, di => iwr48, a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p);
--  iram33_2c28 : 2147 port map(a0 => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i36, we_n => \-iwep\, ce_n => \-ice3d\, di => iwr36, a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p);
--  iram33_2c29 : 2147 port map(a0 => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i37, we_n => \-iwep\, ce_n => \-ice3d\, di => iwr37, a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p);
--  iram33_2c30 : 2147 port map(a0 => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i38, we_n => \-iwep\, ce_n => \-ice3d\, di => iwr38, a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p);
--  iram33_2b26 : 2147 port map(a0 => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i39, we_n => \-iwep\, ce_n => \-ice3d\, di => iwr39, a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p);
--  iram33_2b27 : 2147 port map(a0 => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i40, we_n => \-iwep\, ce_n => \-ice3d\, di => iwr40, a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p);
--  iram33_2b28 : 2147 port map(a0 => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i41, we_n => \-iwep\, ce_n => \-ice3d\, di => iwr41, a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p);
--  iram33_2c27 : sn74s04 port map(g1a => \-pcc0\, g1q_n => pc0p, g2a => \-pcc1\, g2q_n => pc1p, g3a => \-pcc2\, g3q_n => pc2p, g4q => pc3p, g4a => \-pcc3\, g5q_n => pc4p, g5a => \-pcc4\, g6q_n => pc5p);
--  iram33_2c26 : sn74s04 port map(g1a => \-pcc6\, g1q_n => pc6p, g2a => \-pcc7\, g2q_n => pc7p, g3a => \-pcc8\, g3q_n => pc8p, g4q => pc9p, g4a => \-pcc9\, g5q_n => pc10p, g5a => \-pcc10\, g6q_n => pc11p);
--  iram33_2b29 : 2147 port map(a0 => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i42, we_n => \-iwep\, ce_n => \-ice3d\, di => iwr42, a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p);

--  iwr_1f12 : sn74s374 port map(oenb_n => gnd, o0 => iwr47, i0 => aa15, i1 => aa14, o1 => iwr46, o2 => iwr45, i2 => aa13, i3 => aa12, o3 => iwr44, clk => clk2c, o4 => iwr43, i4 => aa11, i5 => aa10, o5 => iwr42, o6 => iwr41, i6 => aa9, i7 => aa8);
--  iwr_1f14 : sn74s374 port map(oenb_n => gnd, o0 => iwr39, i0 => aa7, i1 => aa6, o1 => iwr38, o2 => iwr37, i2 => aa5, i3 => aa4, o3 => iwr36, clk => clk2c, o4 => iwr35, i4 => aa3, i5 => aa2, o5 => iwr34, o6 => iwr33, i6 => aa1, i7 => aa0);
--  iwr_4c04 : sn74s374 port map(oenb_n => gnd, o0 => iwr31, i0 => m31, i1 => m30, o1 => iwr30, o2 => iwr29, i2 => m29, i3 => m28, o3 => iwr28, clk => clk4c, o4 => iwr27, i4 => m27, i5 => m26, o5 => iwr26, o6 => iwr25, i6 => m25, i7 => m24);
--  iwr_4c05 : sn74s374 port map(oenb_n => gnd, o0 => iwr23, i0 => m23, i1 => m22, o1 => iwr22, o2 => iwr21, i2 => m21, i3 => m20, o3 => iwr20, clk => clk4c, o4 => iwr19, i4 => m19, i5 => m18, o5 => iwr18, o6 => iwr17, i6 => m17, i7 => m16);
--  iwr_4b01 : sn74s374 port map(oenb_n => gnd, o0 => iwr15, i0 => m15, i1 => m14, o1 => iwr14, o2 => iwr13, i2 => m13, i3 => m12, o3 => iwr12, clk => clk4c, o4 => iwr11, i4 => m11, i5 => m10, o5 => iwr10, o6 => iwr9, i6 => m9, i7 => m8);
--  iwr_4b06 : sn74s374 port map(oenb_n => gnd, o0 => iwr7, i0 => m7, i1 => m6, o1 => iwr6, o2 => iwr5, i2 => m5, i3 => m4, o3 => iwr4, clk => clk4c, o4 => iwr3, i4 => m3, i5 => m2, o5 => iwr2, o6 => iwr1, i6 => m1, i7 => m0);

--  pctl_1e16 : sn74s20 port map(g1a => \-ape\, g1b => \-pdlpe\, g1c => \-spe\, g1d => \-mpe\, g1y_n => tilt1, g2y_n => tilt0, g2a => hi2, g2b => \-mempe\, g2c => \-v1pe\);
--  pctl_1f10 : sn74s04 port map(g3a => \-promenable\, g3q_n => promenable, g5q_n => dpe, g5a => \-dpe\, g6q_n => ipe);
--  pctl_1f16 : til309 port map(l2 => nc, l4 => nc, l8 => nc, l1 => nc, latch => gnd, i4 => pc2, i8 => gnd, i2 => pc1, blank_n => hi2, dp => tilt1, test_n => hi2, ldp => nc);
--  pctl_1f17 : til309 port map(l2 => nc, l4 => nc, l8 => nc, l1 => nc, latch => gnd, i4 => pc5, i8 => gnd, i2 => pc4, blank_n => hi2, dp => tilt0, test_n => hi2, ldp => nc);
--  pctl_1f18 : til309 port map(l2 => nc, l4 => nc, l8 => nc, l1 => nc, latch => gnd, i4 => pc8, i8 => gnd, i2 => pc7, blank_n => hi2, dp => dpe, test_n => hi2, ldp => nc);
--  pctl_1f19 : til309 port map(l2 => nc, l4 => nc, l8 => nc, l1 => nc, latch => gnd, i4 => pc11, i8 => gnd, i2 => pc10, blank_n => hi2, dp => ipe, test_n => hi2, ldp => nc);
--  pctl_1f20 : til309 port map(l2 => nc, l4 => nc, l8 => nc, l1 => nc, latch => gnd, i4 => gnd, i8 => gnd, i2 => pc13, blank_n => hi2, dp => promenable, test_n => hi2, ldp => nc);
--  pctl_1a16 : sn74ls244 port map(en1_n => \-promenable\, d0 => gnd, q7 => nc, d1 => nc, q6 => nc, d2 => nc, q5 => nc, d3 => nc, q4 => nc, d4 => nc, q3 => nc, d5 => nc, q2 => nc, d6 => nc, q1 => nc, d7 => nc, q0 => i46);
--  pctl_1c18 : sn74s32 port map(g1a => \-promenable\, g1b => pc9, g1y => \-promce0\, g2a => \-prompc9\, g2b => \-promenable\, g2y => \-promce1\);
--  pctl_1c19 : sn74s20 port map(g1a => bottom.1k, g1b => \-idebug\, g1c => \-promdisabled\, g1d => \-iwriteda\, g1y_n => \-promenable\);
--  pctl_1d18 : sn74s260 port map(i1 => gnd, i2 => pc13, i3 => pc12, o1 => bottom.1k, i4 => pc11);
--  pctl_1d19 : sn74s04 port map(g1a => pc5, g1q_n => \-prompc5\, g2a => pc6, g2q_n => \-prompc6\, g3a => pc7, g3q_n => \-prompc7\, g4q => \-prompc8\, g4a => pc8, g5q_n => \-prompc9\, g5a => pc9, g6q_n => nc);
--  pctl_1c17 : sn74s04 port map(g1a => pc0, g1q_n => \-prompc0\, g2a => pc1, g2q_n => \-prompc1\, g3a => pc2, g3q_n => \-prompc2\, g4q => \-prompc3\, g4a => pc3, g5q_n => \-prompc4\, g5a => pc4, g6q_n => nc);

--  prom0_1b19 : sn74s472 port map(a0 => \-prompc0\, a1 => \-prompc1\, a2 => \-prompc2\, a3 => \-prompc3\, a4 => \-prompc4\, d0 => i40, d1 => i41, d2 => i42, d3 => i43, d4 => i44, d5 => i45, d6 => i47, d7 => i48, ce_n => \-promce0\, a5 => \-prompc5\, a6 => \-prompc6\, a7 => \-prompc7\);
--  prom0_1b17 : sn74s472 port map(a0 => \-prompc0\, a1 => \-prompc1\, a2 => \-prompc2\, a3 => \-prompc3\, a4 => \-prompc4\, d0 => i32, d1 => i33, d2 => i34, d3 => i35, d4 => i36, d5 => i37, d6 => i38, d7 => i39, ce_n => \-promce0\, a5 => \-prompc5\, a6 => \-prompc6\, a7 => \-prompc7\);
--  prom0_1c20 : sn74s472 port map(a0 => \-prompc0\, a1 => \-prompc1\, a2 => \-prompc2\, a3 => \-prompc3\, a4 => \-prompc4\, d0 => i24, d1 => i25, d2 => i26, d3 => i27, d4 => i28, d5 => i29, d6 => i30, d7 => i31, ce_n => \-promce0\, a5 => \-prompc5\, a6 => \-prompc6\, a7 => \-prompc7\);
--  prom0_1d16 : sn74s472 port map(a0 => \-prompc0\, a1 => \-prompc1\, a2 => \-prompc2\, a3 => \-prompc3\, a4 => \-prompc4\, d0 => i16, d1 => i17, d2 => i18, d3 => i19, d4 => i20, d5 => i21, d6 => i22, d7 => i23, ce_n => \-promce0\, a5 => \-prompc5\, a6 => \-prompc6\, a7 => \-prompc7\);
--  prom0_1e19 : sn74s472 port map(a0 => \-prompc0\, a1 => \-prompc1\, a2 => \-prompc2\, a3 => \-prompc3\, a4 => \-prompc4\, d0 => i8, d1 => i9, d2 => i10, d3 => i11, d4 => i12, d5 => i13, d6 => i14, d7 => i15, ce_n => \-promce0\, a5 => \-prompc5\, a6 => \-prompc6\, a7 => \-prompc7\);
--  prom0_1e17 : sn74s472 port map(a0 => \-prompc0\, a1 => \-prompc1\, a2 => \-prompc2\, a3 => \-prompc3\, a4 => \-prompc4\, d0 => i0, d1 => i1, d2 => i2, d3 => i3, d4 => i4, d5 => i5, d6 => i6, d7 => i7, ce_n => \-promce0\, a5 => \-prompc5\, a6 => \-prompc6\, a7 => \-prompc7\);

--  prom1_1b20 : sn74s472 port map(a0 => \-prompc0\, a1 => \-prompc1\, a2 => \-prompc2\, a3 => \-prompc3\, a4 => \-prompc4\, d0 => i40, d1 => i41, d2 => i42, d3 => i43, d4 => i44, d5 => i45, d6 => i47, d7 => i48, ce_n => \-promce1\, a5 => \-prompc5\, a6 => \-prompc6\, a7 => \-prompc7\);
--  prom1_1b18 : sn74s472 port map(a0 => \-prompc0\, a1 => \-prompc1\, a2 => \-prompc2\, a3 => \-prompc3\, a4 => \-prompc4\, d0 => i32, d1 => i33, d2 => i34, d3 => i35, d4 => i36, d5 => i37, d6 => i38, d7 => i39, ce_n => \-promce1\, a5 => \-prompc5\, a6 => \-prompc6\, a7 => \-prompc7\);
--  prom1_1b16 : sn74s472 port map(a0 => \-prompc0\, a1 => \-prompc1\, a2 => \-prompc2\, a3 => \-prompc3\, a4 => \-prompc4\, d0 => i24, d1 => i25, d2 => i26, d3 => i27, d4 => i28, d5 => i29, d6 => i30, d7 => i31, ce_n => \-promce1\, a5 => \-prompc5\, a6 => \-prompc6\, a7 => \-prompc7\);
--  prom1_1d17 : sn74s472 port map(a0 => \-prompc0\, a1 => \-prompc1\, a2 => \-prompc2\, a3 => \-prompc3\, a4 => \-prompc4\, d0 => i16, d1 => i17, d2 => i18, d3 => i19, d4 => i20, d5 => i21, d6 => i22, d7 => i23, ce_n => \-promce1\, a5 => \-prompc5\, a6 => \-prompc6\, a7 => \-prompc7\);
--  prom1_1e20 : sn74s472 port map(a0 => \-prompc0\, a1 => \-prompc1\, a2 => \-prompc2\, a3 => \-prompc3\, a4 => \-prompc4\, d0 => i8, d1 => i9, d2 => i10, d3 => i11, d4 => i12, d5 => i13, d6 => i14, d7 => i15, ce_n => \-promce1\, a5 => \-prompc5\, a6 => \-prompc6\, a7 => \-prompc7\);
--  prom1_1e18 : sn74s472 port map(a0 => \-prompc0\, a1 => \-prompc1\, a2 => \-prompc2\, a3 => \-prompc3\, a4 => \-prompc4\, d0 => i0, d1 => i1, d2 => i2, d3 => i3, d4 => i4, d5 => i5, d6 => i6, d7 => i7, ce_n => \-promce1\, a5 => \-prompc5\, a6 => \-prompc6\, a7 => \-prompc7\);

--  debug_1f15 : sn74s374 port map(oenb_n => \-idebug\, o0 => i47, i0 => spy15, i1 => spy14, o1 => i46, o2 => i45, i2 => spy13, i3 => spy12, o3 => i44, clk => \-lddbirh\, o4 => i43, i4 => spy11, i5 => spy10, o5 => i42, o6 => i41, i6 => spy9, i7 => spy8);
--  debug_1e11 : sn74s374 port map(oenb_n => \-idebug\, o0 => i39, i0 => spy7, i1 => spy6, o1 => i38, o2 => i37, i2 => spy5, i3 => spy4, o3 => i36, clk => \-lddbirh\, o4 => i35, i4 => spy3, i5 => spy2, o5 => i34, o6 => i33, i6 => spy1, i7 => spy0);
--  debug_1e14 : sn74s374 port map(oenb_n => \-idebug\, o0 => i15, i0 => spy15, i1 => spy14, o1 => i14, o2 => i13, i2 => spy13, i3 => spy12, o3 => i12, clk => \-lddbirl\, o4 => i11, i4 => spy11, i5 => spy10, o5 => i10, o6 => i9, i6 => spy9, i7 => spy8);
--  debug_1e15 : sn74s374 port map(oenb_n => \-idebug\, o0 => i7, i0 => spy7, i1 => spy6, o1 => i6, o2 => i5, i2 => spy5, i3 => spy4, o3 => i4, clk => \-lddbirl\, o4 => i3, i4 => spy3, i5 => spy2, o5 => i2, o6 => i1, i6 => spy1, i7 => spy0);
--  debug_1e13 : sn74s374 port map(oenb_n => \-idebug\, o0 => i23, i0 => spy7, i1 => spy6, o1 => i22, o2 => i21, i2 => spy5, i3 => spy4, o3 => i20, clk => \-lddbirm\, o4 => i19, i4 => spy3, i5 => spy2, o5 => i18, o6 => i17, i6 => spy1, i7 => spy0);
--  debug_1e12 : sn74s374 port map(oenb_n => \-idebug\, o0 => i31, i0 => spy15, i1 => spy14, o1 => i30, o2 => i29, i2 => spy13, i3 => spy12, o3 => i28, clk => \-lddbirm\, o4 => i27, i4 => spy11, i5 => spy10, o5 => i26, o6 => i25, i6 => spy9, i7 => spy8);

  --- Microinstrction Modification and Main Instruction Register

--  ior_3d15 : sn74s32 port map(g1a => i24, g1b => ob24, g1y => iob24, g2a => i25, g2b => ob25, g2y => iob25, g3y => iob26, g3a => i26, g3b => ob0, g4y => iob27, g4a => i27);
--  ior_3d14 : sn74s32 port map(g1a => i28, g1b => ob2, g1y => iob28, g2a => i29, g2b => ob3, g2y => iob29, g3y => iob30, g3a => i30, g3b => ob4, g4y => iob31, g4a => i31);
--  ior_3d13 : sn74s32 port map(g1a => i32, g1b => ob6, g1y => iob32, g2a => i33, g2b => ob7, g2y => iob33, g3y => iob34, g3a => i34, g3b => ob8, g4y => iob35, g4a => i35);
--  ior_3d10 : sn74s32 port map(g1a => i36, g1b => ob10, g1y => iob36, g2a => i37, g2b => ob11, g2y => iob37, g3y => iob38, g3a => i38, g3b => ob12, g4y => iob39, g4a => i39);
--  ior_3d09 : sn74s32 port map(g1a => i40, g1b => ob14, g1y => iob40, g2a => i41, g2b => ob15, g2y => iob41, g3y => iob42, g3a => i42, g3b => ob16, g4y => iob43, g4a => i43);
--  ior_3d08 : sn74s32 port map(g1a => i44, g1b => ob18, g1y => iob44, g2a => i45, g2b => ob19, g2y => iob45, g3y => iob46, g3a => i46, g3b => ob20, g4y => iob47, g4a => i47);
--  ior_3c16 : sn74s32 port map(g1a => i20, g1b => ob20, g1y => iob20, g2a => i21, g2b => ob21, g2y => iob21, g3y => iob22, g3a => i22, g3b => ob22, g4y => iob23, g4a => i23);
--  ior_3c18 : sn74s32 port map(g1a => i16, g1b => ob16, g1y => iob16, g2a => i17, g2b => ob17, g2y => iob17, g3y => iob18, g3a => i18, g3b => ob18, g4y => iob19, g4a => i19);
--  ior_3c06 : sn74s32 port map(g1a => i12, g1b => ob12, g1y => iob12, g2a => i13, g2b => ob13, g2y => iob13, g3y => iob14, g3a => i14, g3b => ob14, g4y => iob15, g4a => i15);
--  ior_3c07 : sn74s32 port map(g1a => i8, g1b => ob8, g1y => iob8, g2a => i9, g2b => ob9, g2y => iob9, g3y => iob10, g3a => i10, g3b => ob10, g4y => iob11, g4a => i11);
--  ior_3c08 : sn74s32 port map(g1a => i4, g1b => ob4, g1y => iob4, g2a => i5, g2b => ob5, g2y => iob5, g3y => iob6, g3a => i6, g3b => ob6, g4y => iob7, g4a => i7);
--  ior_3c09 : sn74s32 port map(g1a => i0, g1b => ob0, g1y => iob0, g2a => i1, g2b => ob1, g2y => iob1, g3y => iob2, g3a => i2, g3b => ob2, g4y => iob3, g4a => i3);

--  ireg_3d06 : 25s09 port map(sel => \-destimod1\, aq => nc, a0 => nc, a1 => nc, b1 => i48, b0 => gnd, bq => ir48, clk => clk3a, cq => ir47, c0 => iob47, c1 => i47, d1 => i46, d0 => iob46);
--  ireg_3d07 : 25s09 port map(sel => \-destimod1\, aq => ir45, a0 => iob45, a1 => i45, b1 => i44, b0 => iob44, bq => ir44, clk => clk3a, cq => ir43, c0 => iob43, c1 => i43, d1 => i42, d0 => iob42);
--  ireg_3d16 : 25s09 port map(sel => \-destimod1\, aq => ir41, a0 => iob41, a1 => i41, b1 => i40, b0 => iob40, bq => ir40, clk => clk3b, cq => ir39, c0 => iob39, c1 => i39, d1 => i38, d0 => iob38);
--  ireg_3d17 : 25s09 port map(sel => \-destimod1\, aq => ir37, a0 => iob37, a1 => i37, b1 => i36, b0 => iob36, bq => ir36, clk => clk3b, cq => ir35, c0 => iob35, c1 => i35, d1 => i34, d0 => iob34);
--  ireg_3d18 : 25s09 port map(sel => \-destimod1\, aq => ir33, a0 => iob33, a1 => i33, b1 => i32, b0 => iob32, bq => ir32, clk => clk3b, cq => ir31, c0 => iob31, c1 => i31, d1 => i30, d0 => iob30);
--  ireg_3d19 : 25s09 port map(sel => \-destimod1\, aq => ir29, a0 => iob29, a1 => i29, b1 => i28, b0 => iob28, bq => ir28, clk => clk3b, cq => ir27, c0 => iob27, c1 => i27, d1 => i26, d0 => iob26);
--  ireg_3d20 : 25s09 port map(sel => \-destimod0\, aq => nc, a0 => nc, a1 => nc, b1 => nc, b0 => nc, bq => nc, clk => clk3b, cq => ir25, c0 => iob25, c1 => i25, d1 => i24, d0 => iob24);
--  ireg_3c17 : 25s09 port map(sel => \-destimod0\, aq => ir23, a0 => iob23, a1 => i23, b1 => i22, b0 => iob22, bq => ir22, clk => clk3b, cq => ir21, c0 => iob21, c1 => i21, d1 => i20, d0 => iob20);
--  ireg_3c19 : 25s09 port map(sel => \-destimod0\, aq => ir19, a0 => iob19, a1 => i19, b1 => i18, b0 => iob18, bq => ir18, clk => clk3b, cq => ir17, c0 => iob17, c1 => i17, d1 => i16, d0 => iob16);
--  ireg_3c01 : 25s09 port map(sel => \-destimod0\, aq => ir15, a0 => iob15, a1 => i15, b1 => i14, b0 => iob14, bq => ir14, clk => clk3a, cq => ir13, c0 => iob13, c1 => i13, d1 => i12, d0 => iob12);
--  ireg_3c02 : 25s09 port map(sel => \-destimod0\, aq => ir11, a0 => iob11, a1 => i11, b1 => i10, b0 => iob10, bq => ir10, clk => clk3a, cq => ir9, c0 => iob9, c1 => i9, d1 => i8, d0 => iob8);
--  ireg_3c03 : 25s09 port map(sel => \-destimod0\, aq => ir7, a0 => iob7, a1 => i7, b1 => i6, b0 => iob6, bq => ir6, clk => clk3a, cq => ir5, c0 => iob5, c1 => i5, d1 => i4, d0 => iob4);
--  ireg_3c04 : 25s09 port map(sel => \-destimod0\, aq => ir3, a0 => iob3, a1 => i3, b1 => i2, b0 => iob2, bq => ir2, clk => clk3a, cq => ir1, c0 => iob1, c1 => i1, d1 => i0, d0 => iob0);

  --- IR Decoding

--  source_3e05 : sn74s08 port map(g2b => destimod0_l, g2a => iwrited_l);
--  source_4d10 : sn74s10 port map(g2a => internal21, g2b => \-destimod1\, g2c => \-idebug\, g2y_n => imod);
--  source_3d04 : sn74s139 port map(g1 => \-specalu\, a1 => ir3, b1 => ir4, g1y0 => \-mul\, g1y1 => \-div\, g1y2 => nc, g1y3 => nc);
--  source_3d03 : sn74s04 port map(g1a => ir22, g1q_n => \-ir22\, g2a => ir25, g2q_n => \-ir25\, g3a => nc, g3q_n => nc, g4q => irdisp, g4a => \-irdisp\, g5q_n => irjump, g5a => \-irjump\, g6q_n => iralu);
--  source_3d05 : sn74s139 port map(g1 => nop, a1 => ir43, b1 => ir44, g1y0 => \-iralu\, g1y1 => \-irjump\, g1y2 => \-irdisp\, g1y3 => \-irbyte\, g2y3 => \-funct3\, g2y2 => \-funct2\, g2y1 => \-funct1\, g2y0 => \-funct0\, b2 => ir11, a2 => ir10);
--  source_3d21 : sn74s08 port map(g4q => destm, g4a => \-ir25\);
--  source_3e09 : sn74s32 port map(g2a => \-destmem\, g2b => \-ir22\, g2y => \-destmdr\, g3y => \-destvma\, g3a => ir22, g3b => \-destmem\);
--  source_3d02 : sn74s00 port map(g2b => \-iralu\, g2a => \-irbyte\, g2q_n => dest, g3q_n => \-destmem\, g3b => ir23, g3a => destm, g4q_n => \-specalu\, g4a => ir8);
--  source_3d12 : sn74s138 port map(a => ir19, b => ir20, c => ir21, g2a => \-ir22\, g2b => ir23, g1 => destm, y7 => \-destimod1\, y6 => \-destimod0\, y5 => \-destspc\, y4 => \-destpdlp\, y3 => \-destpdlx\, y2 => \-destpdl\(x), y1 => \-destpdl\(p));
--  source_3d11 : sn74s138 port map(a => ir19, b => ir20, c => ir21, g2a => ir22, g2b => ir23, g1 => destm, y7 => nc, y6 => nc, y5 => nc, y4 => nc, y3 => nc, y2 => \-destintctl\, y1 => \-destlc\);
--  source_3d23 : sn74s138 port map(a => ir26, b => ir27, c => ir28, g2a => \-ir31\, g2b => gnd, g1 => ir29, y7 => nc, y6 => nc, y5 => nc, y4 => \-srcspcpop\, y3 => \-srclc\, y2 => \-srcmd\, y1 => \-srcmap\);
--  source_3d22 : sn74s138 port map(a => ir26, b => ir27, c => ir28, g2a => \-ir31\, g2b => ir29, g1 => hi5, y7 => \-srcq\, y6 => \-srcopc\, y5 => \-srcpdltop\, y4 => \-srcpdlpop\, y3 => \-srcpdlidx\, y2 => \-srcpdlptr\, y1 => \-srcspc\);

  --- A Memory

--  actl_4b11 : sn74s11 port map(g2a => apass1, g2b => apass2, g2c => tse4a, g2y_n => apassenb);
--  actl_4b14 : sn74s10 port map(g3y_n => \-apassenb\, g3a => tse4a, g3b => apass2, g3c => apass1);
--  actl_3b30 : sn74s37 port map(g1a => wp3a, g1b => destd, g1y => \-awpa\, g2a => wp3a, g2b => destd, g2y => \-awpb\, g3y => \-awpc\, g3a => destd, g3b => wp3a);
--  actl_3b16 : sn74s00 port map(g1b => apass1, g1a => apass2, g1q_n => \-apass\, g2b => \-apass\, g2a => tse3a, g2q_n => \-amemenb\);
--  actl_3a06 : sn74s258 port map(sel => clk3e, d0 => wadr0, d1 => ir32, dy => \-aadr0b\, c0 => wadr1, c1 => ir33, cy => \-aadr1b\, by => \-aadr2b\, b1 => ir34, b0 => wadr2, ay => \-aadr3b\, a1 => ir35, a0 => wadr3);
--  actl_3b28 : 25s09 port map(sel => destm, aq => wadr7, a0 => ir21, a1 => gnd, b1 => gnd, b0 => ir20, bq => wadr6, clk => clk3d, cq => wadr5, c0 => ir19, c1 => gnd, d1 => ir18, d0 => ir18);
--  actl_3b29 : 25s09 port map(sel => destm, aq => nc, a0 => nc, a1 => nc, b1 => nc, b0 => nc, bq => nc, clk => clk3d, cq => wadr9, c0 => ir23, c1 => gnd, d1 => gnd, d0 => ir22);
--  actl_3a12 : sn74s258 port map(sel => clk3d, d0 => wadr4, d1 => ir36, dy => \-aadr4b\, c0 => wadr5, c1 => ir37, cy => \-aadr5b\, by => \-aadr6b\, b1 => ir38, b0 => wadr6, ay => \-aadr7b\, a1 => ir39, a0 => wadr7);
--  actl_3b15 : sn74s258 port map(sel => clk3d, d0 => wadr8, d1 => ir40, dy => \-aadr8a\, c0 => wadr9, c1 => ir41, cy => \-aadr9a\, by => \-aadr8b\, b1 => ir40, b0 => wadr8, ay => \-aadr9b\, a1 => ir41, a0 => wadr9);
--  actl_3a16 : sn74s258 port map(sel => clk3d, d0 => wadr0, d1 => ir32, dy => \-aadr0a\, c0 => wadr1, c1 => ir33, cy => \-aadr1a\, by => \-aadr2a\, b1 => ir34, b0 => wadr2, ay => \-aadr3a\, a1 => ir35, a0 => wadr3);
--  actl_3a21 : sn74s258 port map(sel => clk3d, d0 => wadr4, d1 => ir36, dy => \-aadr4a\, c0 => wadr5, c1 => ir37, cy => \-aadr5a\, by => \-aadr6a\, b1 => ir38, b0 => wadr6, ay => \-aadr7a\, a1 => ir39, a0 => wadr7);
--  actl_3b27 : 93s46 port map(a0 => ir38, b0 => wadr6, a1 => ir39, b1 => wadr7, a2 => ir40, b2 => wadr8, enb => hi3, eq => apass2, a3 => ir41, b3 => wadr9, a4 => hi3, b4 => destd, a5 => gnd);
--  actl_3b21 : 93s46 port map(a0 => ir32, b0 => wadr0, a1 => ir33, b1 => wadr1, a2 => ir34, b2 => wadr2, enb => hi3, eq => apass1, a3 => ir35, b3 => wadr3, a4 => ir36, b4 => wadr4, a5 => ir37);
--  actl_3b26 : sn74s174 port map(clr_n => \-reset\, q1 => wadr0, d1 => ir14, d2 => ir15, q2 => wadr1, d3 => ir16, q3 => wadr2, clk => clk3d, q4 => wadr3, d4 => ir17, q5 => destmd, d5 => destm, d6 => dest);

--  amem0_3a10 : 93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, d0 => amem16, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\);
--  amem0_3a15 : 93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, d0 => amem17, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\);
--  amem0_3a09 : 93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, d0 => amem18, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\);
--  amem0_3a14 : 93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, d0 => amem19, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\);
--  amem0_3a08 : 93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, d0 => amem20, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\);
--  amem0_3a13 : 93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, d0 => amem21, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\);
--  amem0_3a07 : 93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, d0 => amem22, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\);
--  amem0_3a11 : 93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, d0 => amem23, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\);
--  amem0_3b10 : 93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, d0 => amem24, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\);
--  amem0_3b14 : 93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, d0 => amem25, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\);
--  amem0_3b09 : 93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, d0 => amem26, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\);
--  amem0_3b13 : 93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, d0 => amem27, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\);
--  amem0_3b08 : 93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, d0 => amem28, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\);
--  amem0_3b12 : 93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, d0 => amem29, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\);
--  amem0_3b07 : 93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, d0 => amem30, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\);
--  amem0_3b11 : 93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, d0 => amem31, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\);
--  amem0_3b06 : 93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, d0 => amemparity, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\);

--  amem1_3a20 : 93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, d0 => amem0, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\);
--  amem1_3a25 : 93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, d0 => amem1, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\);
--  amem1_3a19 : 93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, d0 => amem2, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\);
--  amem1_3a24 : 93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, d0 => amem3, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\);
--  amem1_3a18 : 93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, d0 => amem4, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\);
--  amem1_3a23 : 93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, d0 => amem5, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\);
--  amem1_3a17 : 93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, d0 => amem6, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\);
--  amem1_3a22 : 93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, d0 => amem7, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\);
--  amem1_3b20 : 93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, d0 => amem8, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\);
--  amem1_3b25 : 93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, d0 => amem9, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\);
--  amem1_3b19 : 93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, d0 => amem10, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\);
--  amem1_3b24 : 93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, d0 => amem11, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpb\);
--  amem1_3b18 : 93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, d0 => amem12, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpb\);
--  amem1_3b23 : 93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, d0 => amem13, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpb\);
--  amem1_3b17 : 93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, d0 => amem14, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpb\);
--  amem1_3b22 : 93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, d0 => amem15, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpb\);

--  alatch_3b01 : sn74s241 port map(aenb_n => hi5, q7 => a31b, q6 => aparity, q5 => nc, q4 => nc, q3 => nc, q2 => nc, q1 => nc, q0 => nc);
--  alatch_3b03 : sn74s241 port map(aenb_n => \-apassenb\, q7 => a24, q6 => a25, q5 => a26, q4 => a27, q3 => a28, q2 => a29, q1 => a30, q0 => a31a);
--  alatch_3b05 : sn74s241 port map(aenb_n => \-apassenb\, q7 => a16, q6 => a17, q5 => a18, q4 => a19, q3 => a20, q2 => a21, q1 => a22, q0 => a23);
--  alatch_3a02 : sn74s241 port map(aenb_n => \-apassenb\, q7 => a8, q6 => a9, q5 => a10, q4 => a11, q3 => a12, q2 => a13, q1 => a14, q0 => a15);
--  alatch_3a04 : sn74s241 port map(aenb_n => \-apassenb\, q7 => a0, q6 => a1, q5 => a2, q4 => a3, q3 => a4, q2 => a5, q1 => a6, q0 => a7);
--  alatch_3a05 : sn74s373 port map(oenb_n => \-amemenb\, o0 => a7, i0 => amem7, i1 => amem6, o1 => a6, o2 => a5, i2 => amem5, i3 => amem4, o3 => a4, hold_n => clk3e, o4 => a3, i4 => amem3, i5 => amem2, o5 => a2, o6 => a1, i6 => amem1, i7 => amem0);
--  alatch_3a03 : sn74s373 port map(oenb_n => \-amemenb\, o0 => a15, i0 => amem15, i1 => amem14, o1 => a14, o2 => a13, i2 => amem13, i3 => amem12, o3 => a12, hold_n => clk3e, o4 => a11, i4 => amem11, i5 => amem10, o5 => a10, o6 => a9, i6 => amem9, i7 => amem8);
--  alatch_3a01 : sn74s373 port map(oenb_n => \-amemenb\, o0 => a23, i0 => amem23, i1 => amem22, o1 => a22, o2 => a21, i2 => amem21, i3 => amem20, o3 => a20, hold_n => clk3e, o4 => a19, i4 => amem19, i5 => amem18, o5 => a18, o6 => a17, i6 => amem17, i7 => amem16);
--  alatch_3b04 : sn74s373 port map(oenb_n => \-amemenb\, o0 => a31a, i0 => amem31, i1 => amem30, o1 => a30, o2 => a29, i2 => amem29, i3 => amem28, o3 => a28, hold_n => clk3e, o4 => a27, i4 => amem27, i5 => amem26, o5 => a26, o6 => a25, i6 => amem25, i7 => amem24);
--  alatch_3b02 : sn74s373 port map(oenb_n => \-amemenb\, o0 => nc, i0 => nc, i1 => nc, o1 => nc, o2 => nc, i2 => nc, i3 => nc, o3 => nc, hold_n => clk3e, o4 => nc, i4 => nc, i5 => nc, o5 => nc, o6 => aparity, i6 => amemparity, i7 => amem31);

--  apar_4a17 : sn74s00 port map(g1b => mpareven, g1a => srcm, g1q_n => mmemparok, g2b => mpareven, g2a => pdlenb, g2q_n => pdlparok);
--  apar_3a28 : 93s48 port map(i6 => a26, i5 => a27, i4 => a28, i3 => a29, i2 => a30, i1 => a31b, i0 => aparity, po => aparok, pe => nc, i11 => aparl, i10 => aparm, i9 => gnd, i8 => a24);
--  apar_3a29 : 93s48 port map(i6 => a17, i5 => a18, i4 => a19, i3 => a20, i2 => a21, i1 => a22, i0 => a23, po => aparm, pe => nc, i11 => a12, i10 => a13, i9 => a14, i8 => a15);
--  apar_3a30 : 93s48 port map(i6 => a5, i5 => a6, i4 => a7, i3 => a8, i2 => a9, i1 => a10, i0 => a11, po => aparl, pe => nc, i11 => a0, i10 => a1, i9 => a2, i8 => a3);
--  apar_4a14 : 93s48 port map(i6 => m5, i5 => m6, i4 => m7, i3 => m8, i2 => m9, i1 => m10, i0 => m11, po => mparl, pe => nc, i11 => m0, i10 => m1, i9 => m2, i8 => m3);
--  apar_4a12 : 93s48 port map(i6 => m17, i5 => m18, i4 => m19, i3 => m20, i2 => m21, i1 => m22, i0 => m23, po => mparm, pe => nc, i11 => m12, i10 => m13, i9 => m14, i8 => m15);
--  apar_4b15 : 93s48 port map(i6 => m26, i5 => m27, i4 => m28, i3 => m29, i2 => m30, i1 => m31, i0 => mparity, po => mparodd, pe => mpareven, i11 => mparl, i10 => mparm, i9 => gnd, i8 => m24);

  --- M Memory

--  mctl_4b22 : sn74s37 port map(g1a => destmd, g1b => wp4b, g1y => \-mwpa\, g2a => destmd, g2b => wp4b, g2y => \-mwpb\);
--  mctl_4b11 : sn74s11 port map(g1a => mpass, g1b => tse4a, g3y_n => srcm, g3a => hi2, g3b => \-ir31\, g3c => \-mpass\, g1y_n => mpassl);
--  mctl_4b14 : sn74s10 port map(g1a => mpass, g1b => tse4a, g2a => tse4a, g2b => \-ir31\, g2c => \-mpass\, g2y_n => \-mpassm\, g1y_n => \-mpassl\);
--  mctl_4b12 : sn74s04 port map(g1a => mpass, g1q_n => \-mpass\);
--  mctl_4a19 : res20 port map(r2 => nc, r3 => mmem15, r4 => mmem14, r5 => mmem13, r6 => mmem12, r7 => mmem11, r8 => mmem10, r9 => mmem9, r11 => mmem8, r12 => mmem7, r13 => mmem6, r14 => mmem5, r15 => mmem4, r16 => mmem3, r17 => mmem2, r18 => mmem1);
--  mctl_4b20 : res20 port map(r2 => mmemparity, r3 => mmem31, r4 => mmem30, r5 => mmem29, r6 => mmem28, r7 => mmem27, r8 => mmem26, r9 => mmem25, r11 => mmem24, r12 => mmem23, r13 => mmem22, r14 => mmem21, r15 => mmem20, r16 => mmem19, r17 => mmem18, r18 => mmem17);
--  mctl_4a18 : sn74s258 port map(sel => clk4e, d0 => wadr0, d1 => ir26, dy => \-madr0b\, c0 => wadr1, c1 => ir27, cy => \-madr1b\, by => \-madr2b\, b1 => ir28, b0 => wadr2, ay => \-madr3b\, a1 => ir29, a0 => wadr3);
--  mctl_4b18 : 93s46 port map(a0 => ir26, b0 => wadr0, a1 => ir27, b1 => wadr1, a2 => ir28, b2 => wadr2, enb => hi2, eq => mpass, a3 => ir29, b3 => wadr3, a4 => ir30, b4 => wadr4, a5 => hi2);
--  mctl_4a16 : sn74s258 port map(sel => clk4e, d0 => wadr4, d1 => ir30, dy => \-madr4a\, c0 => nc, c1 => nc, cy => nc, by => nc, b1 => nc, b0 => nc, ay => \-madr4b\, a1 => ir30, a0 => wadr4);
--  mctl_4b19 : sn74s258 port map(sel => clk4e, d0 => wadr0, d1 => ir26, dy => \-madr0a\, c0 => wadr1, c1 => ir27, cy => \-madr1a\, by => \-madr2a\, b1 => ir28, b0 => wadr2, ay => \-madr3a\, a1 => ir29, a0 => wadr3);

--  mmem_4a27 : 82s21 port map(wclk_n => \-mwpb\, we0_n => gnd, i0 => l14, a4 => \-madr4b\, ce => hi2, d0 => mmem14, d1 => mmem15, a3 => \-madr3b\, a2 => \-madr2b\, a1 => \-madr1b\, a0 => \-madr0b\, i1 => l15);
--  mmem_4a22 : 82s21 port map(wclk_n => \-mwpb\, we0_n => gnd, i0 => l12, a4 => \-madr4b\, ce => hi2, d0 => mmem12, d1 => mmem13, a3 => \-madr3b\, a2 => \-madr2b\, a1 => \-madr1b\, a0 => \-madr0b\, i1 => l13);
--  mmem_4a28 : 82s21 port map(wclk_n => \-mwpb\, we0_n => gnd, i0 => l10, a4 => \-madr4b\, ce => hi2, d0 => mmem10, d1 => mmem11, a3 => \-madr3b\, a2 => \-madr2b\, a1 => \-madr1b\, a0 => \-madr0b\, i1 => l11);
--  mmem_4a23 : 82s21 port map(wclk_n => \-mwpb\, we0_n => gnd, i0 => l8, a4 => \-madr4b\, ce => hi2, d0 => mmem8, d1 => mmem9, a3 => \-madr3b\, a2 => \-madr2b\, a1 => \-madr1b\, a0 => \-madr0b\, i1 => l9);
--  mmem_4a29 : 82s21 port map(wclk_n => \-mwpb\, we0_n => gnd, i0 => l6, a4 => \-madr4b\, ce => hi2, d0 => mmem6, d1 => mmem7, a3 => \-madr3b\, a2 => \-madr2b\, a1 => \-madr1b\, a0 => \-madr0b\, i1 => l7);
--  mmem_4a24 : 82s21 port map(wclk_n => \-mwpb\, we0_n => gnd, i0 => l4, a4 => \-madr4b\, ce => hi2, d0 => mmem4, d1 => mmem5, a3 => \-madr3b\, a2 => \-madr2b\, a1 => \-madr1b\, a0 => \-madr0b\, i1 => l5);
--  mmem_4a30 : 82s21 port map(wclk_n => \-mwpb\, we0_n => gnd, i0 => l2, a4 => \-madr4b\, ce => hi2, d0 => mmem2, d1 => mmem3, a3 => \-madr3b\, a2 => \-madr2b\, a1 => \-madr1b\, a0 => \-madr0b\, i1 => l3);
--  mmem_4a25 : 82s21 port map(wclk_n => \-mwpb\, we0_n => gnd, i0 => l0, a4 => \-madr4b\, ce => hi2, d0 => mmem0, d1 => mmem1, a3 => \-madr3b\, a2 => \-madr2b\, a1 => \-madr1b\, a0 => \-madr0b\, i1 => l1);
--  mmem_4b27 : 82s21 port map(wclk_n => \-mwpa\, we0_n => gnd, i0 => lparity, a4 => \-madr4a\, ce => hi3, d0 => mmemparity, d1 => nc, a3 => \-madr3a\, a2 => \-madr2a\, a1 => \-madr1a\, a0 => \-madr0a\, i1 => nc);
--  mmem_4b28 : 82s21 port map(wclk_n => \-mwpa\, we0_n => gnd, i0 => l30, a4 => \-madr4a\, ce => hi3, d0 => mmem30, d1 => mmem31, a3 => \-madr3a\, a2 => \-madr2a\, a1 => \-madr1a\, a0 => \-madr0a\, i1 => l31);
--  mmem_4b23 : 82s21 port map(wclk_n => \-mwpa\, we0_n => gnd, i0 => l28, a4 => \-madr4a\, ce => hi3, d0 => mmem28, d1 => mmem29, a3 => \-madr3a\, a2 => \-madr2a\, a1 => \-madr1a\, a0 => \-madr0a\, i1 => l29);
--  mmem_4b29 : 82s21 port map(wclk_n => \-mwpa\, we0_n => gnd, i0 => l26, a4 => \-madr4a\, ce => hi3, d0 => mmem26, d1 => mmem27, a3 => \-madr3a\, a2 => \-madr2a\, a1 => \-madr1a\, a0 => \-madr0a\, i1 => l27);
--  mmem_4b24 : 82s21 port map(wclk_n => \-mwpa\, we0_n => gnd, i0 => l24, a4 => \-madr4a\, ce => hi3, d0 => mmem24, d1 => mmem25, a3 => \-madr3a\, a2 => \-madr2a\, a1 => \-madr1a\, a0 => \-madr0a\, i1 => l25);
--  mmem_4b30 : 82s21 port map(wclk_n => \-mwpa\, we0_n => gnd, i0 => l22, a4 => \-madr4a\, ce => hi3, d0 => mmem22, d1 => mmem23, a3 => \-madr3a\, a2 => \-madr2a\, a1 => \-madr1a\, a0 => \-madr0a\, i1 => l23);
--  mmem_4b25 : 82s21 port map(wclk_n => \-mwpa\, we0_n => gnd, i0 => l20, a4 => \-madr4a\, ce => hi3, d0 => mmem20, d1 => mmem21, a3 => \-madr3a\, a2 => \-madr2a\, a1 => \-madr1a\, a0 => \-madr0a\, i1 => l21);
--  mmem_4a26 : 82s21 port map(wclk_n => \-mwpa\, we0_n => gnd, i0 => l18, a4 => \-madr4a\, ce => hi3, d0 => mmem18, d1 => mmem19, a3 => \-madr3a\, a2 => \-madr2a\, a1 => \-madr1a\, a0 => \-madr0a\, i1 => l19);
--  mmem_4a21 : 82s21 port map(wclk_n => \-mwpa\, we0_n => gnd, i0 => l16, a4 => \-madr4a\, ce => hi3, d0 => mmem16, d1 => mmem17, a3 => \-madr3a\, a2 => \-madr2a\, a1 => \-madr1a\, a0 => \-madr0a\, i1 => l17);

--  mlatch_4b07 : sn74s241 port map(aenb_n => \-mpassl\, q7 => mf24, q6 => mf25, q5 => mf26, q4 => mf27, q3 => mf28, q2 => mf29, q1 => mf30, q0 => mf31);
--  mlatch_4b09 : sn74s241 port map(aenb_n => \-mpassl\, q7 => mf16, q6 => mf17, q5 => mf18, q4 => mf19, q3 => mf20, q2 => mf21, q1 => mf22, q0 => mf23);
--  mlatch_4a06 : sn74s241 port map(aenb_n => \-mpassl\, q7 => mf8, q6 => mf9, q5 => mf10, q4 => mf11, q3 => mf12, q2 => mf13, q1 => mf14, q0 => mf15);
--  mlatch_4a08 : sn74s241 port map(aenb_n => \-mpassl\, q7 => mf0, q6 => mf1, q5 => mf2, q4 => mf3, q3 => mf4, q2 => mf5, q1 => mf6, q0 => mf7);
--  mlatch_4a05 : sn74s373 port map(oenb_n => \-mpassm\, o0 => m7, i0 => mmem7, i1 => mmem6, o1 => m6, o2 => m5, i2 => mmem5, i3 => mmem4, o3 => m4, hold_n => clk4a, o4 => m3, i4 => mmem3, i5 => mmem2, o5 => m2, o6 => m1, i6 => mmem1, i7 => mmem0);
--  mlatch_4a03 : sn74s373 port map(oenb_n => \-mpassm\, o0 => m15, i0 => mmem15, i1 => mmem14, o1 => m14, o2 => m13, i2 => mmem13, i3 => mmem12, o3 => m12, hold_n => clk4a, o4 => m11, i4 => mmem11, i5 => mmem10, o5 => m10, o6 => m9, i6 => mmem9, i7 => mmem8);
--  mlatch_4a01 : sn74s373 port map(oenb_n => \-mpassm\, o0 => m23, i0 => mmem23, i1 => mmem22, o1 => m22, o2 => m21, i2 => mmem21, i3 => mmem20, o3 => m20, hold_n => clk4a, o4 => m19, i4 => mmem19, i5 => mmem18, o5 => m18, o6 => m17, i6 => mmem17, i7 => mmem16);
--  mlatch_4b04 : sn74s373 port map(oenb_n => \-mpassm\, o0 => m31, i0 => mmem31, i1 => mmem30, o1 => m30, o2 => m29, i2 => mmem29, i3 => mmem28, o3 => m28, hold_n => clk4a, o4 => m27, i4 => mmem27, i5 => mmem26, o5 => m26, o6 => m25, i6 => mmem25, i7 => mmem24);
--  mlatch_4b02 : sn74s373 port map(oenb_n => \-mpassm\, o0 => nc, i0 => nc, i1 => nc, o1 => nc, o2 => nc, i2 => nc, i3 => nc, o3 => nc, hold_n => clk4a, o4 => nc, i4 => nc, i5 => nc, o5 => nc, o6 => nc, i6 => nc, i7 => mmemparity);

--  mf_4d08 : sn74s00 port map(g4q_n => \-srcm\, g4a => \-ir31\);
--  mf_3f14 : sn74s02 port map(g3b => pdlenb, g3a => spcenb);
--  mf_4d06 : sn74s08 port map(g4q => mfenb, g4a => internal25);
--  mf_2a04 : sn74s08 port map(g2b => tse1a, g2a => mfenb, g2q => mfdrive);
--  mf_1a18 : sn74s00 port map(g1b => tse1a, g1a => mfenb, g1q_n => \-mfdrive\);
--  mf_1b24 : sn74s241 port map(aenb_n => \-mfdrive\, q7 => m24, q6 => m25, q5 => m26, q4 => m27, q3 => m28, q2 => m29, q1 => m30, q0 => m31);
--  mf_1a21 : sn74s241 port map(aenb_n => \-mfdrive\, q7 => m16, q6 => m17, q5 => m18, q4 => m19, q3 => m20, q2 => m21, q1 => m22, q0 => m23);
--  mf_1a23 : sn74s241 port map(aenb_n => \-mfdrive\, q7 => m8, q6 => m9, q5 => m10, q4 => m11, q3 => m12, q2 => m13, q1 => m14, q0 => m15);
--  mf_1a25 : sn74s241 port map(aenb_n => \-mfdrive\, q7 => m0, q6 => m1, q5 => m2, q4 => m3, q3 => m4, q2 => m5, q1 => m6, q0 => m7);

  --- Stack Buffer

--  pdlptr_4d08 : sn74s00 port map(g3q_n => \-ppdrive\, g3b => srcpdlptr, g3a => tse4b);
--  pdlptr_4d06 : sn74s08 port map(g3q => pidrive, g3a => srcpdlidx, g3b => tse4b);
--  pdlptr_4d04 : sn74s241 port map(aenb_n => \-ppdrive\, q7 => mf8, q6 => mf9, q5 => mf10, q4 => mf11, q3 => mf8, q2 => mf9, q1 => mf10, q0 => mf11);
--  pdlptr_4c01 : sn74s241 port map(aenb_n => \-ppdrive\, q7 => mf0, q6 => mf1, q5 => mf2, q4 => mf3, q3 => mf0, q2 => mf1, q1 => mf2, q0 => mf3);
--  pdlptr_4d05 : sn74s241 port map(aenb_n => \-ppdrive\, q7 => mf4, q6 => mf5, q5 => mf6, q4 => mf7, q3 => mf4, q2 => mf5, q1 => mf6, q0 => mf7);
--  pdlptr_3c22 : 25s07 port map(enb_n => \-destpdlx\, d0 => pdlidx6, i0 => ob6, i1 => ob7, d1 => pdlidx7, i2 => ob8, d2 => pdlidx8, clk => clk3f, d3 => pdlidx9, i3 => ob9, d4 => nc, i4 => nc, i5 => nc);
--  pdlptr_3d25 : 25s07 port map(enb_n => \-destpdlx\, d0 => pdlidx0, i0 => ob0, i1 => ob1, d1 => pdlidx1, i2 => ob2, d2 => pdlidx2, clk => clk3f, d3 => pdlidx3, i3 => ob3, d4 => pdlidx4, i4 => ob4, i5 => ob5);
--  pdlptr_3c21 : sn74s169 port map(up_dn => \-srcpdlpop\, clk => clk3f, i0 => ob8, i1 => ob9, i2 => nc, i3 => nc, enb_p_n => gnd, load_n => \-destpdlp\, enb_t_n => \-pdlcry7\, o3 => nc, o2 => nc, o1 => pdlptr9, o0 => pdlptr8);
--  pdlptr_3d24 : sn74s169 port map(up_dn => \-srcpdlpop\, clk => clk3f, i0 => ob4, i1 => ob5, i2 => ob6, i3 => ob7, enb_p_n => gnd, load_n => \-destpdlp\, enb_t_n => \-pdlcry3\, o3 => pdlptr7, o2 => pdlptr6, o1 => pdlptr5, o0 => pdlptr4);
--  pdlptr_3d30 : sn74s169 port map(up_dn => \-srcpdlpop\, clk => clk3f, i0 => ob0, i1 => ob1, i2 => ob2, i3 => ob3, enb_p_n => gnd, load_n => \-destpdlp\, enb_t_n => \-pdlcnt\, o3 => pdlptr3, o2 => pdlptr2, o1 => pdlptr1, o0 => pdlptr0);

--  pdlctl_4c11 : sn74s175 port map(clr_n => \-reset\, q0 => pdlwrited, q0_n => \-pdlwrited\, d0 => pdlwrite, d1 => \-destpdl\(x), q1_n => pwidx, q1 => \-pwidx\, clk => clk4f, q2 => imodd, q2_n => \-imodd\, d2 => imod, d3 => \-destspc\, q3_n => nc);
--  pdlctl_4d08 : sn74s00 port map(g1b => \-srcpdlpop\, g1a => \-srcpdltop\, g1q_n => pdlenb, g2b => pdlenb, g2a => tse4b, g2q_n => \-pdldrive\);
--  pdlctl_4e03 : sn74s32 port map(g3a => \-srcpdlpop\, g3b => nop);
--  pdlctl_4d10 : sn74s10 port map(g1a => \-destpdltop\, g1b => \-destpdl\(x), g1y_n => pdlwrite);
--  pdlctl_4d20 : sn74s37 port map(g1a => pdlwrited, g1b => wp4a, g1y => \-pwpa\, g2a => pdlwrited, g2b => wp4a, g2y => \-pwpb\, g3y => \-pwpc\, g3a => wp4a, g3b => pdlwrited);
--  pdlctl_4d06 : sn74s08 port map(g2b => internal22, g2a => \-destpdl\(p), g2q => \-pdlcnt\);
--  pdlctl_4d07 : sn74s51 port map(g1a => \-pwidx\, g2a => clk4b, g2b => ir30, g2c => \-clk4e\, g2d => \-pwidx\, g2y => \-pdlpa\, g1y => \-pdlpb\, g1c => clk4b, g1d => ir30);
--  pdlctl_4c12 : sn74s258 port map(sel => \-pdlpb\, d0 => pdlptr0, d1 => pdlidx0, dy => \-pdla0b\, c0 => pdlptr1, c1 => pdlidx1, cy => \-pdla1b\, by => \-pdla2b\, b1 => pdlidx2, b0 => pdlptr2, ay => \-pdla3b\, a1 => pdlidx3, a0 => pdlptr3);
--  pdlctl_4d14 : sn74s258 port map(sel => \-pdlpb\, d0 => pdlptr4, d1 => pdlidx4, dy => \-pdla4b\, c0 => pdlptr5, c1 => pdlidx5, cy => \-pdla5b\, by => \-pdla6b\, b1 => pdlidx6, b0 => pdlptr6, ay => \-pdla7b\, a1 => pdlidx7, a0 => pdlptr7);
--  pdlctl_4c16 : sn74s258 port map(sel => \-pdlpa\, d0 => pdlptr8, d1 => pdlidx8, dy => \-pdla8b\, c0 => pdlptr9, c1 => pdlidx9, cy => \-pdla9b\, by => \-pdla0a\, b1 => pdlidx0, b0 => pdlptr0, ay => \-pdla1a\, a1 => pdlidx1, a0 => pdlptr1);
--  pdlctl_4c22 : sn74s258 port map(sel => \-pdlpa\, d0 => pdlptr2, d1 => pdlidx2, dy => \-pdla2a\, c0 => pdlptr3, c1 => pdlidx3, cy => \-pdla3a\, by => \-pdla4a\, b1 => pdlidx4, b0 => pdlptr4, ay => \-pdla5a\, a1 => pdlidx5, a0 => pdlptr5);
--  pdlctl_4d24 : sn74s258 port map(sel => \-pdlpa\, d0 => pdlptr6, d1 => pdlidx6, dy => \-pdla6a\, c0 => pdlptr7, c1 => pdlidx7, cy => \-pdla7a\, by => \-pdla8a\, b1 => pdlidx8, b0 => pdlptr8, ay => \-pdla9a\, a1 => pdlidx9, a0 => pdlptr9);

--  pdl0_4d22 : 93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, d0 => pdl16, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpb\);
--  pdl0_4d21 : 93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, d0 => pdl17, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpb\);
--  pdl0_4c20 : 93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, d0 => pdl18, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpb\);
--  pdl0_4c19 : 93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, d0 => pdl19, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpb\);
--  pdl0_4c18 : 93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, d0 => pdl20, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpb\);
--  pdl0_4c17 : 93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, d0 => pdl21, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpb\);
--  pdl0_4d19 : 93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, d0 => pdl22, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\);
--  pdl0_4d18 : 93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, d0 => pdl23, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\);
--  pdl0_4d17 : 93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, d0 => pdl24, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\);
--  pdl0_4d16 : 93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, d0 => pdl25, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\);
--  pdl0_4c15 : 93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, d0 => pdl26, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\);
--  pdl0_4c14 : 93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, d0 => pdl27, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\);
--  pdl0_4c13 : 93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, d0 => pdl28, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\);
--  pdl0_4d13 : 93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, d0 => pdl29, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\);
--  pdl0_4d12 : 93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, d0 => pdl30, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\);
--  pdl0_4d11 : 93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, d0 => pdl31, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\);
--  pdl0_4c10 : 93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, d0 => pdlparity, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\);

--  pdl1_4c30 : 93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, d0 => pdl0, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\);
--  pdl1_4c29 : 93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, d0 => pdl1, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\);
--  pdl1_4c28 : 93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, d0 => pdl2, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\);
--  pdl1_4c27 : 93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, d0 => pdl3, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\);
--  pdl1_4c26 : 93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, d0 => pdl4, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\);
--  pdl1_4d30 : 93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, d0 => pdl5, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\);
--  pdl1_4d29 : 93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, d0 => pdl6, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\);
--  pdl1_4d28 : 93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, d0 => pdl7, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\);
--  pdl1_4d27 : 93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, d0 => pdl8, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\);
--  pdl1_4d26 : 93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, d0 => pdl9, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\);
--  pdl1_4c25 : 93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, d0 => pdl10, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\);
--  pdl1_4c24 : 93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, d0 => pdl11, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpb\);
--  pdl1_4c23 : 93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, d0 => pdl12, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpb\);
--  pdl1_4c21 : 93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, d0 => pdl13, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpb\);
--  pdl1_4d25 : 93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, d0 => pdl14, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpb\);
--  pdl1_4d23 : 93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, d0 => pdl15, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpb\);

--  platch_4a04 : sn74s373 port map(oenb_n => \-pdldrive\, o0 => m7, i0 => pdl7, i1 => pdl6, o1 => m6, o2 => m5, i2 => pdl5, i3 => pdl4, o3 => m4, hold_n => clk4a, o4 => m3, i4 => pdl3, i5 => pdl2, o5 => m2, o6 => m1, i6 => pdl1, i7 => pdl0);
--  platch_4a02 : sn74s373 port map(oenb_n => \-pdldrive\, o0 => m15, i0 => pdl15, i1 => pdl14, o1 => m14, o2 => m13, i2 => pdl13, i3 => pdl12, o3 => m12, hold_n => clk4a, o4 => m11, i4 => pdl11, i5 => pdl10, o5 => m10, o6 => m9, i6 => pdl9, i7 => pdl8);
--  platch_4b05 : sn74s373 port map(oenb_n => \-pdldrive\, o0 => m23, i0 => pdl23, i1 => pdl22, o1 => m22, o2 => m21, i2 => pdl21, i3 => pdl20, o3 => m20, hold_n => clk4a, o4 => m19, i4 => pdl19, i5 => pdl18, o5 => m18, o6 => m17, i6 => pdl17, i7 => pdl16);
--  platch_4b03 : sn74s373 port map(oenb_n => \-pdldrive\, o0 => m31, i0 => pdl31, i1 => pdl30, o1 => m30, o2 => m29, i2 => pdl29, i3 => pdl28, o3 => m28, hold_n => clk4a, o4 => m27, i4 => pdl27, i5 => pdl26, o5 => m26, o6 => m25, i6 => pdl25, i7 => pdl24);
--  platch_4b08 : sn74s373 port map(oenb_n => \-pdldrive\, o0 => nc, i0 => nc, i1 => nc, o1 => nc, o2 => nc, i2 => nc, i3 => nc, o3 => nc, hold_n => clk4a, o4 => nc, i4 => nc, i5 => nc, o5 => nc, o6 => nc, i6 => nc, i7 => pdlparity);

  --- The Shifter\Masker

--  smctl_2d15 : sn74s32 port map(g1a => \-sh4\, g1b => \-sr\, g1y => \-s4\);
--  smctl_2e10 : sn74s283 port map(s1 => nc, b1 => nc, a1 => nc, s0 => mskl4, a0 => ir9, b0 => mskr4, c0 => mskl3cry, c4 => nc, s3 => nc, b3 => nc, a3 => nc, s2 => nc, a2 => nc);
--  smctl_2e25 : sn74s283 port map(s1 => mskl1, b1 => mskr1, a1 => ir6, s0 => mskl0, a0 => ir5, b0 => mskr0, c0 => gnd, c4 => mskl3cry, s3 => mskl3, b3 => mskr3, a3 => ir8, s2 => mskl2, a2 => ir7);
--  smctl_2e14 : sn74s02 port map(g1q_n => s3a, g1a => \-sr\, g1b => \-sh3\, g2q_n => s3b, g2a => \-sh3\, g2b => \-sr\, g3b => \-ir2\, g3a => \-sr\, g3q_n => s2a, g4b => \-sr\, g4a => \-ir2\);
--  smctl_2d20 : sn74s02 port map(g1q_n => \-mr\, g1a => \-irbyte\, g1b => ir13, g2q_n => \-sr\, g2a => \-irbyte\, g2b => ir12, g3b => \-ir0\, g3a => \-sr\, g3q_n => s0, g4b => \-ir1\, g4a => \-sr\);
--  smctl_2e19 : sn74s02 port map(g1q_n => s4, g1a => \-sr\, g1b => \-sh4\, g2q_n => mskr0, g2a => \-mr\, g2b => \-ir0\, g3b => \-ir1\, g3a => \-mr\, g3q_n => mskr1, g4b => \-ir2\, g4a => \-mr\);
--  smctl_2e30 : sn74s02 port map(g1q_n => mskr3, g1a => \-mr\, g1b => \-sh3\, g2q_n => mskr4, g2a => \-mr\, g2b => \-sh4\);

--  shift0_2c21 : 25s10 port map(i_3 => m5, i_2 => m6, i_1 => m7, i0 => m8, i1 => m9, i2 => m10, i3 => m11, sel1 => s1, sel0 => s0, o3 => sa11, o2 => sa10, ce_n => gnd, o1 => sa9);
--  shift0_2d25 : 25s10 port map(i_3 => m9, i_2 => m10, i_1 => m11, i0 => m12, i1 => m13, i2 => m14, i3 => m15, sel1 => s1, sel0 => s0, o3 => sa15, o2 => sa14, ce_n => gnd, o1 => sa13);
--  shift0_2e27 : 25s10 port map(i_3 => sa20, i_2 => sa24, i_1 => sa28, i0 => sa0, i1 => sa4, i2 => sa8, i3 => sa12, sel1 => s3a, sel0 => s2a, o3 => r12, o2 => r8, ce_n => s4, o1 => r4);
--  shift0_2e29 : 25s10 port map(i_3 => sa21, i_2 => sa25, i_1 => sa29, i0 => sa1, i1 => sa5, i2 => sa9, i3 => sa13, sel1 => s3a, sel0 => s2a, o3 => r13, o2 => r9, ce_n => s4, o1 => r5);
--  shift0_2e22 : 25s10 port map(i_3 => sa22, i_2 => sa26, i_1 => sa30, i0 => sa2, i1 => sa6, i2 => sa10, i3 => sa14, sel1 => s3a, sel0 => s2a, o3 => r14, o2 => r10, ce_n => s4, o1 => r6);
--  shift0_2e24 : 25s10 port map(i_3 => sa23, i_2 => sa27, i_1 => sa31, i0 => sa3, i1 => sa7, i2 => sa11, i3 => sa15, sel1 => s3a, sel0 => s2a, o3 => r15, o2 => r11, ce_n => s4, o1 => r7);
--  shift0_2e23 : 25s10 port map(i_3 => sa7, i_2 => sa11, i_1 => sa15, i0 => sa19, i1 => sa23, i2 => sa27, i3 => sa31, sel1 => s3a, sel0 => s2a, o3 => r15, o2 => r11, ce_n => \-s4\, o1 => r7);
--  shift0_2e21 : 25s10 port map(i_3 => sa6, i_2 => sa10, i_1 => sa14, i0 => sa18, i1 => sa22, i2 => sa26, i3 => sa30, sel1 => s3a, sel0 => s2a, o3 => r14, o2 => r10, ce_n => \-s4\, o1 => r6);
--  shift0_2e28 : 25s10 port map(i_3 => sa5, i_2 => sa9, i_1 => sa13, i0 => sa17, i1 => sa21, i2 => sa25, i3 => sa29, sel1 => s3a, sel0 => s2a, o3 => r13, o2 => r9, ce_n => \-s4\, o1 => r5);
--  shift0_2e26 : 25s10 port map(i_3 => sa4, i_2 => sa8, i_1 => sa12, i0 => sa16, i1 => sa20, i2 => sa24, i3 => sa28, sel1 => s3a, sel0 => s2a, o3 => r12, o2 => r8, ce_n => \-s4\, o1 => r4);
--  shift0_2d30 : 25s10 port map(i_3 => m1, i_2 => m2, i_1 => m3, i0 => m4, i1 => m5, i2 => m6, i3 => m7, sel1 => s1, sel0 => s0, o3 => sa7, o2 => sa6, ce_n => gnd, o1 => sa5);
--  shift0_2c26 : 25s10 port map(i_3 => m29, i_2 => m30, i_1 => m31, i0 => m0, i1 => m1, i2 => m2, i3 => m3, sel1 => s1, sel0 => s0, o3 => sa3, o2 => sa2, ce_n => gnd, o1 => sa1);

--  shift1_2c01 : 25s10 port map(i_3 => m21, i_2 => m22, i_1 => m23, i0 => m24, i1 => m25, i2 => m26, i3 => m27, sel1 => s1, sel0 => s0, o3 => sa27, o2 => sa26, ce_n => gnd, o1 => sa25);
--  shift1_2d05 : 25s10 port map(i_3 => m25, i_2 => m26, i_1 => m27, i0 => m28, i1 => m29, i2 => m30, i3 => m31, sel1 => s1, sel0 => s0, o3 => sa31, o2 => sa30, ce_n => gnd, o1 => sa29);
--  shift1_2e07 : 25s10 port map(i_3 => sa4, i_2 => sa8, i_1 => sa12, i0 => sa16, i1 => sa20, i2 => sa24, i3 => sa28, sel1 => s3b, sel0 => s2b, o3 => r28, o2 => r24, ce_n => s4, o1 => r20);
--  shift1_2e09 : 25s10 port map(i_3 => sa5, i_2 => sa9, i_1 => sa13, i0 => sa17, i1 => sa21, i2 => sa25, i3 => sa29, sel1 => s3b, sel0 => s2b, o3 => r29, o2 => r25, ce_n => s4, o1 => r21);
--  shift1_2e02 : 25s10 port map(i_3 => sa6, i_2 => sa10, i_1 => sa14, i0 => sa18, i1 => sa22, i2 => sa26, i3 => sa30, sel1 => s3b, sel0 => s2b, o3 => r30, o2 => r26, ce_n => s4, o1 => r22);
--  shift1_2e04 : 25s10 port map(i_3 => sa7, i_2 => sa11, i_1 => sa15, i0 => sa19, i1 => sa23, i2 => sa27, i3 => sa31, sel1 => s3b, sel0 => s2b, o3 => r31, o2 => r27, ce_n => s4, o1 => r23);
--  shift1_2e03 : 25s10 port map(i_3 => sa23, i_2 => sa27, i_1 => sa31, i0 => sa3, i1 => sa7, i2 => sa11, i3 => sa15, sel1 => s3b, sel0 => s2b, o3 => r31, o2 => r27, ce_n => \-s4\, o1 => r23);
--  shift1_2e01 : 25s10 port map(i_3 => sa22, i_2 => sa26, i_1 => sa30, i0 => sa2, i1 => sa6, i2 => sa10, i3 => sa14, sel1 => s3b, sel0 => s2b, o3 => r30, o2 => r26, ce_n => \-s4\, o1 => r22);
--  shift1_2e08 : 25s10 port map(i_3 => sa21, i_2 => sa25, i_1 => sa29, i0 => sa1, i1 => sa5, i2 => sa9, i3 => sa13, sel1 => s3b, sel0 => s2b, o3 => r29, o2 => r25, ce_n => \-s4\, o1 => r21);
--  shift1_2e06 : 25s10 port map(i_3 => sa20, i_2 => sa24, i_1 => sa28, i0 => sa0, i1 => sa4, i2 => sa8, i3 => sa12, sel1 => s3b, sel0 => s2b, o3 => r28, o2 => r24, ce_n => \-s4\, o1 => r20);
--  shift1_2d10 : 25s10 port map(i_3 => m17, i_2 => m18, i_1 => m19, i0 => m20, i1 => m21, i2 => m22, i3 => m23, sel1 => s1, sel0 => s0, o3 => sa23, o2 => sa22, ce_n => gnd, o1 => sa21);
--  shift1_2c06 : 25s10 port map(i_3 => m13, i_2 => m14, i_1 => m15, i0 => m16, i1 => m17, i2 => m18, i3 => m19, sel1 => s1, sel0 => s0, o3 => sa19, o2 => sa18, ce_n => gnd, o1 => sa17);

--  mskg4_2e15 : res20 port map(r2 => aeqm, r3 => msk31, r4 => msk30, r5 => msk29, r6 => msk28, r7 => msk27, r8 => msk26, r9 => msk25, r11 => msk24, r12 => msk23, r13 => msk22, r14 => msk21, r15 => msk20, r16 => msk19, r17 => msk18, r18 => msk17);
--  mskg4_2e20 : res20 port map(r2 => nc, r3 => msk15, r4 => msk14, r5 => msk13, r6 => msk12, r7 => msk11, r8 => msk10, r9 => msk9, r11 => msk8, r12 => msk7, r13 => msk6, r14 => msk5, r15 => msk4, r16 => msk3, r17 => msk2, r18 => msk1);
--  mskg4_2d26 : sn74s04 port map(g1a => nc, g1q_n => nc, g2a => ir31, g2q_n => \-ir31\, g3a => ir13, g3q_n => \-ir13\, g4q => \-ir12\, g4a => ir12, g5q_n => nc, g5a => nc, g6q_n => nc);
--  mskg4_2d12 : 5600 port map(o0 => msk24, o1 => msk25, o2 => msk26, o3 => msk27, o4 => msk28, o5 => msk29, o6 => msk30, o7 => msk31, a0 => mskr0, a1 => mskr1, a2 => mskr2, a3 => mskr3, a4 => mskr4);
--  mskg4_2e12 : 5600 port map(o0 => msk16, o1 => msk17, o2 => msk18, o3 => msk19, o4 => msk20, o5 => msk21, o6 => msk22, o7 => msk23, a0 => mskr0, a1 => mskr1, a2 => mskr2, a3 => mskr3, a4 => mskr4);
--  mskg4_2d17 : 5600 port map(o0 => msk8, o1 => msk9, o2 => msk10, o3 => msk11, o4 => msk12, o5 => msk13, o6 => msk14, o7 => msk15, a0 => mskr0, a1 => mskr1, a2 => mskr2, a3 => mskr3, a4 => mskr4);
--  mskg4_2e17 : 5600 port map(o0 => msk0, o1 => msk1, o2 => msk2, o3 => msk3, o4 => msk4, o5 => msk5, o6 => msk6, o7 => msk7, a0 => mskr0, a1 => mskr1, a2 => mskr2, a3 => mskr3, a4 => mskr4);
--  mskg4_2d11 : 5600 port map(o0 => msk24, o1 => msk25, o2 => msk26, o3 => msk27, o4 => msk28, o5 => msk29, o6 => msk30, o7 => msk31, a0 => mskl0, a1 => mskl1, a2 => mskl2, a3 => mskl3, a4 => mskl4);
--  mskg4_2e11 : 5600 port map(o0 => msk16, o1 => msk17, o2 => msk18, o3 => msk19, o4 => msk20, o5 => msk21, o6 => msk22, o7 => msk23, a0 => mskl0, a1 => mskl1, a2 => mskl2, a3 => mskl3, a4 => mskl4);
--  mskg4_2d16 : 5600 port map(o0 => msk8, o1 => msk9, o2 => msk10, o3 => msk11, o4 => msk12, o5 => msk13, o6 => msk14, o7 => msk15, a0 => mskl0, a1 => mskl1, a2 => mskl2, a3 => mskl3, a4 => mskl4);
--  mskg4_2e16 : 5600 port map(o0 => msk0, o1 => msk1, o2 => msk2, o3 => msk3, o4 => msk4, o5 => msk5, o6 => msk6, o7 => msk7, a0 => mskl0, a1 => mskl1, a2 => mskl2, a3 => mskl3, a4 => mskl4);

  --- The ALU

--  aluc4_2b20 : sn74s37 port map(g1a => \-alumode\, g1b => \-alumode\, g1y => alumode);
--  aluc4_2c11 : sn74s04 port map(g1a => a31b, g1q_n => \-a31\, g2a => ir4, g2q_n => \-ir4\, g3a => ir3, g3q_n => \-ir3\, g4q => \-ir2\, g4a => ir2, g5q_n => \-ir1\, g5a => ir1, g6q_n => \-ir0\);
--  aluc4_2c10 : sn74s02 port map(g1a => ir5, g1b => \-divposlasttime\, g2q_n => \-divposlasttime\, g2a => q0, g2b => ir6, g3b => \-divposlasttime\, g3a => \-div\, g3q_n => divsubcond, g4b => internal36, g4a => \-div\);
--  aluc4_2d15 : sn74s32 port map(g2a => \-mul\, g2b => q0, g2y => \-mulnop\);
--  aluc4_2c15 : sn74s00 port map(g1b => divaddcond, g1a => \-a31\, g2b => divsubcond, g2a => a31a, g3b => divsubcond, g3a => \-a31\, g4a => divaddcond);
--  aluc4_2c20 : sn74s20 port map(g1a => \-mulnop\, g1b => internal39, g1c => internal40, g1d => \-irjump\, g1y_n => alusub, g2y_n => aluadd, g2a => \-mul\, g2b => hi12, g2c => internal38);
--  aluc4_2d21 : sn7428 port map(g1q_n => osel1a, g1a => \-ir13\, g1b => \-iralu\, g2q_n => osel0a, g2a => \-ir12\, g2b => \-iralu\, g3a => \-iralu\, g3b => \-ir13\, g3q_n => osel1b, g4a => \-iralu\, g4b => \-ir12\);
--  aluc4_2a16 : sn74s37 port map(g1a => \-aluf0\, g1b => \-aluf0\, g1y => aluf0b, g2a => \-aluf1\, g2b => \-aluf1\, g2y => aluf1b, g3y => aluf2b, g3a => \-aluf2\, g3b => \-aluf2\, g4y => aluf3b, g4a => \-aluf3\);
--  aluc4_2a17 : sn74s37 port map(g1a => \-aluf0\, g1b => \-aluf0\, g1y => aluf0a, g2a => \-aluf1\, g2b => \-aluf1\, g2y => aluf1a, g3y => aluf2a, g3a => \-aluf2\, g3b => \-aluf2\, g4y => aluf3a, g4a => \-aluf3\);
--  aluc4_2b18 : sn74s153 port map(enb1_n => gnd, sel1 => alusub, g1d3 => gnd, g1d2 => hi12, g1d1 => hi12, g1d0 => ir7, g1q => \-alumode\, g2q => \-cin0\, g2d0 => \-ir2\, g2d1 => hi12, g2d2 => irjump, g2d3 => gnd, sel0 => aluadd);
--  aluc4_2b17 : sn74s153 port map(enb1_n => gnd, sel1 => alusub, g1d3 => gnd, g1d2 => gnd, g1d1 => hi12, g1d0 => ir6, g1q => \-aluf1\, g2q => \-aluf0\, g2d0 => ir5, g2d1 => gnd, g2d2 => hi12, g2d3 => gnd, sel0 => aluadd);
--  aluc4_2b16 : sn74s153 port map(enb1_n => gnd, sel1 => alusub, g1d3 => gnd, g1d2 => hi12, g1d1 => gnd, g1d0 => \-ir3\, g1q => \-aluf3\, g2q => \-aluf2\, g2d0 => \-ir4\, g2d1 => hi12, g2d2 => gnd, g2d3 => gnd, sel0 => aluadd);
--  aluc4_2a18 : sn74s182 port map(y1 => yy1, x1 => xx1, y0 => yy0, x0 => xx0, y3 => nc, x3 => nc, xout => nc, cout2_n => nc, yout => nc, cout1_n => \-cin32\, cout0_n => \-cin16\, cin_n => \-cin0\, y2 => nc);
--  aluc4_2a19 : sn74s182 port map(y1 => yout23, x1 => xout23, y0 => yout19, x0 => xout19, y3 => yout31, x3 => xout31, xout => xx1, cout2_n => \-cin28\, yout => yy1, cout1_n => \-cin24\, cout0_n => \-cin20\, cin_n => \-cin16\, y2 => yout27);
--  aluc4_2a20 : sn74s182 port map(y1 => yout7, x1 => xout7, y0 => yout3, x0 => xout3, y3 => yout15, x3 => xout15, xout => xx0, cout2_n => \-cin12\, yout => yy0, cout1_n => \-cin8\, cout0_n => \-cin4\, cin_n => \-cin0\, y2 => yout11);

--  alu0_2a23 : sn74s181 port map(b0 => a12, a0 => m12, s3 => aluf3b, s2 => aluf2b, s1 => aluf1b, s0 => aluf0b, cin_n => \-cin12\, m => alumode, f0 => alu12, f1 => alu13, f2 => alu14, f3 => alu15, aeb => aeqm, x => xout15, cout_n => nc, y => yout15, b3 => a15, a3 => m15, b2 => a14, a2 => m14, b1 => a13);
--  alu0_2b23 : sn74s181 port map(b0 => a8, a0 => m8, s3 => aluf3b, s2 => aluf2b, s1 => aluf1b, s0 => aluf0b, cin_n => \-cin8\, m => alumode, f0 => alu8, f1 => alu9, f2 => alu10, f3 => alu11, aeb => aeqm, x => xout11, cout_n => nc, y => yout11, b3 => a11, a3 => m11, b2 => a10, a2 => m10, b1 => a9);
--  alu0_2a28 : sn74s181 port map(b0 => a4, a0 => m4, s3 => aluf3b, s2 => aluf2b, s1 => aluf1b, s0 => aluf0b, cin_n => \-cin4\, m => alumode, f0 => alu4, f1 => alu5, f2 => alu6, f3 => alu7, aeb => aeqm, x => xout7, cout_n => nc, y => yout7, b3 => a7, a3 => m7, b2 => a6, a2 => m6, b1 => a5);
--  alu0_2b28 : sn74s181 port map(b0 => a0, a0 => m0, s3 => aluf3b, s2 => aluf2b, s1 => aluf1b, s0 => aluf0b, cin_n => \-cin0\, m => alumode, f0 => alu0, f1 => alu1, f2 => alu2, f3 => alu3, aeb => aeqm, x => xout3, cout_n => nc, y => yout3, b3 => a3, a3 => m3, b2 => a2, a2 => m2, b1 => a1);

--  alu1_2a04 : sn74s08 port map(g1b => m31, g1a => hi12, g1q => m31b);
--  alu1_2a03 : sn74s181 port map(b0 => a31a, a0 => m31b, s3 => aluf3a, s2 => aluf2a, s1 => aluf1a, s0 => aluf0a, cin_n => \-cin32\, m => alumode, f0 => alu32, f1 => nc, f2 => nc, f3 => nc, aeb => nc, x => nc, cout_n => nc, y => nc, b3 => nc, a3 => nc, b2 => nc, a2 => nc, b1 => nc);
--  alu1_2a08 : sn74s181 port map(b0 => a28, a0 => m28, s3 => aluf3a, s2 => aluf2a, s1 => aluf1a, s0 => aluf0a, cin_n => \-cin28\, m => alumode, f0 => alu28, f1 => alu29, f2 => alu30, f3 => alu31, aeb => aeqm, x => xout31, cout_n => nc, y => yout31, b3 => a31b, a3 => m31b, b2 => a30, a2 => m30, b1 => a29);
--  alu1_2b08 : sn74s181 port map(b0 => a24, a0 => m24, s3 => aluf3a, s2 => aluf2a, s1 => aluf1a, s0 => aluf0a, cin_n => \-cin24\, m => alumode, f0 => alu24, f1 => alu25, f2 => alu26, f3 => alu27, aeb => aeqm, x => xout27, cout_n => nc, y => yout27, b3 => a27, a3 => m27, b2 => a26, a2 => m26, b1 => a25);
--  alu1_2a13 : sn74s181 port map(b0 => a20, a0 => m20, s3 => aluf3a, s2 => aluf2a, s1 => aluf1a, s0 => aluf0a, cin_n => \-cin20\, m => alumode, f0 => alu20, f1 => alu21, f2 => alu22, f3 => alu23, aeb => aeqm, x => xout23, cout_n => nc, y => yout23, b3 => a23, a3 => m23, b2 => a22, a2 => m22, b1 => a21);
--  alu1_2b13 : sn74s181 port map(b0 => a16, a0 => m16, s3 => aluf3a, s2 => aluf2a, s1 => aluf1a, s0 => aluf0a, cin_n => \-cin16\, m => alumode, f0 => alu16, f1 => alu17, f2 => alu18, f3 => alu19, aeb => aeqm, x => xout19, cout_n => nc, y => yout19, b3 => a19, a3 => m19, b2 => a18, a2 => m18, b1 => a17);

  --- The Q Register

--  qctl_2a05 : sn74s04 port map(g5q_n => srcq, g5a => \-srcq\, g6q_n => \-alu31\);
--  qctl_2a04 : sn74s08 port map(g4q => qdrive, g4a => tse2);
--  qctl_1a18 : sn74s00 port map(g3q_n => \-qdrive\, g3b => tse2, g3a => srcq);
--  qctl_2b19 : sn7428 port map(g3a => \-iralu\, g3b => \-ir1\, g3q_n => qs1, g4a => \-iralu\, g4b => \-ir0\);
--  qctl_1f08 : sn74s241 port map(aenb_n => \-qdrive\, q7 => mf24, q6 => mf25, q5 => mf26, q4 => mf27, q3 => mf28, q2 => mf29, q1 => mf30, q0 => mf31);
--  qctl_1f10 : sn74s241 port map(aenb_n => \-qdrive\, q7 => mf16, q6 => mf17, q5 => mf18, q4 => mf19, q3 => mf20, q2 => mf21, q1 => mf22, q0 => mf23);
--  qctl_1f15 : sn74s241 port map(aenb_n => \-qdrive\, q7 => mf8, q6 => mf9, q5 => mf10, q4 => mf11, q3 => mf12, q2 => mf13, q1 => mf14, q0 => mf15);
--  qctl_1e12 : sn74s241 port map(aenb_n => \-qdrive\, q7 => mf0, q6 => mf1, q5 => mf2, q4 => mf3, q3 => mf4, q2 => mf5, q1 => mf6, q0 => mf7);

--  q_2c27 : sn74s194 port map(clr_n => hi7, sir => \-alu31\, i0 => alu0, i1 => alu1, i2 => alu2, i3 => alu3, sil => q4, s0 => qs0, s1 => qs1, clk => clk2b, q3 => q3, q2 => q2, q1 => q1);
--  q_2c28 : sn74s194 port map(clr_n => hi7, sir => q3, i0 => alu4, i1 => alu5, i2 => alu6, i3 => alu7, sil => q8, s0 => qs0, s1 => qs1, clk => clk2b, q3 => q7, q2 => q6, q1 => q5);
--  q_2c22 : sn74s194 port map(clr_n => hi7, sir => q7, i0 => alu8, i1 => alu9, i2 => alu10, i3 => alu11, sil => q12, s0 => qs0, s1 => qs1, clk => clk2b, q3 => q11, q2 => q10, q1 => q9);
--  q_2c23 : sn74s194 port map(clr_n => hi7, sir => q11, i0 => alu12, i1 => alu13, i2 => alu14, i3 => alu15, sil => q16, s0 => qs0, s1 => qs1, clk => clk2b, q3 => q15, q2 => q14, q1 => q13);
--  q_2c12 : sn74s194 port map(clr_n => hi7, sir => q15, i0 => alu16, i1 => alu17, i2 => alu18, i3 => alu19, sil => q20, s0 => qs0, s1 => qs1, clk => clk2b, q3 => q19, q2 => q18, q1 => q17);
--  q_2c13 : sn74s194 port map(clr_n => hi7, sir => q19, i0 => alu20, i1 => alu21, i2 => alu22, i3 => alu23, sil => q24, s0 => qs0, s1 => qs1, clk => clk2b, q3 => q23, q2 => q22, q1 => q21);
--  q_2c07 : sn74s194 port map(clr_n => hi7, sir => q23, i0 => alu24, i1 => alu25, i2 => alu26, i3 => alu27, sil => q28, s0 => qs0, s1 => qs1, clk => clk2b, q3 => q27, q2 => q26, q1 => q25);
--  q_2c08 : sn74s194 port map(clr_n => hi7, sir => q27, i0 => alu28, i1 => alu29, i2 => alu30, i3 => alu31, sil => alu0, s0 => qs0, s1 => qs1, clk => clk2b, q3 => q31, q2 => q30, q1 => q29);

  --- The L Register

--  l_4c03 : 93s48 port map(i6 => l5, i5 => l6, i4 => l7, i3 => l8, i2 => l9, i1 => l10, i0 => l11, po => lparl, pe => nc, i11 => l0, i10 => l1, i9 => l2, i8 => l3);
--  l_4c08 : 93s48 port map(i6 => l17, i5 => l18, i4 => l19, i3 => l20, i2 => l21, i1 => l22, i0 => l23, po => nc, pe => \-lparm\, i11 => l12, i10 => l13, i9 => l14, i8 => l15);
--  l_4c09 : 93s48 port map(i6 => l25, i5 => l26, i4 => l27, i3 => l28, i2 => l29, i1 => l30, i0 => l31, po => lparity, pe => \-lparity\, i11 => lparl, i10 => \-lparm\, i9 => gnd, i8 => gnd);
--  l_3c29 : sn74s374 port map(oenb_n => gnd, o0 => l31, i0 => ob31, i1 => ob30, o1 => l30, o2 => l29, i2 => ob29, i3 => ob28, o3 => l28, clk => clk3f, o4 => l27, i4 => ob27, i5 => ob26, o5 => l26, o6 => l25, i6 => ob25, i7 => ob24);
--  l_3c28 : sn74s374 port map(oenb_n => gnd, o0 => l23, i0 => ob23, i1 => ob22, o1 => l22, o2 => l21, i2 => ob21, i3 => ob20, o3 => l20, clk => clk3f, o4 => l19, i4 => ob19, i5 => ob18, o5 => l18, o6 => l17, i6 => ob17, i7 => ob16);
--  l_3c27 : sn74s374 port map(oenb_n => gnd, o0 => l15, i0 => ob15, i1 => ob14, o1 => l14, o2 => l13, i2 => ob13, i3 => ob12, o3 => l12, clk => clk3f, o4 => l11, i4 => ob11, i5 => ob10, o5 => l10, o6 => l9, i6 => ob9, i7 => ob8);
--  l_3c26 : sn74s374 port map(oenb_n => gnd, o0 => l7, i0 => ob7, i1 => ob6, o1 => l6, o2 => l5, i2 => ob5, i3 => ob4, o3 => l4, clk => clk3f, o4 => l3, i4 => ob3, i5 => ob2, o5 => l2, o6 => l1, i6 => ob1, i7 => ob0);

  --- The Dispatch Memory

--  dspctl_3f11 : sn74s241 port map(aenb_n => hi4, q7 => aa16, q6 => aa17, q5 => nc, q4 => nc, q3 => nc, q2 => nc, q1 => nc, q0 => nc);
--  dspctl_3f12 : sn74s241 port map(aenb_n => gnd, q7 => aa8, q6 => aa9, q5 => aa10, q4 => aa11, q3 => aa12, q2 => aa13, q1 => aa14, q0 => aa15);
--  dspctl_3f13 : sn74s241 port map(aenb_n => gnd, q7 => aa0, q6 => aa1, q5 => aa2, q4 => aa3, q3 => aa4, q2 => aa5, q1 => aa6, q0 => aa7);
--  dspctl_3d02 : sn74s00 port map(g1b => dpareven, g1a => dispenb, g1q_n => dparok);
--  dspctl_3e19 : sn74s86 port map(g3y => dpareven, g3a => \-dparh\, g3b => dparl);
--  dspctl_4f10 : sn74s280 port map(i0 => dpc0, i1 => dpc1, i2 => dpc2, even => nc, odd => dparl, i3 => dpc3, i4 => dpc4, i5 => dpc5, i6 => dpc6, i7 => dpc7);
--  dspctl_4f09 : sn74s280 port map(i0 => dpc9, i1 => dpc10, i2 => dpc11, even => \-dparh\, odd => nc, i3 => dpc12, i4 => dpc13, i5 => dn, i6 => dp, i7 => dr);
--  dspctl_3f14 : sn74s02 port map(g1q_n => \-dmapbenb\, g1a => ir8, g1b => ir9, g2q_n => dispwr, g2a => \-irdisp\, g2b => \-funct2\);
--  dspctl_3c15 : 25s07 port map(enb_n => \-irdisp\, d0 => dc0, i0 => ir32, i1 => ir33, d1 => dc1, i2 => ir34, d2 => dc2, clk => clk3e, d3 => dc3, i3 => ir35, d4 => dc4, i4 => ir36, i5 => ir37);
--  dspctl_3c14 : 25s07 port map(enb_n => \-irdisp\, d0 => dc6, i0 => ir38, i1 => ir39, d1 => dc7, i2 => ir40, d2 => dc8, clk => clk3e, d3 => dc9, i3 => ir41, d4 => nc, i4 => nc, i5 => nc);
--  dspctl_2f22 : 5610 port map(o0 => dmask0, o1 => dmask1, o2 => dmask2, o3 => dmask3, o4 => dmask4, o5 => dmask5, o6 => dmask6, o7 => nc, a0 => ir5, a1 => ir6, a2 => ir7, a3 => gnd, a4 => gnd);

--  dram0_2f25 : sn74s241 port map(aenb_n => gnd, q7 => ir19b, q6 => ir18b, q5 => ir17b, q4 => ir16b, q3 => ir15b, q2 => ir14b, q1 => ir13b, q0 => ir12b);
--  dram0_2f03 : sn74s37 port map(g1a => wp2, g1b => dispwr, g1y => \-dwea\);
--  dram0_2f21 : sn74s04 port map(g1a => nc, g1q_n => nc, g2a => \-dadr10a\, g2q_n => dadr10a, g3a => ir22b, g3q_n => \-dadr10a\, g4q => \-dadr9a\, g4a => ir21b, g5q_n => \-dadr8a\, g5a => ir20b, g6q_n => \-dadr7a\);
--  dram0_2f24 : sn74s64 port map(d4 => ir12b, b2 => vmo19, a2 => ir9b, c3 => r0, b3 => dmask0, a3 => \-dmapbenb\, out => \-dadr0a\, a1 => vmo18, b1 => ir8b, c4 => hi6, b4 => hi6);
--  dram0_3f10 : sn74s51 port map(g1a => r1, g2a => ir16b, g2b => hi4, g2c => dmask4, g2d => r4, g2y => \-dadr4a\, g1y => \-dadr1a\, g1c => ir13b, g1d => hi4);
--  dram0_3f05 : sn74s51 port map(g1a => r2, g2a => ir17b, g2b => hi4, g2c => dmask5, g2d => r5, g2y => \-dadr5a\, g1y => \-dadr2a\, g1c => ir14b, g1d => hi4);
--  dram0_2f30 : sn74s51 port map(g1a => r3, g2a => ir18b, g2b => hi6, g2c => dmask6, g2d => r6, g2y => \-dadr6a\, g1y => \-dadr3a\, g1c => ir15b, g1d => hi6);
--  dram0_2f26 : 93425a port map(ce_n => dadr10a, a0 => \-dadr0a\, a1 => \-dadr1a\, a2 => \-dadr2a\, a3 => \-dadr3a\, a4 => \-dadr4a\, d0 => dpc5, a5 => \-dadr5a\, a6 => \-dadr6a\, a7 => \-dadr7a\, a8 => \-dadr8a\, a9 => \-dadr9a\, we_n => \-dwea\);
--  dram0_2f28 : 93425a port map(ce_n => dadr10a, a0 => \-dadr0a\, a1 => \-dadr1a\, a2 => \-dadr2a\, a3 => \-dadr3a\, a4 => \-dadr4a\, d0 => dpc4, a5 => \-dadr5a\, a6 => \-dadr6a\, a7 => \-dadr7a\, a8 => \-dadr8a\, a9 => \-dadr9a\, we_n => \-dwea\);
--  dram0_3f01 : 93425a port map(ce_n => dadr10a, a0 => \-dadr0a\, a1 => \-dadr1a\, a2 => \-dadr2a\, a3 => \-dadr3a\, a4 => \-dadr4a\, d0 => dpc3, a5 => \-dadr5a\, a6 => \-dadr6a\, a7 => \-dadr7a\, a8 => \-dadr8a\, a9 => \-dadr9a\, we_n => \-dwea\);
--  dram0_3f03 : 93425a port map(ce_n => dadr10a, a0 => \-dadr0a\, a1 => \-dadr1a\, a2 => \-dadr2a\, a3 => \-dadr3a\, a4 => \-dadr4a\, d0 => dpc2, a5 => \-dadr5a\, a6 => \-dadr6a\, a7 => \-dadr7a\, a8 => \-dadr8a\, a9 => \-dadr9a\, we_n => \-dwea\);
--  dram0_3f06 : 93425a port map(ce_n => dadr10a, a0 => \-dadr0a\, a1 => \-dadr1a\, a2 => \-dadr2a\, a3 => \-dadr3a\, a4 => \-dadr4a\, d0 => dpc1, a5 => \-dadr5a\, a6 => \-dadr6a\, a7 => \-dadr7a\, a8 => \-dadr8a\, a9 => \-dadr9a\, we_n => \-dwea\);
--  dram0_3f08 : 93425a port map(ce_n => dadr10a, a0 => \-dadr0a\, a1 => \-dadr1a\, a2 => \-dadr2a\, a3 => \-dadr3a\, a4 => \-dadr4a\, d0 => dpc0, a5 => \-dadr5a\, a6 => \-dadr6a\, a7 => \-dadr7a\, a8 => \-dadr8a\, a9 => \-dadr9a\, we_n => \-dwea\);
--  dram0_2f27 : 93425a port map(ce_n => \-dadr10a\, a0 => \-dadr0a\, a1 => \-dadr1a\, a2 => \-dadr2a\, a3 => \-dadr3a\, a4 => \-dadr4a\, d0 => dpc5, a5 => \-dadr5a\, a6 => \-dadr6a\, a7 => \-dadr7a\, a8 => \-dadr8a\, a9 => \-dadr9a\, we_n => \-dwea\);
--  dram0_2f29 : 93425a port map(ce_n => \-dadr10a\, a0 => \-dadr0a\, a1 => \-dadr1a\, a2 => \-dadr2a\, a3 => \-dadr3a\, a4 => \-dadr4a\, d0 => dpc4, a5 => \-dadr5a\, a6 => \-dadr6a\, a7 => \-dadr7a\, a8 => \-dadr8a\, a9 => \-dadr9a\, we_n => \-dwea\);
--  dram0_3f02 : 93425a port map(ce_n => \-dadr10a\, a0 => \-dadr0a\, a1 => \-dadr1a\, a2 => \-dadr2a\, a3 => \-dadr3a\, a4 => \-dadr4a\, d0 => dpc3, a5 => \-dadr5a\, a6 => \-dadr6a\, a7 => \-dadr7a\, a8 => \-dadr8a\, a9 => \-dadr9a\, we_n => \-dwea\);
--  dram0_3f04 : 93425a port map(ce_n => \-dadr10a\, a0 => \-dadr0a\, a1 => \-dadr1a\, a2 => \-dadr2a\, a3 => \-dadr3a\, a4 => \-dadr4a\, d0 => dpc2, a5 => \-dadr5a\, a6 => \-dadr6a\, a7 => \-dadr7a\, a8 => \-dadr8a\, a9 => \-dadr9a\, we_n => \-dwea\);
--  dram0_3f07 : 93425a port map(ce_n => \-dadr10a\, a0 => \-dadr0a\, a1 => \-dadr1a\, a2 => \-dadr2a\, a3 => \-dadr3a\, a4 => \-dadr4a\, d0 => dpc1, a5 => \-dadr5a\, a6 => \-dadr6a\, a7 => \-dadr7a\, a8 => \-dadr8a\, a9 => \-dadr9a\, we_n => \-dwea\);
--  dram0_3f09 : 93425a port map(ce_n => \-dadr10a\, a0 => \-dadr0a\, a1 => \-dadr1a\, a2 => \-dadr2a\, a3 => \-dadr3a\, a4 => \-dadr4a\, d0 => dpc0, a5 => \-dadr5a\, a6 => \-dadr6a\, a7 => \-dadr7a\, a8 => \-dadr8a\, a9 => \-dadr9a\, we_n => \-dwea\);

--  dram1_2f23 : sn74s241 port map(aenb_n => gnd, q7 => nc, q6 => nc, q5 => nc, q4 => ir9b, q3 => ir8b, q2 => ir22b, q1 => ir21b, q0 => ir20b);
--  dram1_2f03 : sn74s37 port map(g2a => wp2, g2b => dispwr, g2y => \-dweb\);
--  dram1_2f04 : sn74s04 port map(g1a => nc, g1q_n => nc, g2a => \-vmo19\, g2q_n => vmo19, g3a => \-vmo18\, g3q_n => vmo18, g4q => \-dadr9b\, g4a => ir21b, g5q_n => \-dadr8b\, g5a => ir20b, g6q_n => \-dadr7b\);
--  dram1_2f05 : sn74s64 port map(d4 => ir12b, b2 => vmo19, a2 => ir9b, c3 => r0, b3 => dmask0, a3 => \-dmapbenb\, out => \-dadr0b\, a1 => vmo18, b1 => ir8b, c4 => hi6, b4 => hi6);
--  dram1_2f20 : sn74s51 port map(g1a => r1, g2a => ir16b, g2b => hi6, g2c => dmask4, g2d => r4, g2y => \-dadr4b\, g1y => \-dadr1b\, g1c => ir13b, g1d => hi6);
--  dram1_2f15 : sn74s51 port map(g1a => r2, g2a => ir17b, g2b => hi6, g2c => dmask5, g2d => r5, g2y => \-dadr5b\, g1y => \-dadr2b\, g1c => ir14b, g1d => hi6);
--  dram1_2f10 : sn74s51 port map(g1a => r3, g2a => ir18b, g2b => hi6, g2c => dmask6, g2d => r6, g2y => \-dadr6b\, g1y => \-dadr3b\, g1c => ir15b, g1d => hi6);
--  dram1_2f06 : 93425a port map(ce_n => dadr10a, a0 => \-dadr0b\, a1 => \-dadr1b\, a2 => \-dadr2b\, a3 => \-dadr3b\, a4 => \-dadr4b\, d0 => dpc11, a5 => \-dadr5b\, a6 => \-dadr6b\, a7 => \-dadr7b\, a8 => \-dadr8b\, a9 => \-dadr9b\, we_n => \-dweb\);
--  dram1_2f08 : 93425a port map(ce_n => dadr10a, a0 => \-dadr0b\, a1 => \-dadr1b\, a2 => \-dadr2b\, a3 => \-dadr3b\, a4 => \-dadr4b\, d0 => dpc10, a5 => \-dadr5b\, a6 => \-dadr6b\, a7 => \-dadr7b\, a8 => \-dadr8b\, a9 => \-dadr9b\, we_n => \-dweb\);
--  dram1_2f11 : 93425a port map(ce_n => dadr10a, a0 => \-dadr0b\, a1 => \-dadr1b\, a2 => \-dadr2b\, a3 => \-dadr3b\, a4 => \-dadr4b\, d0 => dpc9, a5 => \-dadr5b\, a6 => \-dadr6b\, a7 => \-dadr7b\, a8 => \-dadr8b\, a9 => \-dadr9b\, we_n => \-dweb\);
--  dram1_2f13 : 93425a port map(ce_n => dadr10c, a0 => \-dadr0b\, a1 => \-dadr1b\, a2 => \-dadr2b\, a3 => \-dadr3b\, a4 => \-dadr4b\, d0 => dpc8, a5 => \-dadr5b\, a6 => \-dadr6b\, a7 => \-dadr7b\, a8 => \-dadr8b\, a9 => \-dadr9b\, we_n => \-dweb\);
--  dram1_2f16 : 93425a port map(ce_n => dadr10c, a0 => \-dadr0b\, a1 => \-dadr1b\, a2 => \-dadr2b\, a3 => \-dadr3b\, a4 => \-dadr4b\, d0 => dpc7, a5 => \-dadr5b\, a6 => \-dadr6b\, a7 => \-dadr7b\, a8 => \-dadr8b\, a9 => \-dadr9b\, we_n => \-dweb\);
--  dram1_2f18 : 93425a port map(ce_n => dadr10c, a0 => \-dadr0b\, a1 => \-dadr1b\, a2 => \-dadr2b\, a3 => \-dadr3b\, a4 => \-dadr4b\, d0 => dpc6, a5 => \-dadr5b\, a6 => \-dadr6b\, a7 => \-dadr7b\, a8 => \-dadr8b\, a9 => \-dadr9b\, we_n => \-dweb\);
--  dram1_2f07 : 93425a port map(ce_n => \-dadr10a\, a0 => \-dadr0b\, a1 => \-dadr1b\, a2 => \-dadr2b\, a3 => \-dadr3b\, a4 => \-dadr4b\, d0 => dpc11, a5 => \-dadr5b\, a6 => \-dadr6b\, a7 => \-dadr7b\, a8 => \-dadr8b\, a9 => \-dadr9b\, we_n => \-dweb\);
--  dram1_2f09 : 93425a port map(ce_n => \-dadr10a\, a0 => \-dadr0b\, a1 => \-dadr1b\, a2 => \-dadr2b\, a3 => \-dadr3b\, a4 => \-dadr4b\, d0 => dpc10, a5 => \-dadr5b\, a6 => \-dadr6b\, a7 => \-dadr7b\, a8 => \-dadr8b\, a9 => \-dadr9b\, we_n => \-dweb\);
--  dram1_2f12 : 93425a port map(ce_n => \-dadr10a\, a0 => \-dadr0b\, a1 => \-dadr1b\, a2 => \-dadr2b\, a3 => \-dadr3b\, a4 => \-dadr4b\, d0 => dpc9, a5 => \-dadr5b\, a6 => \-dadr6b\, a7 => \-dadr7b\, a8 => \-dadr8b\, a9 => \-dadr9b\, we_n => \-dweb\);
--  dram1_2f14 : 93425a port map(ce_n => \-dadr10c\, a0 => \-dadr0b\, a1 => \-dadr1b\, a2 => \-dadr2b\, a3 => \-dadr3b\, a4 => \-dadr4b\, d0 => dpc8, a5 => \-dadr5b\, a6 => \-dadr6b\, a7 => \-dadr7b\, a8 => \-dadr8b\, a9 => \-dadr9b\, we_n => \-dweb\);
--  dram1_2f17 : 93425a port map(ce_n => \-dadr10c\, a0 => \-dadr0b\, a1 => \-dadr1b\, a2 => \-dadr2b\, a3 => \-dadr3b\, a4 => \-dadr4b\, d0 => dpc7, a5 => \-dadr5b\, a6 => \-dadr6b\, a7 => \-dadr7b\, a8 => \-dadr8b\, a9 => \-dadr9b\, we_n => \-dweb\);
--  dram1_2f19 : 93425a port map(ce_n => \-dadr10c\, a0 => \-dadr0b\, a1 => \-dadr1b\, a2 => \-dadr2b\, a3 => \-dadr3b\, a4 => \-dadr4b\, d0 => dpc6, a5 => \-dadr5b\, a6 => \-dadr6b\, a7 => \-dadr7b\, a8 => \-dadr8b\, a9 => \-dadr9b\, we_n => \-dweb\);

--  dram2_2f03 : sn74s37 port map(g3y => \-dwec\, g3a => dispwr, g3b => wp2);
--  dram2_2f02 : sn74s04 port map(g1a => nc, g1q_n => nc, g2a => \-dadr10c\, g2q_n => dadr10c, g3a => ir22b, g3q_n => \-dadr10c\, g4q => \-dadr9c\, g4a => ir21b, g5q_n => \-dadr8c\, g5a => ir20b, g6q_n => \-dadr7c\);
--  dram2_2f01 : sn74s64 port map(d4 => ir12b, b2 => vmo19, a2 => ir9b, c3 => r0, b3 => dmask0, a3 => \-dmapbenb\, out => \-dadr0c\, a1 => vmo18, b1 => ir8b, c4 => hi6, b4 => hi6);
--  dram2_1f30 : sn74s51 port map(g1a => r1, g2a => ir16b, g2b => hi11, g2c => dmask4, g2d => r4, g2y => \-dadr4c\, g1y => \-dadr1c\, g1c => ir13b, g1d => hi11);
--  dram2_1f25 : sn74s51 port map(g1a => r2, g2a => ir17b, g2b => hi11, g2c => dmask5, g2d => r5, g2y => \-dadr5c\, g1y => \-dadr2c\, g1c => ir14b, g1d => hi11);
--  dram2_1f20 : sn74s51 port map(g1a => r3, g2a => ir18b, g2b => hi11, g2c => dmask6, g2d => r6, g2y => \-dadr6c\, g1y => \-dadr3c\, g1c => ir15b, g1d => hi11);
--  dram2_1f16 : 93425a port map(ce_n => dadr10c, a0 => \-dadr0c\, a1 => \-dadr1c\, a2 => \-dadr2c\, a3 => \-dadr3c\, a4 => \-dadr4c\, d0 => dpar, a5 => \-dadr5c\, a6 => \-dadr6c\, a7 => \-dadr7c\, a8 => \-dadr8c\, a9 => \-dadr9c\, we_n => \-dwec\);
--  dram2_1f18 : 93425a port map(ce_n => dadr10c, a0 => \-dadr0c\, a1 => \-dadr1c\, a2 => \-dadr2c\, a3 => \-dadr3c\, a4 => \-dadr4c\, d0 => dr, a5 => \-dadr5c\, a6 => \-dadr6c\, a7 => \-dadr7c\, a8 => \-dadr8c\, a9 => \-dadr9c\, we_n => \-dwec\);
--  dram2_1f21 : 93425a port map(ce_n => dadr10c, a0 => \-dadr0c\, a1 => \-dadr1c\, a2 => \-dadr2c\, a3 => \-dadr3c\, a4 => \-dadr4c\, d0 => dp, a5 => \-dadr5c\, a6 => \-dadr6c\, a7 => \-dadr7c\, a8 => \-dadr8c\, a9 => \-dadr9c\, we_n => \-dwec\);
--  dram2_1f23 : 93425a port map(ce_n => dadr10c, a0 => \-dadr0c\, a1 => \-dadr1c\, a2 => \-dadr2c\, a3 => \-dadr3c\, a4 => \-dadr4c\, d0 => dn, a5 => \-dadr5c\, a6 => \-dadr6c\, a7 => \-dadr7c\, a8 => \-dadr8c\, a9 => \-dadr9c\, we_n => \-dwec\);
--  dram2_1f26 : 93425a port map(ce_n => dadr10c, a0 => \-dadr0c\, a1 => \-dadr1c\, a2 => \-dadr2c\, a3 => \-dadr3c\, a4 => \-dadr4c\, d0 => dpc13, a5 => \-dadr5c\, a6 => \-dadr6c\, a7 => \-dadr7c\, a8 => \-dadr8c\, a9 => \-dadr9c\, we_n => \-dwec\);
--  dram2_1f28 : 93425a port map(ce_n => dadr10c, a0 => \-dadr0c\, a1 => \-dadr1c\, a2 => \-dadr2c\, a3 => \-dadr3c\, a4 => \-dadr4c\, d0 => dpc12, a5 => \-dadr5c\, a6 => \-dadr6c\, a7 => \-dadr7c\, a8 => \-dadr8c\, a9 => \-dadr9c\, we_n => \-dwec\);
--  dram2_1f17 : 93425a port map(ce_n => \-dadr10c\, a0 => \-dadr0c\, a1 => \-dadr1c\, a2 => \-dadr2c\, a3 => \-dadr3c\, a4 => \-dadr4c\, d0 => dpar, a5 => \-dadr5c\, a6 => \-dadr6c\, a7 => \-dadr7c\, a8 => \-dadr8c\, a9 => \-dadr9c\, we_n => \-dwec\);
--  dram2_1f19 : 93425a port map(ce_n => \-dadr10c\, a0 => \-dadr0c\, a1 => \-dadr1c\, a2 => \-dadr2c\, a3 => \-dadr3c\, a4 => \-dadr4c\, d0 => dr, a5 => \-dadr5c\, a6 => \-dadr6c\, a7 => \-dadr7c\, a8 => \-dadr8c\, a9 => \-dadr9c\, we_n => \-dwec\);
--  dram2_1f22 : 93425a port map(ce_n => \-dadr10c\, a0 => \-dadr0c\, a1 => \-dadr1c\, a2 => \-dadr2c\, a3 => \-dadr3c\, a4 => \-dadr4c\, d0 => dp, a5 => \-dadr5c\, a6 => \-dadr6c\, a7 => \-dadr7c\, a8 => \-dadr8c\, a9 => \-dadr9c\, we_n => \-dwec\);
--  dram2_1f24 : 93425a port map(ce_n => \-dadr10c\, a0 => \-dadr0c\, a1 => \-dadr1c\, a2 => \-dadr2c\, a3 => \-dadr3c\, a4 => \-dadr4c\, d0 => dn, a5 => \-dadr5c\, a6 => \-dadr6c\, a7 => \-dadr7c\, a8 => \-dadr8c\, a9 => \-dadr9c\, we_n => \-dwec\);
--  dram2_1f27 : 93425a port map(ce_n => \-dadr10c\, a0 => \-dadr0c\, a1 => \-dadr1c\, a2 => \-dadr2c\, a3 => \-dadr3c\, a4 => \-dadr4c\, d0 => dpc13, a5 => \-dadr5c\, a6 => \-dadr6c\, a7 => \-dadr7c\, a8 => \-dadr8c\, a9 => \-dadr9c\, we_n => \-dwec\);
--  dram2_1f29 : 93425a port map(ce_n => \-dadr10c\, a0 => \-dadr0c\, a1 => \-dadr1c\, a2 => \-dadr2c\, a3 => \-dadr3c\, a4 => \-dadr4c\, d0 => dpc12, a5 => \-dadr5c\, a6 => \-dadr6c\, a7 => \-dadr7c\, a8 => \-dadr8c\, a9 => \-dadr9c\, we_n => \-dwec\);

  --- Jump Conditions

--  flag_3e08 : 25ls2519 port map(i0 => ob29, q0a => nc, q0b => lc_byte_mode, i1 => ob28, q1a => nc, q1b => prog.unibus.reset, o_enb_n => hi4, out_enb_n => gnd, clk => clk3c, q2b => int.enable, q2a => nc, i2 => ob27, q3b => sequence.break, q3a => nc, i3 => ob26, clk_enb_n => \-destintctl\, inv => hi4);
--  flag_4d09 : sn74s08 port map(g3q => sint, g3a => int.enable, g3b => sintr);
--  flag_3e07 : sn74s00 port map(g1b => ir45, g1a => \-nopa\, g1q_n => \-ilong\);
--  flag_3e11 : sn74s00 port map(g4q_n => \-statbit\, g4a => \-nopa\);
--  flag_3e22 : sn74s04 port map(g4q => \-alu32\, g4a => alu32);
--  flag_3e18 : sn74s32 port map(g2a => \-vmaok\, g2b => sint, g2y => pgf.or.int, g3a => sequence.break, g3b => sint, g4y => pgf.or.int.or.sb, g4a => internal33);
--  flag_3e14 : sn74s08 port map(g1b => ir2, g1a => ir5, g1q => conds2, g2b => ir1, g2a => ir5, g2q => conds1, g3q => conds0, g3a => ir5, g3b => ir0);
--  flag_3e13 : sn74s151 port map(i3 => aeqm, i2 => alu32, i1 => aluneg, i0 => r0, q => jcond, q_n => \-jcond\, ce_n => gnd, sel2 => conds2, sel1 => conds1, sel0 => conds0, i7 => hi4, i6 => pgf.or.int.or.sb, i5 => pgf.or.int);
--  flag_3e17 : sn74s02 port map(g4b => \-alu32\, g4a => aeqm);

  --- Flow of Control

--  contrl_3e18 : sn74s32 port map(g1a => \-irdisp\, g1b => dr, g1y => \-ignpopj\);
--  contrl_3e29 : sn74s11 port map(g1a => \-ir8\, g1b => irjump, g2a => irjump, g2b => ir8, g2c => ir9, g2y_n => iwrite, g1y_n => jret);
--  contrl_3e24 : sn74s08 port map(g1b => irdisp, g1a => \-funct2\, g1q => dispenb, g2b => irjump, g2a => ir6, g2q => jfalse, g3q => jcalf, g3a => ir8, g3b => jfalse, g4q => jretf, g4a => ir6);
--  contrl_3f20 : sn74s04 port map(g1a => \-popj\, g1q_n => popj, g2a => ir8, g2q_n => \-ir8\, g3a => ir6, g3q_n => \-ir6\, g4q => spush, g4a => \-spush\, g5q_n => \-dp\, g5a => dp, g6q_n => \-dr\);
--  contrl_3e09 : sn74s32 port map(g1a => \-srcspcpop\, g1b => nop, g1y => \-srcspcpopreal\);
--  contrl_4d09 : sn74s08 port map(g1b => \-spush\, g1a => \-spop\, g1q => \-spcnt\);
--  contrl_3e26 : sn74s64 port map(d4 => jcond, b2 => \-jcond\, a2 => jcalf, c3 => \-dr\, b3 => dp, a3 => dispenb, out => \-spush\, a1 => hi4, b1 => destspc, c4 => ir8, b4 => \-ir6\);
--  contrl_3e28 : sn74s64 port map(d4 => hi4, b2 => \-jcond\, a2 => jretf, c3 => jcond, b3 => \-ir6\, a3 => jret, out => \-spop\, a1 => \-ignpopj\, c4 => \-dp\, b4 => dr);
--  contrl_3e25 : sn74s64 port map(d4 => ir7, b2 => dn, a2 => dispenb, c3 => ir7, b3 => \-jcond\, a3 => jfalse, a1 => hi4, b1 => iwrited, c4 => jcond, b4 => \-ir6\);
--  contrl_3f30 : sn74s64 port map(d4 => hi4, b2 => \-dfall\, a2 => dispenb, c3 => hi4, b3 => \-jcond\, a3 => jretf, out => pcs0, a1 => hi4, b1 => popj, c4 => jcond, b4 => \-ir6\);
--  contrl_3e27 : sn74s64 port map(d4 => hi4, b2 => \-jcond\, a2 => jfalse, c3 => jcond, b3 => \-ir6\, a3 => irjump, out => pcs1, a1 => \-ignpopj\, b1 => popj, c4 => \-dp\, b4 => dr);
--  contrl_3e14 : sn74s08 port map(g4q => \-nopa\, g4a => \-nop11\);
--  contrl_3e23 : sn74s00 port map(g1b => dr, g1a => dp, g1q_n => \-dfall\, g2b => \-trap\, g2a => internal35, g2q_n => n, g3q_n => internal34, g3b => \-popj\, g3a => \-srcspcpopreal\, g4q_n => nop, g4a => \-trap\);
--  contrl_3d28 : sn74s00 port map(g1b => \-srcspc\, g1a => \-srcspcpop\, g1q_n => spcenb, g2b => spcenb, g2a => tse3a, g2q_n => \-spcdrive\, g3q_n => \-spcpass\, g3b => tse3a, g3a => \-spushd\, g4q_n => \-spcwpass\, g4a => tse3a);
--  contrl_3e07 : sn74s00 port map(g2b => ir42, g2a => \-nop\, g2q_n => \-ipopj\);
--  contrl_3e22 : sn74s04 port map(g1a => \-destspc\, g1q_n => destspc, g2a => nop, g2q_n => \-nop\);
--  contrl_4e30 : sn74s37 port map(g1a => \-destspcd\, g1b => \-destspcd\, g1y => destspcd, g2a => wp4c, g2b => spushd, g2y => \-swpb\, g3y => \-swpa\, g3a => spushd, g3b => wp4c);
--  contrl_3d21 : sn74s08 port map(g1b => spushd, g1a => tse3a, g1q => spcwpass, g2b => \-ipopj\, g2a => \-iwrited\, g2q => \-popj\, g3q => spcdrive, g3a => spcenb, g3b => tse3a);
--  contrl_3d26 : sn74s175 port map(clr_n => \-reset\, q0 => inop, q0_n => \-inop\, d0 => n, d1 => nc, q1_n => nc, q1 => nc, clk => clk3c, q2 => spushd, q2_n => \-spushd\, d2 => spush, d3 => iwrite, q3_n => \-iwrited\);

  --- Microcode Subroutine Return Stack

--  spc_4e29 : res20 port map(r2 => spco9, r3 => spco8, r4 => spco7, r5 => spco6, r6 => spco5, r7 => hi8, r8 => hi9, r9 => hi10, r11 => hi11, r12 => hi12, r13 => nc, r14 => nc, r15 => spco4, r16 => spco3, r17 => spco2, r18 => spco1);
--  spc_4e24 : res20 port map(r2 => spcopar, r3 => spco18, r4 => spco17, r5 => spco16, r6 => spco15, r7 => hi1, r8 => hi2, r9 => hi3, r11 => hi4, r12 => hi5, r13 => hi6, r14 => hi7, r15 => spco14, r16 => spco13, r17 => spco12, r18 => spco11);
--  spc_4e28 : 82s21 port map(wclk_n => \-swpb\, we0_n => gnd, i0 => spcw0, a4 => spcptr4, ce => hi1, d0 => spco0, d1 => spco1, a3 => spcptr3, a2 => spcptr2, a1 => spcptr1, a0 => spcptr0, i1 => spcw1);
--  spc_4e27 : 82s21 port map(wclk_n => \-swpb\, we0_n => gnd, i0 => spcw2, a4 => spcptr4, ce => hi1, d0 => spco2, d1 => spco3, a3 => spcptr3, a2 => spcptr2, a1 => spcptr1, a0 => spcptr0, i1 => spcw3);
--  spc_4e26 : 82s21 port map(wclk_n => \-swpb\, we0_n => gnd, i0 => spcw4, a4 => spcptr4, ce => hi1, d0 => spco4, d1 => spco5, a3 => spcptr3, a2 => spcptr2, a1 => spcptr1, a0 => spcptr0, i1 => spcw5);
--  spc_4f30 : 82s21 port map(wclk_n => \-swpb\, we0_n => gnd, i0 => spcw6, a4 => spcptr4, ce => hi1, d0 => spco6, d1 => spco7, a3 => spcptr3, a2 => spcptr2, a1 => spcptr1, a0 => spcptr0, i1 => spcw7);
--  spc_4f29 : 82s21 port map(wclk_n => \-swpb\, we0_n => gnd, i0 => spcw8, a4 => spcptr4, ce => hi1, d0 => spco8, d1 => spco9, a3 => spcptr3, a2 => spcptr2, a1 => spcptr1, a0 => spcptr0, i1 => spcw9);
--  spc_4f24 : 82s21 port map(wclk_n => \-swpa\, we0_n => gnd, i0 => spcw18, a4 => spcptr4, ce => hi1, d0 => spco18, d1 => spcopar, a3 => spcptr3, a2 => spcptr2, a1 => spcptr1, a0 => spcptr0, i1 => spcwpar);
--  spc_4f25 : 82s21 port map(wclk_n => \-swpa\, we0_n => gnd, i0 => spcw16, a4 => spcptr4, ce => hi1, d0 => spco16, d1 => spco17, a3 => spcptr3, a2 => spcptr2, a1 => spcptr1, a0 => spcptr0, i1 => spcw17);
--  spc_4e21 : 82s21 port map(wclk_n => \-swpa\, we0_n => gnd, i0 => spcw14, a4 => spcptr4, ce => hi1, d0 => spco14, d1 => spco15, a3 => spcptr3, a2 => spcptr2, a1 => spcptr1, a0 => spcptr0, i1 => spcw15);
--  spc_4e22 : 82s21 port map(wclk_n => \-swpa\, we0_n => gnd, i0 => spcw12, a4 => spcptr4, ce => hi1, d0 => spco12, d1 => spco13, a3 => spcptr3, a2 => spcptr2, a1 => spcptr1, a0 => spcptr0, i1 => spcw13);
--  spc_4e23 : 82s21 port map(wclk_n => \-swpa\, we0_n => gnd, i0 => spcw10, a4 => spcptr4, ce => hi1, d0 => spco10, d1 => spco11, a3 => spcptr3, a2 => spcptr2, a1 => spcptr1, a0 => spcptr0, i1 => spcw11);
--  spc_4f28 : sn74s169 port map(up_dn => spush, clk => clk4f, i0 => nc, i1 => nc, i2 => nc, i3 => nc, enb_p_n => gnd, load_n => hi1, enb_t_n => \-spccry\, o3 => nc, o2 => nc, o1 => nc, o0 => spcptr4);
--  spc_4f23 : sn74s169 port map(up_dn => spush, clk => clk4f, i0 => nc, i1 => nc, i2 => nc, i3 => nc, enb_p_n => gnd, load_n => hi1, enb_t_n => \-spcnt\, o3 => spcptr3, o2 => spcptr2, o1 => spcptr1, o0 => spcptr0);

--  spclch_4b10 : sn74s241 port map(aenb_n => \-spcdrive\, q7 => m24, q6 => m25, q5 => m26, q4 => m27, q3 => m28, q2 => m29, q1 => m30, q0 => m31);
--  spclch_4a10 : sn74s373 port map(oenb_n => \-spcdrive\, o0 => m7, i0 => spco7, i1 => spco6, o1 => m6, o2 => m5, i2 => spco5, i3 => spco4, o3 => m4, hold_n => clk4c, o4 => m3, i4 => spco3, i5 => spco2, o5 => m2, o6 => m1, i6 => spco1, i7 => spco0);
--  spclch_4a09 : sn74s373 port map(oenb_n => \-spcdrive\, o0 => m15, i0 => spco15, i1 => spco14, o1 => m14, o2 => m13, i2 => spco13, i3 => spco12, o3 => m12, hold_n => clk4c, o4 => m11, i4 => spco11, i5 => spco10, o5 => m10, o6 => m9, i6 => spco9, i7 => spco8);
--  spclch_4a07 : sn74s373 port map(oenb_n => \-spcdrive\, o0 => m23, i0 => gnd, i1 => gnd, o1 => m22, o2 => m21, i2 => gnd, i3 => gnd, o3 => m20, hold_n => clk4c, o4 => m19, i4 => gnd, i5 => spco18, o5 => m18, o6 => m17, i6 => spco17, i7 => spco16);
--  spclch_4e16 : sn74s241 port map(aenb_n => hi1, q7 => spc16, q6 => spc17, q5 => spc18, q4 => spcpar, q3 => nc, q2 => nc, q1 => nc, q0 => nc);
--  spclch_4f18 : sn74s373 port map(oenb_n => \-spcpass\, o0 => nc, i0 => nc, i1 => nc, o1 => nc, o2 => nc, i2 => nc, i3 => nc, o3 => nc, hold_n => clk4d, o4 => spcpar, i4 => spcopar, i5 => spco18, o5 => spc18, o6 => spc17, i6 => spco17, i7 => spco16);
--  spclch_4f19 : sn74s373 port map(oenb_n => \-spcpass\, o0 => spc15, i0 => spco15, i1 => spco14, o1 => spc14, o2 => spc13, i2 => spco13, i3 => spco12, o3 => spc12, hold_n => clk4d, o4 => spc11, i4 => spco11, i5 => spco10, o5 => spc10, o6 => spc9, i6 => spco9, i7 => spco8);
--  spclch_4e17 : sn74s241 port map(aenb_n => \-spcwpass\, q7 => spc8, q6 => spc9, q5 => spc10, q4 => spc11, q3 => spc12, q2 => spc13, q1 => spc14, q0 => spc15);
--  spclch_4e18 : sn74s241 port map(aenb_n => \-spcwpass\, q7 => spc0, q6 => spc1, q5 => spc2, q4 => spc3, q3 => spc4, q2 => spc5, q1 => spc6, q0 => spc7);
--  spclch_4f20 : sn74s373 port map(oenb_n => \-spcpass\, o0 => spc7, i0 => spco7, i1 => spco6, o1 => spc6, o2 => spc5, i2 => spco5, i3 => spco4, o3 => spc4, hold_n => clk4d, o4 => spc3, i4 => spco3, i5 => spco2, o5 => spc2, o6 => spc1, i6 => spco1, i7 => spco0);

--  spcw_4f11 : 25s09 port map(sel => n, aq => reta12, a0 => ipc12, a1 => wpc12, b1 => wpc13, b0 => ipc13, bq => reta13, clk => clk4d, cq => nc, c0 => nc, c1 => nc, d1 => nc, d0 => nc);
--  spcw_4f12 : 25s09 port map(sel => n, aq => reta8, a0 => ipc8, a1 => wpc8, b1 => wpc9, b0 => ipc9, bq => reta9, clk => clk4d, cq => reta10, c0 => ipc10, c1 => wpc10, d1 => wpc11, d0 => ipc11);
--  spcw_4f13 : 25s09 port map(sel => n, aq => reta4, a0 => ipc4, a1 => wpc4, b1 => wpc5, b0 => ipc5, bq => reta5, clk => clk4d, cq => reta6, c0 => ipc6, c1 => wpc6, d1 => wpc7, d0 => ipc7);
--  spcw_4f14 : 25s09 port map(sel => n, aq => reta0, a0 => ipc0, a1 => wpc0, b1 => wpc1, b0 => ipc1, bq => reta1, clk => clk4d, cq => reta2, c0 => ipc2, c1 => wpc2, d1 => wpc3, d0 => ipc3);
--  spcw_4f15 : sn74s157 port map(sel => destspcd, a4 => gnd, b4 => l16, y4 => spcw16, b3 => gnd, a3 => l17, y3 => spcw17, y2 => spcw18, b2 => l18, a2 => gnd, y1 => nc, b1 => nc, a1 => nc);
--  spcw_4e11 : sn74s157 port map(sel => destspcd, a4 => reta12, b4 => l12, y4 => spcw12, b3 => reta13, a3 => l13, y3 => spcw13, y2 => spcw14, b2 => l14, a2 => gnd, y1 => spcw15, b1 => l15, a1 => gnd);
--  spcw_4e12 : sn74s157 port map(sel => destspcd, a4 => reta8, b4 => l8, y4 => spcw8, b3 => reta9, a3 => l9, y3 => spcw9, y2 => spcw10, b2 => l10, a2 => reta10, y1 => spcw11, b1 => l11, a1 => reta11);
--  spcw_4e13 : sn74s157 port map(sel => destspcd, a4 => reta4, b4 => l4, y4 => spcw4, b3 => reta5, a3 => l5, y3 => spcw5, y2 => spcw6, b2 => l6, a2 => reta6, y1 => spcw7, b1 => l7, a1 => reta7);
--  spcw_4e14 : sn74s157 port map(sel => destspcd, a4 => reta0, b4 => l0, y4 => spcw0, b3 => reta1, a3 => l1, y3 => spcw1, y2 => spcw2, b2 => l2, a2 => reta2, y1 => spcw3, b1 => l3, a1 => reta3);

--  spcpar_3e19 : sn74s86 port map(g2a => spcwparh, g2b => \-spcwparl\, g2y => spcwpar);
--  spcpar_4f16 : 93s48 port map(i6 => spcw17, i5 => spcw18, i4 => gnd, i3 => gnd, i2 => gnd, i1 => gnd, i0 => gnd, po => spcwparh, pe => nc, i11 => spcw12, i10 => spcw13, i9 => spcw14, i8 => spcw15);
--  spcpar_4f17 : 93s48 port map(i6 => spcw5, i5 => spcw6, i4 => spcw7, i3 => spcw8, i2 => spcw9, i1 => spcw10, i0 => spcw11, po => nc, pe => \-spcwparl\, i11 => spcw0, i10 => spcw1, i9 => spcw2, i8 => spcw3);
--  spcpar_4f21 : 93s48 port map(i6 => spc16, i5 => spc17, i4 => spc18, i3 => spcpar, i2 => gnd, i1 => gnd, i0 => gnd, po => spcparh, pe => nc, i11 => spc11, i10 => spc12, i9 => spc13, i8 => spc14);
--  spcpar_4f26 : 93s48 port map(i6 => spc5, i5 => spc6, i4 => spc7, i3 => spc8, i2 => spc9, i1 => spc10, i0 => spcparh, po => spcparok, pe => nc, i11 => spc0, i10 => spc1, i9 => spc2, i8 => spc3);

--  lpc_4d02 : sn74s241 port map(aenb_n => gnd, q7 => pc7b, q6 => pc6b, q5 => pc5b, q4 => pc4b, q3 => pc3b, q2 => pc2b, q1 => pc1b, q0 => pc0b);
--  lpc_4d01 : sn74s241 port map(aenb_n => gnd, q7 => nc, q6 => nc, q5 => pc13b, q4 => pc12b, q3 => pc11b, q2 => pc10b, q1 => pc9b, q0 => pc8b);
--  lpc_4d06 : sn74s08 port map(g1b => irdisp, g1a => ir25);
--  lpc_4e09 : sn74s157 port map(a4 => pc0, b4 => lpc0, y4 => wpc0, b3 => pc1, a3 => lpc1, y3 => wpc1, y2 => wpc2, b2 => lpc2, a2 => pc2, y1 => wpc3, b1 => lpc3, a1 => pc3);
--  lpc_4e08 : sn74s157 port map(sel => internal27, a4 => pc4, b4 => lpc4, y4 => wpc4, b3 => pc5, a3 => lpc5, y3 => wpc5, y2 => wpc6, b2 => lpc6, a2 => pc6, y1 => wpc7, b1 => lpc7, a1 => pc7);
--  lpc_4e07 : sn74s157 port map(a4 => pc8, b4 => lpc8, y4 => wpc8, b3 => pc9, a3 => lpc9, y3 => wpc9, y2 => wpc10, b2 => lpc10, a2 => pc10, y1 => wpc11, b1 => lpc11, a1 => pc11);
--  lpc_4e06 : sn74s157 port map(sel => internal26, a4 => pc12, b4 => lpc12, y4 => wpc12, b3 => pc13, a3 => lpc13, y3 => wpc13, y2 => nc, b2 => nc, a2 => nc, y1 => nc, b1 => nc, a1 => nc);
--  lpc_4f06 : 25s07 port map(enb_n => lpc.hold, d0 => lpc5, i0 => pc5, i1 => pc4, d1 => lpc4, i2 => pc3, d2 => lpc3, clk => clk4b, d3 => lpc2, i3 => pc2, d4 => lpc1, i4 => pc1, i5 => pc0);
--  lpc_4f07 : 25s07 port map(enb_n => lpc.hold, d0 => lpc11, i0 => pc11, i1 => pc10, d1 => lpc10, i2 => pc9, d2 => lpc9, clk => clk4b, d3 => lpc8, i3 => pc8, d4 => lpc7, i4 => pc7, i5 => pc6);
--  lpc_4f08 : 25s07 port map(enb_n => lpc.hold, d0 => nc, i0 => nc, i1 => nc, d1 => nc, i2 => nc, d2 => nc, clk => clk4b, d3 => nc, i3 => nc, d4 => lpc13, i4 => pc13, i5 => pc12);

  --- Next PC Selector

--  npc_3f29 : sn74s283 port map(s1 => ipc1, b1 => gnd, a1 => pc1, s0 => ipc0, a0 => pc0, b0 => gnd, c0 => hi4, c4 => pccry3, s3 => ipc3, b3 => gnd, a3 => pc3, s2 => ipc2, a2 => pc2);
--  npc_3f28 : sn74s283 port map(s1 => ipc5, b1 => gnd, a1 => pc5, s0 => ipc4, a0 => pc4, b0 => gnd, c0 => pccry3, c4 => pccry7, s3 => ipc7, b3 => gnd, a3 => pc7, s2 => ipc6, a2 => pc6);
--  npc_3f27 : sn74s283 port map(s1 => ipc9, b1 => gnd, a1 => pc9, s0 => ipc8, a0 => pc8, b0 => gnd, c0 => pccry7, c4 => pccry11, s3 => ipc11, b3 => gnd, a3 => pc11, s2 => ipc10, a2 => pc10);
--  npc_3f26 : sn74s283 port map(s1 => ipc13, b1 => gnd, a1 => pc13, s0 => ipc12, a0 => pc12, b0 => gnd, c0 => pccry11, c4 => nc, s3 => nc, b3 => gnd, a3 => nc, s2 => nc, a2 => nc);
--  npc_4e05 : sn74s374 port map(oenb_n => gnd, o0 => pc7, i0 => npc7, i1 => npc6, o1 => pc6, o2 => pc5, i2 => npc5, i3 => npc4, o3 => pc4, clk => clk4b, o4 => pc3, i4 => npc3, i5 => npc2, o5 => pc2, o6 => pc1, i6 => npc1, i7 => npc0);
--  npc_4e04 : sn74s374 port map(oenb_n => gnd, o0 => nc, i0 => nc, i1 => nc, o1 => nc, o2 => pc13, i2 => npc13, i3 => npc12, o3 => pc12, clk => clk4b, o4 => pc11, i4 => npc11, i5 => npc10, o5 => pc10, o6 => pc9, i6 => npc9, i7 => npc8);
--  npc_4f01 : sn74s153 port map(enb1_n => trapa, sel1 => pcs1, g1d3 => ipc13, g1d2 => dpc13, g1d1 => ir25, g1d0 => spc13, g1q => npc13, g2q => npc12, g2d0 => spc12, g2d1 => ir24, g2d2 => dpc12, g2d3 => ipc12, sel0 => pcs0);
--  npc_4f02 : sn74s153 port map(enb1_n => trapa, sel1 => pcs1, g1d3 => ipc11, g1d2 => dpc11, g1d1 => ir23, g1d0 => spc11, g1q => npc11, g2q => npc10, g2d0 => spc10, g2d1 => ir22, g2d2 => dpc10, g2d3 => ipc10, sel0 => pcs0);
--  npc_4f03 : sn74s153 port map(enb1_n => trapa, sel1 => pcs1, g1d3 => ipc9, g1d2 => dpc9, g1d1 => ir21, g1d0 => spc9, g1q => npc9, g2q => npc8, g2d0 => spc8, g2d1 => ir20, g2d2 => dpc8, g2d3 => ipc8, sel0 => pcs0);
--  npc_4f04 : sn74s153 port map(enb1_n => trapa, sel1 => pcs1, g1d3 => ipc7, g1d2 => dpc7, g1d1 => ir19, g1d0 => spc7, g1q => npc7, g2q => npc6, g2d0 => spc6, g2d1 => ir18, g2d2 => dpc6, g2d3 => ipc6, sel0 => pcs0);
--  npc_4f05 : sn74s153 port map(enb1_n => trapb, sel1 => pcs1, g1d3 => ipc5, g1d2 => dpc5, g1d1 => ir17, g1d0 => spc5, g1q => npc5, g2q => npc4, g2d0 => spc4, g2d1 => ir16, g2d2 => dpc4, g2d3 => ipc4, sel0 => pcs0);
--  npc_4e01 : sn74s153 port map(enb1_n => trapb, sel1 => pcs1, g1d3 => ipc3, g1d2 => dpc3, g1d1 => ir15, g1d0 => spc3, g1q => npc3, g2q => npc2, g2d0 => spc2, g2d1 => ir14, g2d2 => dpc2, g2d3 => ipc2, sel0 => pcs0);
--  npc_4e02 : sn74s153 port map(enb1_n => trapb, sel1 => pcs1, g1d3 => ipc1, g1d2 => dpc1, g1d1 => ir13, g1d0 => spc1a, g1q => npc1, g2q => npc0, g2d0 => spc0, g2d1 => ir12, g2d2 => dpc0, g2d3 => ipc0, sel0 => pcs0);

  --- The LC register and Instruction Prefetch

--  lc_2a04 : sn74s08 port map(g3q => lcdrive, g3a => tse1a, g3b => srclc);
--  lc_1a18 : sn74s00 port map(g2b => srclc, g2a => tse1a, g2q_n => \-lcdrive\);
--  lc_2a05 : sn74s04 port map(g1a => \-srclc\, g1q_n => srclc);
--  lc_2b03 : sn74s169 port map(up_dn => hi11, clk => clk1a, i0 => ob24, i1 => ob25, i2 => nc, i3 => nc, enb_p_n => gnd, load_n => \-destlc\, enb_t_n => \-lcry23\, o3 => nc, o2 => nc, o1 => lc25, o0 => lc24);
--  lc_1a26 : sn74s169 port map(up_dn => hi11, clk => clk1a, i0 => ob20, i1 => ob21, i2 => ob22, i3 => ob23, enb_p_n => gnd, load_n => \-destlc\, enb_t_n => \-lcry19\, o3 => lc23, o2 => lc22, o1 => lc21, o0 => lc20);
--  lc_1b28 : sn74s169 port map(up_dn => hi11, clk => clk1a, i0 => ob16, i1 => ob17, i2 => ob18, i3 => ob19, enb_p_n => gnd, load_n => \-destlc\, enb_t_n => \-lcry15\, o3 => lc19, o2 => lc18, o1 => lc17, o0 => lc16);
--  lc_1c30 : sn74s169 port map(up_dn => hi11, clk => clk2a, i0 => ob12, i1 => ob13, i2 => ob14, i3 => ob15, enb_p_n => gnd, load_n => \-destlc\, enb_t_n => \-lcry11\, o3 => lc15, o2 => lc14, o1 => lc13, o0 => lc12);
--  lc_1d29 : sn74s169 port map(up_dn => hi11, clk => clk2c, i0 => ob8, i1 => ob9, i2 => ob10, i3 => ob11, enb_p_n => gnd, load_n => \-destlc\, enb_t_n => \-lcry7\, o3 => lc11, o2 => lc10, o1 => lc9, o0 => lc8);
--  lc_2c05 : sn74s169 port map(up_dn => hi11, clk => clk2a, i0 => ob4, i1 => ob5, i2 => ob6, i3 => ob7, enb_p_n => gnd, load_n => \-destlc\, enb_t_n => \-lcry3\, o3 => lc7, o2 => lc6, o1 => lc5, o0 => lc4);
--  lc_1a16 : sn74s241 port map(aenb_n => \-lcdrive\, q7 => mf24, q6 => mf25, q5 => mf26, q4 => mf27, q3 => mf28, q2 => mf29, q1 => mf30, q0 => mf31);
--  lc_1a22 : sn74s241 port map(aenb_n => \-lcdrive\, q7 => mf16, q6 => mf17, q5 => mf18, q4 => mf19, q3 => mf20, q2 => mf21, q1 => mf22, q0 => mf23);
--  lc_1a24 : sn74s241 port map(aenb_n => \-lcdrive\, q7 => mf8, q6 => mf9, q5 => mf10, q4 => mf11, q3 => mf12, q2 => mf13, q1 => mf14, q0 => mf15);
--  lc_1a20 : sn74s241 port map(aenb_n => \-lcdrive\, q7 => mf0, q6 => mf1, q5 => mf2, q4 => mf3, q3 => mf4, q2 => mf5, q1 => mf6, q0 => mf7);

--  lcc_3e22 : sn74s04 port map(g3a => needfetch, g3q_n => \-needfetch\);
--  lcc_1c15 : sn74s02 port map(g3b => lc_byte_mode, g3a => \-lcinc\);
--  lcc_1c21 : sn74s283 port map(s1 => lca1, b1 => gnd, a1 => lc1, s0 => lca0, a0 => lc0, b0 => internal28, c0 => lcinc, c4 => lcry3, s3 => lca3, b3 => gnd, a3 => lc3, s2 => lca2, a2 => lc2);
--  lcc_1c27 : 25s09 port map(sel => \-destlc\, aq => lc3, a0 => ob3, a1 => lca3, b1 => lca2, b0 => ob2, bq => lc2, clk => clk2a, cq => lc1, c0 => ob1, c1 => lca1, d1 => lca0, d0 => ob0);
--  lcc_3e05 : sn74s08 port map(g1a => lc_byte_mode, g1q => inst_in_2nd_or_4th_quarter);
--  lcc_2e30 : sn74s02 port map(g3b => \-lc_modifies_mrot\, g3q_n => inst_in_left_half, g4b => \-lc_modifies_mrot\, g4a => lc0);
--  lcc_2e05 : sn74s86 port map(g1a => inst_in_left_half, g1b => \-ir4\, g1y => \-sh4\, g2a => lc1, g2b => lc0b, g2y => internal30, g3y => \-sh3\, g3a => \-ir3\, g3b => inst_in_2nd_or_4th_quarter);
--  lcc_1e07 : sn74s08 port map(g4q => lc0b, g4a => lc_byte_mode);
--  lcc_3e07 : sn74s00 port map(g3b => spc14, g3a => \-srcspcpopreal\, g4q_n => \-ifetch\, g4a => needfetch);
--  lcc_4e03 : sn74s32 port map(g1a => spcmung, g1b => spc1, g1y => spc1a, g4y => lcinc, g4a => next.instrd);
--  lcc_4d09 : sn74s08 port map(g2b => spc14, g2a => \-needfetch\, g2q => spcmung, g4q => internal32, g4a => ir24);
--  lcc_3e09 : sn74s32 port map(g4y => needfetch, g4a => have_wrong_word);
--  lcc_3e17 : sn74s02 port map(g1q_n => next.instr, g1a => \-spop\, g1b => internal31, g2q_n => last_byte_in_word, g2a => lc1, g2b => lc0b, g3a => next.instrd, g3q_n => \-lcinc\);
--  lcc_3e11 : sn74s00 port map(g1b => ir10, g1a => ir11, g1q_n => \-lc_modifies_mrot\, g2b => \-newlc\, g2a => \-destlc\, g2q_n => have_wrong_word, g3q_n => \-newlc\.in, g3b => \-lcinc\, g3a => have_wrong_word);
--  lcc_3e12 : sn74s175 port map(clr_n => \-reset\, q0 => \-newlc\, q0_n => newlc, d0 => \-newlc\.in, d1 => int, q1_n => nc, q1 => sintr, clk => clk3c, q2 => next.instrd, q2_n => nc, d2 => next.instr, d3 => nc, q3_n => nc);

  --- The VMA and VMA Selector

--  vma_1a18 : sn74s00 port map(g4q_n => \-vmadrive\, g4a => tse2);
--  vma_2a05 : sn74s04 port map(g3a => \-srcvma\, g3q_n => srcvma);
--  vma_1a06 : sn74s240 port map(aenb_n => \-vmadrive\, ain0 => \-vma31\, bout3 => mf24, ain1 => \-vma30\, bout2 => mf25, ain2 => \-vma29\, bout1 => mf26, ain3 => \-vma28\, bout0 => mf27, bin0 => \-vma27\, aout3 => mf28, bin1 => \-vma26\, aout2 => mf29, bin2 => \-vma25\, aout1 => mf30, bin3 => \-vma24\, aout0 => mf31);
--  vma_1a12 : sn74s240 port map(aenb_n => \-vmadrive\, ain0 => \-vma23\, bout3 => mf16, ain1 => \-vma22\, bout2 => mf17, ain2 => \-vma21\, bout1 => mf18, ain3 => \-vma20\, bout0 => mf19, bin0 => \-vma19\, aout3 => mf20, bin1 => \-vma18\, aout2 => mf21, bin2 => \-vma17\, aout1 => mf22, bin3 => \-vma16\, aout0 => mf23);
--  vma_1a14 : sn74s240 port map(aenb_n => \-vmadrive\, ain0 => \-vma15\, bout3 => mf8, ain1 => \-vma14\, bout2 => mf9, ain2 => \-vma13\, bout1 => mf10, ain3 => \-vma12\, bout0 => mf11, bin0 => \-vma11\, aout3 => mf12, bin1 => \-vma10\, aout2 => mf13, bin2 => \-vma9\, aout1 => mf14, bin3 => \-vma8\, aout0 => mf15);
--  vma_1a10 : sn74s240 port map(aenb_n => \-vmadrive\, ain0 => \-vma7\, bout3 => mf0, ain1 => \-vma6\, bout2 => mf1, ain2 => \-vma5\, bout1 => mf2, ain3 => \-vma4\, bout0 => mf3, bin0 => \-vma3\, aout3 => mf4, bin1 => \-vma2\, aout2 => mf5, bin2 => \-vma1\, aout1 => mf6, bin3 => \-vma0\, aout0 => mf7);
--  vma_1c22 : 25s07 port map(enb_n => \-vmaenb\, d0 => \-vma0\, i0 => \-vmas0\, i1 => \-vmas1\, d1 => \-vma1\, i2 => \-vmas2\, d2 => \-vma2\, clk => clk2a, d3 => \-vma3\, i3 => \-vmas3\, d4 => \-vma4\, i4 => \-vmas4\, i5 => \-vmas5\);
--  vma_1d25 : 25s07 port map(enb_n => \-vmaenb\, d0 => \-vma6\, i0 => \-vmas6\, i1 => \-vmas7\, d1 => \-vma7\, i2 => \-vmas8\, d2 => \-vma8\, clk => clk2c, d3 => \-vma9\, i3 => \-vmas9\, d4 => \-vma10\, i4 => \-vmas10\, i5 => \-vmas11\);
--  vma_1c24 : 25s07 port map(enb_n => \-vmaenb\, d0 => \-vma12\, i0 => \-vmas12\, i1 => \-vmas13\, d1 => \-vma13\, i2 => \-vmas14\, d2 => \-vma14\, clk => clk2a, d3 => \-vma15\, i3 => \-vmas15\, d4 => \-vma16\, i4 => \-vmas16\, i5 => \-vmas17\);
--  vma_1c25 : 25s07 port map(enb_n => \-vmaenb\, d0 => \-vma18\, i0 => \-vmas18\, i1 => \-vmas19\, d1 => \-vma19\, i2 => \-vmas20\, d2 => \-vma20\, clk => clk2a, d3 => \-vma21\, i3 => \-vmas21\, d4 => \-vma22\, i4 => \-vmas22\, i5 => \-vmas23\);
--  vma_1b22 : 25s07 port map(enb_n => \-vmaenb\, d0 => \-vma24\, i0 => \-vmas24\, i1 => \-vmas25\, d1 => \-vma25\, i2 => \-vmas26\, d2 => \-vma26\, clk => clk1a, d3 => \-vma27\, i3 => \-vmas27\, d4 => \-vma28\, i4 => \-vmas28\, i5 => \-vmas29\);
--  vma_1b23 : 25s07 port map(enb_n => \-vmaenb\, d0 => \-vma30\, i0 => \-vmas30\, i1 => \-vmas31\, d1 => \-vma31\, i2 => nc, d2 => nc, clk => clk1a, d3 => nc, i3 => nc, d4 => nc, i4 => nc, i5 => nc);

--  vmas_1c28 : sn74s258 port map(sel => vmaselb, d0 => lc2, d1 => ob0, dy => \-vmas0\, c0 => lc3, c1 => ob1, cy => \-vmas1\, by => \-vmas2\, b1 => ob2, b0 => lc4, ay => \-vmas3\, a1 => ob3, a0 => lc5);
--  vmas_2b01 : sn74s258 port map(sel => vmaselb, d0 => lc6, d1 => ob4, dy => \-vmas4\, c0 => lc7, c1 => ob5, cy => \-vmas5\, by => \-vmas6\, b1 => ob6, b0 => lc8, ay => \-vmas7\, a1 => ob7, a0 => lc9);
--  vmas_1d30 : sn74s258 port map(sel => vmaselb, d0 => lc10, d1 => ob8, dy => \-vmas8\, c0 => lc11, c1 => ob9, cy => \-vmas9\, by => \-vmas10\, b1 => ob10, b0 => lc12, ay => \-vmas11\, a1 => ob11, a0 => lc13);
--  vmas_1b26 : sn74s258 port map(sel => vmaselb, d0 => lc14, d1 => ob12, dy => \-vmas12\, c0 => lc15, c1 => ob13, cy => \-vmas13\, by => \-vmas14\, b1 => ob14, b0 => lc16, ay => \-vmas15\, a1 => ob15, a0 => lc17);
--  vmas_1b29 : sn74s258 port map(sel => vmasela, d0 => lc18, d1 => ob16, dy => \-vmas16\, c0 => lc19, c1 => ob17, cy => \-vmas17\, by => \-vmas18\, b1 => ob18, b0 => lc20, ay => \-vmas19\, a1 => ob19, a0 => lc21);
--  vmas_1a27 : sn74s258 port map(sel => vmasela, d0 => lc22, d1 => ob20, dy => \-vmas20\, c0 => lc23, c1 => ob21, cy => \-vmas21\, by => \-vmas22\, b1 => ob22, b0 => lc24, ay => \-vmas23\, a1 => ob23, a0 => lc25);
--  vmas_2b04 : sn74s258 port map(sel => vmasela, d0 => gnd, d1 => ob24, dy => \-vmas24\, c0 => gnd, c1 => ob25, cy => \-vmas25\, by => \-vmas26\, b1 => ob26, b0 => gnd, ay => \-vmas27\, a1 => ob27, a0 => gnd);
--  vmas_1a29 : sn74s258 port map(sel => vmasela, d0 => gnd, d1 => ob28, dy => \-vmas28\, c0 => gnd, c1 => ob29, cy => \-vmas29\, by => \-vmas30\, b1 => ob30, b0 => gnd, ay => \-vmas31\, a1 => ob31, a0 => gnd);
--  vmas_1d19 : sn74s258 port map(sel => \-memstart\, d0 => \-vma8\, d1 => \-md8\, dy => mapi8, c0 => \-vma9\, c1 => \-md9\, cy => mapi9, by => mapi10, b1 => \-md10\, b0 => \-vma10\, ay => mapi11, a1 => \-md11\, a0 => \-vma11\);
--  vmas_1c16 : sn74s258 port map(sel => \-memstart\, d0 => \-vma12\, d1 => \-md12\, dy => mapi12, c0 => \-vma13\, c1 => \-md13\, cy => mapi13, by => mapi14, b1 => \-md14\, b0 => \-vma14\, ay => mapi15, a1 => \-md15\, a0 => \-vma15\);
--  vmas_1c18 : sn74s258 port map(sel => \-memstart\, d0 => \-vma16\, d1 => \-md16\, dy => mapi16, c0 => \-vma17\, c1 => \-md17\, cy => mapi17, by => mapi18, b1 => \-md18\, b0 => \-vma18\, ay => mapi19, a1 => \-md19\, a0 => \-vma19\);
--  vmas_1c20 : sn74s258 port map(sel => \-memstart\, d0 => \-vma20\, d1 => \-md20\, dy => mapi20, c0 => \-vma21\, c1 => \-md21\, cy => mapi21, by => mapi22, b1 => \-md22\, b0 => \-vma22\, ay => mapi23, a1 => \-md23\, a0 => \-vma23\);

  --- The MD and the MD Selector

--  md_1d18 : sn74s04 port map(g4q => loadmd, g4a => \-loadmd\, g5q_n => destmdr, g5a => \-destmdr\);
--  md_1d16 : sn74s51 port map(g2a => destmdr, g2b => \-clk2c\, g2c => loadmd, g2d => loadmd, g2y => mdclk);
--  md_1e19 : sn74s374 port map(oenb_n => gnd, o0 => nc, i0 => nc, i1 => nc, o1 => nc, o2 => nc, i2 => nc, i3 => nc, o3 => nc, clk => mdclk, o4 => nc, i4 => nc, i5 => nc, o5 => nc, o6 => mdhaspar, i6 => mdgetspar, i7 => mempar_in);
--  md_1b16 : sn74s374 port map(oenb_n => gnd, o0 => \-md31\, i0 => \-mds31\, i1 => \-mds30\, o1 => \-md30\, o2 => \-md29\, i2 => \-mds29\, i3 => \-mds28\, o3 => \-md28\, clk => mdclk, o4 => \-md27\, i4 => \-mds27\, i5 => \-mds26\, o5 => \-md26\, o6 => \-md25\, i6 => \-mds25\, i7 => \-mds24\);
--  md_1c19 : sn74s374 port map(oenb_n => gnd, o0 => \-md23\, i0 => \-mds23\, i1 => \-mds22\, o1 => \-md22\, o2 => \-md21\, i2 => \-mds21\, i3 => \-mds20\, o3 => \-md20\, clk => mdclk, o4 => \-md19\, i4 => \-mds19\, i5 => \-mds18\, o5 => \-md18\, o6 => \-md17\, i6 => \-mds17\, i7 => \-mds16\);
--  md_1d20 : sn74s374 port map(oenb_n => gnd, o0 => \-md15\, i0 => \-mds15\, i1 => \-mds14\, o1 => \-md14\, o2 => \-md13\, i2 => \-mds13\, i3 => \-mds12\, o3 => \-md12\, clk => mdclk, o4 => \-md11\, i4 => \-mds11\, i5 => \-mds10\, o5 => \-md10\, o6 => \-md9\, i6 => \-mds9\, i7 => \-mds8\);
--  md_1c17 : sn74s374 port map(oenb_n => gnd, o0 => \-md7\, i0 => \-mds7\, i1 => \-mds6\, o1 => \-md6\, o2 => \-md5\, i2 => \-mds5\, i3 => \-mds4\, o3 => \-md4\, clk => mdclk, o4 => \-md3\, i4 => \-mds3\, i5 => \-mds2\, o5 => \-md2\, o6 => \-md1\, i6 => \-mds1\, i7 => \-mds0\);
--  md_1e07 : sn74s08 port map(g3q => mdgetspar, g3a => \-destmdr\, g3b => \-ignpar\);
--  md_1a08 : sn74s00 port map(g2b => srcmd, g2a => tse2, g2q_n => \-mddrive\);
--  md_2a05 : sn74s04 port map(g2a => \-srcmd\, g2q_n => srcmd);
--  md_1a02 : sn74s240 port map(aenb_n => \-mddrive\, ain0 => \-md31\, bout3 => mf24, ain1 => \-md30\, bout2 => mf25, ain2 => \-md29\, bout1 => mf26, ain3 => \-md28\, bout0 => mf27, bin0 => \-md27\, aout3 => mf28, bin1 => \-md26\, aout2 => mf29, bin2 => \-md25\, aout1 => mf30, bin3 => \-md24\, aout0 => mf31);
--  md_1a04 : sn74s240 port map(aenb_n => \-mddrive\, ain0 => \-md23\, bout3 => mf16, ain1 => \-md22\, bout2 => mf17, ain2 => \-md21\, bout1 => mf18, ain3 => \-md20\, bout0 => mf19, bin0 => \-md19\, aout3 => mf20, bin1 => \-md18\, aout2 => mf21, bin2 => \-md17\, aout1 => mf22, bin3 => \-md16\, aout0 => mf23);
--  md_1a09 : sn74s240 port map(aenb_n => \-mddrive\, ain0 => \-md15\, bout3 => mf8, ain1 => \-md14\, bout2 => mf9, ain2 => \-md13\, bout1 => mf10, ain3 => \-md12\, bout0 => mf11, bin0 => \-md11\, aout3 => mf12, bin1 => \-md10\, aout2 => mf13, bin2 => \-md9\, aout1 => mf14, bin3 => \-md8\, aout0 => mf15);
--  md_1a05 : sn74s240 port map(aenb_n => \-mddrive\, ain0 => \-md7\, bout3 => mf0, ain1 => \-md6\, bout2 => mf1, ain2 => \-md5\, bout1 => mf2, ain3 => \-md4\, bout0 => mf3, bin0 => \-md3\, aout3 => mf4, bin1 => \-md2\, aout2 => mf5, bin2 => \-md1\, aout1 => mf6, bin3 => \-md0\, aout0 => mf7);

--  mds_1b05 : sn74s240 port map(aenb_n => \-memdrive\.a, ain0 => nc, bout3 => nc, ain1 => nc, bout2 => nc, ain2 => nc, bout1 => nc, ain3 => mdparodd, bout0 => nc, bin0 => nc, aout3 => mempar_out, bin1 => nc, aout2 => nc, bin2 => nc, aout1 => nc, bin3 => nc, aout0 => nc);
--  mds_1a30 : sn74s258 port map(sel => mdsela, d0 => mem28, d1 => ob28, dy => \-mds28\, c0 => mem29, c1 => ob29, cy => \-mds29\, by => \-mds30\, b1 => ob30, b0 => mem30, ay => \-mds31\, a1 => ob31, a0 => mem31);
--  mds_2b05 : sn74s258 port map(sel => mdsela, d0 => mem24, d1 => ob24, dy => \-mds24\, c0 => mem25, c1 => ob25, cy => \-mds25\, by => \-mds26\, b1 => ob26, b0 => mem26, ay => \-mds27\, a1 => ob27, a0 => mem27);
--  mds_1a28 : sn74s258 port map(sel => mdsela, d0 => mem20, d1 => ob20, dy => \-mds20\, c0 => mem21, c1 => ob21, cy => \-mds21\, by => \-mds22\, b1 => ob22, b0 => mem22, ay => \-mds23\, a1 => ob23, a0 => mem23);
--  mds_1b30 : sn74s258 port map(sel => mdsela, d0 => mem16, d1 => ob16, dy => \-mds16\, c0 => mem17, c1 => ob17, cy => \-mds17\, by => \-mds18\, b1 => ob18, b0 => mem18, ay => \-mds19\, a1 => ob19, a0 => mem19);
--  mds_1b27 : sn74s258 port map(sel => mdselb, d0 => mem12, d1 => ob12, dy => \-mds12\, c0 => mem13, c1 => ob13, cy => \-mds13\, by => \-mds14\, b1 => ob14, b0 => mem14, ay => \-mds15\, a1 => ob15, a0 => mem15);
--  mds_1c26 : sn74s258 port map(sel => mdselb, d0 => mem8, d1 => ob8, dy => \-mds8\, c0 => mem9, c1 => ob9, cy => \-mds9\, by => \-mds10\, b1 => ob10, b0 => mem10, ay => \-mds11\, a1 => ob11, a0 => mem11);
--  mds_2b02 : sn74s258 port map(sel => mdselb, d0 => mem4, d1 => ob4, dy => \-mds4\, c0 => mem5, c1 => ob5, cy => \-mds5\, by => \-mds6\, b1 => ob6, b0 => mem6, ay => \-mds7\, a1 => ob7, a0 => mem7);
--  mds_1c29 : sn74s258 port map(sel => mdselb, d0 => mem0, d1 => ob0, dy => \-mds0\, c0 => mem1, c1 => ob1, cy => \-mds1\, by => \-mds2\, b1 => ob2, b0 => mem2, ay => \-mds3\, a1 => ob3, a0 => mem3);
--  mds_1a11 : sn74s240 port map(aenb_n => \-memdrive\.a, ain0 => \-md31\, bout3 => mem24, ain1 => \-md30\, bout2 => mem25, ain2 => \-md29\, bout1 => mem26, ain3 => \-md28\, bout0 => mem27, bin0 => \-md27\, aout3 => mem28, bin1 => \-md26\, aout2 => mem29, bin2 => \-md25\, aout1 => mem30, bin3 => \-md24\, aout0 => mem31);
--  mds_1a17 : sn74s240 port map(aenb_n => \-memdrive\.a, ain0 => \-md23\, bout3 => mem16, ain1 => \-md22\, bout2 => mem17, ain2 => \-md21\, bout1 => mem18, ain3 => \-md20\, bout0 => mem19, bin0 => \-md19\, aout3 => mem20, bin1 => \-md18\, aout2 => mem21, bin2 => \-md17\, aout1 => mem22, bin3 => \-md16\, aout0 => mem23);
--  mds_1a19 : sn74s240 port map(aenb_n => \-memdrive\.a, ain0 => \-md15\, bout3 => mem8, ain1 => \-md14\, bout2 => mem9, ain2 => \-md13\, bout1 => mem10, ain3 => \-md12\, bout0 => mem11, bin0 => \-md11\, aout3 => mem12, bin1 => \-md10\, aout2 => mem13, bin2 => \-md9\, aout1 => mem14, bin3 => \-md8\, aout0 => mem15);
--  mds_1a15 : sn74s240 port map(aenb_n => \-memdrive\.a, ain0 => \-md7\, bout3 => mem0, ain1 => \-md6\, bout2 => mem1, ain2 => \-md5\, bout1 => mem2, ain3 => \-md4\, bout0 => mem3, bin0 => \-md3\, aout3 => mem4, bin1 => \-md2\, aout2 => mem5, bin2 => \-md1\, aout1 => mem6, bin3 => \-md0\, aout0 => mem7);

  --- First and Second Level Maps

--  vmem0_1e26 : sn74s32 port map(g1a => \-use\.map, g1y => v0parok, g2a => \-use\.map, g2b => vmoparodd, g2y => vmoparok);
--  vmem0_1d27 : sn74s02 port map(g4b => memstart, g4a => srcmap);
--  vmem0_1d18 : sn74s04 port map(g1a => mapi23, g1q_n => \-mapi23\);
--  vmem0_1c01 : sn74s280 port map(i0 => \-vmap0\, i1 => \-vmap1\, i2 => \-vmap2\, even => nc, odd => internal17, i3 => \-vmap3\, i4 => \-vmap4\, i5 => vpari, i6 => gnd, i7 => gnd);
--  vmem0_1c02 : sn74s280 port map(i0 => \-vma27\, i1 => \-vma28\, i2 => \-vma29\, even => vm0pari, odd => nc, i3 => \-vma30\, i4 => \-vma31\, i5 => gnd, i6 => gnd, i7 => gnd);
--  vmem0_1d09 : 93425a port map(ce_n => \-mapi23\, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, d0 => \-vmap0\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpb\);
--  vmem0_1d10 : 93425a port map(ce_n => \-mapi23\, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, d0 => \-vmap1\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpb\);
--  vmem0_1c06 : 93425a port map(ce_n => \-mapi23\, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, d0 => \-vmap2\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpb\);
--  vmem0_1c11 : 93425a port map(ce_n => \-mapi23\, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, d0 => \-vmap3\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpb\);
--  vmem0_1c12 : 93425a port map(ce_n => \-mapi23\, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, d0 => \-vmap4\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpb\);
--  vmem0_1d04 : 93425a port map(ce_n => \-mapi23\, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, d0 => vpari, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpb\);
--  vmem0_1d05 : 93425a port map(ce_n => mapi23, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, d0 => vpari, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpa\);
--  vmem0_1c07 : 93425a port map(ce_n => mapi23, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, d0 => \-vmap0\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpa\);
--  vmem0_1c08 : 93425a port map(ce_n => mapi23, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, d0 => \-vmap1\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpa\);
--  vmem0_1c09 : 93425a port map(ce_n => mapi23, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, d0 => \-vmap2\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpa\);
--  vmem0_1c13 : 93425a port map(ce_n => mapi23, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, d0 => \-vmap3\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpa\);
--  vmem0_1c14 : 93425a port map(ce_n => mapi23, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, d0 => \-vmap4\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpa\);

--  vmem1_1d12 : sn74s86 port map(g1a => vm1mpar, g1b => \-vm1lpar\, g1y => vm1pari);
--  vmem1_1c03 : 93s48 port map(i6 => \-vma17\, i5 => \-vma18\, i4 => \-vma19\, i3 => \-vma20\, i2 => \-vma21\, i1 => \-vma22\, i0 => \-vma23\, po => vm1mpar, pe => nc, i11 => \-vma12\, i10 => \-vma13\, i9 => \-vma14\, i8 => \-vma15\);
--  vmem1_1c04 : 93s48 port map(i6 => \-vma5\, i5 => \-vma6\, i4 => \-vma7\, i3 => \-vma8\, i2 => \-vma9\, i1 => \-vma10\, i0 => \-vma11\, po => nc, pe => \-vm1lpar\, i11 => \-vma0\, i10 => \-vma1\, i9 => \-vma2\, i8 => \-vma3\);
--  vmem1_1d08 : sn74s240 port map(aenb_n => gnd, ain0 => mapi10, bout3 => vmap0a, ain1 => mapi9, bout2 => vmap1a, ain2 => mapi8, bout1 => vmap2a, ain3 => \-vmap4\, bout0 => vmap3a, bin0 => \-vmap3\, aout3 => vmap4a, bin1 => \-vmap2\, aout2 => \-mapi8a\, bin2 => \-vmap1\, aout1 => \-mapi9a\, bin3 => \-vmap0\, aout0 => \-mapi10a\);
--  vmem1_1d13 : sn74s240 port map(aenb_n => gnd, ain0 => mapi12, bout3 => \-mapi11a\, ain1 => mapi11, bout2 => \-mapi12a\, ain2 => mapi10, bout1 => nc, ain3 => mapi9, bout0 => \-mapi8b\, bin0 => mapi8, aout3 => \-mapi9b\, bin1 => nc, aout2 => \-mapi10b\, bin2 => mapi12, aout1 => \-mapi11b\, bin3 => mapi11, aout0 => \-mapi12b\);
--  vmem1_1e14 : 93425a port map(ce_n => gnd, a0 => vmap4a, a1 => vmap3a, a2 => vmap2a, a3 => vmap1a, a4 => vmap0a, d0 => \-vmo1\, a5 => \-mapi12a\, a6 => \-mapi11a\, a7 => \-mapi10a\, a8 => \-mapi9a\, a9 => \-mapi8a\, we_n => \-vm1wpa\);
--  vmem1_1d06 : 93425a port map(ce_n => gnd, a0 => vmap4a, a1 => vmap3a, a2 => vmap2a, a3 => vmap1a, a4 => vmap0a, d0 => \-vmo2\, a5 => \-mapi12a\, a6 => \-mapi11a\, a7 => \-mapi10a\, a8 => \-mapi9a\, a9 => \-mapi8a\, we_n => \-vm1wpa\);
--  vmem1_1e09 : 93425a port map(ce_n => gnd, a0 => vmap4a, a1 => vmap3a, a2 => vmap2a, a3 => vmap1a, a4 => vmap0a, d0 => \-vmo3\, a5 => \-mapi12a\, a6 => \-mapi11a\, a7 => \-mapi10a\, a8 => \-mapi9a\, a9 => \-mapi8a\, we_n => \-vm1wpa\);
--  vmem1_1d02 : 93425a port map(ce_n => gnd, a0 => vmap4a, a1 => vmap3a, a2 => vmap2a, a3 => vmap1a, a4 => vmap0a, d0 => \-vmo4\, a5 => \-mapi12a\, a6 => \-mapi11a\, a7 => \-mapi10a\, a8 => \-mapi9a\, a9 => \-mapi8a\, we_n => \-vm1wpa\);
--  vmem1_1e05 : 93425a port map(ce_n => gnd, a0 => vmap4a, a1 => vmap3a, a2 => vmap2a, a3 => vmap1a, a4 => vmap0a, d0 => \-vmo5\, a5 => \-mapi12a\, a6 => \-mapi11a\, a7 => \-mapi10a\, a8 => \-mapi9a\, a9 => \-mapi8a\, we_n => \-vm1wpa\);
--  vmem1_1d11 : 93425a port map(ce_n => gnd, a0 => vmap4a, a1 => vmap3a, a2 => vmap2a, a3 => vmap1a, a4 => vmap0a, d0 => \-vmo0\, a5 => \-mapi12a\, a6 => \-mapi11a\, a7 => \-mapi10a\, a8 => \-mapi9a\, a9 => \-mapi8a\, we_n => \-vm1wpa\);
--  vmem1_1e15 : 93425a port map(ce_n => gnd, a0 => vmap4a, a1 => vmap3a, a2 => vmap2a, a3 => vmap1a, a4 => vmap0a, d0 => \-vmo6\, a5 => \-mapi12a\, a6 => \-mapi11a\, a7 => \-mapi10a\, a8 => \-mapi9a\, a9 => \-mapi8a\, we_n => \-vm1wpa\);
--  vmem1_1e13 : 93425a port map(ce_n => gnd, a0 => vmap4a, a1 => vmap3a, a2 => vmap2a, a3 => vmap1a, a4 => vmap0a, d0 => \-vmo7\, a5 => \-mapi12a\, a6 => \-mapi11a\, a7 => \-mapi10a\, a8 => \-mapi9a\, a9 => \-mapi8a\, we_n => \-vm1wpa\);
--  vmem1_1e10 : 93425a port map(ce_n => gnd, a0 => vmap4a, a1 => vmap3a, a2 => vmap2a, a3 => vmap1a, a4 => vmap0a, d0 => \-vmo8\, a5 => \-mapi12a\, a6 => \-mapi11a\, a7 => \-mapi10a\, a8 => \-mapi9a\, a9 => \-mapi8a\, we_n => \-vm1wpa\);
--  vmem1_1e08 : 93425a port map(ce_n => gnd, a0 => vmap4a, a1 => vmap3a, a2 => vmap2a, a3 => vmap1a, a4 => vmap0a, d0 => \-vmo9\, a5 => \-mapi12a\, a6 => \-mapi11a\, a7 => \-mapi10a\, a8 => \-mapi9a\, a9 => \-mapi8a\, we_n => \-vm1wpa\);
--  vmem1_1d01 : 93425a port map(ce_n => gnd, a0 => vmap4a, a1 => vmap3a, a2 => vmap2a, a3 => vmap1a, a4 => vmap0a, d0 => \-vmo10\, a5 => \-mapi12a\, a6 => \-mapi11a\, a7 => \-mapi10a\, a8 => \-mapi9a\, a9 => \-mapi8a\, we_n => \-vm1wpa\);
--  vmem1_1e04 : 93425a port map(ce_n => gnd, a0 => vmap4a, a1 => vmap3a, a2 => vmap2a, a3 => vmap1a, a4 => vmap0a, d0 => \-vmo11\, a5 => \-mapi12a\, a6 => \-mapi11a\, a7 => \-mapi10a\, a8 => \-mapi9a\, a9 => \-mapi8a\, we_n => \-vm1wpa\);

--  vmem2_1c10 : sn74s240 port map(aenb_n => gnd, ain0 => nc, bout3 => vmap0b, ain1 => nc, bout2 => vmap1b, ain2 => nc, bout1 => vmap2b, ain3 => \-vmap4\, bout0 => vmap3b, bin0 => \-vmap3\, aout3 => vmap4b, bin1 => \-vmap2\, aout2 => nc, bin2 => \-vmap1\, aout1 => nc, bin3 => \-vmap0\, aout0 => nc);
--  vmem2_1d12 : sn74s86 port map(g2a => vmoparm, g2b => vmoparl, g2y => vmoparck, g3y => vmoparodd, g3a => vmopar, g3b => vmoparck);
--  vmem2_1b17 : 93s48 port map(i6 => \-vmo17\, i5 => \-vmo18\, i4 => \-vmo19\, i3 => \-vmo20\, i2 => \-vmo21\, i1 => \-vmo22\, i0 => \-vmo23\, po => vmoparm, pe => nc, i11 => \-vmo12\, i10 => \-vmo13\, i9 => \-vmo14\, i8 => \-vmo15\);
--  vmem2_1d03 : 93s48 port map(i6 => \-vmo5\, i5 => \-vmo6\, i4 => \-vmo7\, i3 => \-vmo8\, i2 => \-vmo9\, i1 => \-vmo10\, i0 => \-vmo11\, po => vmoparl, pe => nc, i11 => \-vmo0\, i10 => \-vmo1\, i9 => \-vmo2\, i8 => \-vmo3\);
--  vmem2_1c05 : 93425a port map(ce_n => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, d0 => vmopar, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\);
--  vmem2_1b12 : 93425a port map(ce_n => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, d0 => \-vmo13\, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\);
--  vmem2_1b13 : 93425a port map(ce_n => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, d0 => \-vmo14\, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\);
--  vmem2_1b14 : 93425a port map(ce_n => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, d0 => \-vmo15\, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\);
--  vmem2_1b06 : 93425a port map(ce_n => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, d0 => \-vmo16\, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\);
--  vmem2_1b07 : 93425a port map(ce_n => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, d0 => \-vmo17\, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\);
--  vmem2_1b11 : 93425a port map(ce_n => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, d0 => \-vmo12\, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\);
--  vmem2_1b08 : 93425a port map(ce_n => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, d0 => \-vmo18\, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\);
--  vmem2_1b09 : 93425a port map(ce_n => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, d0 => \-vmo19\, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\);
--  vmem2_1b01 : 93425a port map(ce_n => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, d0 => \-vmo20\, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\);
--  vmem2_1b02 : 93425a port map(ce_n => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, d0 => \-vmo21\, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\);
--  vmem2_1b03 : 93425a port map(ce_n => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, d0 => \-vmo22\, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\);
--  vmem2_1b04 : 93425a port map(ce_n => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, d0 => \-vmo23\, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\);

--  vmemdr_1e18 : 93s48 port map(i6 => \-pma18\, i5 => \-pma17\, i4 => \-pma16\, i3 => \-pma15\, i2 => \-pma14\, i1 => \-pma13\, i0 => \-pma12\, po => \-adrpar\, pe => nc, i10 => gnd, i9 => \-pma21\, i8 => \-pma20\);
--  vmemdr_1e17 : 93s48 port map(i6 => \-vma6\, i5 => \-vma5\, i4 => \-vma4\, i3 => \-vma3\, i2 => \-vma2\, i1 => \-vma1\, i0 => \-vma0\, po => internal16, pe => nc, i11 => \-pma11\, i10 => \-pma10\, i9 => \-pma9\, i8 => \-pma8\);
--  vmemdr_1d15 : sn74s373 port map(oenb_n => gnd, o0 => \-pma15\, i0 => \-vmo7\, i1 => \-vmo6\, o1 => \-pma14\, o2 => \-pma13\, i2 => \-vmo5\, i3 => \-vmo4\, o3 => \-pma12\, hold_n => memstart, o4 => \-pma11\, i4 => \-vmo3\, i5 => \-vmo2\, o5 => \-pma10\, o6 => \-pma9\, i6 => \-vmo1\, i7 => \-vmo0\);
--  vmemdr_1d14 : sn74s373 port map(oenb_n => gnd, o0 => \-lvmo23\, i0 => \-vmo23\, i1 => \-vmo22\, o1 => \-lvmo22\, o2 => \-pma21\, i2 => \-vmo13\, i3 => \-vmo12\, o3 => \-pma20\, hold_n => memstart, o4 => \-pma19\, i4 => \-vmo11\, i5 => \-vmo10\, o5 => \-pma18\, o6 => \-pma17\, i6 => \-vmo9\, i7 => \-vmo8\);
--  vmemdr_2a05 : sn74s04 port map(g4q => srcmap, g4a => \-srcmap\);
--  vmemdr_1a08 : sn74s00 port map(g1b => tse1a, g1a => srcmap, g1q_n => \-mapdrive\);
--  vmemdr_1a01 : sn74s240 port map(aenb_n => \-mapdrive\, ain0 => \-pfw\, bout3 => mf24, ain1 => \-pfr\, bout2 => mf25, ain2 => hi12, bout1 => mf26, ain3 => \-vmap4\, bout0 => mf27, bin0 => \-vmap3\, aout3 => mf28, bin1 => \-vmap2\, aout2 => mf29, bin2 => \-vmap1\, aout1 => mf30, bin3 => \-vmap0\, aout0 => mf31);
--  vmemdr_1a07 : sn74s240 port map(aenb_n => \-mapdrive\, ain0 => \-vmo23\, bout3 => mf16, ain1 => \-vmo22\, bout2 => mf17, ain2 => \-vmo21\, bout1 => mf18, ain3 => \-vmo20\, bout0 => mf19, bin0 => \-vmo19\, aout3 => mf20, bin1 => \-vmo18\, aout2 => mf21, bin2 => \-vmo17\, aout1 => mf22, bin3 => \-vmo16\, aout0 => mf23);
--  vmemdr_1a03 : sn74s240 port map(aenb_n => \-mapdrive\, ain0 => \-vmo15\, bout3 => mf8, ain1 => \-vmo14\, bout2 => mf9, ain2 => \-vmo13\, bout1 => mf10, ain3 => \-vmo12\, bout0 => mf11, bin0 => \-vmo11\, aout3 => mf12, bin1 => \-vmo10\, aout2 => mf13, bin2 => \-vmo9\, aout1 => mf14, bin3 => \-vmo8\, aout0 => mf15);
--  vmemdr_1a13 : sn74s240 port map(aenb_n => \-mapdrive\, ain0 => \-vmo7\, bout3 => mf0, ain1 => \-vmo6\, bout2 => mf1, ain2 => \-vmo5\, bout1 => mf2, ain3 => \-vmo4\, bout0 => mf3, bin0 => \-vmo3\, aout3 => mf4, bin1 => \-vmo2\, aout2 => mf5, bin2 => \-vmo1\, aout1 => mf6, bin3 => \-vmo0\, aout0 => mf7);

  --- Memory Control Logic

--  vctl1_1c23 : sn74s175 port map(clr_n => \-reset\, q0 => nc, q0_n => nc, d0 => nc, q1_n => rdcyc, q1 => wrcyc, clk => clk2a, q2 => nc, q2_n => nc, d2 => nc, d3 => wmap, q3_n => \-wmapd\);
--  vctl1_1e16 : sn74s11 port map(g2a => \-memrd\, g2b => \-memwr\, g2c => \-ifetch\, g2y_n => \-memop\);
--  vctl1_3f16 : sn74s64 port map(d4 => hi4, b2 => mbusy.sync, a2 => destmem, c3 => \-memgrant\, b3 => mbusy, a3 => use.md, out => \-wait\, a1 => gnd, b1 => gnd, c4 => mbusy.sync, b4 => needfetch);
--  vctl1_3f17 : sn74s10 port map(g1a => rd.in.progress, g1b => use.md, g1y_n => \-hang\);
--  vctl1_1d16 : sn74s51 port map(g1a => rdcyc, g1y => internal18, g1c => memprepare, g1d => \-memwr\);
--  vctl1_1d17 : sn74s00 port map(g1b => \-lvmo22\, g1a => wrcyc, g1q_n => \-pfw\, g2b => \-pfr\, g2a => \-pfw\, g2q_n => \-vmaok\);
--  vctl1_1d22 : td250 port map(o_100ns => \-rdfinish\, o_200ns => nc, o_250ns => nc, o_150ns => nc);
--  vctl1_1d28 : sn74s08 port map(g4q => \-mfinish\, g4a => \-reset\);
--  vctl1_1d23 : td50 port map(input => \-mfinish\, o_20ns => nc, o_50ns => nc, o_30ns => \-mfinishd\);
--  vctl1_1d21 : sn74s74 port map(g1r_n => \-mfinishd\, g1d => memrq, g1clk => mclk1a, g1s_n => hi11, g1q => mbusy, g1q_n => nc, g2q_n => nc, g2q => rd.in.progress, g2s_n => hi11, g2clk => mclk1a, g2d => set.rd.in.progress);
--  vctl1_1e25 : 9s42_1 port map(g1a1 => mbusy, g1b1 => hi11, g2a1 => memstart, g2b1 => \-pfr\, g2c1 => \-pfw\, g2d1 => hi11, out1 => memrq, out2 => set.rd.in.progress, g2d2 => hi11, g2c2 => rdcyc, g2b2 => \-pfr\, g2a2 => memstart, g1b2 => hi11);
--  vctl1_1d27 : sn74s02 port map(g3b => clk2c, g3a => \-memop\, g3q_n => memprepare);
--  vctl1_1e20 : sn74s175 port map(clr_n => \-reset\, q0 => memstart, q0_n => \-memstart\, d0 => memprepare, d1 => memrq, q1_n => \-mbusy\.sync, q1 => mbusy.sync, clk => mclk1a, q2 => nc, q2_n => nc, d2 => nc, d3 => nc, q3_n => nc);

--  vctl2_3f19 : sn74s04 port map(g5q_n => nopa, g5a => \-nopa\);
--  vctl2_1d27 : sn74s02 port map(g1q_n => mdsela, g1a => \-destmdr\, g1b => clk2c, g2q_n => mdselb, g2a => \-destmdr\, g2b => clk2c);
--  vctl2_3f18 : sn74s02 port map(g1q_n => use.md, g1a => \-srcmd\, g1b => nopa);
--  vctl2_1d26 : sn74s04 port map(g1a => nc, g1q_n => nc, g2a => \-lvmo23\, g2q_n => \-pfr\, g3a => \-wmap\, g3q_n => wmap, g4q => \-memrq\, g4a => memrq, g5q_n => \-memprepare\, g5a => memprepare, g6q_n => destmem);
--  vctl2_1e06 : sn74s00 port map(g1b => wrcyc, g1a => lm_drive_enb, g1q_n => \-memdrive\.a, g2b => wrcyc, g2a => lm_drive_enb, g2q_n => \-memdrive\.b);
--  vctl2_1d28 : sn74s08 port map(g1b => \-destvma\, g1a => \-ifetch\, g1q => \-vmaenb\, g2b => \-ifetch\, g2a => hi11, g2q => vmasela, g3q => vmaselb, g3a => hi11, g3b => \-ifetch\);
--  vctl2_1d07 : sn74s37 port map(g1a => mapwr0d, g1b => wp1a, g1y => \-vm0wpa\, g2a => mapwr0d, g2b => wp1a, g2y => \-vm0wpb\, g3y => \-vm1wpa\, g3a => wp1b, g3b => mapwr1d, g4y => \-vm1wpb\, g4a => wp1b);
--  vctl2_1c15 : sn74s02 port map(g1q_n => mapwr0d, g1a => \-wmapd\, g1b => \-vma26\, g2q_n => mapwr1d, g2a => \-wmapd\, g2b => \-vma25\);
--  vctl2_3d04 : sn74s139 port map(g2y3 => \-wmap\, g2y2 => \-memwr\, g2y1 => \-memrd\, g2y0 => nc, b2 => ir20, a2 => ir19);

--  olord1_1c10 : sn74s02 port map(g1q_n => \-machruna\, g1a => gnd, g1b => machrun);
--  olord1_1c01 : sn7428 port map(g3a => \-tpr60\, g3b => gnd, g3q_n => speedclk);
--  olord1_1a01 : sn74s174 port map(clr_n => \-clock_reset_a\, q1 => nc, d1 => nc, d2 => nc, q2 => nc, d3 => speed1a, q3 => sspeed1, clk => speedclk, q4 => sspeed0, d4 => speed0a, q5 => speed1a, d5 => speed1, d6 => speed0);
--  olord1_1f10 : sn74s04 port map(g4q => \-machrun\, g4a => machrun);
--  olord1_1a04 : sn74s174 port map(clr_n => \-reset\, q1 => speed0, d1 => spy0, d2 => spy1, q2 => speed1, d3 => spy2, q3 => errstop, clk => \-ldmode\, q4 => stathenb, d4 => spy3, q5 => trapenb, d5 => spy4, d6 => spy5);
--  olord1_1a10 : sn74s174 port map(clr_n => \-clock_reset_a\, q1 => promdisabled, d1 => promdisable, d2 => sstep, q2 => ssdone, d3 => step, q3 => sstep, clk => mclk5a, q4 => srun, d4 => run, q5 => nc, d5 => nc, d6 => nc);
--  olord1_1c09 : sn74s00 port map(g3q_n => \-stathalt\, g3b => stathenb, g3a => statstop);
--  olord1_1b10 : sn74s04 port map(g2a => ssdone, g2q_n => \-ssdone\, g5q_n => stat.ovf, g5a => \-stc32\);
--  olord1_1a14 : sn74s74 port map(g1r_n => \-clock_reset_a\, g1d => spy0, g1clk => \-ldclk\, g1s_n => \-boot\, g1q => run, g1q_n => \-run\);
--  olord1_1a08 : sn74s175 port map(clr_n => \-reset\, q0 => nc, q0_n => nc, d0 => spy3, d1 => spy2, q1_n => \-opcinh\, q1 => opcinh, clk => \-ldopc\, q2 => opcclk, q2_n => \-opcclk\, d2 => spy1, d3 => spy0, q3_n => \-lpc\.hold);
--  olord1_1a09 : sn74s175 port map(clr_n => \-reset\, q0 => ldstat, q0_n => \-ldstat\, d0 => spy4, d1 => spy3, q1_n => \-idebug\, q1 => idebug, clk => \-ldclk\, q2 => nop11, q2_n => \-nop11\, d2 => spy2, d3 => spy1, q3_n => \-step\);
--  olord1_1a15 : 9s42_1 port map(g1a1 => sstep, g1b1 => \-ssdone\, g2a1 => srun, g2b1 => \-errhalt\, g2c1 => \-wait\, g2d1 => \-stathalt\, out1 => machrun);

--  olord2_1a11 : sn74s02 port map(g1q_n => \-clock_reset_b\, g1a => power_reset_a, g2q_n => \-clock_reset_a\, g2a => power_reset_a, g2b => internal1, g3b => gnd, g3a => \-power_reset\, g3q_n => power_reset_a);
--  olord2_1a18 : sn74ls109 port map(r1 => \-boot\, j1 => srun, k1_n => hi1, clk1 => mclk5a, s1 => \-clock_reset_a\, q1 => nc, q1_n => boot.trap);
--  olord2_1c18 : sn74s32 port map(g3b => prog.boot);
--  olord2_1d10 : sn74s08 port map(g2b => ldmode, g2a => spy7, g2q => prog.boot);
--  olord2_1c07 : sn74s00 port map(g4q_n => \-lowerhighok\, g4a => hi2);
--  olord2_1c08 : sn74s10 port map(g3y_n => reset, g3a => \-boot\, g3b => \-clock_reset_b\, g3c => \-prog\.reset);
--  olord2_1a20 : sn74ls14 port map(g2a => \-boot1\, g3a => \-boot2\, g3q_n => internal4, g4q => \-power_reset\, g4a => internal5);
--  olord2_1a19 : 16dummy port map();
--  olord2_1a07 : sn74s02 port map(g1q_n => highok, g1a => \-upperhighok\, g1b => \-lowerhighok\, g2q_n => \-boot\, g2a => internal6, g2b => internal3, g3b => power_reset_a, g3a => prog.bus.reset, g3q_n => \-bus\.reset);
--  olord2_1b10 : sn74s04 port map(g1a => \-ldmode\, g1q_n => ldmode, g3a => mclk5, g3q_n => \-mclk5\, g4q => \-clk5\, g4a => clk5, g6q_n => internal2);
--  olord2_1a05 : sn74s374 port map(oenb_n => gnd, o0 => \-v0pe\, i0 => v0parok, i1 => vmoparok, o1 => \-v1pe\, o2 => statstop, i2 => stat.ovf, i3 => \-halt\, o3 => \-halted\, clk => clk5a, o4 => nc, i4 => nc, i5 => nc, o5 => nc, o6 => nc, i6 => nc, i7 => nc);
--  olord2_1a06 : sn74s37 port map(g1a => \-mclk5\, g1b => \-mclk5\, g1y => mclk5a, g2a => \-clk5\, g2b => \-clk5\, g2y => clk5a, g3y => \-reset\, g3a => hi1, g3b => reset, g4y => bus.power.reset_l, g4a => power_reset_a);
--  olord2_1c09 : sn74s00 port map(g2b => ldmode, g2a => spy6, g2q_n => \-prog\.reset, g4q_n => \-errhalt\, g4a => errstop);
--  olord2_1a02 : sn74s133 port map(g => \-ape\, f => \-mpe\, e => \-pdlpe\, d => \-dpe\, c => \-ipe\, b => \-spe\, a => \-higherr\, q_n => err, h => \-mempe\, i => \-v0pe\, j => \-v1pe\, k => \-halted\, l => hi1);
--  olord2_1a03 : sn74s374 port map(oenb_n => gnd, o0 => \-ape\, i0 => aparok, i1 => mmemparok, o1 => \-mpe\, o2 => \-pdlpe\, i2 => pdlparok, i3 => dparok, o3 => \-dpe\, clk => clk5a, o4 => \-ipe\, i4 => iparok, i5 => spcparok, o5 => \-spe\, o6 => \-higherr\, i6 => highok, i7 => memparok);

  --- Other

--  stat_1b09 : sn74ls244 port map(en1_n => \-spy\.stl, d0 => st7, q7 => spy0, d1 => st6, q6 => spy1, d2 => st5, q5 => spy2, d3 => st4, q4 => spy3, d4 => st3, q3 => spy4, d5 => st2, q2 => spy5, d6 => st1, q1 => spy6, d7 => st0, q0 => spy7);
--  stat_1b08 : sn74ls244 port map(en1_n => \-spy\.stl, d0 => st15, q7 => spy8, d1 => st14, q6 => spy9, d2 => st13, q5 => spy10, d3 => st12, q4 => spy11, d4 => st11, q3 => spy12, d5 => st10, q2 => spy13, d6 => st9, q1 => spy14, d7 => st8, q0 => spy15);
--  stat_1b07 : sn74ls244 port map(en1_n => \-spy\.sth, d0 => st23, q7 => spy0, d1 => st22, q6 => spy1, d2 => st21, q5 => spy2, d3 => st20, q4 => spy3, d4 => st19, q3 => spy4, d5 => st18, q2 => spy5, d6 => st17, q1 => spy6, d7 => st16, q0 => spy7);
--  stat_1b06 : sn74ls244 port map(en1_n => \-spy\.sth, d0 => st31, q7 => spy8, d1 => st30, q6 => spy9, d2 => st29, q5 => spy10, d3 => st28, q4 => spy11, d4 => st27, q3 => spy12, d5 => st26, q2 => spy13, d6 => st25, q1 => spy14, d7 => st24, q0 => spy15);
--  stat_1b05 : sn74s169 port map(up_dn => hi1, clk => clk5a, i0 => iwr28, i1 => iwr29, i2 => iwr30, i3 => iwr31, enb_p_n => gnd, load_n => \-ldstat\, enb_t_n => \-stc28\, o3 => st31, o2 => st30, o1 => st29, o0 => st28);
--  stat_1b04 : sn74s169 port map(up_dn => hi1, clk => clk5a, i0 => iwr24, i1 => iwr25, i2 => iwr26, i3 => iwr27, enb_p_n => gnd, load_n => \-ldstat\, enb_t_n => \-stc24\, o3 => st27, o2 => st26, o1 => st25, o0 => st24);
--  stat_1b03 : sn74s169 port map(up_dn => hi1, clk => clk5a, i0 => iwr20, i1 => iwr21, i2 => iwr22, i3 => iwr23, enb_p_n => gnd, load_n => \-ldstat\, enb_t_n => \-stc20\, o3 => st23, o2 => st22, o1 => st21, o0 => st20);
--  stat_1b02 : sn74s169 port map(up_dn => hi1, clk => clk5a, i0 => iwr16, i1 => iwr17, i2 => iwr18, i3 => iwr19, enb_p_n => gnd, load_n => \-ldstat\, enb_t_n => \-stc16\, o3 => st19, o2 => st18, o1 => st17, o0 => st16);
--  stat_1b01 : sn74s169 port map(up_dn => hi1, clk => clk5a, i0 => iwr12, i1 => iwr13, i2 => iwr14, i3 => iwr15, enb_p_n => gnd, load_n => \-ldstat\, enb_t_n => \-stc12\, o3 => st15, o2 => st14, o1 => st13, o0 => st12);
--  stat_1c05 : sn74s169 port map(up_dn => hi1, clk => clk5a, i0 => iwr8, i1 => iwr9, i2 => iwr10, i3 => iwr11, enb_p_n => gnd, load_n => \-ldstat\, enb_t_n => \-stc8\, o3 => st11, o2 => st10, o1 => st9, o0 => st8);
--  stat_1c04 : sn74s169 port map(up_dn => hi1, clk => clk5a, i0 => iwr4, i1 => iwr5, i2 => iwr6, i3 => iwr7, enb_p_n => gnd, load_n => \-ldstat\, enb_t_n => \-stc4\, o3 => st7, o2 => st6, o1 => st5, o0 => st4);
--  stat_1c03 : sn74s169 port map(up_dn => hi1, clk => clk5a, i0 => iwr0, i1 => iwr1, i2 => iwr2, i3 => iwr3, enb_p_n => gnd, load_n => \-ldstat\, enb_t_n => \-statbit\, o3 => st3, o2 => st2, o1 => st1, o0 => st0);

--  opcs_1f14 : sn74s02 port map(g1q_n => opcclka, g1a => \-clk5\, g1b => opcclk, g2q_n => opcclkb, g2a => \-clk5\, g2b => opcclk, g3b => opcclk, g3a => \-clk5\, g3q_n => opcclkc);
--  opcs_1f10 : sn74s04 port map(g1a => \-opcinh\, g1q_n => opcinha, g2a => \-opcinh\, g2q_n => opcinhb);
--  opcs_1f13 : 9328 port map(clr_n => hi2, aq_n => nc, aq => opc1, asel => gnd, ai1 => nc, ai0 => pc1, aclk => opcinhb, comclk => opcclkb, bclk => opcinhb, bi0 => pc0, bi1 => nc, bsel => gnd, bq => opc0);
--  opcs_1f12 : 9328 port map(clr_n => hi2, aq_n => nc, aq => opc3, asel => gnd, ai1 => nc, ai0 => pc3, aclk => opcinhb, comclk => opcclkb, bclk => opcinhb, bi0 => pc2, bi1 => nc, bsel => gnd, bq => opc2);
--  opcs_1f11 : 9328 port map(clr_n => hi2, aq_n => nc, aq => opc5, asel => gnd, ai1 => nc, ai0 => pc5, aclk => opcinhb, comclk => opcclkb, bclk => opcinhb, bi0 => pc4, bi1 => nc, bsel => gnd, bq => opc4);
--  opcs_1f09 : 9328 port map(clr_n => hi2, aq_n => nc, aq => opc7, asel => gnd, ai1 => nc, ai0 => pc7, aclk => opcinha, comclk => opcclkc, bclk => opcinha, bi0 => pc6, bi1 => nc, bsel => gnd, bq => opc6);
--  opcs_1f08 : 9328 port map(clr_n => hi2, aq_n => nc, aq => opc9, asel => gnd, ai1 => nc, ai0 => pc9, aclk => opcinha, comclk => opcclkc, bclk => opcinha, bi0 => pc8, bi1 => nc, bsel => gnd, bq => opc8);
--  opcs_1f07 : 9328 port map(clr_n => hi2, aq_n => nc, aq => opc11, asel => gnd, ai1 => nc, ai0 => pc11, aclk => opcinha, comclk => opcclka, bclk => opcinha, bi0 => pc10, bi1 => nc, bsel => gnd, bq => opc10);
--  opcs_1f06 : 9328 port map(clr_n => hi2, aq_n => nc, aq => opc13, asel => gnd, ai1 => nc, ai0 => pc13, aclk => opcinha, comclk => opcclka, bclk => opcinha, bi0 => pc12, bi1 => nc, bsel => gnd, bq => opc12);

--  iwrpar_1b15 : 93s48 port map(i6 => gnd, i5 => gnd, i4 => gnd, i3 => gnd, i2 => gnd, i1 => gnd, i0 => gnd, po => nc, pe => iwr48, i11 => iwrp1, i10 => iwrp2, i9 => iwrp3, i8 => iwrp4);
--  iwrpar_1b14 : 93s48 port map(i6 => iwr5, i5 => iwr6, i4 => iwr7, i3 => iwr8, i2 => iwr9, i1 => iwr10, i0 => iwr11, po => iwrp1, pe => nc, i11 => iwr0, i10 => iwr1, i9 => iwr2, i8 => iwr3);
--  iwrpar_1b13 : 93s48 port map(i6 => iwr17, i5 => iwr18, i4 => iwr19, i3 => iwr20, i2 => iwr21, i1 => iwr22, i0 => iwr23, po => iwrp2, pe => nc, i11 => iwr12, i10 => iwr13, i9 => iwr14, i8 => iwr15);
--  iwrpar_1b12 : 93s48 port map(i6 => iwr29, i5 => iwr30, i4 => iwr31, i3 => iwr32, i2 => iwr33, i1 => iwr34, i0 => iwr35, po => iwrp3, pe => nc, i11 => iwr24, i10 => iwr25, i9 => iwr26, i8 => iwr27);
--  iwrpar_1b11 : 93s48 port map(i6 => iwr41, i5 => iwr42, i4 => iwr43, i3 => iwr44, i2 => iwr45, i1 => iwr46, i0 => iwr47, po => iwrp4, pe => nc, i11 => iwr36, i10 => iwr37, i9 => iwr38, i8 => iwr39);

--  trap_3e30 : sn74s20 port map(g1a => mdparerr, g1b => mdhaspar, g1c => use.md, g1d => \-wait\, g1y_n => \-parerr\);
--  trap_3f19 : sn74s04 port map(g1a => \-trap\, g1q_n => trapb, g2a => \-trap\, g2q_n => trapa, g3a => \-memparok\, g3q_n => memparok, g4q => \-trapenb\, g4a => trapenb);
--  trap_3f18 : sn74s02 port map(g2q_n => \-trap\, g2b => boot.trap, g3b => \-trapenb\, g3a => \-parerr\, g3q_n => internal20, g4b => trapenb, g4a => \-parerr\);
--  trap_1d12 : sn74s86 port map(g4y => mdparerr, g4a => mdpareven);
--  trap_1e30 : 93s48 port map(i6 => \-md29\, i5 => \-md30\, i4 => \-md31\, i3 => mdparl, i2 => mdparm, i1 => gnd, i0 => gnd, po => mdparodd, pe => mdpareven, i11 => \-md24\, i10 => \-md25\, i9 => \-md26\, i8 => \-md27\);
--  trap_1e29 : 93s48 port map(i6 => \-md17\, i5 => \-md18\, i4 => \-md19\, i3 => \-md20\, i2 => \-md21\, i1 => \-md22\, i0 => \-md23\, po => mdparm, pe => nc, i11 => \-md12\, i10 => \-md13\, i9 => \-md14\, i8 => \-md15\);
--  trap_1e28 : 93s48 port map(i6 => \-md5\, i5 => \-md6\, i4 => \-md7\, i3 => \-md8\, i2 => \-md9\, i1 => \-md10\, i0 => \-md11\, po => mdparl, pe => nc, i11 => \-md0\, i10 => \-md1\, i9 => \-md2\, i8 => \-md3\);

--  spy0_1f03 : sn74s138 port map(a => eadr0, b => eadr1, c => eadr2, g2a => \-dbwrite\, g2b => gnd, g1 => hi1, y7 => nc, y6 => nc, y5 => \-ldmode\, y4 => \-ldopc\, y3 => \-ldclk\, y2 => \-lddbirh\, y1 => \-lddbirm\);
--  spy0_1f02 : sn74s138 port map(a => eadr0, b => eadr1, c => eadr2, g2a => \-dbread\, g2b => gnd, g1 => eadr3, y7 => \-spy\.sth, y6 => \-spy\.stl, y5 => \-spy\.ah, y4 => \-spy\.al, y3 => \-spy\.mh, y2 => \-spy\.ml, y1 => \-spy\.flag2);
--  spy0_1f01 : sn74s138 port map(a => eadr0, b => eadr1, c => eadr2, g2a => \-dbread\, g2b => eadr3, g1 => hi1, y7 => \-spy\.obh, y6 => \-spy\.obl, y5 => \-spy\.pc, y4 => \-spy\.opc, y3 => nc, y2 => \-spy\.irh, y1 => \-spy\.irm);

--  spy1_2c17 : sn74ls244 port map(en1_n => \-spy\.obl, d0 => ob7, q7 => spy0, d1 => ob6, q6 => spy1, d2 => ob5, q5 => spy2, d3 => ob4, q4 => spy3, d4 => ob3, q3 => spy4, d5 => ob2, q2 => spy5, d6 => ob1, q1 => spy6, d7 => ob0, q0 => spy7);
--  spy1_2c18 : sn74ls244 port map(en1_n => \-spy\.obl, d0 => ob15, q7 => spy8, d1 => ob14, q6 => spy9, d2 => ob13, q5 => spy10, d3 => ob12, q4 => spy11, d4 => ob11, q3 => spy12, d5 => ob10, q2 => spy13, d6 => ob9, q1 => spy14, d7 => ob8, q0 => spy15);
--  spy1_3c23 : sn74ls244 port map(en1_n => \-spy\.obh, d0 => ob23, q7 => spy0, d1 => ob22, q6 => spy1, d2 => ob21, q5 => spy2, d3 => ob20, q4 => spy3, d4 => ob19, q3 => spy4, d5 => ob18, q2 => spy5, d6 => ob17, q1 => spy6, d7 => ob16, q0 => spy7);
--  spy1_3c24 : sn74ls244 port map(en1_n => \-spy\.obh, d0 => ob31, q7 => spy8, d1 => ob30, q6 => spy9, d2 => ob29, q5 => spy10, d3 => ob28, q4 => spy11, d4 => ob27, q3 => spy12, d5 => ob26, q2 => spy13, d6 => ob25, q1 => spy14, d7 => ob24, q0 => spy15);
--  spy1_3e01 : sn74ls244 port map(en1_n => \-spy\.irl, d0 => ir7, q7 => spy0, d1 => ir6, q6 => spy1, d2 => ir5, q5 => spy2, d3 => ir4, q4 => spy3, d4 => ir3, q3 => spy4, d5 => ir2, q2 => spy5, d6 => ir1, q1 => spy6, d7 => ir0, q0 => spy7);
--  spy1_3e03 : sn74ls244 port map(en1_n => \-spy\.irl, d0 => ir15, q7 => spy8, d1 => ir14, q6 => spy9, d2 => ir13, q5 => spy10, d3 => ir12, q4 => spy11, d4 => ir11, q3 => spy12, d5 => ir10, q2 => spy13, d6 => ir9, q1 => spy14, d7 => ir8, q0 => spy15);
--  spy1_3f25 : sn74ls244 port map(en1_n => \-spy\.irm, d0 => ir23, q7 => spy0, d1 => ir22, q6 => spy1, d2 => ir21, q5 => spy2, d3 => ir20, q4 => spy3, d4 => ir19, q3 => spy4, d5 => ir18, q2 => spy5, d6 => ir17, q1 => spy6, d7 => ir16, q0 => spy7);
--  spy1_3f23 : sn74ls244 port map(en1_n => \-spy\.irm, d0 => ir31, q7 => spy8, d1 => ir30, q6 => spy9, d2 => ir29, q5 => spy10, d3 => ir28, q4 => spy11, d4 => ir27, q3 => spy12, d5 => ir26, q2 => spy13, d6 => ir25, q1 => spy14, d7 => ir24, q0 => spy15);
--  spy1_3f21 : sn74ls244 port map(en1_n => \-spy\.irh, d0 => ir39, q7 => spy0, d1 => ir38, q6 => spy1, d2 => ir37, q5 => spy2, d3 => ir36, q4 => spy3, d4 => ir35, q3 => spy4, d5 => ir34, q2 => spy5, d6 => ir33, q1 => spy6, d7 => ir32, q0 => spy7);
--  spy1_3e06 : sn74ls244 port map(en1_n => \-spy\.irh, d0 => ir47, q7 => spy8, d1 => ir46, q6 => spy9, d2 => ir45, q5 => spy10, d3 => ir44, q4 => spy11, d4 => ir43, q3 => spy12, d5 => ir42, q2 => spy13, d6 => ir41, q1 => spy14, d7 => ir40, q0 => spy15);

--  spy2_3e16 : sn74ls244 port map(en1_n => \-spy\.flag2, d0 => nc, q7 => spy0, d1 => nc, q6 => spy1, d2 => ir48, q5 => spy2, d3 => nop, q4 => spy3, d4 => \-vmaok\, q3 => spy4, d5 => jcond, q2 => spy5, d6 => pcs1, q1 => spy6, d7 => pcs0, q0 => spy7);
--  spy2_3f15 : sn74ls244 port map(en1_n => \-spy\.flag2, d0 => nc, q7 => spy8, d1 => nc, q6 => spy9, d2 => wmapd, q5 => spy10, d3 => destspcd, q4 => spy11, d4 => iwrited, q3 => spy12, d5 => imodd, q2 => spy13, d6 => pdlwrited, q1 => spy14, d7 => spushd, q0 => spy15);
--  spy2_4a15 : sn74ls244 port map(en1_n => \-spy\.ml, d0 => m7, q7 => spy0, d1 => m6, q6 => spy1, d2 => m5, q5 => spy2, d3 => m4, q4 => spy3, d4 => m3, q3 => spy4, d5 => m2, q2 => spy5, d6 => m1, q1 => spy6, d7 => m0, q0 => spy7);
--  spy2_4a13 : sn74ls244 port map(en1_n => \-spy\.ml, d0 => m15, q7 => spy8, d1 => m14, q6 => spy9, d2 => m13, q5 => spy10, d3 => m12, q4 => spy11, d4 => m11, q3 => spy12, d5 => m10, q2 => spy13, d6 => m9, q1 => spy14, d7 => m8, q0 => spy15);
--  spy2_4b13 : sn74ls244 port map(en1_n => \-spy\.mh, d0 => m23, q7 => spy0, d1 => m22, q6 => spy1, d2 => m21, q5 => spy2, d3 => m20, q4 => spy3, d4 => m19, q3 => spy4, d5 => m18, q2 => spy5, d6 => m17, q1 => spy6, d7 => m16, q0 => spy7);
--  spy2_4b17 : sn74ls244 port map(en1_n => \-spy\.mh, d0 => m31, q7 => spy8, d1 => m30, q6 => spy9, d2 => m29, q5 => spy10, d3 => m28, q4 => spy11, d4 => m27, q3 => spy12, d5 => m26, q2 => spy13, d6 => m25, q1 => spy14, d7 => m24, q0 => spy15);
--  spy2_1f13 : sn74ls244 port map(en1_n => \-spy\.al, d0 => aa7, q7 => spy0, d1 => aa6, q6 => spy1, d2 => aa5, q5 => spy2, d3 => aa4, q4 => spy3, d4 => aa3, q3 => spy4, d5 => aa2, q2 => spy5, d6 => aa1, q1 => spy6, d7 => aa0, q0 => spy7);
--  spy2_1f11 : sn74ls244 port map(en1_n => \-spy\.al, d0 => aa15, q7 => spy8, d1 => aa14, q6 => spy9, d2 => aa13, q5 => spy10, d3 => aa12, q4 => spy11, d4 => aa11, q3 => spy12, d5 => aa10, q2 => spy13, d6 => aa9, q1 => spy14, d7 => aa8, q0 => spy15);
--  spy2_3a27 : sn74ls244 port map(en1_n => \-spy\.ah, d0 => a23, q7 => spy0, d1 => a22, q6 => spy1, d2 => a21, q5 => spy2, d3 => a20, q4 => spy3, d4 => a19, q3 => spy4, d5 => a18, q2 => spy5, d6 => a17, q1 => spy6, d7 => a16, q0 => spy7);
--  spy2_3a26 : sn74ls244 port map(en1_n => \-spy\.ah, d0 => a31a, q7 => spy8, d1 => a30, q6 => spy9, d2 => a29, q5 => spy10, d3 => a28, q4 => spy11, d4 => a27, q3 => spy12, d5 => a26, q2 => spy13, d6 => a25, q1 => spy14, d7 => a24, q0 => spy15);

--  spy4_1d07 : sn74ls244 port map(en1_n => \-spy\.pc, d0 => pc7, q7 => spy0, d1 => pc6, q6 => spy1, d2 => pc5, q5 => spy2, d3 => pc4, q4 => spy3, d4 => pc3, q3 => spy4, d5 => pc2, q2 => spy5, d6 => pc1, q1 => spy6, d7 => pc0, q0 => spy7);
--  spy4_1d06 : sn74ls244 port map(en1_n => \-spy\.pc, d0 => gnd, q7 => spy8, d1 => gnd, q6 => spy9, d2 => pc13, q5 => spy10, d3 => pc12, q4 => spy11, d4 => pc11, q3 => spy12, d5 => pc10, q2 => spy13, d6 => pc9, q1 => spy14, d7 => pc8, q0 => spy15);
--  spy4_1a13 : sn74s240 port map(aenb_n => \-spy\.flag1, ain0 => \-higherr\, bout3 => spy0, ain1 => \-mempe\, bout2 => spy1, ain2 => \-ipe\, bout1 => spy2, ain3 => \-dpe\, bout0 => spy3, bin0 => \-spe\, aout3 => spy4, bin1 => \-pdlpe\, aout2 => spy5, bin2 => \-mpe\, aout1 => spy6, bin3 => \-ape\, aout0 => spy7);
--  spy4_1a12 : sn74ls244 port map(en1_n => \-spy\.flag1, d0 => \-wait\, q7 => spy8, d1 => \-v1pe\, q6 => spy9, d2 => \-v0pe\, q5 => spy10, d3 => promdisable, q4 => spy11, d4 => \-stathalt\, q3 => spy12, d5 => err, q2 => spy13, d6 => ssdone, q1 => spy14, d7 => srun, q0 => spy15);
--  spy4_1e07 : sn74ls244 port map(en1_n => \-spy\.opc, d0 => opc7, q7 => spy0, d1 => opc6, q6 => spy1, d2 => opc5, q5 => spy2, d3 => opc4, q4 => spy3, d4 => opc3, q3 => spy4, d5 => opc2, q2 => spy5, d6 => opc1, q1 => spy6, d7 => opc0, q0 => spy7);
--  spy4_1e06 : sn74ls244 port map(en1_n => \-spy\.opc, d0 => gnd, q7 => spy8, d1 => gnd, q6 => spy9, d2 => opc13, q5 => spy10, d3 => opc12, q4 => spy11, d4 => opc11, q3 => spy12, d5 => opc10, q2 => spy13, d6 => opc9, q1 => spy14, d7 => opc8, q0 => spy15);

--  opcd_1e07 : sn74s08 port map(g1b => tse1b, g1q => dcdrive, g2b => zero16, g2a => tse1b, g2q => zero16.drive);
--  opcd_1d18 : sn74s04 port map(g2a => \-srcdc\, g2q_n => internal23, g3a => \-srcopc\);
--  opcd_1e06 : sn74s00 port map(g3q_n => \-opcdrive\, g3b => internal24, g3a => tse1b, g4q_n => \-zero16\.drive, g4a => tse1b);
--  opcd_1e16 : sn74s11 port map(g1a => \-srcopc\, g1b => zero16, g1y_n => zero12.drive);
--  opcd_3e30 : sn74s20 port map(g2y_n => zero16, g2a => \-srcopc\, g2b => \-srcpdlidx\, g2c => \-srcpdlptr\);
--  opcd_1f01 : sn74s241 port map(aenb_n => \-zero16\.drive, q7 => mf24, q6 => mf25, q5 => mf26, q4 => mf27, q3 => mf28, q2 => mf29, q1 => mf30, q0 => mf31);
--  opcd_1f02 : sn74s241 port map(aenb_n => \-zero16\.drive, q7 => mf16, q6 => mf17, q5 => mf18, q4 => mf19, q3 => mf20, q2 => mf21, q1 => mf22, q0 => mf23);
--  opcd_1f03 : sn74s241 port map(aenb_n => \-opcdrive\, q7 => mf12, q6 => mf13, q5 => mf14, q4 => mf15, q3 => mf12, q2 => mf13, q1 => mf14, q0 => mf15);
--  opcd_1f04 : sn74s241 port map(aenb_n => \-opcdrive\, q7 => mf8, q6 => mf9, q5 => mf10, q4 => mf11, q3 => mf8, q2 => mf9, q1 => mf10, q0 => mf11);
--  opcd_1e01 : sn74s241 port map(aenb_n => \-opcdrive\, q7 => mf4, q6 => mf5, q5 => mf6, q4 => mf7, q3 => mf4, q2 => mf5, q1 => mf6, q0 => mf7);
--  opcd_1e03 : sn74s241 port map(aenb_n => \-opcdrive\, q7 => mf0, q6 => mf1, q5 => mf2, q4 => mf3, q3 => mf0, q2 => mf1, q1 => mf2, q0 => mf3);

--  mo0_2d29 : sn74s151 port map(i3 => alu0, i2 => alu0, i1 => r0, i0 => a0, q => ob0, q_n => nc, ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk0, i7 => q31, i6 => q31, i5 => alu1);
--  mo0_2d28 : sn74s151 port map(i3 => alu1, i2 => alu1, i1 => r1, i0 => a1, q => ob1, q_n => nc, ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk1, i7 => alu0, i6 => alu0, i5 => alu2);
--  mo0_2c30 : sn74s151 port map(i3 => alu2, i2 => alu2, i1 => r2, i0 => a2, q => ob2, q_n => nc, ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk2, i7 => alu1, i6 => alu1, i5 => alu3);
--  mo0_2c29 : sn74s151 port map(i3 => alu3, i2 => alu3, i1 => r3, i0 => a3, q => ob3, q_n => nc, ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk3, i7 => alu2, i6 => alu2, i5 => alu4);
--  mo0_2b30 : sn74s151 port map(i3 => alu4, i2 => alu4, i1 => r4, i0 => a4, q => ob4, q_n => nc, ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk4, i7 => alu3, i6 => alu3, i5 => alu5);
--  mo0_2b29 : sn74s151 port map(i3 => alu5, i2 => alu5, i1 => r5, i0 => a5, q => ob5, q_n => nc, ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk5, i7 => alu4, i6 => alu4, i5 => alu6);
--  mo0_2b25 : sn74s151 port map(i3 => alu6, i2 => alu6, i1 => r6, i0 => a6, q => ob6, q_n => nc, ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk6, i7 => alu5, i6 => alu5, i5 => alu7);
--  mo0_2b24 : sn74s151 port map(i3 => alu7, i2 => alu7, i1 => r7, i0 => a7, q => ob7, q_n => nc, ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk7, i7 => alu6, i6 => alu6, i5 => alu8);
--  mo0_2d24 : sn74s151 port map(i3 => alu8, i2 => alu8, i1 => r8, i0 => a8, q => ob8, q_n => nc, ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk8, i7 => alu7, i6 => alu7, i5 => alu9);
--  mo0_2d23 : sn74s151 port map(i3 => alu9, i2 => alu9, i1 => r9, i0 => a9, q => ob9, q_n => nc, ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk9, i7 => alu8, i6 => alu8, i5 => alu10);
--  mo0_2c24 : sn74s151 port map(i3 => alu10, i2 => alu10, i1 => r10, i0 => a10, q => ob10, q_n => nc, ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk10, i7 => alu9, i6 => alu9, i5 => alu11);
--  mo0_2c19 : sn74s151 port map(i3 => alu11, i2 => alu11, i1 => r11, i0 => a11, q => ob11, q_n => nc, ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk11, i7 => alu10, i6 => alu10, i5 => alu12);
--  mo0_2a30 : sn74s151 port map(i3 => alu12, i2 => alu12, i1 => r12, i0 => a12, q => ob12, q_n => nc, ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk12, i7 => alu11, i6 => alu11, i5 => alu13);
--  mo0_2a29 : sn74s151 port map(i3 => alu13, i2 => alu13, i1 => r13, i0 => a13, q => ob13, q_n => nc, ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk13, i7 => alu12, i6 => alu12, i5 => alu14);
--  mo0_2a25 : sn74s151 port map(i3 => alu14, i2 => alu14, i1 => r14, i0 => a14, q => ob14, q_n => nc, ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk14, i7 => alu13, i6 => alu13, i5 => alu15);
--  mo0_2a24 : sn74s151 port map(i3 => alu15, i2 => alu15, i1 => r15, i0 => a15, q => ob15, q_n => nc, ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk15, i7 => alu14, i6 => alu14, i5 => alu16);

--  mo1_2d19 : sn74s151 port map(i3 => alu16, i2 => alu16, i1 => r16, i0 => a16, q => ob16, q_n => nc, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk16, i7 => alu15, i6 => alu15, i5 => alu17);
--  mo1_2d18 : sn74s151 port map(i3 => alu17, i2 => alu17, i1 => r17, i0 => a17, q => ob17, q_n => nc, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk17, i7 => alu16, i6 => alu16, i5 => alu18);
--  mo1_2d14 : sn74s151 port map(i3 => alu18, i2 => alu18, i1 => r18, i0 => a18, q => ob18, q_n => nc, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk18, i7 => alu17, i6 => alu17, i5 => alu19);
--  mo1_2d13 : sn74s151 port map(i3 => alu19, i2 => alu19, i1 => r19, i0 => a19, q => ob19, q_n => nc, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk19, i7 => alu18, i6 => alu18, i5 => alu20);
--  mo1_2b15 : sn74s151 port map(i3 => alu20, i2 => alu20, i1 => r20, i0 => a20, q => ob20, q_n => nc, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk20, i7 => alu19, i6 => alu19, i5 => alu21);
--  mo1_2b14 : sn74s151 port map(i3 => alu21, i2 => alu21, i1 => r21, i0 => a21, q => ob21, q_n => nc, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk21, i7 => alu20, i6 => alu20, i5 => alu22);
--  mo1_2b10 : sn74s151 port map(i3 => alu22, i2 => alu22, i1 => r22, i0 => a22, q => ob22, q_n => nc, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk22, i7 => alu21, i6 => alu21, i5 => alu23);
--  mo1_2b09 : sn74s151 port map(i3 => alu23, i2 => alu23, i1 => r23, i0 => a23, q => ob23, q_n => nc, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk23, i7 => alu22, i6 => alu22, i5 => alu24);
--  mo1_2c14 : sn74s151 port map(i3 => alu24, i2 => alu24, i1 => r24, i0 => a24, q => ob24, q_n => nc, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk24, i7 => alu23, i6 => alu23, i5 => alu25);
--  mo1_2d09 : sn74s151 port map(i3 => alu25, i2 => alu25, i1 => r25, i0 => a25, q => ob25, q_n => nc, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk25, i7 => alu24, i6 => alu24, i5 => alu26);
--  mo1_2d04 : sn74s151 port map(i3 => alu26, i2 => alu26, i1 => r26, i0 => a26, q => ob26, q_n => nc, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk26, i7 => alu25, i6 => alu25, i5 => alu27);
--  mo1_2c09 : sn74s151 port map(i3 => alu27, i2 => alu27, i1 => r27, i0 => a27, q => ob27, q_n => nc, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk27, i7 => alu26, i6 => alu26, i5 => alu28);
--  mo1_2a15 : sn74s151 port map(i3 => alu28, i2 => alu28, i1 => r28, i0 => a28, q => ob28, q_n => nc, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk28, i7 => alu27, i6 => alu27, i5 => alu29);
--  mo1_2a14 : sn74s151 port map(i3 => alu29, i2 => alu29, i1 => r29, i0 => a29, q => ob29, q_n => nc, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk29, i7 => alu28, i6 => alu28, i5 => alu30);
--  mo1_2a10 : sn74s151 port map(i3 => alu30, i2 => alu30, i1 => r30, i0 => a30, q => ob30, q_n => nc, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk30, i7 => alu29, i6 => alu29, i5 => alu31);
--  mo1_2a09 : sn74s151 port map(i3 => alu31, i2 => alu31, i1 => r31, i0 => a31b, q => ob31, q_n => nc, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk31, i7 => alu30, i6 => alu30, i5 => alu32);

--  bcterm_2c25 : sip330_470_8 port map(r2 => \-memgrant\, r3 => int, r4 => \-loadmd\, r5 => \-ignpar\, r6 => \-memack\);
--  bcterm_1b25 : sip220_330_8 port map(r2 => mem24, r3 => mem25, r4 => mem26, r5 => mem27, r6 => mem28);
--  bcterm_1b20 : sip220_330_8 port map(r2 => mem12, r3 => mem13, r4 => mem14, r5 => mem15, r6 => mem16);
--  bcterm_1b15 : sip220_330_8 port map(r2 => mem0, r3 => mem1, r4 => mem2, r5 => mem3, r6 => mem4);

--  ipar_4e03 : sn74s32 port map(g2a => imodd, g2b => iparity, g2y => iparok);
--  ipar_3f22 : 93s48 port map(i6 => gnd, i5 => gnd, i4 => gnd, i3 => gnd, i2 => gnd, i1 => gnd, i0 => gnd, po => iparity, pe => nc, i11 => ipar0, i10 => ipar1, i9 => ipar2, i8 => ipar3);
--  ipar_3e02 : 93s48 port map(i6 => ir41, i5 => ir42, i4 => ir43, i3 => ir44, i2 => ir45, i1 => ir46, i0 => ir47, po => ipar3, pe => nc, i11 => ir36, i10 => ir37, i9 => ir38, i8 => ir39);
--  ipar_3e21 : 93s48 port map(i6 => ir29, i5 => ir30, i4 => ir31, i3 => ir32, i2 => ir33, i1 => ir34, i0 => ir35, po => ipar2, pe => nc, i11 => ir24, i10 => ir25, i9 => ir26, i8 => ir27);
--  ipar_3f24 : 93s48 port map(i6 => ir17, i5 => ir18, i4 => ir19, i3 => ir20, i2 => ir21, i1 => ir22, i0 => ir23, po => ipar1, pe => nc, i11 => ir12, i10 => ir13, i9 => ir14, i8 => ir15);
--  ipar_3e04 : 93s48 port map(i6 => ir5, i5 => ir6, i4 => ir7, i3 => ir8, i2 => ir9, i1 => ir10, i0 => ir11, po => ipar0, pe => nc, i11 => ir0, i10 => ir1, i9 => ir2, i8 => ir3);

  --------------------------------------------------------------------------------

  -- Poor substitute for the 5 octal display that was on the lower
  -- left-hand corner of the front door on the CADR.  See the PCTL
  -- prints.
  process (cyclecompleted)
  begin
    pc <= pc0 & pc1 & pc2 & pc3 & pc4 & pc5 & pc6 & pc7 & pc8 & pc9 & pc10 & pc12 & pc13;

    report "PC: " & to_hstring(pc);
    if tilt1 then report "TILT1"; end if;
    if tilt0 then report "TILT0"; end if;
    if dpe then report "DPE"; end if;
    if ipe then report "IPE"; end if;
    if promenable then report "PROMENABLE"; end if;
  end process;

  process
  begin
    wait for 0.1 ns;
  end process;

end;
