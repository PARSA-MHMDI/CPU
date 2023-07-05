------------------------------------------------------
--            	State Machine - Main file
------------------------------------------------------
-- Parsa Mohammadi       9923121
-- Atena Shircharandabi  9923043
------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity state_machine is
    port (
        clk : in std_logic
    );
end state_machine;

architecture Behavioral of state_machine is

    -- Define states
    type State is (receiving_command, decode_command, reading_value, prosses);
    signal currentState, nextState : State;

    -- Defining address size and data size
    constant address_size : integer := 10;
    constant data_size : integer := 16;

	 -- Program Counter
    signal PC : std_logic_vector(address_size-1 downto 0) := (others => '0');
	 
	 -- Instruction Register
    signal IR : std_logic_vector(data_size-1 downto 0) := (others => '0');
	
	-- Address Register
	signal AR : std_logic_vector(address_size-1 downto 0) := std_logic_vector(to_unsigned(0, address_size));
	
	-- Data register
	signal DR : std_logic_vector(data_size-1 downto 0) := std_logic_vector(to_unsigned(0, data_size));
	
	-- Acumalator
	signal AC : std_logic_vector(data_size-1 downto 0) := std_logic_vector(to_unsigned(3, data_size));
	signal E : std_logic := '0';
	
	-- Additional Variables
	signal RAM_on, ROM_on, ALU_on : std_logic := '1';
	signal ram_read_on 	 			: std_logic; 			-- 1 is REAR and 0 is WRITE
	signal RAM_IN 						: std_logic_vector(data_size-1 downto 0) := (others => '0');
	signal ROM_OUT 		 			: std_logic_vector(data_size-1 downto 0) := (others => '0');
	signal ALU_out   					: std_logic_vector(data_size-1 downto 0) := (others => '0');
	signal ALU_carry_out 			: std_logic := '0';
	 
-- Inserting ROM
component ROM is
port( 
		address 	: 	in std_logic_vector(9 downto 0);
		clk 		:  in std_logic;
		enb 		: 	in std_logic;
		data_out : 	out std_logic_vector(15 downto 0)
);
end component;

-- Inserting RAM
component RAM is
port(
		address 		: in std_logic_vector(9 downto 0);
		data_in 		: in std_logic_vector(15 downto 0);
		read_write 	: in std_logic; -- 0 for write and 1 for read
		clk 			: in std_logic;
		enb 			: in std_logic;
		data_out 	: out std_logic_vector(15 downto 0)
);
end component;


-- Inserting ALU
component ALU is 
port(
    input1,input2  : in  STD_LOGIC_VECTOR(15 downto 0);  --AC & ADRESS
    carry_in : in std_logic; -- E
	 input3  : in  STD_LOGIC_VECTOR(5 downto 0);  --UPCODE (for selecting function)
	 clk : in std_logic; --clk
	 enb : in std_logic; --ALU_on
    output  : inout  STD_LOGIC_VECTOR(15 downto 0); --ALU_out
    carry : out std_logic := '0' --ALU_carry_out
);
end component;

begin

ROM_module : ROM 
				port map(address => AR, 
							clk => clk, 
							enb => ROM_on, 
							data_out => ROM_OUT
							);
				
RAM_module : RAM
				port map(address => AR, 
							data_in => RAM_IN, 
							read_write => ram_read_on, 
							clk => clk, 
							enb => RAM_on, 
							data_out => DR
							);
