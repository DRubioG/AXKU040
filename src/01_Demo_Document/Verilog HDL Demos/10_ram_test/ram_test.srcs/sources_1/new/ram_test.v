`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module ram_test(
      input sys_clk_p,
			input sys_clk_n,		          //50MHz???
			input rst_n	             //??λ??????????Ч	
		);

//-----------------------------------------------------------
reg[8:0]  w_addr;	   //RAMд???
reg[15:0] w_data;	   //RAMд????
reg       wea;	      //RAM PORTA ???
reg[8:0]  r_addr;	   //RAM?????
wire[15:0] r_data;	//RAM??????
wire clk;


//////////差分转单端时钟///////////////

IBUFDS #(
      .DQS_BIAS("FALSE")  // (FALSE, TRUE)
   )
   IBUFDS_inst (
      .O(clk),   // 1-bit output: Buffer output
      .I(sys_clk_p),   // 1-bit input: Diff_p buffer input (connect directly to top-level port)
      .IB(sys_clk_n)  // 1-bit input: Diff_n buffer input (connect directly to top-level port)
   );

//????RAM?????????????
always @(posedge clk or negedge rst_n)
  if(rst_n==1'b0) 
	   r_addr <= 9'd0;
  else 
      r_addr <= r_addr+1'b1;


///????RAMд???????
always@(posedge clk or negedge rst_n)
begin	
  if(rst_n==1'b0) begin
  	  wea <= 1'b0;
     w_addr <= 9'd0;
	  w_data <= 16'd0;
  end
  else begin
     if(w_addr==511) begin    //ramд?????
        wea <= 1'b0;                 
     end
     else begin                    
        wea<=1'b1;              //ramд???
		  w_addr <= w_addr + 1'b1;
		  w_data <= w_data + 1'b1;
	  end
  end 
end 

//-----------------------------------------------------------
//?????RAM	
ram_ip ram_ip_inst (
  .clka      (clk          ),     // input clka
  .wea       (wea          ),     // input [0 : 0] wea
  .addra     (w_addr       ),     // input [8 : 0] addra
  .dina      (w_data       ),     // input [15 : 0] dina
  .clkb      (clk          ),     // input clkb
  .addrb     (r_addr       ),     // input [8 : 0] addrb
  .doutb     (r_data       )      // output [15 : 0] doutb
);


ila_0 ila_0_inst (
	.clk(clk), 
	.probe0(r_data), 
	.probe1(r_addr) 
);

	
endmodule
