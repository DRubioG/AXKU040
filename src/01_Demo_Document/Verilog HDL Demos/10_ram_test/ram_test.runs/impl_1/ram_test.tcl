# 
# Report generation script generated by Vivado
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
proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}


start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  create_project -in_memory -part xcku040-ffva1156-2-i
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir D:/ax/ax7035/demo/08_ram_test/ram_test.cache/wt [current_project]
  set_property parent.project_path D:/ax/ax7035/demo/08_ram_test/ram_test.xpr [current_project]
  set_property ip_output_repo D:/ax/ax7035/demo/08_ram_test/ram_test.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  add_files -quiet D:/ax/ax7035/demo/08_ram_test/ram_test.runs/synth_1/ram_test.dcp
  read_ip -quiet D:/ax/ax7035/demo/08_ram_test/ram_test.srcs/sources_1/ip/ram_ip/ram_ip.xci
  read_ip -quiet D:/ax/ax7035/demo/08_ram_test/ram_test.srcs/sources_1/ip/ila_0/ila_0.xci
  read_xdc D:/ax/ax7035/demo/08_ram_test/ram_test.srcs/constrs_1/new/ram.xdc
  link_design -top ram_test -part xcku040-ffva1156-2-i
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force ram_test_opt.dcp
  create_report "impl_1_opt_report_drc_0" "report_drc -file ram_test_drc_opted.rpt -pb ram_test_drc_opted.pb -rpx ram_test_drc_opted.rpx"
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force ram_test_placed.dcp
  create_report "impl_1_place_report_io_0" "report_io -file ram_test_io_placed.rpt"
  create_report "impl_1_place_report_utilization_0" "report_utilization -file ram_test_utilization_placed.rpt -pb ram_test_utilization_placed.pb"
  create_report "impl_1_place_report_control_sets_0" "report_control_sets -verbose -file ram_test_control_sets_placed.rpt"
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force ram_test_routed.dcp
  create_report "impl_1_route_report_drc_0" "report_drc -file ram_test_drc_routed.rpt -pb ram_test_drc_routed.pb -rpx ram_test_drc_routed.rpx"
  create_report "impl_1_route_report_methodology_0" "report_methodology -file ram_test_methodology_drc_routed.rpt -pb ram_test_methodology_drc_routed.pb -rpx ram_test_methodology_drc_routed.rpx"
  create_report "impl_1_route_report_power_0" "report_power -file ram_test_power_routed.rpt -pb ram_test_power_summary_routed.pb -rpx ram_test_power_routed.rpx"
  create_report "impl_1_route_report_route_status_0" "report_route_status -file ram_test_route_status.rpt -pb ram_test_route_status.pb"
  create_report "impl_1_route_report_timing_summary_0" "report_timing_summary -max_paths 10 -file ram_test_timing_summary_routed.rpt -rpx ram_test_timing_summary_routed.rpx -warn_on_violation "
  create_report "impl_1_route_report_incremental_reuse_0" "report_incremental_reuse -file ram_test_incremental_reuse_routed.rpt"
  create_report "impl_1_route_report_clock_utilization_0" "report_clock_utilization -file ram_test_clock_utilization_routed.rpt"
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force ram_test_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  catch { write_mem_info -force ram_test.mmi }
  write_bitstream -force ram_test.bit 
  catch {write_debug_probes -quiet -force ram_test}
  catch {file copy -force ram_test.ltx debug_nets.ltx}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}

