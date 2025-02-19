library ieee;
use ieee.std_logic_1164.all;

entity rotate_LED is
	port (
		CLOCK: in std_logic;
		RST: in std_logic;
		HEX0: out std_logic_vector (6 downto 0);
		HEX1: out std_logic_vector (6 downto 0);
		HEX2: out std_logic_vector (6 downto 0);
		HEX3: out std_logic_vector (6 downto 0)
	);
end entity;

architecture behav of rotate_LED is
	
	signal s_0: std_logic_vector (6 downto 0);
	signal s_1: std_logic_vector (6 downto 0);
	signal s_2: std_logic_vector (6 downto 0);
	signal s_3: std_logic_vector (6 downto 0);

	
	begin
	
	
	
	comp: process (CLOCK, RST)
	
		begin
		
				
				--s_3 <= "0000000";
	
			if (RST = '1') then
				--HEX0 <= "1111111";
				--HEX1 <= "1111111";
				--HEX2 <= "1111111";
				
				s_0 <= "1111111"; --_
				s_1 <= "0100100"; --2
				s_2 <= "0000110"; --E 
				s_3 <= "0100001"; --d
				
			elsif (RST = '0') then

				if (CLOCK'event and CLOCK ='1') then 
				
				-- if d - "0101110"
				-- if E - "0000110"
				-- if 2 - "0100100"
				
				s_3 <= s_2;
				s_2 <= s_1;
				s_1 <= s_0;
				s_0 <= s_3;

				
				end if;
			end if;
			
	end process comp;
	
	HEX0 <= s_0;
	HEX1 <= s_1;
	HEX2 <= s_2;
	HEX3 <= s_3;
	
end behav;