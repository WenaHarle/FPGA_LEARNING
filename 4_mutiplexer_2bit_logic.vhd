library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2bit is
    port (
        a : in STD_LOGIC;
        b : in STD_LOGIC;
        s : in STD_LOGIC;
        f : out STD_LOGIC
        
    );
end mux2bit;

architecture Behavioral of mux2bit is
begin
 f <= (not s and a) or (s and b);
 
end Behavioral;
