set_property SRC_FILE_INFO {cfile:e:/ax/AX7325_CD_20201209/demo/07_sd_test/sd_card_test/sd_card_test.srcs/sources_1/ip/clk_ref/clk_ref.xdc rfile:../../../sd_card_test.srcs/sources_1/ip/clk_ref/clk_ref.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1_p]] 0.05
