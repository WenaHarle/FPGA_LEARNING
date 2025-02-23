library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tutorial_led_blink is
  port (
    i_clock      : in  std_logic;
    i_enable     : in  std_logic;
    i_switch_1   : in  std_logic;
    i_switch_2   : in  std_logic;
    o_led_drive  : out std_logic
    );
end tutorial_led_blink;

architecture rtl of tutorial_led_blink is

  -- Constants for 100 MHz clock
  constant c_CNT_100HZ : natural := 500000;      -- 100 Hz
  constant c_CNT_50HZ  : natural := 1000000;     -- 50 Hz
  constant c_CNT_10HZ  : natural := 5000000;     -- 10 Hz
  constant c_CNT_1HZ   : natural := 50000000;    -- 1 Hz

  -- Counter signals
  signal r_CNT_100HZ : natural range 0 to c_CNT_100HZ;
  signal r_CNT_50HZ  : natural range 0 to c_CNT_50HZ;
  signal r_CNT_10HZ  : natural range 0 to c_CNT_10HZ;
  signal r_CNT_1HZ   : natural range 0 to c_CNT_1HZ;

  -- Toggle signals
  signal r_TOGGLE_100HZ : std_logic := '0';
  signal r_TOGGLE_50HZ  : std_logic := '0';
  signal r_TOGGLE_10HZ  : std_logic := '0';
  signal r_TOGGLE_1HZ   : std_logic := '0';

  -- Selected LED output
  signal w_LED_SELECT : std_logic;

begin

  -- Process for 100 Hz
  p_100_HZ : process (i_clock)
  begin
    if rising_edge(i_clock) then
      if r_CNT_100HZ = c_CNT_100HZ-1 then
        r_TOGGLE_100HZ <= not r_TOGGLE_100HZ;
        r_CNT_100HZ    <= 0;
      else
        r_CNT_100HZ <= r_CNT_100HZ + 1;
      end if;
    end if;
  end process p_100_HZ;

  -- Process for 50 Hz
  p_50_HZ : process (i_clock)
  begin
    if rising_edge(i_clock) then
      if r_CNT_50HZ = c_CNT_50HZ-1 then
        r_TOGGLE_50HZ <= not r_TOGGLE_50HZ;
        r_CNT_50HZ    <= 0;
      else
        r_CNT_50HZ <= r_CNT_50HZ + 1;
      end if;
    end if;
  end process p_50_HZ;

  -- Process for 10 Hz
  p_10_HZ : process (i_clock)
  begin
    if rising_edge(i_clock) then
      if r_CNT_10HZ = c_CNT_10HZ-1 then
        r_TOGGLE_10HZ <= not r_TOGGLE_10HZ;
        r_CNT_10HZ    <= 0;
      else
        r_CNT_10HZ <= r_CNT_10HZ + 1;
      end if;
    end if;
  end process p_10_HZ;

  -- Process for 1 Hz
  p_1_HZ : process (i_clock)
  begin
    if rising_edge(i_clock) then
      if r_CNT_1HZ = c_CNT_1HZ-1 then
        r_TOGGLE_1HZ <= not r_TOGGLE_1HZ;
        r_CNT_1HZ    <= 0;
      else
        r_CNT_1HZ <= r_CNT_1HZ + 1;
      end if;
    end if;
  end process p_1_HZ;

  -- Mux for LED selection based on switch inputs
  w_LED_SELECT <= r_TOGGLE_100HZ when (i_switch_1 = '0' and i_switch_2 = '0') else
                  r_TOGGLE_50HZ  when (i_switch_1 = '0' and i_switch_2 = '1') else
                  r_TOGGLE_10HZ  when (i_switch_1 = '1' and i_switch_2 = '0') else
                  r_TOGGLE_1HZ;

  -- Enable logic
  o_led_drive <= w_LED_SELECT and i_enable;

end rtl;

