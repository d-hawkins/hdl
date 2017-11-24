// ----------------------------------------------------------------
// zynq7_fclk_clks_and_resets.vhd
//
// 11/23/2017 D. W. Hawkins (dwh@caltech.edu)
//
// The Zynq-7 PS block contains the PLLs used to generate the
// clocks routed to the PL. This stub allows the synthesis of
// a design connected to FCLK_CLK[0:3] and FCLK_RESET[0:3].
// The clock and reset need to be configured and driven by the
// Zynq. This stub merely allows for the connection to the
// PS ports.
//
// ----------------------------------------------------------------
// References
// ----------
//
// [1] Xilinx, Vivado unisim component definitions, 2017.2.
//
//     $XILINX\Vivado\2017.2\data\vhdl\src\unisims\unisim_VCOMP.vhd
//     $XILINX\Vivado\2017.2\data\verilog\src\unisim_comp.v
//     $XILINX\Vivado\2017.2\data\verilog\src\unisims\PS7.v
//
// ----------------------------------------------------------------

module zynq7_fclk_clks_and_resets(
		output [3:0] fclk_clk,
		output [3:0] fclk_reset_n
	);

	// ------------------------------------------------------------
	// Zynq-7 processor block
	// ------------------------------------------------------------
	//
	// The Verilog component in PS7.v lists all of the port
	// directions as part of the module definition. That module
	// was copied here, and all unused outputs left as open,
	// and all inputs driven to deasserted values.
	//
	PS7 u1 (

		//---------------------------------------------------------
		// 'output' ports
		//---------------------------------------------------------
		//
		// DMA
		.DMA0DATYPE              (),
		.DMA0DAVALID             (),
		.DMA0DRREADY             (),
		.DMA0RSTN                (),
		.DMA1DATYPE              (),
		.DMA1DAVALID             (),
		.DMA1DRREADY             (),
		.DMA1RSTN                (),
		.DMA2DATYPE              (),
		.DMA2DAVALID             (),
		.DMA2DRREADY             (),
		.DMA2RSTN                (),
		.DMA3DATYPE              (),
		.DMA3DAVALID             (),
		.DMA3DRREADY             (),
		.DMA3RSTN                (),
		//
		// EMIO
		.EMIOCAN0PHYTX           (),
		.EMIOCAN1PHYTX           (),
		.EMIOENET0GMIITXD        (),
		.EMIOENET0GMIITXEN       (),
		.EMIOENET0GMIITXER       (),
		.EMIOENET0MDIOMDC        (),
		.EMIOENET0MDIOO          (),
		.EMIOENET0MDIOTN         (),
		.EMIOENET0PTPDELAYREQRX  (),
		.EMIOENET0PTPDELAYREQTX  (),
		.EMIOENET0PTPPDELAYREQRX (),
		.EMIOENET0PTPPDELAYREQTX (),
		.EMIOENET0PTPPDELAYRESPRX(),
		.EMIOENET0PTPPDELAYRESPTX(),
		.EMIOENET0PTPSYNCFRAMERX (),
		.EMIOENET0PTPSYNCFRAMETX (),
		.EMIOENET0SOFRX          (),
		.EMIOENET0SOFTX          (),
		.EMIOENET1GMIITXD        (),
		.EMIOENET1GMIITXEN       (),
		.EMIOENET1GMIITXER       (),
		.EMIOENET1MDIOMDC        (),
		.EMIOENET1MDIOO          (),
		.EMIOENET1MDIOTN         (),
		.EMIOENET1PTPDELAYREQRX  (),
		.EMIOENET1PTPDELAYREQTX  (),
		.EMIOENET1PTPPDELAYREQRX (),
		.EMIOENET1PTPPDELAYREQTX (),
		.EMIOENET1PTPPDELAYRESPRX(),
		.EMIOENET1PTPPDELAYRESPTX(),
		.EMIOENET1PTPSYNCFRAMERX (),
		.EMIOENET1PTPSYNCFRAMETX (),
		.EMIOENET1SOFRX          (),
		.EMIOENET1SOFTX          (),
		.EMIOGPIOO               (),
		.EMIOGPIOTN              (),
		.EMIOI2C0SCLO            (),
		.EMIOI2C0SCLTN           (),
		.EMIOI2C0SDAO            (),
		.EMIOI2C0SDATN           (),
		.EMIOI2C1SCLO            (),
		.EMIOI2C1SCLTN           (),
		.EMIOI2C1SDAO            (),
		.EMIOI2C1SDATN           (),
		.EMIOPJTAGTDO            (),
		.EMIOPJTAGTDTN           (),
		.EMIOSDIO0BUSPOW         (),
		.EMIOSDIO0BUSVOLT        (),
		.EMIOSDIO0CLK            (),
		.EMIOSDIO0CMDO           (),
		.EMIOSDIO0CMDTN          (),
		.EMIOSDIO0DATAO          (),
		.EMIOSDIO0DATATN         (),
		.EMIOSDIO0LED            (),
		.EMIOSDIO1BUSPOW         (),
		.EMIOSDIO1BUSVOLT        (),
		.EMIOSDIO1CLK            (),
		.EMIOSDIO1CMDO           (),
		.EMIOSDIO1CMDTN          (),
		.EMIOSDIO1DATAO          (),
		.EMIOSDIO1DATATN         (),
		.EMIOSDIO1LED            (),
		.EMIOSPI0MO              (),
		.EMIOSPI0MOTN            (),
		.EMIOSPI0SCLKO           (),
		.EMIOSPI0SCLKTN          (),
		.EMIOSPI0SO              (),
		.EMIOSPI0SSNTN           (),
		.EMIOSPI0SSON            (),
		.EMIOSPI0STN             (),
		.EMIOSPI1MO              (),
		.EMIOSPI1MOTN            (),
		.EMIOSPI1SCLKO           (),
		.EMIOSPI1SCLKTN          (),
		.EMIOSPI1SO              (),
		.EMIOSPI1SSNTN           (),
		.EMIOSPI1SSON            (),
		.EMIOSPI1STN             (),
		.EMIOTRACECTL            (),
		.EMIOTRACEDATA           (),
		.EMIOTTC0WAVEO           (),
		.EMIOTTC1WAVEO           (),
		.EMIOUART0DTRN           (),
		.EMIOUART0RTSN           (),
		.EMIOUART0TX             (),
		.EMIOUART1DTRN           (),
		.EMIOUART1RTSN           (),
		.EMIOUART1TX             (),
		.EMIOUSB0PORTINDCTL      (),
		.EMIOUSB0VBUSPWRSELECT   (),
		.EMIOUSB1PORTINDCTL      (),
		.EMIOUSB1VBUSPWRSELECT   (),
		.EMIOWDTRSTO             (),
		//
		// Event outputs
		.EVENTEVENTO             (),
		.EVENTSTANDBYWFE         (),
		.EVENTSTANDBYWFI         (),
		//
		// PL clocks and resets
		.FCLKCLK                 (fclk_clk),
		.FCLKRESETN              (fclk_reset_n),
		//
		.FTMTF2PTRIGACK          (),
		.FTMTP2FDEBUG            (),
		.FTMTP2FTRIG             (),
		.IRQP2F                  (),
		//
		// M-AXI General Purpose #0
		.MAXIGP0ARADDR           (),
		.MAXIGP0ARBURST          (),
		.MAXIGP0ARCACHE          (),
		.MAXIGP0ARESETN          (),
		.MAXIGP0ARID             (),
		.MAXIGP0ARLEN            (),
		.MAXIGP0ARLOCK           (),
		.MAXIGP0ARPROT           (),
		.MAXIGP0ARQOS            (),
		.MAXIGP0ARSIZE           (),
		.MAXIGP0ARVALID          (),
		.MAXIGP0AWADDR           (),
		.MAXIGP0AWBURST          (),
		.MAXIGP0AWCACHE          (),
		.MAXIGP0AWID             (),
		.MAXIGP0AWLEN            (),
		.MAXIGP0AWLOCK           (),
		.MAXIGP0AWPROT           (),
		.MAXIGP0AWQOS            (),
		.MAXIGP0AWSIZE           (),
		.MAXIGP0AWVALID          (),
		.MAXIGP0BREADY           (),
		.MAXIGP0RREADY           (),
		.MAXIGP0WDATA            (),
		.MAXIGP0WID              (),
		.MAXIGP0WLAST            (),
		.MAXIGP0WSTRB            (),
		.MAXIGP0WVALID           (),
		//
		// M-AXI General Purpose #1
		.MAXIGP1ARADDR           (),
		.MAXIGP1ARBURST          (),
		.MAXIGP1ARCACHE          (),
		.MAXIGP1ARESETN          (),
		.MAXIGP1ARID             (),
		.MAXIGP1ARLEN            (),
		.MAXIGP1ARLOCK           (),
		.MAXIGP1ARPROT           (),
		.MAXIGP1ARQOS            (),
		.MAXIGP1ARSIZE           (),
		.MAXIGP1ARVALID          (),
		.MAXIGP1AWADDR           (),
		.MAXIGP1AWBURST          (),
		.MAXIGP1AWCACHE          (),
		.MAXIGP1AWID             (),
		.MAXIGP1AWLEN            (),
		.MAXIGP1AWLOCK           (),
		.MAXIGP1AWPROT           (),
		.MAXIGP1AWQOS            (),
		.MAXIGP1AWSIZE           (),
		.MAXIGP1AWVALID          (),
		.MAXIGP1BREADY           (),
		.MAXIGP1RREADY           (),
		.MAXIGP1WDATA            (),
		.MAXIGP1WID              (),
		.MAXIGP1WLAST            (),
		.MAXIGP1WSTRB            (),
		.MAXIGP1WVALID           (),
		//
		// S-AXI ACP
		.SAXIACPARESETN          (),
		.SAXIACPARREADY          (),
		.SAXIACPAWREADY          (),
		.SAXIACPBID              (),
		.SAXIACPBRESP            (),
		.SAXIACPBVALID           (),
		.SAXIACPRDATA            (),
		.SAXIACPRID              (),
		.SAXIACPRLAST            (),
		.SAXIACPRRESP            (),
		.SAXIACPRVALID           (),
		.SAXIACPWREADY           (),
		//
		// S-AXI General Purpose #0
		.SAXIGP0ARESETN          (),
		.SAXIGP0ARREADY          (),
		.SAXIGP0AWREADY          (),
		.SAXIGP0BID              (),
		.SAXIGP0BRESP            (),
		.SAXIGP0BVALID           (),
		.SAXIGP0RDATA            (),
		.SAXIGP0RID              (),
		.SAXIGP0RLAST            (),
		.SAXIGP0RRESP            (),
		.SAXIGP0RVALID           (),
		.SAXIGP0WREADY           (),
		//
		// S-AXI General Purpose #1
		.SAXIGP1ARESETN          (),
		.SAXIGP1ARREADY          (),
		.SAXIGP1AWREADY          (),
		.SAXIGP1BID              (),
		.SAXIGP1BRESP            (),
		.SAXIGP1BVALID           (),
		.SAXIGP1RDATA            (),
		.SAXIGP1RID              (),
		.SAXIGP1RLAST            (),
		.SAXIGP1RRESP            (),
		.SAXIGP1RVALID           (),
		.SAXIGP1WREADY           (),
		//
		// S-AXI High Performance #0
		.SAXIHP0ARESETN          (),
		.SAXIHP0ARREADY          (),
		.SAXIHP0AWREADY          (),
		.SAXIHP0BID              (),
		.SAXIHP0BRESP            (),
		.SAXIHP0BVALID           (),
		.SAXIHP0RACOUNT          (),
		.SAXIHP0RCOUNT           (),
		.SAXIHP0RDATA            (),
		.SAXIHP0RID              (),
		.SAXIHP0RLAST            (),
		.SAXIHP0RRESP            (),
		.SAXIHP0RVALID           (),
		.SAXIHP0WACOUNT          (),
		.SAXIHP0WCOUNT           (),
		.SAXIHP0WREADY           (),
		//
		// S-AXI High Performance #1
		.SAXIHP1ARESETN          (),
		.SAXIHP1ARREADY          (),
		.SAXIHP1AWREADY          (),
		.SAXIHP1BID              (),
		.SAXIHP1BRESP            (),
		.SAXIHP1BVALID           (),
		.SAXIHP1RACOUNT          (),
		.SAXIHP1RCOUNT           (),
		.SAXIHP1RDATA            (),
		.SAXIHP1RID              (),
		.SAXIHP1RLAST            (),
		.SAXIHP1RRESP            (),
		.SAXIHP1RVALID           (),
		.SAXIHP1WACOUNT          (),
		.SAXIHP1WCOUNT           (),
		.SAXIHP1WREADY           (),
		//
		// S-AXI High Performance #2
		.SAXIHP2ARESETN          (),
		.SAXIHP2ARREADY          (),
		.SAXIHP2AWREADY          (),
		.SAXIHP2BID              (),
		.SAXIHP2BRESP            (),
		.SAXIHP2BVALID           (),
		.SAXIHP2RACOUNT          (),
		.SAXIHP2RCOUNT           (),
		.SAXIHP2RDATA            (),
		.SAXIHP2RID              (),
		.SAXIHP2RLAST            (),
		.SAXIHP2RRESP            (),
		.SAXIHP2RVALID           (),
		.SAXIHP2WACOUNT          (),
		.SAXIHP2WCOUNT           (),
		.SAXIHP2WREADY           (),
		//
		// S-AXI High Performance #3
		.SAXIHP3ARESETN          (),
		.SAXIHP3ARREADY          (),
		.SAXIHP3AWREADY          (),
		.SAXIHP3BID              (),
		.SAXIHP3BRESP            (),
		.SAXIHP3BVALID           (),
		.SAXIHP3RACOUNT          (),
		.SAXIHP3RCOUNT           (),
		.SAXIHP3RDATA            (),
		.SAXIHP3RID              (),
		.SAXIHP3RLAST            (),
		.SAXIHP3RRESP            (),
		.SAXIHP3RVALID           (),
		.SAXIHP3WACOUNT          (),
		.SAXIHP3WCOUNT           (),
		.SAXIHP3WREADY           (),

		//---------------------------------------------------------
		// 'inout' ports
		//---------------------------------------------------------
		//
		.DDRA                    ('Z),
		.DDRBA                   ('Z),
		.DDRCASB                 (1'bZ),
		.DDRCKE                  (1'bZ),
		.DDRCKN                  (1'bZ),
		.DDRCKP                  (1'bZ),
		.DDRCSB                  (1'bZ),
		.DDRDM                   ('Z),
		.DDRDQ                   ('Z),
		.DDRDQSN                 ('Z),
		.DDRDQSP                 ('Z),
		.DDRDRSTB                (1'bZ),
		.DDRODT                  (1'bZ),
		.DDRRASB                 (1'bZ),
		.DDRVRN                  (1'bZ),
		.DDRVRP                  (1'bZ),
		.DDRWEB                  (1'bZ),
		.MIO                     ('Z),
		.PSCLK                   (1'bZ),
		.PSPORB                  (1'bZ),
		.PSSRSTB                 (1'bZ),

		//---------------------------------------------------------
		// 'input' ports
		//---------------------------------------------------------
		//
		// DDR
		.DDRARB                  ('0),
		//
		// DMA
		.DMA0ACLK                (1'b0),
		.DMA0DAREADY             (1'b0),
		.DMA0DRLAST              (1'b0),
		.DMA0DRTYPE              ('0),
		.DMA0DRVALID             (1'b0),
		.DMA1ACLK                (1'b0),
		.DMA1DAREADY             (1'b0),
		.DMA1DRLAST              (1'b0),
		.DMA1DRTYPE              ('0),
		.DMA1DRVALID             (1'b0),
		.DMA2ACLK                (1'b0),
		.DMA2DAREADY             (1'b0),
		.DMA2DRLAST              (1'b0),
		.DMA2DRTYPE              ('0),
		.DMA2DRVALID             (1'b0),
		.DMA3ACLK                (1'b0),
		.DMA3DAREADY             (1'b0),
		.DMA3DRLAST              (1'b0),
		.DMA3DRTYPE              ('0),
		.DMA3DRVALID             (1'b0),
		//
		// EMIO
		.EMIOCAN0PHYRX           (1'b0),
		.EMIOCAN1PHYRX           (1'b0),
		.EMIOENET0EXTINTIN       (1'b0),
		.EMIOENET0GMIICOL        (1'b0),
		.EMIOENET0GMIICRS        (1'b0),
		.EMIOENET0GMIIRXCLK      (1'b0),
		.EMIOENET0GMIIRXD        ('0),
		.EMIOENET0GMIIRXDV       (1'b0),
		.EMIOENET0GMIIRXER       (1'b0),
		.EMIOENET0GMIITXCLK      (1'b0),
		.EMIOENET0MDIOI          (1'b0),
		.EMIOENET1EXTINTIN       (1'b0),
		.EMIOENET1GMIICOL        (1'b0),
		.EMIOENET1GMIICRS        (1'b0),
		.EMIOENET1GMIIRXCLK      (1'b0),
		.EMIOENET1GMIIRXD        ('0),
		.EMIOENET1GMIIRXDV       (1'b0),
		.EMIOENET1GMIIRXER       (1'b0),
		.EMIOENET1GMIITXCLK      (1'b0),
		.EMIOENET1MDIOI          (1'b0),
		.EMIOGPIOI               ('0),
		.EMIOI2C0SCLI            (1'b0),
		.EMIOI2C0SDAI            (1'b0),
		.EMIOI2C1SCLI            (1'b0),
		.EMIOI2C1SDAI            (1'b0),
		.EMIOPJTAGTCK            (1'b0),
		.EMIOPJTAGTDI            (1'b0),
		.EMIOPJTAGTMS            (1'b0),
		.EMIOSDIO0CDN            (1'b0),
		.EMIOSDIO0CLKFB          (1'b0),
		.EMIOSDIO0CMDI           (1'b0),
		.EMIOSDIO0DATAI          ('0),
		.EMIOSDIO0WP             (1'b0),
		.EMIOSDIO1CDN            (1'b0),
		.EMIOSDIO1CLKFB          (1'b0),
		.EMIOSDIO1CMDI           (1'b0),
		.EMIOSDIO1DATAI          ('0),
		.EMIOSDIO1WP             (1'b0),
		.EMIOSPI0MI              (1'b0),
		.EMIOSPI0SCLKI           (1'b0),
		.EMIOSPI0SI              (1'b0),
		.EMIOSPI0SSIN            (1'b0),
		.EMIOSPI1MI              (1'b0),
		.EMIOSPI1SCLKI           (1'b0),
		.EMIOSPI1SI              (1'b0),
		.EMIOSPI1SSIN            (1'b0),
		.EMIOSRAMINTIN           (1'b0),
		.EMIOTRACECLK            (1'b0),
		.EMIOTTC0CLKI            ('0),
		.EMIOTTC1CLKI            ('0),
		.EMIOUART0CTSN           (1'b0),
		.EMIOUART0DCDN           (1'b0),
		.EMIOUART0DSRN           (1'b0),
		.EMIOUART0RIN            (1'b0),
		.EMIOUART0RX             (1'b0),
		.EMIOUART1CTSN           (1'b0),
		.EMIOUART1DCDN           (1'b0),
		.EMIOUART1DSRN           (1'b0),
		.EMIOUART1RIN            (1'b0),
		.EMIOUART1RX             (1'b0),
		.EMIOUSB0VBUSPWRFAULT    (1'b0),
		.EMIOUSB1VBUSPWRFAULT    (1'b0),
		.EMIOWDTCLKI             (1'b0),
		//
		// Event inputs
		.EVENTEVENTI             (1'b0),
		//
		// PS-PL clocks
		.FCLKCLKTRIGN            ('0),
		//
		// Trace/debug
		.FPGAIDLEN               (1'b0),
		.FTMDTRACEINATID         ('0),
		.FTMDTRACEINCLOCK        (1'b0),
		.FTMDTRACEINDATA         ('0),
		.FTMDTRACEINVALID        (1'b0),
		.FTMTF2PDEBUG            ('0),
		.FTMTF2PTRIG             ('0),
		.FTMTP2FTRIGACK          ('0),
		//
		// IRQ
		.IRQF2P                  ('0),
		//
		// M-AXI General Purpose #0
		.MAXIGP0ACLK             (1'b0),
		.MAXIGP0ARREADY          (1'b0),
		.MAXIGP0AWREADY          (1'b0),
		.MAXIGP0BID              ('0),
		.MAXIGP0BRESP            ('0),
		.MAXIGP0BVALID           (1'b0),
		.MAXIGP0RDATA            ('0),
		.MAXIGP0RID              ('0),
		.MAXIGP0RLAST            (1'b0),
		.MAXIGP0RRESP            ('0),
		.MAXIGP0RVALID           (1'b0),
		.MAXIGP0WREADY           (1'b0),
		//
		// M-AXI General Purpose #1
		.MAXIGP1ACLK             (1'b0),
		.MAXIGP1ARREADY          (1'b0),
		.MAXIGP1AWREADY          (1'b0),
		.MAXIGP1BID              ('0),
		.MAXIGP1BRESP            ('0),
		.MAXIGP1BVALID           (1'b0),
		.MAXIGP1RDATA            ('0),
		.MAXIGP1RID              ('0),
		.MAXIGP1RLAST            (1'b0),
		.MAXIGP1RRESP            ('0),
		.MAXIGP1RVALID           (1'b0),
		.MAXIGP1WREADY           (1'b0),
		//
		// S-AXI ACP
		.SAXIACPACLK             (1'b0),
		.SAXIACPARADDR           ('0),
		.SAXIACPARBURST          ('0),
		.SAXIACPARCACHE          ('0),
		.SAXIACPARID             ('0),
		.SAXIACPARLEN            ('0),
		.SAXIACPARLOCK           ('0),
		.SAXIACPARPROT           ('0),
		.SAXIACPARQOS            ('0),
		.SAXIACPARSIZE           ('0),
		.SAXIACPARUSER           ('0),
		.SAXIACPARVALID          (1'b0),
		.SAXIACPAWADDR           ('0),
		.SAXIACPAWBURST          ('0),
		.SAXIACPAWCACHE          ('0),
		.SAXIACPAWID             ('0),
		.SAXIACPAWLEN            ('0),
		.SAXIACPAWLOCK           ('0),
		.SAXIACPAWPROT           ('0),
		.SAXIACPAWQOS            ('0),
		.SAXIACPAWSIZE           ('0),
		.SAXIACPAWUSER           ('0),
		.SAXIACPAWVALID          (1'b0),
		.SAXIACPBREADY           (1'b0),
		.SAXIACPRREADY           (1'b0),
		.SAXIACPWDATA            ('0),
		.SAXIACPWID              ('0),
		.SAXIACPWLAST            (1'b0),
		.SAXIACPWSTRB            ('0),
		.SAXIACPWVALID           (1'b0),
		//
		// S-AXI General Purpose #0
		.SAXIGP0ACLK             (1'b0),
		.SAXIGP0ARADDR           ('0),
		.SAXIGP0ARBURST          ('0),
		.SAXIGP0ARCACHE          ('0),
		.SAXIGP0ARID             ('0),
		.SAXIGP0ARLEN            ('0),
		.SAXIGP0ARLOCK           ('0),
		.SAXIGP0ARPROT           ('0),
		.SAXIGP0ARQOS            ('0),
		.SAXIGP0ARSIZE           ('0),
		.SAXIGP0ARVALID          (1'b0),
		.SAXIGP0AWADDR           ('0),
		.SAXIGP0AWBURST          ('0),
		.SAXIGP0AWCACHE          ('0),
		.SAXIGP0AWID             ('0),
		.SAXIGP0AWLEN            ('0),
		.SAXIGP0AWLOCK           ('0),
		.SAXIGP0AWPROT           ('0),
		.SAXIGP0AWQOS            ('0),
		.SAXIGP0AWSIZE           ('0),
		.SAXIGP0AWVALID          (1'b0),
		.SAXIGP0BREADY           (1'b0),
		.SAXIGP0RREADY           (1'b0),
		.SAXIGP0WDATA            ('0),
		.SAXIGP0WID              ('0),
		.SAXIGP0WLAST            (1'b0),
		.SAXIGP0WSTRB            ('0),
		.SAXIGP0WVALID           (1'b0),
		//
		// S-AXI General Purpose #1
		.SAXIGP1ACLK             (1'b0),
		.SAXIGP1ARADDR           ('0),
		.SAXIGP1ARBURST          ('0),
		.SAXIGP1ARCACHE          ('0),
		.SAXIGP1ARID             ('0),
		.SAXIGP1ARLEN            ('0),
		.SAXIGP1ARLOCK           ('0),
		.SAXIGP1ARPROT           ('0),
		.SAXIGP1ARQOS            ('0),
		.SAXIGP1ARSIZE           ('0),
		.SAXIGP1ARVALID          (1'b0),
		.SAXIGP1AWADDR           ('0),
		.SAXIGP1AWBURST          ('0),
		.SAXIGP1AWCACHE          ('0),
		.SAXIGP1AWID             ('0),
		.SAXIGP1AWLEN            ('0),
		.SAXIGP1AWLOCK           ('0),
		.SAXIGP1AWPROT           ('0),
		.SAXIGP1AWQOS            ('0),
		.SAXIGP1AWSIZE           ('0),
		.SAXIGP1AWVALID          (1'b0),
		.SAXIGP1BREADY           (1'b0),
		.SAXIGP1RREADY           (1'b0),
		.SAXIGP1WDATA            ('0),
		.SAXIGP1WID              ('0),
		.SAXIGP1WLAST            (1'b0),
		.SAXIGP1WSTRB            ('0),
		.SAXIGP1WVALID           (1'b0),
		//
		// S-AXI High Performance #0
		.SAXIHP0ACLK             (1'b0),
		.SAXIHP0ARADDR           ('0),
		.SAXIHP0ARBURST          ('0),
		.SAXIHP0ARCACHE          ('0),
		.SAXIHP0ARID             ('0),
		.SAXIHP0ARLEN            ('0),
		.SAXIHP0ARLOCK           ('0),
		.SAXIHP0ARPROT           ('0),
		.SAXIHP0ARQOS            ('0),
		.SAXIHP0ARSIZE           ('0),
		.SAXIHP0ARVALID          (1'b0),
		.SAXIHP0AWADDR           ('0),
		.SAXIHP0AWBURST          ('0),
		.SAXIHP0AWCACHE          ('0),
		.SAXIHP0AWID             ('0),
		.SAXIHP0AWLEN            ('0),
		.SAXIHP0AWLOCK           ('0),
		.SAXIHP0AWPROT           ('0),
		.SAXIHP0AWQOS            ('0),
		.SAXIHP0AWSIZE           ('0),
		.SAXIHP0AWVALID          (1'b0),
		.SAXIHP0BREADY           (1'b0),
		.SAXIHP0RDISSUECAP1EN    (1'b0),
		.SAXIHP0RREADY           (1'b0),
		.SAXIHP0WDATA            ('0),
		.SAXIHP0WID              ('0),
		.SAXIHP0WLAST            (1'b0),
		.SAXIHP0WRISSUECAP1EN    (1'b0),
		.SAXIHP0WSTRB            ('0),
		.SAXIHP0WVALID           (1'b0),
		//
		// S-AXI High Performance #1
		.SAXIHP1ACLK             (1'b0),
		.SAXIHP1ARADDR           ('0),
		.SAXIHP1ARBURST          ('0),
		.SAXIHP1ARCACHE          ('0),
		.SAXIHP1ARID             ('0),
		.SAXIHP1ARLEN            ('0),
		.SAXIHP1ARLOCK           ('0),
		.SAXIHP1ARPROT           ('0),
		.SAXIHP1ARQOS            ('0),
		.SAXIHP1ARSIZE           ('0),
		.SAXIHP1ARVALID          (1'b0),
		.SAXIHP1AWADDR           ('0),
		.SAXIHP1AWBURST          ('0),
		.SAXIHP1AWCACHE          ('0),
		.SAXIHP1AWID             ('0),
		.SAXIHP1AWLEN            ('0),
		.SAXIHP1AWLOCK           ('0),
		.SAXIHP1AWPROT           ('0),
		.SAXIHP1AWQOS            ('0),
		.SAXIHP1AWSIZE           ('0),
		.SAXIHP1AWVALID          (1'b0),
		.SAXIHP1BREADY           (1'b0),
		.SAXIHP1RDISSUECAP1EN    (1'b0),
		.SAXIHP1RREADY           (1'b0),
		.SAXIHP1WDATA            ('0),
		.SAXIHP1WID              ('0),
		.SAXIHP1WLAST            (1'b0),
		.SAXIHP1WRISSUECAP1EN    (1'b0),
		.SAXIHP1WSTRB            ('0),
		.SAXIHP1WVALID           (1'b0),
		//
		// S-AXI High Performance #2
		.SAXIHP2ACLK             (1'b0),
		.SAXIHP2ARADDR           ('0),
		.SAXIHP2ARBURST          ('0),
		.SAXIHP2ARCACHE          ('0),
		.SAXIHP2ARID             ('0),
		.SAXIHP2ARLEN            ('0),
		.SAXIHP2ARLOCK           ('0),
		.SAXIHP2ARPROT           ('0),
		.SAXIHP2ARQOS            ('0),
		.SAXIHP2ARSIZE           ('0),
		.SAXIHP2ARVALID          (1'b0),
		.SAXIHP2AWADDR           ('0),
		.SAXIHP2AWBURST          ('0),
		.SAXIHP2AWCACHE          ('0),
		.SAXIHP2AWID             ('0),
		.SAXIHP2AWLEN            ('0),
		.SAXIHP2AWLOCK           ('0),
		.SAXIHP2AWPROT           ('0),
		.SAXIHP2AWQOS            ('0),
		.SAXIHP2AWSIZE           ('0),
		.SAXIHP2AWVALID          (1'b0),
		.SAXIHP2BREADY           (1'b0),
		.SAXIHP2RDISSUECAP1EN    (1'b0),
		.SAXIHP2RREADY           (1'b0),
		.SAXIHP2WDATA            ('0),
		.SAXIHP2WID              ('0),
		.SAXIHP2WLAST            (1'b0),
		.SAXIHP2WRISSUECAP1EN    (1'b0),
		.SAXIHP2WSTRB            ('0),
		.SAXIHP2WVALID           (1'b0),
		//
		// S-AXI High Performance #3
		.SAXIHP3ACLK             (1'b0),
		.SAXIHP3ARADDR           ('0),
		.SAXIHP3ARBURST          ('0),
		.SAXIHP3ARCACHE          ('0),
		.SAXIHP3ARID             ('0),
		.SAXIHP3ARLEN            ('0),
		.SAXIHP3ARLOCK           ('0),
		.SAXIHP3ARPROT           ('0),
		.SAXIHP3ARQOS            ('0),
		.SAXIHP3ARSIZE           ('0),
		.SAXIHP3ARVALID          (1'b0),
		.SAXIHP3AWADDR           ('0),
		.SAXIHP3AWBURST          ('0),
		.SAXIHP3AWCACHE          ('0),
		.SAXIHP3AWID             ('0),
		.SAXIHP3AWLEN            ('0),
		.SAXIHP3AWLOCK           ('0),
		.SAXIHP3AWPROT           ('0),
		.SAXIHP3AWQOS            ('0),
		.SAXIHP3AWSIZE           ('0),
		.SAXIHP3AWVALID          (1'b0),
		.SAXIHP3BREADY           (1'b0),
		.SAXIHP3RDISSUECAP1EN    (1'b0),
		.SAXIHP3RREADY           (1'b0),
		.SAXIHP3WDATA            ('0),
		.SAXIHP3WID              ('0),
		.SAXIHP3WLAST            (1'b0),
		.SAXIHP3WRISSUECAP1EN    (1'b0),
		.SAXIHP3WSTRB            ('0),
		.SAXIHP3WVALID           (1'b0)
	);

endmodule