ALU_module : ALU 
				port map(input1 => AC, 
							input2 => DR, 
							input3 => IR(15 downto 10), 
							carry_in => E, 
							clk => clk, 
							enb => ALU_on, 
							carry => ALU_carry_out, 
							output => ALU_out
							);
				
    -- Clock Process
    process (clk)
    begin
        if rising_edge(clk) then
                currentState <= nextState;
        end if;
    end process;

    process (currentState)
		begin

        case currentState is
            
				when receiving_command =>
						ROM_on <= '1';
						RAM_on <= '1';
						ALU_on <= '1';
						IR		 <= ROM_OUT;
						nextState <= decode_command;
            
				when decode_command =>

						-- ADDRESS NEEDED COMMANDS
						if (IR(15 downto 10) = "000100" OR IR(15 downto 10) = "000001" OR IR(15 downto 10) = "000011" OR
							 IR(15 downto 10) = "010000" OR IR(15 downto 10) = "100000") then -- ADD & AND & LOAD & MLTP & SQR
								AR <= IR(9 downto 0);
								ALU_on <= '1';
								ram_read_on <= '1'; -- Read mood
								nextState <= reading_value;
								
						-- Store also is address needed command but beacuse it requires different approch we have difined it separatly		
						elsif (IR(15 downto 10) = "000010") then -- Store
								AR <= IR(9 downto 0);
								ROM_on <= '1';								
								RAM_on <= '1';
								PC 	 <= PC + 1 ;  -- For reading next line in rom
								ram_read_on <= '0'; -- write mood
								RAM_IN <= AC;
								
								nextState <= prosses;
						
						-- ADDRESS NOT NEEDED COMMANDS
						--                      INC									CLEAR AC								CLEAR E
						elsif(IR(15 downto 10) = "000101" OR IR(15 downto 10) = "000110" OR IR(15 downto 10) = "000111" OR
						--				Circular Left Shift			Circular Right Shift						SPA
								IR(15 downto 10) = "001000" OR IR(15 downto 10) = "001001" OR IR(15 downto 10) = "001010" OR
						-- 			SNA								SZE											SZA
								IR(15 downto 10) = "001011" OR IR(15 downto 10) = "001100" OR IR(15 downto 10) = "001101" OR
						-- 			linear Left Shift				Linear Right Shift
								IR(15 downto 10) = "001110" OR IR(15 downto 10) = "001111") then 
								ALU_on <= '1';
								PC 	 <= PC + 1 ;  -- For reading next line in rom
								nextState <= prosses;
								

						else
							nextState <= receiving_command;							
						end if;
					 
				when reading_value =>
						ALU_on <= '1';
						RAM_on <= '1';		  -- RAM is on
						ram_read_on <= '1'; -- saving to DR in reed mood						
						PC 	 <= PC + 1 ;  -- For reading next line in rom

						nextState <= prosses;

            when prosses =>
						if (IR(15 downto 10) = "000100" OR IR(15 downto 10) = "000001" OR IR(15 downto 10) = "000101" OR
							 IR(15 downto 10) = "001000" OR IR(15 downto 10) = "001001" OR IR(15 downto 10) = "001110" OR
							 IR(15 downto 10) = "001111" OR IR(15 downto 10) = "010000" OR IR(15 downto 10) = "100000") then -- ALU Commands
								AC <= ALU_out;	
								E	<= ALU_carry_out;
								nextState <= receiving_command;
								
						elsif (IR(15 downto 10) = "000010") then -- store
							ram_read_on <= '1'; -- trun to read mood. write of data has been done when states changes decode to process.
							nextState <= receiving_command;

						elsif (IR(15 downto 10) = "000011") then -- LOAD
							AC <= DR; 			  -- LOADING DATA FROM DATA REGISTER
							nextState <= receiving_command;
							
						elsif (IR(15 downto 10) = "000110") then -- CLEAR AC
							AC <= std_logic_vector(to_unsigned(0,data_size));
							nextState <= receiving_command;
							
						elsif (IR(15 downto 10) = "000111") then -- CLEAR E
							E <= '0';
							nextState <= receiving_command;
							
						elsif (IR(15 downto 10) = "001010") then -- SKIP IF AC IS POSITIVE
							if (AC(data_size-1) = '0') then  -- AC is positive
								PC <= PC + 1; --
							end if;
							nextState <= receiving_command;

						elsif (IR(15 downto 10) = "001011") then -- SKIP IF AC IS Negetive
							if (AC(data_size-1) = '1') then  -- AC is Negetive
								PC <= PC + 1; --
							end if;
							nextState <= receiving_command;
						
						elsif (IR(15 downto 10) = "001100") then -- SKIP IF E IS zero
							if (E = '0') then  -- E is zero
								PC <= PC + 1; --
							end if;
							nextState <= receiving_command;
							
						elsif (IR(15 downto 10) = "001101") then -- SKIP IF AC IS zero
							if (AC = std_logic_vector(to_unsigned(0,data_size))) then  -- AC is zero
								PC <= PC + 1; --
							end if;
							nextState <= receiving_command;
						
						else
							nextState <= receiving_command;
						end if;
						AR 	 <= PC; -- Giving address to AR resgister for loading from ROM


        end case;
    end process;

end Behavioral;

