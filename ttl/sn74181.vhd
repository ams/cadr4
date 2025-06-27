-- Arithmetic Logic Units/Function Generators
-- SN74181 4-bit Arithmetic Logic Unit

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.misc.all;

entity sn74181 is
  port (
    -- Control and status
    m      : in  std_logic;  -- Mode: 1=Logic, 0=Arithmetic
    cin_n  : in  std_logic;  -- Carry in (active low)
    cout_n : out std_logic;  -- Carry out (active low)
    aeb    : out std_logic;  -- A equals B
    x      : out std_logic;  -- Carry propagate
    y      : out std_logic;  -- Carry generate
    
    -- Function select
    s3, s2, s1, s0 : in std_logic;
    
    -- Data inputs (active high)
    a3, a2, a1, a0 : in std_logic;
    b3, b2, b1, b0 : in std_logic;
    
    -- Function outputs (active high)
    f3, f2, f1, f0 : out std_logic
    );
end;

architecture ttl of sn74181 is
  signal m_i, cin_n_i, s3_i, s2_i, s1_i, s0_i : std_logic;
  signal a3_i, a2_i, a1_i, a0_i : std_logic;
  signal b3_i, b2_i, b1_i, b0_i : std_logic;
  signal a_vec   : std_logic_vector(3 downto 0);
  signal b_vec   : std_logic_vector(3 downto 0);
  signal sel     : std_logic_vector(3 downto 0);
  signal cin     : std_logic;

  -- Helper functions for unknown input detection
  function has_unknown(vec : std_logic_vector) return boolean is
  begin
    for i in vec'range loop
      if vec(i) /= '0' and vec(i) /= '1' then
        return true;
      end if;
    end loop;
    return false;
  end function;

  function is_unknown(sig : std_logic) return boolean is
  begin
    return (sig /= '0' and sig /= '1');
  end function;

