`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/20 17:00:01
// Design Name: 
// Module Name: led
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


module led(
    input sys_clk_p,
    input sys_clk_n,
    input rst_n,
    output reg[3:0]led

);
reg [31:0]timer;
wire sys_clk;

   IBUFDS #(
      .DQS_BIAS("FALSE")  // (FALSE, TRUE)
   )
   IBUFDS_inst (
      .O(sys_clk),   // 1-bit output: Buffer output
      .I(sys_clk_p),   // 1-bit input: Diff_p buffer input (connect directly to top-level port)
      .IB(sys_clk_n)  // 1-bit input: Diff_n buffer input (connect directly to top-level port)
   );

   // End of IBUFDS_inst instantiation
					
					

always@(posedge sys_clk or negedge rst_n)
begin
if (~rst_n)
timer <= 32'd0;
else if (timer == 32'd199_999_999)
timer <= 32'd0;

else
timer <= timer + 1'b1;

end
always@(posedge sys_clk or negedge rst_n)
begin
if (~rst_n)
led <= 4'b0000;
else if (timer == 32'd49_999_999)
led <= 4'b0001;
else if (timer == 32'd99_999_999)
led <= 4'b0010;
else if (timer == 32'd149_999_999)
led <= 4'b0100;
else if (timer == 32'd199_999_999)
led <= 4'b1000;
end



endmodule
