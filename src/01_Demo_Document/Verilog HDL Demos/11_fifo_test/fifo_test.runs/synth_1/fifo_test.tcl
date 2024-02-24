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
set_param tcl.collectionResultDisplayLimit 0
set_param xicom.use_bs_reader 1
set_param synth.incrementalSynthesisCache C:/Users/Mdong/AppData/Roaming/Xilinx/Vivado/.Xil/Vivado-7004-DESKTOP-C3F5G4E/incrSyn
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xcku040-ffva1156-2-i

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/ax/ax7035/demo/09_fifo_test/fifo_test.cache/wt [current_project]
set_property parent.project_path D:/ax/ax7035/demo/09_fifo_test/fifo_test.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo d:/ax/ax7035/demo/09_fifo_test/fifo_test.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib D:/ax/ax7035/demo/09_fifo_test/fifo_test.srcs/sources_1/new/fifo_test.v
read_ip -quiet D:/ax/ax7035/demo/09_fifo_test/fifo_test.srcs/sources_1/ip/fifo_ip/fifo_ip.xci
set_property used_in_implementation false [get_files -all d:/ax/ax7035/demo/09_fifo_test/fifo_test.srcs/sources_1/ip/fifo_ip/fifo_ip.xdc]
set_property used_in_implementation false [get_files -all d:/ax/ax7035/demo/09_fifo_test/fifo_test.srcs/sources_1/ip/fifo_ip/fifo_ip_clocks.xdc]
set_property used_in_implementation false [get_files -all d:/ax/ax7035/demo/09_fifo_test/fifo_test.srcs/sources_1/ip/fifo_ip/fifo_ip_ooc.xdc]

read_ip -quiet D:/ax/ax7035/demo/09_fifo_test/fifo_test.srcs/sources_1/ip/ila_m0/ila_m0.xci
set_property used_in_synthesis false [get_files -all d:/ax/ax7035/demo/09_fifo_test/fifo_test.srcs/sources_1/ip/ila_m0/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all d:/ax/ax7035/demo/09_fifo_test/fifo_test.srcs/sources_1/ip/ila_m0/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all d:/ax/ax7035/demo/09_fifo_test/fifo_test.srcs/sources_1/ip/ila_m0/ila_v6_2/constraints/ila.xdc]
set_property used_in_implementation false [get_files -all d:/ax/ax7035/demo/09_fifo_test/fifo_test.srcs/sources_1/ip/ila_m0/ila_m0_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/ax/ax7035/demo/09_fifo_test/fifo_test.srcs/constrs_1/new/fifo_test.xdc
set_property used_in_implementation false [get_files D:/ax/ax7035/demo/09_fifo_test/fifo_test.srcs/constrs_1/new/fifo_test.xdc]


synth_design -top fifo_test -part xcku040-ffva1156-2-i


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef fifo_test.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file fifo_test_utilization_synth.rpt -pb fifo_test_utilization_synth.pb"
