------------------------------------------------------
--            TB State Machine
------------------------------------------------------
-- Parsa Mohammadi       9923121
-- Atena Shircharandabi  9923043
------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

 
ENTITY TB_state_machine IS
END TB_state_machine;
 
ARCHITECTURE behavior OF TB_state_machine IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT state_machine
    PORT(
         clk : IN  std_logic;
         nRst : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal nRst : std_logic := '0';

   -- Clock period definitions
   constant clk_period : time := 1 ns;
	constant clk_frequency : integer := 1000 ms / clk_period;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: state_machine PORT MAP (
          clk => clk,
          nRst => nRst
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin			
		
		wait for 100ns;
		
		nRst <= '0';

      wait for 100ns;
		
		--nRst <= '1';

      --wait for 100ns;

      -- insert stimulus here 

      wait;
   end process;

END;
