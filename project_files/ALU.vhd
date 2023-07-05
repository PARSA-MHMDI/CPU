------------------------------------------------------
--            	ALU 16-bit
------------------------------------------------------
-- Parsa Mohammadi       9923121
-- Atena Shircharandabi  9923043
------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity ALU is
	 
    Port (
    input1,input2  : in  STD_LOGIC_VECTOR(15 downto 0);  --AC & DR
    carry_in : in std_logic; -- E
	 input3  : in  STD_LOGIC_VECTOR(5 downto 0);  --OPCODE (for selecting function)
	 clk : in std_logic; --clk
	 enb : in std_logic; --ALU_on
    output  : inout  STD_LOGIC_VECTOR(15 downto 0); --ALU_out
    carry : out std_logic := '0' --ALU_carry
    );
	 
end ALU; 

architecture Behavioral of ALU is

component MLP is
    Port ( a,b : in  STD_LOGIC_VECTOR (5 downto 0);
           p : out  STD_LOGIC_VECTOR (11 downto 0));
			  
end component;

component SQR is
    Port ( A : in  STD_LOGIC_VECTOR (16 downto 1);
           q : out  STD_LOGIC_VECTOR (8 downto 1));
end component;

signal AC : std_logic_vector(15 downto 0) := std_logic_vector(to_unsigned(0, 16));
signal ml : std_logic_vector(11 downto 0) := (others => '0');
signal sq : std_logic_vector(7 downto 0) 	:=	(others => '0');
signal temp : std_logic_vector(16 downto 0) := std_logic_vector(to_unsigned(0, 17));
signal E : std_logic := '0';



begin

MLP1 : MLP port map (a => input1(5 downto 0), b => input2(5 downto 0), p => ml);
SQR1 : SQR port map (A => input1, q => sq);


process(input1,input2,input3,clk)
begin

  if (enb = '1') then
	  case(input3) is
		  
		  when "000001" => --AND
			output <= input1 and input2;

		  when "000100" => --ADD

			temp <= std_logic_vector(to_unsigned(to_integer(unsigned(input1)), 17))  + std_logic_vector(to_unsigned(to_integer(unsigned(input2)), 17));
			output<= temp( 15 downto 0);
			carry <= temp (16);
			
		  when "000101" => --Increment AC
			output <= input1 + '1';
			
		  when "001000" => --circular left shift
			AC(15 downto 1) <= input1(14 downto 0);
			AC(0) <= carry_in;
			output <= AC;
			E <= input1(15);	
			carry <= E;
			
		  when "001001" =>  --circular right shift
			AC(14 downto 0) <= input1(15 downto 1);
			E <= input1(0);
			AC(15) <= carry_in;
			carry <= E;
			output <= AC;
			
		  when "001110" => --linear left shift
			AC(15 downto 1) <= input1(14 downto 0);
			carry <= input1(15);
			AC(0) <= '0';
			output <= AC;

		  when "001111" => --linear right shift
			AC(14 downto 0) <= input1(15 downto 1);
			carry <= input1(0);
			AC(15) <= '0';
			 output <= AC;

		  when "010000" => --multiply
			output <= std_logic_vector(to_unsigned(to_integer(unsigned(ml)), 16));

		  when "100000" => --SQR
			output <= std_logic_vector(to_unsigned(to_integer(unsigned(sq)), 16));
			
			when others => -- Do nothing
			
			end case;
		else
		
			output <= std_logic_vector(to_unsigned(0, 16));
			carry <= '0';
	  
	  end if;
	  
end process;
 

 
end Behavioral;