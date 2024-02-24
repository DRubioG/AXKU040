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
create_project -in_memory -part xcku040-ffva1156-2-i

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir e:/ax/ku040/13_ddr_test/ddr4_0_ex/ddr4_0_ex.cache/wt [current_project]
set_property parent.project_path e:/ax/ku040/13_ddr_test/ddr4_0_ex/ddr4_0_ex.xpr [current_project]
set_property XPM_LIBRARIES XPM_MEMORY [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo e:/ax/ku040/13_ddr_test/ddr4_0_ex/ddr4_0_ex.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib -sv {
  e:/ax/ku040/13_ddr_test/ddr4_0_ex/imports/ddr4_v2_2_axi_opcode_gen.sv
  e:/ax/ku040/13_ddr_test/ddr4_0_ex/imports/ddr4_v2_2_axi_tg_top.sv
  e:/ax/ku040/13_ddr_test/ddr4_0_ex/imports/ddr4_v2_2_axi_wrapper.sv
  e:/ax/ku040/13_ddr_test/ddr4_0_ex/imports/ddr4_v2_2_boot_mode_gen.sv
  e:/ax/ku040/13_ddr_test/ddr4_0_ex/imports/ddr4_v2_2_custom_mode_gen.sv
  e:/ax/ku040/13_ddr_test/ddr4_0_ex/imports/ddr4_v2_2_data_chk.sv
  e:/ax/ku040/13_ddr_test/ddr4_0_ex/imports/ddr4_v2_2_data_gen.sv
  e:/ax/ku040/13_ddr_test/ddr4_0_ex/imports/ddr4_v2_2_prbs_mode_gen.sv
  e:/ax/ku040/13_ddr_test/ddr4_0_ex/imports/example_top.sv
}
read_ip -quiet e:/ax/ku040/13_ddr_test/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/ddr4_0.xci
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_0/bd_9054_microblaze_I_0.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_0/bd_9054_microblaze_I_0_ooc_debug.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_1/bd_9054_rst_0_0_board.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_1/bd_9054_rst_0_0.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_2/bd_9054_ilmb_0.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_3/bd_9054_dlmb_0.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_6/bd_9054_lmb_bram_I_0_ooc.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_9/bd_9054_second_lmb_bram_I_0_ooc.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_10/bd_9054_iomodule_0_0_board.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/bd_0/bd_9054_ooc.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/ip_0/ddr4_0_microblaze_mcs_board.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/ip_0/ddr4_0_microblaze_mcs_ooc.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/ip_1/par/ddr4_0_phy_ooc.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/ddr4_0_board.xdc]
set_property used_in_implementation false [get_files -all e:/ax/ku040/13_ddr_test/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/par/ddr4_0.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc e:/ax/ku040/13_ddr_test/ddr4_0_ex/imports/example_design.xdc
set_property used_in_implementation false [get_files e:/ax/ku040/13_ddr_test/ddr4_0_ex/imports/example_design.xdc]
set_property processing_order LATE [get_files e:/ax/ku040/13_ddr_test/ddr4_0_ex/imports/example_design.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top example_top -part xcku040-ffva1156-2-i


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef example_top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file example_top_utilization_synth.rpt -pb example_top_utilization_synth.pb"
