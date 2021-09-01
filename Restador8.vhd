library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Restador8 is
port(A, B: in std_logic_vector(7 downto 0);
		R: out std_logic_vector(7 downto 0));
end Restador8;

architecture arq of Restador8 is
signal temp: std_logic_vector(7 downto 0);
begin
temp<=A-B;
R<=temp;
end arq;