library ieee;
use ieee.std_logic_1164.all;

entity BCD_7seg is
port(BCD: in std_logic_vector(4 downto 0);
		anodo7: out std_logic_vector(13 downto 0));
end BCD_7seg;

architecture arq of BCD_7seg is
begin
process(BCD)
begin
	case BCD is
		when "00000" => anodo7<="11111101111110";
		when "00001" => anodo7<="11111100110000";
		when "00010" => anodo7<="11111101101101";
		when "00011" => anodo7<="11111101111001";
		when "00100" => anodo7<="11111100110011";
		when "00101" => anodo7<="11111101011011";
		when "00110" => anodo7<="11111100011111";
		when "00111" => anodo7<="11111101110000";
		when "01000" => anodo7<="11111101111111";
		when "01001" => anodo7<="11111101110011";
		when "01010" => anodo7<="01100001111110";
		when "01011" => anodo7<="01100000110000";
		when "01100" => anodo7<="01100001101101";
		when "01101" => anodo7<="01100001111001";
		when "01110" => anodo7<="01100000110011";
		when "01111" => anodo7<="01100001011011";
		when "10000" => anodo7<="01100000011111";
		when "10001" => anodo7<="01100001110000";
		when "10010" => anodo7<="01100001111111";
		when "10011" => anodo7<="01100001110011";
		when "10100" => anodo7<="11011011111110";
		when others => anodo7<="00000000000000";
	end case;
end process;
end arq;