library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_FlipFlop is
    Port (
        clk   : in  STD_LOGIC;  -- Clock signal
        S     : in  STD_LOGIC;  -- Set input
        R     : in  STD_LOGIC;  -- Reset input
        Q     : out STD_LOGIC;  -- Output Q
        Q_bar : out STD_LOGIC   -- Complementary output Q'
    );
    
end SR_FlipFlop;

architecture Behavioral of SR_FlipFlop is
    signal q_int : STD_LOGIC := '0'; -- Internal signal for storing state
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if (S = '1' and R = '0') then
                q_int <= '1';  -- Set state
            elsif (S = '0' and R = '1') then
                q_int <= '0';  -- Reset state
            elsif (S = '1' and R = '1') then
                q_int <= '0';  -- Invalid condition, default to Reset
            end if;
        end if;
    end process;

    -- Assign output signals
    Q     <= q_int;
    Q_bar <= not q_int;
end Behavioral;
