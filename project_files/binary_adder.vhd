library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity six_bit_adder is
        Port ( a : in  STD_LOGIC_VECTOR (5 downto 0);
               b : in  STD_LOGIC_VECTOR (5 downto 0);
               Cin : in  STD_LOGIC;
               s : out  STD_LOGIC_VECTOR (5 downto 0);
               Cout : out  STD_LOGIC);
end six_bit_adder;

architecture Behavioral of six_bit_adder is

component Full_adder is
    Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           z : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           carrout : out  STD_LOGIC);
			  end component;

signal carr: std_logic_VECTOR (5 downto 0);

begin

fa1 : Full_adder port map (a(0), b(0), cin, s(0), carr(1));
fa2 : Full_adder port map (a(1), b(1), carr(1), s(1), carr(2));
fa3 : Full_adder port map (a(2), b(2), carr(2), s(2), carr(3));
fa4 : Full_adder port map (a(3), b(3), carr(3), s(3), carr(4));
fa5 : Full_adder port map (a(4), b(4), carr(4), s(4), carr(5));
fa6 : Full_adder port map (a(5), b(5), carr(5), s(5), Cout);


end Behavioral;

