library ieee;
use ieee.std_logic_1164.all;
use work.cadr.all;

entity clock is
  port (
    -- Input signals
    \-clock_reset_b\ : in  std_logic;
    \-hang\          : in  std_logic;
    \-ilong\         : in  std_logic;
    sspeed0          : in  std_logic;
    sspeed1          : in  std_logic;
    machrun          : in  std_logic;
    \-machruna\      : in  std_logic;
    lcry3            : in  std_logic;
    reset            : in  std_logic;
    \-srcpdlidx\     : in  std_logic;
    \-srcpdlptr\     : in  std_logic;
    
    -- Output signals from cadr_clock1
    cyclecompleted   : out std_logic;
    \-tpr0\          : out std_logic;
    \-tpr10\         : out std_logic;
    \-tpr100\        : out std_logic;
    \-tpr105\        : out std_logic;
    \-tpr110\        : out std_logic;
    \-tpr115\        : out std_logic;
    \-tpr120\        : out std_logic;
    \-tpr120a\       : out std_logic;
    \-tpr125\        : out std_logic;
    \-tpr140\        : out std_logic;
    \-tpr15\         : out std_logic;
    \-tpr160\        : out std_logic;
    \-tpr180\        : out std_logic;
    \-tpr20\         : out std_logic;
    \-tpr200\        : out std_logic;
    \-tpr20a\        : out std_logic;
    \-tpr25\         : out std_logic;
    \-tpr40\         : out std_logic;
    \-tpr5\          : out std_logic;
    \-tpr60\         : out std_logic;
    \-tpr65\         : out std_logic;
    \-tpr70\         : out std_logic;
    \-tpr75\         : out std_logic;
    \-tpr80\         : out std_logic;
    \-tpr80a\        : out std_logic;
    \-tpr85\         : out std_logic;
    \-tprend\        : out std_logic;
    tprend           : out std_logic;
    \-tpw10\         : out std_logic;
    \-tpw20\         : out std_logic;
    \-tpw25\         : out std_logic;
    \-tpw30\         : out std_logic;
    \-tpw30a\        : out std_logic;
    \-tpw35\         : out std_logic;
    \-tpw40\         : out std_logic;
    \-tpw40a\        : out std_logic;
    \-tpw45\         : out std_logic;
    \-tpw50\         : out std_logic;
    \-tpw55\         : out std_logic;
    \-tpw60\         : out std_logic;
    \-tpw65\         : out std_logic;
    \-tpw70\         : out std_logic;
    \-tpw75\         : out std_logic;
    
    -- Output signals from cadr_clock2
    \-clk0\          : out std_logic;
    clk1             : out std_logic;
    clk2             : out std_logic;
    clk3             : out std_logic;
    clk4             : out std_logic;
    clk5             : out std_logic;
    \-mclk0\         : out std_logic;
    mclk1            : out std_logic;
    mclk5            : out std_logic;
    mclk7            : out std_logic;
    tpclk            : out std_logic;
    \-tpclk\         : out std_logic;
    \-tptse\         : out std_logic;
    tptse            : out std_logic;
    tpwp             : out std_logic;
    tpwpiram         : out std_logic;
    \-tse1\          : out std_logic;
    \-tse2\          : out std_logic;
    \-tse3\          : out std_logic;
    \-tse4\          : out std_logic;
    \-wp1\           : out std_logic;
    \-wp2\           : out std_logic;
    \-wp3\           : out std_logic;
    \-wp4\           : out std_logic;
    \-wp5\           : out std_logic;
    
    -- Output signals from cadr_clockd
    \-clk1\          : out std_logic;
    clk1a            : out std_logic;
    \-clk2a\         : out std_logic;
    clk2a            : out std_logic;
    clk2b            : out std_logic;
    \-clk2c\         : out std_logic;
    clk2c            : out std_logic;
    \-clk3a\         : out std_logic;
    clk3a            : out std_logic;
    clk3b            : out std_logic;
    clk3c            : out std_logic;
    \-clk3d\         : out std_logic;
    clk3d            : out std_logic;
    clk3e            : out std_logic;
    clk3f            : out std_logic;
    \-clk3g\         : out std_logic;
    \-clk4a\         : out std_logic;
    clk4a            : out std_logic;
    clk4b            : out std_logic;
    clk4c            : out std_logic;
    \-clk4d\         : out std_logic;
    clk4d            : out std_logic;
    \-clk4e\         : out std_logic;
    clk4e            : out std_logic;
    clk4f            : out std_logic;
    \-lcry3\         : out std_logic;
    \-mclk1\         : out std_logic;
    mclk1a           : out std_logic;
    \-reset\         : out std_logic;
    srcpdlidx        : out std_logic;
    srcpdlptr        : out std_logic;
    tse1a            : out std_logic;
    tse1b            : out std_logic;
    tse2             : out std_logic;
    tse3a            : out std_logic;
    tse4a            : out std_logic;
    tse4b            : out std_logic;
    \-upperhighok\   : out std_logic;
    wp1a             : out std_logic;
    wp1b             : out std_logic;
    wp2              : out std_logic;
    wp3a             : out std_logic;
    wp4a             : out std_logic;
    wp4b             : out std_logic;
    wp4c             : out std_logic
  );
end entity;

architecture rtl of clock is

