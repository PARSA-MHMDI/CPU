------------------------------------------------------
--          	Test Bench OF ALU
------------------------------------------------------
-- Parsa Mohammadi       9923121
-- Atena Shircharandabi  9923043
------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

 
ENTITY TB_ALU IS
END TB_ALU;
 
ARCHITECTURE behavior OF TB_ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         input1 : IN  std_logic_vector(15 downto 0);
         input2 : IN  std_logic_vector(15 downto 0);
         input3 : IN  std_logic_vector(5 downto 0);
			carry_in : in std_logic;
         clk : IN  std_logic;
         enb : IN  std_logic;
         output : inOUT  std_logic_vector(15 downto 0);
         carry : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal input1 : std_logic_vector(15 downto 0) := (others => '0');
   signal input2 : std_logic_vector(15 downto 0) := (others => '0');
   signal input3 : std_logic_vector(5 downto 0) := (others => '0');
   signal carry_in : std_logic; 
	signal clk : std_logic := '0';
   signal enb : std_logic := '1';

 	--Outputs
   signal output : std_logic_vector(15 downto 0);
   signal carry : std_logic;

   -- Clock period definitions
   constant clk_period : time := 1 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          input1 => input1,
          input2 => input2,
          input3 => input3,
			 carry_in => carry_in,
          clk => clk,
          enb => enb,
          output => output,
          carry => carry
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
		
		carry_in <= '0';
		
		-- ALU AND Opration test 
		input1 <= std_logic_vector(to_unsigned(63, 16));
		input2 <= std_logic_vector(to_unsigned(6, 16));
		input3 <= "000001";
		enb <= '1';
		wait for 10 ns;

		enb <= '0';
		wait for 100 ns;

		-- ALU ADD Opration test 
      input1 <= std_logic_vector(to_unsigned(5, 16));
		input2 <= std_logic_vector(to_unsigned(6, 16));
		input3 <= "000100";
		enb <= '1';
      wait for 10 ns;
		
      input1 <= std_logic_vector(to_unsigned(63, 16));
		input2 <= std_logic_vector(to_unsigned(6, 16));
		input3 <= "000100";
		enb <= '1';
      wait for 10 ns;
		
		-- Overflow test
      input1 <= "1111111111111111";
		input2 <= "0000000000000010";
		input3 <= "000100";
		enb <= '1';
      wait for 10 ns;
		
		enb <= '0';
		wait for 100 ns;		
		
		-- ALU Increment AC test
		input1 <= "0000000000000000";
		input2 <= "0000000000000000";
		input3 <= "000101";
		enb <= '1';
      wait for 10 ns;
		
		input1 <= "0000000010000100";
		input2 <= "0000000000000000";
		input3 <= "000101";
		enb <= '1';
      wait for 10 ns;			

		enb <= '0';
		wait for 100 ns;		

		-- ALU Circular left shift
		input1 <= "0000000000010000";
		input2 <= "0000000000000000";
		carry_in <= '1';
		input3 <= "001000";
		enb <= '1';
      wait for 10 ns;

		-- ALU Circular right shift
		input1 <= "0000000000010000";
		input2 <= "0000000000000000";
		carry_in <= '1';
		input3 <= "001001";
		enb <= '1';
      wait for 10 ns;

		enb <= '0';
		wait for 100 ns;

		-- ALU linear left shift
		input1 <= "0000000000010000";
		input2 <= "0000000000000000";
		input3 <= "001110";
		enb <= '1';
      wait for 10 ns;

		-- ALU linear right shift
		input1 <= "0000000000010000";
		input2 <= "0000000000000000";
		input3 <= "001111";
		enb <= '1';
      wait for 10 ns;

		enb <= '0';
		wait for 100 ns;

		-- ALU multiply
		input1 <= "0000000000010000";
		input2 <= "0000000000000100";
		input3 <= "010000";
		enb <= '1';
      wait for 10 ns;

		enb <= '0';
		wait for 100 ns;
		
		-- ALU SQR
		input1 <= "0000000000010000";
		input2 <= "0000000000000000";
		input3 <= "100000";
		enb <= '1';
      wait for 10 ns;

		enb <= '0';
		wait for 100 ns;
		
      wait;
   end process;

END;
