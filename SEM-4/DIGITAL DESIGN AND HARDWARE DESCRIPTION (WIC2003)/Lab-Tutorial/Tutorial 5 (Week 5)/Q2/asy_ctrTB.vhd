library ieee;
use ieee.std_logic_1164.all;

entity asy_ctrTB is
generic (n: positive :=3);
end asy_ctrTB;

architecture stimulus of asy_ctrTB is

	component asy_ctr is
		port (
			high_in: in std_logic;
			clk: in std_logic;
			r: in std_logic;
			q: out std_logic_vector(3 downto 0);
			qbar: out std_logic_vector (3 downto 0)
		);
	end component;

	component asy_ctrGen is
		port (
			r: in std_logic;
			high_in: in std_logic;
			clk: in std_logic;
			q: out std_logic_vector(n downto 0);
			qbar: out std_logic_vector(n downto 0)
		);
	end component;
	
	constant period: time := 100ns;
	
	signal s_high_in, s_r : std_logic;
	signal s_clk: std_logic;
	signal s_q: std_logic_vector(n downto 0);
	signal s_q1: std_logic_vector(n downto 0);
	
	signal s_qbar : std_logic_vector (n downto 0);
	signal s_qbar1 : std_logic_vector (n downto 0);
	signal done: boolean := false;
	
	begin
	
		DUT: asy_ctr port map (
		
			high_in => s_high_in,
			clk => s_clk,
			r => s_r,
			q => s_q,
			qbar => s_qbar
		
		);
		
		DUT2: asy_ctrGen port map (
		
			high_in => s_high_in,
			clk => s_clk,
			r => s_r,
			q => s_q1,
			qbar => s_qbar1
		
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
			
				s_high_in <= '1';
				wait for 80ns;
			
				s_high_in <= '0';
				wait for 50ns;
			
		end process stimulus2;
		
		stimulus3: process
			begin
			
				s_clk <= '0';
				wait for 10ns;
			
				s_clk <= '1';
				wait for 10ns;
		
		
		end process stimulus3;
	
		verify : process is
			begin
				wait for 10ns;
				assert s_q = s_q1 and s_qbar = s_qbar1 -- <--- compare between two DUTs/components, to ensure the outputs are the same
				report "implementations have different outputs"
				severity error;
		end process verify;
		

end stimulus;
