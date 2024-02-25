`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/08/23 14:08:19
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input         sys_clk_p,
    input         sys_clk_n,
    input 				key1,
    output                             c0_ddr4_act_n   ,
	output [16:0]                      c0_ddr4_adr     ,
	output [1:0]                       c0_ddr4_ba      ,
	output [0:0]                       c0_ddr4_bg      ,
	output [0:0]                       c0_ddr4_cke     ,
	output [0:0]                       c0_ddr4_odt     ,
	output [0:0]                       c0_ddr4_cs_n    ,
	output [0:0]                       c0_ddr4_ck_t    ,
	output [0:0]                       c0_ddr4_ck_c    ,
	output                             c0_ddr4_reset_n ,
	inout [7:0]                        c0_ddr4_dm_dbi_n,
	inout [63:0]                       c0_ddr4_dq      ,
	inout [7:0]                        c0_ddr4_dqs_c   ,
	inout [7:0]                        c0_ddr4_dqs_t  

    );

    wire		sys_clk_buf ;

    IBUFDS #(
   .DIFF_TERM("FALSE"),       // Differential Termination
   .IBUF_LOW_PWR("TRUE"),     // Low power="TRUE", Highest performance="FALSE" 
   .IOSTANDARD("DEFAULT")     // Specify the input I/O standard
) IBUFDS_inst (
   .O(sys_clk_buf),  // Buffer output
   .I(sys_clk_p),  // Diff_p buffer input (connect directly to top-level port)
   .IB(sys_clk_n) // Diff_n buffer input (connect directly to top-level port)
);
  BUFG BUFG_inst (
      .O(sys_clk), // 1-bit output: Clock output
      .I(sys_clk_buf)  // 1-bit input: Clock input
   );


(* IODELAY_GROUP = "delay_group" *)
IDELAYCTRL #(
   .SIM_DEVICE("ULTRASCALE")  // Must be set to "ULTRASCALE" 
)
IDELAYCTRL_inst (
   .RDY(),       // 1-bit output: Ready output
   .REFCLK(sys_clk), // 1-bit input: Reference clock input
   .RST(~key1)        // 1-bit input: Active high reset input. Asynchronous assert, synchronous deassert to
                    // REFCLK.
); 


ddr4_top ddr4_test_inst
(
	.c0_ddr4_act_n            (c0_ddr4_act_n   ),
	.c0_ddr4_adr              (c0_ddr4_adr     ),
	.c0_ddr4_ba               (c0_ddr4_ba      ),
	.c0_ddr4_bg               (c0_ddr4_bg      ),
	.c0_ddr4_cke              (c0_ddr4_cke     ),
	.c0_ddr4_odt              (c0_ddr4_odt     ),
	.c0_ddr4_cs_n             (c0_ddr4_cs_n    ),
	.c0_ddr4_ck_t             (c0_ddr4_ck_t    ),
	.c0_ddr4_ck_c             (c0_ddr4_ck_c    ),
	.c0_ddr4_reset_n          (c0_ddr4_reset_n ),
	.c0_ddr4_dm_dbi_n         (c0_ddr4_dm_dbi_n),
	.c0_ddr4_dq               (c0_ddr4_dq      ),
	.c0_ddr4_dqs_c            (c0_ddr4_dqs_c   ),
	.c0_ddr4_dqs_t            (c0_ddr4_dqs_t   ),

	.sys_clk       	  		  (sys_clk),
	.error	       	  		  (ddr4_error),
	.c0_init_calib_complete	       	  		  (c0_init_calib_complete),
	.sys_rst	          	  (~key1	  	 )
   );

endmodule
