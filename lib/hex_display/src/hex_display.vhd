-- ----------------------------------------------------------------
-- hex_display.vhd
--
-- 2/27/2008 D. W. Hawkins (dwh@caltech.edu)
--
-- Hexadecimal (7-segment) display decoder.
--
-- The bit assignments for the hexadecimal display are as per
-- the Altera DE2 board documentation:
--
--       0
--     -----
--    |     |
--  5 |     | 1
--    |  6  |
--     -----
--    |     |
--  4 |     | 2
--    |     |
--     -----
--       3
--
-- The DE2 segments turn on for a logic low-level output.
-- Active-low segments is typical of 7-segment displays
-- with one or more (multiplexed) segments.
--
-- ----------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-- ----------------------------------------------------------------

entity hex_display is
    port (
        hex     : in  std_logic_vector(3 downto 0);
        display : out std_logic_vector(6 downto 0)
    );
end entity;

-- ----------------------------------------------------------------

architecture behave of hex_display is
begin
    process(hex)
    begin
        case (hex) is
            when X"0"   => display <= "1000000";
            when X"1"   => display <= "1111001";
            when X"2"   => display <= "0100100";
            when X"3"   => display <= "0110000";
            when X"4"   => display <= "0011001";
            when X"5"   => display <= "0010010";
            when X"6"   => display <= "0000010";
            when X"7"   => display <= "1111000";
            when X"8"   => display <= "0000000";
            when X"9"   => display <= "0011000";
            when X"A"   => display <= "0001000";
            when X"B"   => display <= "0000011";
            when X"C"   => display <= "1000110";
            when X"D"   => display <= "0100001";
            when X"E"   => display <= "0000110";
            when others => display <= "0001110";
        end case;
    end process;
end architecture;
