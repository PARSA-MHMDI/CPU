library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity six_by_six_multiplier is
    Port ( A : in  STD_LOGIC_VECTOR (5 downto 0);
           B : in  STD_LOGIC_VECTOR (5 downto 0);
           P : out  STD_LOGIC_VECTOR (11 downto 0);
			  clk : in std_logic
			 );
end six_by_six_multiplier;

architecture Behavioral of six_by_six_multiplier is

component six_bit_adder is Port ( a : in  STD_LOGIC_VECTOR (5 downto 0);
											  b : in  STD_LOGIC_VECTOR (5 downto 0);
											  Cin : in  STD_LOGIC;
											  s : out  STD_LOGIC_VECTOR (5 downto 0);
											  Cout : out  STD_LOGIC);
end component;
	 
	 
signal X1, X2, X3, X4, X5, Y1, Y2, Y3, Y4, Y5 : STD_LOGIC_VECTOR (5 downto 0);
signal S1, S2, S3, S4, S5 : STD_LOGIC_VECTOR(5 downto 0);
signal Cout1, Cout2, Cout3, Cout4, Cout5: STD_LOGIC;

begin
 -- Add the partial products using binary adders
 binary_adder1: six_bit_adder port map(X1, Y1, '0', S1, Cout1);
 binary_adder2: six_bit_adder port map(X2, Y2, '0', S2, Cout2);
 binary_adder3: six_bit_adder port map(X3, Y3, '0', S3, Cout3);
 binary_adder4: six_bit_adder port map(X4, Y4, '0', S4, Cout4);
 binary_adder5: six_bit_adder port map(X5, Y5, '0', P(10 downto 5), p(11));

	process(clk)
	begin
			 P <= std_logic_vector(to_unsigned(to_integer(unsigned(A)), 12)) * std_logic_vector(to_unsigned(to_integer(unsigned(B)), 12));
	end process;	 
	 

end Behavioral;
