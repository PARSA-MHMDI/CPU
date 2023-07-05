------------------------------------------------------
--            64X16 RAM
------------------------------------------------------
-- Parsa Mohammadi       9923121
-- Atena Shircharandabi  9923043
------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RAM is 
	port( 
	address 		: in std_logic_vector(9 downto 0);
	data_in 		: in std_logic_vector(15 downto 0);
	read_write 	: in std_logic; -- 0 for write and 1 for read
	clk 			: in std_logic;
	enb 			: in std_logic := '1';
	data_out 	: out std_logic_vector(15 downto 0)
);
end RAM;

architecture Behavioral of RAM is

type ram is array (0 to 63) of std_logic_vector (15 downto 0);

signal ram_data: ram :=( -- Initialize RAM 
	b"0000000000000001",b"0000000000000100",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",
	b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",b"0000000000000000",
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
			if (enb = '1') then -- if ram is on
				if ( read_write = '0') then -- write mode
					ram_data(conv_integer(address)) <= data_in ;
				else -- read mode
					data_out <= ram_data(conv_integer(address));			
				end if;
			else -- if ram is off
				data_out <= std_logic_vector(to_unsigned(0,data_in'length)); -- This line will puts zero as vector length of data_in
			end if;
		end if;
	end process;
	
end Behavioral;

