`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/23 10:04:32
// Design Name: 
// Module Name: test
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


module test;
reg [23:0]data;
reg clk;
reg rst_n;
wire ack;
reg  start;
wire  i2c_sclk;
wire  i2c_sdat;
wire  clk1;
wire  rst_n1;


initial begin
    data=24'd0;
    clk=0;
    rst_n=0;
    start=0;
    #100 rst_n=1;
    #200 start=1;
    data =24'd240;

end

i2c_com uuu(
               .clock_i2c(clk1),          //i2c控制接口传输所需时钟，0-400khz，此处为20khz
               .reset_n(rst_n),     
               .ack(ack),              //应答信号
               .i2c_data(data1),          //24位i2c发送数据
               .start(start1),             //开始传输标志
               .tr_end(),            //传输结束标志
               .i2c_sclk(i2c_sclk),          //FPGA与WM8731的I2C时钟接口
               .i2c_sdat (i2c_sdat)          //FPGA与WM8731的I2C数据接口

        );                       
always #10 clk<=~clk;
assign data1  =data;
assign clk1   = clk;
assign rst_n1 = rst_n;
assign start1 =start;


endmodule
