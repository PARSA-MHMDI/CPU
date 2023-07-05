------------------------------------------------------
--           Test Bench of Full Adder
------------------------------------------------------
-- Parsa Mohammadi       9923121
-- Atena Shircharandabi  9923043
------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

 
ENTITY TB_full_adder IS
END TB_full_adder;
 
ARCHITECTURE behavior OF TB_full_adder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Full_adder
    PORT(
         input1 : IN  std_logic;
         input2 : IN  std_logic;
         cin : IN  std_logic;
         sum : OUT  std_logic;
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal input1 : std_logic := '0';
   signal input2 : std_logic := '0';
   signal cin : std_logic := '0';

 	--Outputs
   signal sum : std_logic;
   signal cout : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Full_adder PORT MAP (
          input1 => input1,
          input2 => input2,
          cin => cin,
          sum => sum,
          cout => cout
        );
		  
		  
   -- Stimulus process
   stim_proc: process
		variable count : std_logic_vector(2 downto 0) := "000";
		begin
		
				--While loop was implemented to test all possible inputs quickly
				while (count < "100") loop
					input1 <= count(0);
					input2 <= count(1);
					
					count := count + 1;
					wait for 100 ns;
				end loop;

      wait;
   end process;

END;
