`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/08/21 11:36:04
// Design Name: 
// Module Name: lp87_test
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


module lp87_test;
    reg [23:0]i2c_data;
    reg reset_n;
    reg clock_i2c;
    wire ack;
    reg start;
    wire tr_end;
    wire i2c_sclk;
    wire i2c_sdat;

  initial begin
      i2c_data=24'd15;
      reset_n=0;
      clock_i2c=0;
      start=0;
      #500 reset_n=1;
      #500
      start=1;

  end  
always#10 clock_i2c=~clock_i2c;



 i2c_com tt(

     .i2c_data(i2c_data),
     .reset_n(reset_n),
     .clock_i2c(clock_i2c),
     .ack(ack),
     .start(start),
     .tr_end(tr_end),
     .i2c_sclk(i2c_sclk),
     .i2c_sdat(i2c_sdat)
 );

endmodule
