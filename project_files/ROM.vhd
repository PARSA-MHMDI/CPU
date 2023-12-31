------------------------------------------------------
--             ROM
------------------------------------------------------
-- Parsa Mohammadi       9923121
-- Atena Shircharandabi  9923043
------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ROM is 
	port( 
	address 	: 	in std_logic_vector(9 downto 0);
	clk 		:  in std_logic;
	enb 	: 	in std_logic;
	data_out : 	out std_logic_vector(15 downto 0)
);
end ROM;

architecture Behavioral of ROM is

type rom is array (0 to 63) of std_logic_vector (15 downto 0);

signal rom_data: rom :=( -- Initialize ROM 
--  AND AC WITH RAM(0)  STORE AC IN RAM(2) ADD AC WITH RAM (0) STORE AC IN RAM(3)  LOAD RAM(1) TO AC   STORE AC IN RAM(4)   INCREAMENT AC      STORE AC IN RAM(5)
	b"0000010000000000",b"0000100000000010",b"0001000000000000",b"0000100000000011",b"0000110000000001",b"0000100000000100",b"0001010000000000",b"0000100000000101",
--  CLEAR AC				CLEAR E					
	b"0001100000000000",b"0001110000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",
	b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",
	b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",
	b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",
	b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",
	b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",
	b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000"
	);


begin

	process(clk)
	begin
		if(rising_edge(clk)) then
			if ( enb = '1') then -- if ROM is on
				data_out <= rom_data(conv_integer(address));		
			else
				data_out <= std_logic_vector(to_unsigned(0,data_out'length));		
			end if;
		end if;
	end process;
	
end Behavioral;

