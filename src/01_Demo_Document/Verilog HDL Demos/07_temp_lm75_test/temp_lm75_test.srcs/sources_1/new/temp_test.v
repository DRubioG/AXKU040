`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/03/14 17:28:04
// Design Name: 
// Module Name: temp_test
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


module temp_test
(
   input       sys_clk_p,
   input       sys_clk_n,
   input       rst_n,
   output      scl, //iic时钟
   inout       sda,//iic数据
   input       uart_rx,//串口接收
   output      uart_tx,//串口发送       
   output      fan_pwm//风扇
);
wire done;
wire[16:0] data;
wire sys_clk;
assign fan_pwm=1'b0;//风扇
i2c_read_lm75 U0
(
.sys_clk        (sys_clk         ),
.rst_n          (rst_n           ),
.scl            (scl             ),//i2c时钟
.sda            (sda             ),//i2c数据
.data           (data            )
);
wire[19:0] bcd_Temp;
hextobcd U1
(//temp converse
.clk                (sys_clk     ),
.hex                (data        ),//二进制
.dec                (bcd_Temp    )//十进制
);
//
clk_ref U2
(
// Clock out ports
.clk_out1       (sys_clk        ),         // output clk_out1
// Status and control signals
.reset          (1'b0           ),        // input reset
.locked         (               ),       // output locked
// Clock in ports
.clk_in1_p      (sys_clk_p      ),      // input clk_in1_p
.clk_in1_n      (sys_clk_n      )      // input clk_in1_n
);
uart_send uart_send_m0(
.clk            (sys_clk         ),
.rst_n          (rst_n           ),
.sign           (data[16]        ),//符号
.read_bcd_Temp  (bcd_Temp        ),//数据
.uart_rx        (uart_rx         ),//串口接收
.uart_tx	    (uart_tx	     )//串口发送
);
endmodule 
