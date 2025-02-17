library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2to1 is
    Port (
        sel : in std_logic;  -- Select signal
        a   : in std_logic;  -- Input 1
        b   : in std_logic;  -- Input 2
        y   : out std_logic  -- Output
    );
end mux_2to1;

architecture behavioral of mux_2to1 is
begin
    process (sel, a, b)
    begin
        if sel = '0' then
            y <= a;
        else
            y <= b;
        end if;
    end process;
end behavioral;
