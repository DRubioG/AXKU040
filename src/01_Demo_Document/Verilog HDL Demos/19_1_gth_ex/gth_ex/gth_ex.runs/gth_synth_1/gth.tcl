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
set_param project.vivado.isBlockSynthRun true
set_msg_config -msgmgr_mode ooc_run
create_project -in_memory -part xcku040-ffva1156-2-i

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir E:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.cache/wt [current_project]
set_property parent.project_path E:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo e:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_ip -quiet E:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.srcs/sources_1/ip/gth/gth.xci
set_property used_in_implementation false [get_files -all e:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.srcs/sources_1/ip/gth/synth/gth_ooc.xdc]
set_property used_in_implementation false [get_files -all e:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.srcs/sources_1/ip/gth/synth/gth.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

set cached_ip [config_ip_cache -export -no_bom -use_project_ipc -dir E:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.runs/gth_synth_1 -new_name gth -ip [get_ips gth]]

if { $cached_ip eq {} } {

synth_design -top gth -part xcku040-ffva1156-2-i -mode out_of_context

#---------------------------------------------------------
# Generate Checkpoint/Stub/Simulation Files For IP Cache
#---------------------------------------------------------
# disable binary constraint mode for IPCache checkpoints
set_param constraints.enableBinaryConstraints false

catch {
 write_checkpoint -force -noxdef -rename_prefix gth_ gth.dcp

 set ipCachedFiles {}
 write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ gth_stub.v
 lappend ipCachedFiles gth_stub.v

 write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ gth_stub.vhdl
 lappend ipCachedFiles gth_stub.vhdl

 write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ gth_sim_netlist.v
 lappend ipCachedFiles gth_sim_netlist.v

 write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ gth_sim_netlist.vhdl
 lappend ipCachedFiles gth_sim_netlist.vhdl

 config_ip_cache -add -dcp gth.dcp -move_files $ipCachedFiles -use_project_ipc -ip [get_ips gth]
}

rename_ref -prefix_all gth_

# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef gth.dcp
create_report "gth_synth_1_synth_report_utilization_0" "report_utilization -file gth_utilization_synth.rpt -pb gth_utilization_synth.pb"

if { [catch {
  file copy -force E:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.runs/gth_synth_1/gth.dcp E:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.srcs/sources_1/ip/gth/gth.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub E:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.srcs/sources_1/ip/gth/gth_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub E:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.srcs/sources_1/ip/gth/gth_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim E:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.srcs/sources_1/ip/gth/gth_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim E:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.srcs/sources_1/ip/gth/gth_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}


} else {


if { [catch {
  file copy -force E:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.runs/gth_synth_1/gth.dcp E:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.srcs/sources_1/ip/gth/gth.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  file rename -force E:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.runs/gth_synth_1/gth_stub.v E:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.srcs/sources_1/ip/gth/gth_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force E:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.runs/gth_synth_1/gth_stub.vhdl E:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.srcs/sources_1/ip/gth/gth_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force E:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.runs/gth_synth_1/gth_sim_netlist.v E:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.srcs/sources_1/ip/gth/gth_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  file rename -force E:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.runs/gth_synth_1/gth_sim_netlist.vhdl E:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.srcs/sources_1/ip/gth/gth_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

}; # end if cached_ip 

if {[file isdir E:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.ip_user_files/ip/gth]} {
  catch { 
    file copy -force E:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.srcs/sources_1/ip/gth/gth_stub.v E:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.ip_user_files/ip/gth
  }
}

if {[file isdir E:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.ip_user_files/ip/gth]} {
  catch { 
    file copy -force E:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.srcs/sources_1/ip/gth/gth_stub.vhdl E:/XilinxPrj/AXUK40/gt_test_12p5g/gth_ex/gth_ex.ip_user_files/ip/gth
  }
}
