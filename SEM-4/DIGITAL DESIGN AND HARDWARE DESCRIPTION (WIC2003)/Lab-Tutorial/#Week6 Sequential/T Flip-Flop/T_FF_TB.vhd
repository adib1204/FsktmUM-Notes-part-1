library ieee;
use ieee.std_logic_1164.all;

entity T_FF_TB is
end T_FF_TB;

architecture stimulus of T_FF_TB is
	
	component T_FF is
		port (
			r, t, clk: in std_logic;
			q: out std_logic
		
		);
	
	end component;
	
	constant period : time := 100ns;
	
	signal s_r, s_t, s_clk: std_logic;
	signal s_q: std_logic;
	signal done : boolean := false;
	
	begin
	
		DUT: T_FF port map (
			
			r => s_r,
			t => s_t,
			clk => s_clk,
			q => s_q
		
		);
		
		stimulus1: process
		begin
				
			s_r <= '1';
			wait for 20ns;
				
			s_r <= '0';
			wait;
				
		end process stimulus1;
			
		stimulus2: process
		begin
		
			s_t <= '1';
			wait for 80ns;
			
			s_t <= '0';
			wait for 50ns;
		
		end process stimulus2;
		
		stimulus3: process
		begin
			
			s_clk <= '0';
			wait for 10ns;
			
			s_clk <= '1';
			wait for 10ns;
		
		end process stimulus3;

end stimulus;