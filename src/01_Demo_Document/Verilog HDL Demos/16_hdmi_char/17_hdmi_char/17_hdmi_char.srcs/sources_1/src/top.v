//////////////////////////////////////////////////////////////////////////////////
//   vga color bar test                                                         //
//                                                                              //
//  Author:lhj                                                               //
//                                                                               //
//          ALINX(shanghai) Technology Co.,Ltd                                  //
//          heijin                                                              //
//     WEB: http://www.alinx.cn/                                                //
//     BBS: http://www.heijin.org/                                              //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
// Copyright (c) 2017,ALINX(shanghai) Technology Co.,Ltd                        //
//                    All rights reserved                                       //
//                                                                              //
// This source file may be used and distributed without restriction provided    //
// that this copyright statement is not removed from the file and that any      //
// derivative work contains the original copyright notice and the associated    //
// disclaimer.                                                                  //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

//================================================================================
//  Revision History:
//  Date          By            Revision    Change Description
//--------------------------------------------------------------------------------
//2018/01/11                   1.0          Original
//*******************************************************************************/
module top(
input                           sys_clk_p,      // Differentia system clock 200Mhz input on board
input                           sys_clk_n,
output                          fan,
     
inout                           hdmi_scl,
inout                           hdmi_sda, 
output                          vout_clk,
output                          vout_hs,
output                          vout_vs,
output                          vout_de,
output[23:0]                    vout_data   
);
wire[31:0]                      lut_data;

wire                            video_clk;

wire                            video_hs;
wire                            video_vs;
wire                            video_de;
wire[7:0]                       video_r;
wire[7:0]                       video_g;
wire[7:0]                       video_b;

wire                            osd_hs;
wire                            osd_vs;
wire                            osd_de;
wire[7:0]                       osd_r;
wire[7:0]                       osd_g;
wire[7:0]                       osd_b;

wire                            clk_27m;
wire                            rst_n;
wire                            locked;
assign fan       =1'b0;
assign vout_clk  = video_clk;
assign vout_hs   = osd_hs;
assign vout_vs   = osd_vs;
assign vout_de   = osd_de;
assign vout_data = {osd_r[7:0],osd_g[7:0],osd_b[7:0]};
assign rst_n = locked;
//assign hdmi_nreset = locked;

video_pll video_pll_m0
 (
	// Clock in ports
	.clk_in1_p         (sys_clk_p                  ),
	.clk_in1_n         (sys_clk_n                  ),
	// Clock out ports
	.clk_out1          (clk_100m                    ),
	.clk_out2          (video_clk                  ),
	// Status and control signals
	//.reset             (1'b0                       ),
	.locked            (locked                     )
 );
i2c_config i2c_config_m0(
	.rst               (~rst_n                     ),
	.clk               (clk_100m                    ),	
	.clk_div_cnt       (16'd499                  ),
	.i2c_addr_2byte    (1'b0                     ),
	.lut_index         (lut_index                ),
	.lut_dev_addr      (lut_data[31:24]          ),
	.lut_reg_addr      (lut_data[23:8]           ),
	.lut_reg_data      (lut_data[7:0]            ),
	.error             (                           ),
	.done              (                           ),
	
	.i2c_scl           (hdmi_scl                   ),
	.i2c_sda           (hdmi_sda                   )
);

color_bar color_bar_m0(
	.clk                (video_clk                 ),
	.rst                (~rst_n                    ),
	.hs                 (video_hs                  ),
	.vs                 (video_vs                  ),
	.de                 (video_de                  ),
	.rgb_r              (video_r                   ),
	.rgb_g              (video_g                   ),
	.rgb_b              (video_b                   )
);

osd_display  osd_display_m0(
	.rst_n              (rst_n                     ),
	.pclk               (video_clk                 ),
	.i_hs               (video_hs                  ),
	.i_vs               (video_vs                  ),
	.i_de               (video_de                  ),
	.i_data             ({video_r,video_g,video_b} ),
	.o_hs               (osd_hs                    ),
	.o_vs               (osd_vs                    ),
	.o_de               (osd_de                    ),
	.o_data             ({osd_r,osd_g,osd_b}       )
);
lut_adv7511 lut_adv7511_m0(
	.lut_index                  (lut_index                ),
	.lut_data                   (lut_data                 )
); 
endmodule