vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../ibert_sfp_12_5g_ex.srcs/sources_1/ip/ibert_sfp_12_5g/hdl/verilog" "+incdir+../../../../ibert_sfp_12_5g_ex.srcs/sources_1/ip/ibert_sfp_12_5g/synth" "+incdir+../../../../ibert_sfp_12_5g_ex.srcs/sources_1/ip/ibert_sfp_12_5g/hdl/verilog" "+incdir+../../../../ibert_sfp_12_5g_ex.srcs/sources_1/ip/ibert_sfp_12_5g/synth" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ibert_sfp_12_5g_ex.srcs/sources_1/ip/ibert_sfp_12_5g/hdl/verilog" "+incdir+../../../../ibert_sfp_12_5g_ex.srcs/sources_1/ip/ibert_sfp_12_5g/synth" "+incdir+../../../../ibert_sfp_12_5g_ex.srcs/sources_1/ip/ibert_sfp_12_5g/hdl/verilog" "+incdir+../../../../ibert_sfp_12_5g_ex.srcs/sources_1/ip/ibert_sfp_12_5g/synth" \
"../../../../ibert_sfp_12_5g_ex.srcs/sources_1/ip/ibert_sfp_12_5g/ibert_sfp_12_5g_sim_netlist.v" \

vlog -work xil_defaultlib \
"glbl.v"

