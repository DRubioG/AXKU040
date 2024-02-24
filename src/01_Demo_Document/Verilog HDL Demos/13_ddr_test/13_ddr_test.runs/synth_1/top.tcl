# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
set_param synth.incrementalSynthesisCache C:/Users/Mdong/AppData/Roaming/Xilinx/Vivado/.Xil/Vivado-31000-DESKTOP-C3F5G4E/incrSyn
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
set_msg_config  -ruleid {3}  -id {[BD 41-1306]}  -suppress 
set_msg_config  -ruleid {4}  -id {[BD 41-1271]}  -suppress 
create_project -in_memory -part xcku040-ffva1156-2-i

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir E:/ax/ku040/13_ddr_test/13_ddr_test.cache/wt [current_project]
set_property parent.project_path E:/ax/ku040/13_ddr_test/13_ddr_test.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo e:/ax/ku040/13_ddr_test/13_ddr_test.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  E:/ax/ku040/13_ddr_test/13_ddr_test.srcs/ddr4/aq_axi_master.v
  E:/ax/ku040/13_ddr_test/13_ddr_test.srcs/ddr4/ddr4_top.v
  E:/ax/ku040/13_ddr_test/13_ddr_test.srcs/ddr4/mem_test.v
  E:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/new/top.v
}
read_ip -quiet E:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/ip/ddr4_0/ddr4_0.xci
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_0/bd_9054_microblaze_I_0.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_0/bd_9054_microblaze_I_0_ooc_debug.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_1/bd_9054_rst_0_0_board.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_1/bd_9054_rst_0_0.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_2/bd_9054_ilmb_0.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_3/bd_9054_dlmb_0.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_6/bd_9054_lmb_bram_I_0_ooc.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_9/bd_9054_second_lmb_bram_I_0_ooc.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_10/bd_9054_iomodule_0_0_board.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/ip/ddr4_0/bd_0/bd_9054_ooc.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/ip/ddr4_0/ip_0/ddr4_0_microblaze_mcs_board.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/ip/ddr4_0/ip_0/ddr4_0_microblaze_mcs_ooc.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/ip/ddr4_0/ip_1/par/ddr4_0_phy_ooc.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/ip/ddr4_0/ddr4_0_board.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/ip/ddr4_0/par/ddr4_0.xdc]

read_ip -quiet e:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/ip/ila_0/ila_0.xci
set_property used_in_synthesis false [get_files -all e:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/ip/ila_0/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/ip/ila_0/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/ip/ila_0/ila_v6_2/constraints/ila.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/ip/ila_0/ila_0_ooc.xdc]

read_ip -quiet e:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/ip/ila_1/ila_1.xci
set_property used_in_synthesis false [get_files -all e:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/ip/ila_1/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/ip/ila_1/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/ip/ila_1/ila_v6_2/constraints/ila.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/13_ddr_test.srcs/sources_1/ip/ila_1/ila_1_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc E:/ax/ku040/13_ddr_test/13_ddr_test.srcs/ddr4/ddr.xdc
set_property used_in_implementation false [get_files E:/ax/ku040/13_ddr_test/13_ddr_test.srcs/ddr4/ddr.xdc]


synth_design -top top -part xcku040-ffva1156-2-i


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb"
