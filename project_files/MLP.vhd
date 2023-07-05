library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MLP is
    Port ( a,b : in  STD_LOGIC_VECTOR (5 downto 0) := (others => '0');
           p : out  STD_LOGIC_VECTOR (11 downto 0));
			  
end MLP;

architecture Behavioral of MLP is

component HA is
port(			a : in STD_LOGIC;
				b : in STD_LOGIC;
				s : out STD_LOGIC;
				c : out STD_LOGIC);
end component;

component FA is
    Port ( in1, in2, cin : in  STD_LOGIC;
           S, cout : out  STD_LOGIC);
end component;


signal carry : STD_LOGIC_VECTOR (28 downto 0);
signal sum : STD_LOGIC_VECTOR (19 downto 0);
signal d : STD_LOGIC_VECTOR (32 downto 0);

begin
-------------- sec 1 ---------------

p(0) <= a(0) and b(0);

-------------- sec 2 ---------------
d(0) <= a(0) and b(1);
d(1) <= a(1) and b(0);

ha1 : HA port map (a => d(0), b => d(1), s => p(1), c => carry(0));

-------------- sec 3 ---------------
d(2) <= a(2) and b(0);
d(3) <= a(1) and b(1);
d(4) <= a(0) and b(2);

ha2 : HA port map (a => d(2), b => d(3), s => sum(0), c => carry(1));
fa1 : FA port map (in1 => sum(0), in2 => d(4) , cin => carry(0), s => p(2), cout => carry(2));

-------------- sec 4 ---------------   
d(5) <= a(3) and b(0);
d(6) <= a(1) and b(2);
d(7) <= a(0) and b(3);

ha3 : HA port map (a => d(5), b => d(6), s => sum(1), c => carry(3));
fa2 : FA port map (in1 => sum(1), in2 => d(6), cin => carry(1), s => sum(2), cout => carry(4));
fa3 : FA port map (in1 => sum(2), in2 => d(7), cin => carry(2), s => p(3), cout => carry(5));

-------------- sec 5 ---------------   

d(8) <= a(3) and b(0);
d(9) <= a(1) and b(2);
d(10) <= a(0) and b(3);
d(11) <= a(0) and b(4);

ha4 : HA port map (a => d(8), b => d(9), s => sum(3), c => carry(6));
fa4 : FA port map (in1 => sum(3), in2 => d(9), cin => carry(3), s => sum(4), cout => carry(7));
fa5 : FA port map (in1 => sum(4), in2 => d(10), cin => carry(4), s => sum(5), cout => carry(8));
fa6 : FA port map (in1 => sum(5), in2 => d(11), cin => carry(5), s => p(4), cout => carry(9));

-------------- sec 6 ---------------   

d(12) <= a(5) and b(0);
d(13) <= a(4) and b(1);
d(14) <= a(3) and b(2);
d(15) <= a(2) and b(3);
d(16) <= a(1) and b(4);
d(17) <= a(0) and b(5);

ha5 : HA port map (a => d(12), b => d(13), s => sum(6), c => carry(10));
fa7 : FA port map (in1 => sum(6), in2 => d(14), cin => carry(6), s => sum(7), cout => carry(11));
fa8 : FA port map (in1 => sum(7), in2 => d(15), cin => carry(7), s => sum(8), cout => carry(12));
fa9 : FA port map (in1 => sum(8), in2 => d(16), cin => carry(8), s => sum(9), cout => carry(13));
fa10 : FA port map (in1 => sum(9), in2 => d(17), cin => carry(9), s => p(5), cout => carry(14));

-------------- sec 7 ---------------   

d(18) <= a(5) and b(1);
d(19) <= a(4) and b(2);
d(20) <= a(3) and b(3);
d(21) <= a(2) and b(4);
d(22) <= a(1) and b(5);

fa11 : FA port map (in1 => d(18), in2 => d(19), cin => carry(10), s => sum(10), cout => carry(15));
fa12 : FA port map (in1 => sum(10), in2 => d(20), cin => carry(11), s => sum(11), cout => carry(16));
fa13 : FA port map (in1 => sum(11), in2 => d(21), cin => carry(12), s => sum(12), cout => carry(17));
fa14 : FA port map (in1 => sum(12), in2 => d(22), cin => carry(13), s => sum(13), cout => carry(18));
fa15 : FA port map (in1 => sum(13), in2 => '0', cin => carry(14), s => p(6), cout => carry(19));

-------------- sec 8 ---------------
   
d(23) <= a(5) and b(2);
d(24) <= a(4) and b(3);
d(25) <= a(3) and b(4);
d(26) <= a(2) and b(5);

fa16 : FA port map (in1 => d(23), in2 => d(24), cin => carry(15), s => sum(14), cout => carry(20));
fa17 : FA port map (in1 => sum(14), in2 => d(25), cin => carry(16), s => sum(15), cout => carry(21));
fa18 : FA port map (in1 => sum(15), in2 => d(26), cin => carry(17), s => sum(16), cout => carry(22));
fa19 : FA port map (in1 => sum(16), in2 => carry(18), cin => carry(19), s => p(7), cout => carry(23));

-------------- sec 9 ---------------   

d(27) <= a(5) and b(3);
d(28) <= a(4) and b(4);
d(29) <= a(3) and b(5);

fa20 : FA port map (in1 => d(27), in2 => d(28), cin => carry(20), s => sum(17), cout => carry(24));
fa21 : FA port map (in1 => sum(17), in2 => d(29), cin => carry(21), s => sum(18), cout => carry(25));
fa22 : FA port map (in1 => sum(18), in2 => carry(22), cin => carry(23), s => p(8), cout => carry(26));

-------------- sec 10 ---------------   

d(30) <= a(5) and b(4);
d(31) <= a(4) and b(5);

fa23 : FA port map (in1 => d(30), in2 => d(31), cin => carry(24), s => sum(19), cout => carry(27));
fa24 : FA port map (in1 => sum(19), in2 => carry(25), cin => carry(26), s => p(9), cout => carry(28));

-------------- sec 11 ---------------   

d(32) <= a(5) and b(5);

fa25 : FA port map (in1 => d(32), in2 => carry(27), cin => carry(28), s => p(10), cout => p(11));

 
end Behavioral;
