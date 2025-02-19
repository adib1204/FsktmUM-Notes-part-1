library ieee;
use ieee.std_logic_1164.all;

entity Seg7 is
	port (
		SW: in std_logic_vector (1 downto 0);
		HEX0: out std_logic_vector (6 downto 0)
	);
	
end Seg7;

architecture behav of Seg7 is

	begin
			
		WITH SW SELECT
		
			HEX0 <= "0100001" WHEN "00",
					  "0000110" WHEN "01",
					  "0100100" WHEN "10",
					  "1111111" WHEN "11",
					"0000000" WHEN others;
	
end behav;