begin

  clock1_inst: cadr_clock1 port map (
    \-clock reset b\ => \-clock_reset_b\,
    \-hang\          => \-hang\,
    \-ilong\         => \-ilong\,
    sspeed0          => sspeed0,
    sspeed1          => sspeed1,
    cyclecompleted   => cyclecompleted,
    \-tpr0\          => \-tpr0\,
    \-tpr10\         => \-tpr10\,
    \-tpr100\        => \-tpr100\,
    \-tpr105\        => \-tpr105\,
    \-tpr110\        => \-tpr110\,
    \-tpr115\        => \-tpr115\,
    \-tpr120\        => \-tpr120\,
    \-tpr120a\       => \-tpr120a\,
    \-tpr125\        => \-tpr125\,
    \-tpr140\        => \-tpr140\,
    \-tpr15\         => \-tpr15\,
    \-tpr160\        => \-tpr160\,
    \-tpr180\        => \-tpr180\,
    \-tpr20\         => \-tpr20\,
    \-tpr200\        => \-tpr200\,
    \-tpr20a\        => \-tpr20a\,
    \-tpr25\         => \-tpr25\,
    \-tpr40\         => \-tpr40\,
    \-tpr5\          => \-tpr5\,
    \-tpr60\         => \-tpr60\,
    \-tpr65\         => \-tpr65\,
    \-tpr70\         => \-tpr70\,
    \-tpr75\         => \-tpr75\,
    \-tpr80\         => \-tpr80\,
    \-tpr80a\        => \-tpr80a\,
    \-tpr85\         => \-tpr85\,
    \-tprend\        => \-tprend\,
    tprend           => tprend,
    \-tpw10\         => \-tpw10\,
    \-tpw20\         => \-tpw20\,
    \-tpw25\         => \-tpw25\,
    \-tpw30\         => \-tpw30\,
    \-tpw30a\        => \-tpw30a\,
    \-tpw35\         => \-tpw35\,
    \-tpw40\         => \-tpw40\,
    \-tpw40a\        => \-tpw40a\,
    \-tpw45\         => \-tpw45\,
    \-tpw50\         => \-tpw50\,
    \-tpw55\         => \-tpw55\,
    \-tpw60\         => \-tpw60\,
    \-tpw65\         => \-tpw65\,
    \-tpw70\         => \-tpw70\,
    \-tpw75\         => \-tpw75\
  );

  clock2_inst: cadr_clock2 port map (
    \-clock reset b\ => \-clock_reset_b\,
    machrun          => machrun,
    \-machruna\      => \-machruna\,
    \-tpr0\          => \-tpr0\,
    \-tpr25\         => \-tpr25\,
    \-tpr5\          => \-tpr5\,
    \-tprend\        => \-tprend\,
    \-tpw30\         => \-tpw30\,
    \-tpw45\         => \-tpw45\,
    \-tpw70\         => \-tpw70\,
    \-clk0\          => \-clk0\,
    clk1             => clk1,
    clk2             => clk2,
    clk3             => clk3,
    clk4             => clk4,
    clk5             => clk5,
    \-mclk0\         => \-mclk0\,
    mclk1            => mclk1,
    mclk5            => mclk5,
    mclk7            => mclk7,
    tpclk            => tpclk,
    \-tpclk\         => \-tpclk\,
    \-tptse\         => \-tptse\,
    tptse            => tptse,
    tpwp             => tpwp,
    tpwpiram         => tpwpiram,
    \-tse1\          => \-tse1\,
    \-tse2\          => \-tse2\,
    \-tse3\          => \-tse3\,
    \-tse4\          => \-tse4\,
    \-wp1\           => \-wp1\,
    \-wp2\           => \-wp2\,
    \-wp3\           => \-wp3\,
    \-wp4\           => \-wp4\,
    \-wp5\           => \-wp5\
  );

  clockd_inst: cadr_clockd port map (
    clk1            => clk1,
    clk2            => clk2,
    clk3            => clk3,
    clk4            => clk4,
    lcry3           => lcry3,
    mclk1           => mclk1,
    reset           => reset,
    \-srcpdlidx\    => \-srcpdlidx\,
    \-srcpdlptr\    => \-srcpdlptr\,
    \-tse1\         => \-tse1\,
    \-tse2\         => \-tse2\,
    \-tse3\         => \-tse3\,
    \-tse4\         => \-tse4\,
    \-wp1\          => \-wp1\,
    \-wp2\          => \-wp2\,
    \-wp3\          => \-wp3\,
    \-wp4\          => \-wp4\,
    \-clk1\         => \-clk1\,
    clk1a           => clk1a,
    \-clk2a\        => \-clk2a\,
    clk2a           => clk2a,
    clk2b           => clk2b,
    \-clk2c\        => \-clk2c\,
    clk2c           => clk2c,
    \-clk3a\        => \-clk3a\,
    clk3a           => clk3a,
    clk3b           => clk3b,
    clk3c           => clk3c,
    \-clk3d\        => \-clk3d\,
    clk3d           => clk3d,
    clk3e           => clk3e,
    clk3f           => clk3f,
    \-clk3g\        => \-clk3g\,
    \-clk4a\        => \-clk4a\,
    clk4a           => clk4a,
    clk4b           => clk4b,
    clk4c           => clk4c,
    \-clk4d\        => \-clk4d\,
    clk4d           => clk4d,
    \-clk4e\        => \-clk4e\,
    clk4e           => clk4e,
    clk4f           => clk4f,
    \-lcry3\        => \-lcry3\,
    \-mclk1\        => \-mclk1\,
    mclk1a          => mclk1a,
    \-reset\        => \-reset\,
    srcpdlidx       => srcpdlidx,
    srcpdlptr       => srcpdlptr,
    tse1a           => tse1a,
    tse1b           => tse1b,
    tse2            => tse2,
    tse3a           => tse3a,
    tse4a           => tse4a,
    tse4b           => tse4b,
    \-upperhighok\  => \-upperhighok\,
    wp1a            => wp1a,
    wp1b            => wp1b,
    wp2             => wp2,
    wp3a            => wp3a,
    wp4a            => wp4a,
    wp4b            => wp4b,
    wp4c            => wp4c
  );

end architecture; 