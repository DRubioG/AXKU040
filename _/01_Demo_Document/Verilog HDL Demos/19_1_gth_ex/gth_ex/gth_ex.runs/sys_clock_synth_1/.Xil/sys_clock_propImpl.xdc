set_property SRC_FILE_INFO {cfile:e:/XilinxPrj/AXUK40/gt_test_5g/gth_ex/gth_ex.srcs/sources_1/ip/sys_clock/sys_clock.xdc rfile:../../../gth_ex.srcs/sources_1/ip/sys_clock/sys_clock.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.05
