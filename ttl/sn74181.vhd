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
    cin_n  : in  std_logic;  -- Carry in (active low) - matches Verilog CNb
    cout_n : out std_logic;  -- Carry out (active low) - matches Verilog CN4b
    aeb    : out std_logic;  -- A equals B
    x      : out std_logic;  -- Carry propagate
    y      : out std_logic;  -- Carry generate
    
    -- Function select - matches Verilog S[3:0]
    s3, s2, s1, s0 : in std_logic;
    
    -- Data inputs (active high) - matches Verilog A[3:0], B[3:0]
    a3, a2, a1, a0 : in std_logic;
    b3, b2, b1, b0 : in std_logic;
    
    -- Function outputs (active high) - matches Verilog F[3:0]
    f3, f2, f1, f0 : out std_logic
    );
end;

-- Behavioral architecture implementing SN74181 function table directly
-- This handles X inputs more predictably than the gate-level implementation
architecture behavioral of sn74181 is
  -- Input conditioning signals
  signal m_i, cin_n_i, s3_i, s2_i, s1_i, s0_i : std_logic;
  signal a3_i, a2_i, a1_i, a0_i : std_logic;
  signal b3_i, b2_i, b1_i, b0_i : std_logic;
  
  -- Internal vectors for easier manipulation
  signal a_vec, b_vec : std_logic_vector(3 downto 0);
  signal s_vec : std_logic_vector(3 downto 0);
  signal f_vec : std_logic_vector(3 downto 0);
  signal cin : std_logic;  -- carry in (active high)
  
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

  -- Create vectors for easier processing
  a_vec <= a3_i & a2_i & a1_i & a0_i;
  b_vec <= b3_i & b2_i & b1_i & b0_i;
  s_vec <= s3_i & s2_i & s1_i & s0_i;
  cin <= not cin_n_i;  -- Convert active low to active high

  -- Main ALU function process
  process(all)
    variable a_int, b_int : unsigned(3 downto 0);
    variable result : unsigned(4 downto 0);  -- 5 bits to capture carry
    variable f_temp : std_logic_vector(3 downto 0);
    variable cout_temp : std_logic;
    variable x_temp, y_temp : std_logic;
    variable aeb_temp : std_logic;
  begin
    -- Initialize outputs to avoid latches
    f_temp := "0000";
    cout_temp := '1';  -- carry out inactive (active low)
    x_temp := '0';
    y_temp := '0';
    aeb_temp := '0';
    
    -- Check for X inputs and handle them appropriately
    if is_x(a_vec) or is_x(b_vec) or is_x(s_vec) or is_x(m_i) or is_x(cin_n_i) then
      -- Special handling for SETZ function (S=0011) - should always output 0
      if s_vec = "0011" and m_i = '1' then
        f_temp := "0000";  -- SETZ always outputs 0 regardless of inputs
        cout_temp := '1';  -- No carry out in logic mode
        x_temp := '1';     -- Propagate = 1 for SETZ
        y_temp := '0';     -- Generate = 0 for SETZ
        aeb_temp := '1';   -- AEB = 1 when F = 0000
      -- Special handling for SETO function (S=1100) - should always output 1
      elsif s_vec = "1100" and m_i = '1' then
        f_temp := "1111";  -- SETO always outputs 1 regardless of inputs
        cout_temp := '1';  -- No carry out in logic mode
        x_temp := '0';     -- Propagate = 0 for SETO
        y_temp := '1';     -- Generate = 1 for SETO
        aeb_temp := '1';   -- AEB = 1 when F = 1111
      else
        -- For other functions with X inputs, propagate X
        f_temp := "XXXX";
        cout_temp := 'X';
        x_temp := 'X';
        y_temp := 'X';
        aeb_temp := 'X';
      end if;
    else
      -- Normal operation with valid inputs
      a_int := unsigned(a_vec);
      b_int := unsigned(b_vec);
      
      if m_i = '1' then
        -- Logic Mode - implement function table directly
        case s_vec is
          when "0000" => f_temp := not a_vec;                    -- NOT A
          when "0001" => f_temp := not (a_vec or b_vec);         -- NOT(A+B)
          when "0010" => f_temp := (not a_vec) and b_vec;        -- (NOT A)B
          when "0011" => f_temp := "0000";                       -- 0 (SETZ)
          when "0100" => f_temp := not (a_vec and b_vec);        -- NOT(AB)
          when "0101" => f_temp := not b_vec;                    -- NOT B
          when "0110" => f_temp := a_vec xor b_vec;              -- A XOR B
          when "0111" => f_temp := a_vec and (not b_vec);        -- A(NOT B)
          when "1000" => f_temp := (not a_vec) or b_vec;         -- (NOT A)+B
          when "1001" => f_temp := not (a_vec xor b_vec);        -- NOT(A XOR B)
          when "1010" => f_temp := b_vec;                        -- B
          when "1011" => f_temp := a_vec and b_vec;              -- AB
          when "1100" => f_temp := "1111";                       -- 1 (SETO)
          when "1101" => f_temp := a_vec or (not b_vec);         -- A+(NOT B)
          when "1110" => f_temp := a_vec or b_vec;               -- A+B
          when "1111" => f_temp := a_vec;                        -- A
          when others => f_temp := "XXXX";
        end case;
        
        -- Logic mode outputs
        cout_temp := '1';  -- No carry out in logic mode
        
        -- X and Y generation for logic mode (simplified)
        case s_vec is
          when "0011" => x_temp := '1'; y_temp := '0';  -- SETZ
          when "1100" => x_temp := '0'; y_temp := '1';  -- SETO
          when others => x_temp := '1'; y_temp := '0';  -- Default for other logic functions
        end case;
        
      else
        -- Arithmetic Mode - implement arithmetic operations
        case s_vec is
          when "0000" => -- A (Cn=0) / A+1 (Cn=1)
            if cin = '0' then
              result := resize(a_int, 5);
            else
              result := resize(a_int, 5) + 1;
            end if;
            
          when "0001" => -- (A+B) logical OR (Cn=0) / (A+B)+1 (Cn=1)
            if cin = '0' then
              result := resize(unsigned(a_vec or b_vec), 5);
            else
              result := resize(unsigned(a_vec or b_vec), 5) + 1;
            end if;
            
          when "0010" => -- A+(NOT B) (Cn=0) / (A+(NOT B))+1 (Cn=1)
            if cin = '0' then
              result := resize(unsigned(a_vec or (not b_vec)), 5);
            else
              result := resize(unsigned(a_vec or (not b_vec)), 5) + 1;
            end if;
            
          when "0011" => -- Minus 1 (Cn=0) / 0 (Cn=1)
            if cin = '0' then
              result := "11111";  -- -1 in 2's complement
            else
              result := "00000";  -- 0
            end if;
            
          when "0100" => -- A+(A AND NOT B) (Cn=0) / A+(A AND NOT B)+1 (Cn=1)
            if cin = '0' then
              result := resize(a_int, 5) + resize(unsigned(a_vec and (not b_vec)), 5);
            else
              result := resize(a_int, 5) + resize(unsigned(a_vec and (not b_vec)), 5) + 1;
            end if;
            
          when "0101" => -- (A+B)+(A AND NOT B) (Cn=0) / (A+B)+(A AND NOT B)+1 (Cn=1)
            if cin = '0' then
              result := resize(unsigned(a_vec or b_vec) + unsigned(a_vec and (not b_vec)), 5);
            else
              result := resize(unsigned(a_vec or b_vec) + unsigned(a_vec and (not b_vec)), 5) + 1;
            end if;
            
          when "0110" => -- A-B-1 (Cn=0) / A-B (Cn=1)
            if cin = '0' then
              result := resize(a_int, 5) - resize(b_int, 5) - 1;
            else
              result := resize(a_int, 5) - resize(b_int, 5);
            end if;
            
          when "0111" => -- (A AND NOT B)-1 (Cn=0) / (A AND NOT B) (Cn=1)
            if cin = '0' then
              result := resize(unsigned(a_vec and (not b_vec)), 5) - 1;
            else
              result := resize(unsigned(a_vec and (not b_vec)), 5);
            end if;
            
          when "1000" => -- A+(A AND B) (Cn=0) / A+(A AND B)+1 (Cn=1)
            if cin = '0' then
              result := resize(a_int, 5) + resize(unsigned(a_vec and b_vec), 5);
            else
              result := resize(a_int, 5) + resize(unsigned(a_vec and b_vec), 5) + 1;
            end if;
            
          when "1001" => -- A+B (Cn=0) / A+B+1 (Cn=1)
            if cin = '0' then
              result := resize(a_int, 5) + resize(b_int, 5);
            else
              result := resize(a_int, 5) + resize(b_int, 5) + 1;
            end if;
            
          when "1010" => -- (A+NOT B)+(A AND B) (Cn=0) / (A+NOT B)+(A AND B)+1 (Cn=1)
            if cin = '0' then
              result := resize(unsigned(a_vec or (not b_vec)) + unsigned(a_vec and b_vec), 5);
            else
              result := resize(unsigned(a_vec or (not b_vec)) + unsigned(a_vec and b_vec), 5) + 1;
            end if;
            
          when "1011" => -- (A AND B)-1 (Cn=0) / (A AND B) (Cn=1)
            if cin = '0' then
              result := resize(unsigned(a_vec and b_vec), 5) - 1;
            else
              result := resize(unsigned(a_vec and b_vec), 5);
            end if;
            
          when "1100" => -- A+A (Cn=0) / A+A+1 (Cn=1) [shift left]
            if cin = '0' then
              result := resize(a_int, 5) + resize(a_int, 5);
            else
              result := resize(a_int, 5) + resize(a_int, 5) + 1;
            end if;
            
          when "1101" => -- (A+B)+(A+B) (Cn=0) / (A+B)+(A+B)+1 (Cn=1)
            if cin = '0' then
              result := resize((unsigned(a_vec or b_vec)) + (unsigned(a_vec or b_vec)), 5);
            else
              result := resize((unsigned(a_vec or b_vec)) + (unsigned(a_vec or b_vec)), 5) + 1;
            end if;
            
          when "1110" => -- (A+NOT B)+(A+NOT B) (Cn=0) / (A+NOT B)+(A+NOT B)+1 (Cn=1)
            if cin = '0' then
              result := resize((unsigned(a_vec or (not b_vec))) + (unsigned(a_vec or (not b_vec))), 5);
            else
              result := resize((unsigned(a_vec or (not b_vec))) + (unsigned(a_vec or (not b_vec))), 5) + 1;
            end if;
            
          when "1111" => -- A-1 (Cn=0) / A (Cn=1)
            if cin = '0' then
              result := resize(a_int, 5) - 1;
            else
              result := resize(a_int, 5);
            end if;
            
          when others =>
            result := "XXXXX";
        end case;
        
        f_temp := std_logic_vector(result(3 downto 0));
        
        -- Carry out logic depends on the operation type
        case s_vec is
          when "0110" | "0111" | "1011" | "1111" => -- Subtraction operations
            -- For subtraction, borrow logic is different
            -- For A=B cases, no borrow should occur
            if a_int = b_int then
              cout_temp := '1';  -- No borrow for A=B
            else
              cout_temp := not result(4);  -- Standard borrow logic
            end if;
          when others => -- Addition and other operations
            cout_temp := not result(4);  -- Convert to active low
        end case;
        
        -- Generate X (propagate) and Y (generate) for arithmetic mode
        -- Simplified implementation - proper implementation would require more complex logic
        if result(4) = '1' then
          y_temp := '1';  -- Generate carry
        else
          y_temp := '0';
        end if;
        
        -- X is more complex and depends on the specific operation
        -- For now, simplified implementation based on result
        if result(3 downto 0) = "1111" then
          x_temp := '0';  -- No propagate when all bits are 1
        else
          x_temp := '1';  -- Default propagate
        end if;
      end if;
      
      -- A equals B detection (when F = 1111)
      if f_temp = "1111" then
        aeb_temp := '1';
      else
        aeb_temp := '0';
      end if;
    end if;
    
    -- Assign outputs
    f_vec <= f_temp;
    cout_n <= cout_temp;
    x <= x_temp;
    y <= y_temp;
    
    -- A=B output is open collector !
    if aeb_temp = '1' then
      aeb <= 'Z';
    else
      aeb <= aeb_temp;
    end if;
  end process;

  -- Output assignments
  f0 <= f_vec(0);
  f1 <= f_vec(1);
  f2 <= f_vec(2);
  f3 <= f_vec(3);

end architecture;
