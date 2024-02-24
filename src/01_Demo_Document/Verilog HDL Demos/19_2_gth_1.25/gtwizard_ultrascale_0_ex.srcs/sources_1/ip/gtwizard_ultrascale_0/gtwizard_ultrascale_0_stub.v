// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed Jul 13 13:45:44 2022
// Host        : DESKTOP-C3F5G4E running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               E:/ax/ku040/gth_1.25/gth_1.25.srcs/sources_1/ip/gtwizard_ultrascale_0/gtwizard_ultrascale_0_stub.v
// Design      : gtwizard_ultrascale_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku040-ffva1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "gtwizard_ultrascale_0_gtwizard_top,Vivado 2017.4" *)
module gtwizard_ultrascale_0(gtwiz_userclk_tx_active_in, 
  gtwiz_userclk_rx_active_in, gtwiz_reset_clk_freerun_in, gtwiz_reset_all_in, 
  gtwiz_reset_tx_pll_and_datapath_in, gtwiz_reset_tx_datapath_in, 
  gtwiz_reset_rx_pll_and_datapath_in, gtwiz_reset_rx_datapath_in, 
  gtwiz_reset_rx_cdr_stable_out, gtwiz_reset_tx_done_out, gtwiz_reset_rx_done_out, 
  gtwiz_userdata_tx_in, gtwiz_userdata_rx_out, gtrefclk00_in, qpll0outclk_out, 
  qpll0outrefclk_out, gthrxn_in, gthrxp_in, rx8b10ben_in, rxbufreset_in, rxchbonden_in, 
  rxchbondi_in, rxchbondlevel_in, rxchbondmaster_in, rxchbondslave_in, rxcommadeten_in, 
  rxmcommaalignen_in, rxpcommaalignen_in, rxusrclk_in, rxusrclk2_in, tx8b10ben_in, 
  txctrl0_in, txctrl1_in, txctrl2_in, txusrclk_in, txusrclk2_in, gthtxn_out, gthtxp_out, 
  gtpowergood_out, rxbufstatus_out, rxbyteisaligned_out, rxbyterealign_out, 
  rxchanbondseq_out, rxchanisaligned_out, rxchanrealign_out, rxchbondo_out, 
  rxclkcorcnt_out, rxcommadet_out, rxctrl0_out, rxctrl1_out, rxctrl2_out, rxctrl3_out, 
  rxoutclk_out, rxpmaresetdone_out, txoutclk_out, txpmaresetdone_out)
/* synthesis syn_black_box black_box_pad_pin="gtwiz_userclk_tx_active_in[0:0],gtwiz_userclk_rx_active_in[0:0],gtwiz_reset_clk_freerun_in[0:0],gtwiz_reset_all_in[0:0],gtwiz_reset_tx_pll_and_datapath_in[0:0],gtwiz_reset_tx_datapath_in[0:0],gtwiz_reset_rx_pll_and_datapath_in[0:0],gtwiz_reset_rx_datapath_in[0:0],gtwiz_reset_rx_cdr_stable_out[0:0],gtwiz_reset_tx_done_out[0:0],gtwiz_reset_rx_done_out[0:0],gtwiz_userdata_tx_in[127:0],gtwiz_userdata_rx_out[127:0],gtrefclk00_in[0:0],qpll0outclk_out[0:0],qpll0outrefclk_out[0:0],gthrxn_in[3:0],gthrxp_in[3:0],rx8b10ben_in[3:0],rxbufreset_in[3:0],rxchbonden_in[3:0],rxchbondi_in[19:0],rxchbondlevel_in[11:0],rxchbondmaster_in[3:0],rxchbondslave_in[3:0],rxcommadeten_in[3:0],rxmcommaalignen_in[3:0],rxpcommaalignen_in[3:0],rxusrclk_in[3:0],rxusrclk2_in[3:0],tx8b10ben_in[3:0],txctrl0_in[63:0],txctrl1_in[63:0],txctrl2_in[31:0],txusrclk_in[3:0],txusrclk2_in[3:0],gthtxn_out[3:0],gthtxp_out[3:0],gtpowergood_out[3:0],rxbufstatus_out[11:0],rxbyteisaligned_out[3:0],rxbyterealign_out[3:0],rxchanbondseq_out[3:0],rxchanisaligned_out[3:0],rxchanrealign_out[3:0],rxchbondo_out[19:0],rxclkcorcnt_out[7:0],rxcommadet_out[3:0],rxctrl0_out[63:0],rxctrl1_out[63:0],rxctrl2_out[31:0],rxctrl3_out[31:0],rxoutclk_out[3:0],rxpmaresetdone_out[3:0],txoutclk_out[3:0],txpmaresetdone_out[3:0]" */;
  input [0:0]gtwiz_userclk_tx_active_in;
  input [0:0]gtwiz_userclk_rx_active_in;
  input [0:0]gtwiz_reset_clk_freerun_in;
  input [0:0]gtwiz_reset_all_in;
  input [0:0]gtwiz_reset_tx_pll_and_datapath_in;
  input [0:0]gtwiz_reset_tx_datapath_in;
  input [0:0]gtwiz_reset_rx_pll_and_datapath_in;
  input [0:0]gtwiz_reset_rx_datapath_in;
  output [0:0]gtwiz_reset_rx_cdr_stable_out;
  output [0:0]gtwiz_reset_tx_done_out;
  output [0:0]gtwiz_reset_rx_done_out;
  input [127:0]gtwiz_userdata_tx_in;
  output [127:0]gtwiz_userdata_rx_out;
  input [0:0]gtrefclk00_in;
  output [0:0]qpll0outclk_out;
  output [0:0]qpll0outrefclk_out;
  input [3:0]gthrxn_in;
  input [3:0]gthrxp_in;
  input [3:0]rx8b10ben_in;
  input [3:0]rxbufreset_in;
  input [3:0]rxchbonden_in;
  input [19:0]rxchbondi_in;
  input [11:0]rxchbondlevel_in;
  input [3:0]rxchbondmaster_in;
  input [3:0]rxchbondslave_in;
  input [3:0]rxcommadeten_in;
  input [3:0]rxmcommaalignen_in;
  input [3:0]rxpcommaalignen_in;
  input [3:0]rxusrclk_in;
  input [3:0]rxusrclk2_in;
  input [3:0]tx8b10ben_in;
  input [63:0]txctrl0_in;
  input [63:0]txctrl1_in;
  input [31:0]txctrl2_in;
  input [3:0]txusrclk_in;
  input [3:0]txusrclk2_in;
  output [3:0]gthtxn_out;
  output [3:0]gthtxp_out;
  output [3:0]gtpowergood_out;
  output [11:0]rxbufstatus_out;
  output [3:0]rxbyteisaligned_out;
  output [3:0]rxbyterealign_out;
  output [3:0]rxchanbondseq_out;
  output [3:0]rxchanisaligned_out;
  output [3:0]rxchanrealign_out;
  output [19:0]rxchbondo_out;
  output [7:0]rxclkcorcnt_out;
  output [3:0]rxcommadet_out;
  output [63:0]rxctrl0_out;
  output [63:0]rxctrl1_out;
  output [31:0]rxctrl2_out;
  output [31:0]rxctrl3_out;
  output [3:0]rxoutclk_out;
  output [3:0]rxpmaresetdone_out;
  output [3:0]txoutclk_out;
  output [3:0]txpmaresetdone_out;
endmodule
