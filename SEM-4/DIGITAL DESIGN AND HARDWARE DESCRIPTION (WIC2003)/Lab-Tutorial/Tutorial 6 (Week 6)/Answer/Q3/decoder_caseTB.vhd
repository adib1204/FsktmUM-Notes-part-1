library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity decoder_caseTB is
end decoder_caseTB;

architecture stimulus of decoder_caseTB is

	component decoder_case is
		port (
	
			din: in std_logic_vector(1 downto 0);
		
			dout: out std_logic_vector(3 downto 0)
	
	);
	
	end component;
	
	constant period: time := 100ns;
	
	signal s_din : std_logic_vector (1 downto 0);
	signal s_dout: std_logic_vector (3 downto 0);
	
	signal done : boolean := false;
	

	
	
	
	begin
	
		DUT:	decoder_case port map (
		
			din => s_din,
			dout => s_dout
		
		);
		
		stimulus1: process
			variable cnt : integer := 0;
			begin
			

				s_din <= "00";
				
				if s_dout = "0001" then
					cnt := cnt + 1;
				end if;
				wait for period;
				
				------------------
				
				s_din <= "01";
				
				if s_dout = "0010" then
					cnt := cnt + 1;
				end if;
				wait for period;
				
				----------------------

				s_din <= "10";
				
				if s_dout = "0100" then
					cnt := cnt + 1;
				end if;
				wait for period;
				
				--------------------------
				
				s_din <= "11";
				
				if s_dout = "1000" then
					cnt := cnt + 1;
				end if;
				wait for period;
				
				---------------------------
				
				-- s_din<= "XX";
				
				-- if s_dout /= "0001" then
					-- cnt := cnt + 1;
				-- end if;
				-- wait for period;

				-----------------------------
				
				if (cnt = 0) then
					assert false
					report "Testbench of Decoder completed successfully!"
					severity note;
					
				else
					assert false
					--report cnt;
					--report "Something wrong, try again."
					report "Something is wrong. The value of 'counter' is " & integer'image(cnt)
					severity note;
				
				end if;

				done <= true;
				wait;

				--end if;
				
		end process stimulus1;

end stimulus;