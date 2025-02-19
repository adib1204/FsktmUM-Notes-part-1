library ieee;
use ieee.std_logic_1164.all;

entity AddSub8 is
	port (
	
		a: in std_logic_vector(15 downto 0);
		b: in std_logic_vector (15 downto 0);
		c_in: in std_logic;
		sum: out std_logic_vector(15 downto 0);
		c_out: out std_logic
		
	);
	
end AddSub8;

architecture addsub of AddSub8 is
component Adder16 is
	port (
	
		a16: in std_logic_vector(15 downto 0);
		b16: in std_logic_vector(15 downto 0);
		c_in16: in std_logic;
		sum16: out std_logic_vector(15 downto 0);
		c_out16: out std_logic
		
	);
end component;

component XOR16bit is
	port (
	
		c_in16, b16: in std_logic_vector(15 downto 0);
		c_out16: out std_logic_vector(15 downto 0)
		
	);

end component;

signal s0: std_logic_vector (15 downto 0);
signal s_xor: std_logic_vector (15 downto 0);

begin
	
	s0 <= (others =>c_in);

	XOR16: XOR16bit port map (
		c_in16 => a,
		b16 => s0,
		c_out16 => s_xor
	);

	AddSub16: Adder16 port map (
		a16 => a,
		b16 => s_xor,
		c_in16 => c_in,
		sum16 => sum,
		c_out16 => c_out
	
	);

end addsub;
