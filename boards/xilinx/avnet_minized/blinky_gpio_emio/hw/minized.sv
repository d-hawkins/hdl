// ----------------------------------------------------------------------------
// minized.sv
//
// 6/16/2019 D. W. Hawkins (dwh@caltech.edu)
//
// Avnet MiniZed Zynq-7 GPIO MIO/EMIO example design.
//
// This top-level HDL file is used to connect the Zynq GPIO EMIO to
// the PL bicolor LED.
//
// ----------------------------------------------------------------------------

module minized (
      // ======================================================================
      // Processor System (PS)
      // ======================================================================
      //
      // ----------------------------------------------------------------------
      // Fixed I/O
      // ----------------------------------------------------------------------
      //
      inout        FIXED_IO_ps_porb,
      inout        FIXED_IO_ps_srstb,
      inout        FIXED_IO_ps_clk,
      inout        FIXED_IO_ddr_vrp,
      inout        FIXED_IO_ddr_vrn,
      inout [31:0] FIXED_IO_mio,

      // ----------------------------------------------------------------------
      // DDR Memory
      // ----------------------------------------------------------------------
      //
      inout        DDR_reset_n,
      inout        DDR_ck_p,
      inout        DDR_ck_n,
      inout        DDR_cs_n,
      inout        DDR_ras_n,
      inout        DDR_cas_n,
      inout        DDR_we_n,
      inout        DDR_cke,
      inout        DDR_odt,
      inout  [2:0] DDR_ba,
      inout [14:0] DDR_addr,
      inout  [1:0] DDR_dqs_p,
      inout  [1:0] DDR_dqs_n,
      inout  [1:0] DDR_dm,
      inout [15:0] DDR_dq,

      // ======================================================================
      // Programmable Logic (PL)
      // ======================================================================
      //
      // ----------------------------------------------------------------------
      // User I/O
      // ----------------------------------------------------------------------
      //
      // Arduino interface (to control the bi-color LED)
      inout [5:0] arduino_a
   );

   // -------------------------------------------------------------------------
   // Local signals
   // -------------------------------------------------------------------------
   //
   logic [15:0] gpio_i;
   logic [15:0] gpio_o;
   logic [15:0] gpio_t;

   // =========================================================================
   // Processor System (PS)
   // =========================================================================
   //
   system u1 (
      // Fixed I/O
      .FIXED_IO_ps_porb  (FIXED_IO_ps_porb ),
      .FIXED_IO_ps_srstb (FIXED_IO_ps_srstb),
      .FIXED_IO_ps_clk   (FIXED_IO_ps_clk  ),
      .FIXED_IO_ddr_vrp  (FIXED_IO_ddr_vrp ),
      .FIXED_IO_ddr_vrn  (FIXED_IO_ddr_vrn ),
      .FIXED_IO_mio      (FIXED_IO_mio     ),

      // DDR Memory
      .DDR_reset_n       (DDR_reset_n      ),
      .DDR_ck_p          (DDR_ck_p         ),
      .DDR_ck_n          (DDR_ck_n         ),
      .DDR_cs_n          (DDR_cs_n         ),
      .DDR_ras_n         (DDR_ras_n        ),
      .DDR_cas_n         (DDR_cas_n        ),
      .DDR_we_n          (DDR_we_n         ),
      .DDR_cke           (DDR_cke          ),
      .DDR_odt           (DDR_odt          ),
      .DDR_ba            (DDR_ba           ),
      .DDR_addr          (DDR_addr         ),
      .DDR_dqs_p         (DDR_dqs_p        ),
      .DDR_dqs_n         (DDR_dqs_n        ),
      .DDR_dm            (DDR_dm           ),
      .DDR_dq            (DDR_dq           ),

      // EMIO GPIO
      .GPIO_tri_i        (gpio_i           ),
      .GPIO_tri_o        (gpio_o           ),
      .GPIO_tri_t        (gpio_t           )
   );

   // =========================================================================
   // Programmable Logic (PL)
   // =========================================================================
   //
   // -------------------------------------------------------------------------
   // PS GPIO Input
   // -------------------------------------------------------------------------
   //
   // Fixed pattern
   assign gpio_i = 16'h1234;

   // -------------------------------------------------------------------------
   // PS GPIO Output / PL LED Output
   // -------------------------------------------------------------------------
   //
   // A[3] = green LED (high = ON)
   assign arduino_a[3] = gpio_o[0];

   // A[4] = red LED   (high = ON)
   assign arduino_a[4] = gpio_o[1];

   // -------------------------------------------------------------------------
   // Unused PL Outputs
   // -------------------------------------------------------------------------
   //
   // Unused Arduino outputs
   assign {arduino_a[5], arduino_a[2:0]} = 4'bZ;

endmodule
