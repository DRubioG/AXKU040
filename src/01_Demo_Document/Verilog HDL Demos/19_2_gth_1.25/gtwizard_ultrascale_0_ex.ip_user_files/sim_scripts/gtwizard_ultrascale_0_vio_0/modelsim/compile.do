vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm

vlog -work xil_defaultlib -64 -incr -sv "+incdir+../../../../gtwizard_ultrascale_0_ex.srcs/sources_1/ip/gtwizard_ultrascale_0_vio_0/hdl/verilog" "+incdir+../../../../gtwizard_ultrascale_0_ex.srcs/sources_1/ip/gtwizard_ultrascale_0_vio_0/hdl" "+incdir+../../../../gtwizard_ultrascale_0_ex.srcs/sources_1/ip/gtwizard_ultrascale_0_vio_0/hdl/verilog" "+incdir+../../../../gtwizard_ultrascale_0_ex.srcs/sources_1/ip/gtwizard_ultrascale_0_vio_0/hdl" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../gtwizard_ultrascale_0_ex.srcs/sources_1/ip/gtwizard_ultrascale_0_vio_0/hdl/verilog" "+incdir+../../../../gtwizard_ultrascale_0_ex.srcs/sources_1/ip/gtwizard_ultrascale_0_vio_0/hdl" "+incdir+../../../../gtwizard_ultrascale_0_ex.srcs/sources_1/ip/gtwizard_ultrascale_0_vio_0/hdl/verilog" "+incdir+../../../../gtwizard_ultrascale_0_ex.srcs/sources_1/ip/gtwizard_ultrascale_0_vio_0/hdl" \
"../../../../gtwizard_ultrascale_0_ex.srcs/sources_1/ip/gtwizard_ultrascale_0_vio_0/sim/gtwizard_ultrascale_0_vio_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

