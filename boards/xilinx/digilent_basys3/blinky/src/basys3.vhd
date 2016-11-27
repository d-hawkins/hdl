-- ------------------------------------------------------------
-- basys3.vhd
--
-- 10/22/2016 D. W. Hawkins (dwh@caltech.edu)
--
-- Digilent Basys-3 Artix-7 'blinky' design.
--
-- Design features;
--  * 100MHz reference clock
--  * The center push button is reset
--  * The L/R/U/D push buttons connect to the hex display
--    decimal points (pressing a button turns a DP on)
--  * Incrementing count on the hex displays
--  * Incrementing count on the LEDs
--  * The switches invert the LED state
--    (switch up inverts the corresponding LED)
--  * UART loopback (UART baud-rate does not matter)
--
-- LED blink rate calculation;
--  * For a blink rate of around one second, the counter
--    bit-width to the LSB needs to be approximately
--
--    ceil(log2(100MHz)) = 26-bits
--
--    For 16 LEDs the counter needs to be about
--    26+15 = 41-bits. Use 40-bits so it counts up faster.
--
-- ------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ------------------------------------------------------------

entity basys3 is
	generic (
		CNT_WIDTH : integer := 40
	);
	port (
		-- 100MHz clock
		clk       : in    std_logic;

		-- Push buttons
		btn_l     : in    std_logic;
		btn_r     : in    std_logic;
		btn_u     : in    std_logic;
		btn_d     : in    std_logic;
		btn_c     : in    std_logic;

		-- Switches
		sw        : in    std_logic_vector(15 downto 0);

		-- LEDs
		led       : out   std_logic_vector(15 downto 0);

		-- Hexadecimal display
		hex_an    : out   std_logic_vector(3 downto 0);
		hex_seg   : out   std_logic_vector(6 downto 0);
		hex_dp    : out   std_logic;

		-- UART Interface
		uart_rxd  : in    std_logic;
		uart_txd  : out   std_logic;

		-- PS/2 Interface
		ps2_clk   : inout std_logic;
		ps2_data  : inout std_logic;

		-- VGA Interface
		vga_hsync : out   std_logic;
		vga_vsync : out   std_logic;
		vga_r     : out   std_logic_vector(3 downto 0);
		vga_g     : out   std_logic_vector(3 downto 0);
		vga_b     : out   std_logic_vector(3 downto 0);

		-- QSPI Flash
		qspi_cs_n : out   std_logic;
		qspi_dq   : out   std_logic_vector(3 downto 0);

		-- Pmod Connectors
		pmod_a    : inout std_logic_vector(7 downto 0);
		pmod_b    : inout std_logic_vector(7 downto 0);
		pmod_c    : inout std_logic_vector(7 downto 0);
		pmod_d    : inout std_logic_vector(7 downto 0)
	);
end entity;

-- ------------------------------------------------------------

architecture top of basys3 is

	-- --------------------------------------------------------
	-- Components
	-- --------------------------------------------------------
	--
	component hex_display_mux is
		generic (
			NWIDTH : integer;
			SWIDTH : integer
		);
		port (
			sel_in   : in  std_logic_vector(  SWIDTH-1 downto 0);
			data_in  : in  std_logic_vector(4*NWIDTH-1 downto 0);
			dp_in    : in  std_logic_vector(  NWIDTH-1 downto 0);
			an_out   : out std_logic_vector(  NWIDTH-1 downto 0);
			data_out : out std_logic_vector(         3 downto 0);
			dp_out   : out std_logic
		);
	end component;

	component hex_display is
		port (
			hex     : in  std_logic_vector(3 downto 0);
			display : out std_logic_vector(6 downto 0)
		);
	end component;

	-- --------------------------------------------------------
	-- Constants
	-- --------------------------------------------------------
	--
	-- Number of LEDs
	constant LED_WIDTH : integer := led'length;

	-- --------------------------------------------------------
	-- Signals
	-- --------------------------------------------------------
	--
	-- Use the center button for the reset
	alias rst is btn_c;

	-- Counter
	signal count : unsigned(CNT_WIDTH-1 downto 0);

	-- Hexadecimal multiplexer
	signal hex_sel      : std_logic_vector( 1 downto 0);
	signal hex_data_in  : std_logic_vector(15 downto 0);
	signal hex_data_out : std_logic_vector( 3 downto 0);
	signal hex_dp_in    : std_logic_vector( 3 downto 0);

begin

	-- --------------------------------------------------------
	-- Counter
	-- --------------------------------------------------------
	--
	process(clk, rst)
	begin
		if (rst = '1') then
			count <= (others => '0');
		elsif rising_edge(clk) then
			count <= count + 1;
		end if;
	end process;

	-- --------------------------------------------------------
	-- LED output
	-- --------------------------------------------------------
	--
	led <= sw xor std_logic_vector(count(CNT_WIDTH-1 downto CNT_WIDTH-LED_WIDTH));

	-- --------------------------------------------------------
	-- Hex display
	-- --------------------------------------------------------
	--
	u1: hex_display_mux
		generic map (
			NWIDTH => 4,
			SWIDTH => 2
		)
		port map (
			sel_in   => hex_sel,
			data_in  => hex_data_in,
			dp_in    => hex_dp_in,
			an_out   => hex_an,
			data_out => hex_data_out,
			dp_out   => hex_dp
		);

	u2: hex_display
		port map (
			hex     => hex_data_out,
			display => hex_seg
		);

	-- Hex display multiplexing rate
	hex_sel <= std_logic_vector(count(19 downto 18));

	-- Input data
	hex_data_in <= std_logic_vector(count(CNT_WIDTH-1 downto CNT_WIDTH-LED_WIDTH));

	-- Input decimal points
	-- * pressing a button turns a decimal point on
	hex_dp_in <= not (btn_u & btn_d & btn_l & btn_r);

	-- --------------------------------------------------------
	-- UART loopback
	-- --------------------------------------------------------
	--
	uart_txd <= uart_rxd;

	-- ============================================================
	-- Unused Board Output and Bidirectional Signals
	-- ============================================================
	--
	-- PS/2 Interface
	ps2_clk  <= 'Z';
	ps2_data <= 'Z';

	-- VGA Interface
	vga_hsync <= 'Z';
	vga_vsync <= 'Z';
	vga_r     <= (others => 'Z');
	vga_g     <= (others => 'Z');
	vga_b     <= (others => 'Z');

	-- QSPI Flash
	qspi_cs_n <= '1'; -- Not selected
	qspi_dq   <= (others => 'Z');

	-- Pmod Connectors
	pmod_a <= (others => 'Z');
	pmod_b <= (others => 'Z');
	pmod_c <= (others => 'Z');
	pmod_d <= (others => 'Z');

end architecture;
