set_property SRC_FILE_INFO {cfile:e:/ax/ku040/17_hdmi_char/17_hdmi_char.srcs/sources_1/ip/video_pll/video_pll.xdc rfile:../../../17_hdmi_char.srcs/sources_1/ip/video_pll/video_pll.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1_p]] 0.05