begin

  -- Input conditioning
  m_i <= ttl_input(m);
  cin_n_i <= ttl_input(cin_n);
  s3_i <= ttl_input(s3);
  s2_i <= ttl_input(s2);
  s1_i <= ttl_input(s1);
  s0_i <= ttl_input(s0);
  a3_i <= ttl_input(a3);
  a2_i <= ttl_input(a2);
  a1_i <= ttl_input(a1);
  a0_i <= ttl_input(a0);
  b3_i <= ttl_input(b3);
  b2_i <= ttl_input(b2);
  b1_i <= ttl_input(b1);
  b0_i <= ttl_input(b0);

  a_vec <= a3_i & a2_i & a1_i & a0_i;
  b_vec <= b3_i & b2_i & b1_i & b0_i;
  sel <= s3_i & s2_i & s1_i & s0_i;
  cin <= not cin_n_i;  -- Convert active low to active high

  process(all)
    variable a_int, b_int : unsigned(3 downto 0);
    variable f_result : std_logic_vector(3 downto 0);
    variable cout_var : std_logic;
    variable sum : unsigned(4 downto 0);
    variable x_var, y_var : std_logic;
  begin
    -- Check for unknown inputs
    if has_unknown(a_vec) or has_unknown(b_vec) or has_unknown(sel) or 
       is_unknown(m_i) or is_unknown(cin_n_i) then
      f0 <= 'X';
      f1 <= 'X';
      f2 <= 'X';
      f3 <= 'X';
      cout_n <= 'X';
      aeb <= 'X';
      x <= 'X';
      y <= 'X';
    else

    a_int := unsigned(a_vec);
    b_int := unsigned(b_vec);
    cout_var := '0';
    x_var := '0';
    y_var := '0';

    if m_i = '1' then
      -- Logic mode - Table 2 from datasheet (Active High Data)
      case sel is
        when "0000" => f_result := not a_vec;                    -- F = NOT A
        when "0001" => f_result := not (a_vec or b_vec);         -- F = NOT(A+B)  
        when "0010" => f_result := (not a_vec) and b_vec;        -- F = (NOT A)B
        when "0011" => f_result := "0000";                       -- F = 0
        when "0100" => f_result := not (a_vec and b_vec);        -- F = NOT(AB)
        when "0101" => f_result := not b_vec;                    -- F = NOT B
        when "0110" => f_result := a_vec xor b_vec;              -- F = A XOR B
        when "0111" => f_result := a_vec and (not b_vec);        -- F = A(NOT B)
        when "1000" => f_result := (not a_vec) or b_vec;         -- F = (NOT A)+B
        when "1001" => f_result := not (a_vec xor b_vec);        -- F = NOT(A XOR B)
        when "1010" => f_result := b_vec;                        -- F = B
        when "1011" => f_result := a_vec and b_vec;              -- F = AB
        when "1100" => f_result := "1111";                       -- F = 1
        when "1101" => f_result := a_vec or (not b_vec);         -- F = A+(NOT B)
        when "1110" => f_result := a_vec or b_vec;               -- F = A+B
        when "1111" => f_result := a_vec;                        -- F = A
        when others => f_result := "XXXX";
      end case;
      
      -- In logic mode, carry outputs are not meaningful
      cout_var := '0';
      x_var := '0';
      y_var := '0';

    else
      -- Arithmetic mode - Table 2 from datasheet (Active High Data)
      case sel is
        when "0000" =>  -- F = A / A+1
          if cin = '0' then
            sum := ('0' & a_int);
          else
            sum := ('0' & a_int) + 1;
          end if;
        
        when "0001" =>  -- F = A+B / (A+B)+1
          if cin = '0' then
            sum := ('0' & a_int) + ('0' & b_int);
          else
            sum := ('0' & a_int) + ('0' & b_int) + 1;
          end if;
        
        when "0010" =>  -- F = A+(NOT B) / (A+(NOT B))+1
          if cin = '0' then
            sum := ('0' & a_int) + ('0' & (not b_int));
          else
            sum := ('0' & a_int) + ('0' & (not b_int)) + 1;
          end if;
        
        when "0011" =>  -- F = -1 (2's complement) / 0
          if cin = '0' then
            sum := "11111";  -- -1 in 2's complement (all 1s)
          else
            sum := "00000";  -- 0
          end if;
        
        when "0100" =>  -- F = A + A(NOT B) / A + A(NOT B) + 1
          if cin = '0' then
            sum := ('0' & a_int) + ('0' & (a_int and (not b_int)));
          else
            sum := ('0' & a_int) + ('0' & (a_int and (not b_int))) + 1;
          end if;
        
        when "0101" =>  -- F = (A+B) + A(NOT B) / (A+B) + A(NOT B) + 1
          if cin = '0' then
            sum := ('0' & (a_int or b_int)) + ('0' & (a_int and (not b_int)));
          else
            sum := ('0' & (a_int or b_int)) + ('0' & (a_int and (not b_int))) + 1;
          end if;
        
        when "0110" =>  -- F = A - B - 1 / A - B
          if cin = '0' then
            sum := ('0' & a_int) - ('0' & b_int) - 1;
          else
            sum := ('0' & a_int) - ('0' & b_int);
          end if;
        
        when "0111" =>  -- F = A(NOT B) - 1 / A(NOT B)
          if cin = '0' then
            sum := ('0' & (a_int and (not b_int))) - 1;
          else
            sum := ('0' & (a_int and (not b_int)));
          end if;
        
        when "1000" =>  -- F = A + AB / A + AB + 1
          if cin = '0' then
            sum := ('0' & a_int) + ('0' & (a_int and b_int));
          else
            sum := ('0' & a_int) + ('0' & (a_int and b_int)) + 1;
          end if;
        
        when "1001" =>  -- F = A + B / A + B + 1
          if cin = '0' then
            sum := ('0' & a_int) + ('0' & b_int);
          else
            sum := ('0' & a_int) + ('0' & b_int) + 1;
          end if;
        
        when "1010" =>  -- F = (A+(NOT B)) + AB / (A+(NOT B)) + AB + 1
          if cin = '0' then
            sum := ('0' & (a_int or (not b_int))) + ('0' & (a_int and b_int));
          else
            sum := ('0' & (a_int or (not b_int))) + ('0' & (a_int and b_int)) + 1;
          end if;
        
        when "1011" =>  -- F = AB - 1 / AB
          if cin = '0' then
            sum := ('0' & (a_int and b_int)) - 1;
          else
            sum := ('0' & (a_int and b_int));
          end if;
        
        when "1100" =>  -- F = A + A (shift left) / A + A + 1
          if cin = '0' then
            sum := ('0' & a_int) + ('0' & a_int);
          else
            sum := ('0' & a_int) + ('0' & a_int) + 1;
          end if;
        
        when "1101" =>  -- F = (A+B) + A / (A+B) + A + 1
          if cin = '0' then
            sum := ('0' & (a_int or b_int)) + ('0' & a_int);
          else
            sum := ('0' & (a_int or b_int)) + ('0' & a_int) + 1;
          end if;
        
        when "1110" =>  -- F = (A+(NOT B)) + A / (A+(NOT B)) + A + 1
          if cin = '0' then
            sum := ('0' & (a_int or (not b_int))) + ('0' & a_int);
          else
            sum := ('0' & (a_int or (not b_int))) + ('0' & a_int) + 1;
          end if;
        
        when "1111" =>  -- F = A - 1 / A
          if cin = '0' then
            sum := ('0' & a_int) - 1;
          else
            sum := ('0' & a_int);
          end if;
        
        when others =>
          sum := "00000";
      end case;
      
      f_result := std_logic_vector(sum(3 downto 0));
      cout_var := sum(4);
      
      -- Calculate carry propagate (X) and carry generate (Y)
      -- X = 1 when all bit positions can propagate carry (A XOR B for all bits)
      x_var := (a0_i xor b0_i) and (a1_i xor b1_i) and (a2_i xor b2_i) and (a3_i xor b3_i);
      -- Y = carry generate (same as carry out)
      y_var := cout_var;
    end if;

    -- Assign outputs
    f0 <= f_result(0);
    f1 <= f_result(1);
    f2 <= f_result(2);
    f3 <= f_result(3);
    cout_n <= not cout_var;  -- Convert to active low
    
    -- A equals B comparison (only valid in subtract mode)
    if a_vec = b_vec then
      aeb <= '1';
    else
      aeb <= '0';
    end if;
    
    x <= x_var;
    y <= y_var;
    
    end if;  -- End of unknown input check
  end process;

end;
