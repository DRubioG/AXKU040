`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/05 15:05:00
// Design Name: 
// Module Name: rom_test
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


module rom_test(
input sys_clk_p,
input sys_clk_n,
input rst_n
    );

wire [7:0] rom_data;
reg[4:0] rom_addr;      //ROM??????? 
wire sys_clk;  

//????ROM?????????????
always @ (posedge sys_clk or negedge rst_n)
    if(rst_n == 1'b0)
        rom_addr <= 10'd0;
    else
        rom_addr <= rom_addr+1'b1;

 IBUFDS #(
      .DQS_BIAS("FALSE")  // (FALSE, TRUE)
   )
   IBUFDS_inst (
      .O(sys_clk),   // 1-bit output: Buffer output
      .I(sys_clk_p),   // 1-bit input: Diff_p buffer input (connect directly to top-level port)
      .IB(sys_clk_n)  // 1-bit input: Diff_n buffer input (connect directly to top-level port)
   );

        
//?????ROM
rom_ip rom_ip_inst
(
    .clka   (sys_clk    ),      //inoput clka
    .addra  (rom_addr   ),      //input [4:0] addra
    .douta  (rom_data   )       //output [7:0] douta
);

ila_0 ila_m0
(
    .clk    (sys_clk),
    .probe0 (rom_data)
);

endmodule