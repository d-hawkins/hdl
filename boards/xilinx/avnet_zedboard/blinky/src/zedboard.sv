// ----------------------------------------------------------------------------
// zedboard.sv
//
// 5/18/2019 D. W. Hawkins (dwh@caltech.edu)
//
// Avnet Zedboard Zynq-7 'blinky' design.
//
// Design features;
//  * 100MHz clock from the Zynq-7 PLL
//  * 100MHz clock from the external PL source
//  * Blinking blue DONE LED
//  * Blinking red LEDs
//     - LED[3:0] blinked by PS 100MHz clock
//     - LED[7:4] blinked by PL 100MHz clock
//  * Push button BTNC resets the design
//  * The DIP switches invert the LEDs
//
// If the Zynq-700 subsystem is not initialized, then only the PL LEDs blink.
// The Zynq-7000 can be initialized by booting the QSPI flash example that
// comes with the Zedboard, and then downloading 'blinky' using JTAG.
//
// ----------------------------------------------------------------------------
// Notes
// -----
//
// 1. Top-level port list
//
//    This design uses the minimum number of top-level ports.
//    See zedboard_pin_constraints.tcl for the port names that
//    will be automatically constrained by that same script.
//
// ----------------------------------------------------------------------------

module zedboard (
      // External 100MHz clock
      input clk_100mhz,

      // Push button reset
      input  [2:2] pb,

      // Switches
      input  [7:0] sw,

      // LEDs
      output [7:0] led
   );

   // -------------------------------------------------------------------------
   // Local parameters
   // -------------------------------------------------------------------------
   //
   // Clock frequency
   localparam real CLK_FREQUENCY = 100.0e6;

   // LED blink rate (LSB LED)
   localparam real BLINK_PERIOD = 0.5;

   // Number of clock periods needed to blink the LSB LED
   localparam integer COUNT_PERIODS =
      CLK_FREQUENCY*BLINK_PERIOD;

   // Counter width for 4 LEDs
   localparam integer COUNT_WIDTH =
      $clog2(COUNT_PERIODS)+3;

   // -------------------------------------------------------------------------
   // Local signals
   // -------------------------------------------------------------------------
   //
   logic             [3:0] fclk_clk;
   logic             [3:0] fclk_reset_n;
   logic                   clk_a;
   logic                   clk_b;
   logic                   rst_a_n;
   logic                   rst_b_n;
   logic                   led_b;
   logic                   blue_duty_cycle;
   logic                   red_duty_cycle;
   logic [COUNT_WIDTH-1:0] count_a;
   logic [COUNT_WIDTH-1:0] count_b;

   // -------------------------------------------------------------------------
   // 7-series STARTUP component
   // -------------------------------------------------------------------------
   //
   STARTUPE2 #(
      .PROG_USR      ("FALSE"),
      .SIM_CCLK_FREQ (0.0   )
   ) u1 (
      .CFGCLK    (     ),
      .CFGMCLK   (     ), // 65MHz output - see blinky_osc
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
   // Zynq-7 PS-to-PL clocks and resets
   // --------------------------------------------------------
   //
   zynq7_fclk_clks_and_resets u2 (
      .fclk_clk    (fclk_clk    ),
      .fclk_reset_n(fclk_reset_n)
   );

   // -------------------------------------------------------------------------
   // Reset and clock
   // -------------------------------------------------------------------------
   //
   // Use Zynq reset 0
   assign rst_a_n = fclk_reset_n[0];

   // Use Zynq clock 0
   assign clk_a = fclk_clk[0];

   // Push button reset
   assign rst_b_n = !pb[2];

   // Use the external 100MHz clock
   assign clk_b = clk_100mhz;

   // -------------------------------------------------------------------------
   // Counter A
   // -------------------------------------------------------------------------
   //
   always_ff @(negedge rst_a_n or posedge clk_a) begin
      if (!rst_a_n) begin
         count_a <= '0;
      end
      else begin
         count_a <= count_a + 1;
      end
   end

   // -------------------------------------------------------------------------
   // Counter B
   // -------------------------------------------------------------------------
   //
   always_ff @(negedge rst_b_n or posedge clk_b) begin
      if (!rst_b_n) begin
         count_b <= '0;
      end
      else begin
         count_b <= count_b + 1;
      end
   end

   // -------------------------------------------------------------------------
   // LED drivers
   // -------------------------------------------------------------------------
   //
   // LED duty cycle
   // - the blue and red LEDs are quite bright, so reduce their duty cycle
   assign blue_duty_cycle = (count_b[2:0] == 000);
   assign red_duty_cycle  = (count_b[0] == 0);

   // Blink the DONE LED (at the same rate as the red LEDs)
   assign led_b = blue_duty_cycle ? count_b[COUNT_WIDTH-4] : 1'b0;

   // Red LEDs
   // - the switches invert the LED state
   assign led[3:0] = red_duty_cycle ? (count_a[COUNT_WIDTH-1:COUNT_WIDTH-4]^sw[3:0]) : '0;
   assign led[7:4] = red_duty_cycle ? (count_b[COUNT_WIDTH-1:COUNT_WIDTH-4]^sw[7:4]) : '0;

endmodule