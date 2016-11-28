-- ------------------------------------------------------------
-- arty.vhd
--
-- 10/22/2016 D. W. Hawkins (dwh@caltech.edu)
--
-- Digilent Arty Artix-7 'blinky' design.
--
-- Design features;
--  * 100MHz reference clock
--  * Incrementing count on the green LEDs
--  * Incrementing count, with changing color, on the RGB LEDs
--  * The buttons and switches invert the green LED state
--    (switch up inverts the corresponding LED)
--  * UART loopback (UART baud-rate does not matter)
--
-- LED blink rate calculation;
--  * For a blink rate of around one second, the counter
--    bit-width to the LSB needs to be approximately
--
--    ceil(log2(100MHz)) = 26-bits
--
--    For 12 LEDs (4 x RGB) the counter needs to be about
--    26+11 = 37-bits.
--
-- ------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ------------------------------------------------------------

entity arty is
	generic (
		CNT_WIDTH : integer := 37
	);
	port (
		-- Active low reset
		rstN      : in    std_logic;

		-- 100MHz clock
		clk       : in    std_logic;

		-- Push buttons
		btn       : in    std_logic_vector(3 downto 0);

		-- Switches
		sw        : in    std_logic_vector(3 downto 0);

		-- Green LEDs
		led_g     : out   std_logic_vector(3 downto 0);

		-- RGB LEDs
		led_rgb   : out   std_logic_vector(11 downto 0);

		-- UART Interface
		uart_rxd  : in    std_logic;
		uart_txd  : out   std_logic
	);
end entity;

-- ------------------------------------------------------------

architecture top of arty is

	-- --------------------------------------------------------
	-- Constants
	-- --------------------------------------------------------
	--
	-- Number of LEDs
	constant LED_G_WIDTH   : integer := led_g'length;
	constant LED_RGB_WIDTH : integer := led_rgb'length;

	-- --------------------------------------------------------
	-- Signals
	-- --------------------------------------------------------
	--
	-- Counter
	signal count : unsigned(CNT_WIDTH-1 downto 0);

	-- RGB LED color
	signal led_rgb_color : std_logic_vector(2 downto 0);
	signal led_rgb_en    : std_logic_vector(3 downto 0);

begin

	-- --------------------------------------------------------
	-- Counter
	-- --------------------------------------------------------
	--
	process(clk, rstN)
	begin
		if (rstN = '0') then
			count <= (others => '0');
		elsif rising_edge(clk) then
			count <= count + 1;
		end if;
	end process;

	-- --------------------------------------------------------
	-- Green LED output
	-- --------------------------------------------------------
	--
	led_g <= btn xor sw xor std_logic_vector(count(CNT_WIDTH-LED_RGB_WIDTH+LED_G_WIDTH-1 downto CNT_WIDTH-LED_RGB_WIDTH));

	-- --------------------------------------------------------
	-- RGB LED output
	-- --------------------------------------------------------
	--
--	led_rgb <= std_logic_vector(count(CNT_WIDTH-1 downto CNT_WIDTH-LED_RGB_WIDTH));

	-- 4-bit count with a single color
	--
	--  BGR-Count
	--  000-xxxx  Off
	--  001-xxxx  Red
	--  010-xxxx  Green
	--  011-xxxx  Red+Green (Amber)
	--  100-xxxx  Blue
	--  101-xxxx  Blue+Red (Purple)
	--  110-xxxx  Blue+Green (Cyan)
	--  111-xxxx  Blue+Green+Green (White)
	--
	led_rgb_color <= std_logic_vector(count(CNT_WIDTH-LED_RGB_WIDTH+6 downto CNT_WIDTH-LED_RGB_WIDTH+4));
	led_rgb_en    <= std_logic_vector(count(CNT_WIDTH-LED_RGB_WIDTH+3 downto CNT_WIDTH-LED_RGB_WIDTH));

	led_rgb( 2 downto 0) <= led_rgb_color when (led_rgb_en(0) = '1') else "000";
	led_rgb( 5 downto 3) <= led_rgb_color when (led_rgb_en(1) = '1') else "000";
	led_rgb( 8 downto 6) <= led_rgb_color when (led_rgb_en(2) = '1') else "000";
	led_rgb(11 downto 9) <= led_rgb_color when (led_rgb_en(3) = '1') else "000";

	-- --------------------------------------------------------
	-- UART loopback
	-- --------------------------------------------------------
	--
	uart_txd <= uart_rxd;

end architecture;
