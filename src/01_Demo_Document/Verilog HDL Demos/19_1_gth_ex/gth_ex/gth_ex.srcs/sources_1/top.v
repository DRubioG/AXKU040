`timescale 1ns / 1ps
module top 
(
    output[3:0]   tx_disable,        
	input         sys_clk_p,
    input         sys_clk_n,

    input         mgtrefclk_n,
    input         mgtrefclk_p,    
    input [3:0]   RXN_IN,
    input [3:0]   RXP_IN,
    output[3:0]   TXN_OUT,
    output[3:0]   TXP_OUT
);

wire tx0_clk;
wire gt0_txfsmresetdone;
wire gt0_rxfsmresetdone;
(* MARK_DEBUG="true" *)wire[31:0] tx0_data;
(* MARK_DEBUG="true" *)wire[3:0] tx0_kchar;
wire tx1_clk;
(* MARK_DEBUG="true" *)wire[31:0] tx1_data;
(* MARK_DEBUG="true" *)wire[3:0] tx1_kchar; 
wire tx2_clk;
(* MARK_DEBUG="true" *)wire[31:0] tx2_data;
(* MARK_DEBUG="true" *)wire[3:0] tx2_kchar;
wire tx3_clk;
(* MARK_DEBUG="true" *)wire[31:0] tx3_data;
(* MARK_DEBUG="true" *)wire[3:0] tx3_kchar;

wire rx0_clk;
(* MARK_DEBUG="true" *)wire[31:0] rx0_data;
(* MARK_DEBUG="true" *)wire[3:0] rx0_kchar;
wire rx1_clk;
(* MARK_DEBUG="true" *)wire[31:0] rx1_data;
(* MARK_DEBUG="true" *)wire[3:0] rx1_kchar; 
wire rx2_clk;
(* MARK_DEBUG="true" *)wire[31:0] rx2_data;
(* MARK_DEBUG="true" *)wire[3:0] rx2_kchar;
wire rx3_clk;
(* MARK_DEBUG="true" *)wire[31:0] rx3_data;
(* MARK_DEBUG="true" *)wire[3:0] rx3_kchar;

wire[31:0] data_tx;
wire[3:0] data_ctrl;
reg[7:0] cnt;
wire tx_packet_data_rd;
wire rx_clk;

wire sys_clk;

assign tx_disable = 4'd0;


assign rx_clk = rx0_clk;
assign tx0_data = data_tx;
assign tx0_kchar = data_ctrl;
assign tx1_data = data_tx;
assign tx1_kchar = data_ctrl;
assign tx2_data = data_tx;
assign tx2_kchar = data_ctrl;
assign tx3_data = data_tx;
assign tx3_kchar = data_ctrl;	
always @ (posedge tx0_clk)
begin
    if(tx_packet_data_rd)
        cnt <= cnt + 8'd1;
    else
        cnt <= 8'd0;
end


IBUFGDS sys_clk_ibufgds
(
	.O  (sys_clk),           //200mhz
	.I  (sys_clk_p),
	.IB (sys_clk_n)
);


//wire gt0_txfsmresetdone_w;
//reset_0 reset_m0 
//(
//   .slowest_sync_clk(tx0_clk),          // input wire slowest_sync_clk
//   .ext_reset_in(gt0_txfsmresetdone),                  // input wire ext_reset_in
//   .aux_reset_in(1'b0),                  // input wire aux_reset_in
//   .mb_debug_sys_rst(1'b0),          // input wire mb_debug_sys_rst
//   .dcm_locked(1'b1),                      // input wire dcm_locked
//   .mb_reset(),                          // output wire mb_reset
//   .bus_struct_reset(),          // output wire [0 : 0] bus_struct_reset
//   .peripheral_reset(),          // output wire [0 : 0] peripheral_reset
//   .interconnect_aresetn(),  // output wire [0 : 0] interconnect_aresetn
//   .peripheral_aresetn(gt0_txfsmresetdone_w)      // output wire [0 : 0] peripheral_aresetn
// );
wire clk_100Mhz;
sys_clock sys_clock_m0
(
   .clk_in1(sys_clk),
   .clk_out1(clk_100Mhz),  
   .reset(1'b0), 
   .locked()  

);     
 
packet_send packet_send_m0(
    .rst(~gt0_txfsmresetdone),
    .tx_clk(tx0_clk),
    .tx_packet_req(1'b1),
    .tx_packet_len(256),
    .tx_packet_done(),
    .tx_packet_type(8),
    .tx_packet_data({cnt,cnt,cnt,cnt}),
    .tx_packet_data_rd(tx_packet_data_rd),
    
    .gt_tx_data(data_tx),
    .gt_tx_ctrl(data_ctrl)
);
(* MARK_DEBUG="true" *)wire[31:0] rx_data_align;
(* MARK_DEBUG="true" *)wire[3:0] rx_ctrl_align;
(* MARK_DEBUG="true" *)wire[31:0] error_packet_cnt_o;
(* MARK_DEBUG="true" *)wire[31:0] packet_cnt_o;
packet_rec packet_rec_m0(
    .rst(~gt0_rxfsmresetdone),
    .rx_clk(rx_clk), 
    .gt_rx_data(rx_data_align),
    .gt_rx_ctrl(rx_ctrl_align),
    .packet_cnt_o(packet_cnt_o),
    .error_packet_cnt_o(error_packet_cnt_o)
);
word_align word_align_m0(
    .rst(~gt0_rxfsmresetdone),
    .rx_clk(rx_clk),
    .gt_rx_data(rx0_data),
    .gt_rx_ctrl(rx0_kchar),
    .rx_data_align(rx_data_align),
    .rx_ctrl_align(rx_ctrl_align)
);
wire[143:0] probe0;
ila_0 u0(
    .clk(rx_clk),
    .probe0(probe0)
);   
assign probe0[31:0] = rx_data_align;
assign probe0[35:32] = rx_ctrl_align;
assign probe0[67:36] = packet_cnt_o;
assign probe0[71:68] = rx0_kchar;
assign probe0[103:72] = error_packet_cnt_o;
assign probe0[111:104] = cnt;
assign probe0[143:112] = rx0_data;


gth_example_top gtx_exdes_m0
    (
	
    .tx0_clk(tx0_clk),
    .gt0_txfsmresetdone(gt0_txfsmresetdone),
    .gt0_rxfsmresetdone(gt0_rxfsmresetdone),
    .tx0_data(tx0_data),
    .tx0_kchar(tx0_kchar),   
    .rx0_clk(rx0_clk),
    .rx0_data(rx0_data),
    .rx0_kchar(rx0_kchar),

    .gt1_txfsmresetdone(),
    .gt1_rxfsmresetdone(),
    .tx1_data(tx1_data),
    .tx1_kchar(tx1_kchar),   
    .rx1_clk(rx1_clk),
    .rx1_data(rx1_data),
    .rx1_kchar(rx1_kchar),
    
    .gt2_txfsmresetdone(),
    .gt2_rxfsmresetdone(),
    .tx2_data(tx2_data),
    .tx2_kchar(tx2_kchar),   
    .rx2_clk(rx2_clk),
    .rx2_data(rx2_data),
    .rx2_kchar(rx2_kchar),
    
    .gt3_txfsmresetdone(),
    .gt3_rxfsmresetdone(),
    .tx3_data(tx3_data),
    .tx3_kchar(tx3_kchar),   
    .rx3_clk(rx3_clk),
    .rx3_data(rx3_data),
    .rx3_kchar(rx3_kchar),
                         
    .mgtrefclk_n(mgtrefclk_n),
    .mgtrefclk_p(mgtrefclk_p),
	.hb_gtwiz_reset_clk_freerun_in(clk_100Mhz),
	.hb_gtwiz_reset_all_in(1'b0),
    .RXN_IN(RXN_IN),
    .RXP_IN(RXP_IN),
    .TXN_OUT(TXN_OUT),
    .TXP_OUT(TXP_OUT)
);
    
    
    
endmodule
