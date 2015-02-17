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

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param gui.test TreeTableDev
  debug::add_scope template.lib 1
  create_project -in_memory -part xc7z045ffg900-2
  set_property board_part xilinx.com:zc706:part0:1.1 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir /root/base_zc706/base_zc706.cache/wt [current_project]
  set_property parent.project_path /root/base_zc706/base_zc706.xpr [current_project]
  set_property ip_repo_paths {
  /root/base_zc706/base_zc706.cache/ip
  /root/base_zc706/ip
} [current_project]
  set_property ip_output_repo /root/base_zc706/base_zc706.cache/ip [current_project]
  add_files -quiet /root/base_zc706/base_zc706.runs/synth_1/Z_system_wrapper.dcp
  read_xdc -ref Z_system_processing_system7_0_0 -cells inst /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_processing_system7_0_0/Z_system_processing_system7_0_0.xdc
  set_property processing_order EARLY [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_processing_system7_0_0/Z_system_processing_system7_0_0.xdc]
  read_xdc -prop_thru_buffers -ref bd_0_eth_buf_0 -cells U0 /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_0_0/bd_0/ip/ip_0/bd_0_eth_buf_0_board.xdc
  set_property processing_order EARLY [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_0_0/bd_0/ip/ip_0/bd_0_eth_buf_0_board.xdc]
  read_xdc -prop_thru_buffers -ref bd_0_eth_mac_0 -cells inst /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_0_0/bd_0/ip/ip_1/synth/bd_0_eth_mac_0_board.xdc
  set_property processing_order EARLY [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_0_0/bd_0/ip/ip_1/synth/bd_0_eth_mac_0_board.xdc]
  read_xdc -ref bd_0_eth_mac_0 -cells inst /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_0_0/bd_0/ip/ip_1/synth/bd_0_eth_mac_0.xdc
  set_property processing_order EARLY [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_0_0/bd_0/ip/ip_1/synth/bd_0_eth_mac_0.xdc]
  read_xdc -ref Z_system_axi_ethernet_0_dma_0 -cells U0 /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_0_dma_0/Z_system_axi_ethernet_0_dma_0.xdc
  set_property processing_order EARLY [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_0_dma_0/Z_system_axi_ethernet_0_dma_0.xdc]
  read_xdc -prop_thru_buffers -ref Z_system_rst_processing_system7_0_100M_0 /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_rst_processing_system7_0_100M_0/Z_system_rst_processing_system7_0_100M_0_board.xdc
  set_property processing_order EARLY [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_rst_processing_system7_0_100M_0/Z_system_rst_processing_system7_0_100M_0_board.xdc]
  read_xdc -ref Z_system_rst_processing_system7_0_100M_0 /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_rst_processing_system7_0_100M_0/Z_system_rst_processing_system7_0_100M_0.xdc
  set_property processing_order EARLY [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_rst_processing_system7_0_100M_0/Z_system_rst_processing_system7_0_100M_0.xdc]
  read_xdc -prop_thru_buffers -ref bd_1_eth_buf_0 -cells U0 /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_1_0/bd_1/ip/ip_0/bd_1_eth_buf_0_board.xdc
  set_property processing_order EARLY [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_1_0/bd_1/ip/ip_0/bd_1_eth_buf_0_board.xdc]
  read_xdc -prop_thru_buffers -ref bd_1_eth_mac_0 -cells inst /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_1_0/bd_1/ip/ip_1/synth/bd_1_eth_mac_0_board.xdc
  set_property processing_order EARLY [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_1_0/bd_1/ip/ip_1/synth/bd_1_eth_mac_0_board.xdc]
  read_xdc -ref bd_1_eth_mac_0 -cells inst /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_1_0/bd_1/ip/ip_1/synth/bd_1_eth_mac_0.xdc
  set_property processing_order EARLY [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_1_0/bd_1/ip/ip_1/synth/bd_1_eth_mac_0.xdc]
  read_xdc -ref Z_system_axi_ethernet_1_dma_0 -cells U0 /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_1_dma_0/Z_system_axi_ethernet_1_dma_0.xdc
  set_property processing_order EARLY [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_1_dma_0/Z_system_axi_ethernet_1_dma_0.xdc]
  read_xdc -prop_thru_buffers -ref bd_2_eth_buf_0 -cells U0 /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_2_0/bd_2/ip/ip_0/bd_2_eth_buf_0_board.xdc
  set_property processing_order EARLY [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_2_0/bd_2/ip/ip_0/bd_2_eth_buf_0_board.xdc]
  read_xdc -prop_thru_buffers -ref bd_2_eth_mac_0 -cells inst /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_2_0/bd_2/ip/ip_1/synth/bd_2_eth_mac_0_board.xdc
  set_property processing_order EARLY [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_2_0/bd_2/ip/ip_1/synth/bd_2_eth_mac_0_board.xdc]
  read_xdc -ref bd_2_eth_mac_0 -cells inst /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_2_0/bd_2/ip/ip_1/synth/bd_2_eth_mac_0.xdc
  set_property processing_order EARLY [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_2_0/bd_2/ip/ip_1/synth/bd_2_eth_mac_0.xdc]
  read_xdc -ref Z_system_axi_ethernet_2_dma_0 -cells U0 /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_2_dma_0/Z_system_axi_ethernet_2_dma_0.xdc
  set_property processing_order EARLY [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_2_dma_0/Z_system_axi_ethernet_2_dma_0.xdc]
  read_xdc -prop_thru_buffers -ref bd_3_eth_buf_0 -cells U0 /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_3_0/bd_3/ip/ip_0/bd_3_eth_buf_0_board.xdc
  set_property processing_order EARLY [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_3_0/bd_3/ip/ip_0/bd_3_eth_buf_0_board.xdc]
  read_xdc -prop_thru_buffers -ref bd_3_eth_mac_0 -cells inst /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_3_0/bd_3/ip/ip_1/synth/bd_3_eth_mac_0_board.xdc
  set_property processing_order EARLY [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_3_0/bd_3/ip/ip_1/synth/bd_3_eth_mac_0_board.xdc]
  read_xdc -ref bd_3_eth_mac_0 -cells inst /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_3_0/bd_3/ip/ip_1/synth/bd_3_eth_mac_0.xdc
  set_property processing_order EARLY [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_3_0/bd_3/ip/ip_1/synth/bd_3_eth_mac_0.xdc]
  read_xdc -ref Z_system_axi_ethernet_3_dma_0 -cells U0 /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_3_dma_0/Z_system_axi_ethernet_3_dma_0.xdc
  set_property processing_order EARLY [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_3_dma_0/Z_system_axi_ethernet_3_dma_0.xdc]
  read_xdc /root/base_zc706/base_zc706.srcs/constrs_1/new/zc706_board.xdc
  read_xdc -ref bd_0_eth_buf_0 -cells U0 /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_0_0/bd_0/ip/ip_0/synth/bd_0_eth_buf_0.xdc
  set_property processing_order LATE [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_0_0/bd_0/ip/ip_0/synth/bd_0_eth_buf_0.xdc]
  read_xdc -ref bd_0_eth_mac_0 -cells inst /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_0_0/bd_0/ip/ip_1/synth/bd_0_eth_mac_0_clocks.xdc
  set_property processing_order LATE [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_0_0/bd_0/ip/ip_1/synth/bd_0_eth_mac_0_clocks.xdc]
  read_xdc -ref Z_system_axi_ethernet_0_dma_0 -cells U0 /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_0_dma_0/Z_system_axi_ethernet_0_dma_0_clocks.xdc
  set_property processing_order LATE [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_0_dma_0/Z_system_axi_ethernet_0_dma_0_clocks.xdc]
  read_xdc -ref bd_1_eth_buf_0 -cells U0 /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_1_0/bd_1/ip/ip_0/synth/bd_1_eth_buf_0.xdc
  set_property processing_order LATE [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_1_0/bd_1/ip/ip_0/synth/bd_1_eth_buf_0.xdc]
  read_xdc -ref bd_1_eth_mac_0 -cells inst /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_1_0/bd_1/ip/ip_1/synth/bd_1_eth_mac_0_clocks.xdc
  set_property processing_order LATE [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_1_0/bd_1/ip/ip_1/synth/bd_1_eth_mac_0_clocks.xdc]
  read_xdc -ref Z_system_axi_ethernet_1_dma_0 -cells U0 /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_1_dma_0/Z_system_axi_ethernet_1_dma_0_clocks.xdc
  set_property processing_order LATE [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_1_dma_0/Z_system_axi_ethernet_1_dma_0_clocks.xdc]
  read_xdc -ref bd_2_eth_buf_0 -cells U0 /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_2_0/bd_2/ip/ip_0/synth/bd_2_eth_buf_0.xdc
  set_property processing_order LATE [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_2_0/bd_2/ip/ip_0/synth/bd_2_eth_buf_0.xdc]
  read_xdc -ref bd_2_eth_mac_0 -cells inst /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_2_0/bd_2/ip/ip_1/synth/bd_2_eth_mac_0_clocks.xdc
  set_property processing_order LATE [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_2_0/bd_2/ip/ip_1/synth/bd_2_eth_mac_0_clocks.xdc]
  read_xdc -ref Z_system_axi_ethernet_2_dma_0 -cells U0 /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_2_dma_0/Z_system_axi_ethernet_2_dma_0_clocks.xdc
  set_property processing_order LATE [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_2_dma_0/Z_system_axi_ethernet_2_dma_0_clocks.xdc]
  read_xdc -ref bd_3_eth_buf_0 -cells U0 /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_3_0/bd_3/ip/ip_0/synth/bd_3_eth_buf_0.xdc
  set_property processing_order LATE [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_3_0/bd_3/ip/ip_0/synth/bd_3_eth_buf_0.xdc]
  read_xdc -ref bd_3_eth_mac_0 -cells inst /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_3_0/bd_3/ip/ip_1/synth/bd_3_eth_mac_0_clocks.xdc
  set_property processing_order LATE [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_3_0/bd_3/ip/ip_1/synth/bd_3_eth_mac_0_clocks.xdc]
  read_xdc -ref Z_system_axi_ethernet_3_dma_0 -cells U0 /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_3_dma_0/Z_system_axi_ethernet_3_dma_0_clocks.xdc
  set_property processing_order LATE [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_axi_ethernet_3_dma_0/Z_system_axi_ethernet_3_dma_0_clocks.xdc]
  read_xdc -ref Z_system_auto_us_0 -cells inst /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_auto_us_0/Z_system_auto_us_0_clocks.xdc
  set_property processing_order LATE [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_auto_us_0/Z_system_auto_us_0_clocks.xdc]
  read_xdc -ref Z_system_auto_us_1 -cells inst /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_auto_us_1/Z_system_auto_us_1_clocks.xdc
  set_property processing_order LATE [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_auto_us_1/Z_system_auto_us_1_clocks.xdc]
  read_xdc -ref Z_system_auto_us_2 -cells inst /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_auto_us_2/Z_system_auto_us_2_clocks.xdc
  set_property processing_order LATE [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_auto_us_2/Z_system_auto_us_2_clocks.xdc]
  read_xdc -ref Z_system_auto_us_3 -cells inst /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_auto_us_3/Z_system_auto_us_3_clocks.xdc
  set_property processing_order LATE [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_auto_us_3/Z_system_auto_us_3_clocks.xdc]
  read_xdc -ref Z_system_auto_us_4 -cells inst /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_auto_us_4/Z_system_auto_us_4_clocks.xdc
  set_property processing_order LATE [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_auto_us_4/Z_system_auto_us_4_clocks.xdc]
  read_xdc -ref Z_system_auto_us_5 -cells inst /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_auto_us_5/Z_system_auto_us_5_clocks.xdc
  set_property processing_order LATE [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_auto_us_5/Z_system_auto_us_5_clocks.xdc]
  read_xdc -ref Z_system_auto_us_6 -cells inst /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_auto_us_6/Z_system_auto_us_6_clocks.xdc
  set_property processing_order LATE [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_auto_us_6/Z_system_auto_us_6_clocks.xdc]
  read_xdc -ref Z_system_auto_us_7 -cells inst /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_auto_us_7/Z_system_auto_us_7_clocks.xdc
  set_property processing_order LATE [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_auto_us_7/Z_system_auto_us_7_clocks.xdc]
  read_xdc -ref Z_system_auto_us_8 -cells inst /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_auto_us_8/Z_system_auto_us_8_clocks.xdc
  set_property processing_order LATE [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_auto_us_8/Z_system_auto_us_8_clocks.xdc]
  read_xdc -ref Z_system_auto_us_9 -cells inst /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_auto_us_9/Z_system_auto_us_9_clocks.xdc
  set_property processing_order LATE [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_auto_us_9/Z_system_auto_us_9_clocks.xdc]
  read_xdc -ref Z_system_auto_us_10 -cells inst /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_auto_us_10/Z_system_auto_us_10_clocks.xdc
  set_property processing_order LATE [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_auto_us_10/Z_system_auto_us_10_clocks.xdc]
  read_xdc -ref Z_system_auto_us_11 -cells inst /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_auto_us_11/Z_system_auto_us_11_clocks.xdc
  set_property processing_order LATE [get_files /root/base_zc706/base_zc706.srcs/sources_1/bd/Z_system/ip/Z_system_auto_us_11/Z_system_auto_us_11_clocks.xdc]
  link_design -top Z_system_wrapper -part xc7z045ffg900-2
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force Z_system_wrapper_opt.dcp
  catch {report_drc -file Z_system_wrapper_drc_opted.rpt}
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  place_design 
  write_checkpoint -force Z_system_wrapper_placed.dcp
  catch { report_io -file Z_system_wrapper_io_placed.rpt }
  catch { report_clock_utilization -file Z_system_wrapper_clock_utilization_placed.rpt }
  catch { report_utilization -file Z_system_wrapper_utilization_placed.rpt -pb Z_system_wrapper_utilization_placed.pb }
  catch { report_control_sets -verbose -file Z_system_wrapper_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force Z_system_wrapper_routed.dcp
  catch { report_drc -file Z_system_wrapper_drc_routed.rpt -pb Z_system_wrapper_drc_routed.pb }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file Z_system_wrapper_timing_summary_routed.rpt -rpx Z_system_wrapper_timing_summary_routed.rpx }
  catch { report_power -file Z_system_wrapper_power_routed.rpt -pb Z_system_wrapper_power_summary_routed.pb }
  catch { report_route_status -file Z_system_wrapper_route_status.rpt -pb Z_system_wrapper_route_status.pb }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  write_bitstream -force Z_system_wrapper.bit 
  if { [file exists /root/base_zc706/base_zc706.runs/synth_1/Z_system_wrapper.hwdef] } {
    catch { write_sysdef -hwdef /root/base_zc706/base_zc706.runs/synth_1/Z_system_wrapper.hwdef -bitfile Z_system_wrapper.bit -meminfo Z_system_wrapper.mmi -file Z_system_wrapper.sysdef }
  }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

