// ------------------------------------------------------------
// minized.sv
//
// 11/21/2017 D. W. Hawkins (dwh@caltech.edu)
//
// Avnet MiniZed Zynq-7 'blinky_osc' design.
//
// Design features;
//  * 65MHz reference clock from the on-FPGA oscillator
//  * Blinking blue DONE LED
//  * Blinking red/green bicolor LED
//
// ------------------------------------------------------------

module minized(
		// Note:
		// This design uses the minimum number of top-level
		// ports. See minized_pin_constraints.tcl for the
		// port names that will be automatically constrained
		// by that same script.

		// Arduino interface (to control the bi-color LED)
		inout [5:0] arduino_a
	);

	// ------------------------------------------------------------
	// Local parameters
	// ------------------------------------------------------------
	//
	// On-FPGA oscillator frequency
	localparam real OSC_FREQUENCY = 65.0e6;

	// LED blink rate
	localparam real BLINK_PERIOD = 0.5;

	// Counter width
	localparam integer COUNT_PERIODS =
		OSC_FREQUENCY*BLINK_PERIOD;
	localparam integer COUNT_WIDTH =
		$clog2(COUNT_PERIODS)+1;

	// --------------------------------------------------------
	// Local signals
	// --------------------------------------------------------
	//
	logic                   clk;
	logic                   led_b;
	logic [COUNT_WIDTH-1:0] count;

	// --------------------------------------------------------
	// 7-series STARTUP component
	// --------------------------------------------------------
	//
	STARTUPE2 #(
		.PROG_USR      ("FALSE"),
		.SIM_CCLK_FREQ (0.0   )
	) u1 (
		.CFGCLK    (     ),
		.CFGMCLK   (clk  ),
		.EOS       (     ),
		.PREQ      (     ),
		.CLK       (1'b0 ),
		.GSR       (1'b0 ),
		.GTS       (1'b0 ),
		.KEYCLEARB (1'b0 ),
		.PACK      (1'b0 ),
		.USRCCLKO  (1'b0 ),
		.USRCCLKTS (1'b1 ),
		.USRDONEO  (led_b),
		.USRDONETS (1'b0 )
	);

	// --------------------------------------------------------
	// Counter
	// --------------------------------------------------------
	//
	always_ff @(posedge clk) begin
		count <= count + 1;
	end

	// --------------------------------------------------------
	// LED drivers
	// --------------------------------------------------------
	//
	// Blink the DONE LED (at the same rate as the bicolor)
	assign led_b = count[COUNT_WIDTH-2];

	// Blink the bi-color LED connected to the Arduino A-port
	// * A[3] = green LED (high = ON)
	// * A[4] = red   LED (high = ON)
	//
	// Use a 2-bit pattern match so that the led cycles
	// * green, off, red, off, ...
	// The 2-bit patterns were selected so that the blue
	// LED is on when the bi-color is green or red.
	// Change the patterns to 2'b00 and 2'b10 to have the
	// blue on when the bi-color is off.
	assign arduino_a[3] =
		(count[COUNT_WIDTH-1:COUNT_WIDTH-2] == 2'b01);
	assign arduino_a[4] =
		(count[COUNT_WIDTH-1:COUNT_WIDTH-2] == 2'b11);

	// --------------------------------------------------------
	// Unused outputs
	// --------------------------------------------------------
	//
	// Unused Arduino outputs
	assign {arduino_a[5], arduino_a[2:0]} = 4'bZ;

endmodule