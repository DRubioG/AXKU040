vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm

vlog -work xil_defaultlib -64 -incr -sv "+incdir+../../../../ibert_sfp_10g_ex.srcs/sources_1/ip/ibert_sfp_10g/hdl/verilog" "+incdir+../../../../ibert_sfp_10g_ex.srcs/sources_1/ip/ibert_sfp_10g/synth" "+incdir+../../../../ibert_sfp_10g_ex.srcs/sources_1/ip/ibert_sfp_10g/hdl/verilog" "+incdir+../../../../ibert_sfp_10g_ex.srcs/sources_1/ip/ibert_sfp_10g/synth" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../ibert_sfp_10g_ex.srcs/sources_1/ip/ibert_sfp_10g/hdl/verilog" "+incdir+../../../../ibert_sfp_10g_ex.srcs/sources_1/ip/ibert_sfp_10g/synth" "+incdir+../../../../ibert_sfp_10g_ex.srcs/sources_1/ip/ibert_sfp_10g/hdl/verilog" "+incdir+../../../../ibert_sfp_10g_ex.srcs/sources_1/ip/ibert_sfp_10g/synth" \
"../../../../ibert_sfp_10g_ex.srcs/sources_1/ip/ibert_sfp_10g/ibert_sfp_10g_sim_netlist.v" \

vlog -work xil_defaultlib \
"glbl.v"

