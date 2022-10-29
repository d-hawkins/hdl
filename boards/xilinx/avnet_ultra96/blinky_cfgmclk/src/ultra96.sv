// ----------------------------------------------------------------------------
// ultra96.sv
//
// 12/26/2021 D. W. Hawkins (dwh@caltech.edu)
//
// Avnet Ultra96 Xilinx MPSoC example design.
//
// This design is implemented using the PL only;
//  * STARTUPE3 provides access to the internal oscillator and DONE LED
//
// ----------------------------------------------------------------------------
// Notes
// -----
//
// 1. DONE LED control
//
//    The Ultra96v1 schematic shows the FPGA DONE output controls an N-channel
//    MOSFET which controls an LED tied to 3.3V. The 3.3V voltage is needed, as
//    green LEDs have high forward voltage.
//
//    Driving the DONE pin high was not sufficient to turn on the MOSFET, but
//    tri-stating it was. Why?
//
//    According to the ROHM MOSFET datasheet Vgs = 1.2V is sufficient to turn
//    on the MOSFET. According to the Ultra96v1 schematic VCC_PSAUX = 1.8V.
//    So for the case where DONE is tri-stated, the pull-up to 1.8V turns on
//    the green LED. Given that driving DONE high done not work, the DONE
//    Voh must be too low to turn on the MOSFET. DS925 indicates that
//    Voh(min) = 1.80V – 0.45V = 1.35V, and that should have been sufficient,
//    but perhaps Vds was too high in combination with the green LED forward
//    voltage. The Lumex green LED Vf = 2.2V (min), and the current used
//    to test the LED was 20mA. The Ultra96v1 series resistance is 261-ohm,
//    so if the MOSFET on resistance was 1-ohm, the LED current would be
//    I = (3.3-2.2)/262 = 4mA, which is low relative to the LED data sheet.
//    Driving the DONE output high would result in a lower Vgs voltage than
//    using the 1.8V pull-up, and hence lower LED current, and the LED does
//    not turn on. The Avnet DONE LED driver design is not very robust.
//
// ----------------------------------------------------------------------------

module ultra96; // No top-level pins required

	// ------------------------------------------------------------------------
	// Local parameters
	// ------------------------------------------------------------------------
	//
	// CFGMCLK frequency
	localparam real CFGMCLK_FREQUENCY = 50.00e6;

	// LED blink rate
	localparam real BLINK_PERIOD = 0.5;

	// Counter width
	//
	// Note: the integer'() casts are important, without them Vivado
	// generates incorrect counter widths (much wider than expected)
	//
	// DONE LED driven by 50MHz
	localparam integer COUNT_WIDTH =
		$clog2(integer'(CFGMCLK_FREQUENCY*BLINK_PERIOD));

	// ------------------------------------------------------------------------
	// Local signals
	// ------------------------------------------------------------------------
	//
	logic                   clk;
	logic                   done;
	logic [COUNT_WIDTH-1:0] count = '0;

	// ------------------------------------------------------------------------
	// STARTUPE3
	// ------------------------------------------------------------------------
	//
	STARTUPE3 #(
		.PROG_USR("FALSE"),
		.SIM_CCLK_FREQ(0.0)
	) u1 (
		.CFGCLK    (       ),
		.CFGMCLK   (cfgmclk), // 50MHz oscillator
		.DI        (       ),
		.EOS       (       ),
		.PREQ      (       ),
		.DO        (4'h0   ),
		.DTS       (4'hF   ),
		.FCSBO     (1'b0   ),
		.FCSBTS    (1'b1   ),
		.GSR       (1'b0   ),
		.GTS       (1'b0   ),
		.KEYCLEARB (1'b0   ),
		.PACK      (1'b0   ),
		.USRCCLKO  (1'b0   ),
		.USRCCLKTS (1'b1   ),

		// DONE control via low or high driver
		// * Does not work - LED does not turn on
//		.USRDONEO  (done    ), // Drive low or high
//		.USRDONETS (1'b0    )  // Output enabled

		// DONE control via low or tri-state
		// * Works ok
		.USRDONEO  (1'b0    ), // Drive low
		.USRDONETS (done    )  // Tri-state to generate high
	);

	// ------------------------------------------------------------------------
	// Global clock buffer
	// ------------------------------------------------------------------------
	//
	BUFG u2 (
		.I(cfgmclk),
		.O(clk    )
	);

	// -------------------------------------------------------------------------
	// Counter
	// -------------------------------------------------------------------------
	//
	always_ff @(posedge clk) begin
		count <= count + 1;
	end

	// -------------------------------------------------------------------------
	// DONE LED driver
	// -------------------------------------------------------------------------
	//
	assign done = count[COUNT_WIDTH-1];

endmodule