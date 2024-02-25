`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/08 18:50:56
// Design Name: 
// Module Name: uuuuu
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


module uuuuu(
input clk,
input rst,
input [4:0]led

);
reg led1[4:0];
always @(posedge clk or negedge rst) begin
if(!rst)
led1<=5'd0;
else
led1<=led;  
end
endmodule
