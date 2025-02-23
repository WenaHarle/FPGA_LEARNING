library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LogicGates is
    Port (
        A   : in  STD_LOGIC;
        B   : in  STD_LOGIC;
        F   : out STD_LOGIC_VECTOR (5 downto 0)
    );
end LogicGates;

architecture Behavioral of LogicGates is
begin
    F(0) <= A and B;
    F(1)   <= A or B;
    F(2) <= not (A and B);
    F(3)  <= not (A or B);
    F(4)  <= A xor B;
    F(5) <= A xnor B;
end Behavioral;
