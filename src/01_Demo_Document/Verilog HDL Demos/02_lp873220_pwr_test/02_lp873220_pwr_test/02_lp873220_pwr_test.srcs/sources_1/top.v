//  Author:lhj                                                                  //
//                                                                              //
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
//2018/01/05                    1.0          Original

//*******************************************************************************/
module top(
input                           sys_clk,      //  system clock 50Mhz input on boardt        
input                           rst_n,          

//i2c interface of lp873220       
output                          pwr_en,
inout                           pwr_scl,
inout                           pwr_sda

);


assign pwr_en   =1'b1;

//confige reigister of lp873220
reg_config	reg_config_inst(
	.clock_50m           (sys_clk),
	.reset_n             (rst_n),
	.i2c_sdat            (pwr_sda),
	.i2c_sclk            (pwr_scl)
	);

endmodule