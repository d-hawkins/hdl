-- ----------------------------------------------------------------
-- hex_display_mux.vhd
--
-- 11/25/2016 D. W. Hawkins (dwh@caltech.edu)
--
-- Hexadecimal (7-segment) display multiplexer.
--
-- The Digilent Basys-3 board has a 4 segment display with
-- four anode controls and a common set of cathode controls.
-- This multiplexer is a generalization that supports
-- NWIDTH-segments, where each segment displays the value
-- of a 4-bit nibble.
--
-- ----------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ----------------------------------------------------------------

entity hex_display_mux is
	generic (
		-- Number of nibbles
		NWIDTH : integer := 4;

		-- Select width
		-- * log2(NWIDTH)
		SWIDTH : integer := 2
	);
    port (
        sel_in   : in  std_logic_vector(  SWIDTH-1 downto 0);
        data_in  : in  std_logic_vector(4*NWIDTH-1 downto 0);
        dp_in    : in  std_logic_vector(  NWIDTH-1 downto 0);
        an_out   : out std_logic_vector(  NWIDTH-1 downto 0);
        data_out : out std_logic_vector(         3 downto 0);
        dp_out   : out std_logic
    );
end entity;

-- ----------------------------------------------------------------

architecture behave of hex_display_mux is
begin
	process(sel_in, data_in, dp_in)
		variable index : integer;
	begin
		index := to_integer(unsigned(sel_in));

		-- Anode decoder
		an_out <= (others => '1');
		for i in 0 to NWIDTH-1 loop
			if (i = index) then
				an_out(i) <= '0';
			end if;
		end loop;

		-- Output data multiplexer
		data_out <= data_in(4*index+3 downto 4*index);

		-- Output decimal point multiplexer
		dp_out <= dp_in(index);
	end process;
end architecture;

