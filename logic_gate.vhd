library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LogicGates is
    Port (
        A   : in  STD_LOGIC;
        B   : in  STD_LOGIC;
        AND_OUT  : out STD_LOGIC;
        OR_OUT   : out STD_LOGIC;
        NAND_OUT : out STD_LOGIC;
        NOR_OUT  : out STD_LOGIC;
        XOR_OUT  : out STD_LOGIC;
        XNOR_OUT : out STD_LOGIC
    );
end LogicGates;

architecture Behavioral of LogicGates is
begin
    AND_OUT  <= A and B;
    OR_OUT   <= A or B;
    NAND_OUT <= not (A and B);
    NOR_OUT  <= not (A or B);
    XOR_OUT  <= A xor B;
    XNOR_OUT <= A xnor B;
end Behavioral;
