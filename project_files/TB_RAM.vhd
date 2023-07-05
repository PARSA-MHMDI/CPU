------------------------------------------------------
--          TEST BENCH of 64X16 RAM
------------------------------------------------------
-- Parsa Mohammadi       9923121
-- Atena Shircharandabi  9923043
------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY TB_RAM IS
END TB_RAM;
 
ARCHITECTURE behavior OF TB_RAM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM
    PORT(
         address : IN  std_logic_vector(9 downto 0);
         data_in : IN  std_logic_vector(15 downto 0);
         read_write : IN  std_logic;
         clk : IN  std_logic;
         enb : IN  std_logic;
         data_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(9 downto 0) := (others => '0');
   signal data_in : std_logic_vector(15 downto 0) := (others => '0');
   signal read_write : std_logic := '0';
   signal clk : std_logic := '0';
   signal enb : std_logic := '0';

 	--Outputs
   signal data_out : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM PORT MAP (
          address => address,
          data_in => data_in,
          read_write => read_write,
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

		-- This is section we make RAM on
		enb <= '1';
		wait for clk_period;
		
		-- In this part we want to read first cell of RAM
		address <= std_logic_vector(to_unsigned(0, 10));
		read_write <= '1'; --read mode
		wait for clk_period*5;

		-- In this part we want to write at first cell of RAM
		address <= std_logic_vector(to_unsigned(0, 10));
		data_in <= std_logic_vector(to_unsigned(63, 16));
		read_write <= '0'; --wite mode
		wait for clk_period*5;

		-- In this part we want to read the first cell of RAM to see the data is placed or not.
		address <= std_logic_vector(to_unsigned(0, 10));
		read_write <= '1'; --read mode
		wait for clk_period*5;
		
		-- This is section we make RAM off
		enb <= '0';
		wait for clk_period*5;
		
		-- In this part we want to write at first cell of RAM and see it works when enb is '0'. (It should't work beacuse ram is off)
		address <= std_logic_vector(to_unsigned(0, 10));
		data_in <= "1111111111111111";
		read_write <= '0'; --wite mode
		wait for clk_period*5;


      wait;
   end process;

END;
