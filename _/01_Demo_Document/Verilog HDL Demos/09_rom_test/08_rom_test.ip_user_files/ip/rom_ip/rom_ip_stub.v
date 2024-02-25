// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Sat Jul 17 13:50:37 2021
// Host        : DESKTOP-C3F5G4E running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/ax/ax7035/demo/07_rom_test/rom_test.srcs/sources_1/ip/rom_ip/rom_ip_stub.v
// Design      : rom_ip
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku040-ffva1156-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2017.4" *)
module rom_ip(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[4:0],douta[7:0]" */;
  input clka;
  input [4:0]addra;
  output [7:0]douta;
endmodule
