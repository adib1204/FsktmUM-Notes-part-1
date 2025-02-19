library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity AddSub8TB is
end AddSub8TB;

architecture stimulus of AddSub8TB is

	component AddSub8 is
		port (
	
			a: in std_logic_vector(15 downto 0);
			b: in std_logic_vector (15 downto 0);
			c_in: in std_logic;
			sum: out std_logic_vector(15 downto 0);
			c_out: out std_logic
		
	);

	end component;
	
	constant period : time := 100ns;
	signal a: std_logic_vector(15 downto 0);
	signal b: std_logic_vector (15 downto 0);
	signal c_in: std_logic;
	signal sum: std_logic_vector(15 downto 0);
	signal c_out: std_logic;
	signal done : boolean := false;
	
	begin
	
		DUT: AddSub8 port map (
		
			a => a,
			b => b,
			c_in => c_in,
			sum => sum,
			c_out => c_out
			
		
		);
		
		stimulus1: process
		begin
		
			a <= "0000000011111111";
			b <= "0000000000000001";
			c_in <= '1';
			WAIT FOR period;
			
			a <= "0000000011111111";
			b <= "0000000000000001";
			c_in <= '0';
			WAIT FOR period;	
			
			done <= true;
			wait;
		
		end process stimulus1;


end stimulus;