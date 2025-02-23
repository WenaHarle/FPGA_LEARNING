library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity arrayTest is
    port(
        o_signaout : out std_logic_vector(8 downto 0)  -- Corrected range
    );
end arrayTest;

architecture behavioral of arrayTest is

    -- 1D Array of std_logic_vector (8-bit) 
    type t_Memory is array (0 to 127) of std_logic_vector(7 downto 0);
    signal r_Mem : t_Memory;

    -- 1D Array of std_logic
    type t_Data is array (0 to 3) of std_logic;
    signal r_Data : t_Data := ('0', '1', '0', '1');  -- Corrected initialization

    -- 2D Array of Integers
    type t_Row_Col is array (0 to 3, 0 to 2) of integer range 0 to 9;
    signal r_Number : t_Row_Col;

    -- Bit-Vector Array (Changed to std_logic_vector)
    type t_Five is array (0 to 4) of std_logic_vector(15 downto 0);
    signal r_Calc : t_Five := (others => (others => '0'));  -- Corrected syntax
    
begin

    process
    begin
        -- Initialize memory (Example)
        r_Mem(0) <= "00000001";
        r_Mem(1) <= "00000010";
        
        -- Assign a value to the integer matrix
        r_Number(3, 2) <= 9;

        -- Assign output signal
        o_signaout <= r_Mem(0);  -- Example assignment

        wait;  -- Stop process execution
    end process;

end behavioral;

