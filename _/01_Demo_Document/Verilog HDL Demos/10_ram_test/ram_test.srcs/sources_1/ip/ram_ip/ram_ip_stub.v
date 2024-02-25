// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Sat Jul 17 13:57:44 2021
// Host        : DESKTOP-C3F5G4E running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/ax/ax7035/demo/08_ram_test/ram_test.srcs/sources_1/ip/ram_ip/ram_ip_stub.v
// Design      : ram_ip
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku040-ffva1156-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2017.4" *)
module ram_ip(clka, wea, addra, dina, clkb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[8:0],dina[15:0],clkb,addrb[8:0],doutb[15:0]" */;
  input clka;
  input [0:0]wea;
  input [8:0]addra;
  input [15:0]dina;
  input clkb;
  input [8:0]addrb;
  output [15:0]doutb;
endmodule
