------------------------------------------------------
--          TEST BENCH of 64X16 ROM
------------------------------------------------------
-- Parsa Mohammadi       9923121
-- Atena Shircharandabi  9923043
------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

 
ENTITY TB_ROM IS
END TB_ROM;
 
ARCHITECTURE behavior OF TB_ROM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROM
    PORT(
         address : IN  std_logic_vector(9 downto 0);
         clk : IN  std_logic;
         enb : IN  std_logic;
         data_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(9 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal enb : std_logic := '0';

 	--Outputs
   signal data_out : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROM PORT MAP (
          address => address,
          clk => clk,
          enb => enb,
          data_out => data_out
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

		enb <= '1'; -- ROM is on

		-- In this part we want to read the first an second cells of ROM.
		address <= std_logic_vector(to_unsigned(0, 10));
		wait for clk_period*5;

		address <= std_logic_vector(to_unsigned(1, 10));
		wait for clk_period*5;
		
		enb <= '0'; -- ROM is off
		wait for clk_period*5;

		-- In this part we want to read the first an second cells of ROM when rom is off. I shouldn't show any data.
		address <= std_logic_vector(to_unsigned(0, 10));
		wait for clk_period*5;

		address <= std_logic_vector(to_unsigned(1, 10));
		wait for clk_period*5;
		


      wait;
   end process;

END;
