library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity majorHigh is
    Port (
        A   : in  STD_LOGIC;
        B   : in  STD_LOGIC;
        C   : in  STD_LOGIC;
        D   : in  STD_LOGIC;
        F   : out std_logic
    );
end majorHigh;

architecture Behavioral of majorHigh is
begin
    F <= (A and B  and C ) or (A AND B AND D) OR (A AND C AND D) OR (B AND C AND D);
    
end Behavioral;
