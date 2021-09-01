library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity RAM_prueba is
port(clock, WE,start: in std_logic;
		Data: in std_logic_vector(7 downto 0);
		Address: in std_logic_vector(7 downto 0);
		Q: out std_logic_vector(7 downto 0));
end RAM_prueba;

architecture comp of RAM_prueba is
type ram_type is array (10 downto 0) of std_logic_vector (7 downto 0);
signal memram: ram_type;
--signal temp: std_logic_vector(7 downto 0);
begin
process(clock)
begin
	if (clock'event and clock='1') then
		if WE='1' then
			memram(conv_integer(address)) <= Data;
		else
			Q <= memram(conv_integer(address));
		end if;
	end if;
end process;

process(start)
begin
	if (start'event and start='1') then
		memram(conv_integer("0000")) <= "00000000";
		memram(conv_integer("0001")) <= "00000000";
		memram(conv_integer("0010")) <= "00000000";
		memram(conv_integer("0011")) <= "00000000";
		memram(conv_integer("0100")) <= "00000000";
		memram(conv_integer("0101")) <= "00000000";
		memram(conv_integer("0110")) <= "00000000";
		memram(conv_integer("0111")) <= "00000000";
		memram(conv_integer("1000")) <= "00000000";
		memram(conv_integer("1001")) <= "00000000";
		memram(conv_integer("1010")) <= "00000000";
	end if;
end process;

end comp;