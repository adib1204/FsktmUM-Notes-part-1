library ieee;
use ieee.std_logic_1164.all;

entity Adder16 is
	port (
		a16: in std_logic_vector(15 downto 0);
		b16: in std_logic_vector(15 downto 0);
		c_in16: in std_logic;
		sum16: out std_logic_vector(15 downto 0);
		c_out16: out std_logic
	);
	
end Adder16;

architecture fulladd of Adder16 is
component Adder4 is
	port (
		a4: in std_logic_vector(3 downto 0);
		b4: in std_logic_vector(3 downto 0);
		c_in4: in std_logic;
		sum4: out std_logic_vector(3 downto 0);
		c_out4: out std_logic
	
	);
	
end component;

signal s16: std_logic_vector(4 downto 0);

begin

s16(0)<=c_in16;


generate_i : for i in 3 downto 0 generate
begin

	Adder16_0: Adder4 port map (a16((4*i+3) downto (4*i)), b16((4*i+3) downto (4*i)), s16(i), sum16((4*i+3) downto (4*i)), s16(i+1));
	
end generate generate_i;

c_out16<=s16(4);
	
end fulladd;

