library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_adder is
    Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           z : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           carrout : out  STD_LOGIC);
end Full_adder;

architecture Behavioral of Full_adder is

component half_adder is port (a, b : in STD_LOGIC;
										c, s : out STD_LOGIC);
										end component;
signal carr1,s, carr2: std_logic;

begin

ha1 : half_adder port map (x, y , carr1 ,s);
ha2 : half_adder port map ( s, z , carr2, sum );
carrout <= carr1 or carr2;


end Behavioral;

