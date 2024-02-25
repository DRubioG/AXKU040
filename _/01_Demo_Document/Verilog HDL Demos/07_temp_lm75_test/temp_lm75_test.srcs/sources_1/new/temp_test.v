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
   output      scl, //iicʱ��
   inout       sda,//iic����
   input       uart_rx,//���ڽ���
   output      uart_tx,//���ڷ���       
   output      fan_pwm//����
);
wire done;
wire[16:0] data;
wire sys_clk;
assign fan_pwm=1'b0;//����
i2c_read_lm75 U0
(
.sys_clk        (sys_clk         ),
.rst_n          (rst_n           ),
.scl            (scl             ),//i2cʱ��
.sda            (sda             ),//i2c����
.data           (data            )
);
wire[19:0] bcd_Temp;
hextobcd U1
(//temp converse
.clk                (sys_clk     ),
.hex                (data        ),//������
.dec                (bcd_Temp    )//ʮ����
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
.sign           (data[16]        ),//����
.read_bcd_Temp  (bcd_Temp        ),//����
.uart_rx        (uart_rx         ),//���ڽ���
.uart_tx	    (uart_tx	     )//���ڷ���
);
endmodule 
