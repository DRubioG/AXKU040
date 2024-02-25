vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm
vlib questa_lib/msim/microblaze_v10_0_5
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/proc_sys_reset_v5_0_12
vlib questa_lib/msim/lmb_v10_v3_0_9
vlib questa_lib/msim/lmb_bram_if_cntlr_v4_0_14
vlib questa_lib/msim/blk_mem_gen_v8_4_1
vlib questa_lib/msim/iomodule_v3_1_3

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm
vmap microblaze_v10_0_5 questa_lib/msim/microblaze_v10_0_5
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_12 questa_lib/msim/proc_sys_reset_v5_0_12
vmap lmb_v10_v3_0_9 questa_lib/msim/lmb_v10_v3_0_9
vmap lmb_bram_if_cntlr_v4_0_14 questa_lib/msim/lmb_bram_if_cntlr_v4_0_14
vmap blk_mem_gen_v8_4_1 questa_lib/msim/blk_mem_gen_v8_4_1
vmap iomodule_v3_1_3 questa_lib/msim/iomodule_v3_1_3

vlog -work xil_defaultlib -64 -sv -L xil_defaultlib "+incdir+../../../../sources_1/ip/ddr4_0/ip_1/rtl/map" "+incdir+../../../../sources_1/ip/ddr4_0/rtl/ip_top" "+incdir+../../../../sources_1/ip/ddr4_0/rtl/cal" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../sources_1/ip/ddr4_0/ip_1/rtl/map" "+incdir+../../../../sources_1/ip/ddr4_0/rtl/ip_top" "+incdir+../../../../sources_1/ip/ddr4_0/rtl/cal" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v10_0_5 -64 -93 \
"../../../ipstatic/hdl/microblaze_v10_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../sources_1/ip/ddr4_0/bd_0/ip/ip_0/sim/bd_9054_microblaze_I_0.vhd" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../ipstatic/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_12 -64 -93 \
"../../../ipstatic/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../sources_1/ip/ddr4_0/bd_0/ip/ip_1/sim/bd_9054_rst_0_0.vhd" \

vcom -work lmb_v10_v3_0_9 -64 -93 \
"../../../ipstatic/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../sources_1/ip/ddr4_0/bd_0/ip/ip_2/sim/bd_9054_ilmb_0.vhd" \
"../../../../sources_1/ip/ddr4_0/bd_0/ip/ip_3/sim/bd_9054_dlmb_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_14 -64 -93 \
"../../../ipstatic/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../sources_1/ip/ddr4_0/bd_0/ip/ip_4/sim/bd_9054_dlmb_cntlr_0.vhd" \
"../../../../sources_1/ip/ddr4_0/bd_0/ip/ip_5/sim/bd_9054_ilmb_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_1 -64 "+incdir+../../../../sources_1/ip/ddr4_0/ip_1/rtl/map" "+incdir+../../../../sources_1/ip/ddr4_0/rtl/ip_top" "+incdir+../../../../sources_1/ip/ddr4_0/rtl/cal" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../sources_1/ip/ddr4_0/ip_1/rtl/map" "+incdir+../../../../sources_1/ip/ddr4_0/rtl/ip_top" "+incdir+../../../../sources_1/ip/ddr4_0/rtl/cal" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../sources_1/ip/ddr4_0/ip_1/rtl/map" "+incdir+../../../../sources_1/ip/ddr4_0/rtl/ip_top" "+incdir+../../../../sources_1/ip/ddr4_0/rtl/cal" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../sources_1/ip/ddr4_0/ip_1/rtl/map" "+incdir+../../../../sources_1/ip/ddr4_0/rtl/ip_top" "+incdir+../../../../sources_1/ip/ddr4_0/rtl/cal" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../sources_1/ip/ddr4_0/bd_0/ip/ip_6/sim/bd_9054_lmb_bram_I_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../../sources_1/ip/ddr4_0/bd_0/ip/ip_7/sim/bd_9054_second_dlmb_cntlr_0.vhd" \
"../../../../sources_1/ip/ddr4_0/bd_0/ip/ip_8/sim/bd_9054_second_ilmb_cntlr_0.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../sources_1/ip/ddr4_0/ip_1/rtl/map" "+incdir+../../../../sources_1/ip/ddr4_0/rtl/ip_top" "+incdir+../../../../sources_1/ip/ddr4_0/rtl/cal" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../sources_1/ip/ddr4_0/ip_1/rtl/map" "+incdir+../../../../sources_1/ip/ddr4_0/rtl/ip_top" "+incdir+../../../../sources_1/ip/ddr4_0/rtl/cal" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../sources_1/ip/ddr4_0/bd_0/ip/ip_9/sim/bd_9054_second_lmb_bram_I_0.v" \

vcom -work iomodule_v3_1_3 -64 -93 \
"../../../ipstatic/hdl/iomodule_v3_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../sources_1/ip/ddr4_0/bd_0/ip/ip_10/sim/bd_9054_iomodule_0_0.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../sources_1/ip/ddr4_0/ip_1/rtl/map" "+incdir+../../../../sources_1/ip/ddr4_0/rtl/ip_top" "+incdir+../../../../sources_1/ip/ddr4_0/rtl/cal" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../sources_1/ip/ddr4_0/ip_1/rtl/map" "+incdir+../../../../sources_1/ip/ddr4_0/rtl/ip_top" "+incdir+../../../../sources_1/ip/ddr4_0/rtl/cal" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../sources_1/ip/ddr4_0/bd_0/sim/bd_9054.v" \
"../../../../sources_1/ip/ddr4_0/ip_0/sim/ddr4_0_microblaze_mcs.v" \

vlog -work xil_defaultlib -64 -sv -L xil_defaultlib "+incdir+../../../../sources_1/ip/ddr4_0/ip_1/rtl/map" "+incdir+../../../../sources_1/ip/ddr4_0/rtl/ip_top" "+incdir+../../../../sources_1/ip/ddr4_0/rtl/cal" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../sources_1/ip/ddr4_0/ip_1/rtl/map" "+incdir+../../../../sources_1/ip/ddr4_0/rtl/ip_top" "+incdir+../../../../sources_1/ip/ddr4_0/rtl/cal" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../sources_1/ip/ddr4_0/ip_1/rtl/phy/ddr4_phy_v2_2_xiphy_behav.sv" \
"../../../../sources_1/ip/ddr4_0/ip_1/rtl/phy/ddr4_phy_v2_2_xiphy.sv" \
"../../../../sources_1/ip/ddr4_0/ip_1/rtl/iob/ddr4_phy_v2_2_iob_byte.sv" \
"../../../../sources_1/ip/ddr4_0/ip_1/rtl/iob/ddr4_phy_v2_2_iob.sv" \
"../../../../sources_1/ip/ddr4_0/ip_1/rtl/clocking/ddr4_phy_v2_2_pll.sv" \
"../../../../sources_1/ip/ddr4_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_tristate_wrapper.sv" \
"../../../../sources_1/ip/ddr4_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_riuor_wrapper.sv" \
"../../../../sources_1/ip/ddr4_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_control_wrapper.sv" \
"../../../../sources_1/ip/ddr4_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_byte_wrapper.sv" \
"../../../../sources_1/ip/ddr4_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_bitslice_wrapper.sv" \
"../../../../sources_1/ip/ddr4_0/ip_1/rtl/phy/ddr4_0_phy_ddr4.sv" \
"../../../../sources_1/ip/ddr4_0/ip_1/rtl/ip_top/ddr4_0_phy.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_wtr.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ref.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_rd_wr.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_periodic.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_group.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc_merge_enc.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc_gen.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc_fi_xor.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc_dec_fix.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc_buf.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ctl.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_cmd_mux_c.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_cmd_mux_ap.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_arb_p.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_arb_mux_p.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_arb_c.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_arb_a.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_act_timer.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_act_rank.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/ui/ddr4_v2_2_ui_wr_data.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/ui/ddr4_v2_2_ui_rd_data.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/ui/ddr4_v2_2_ui_cmd.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/ui/ddr4_v2_2_ui.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_ar_channel.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_aw_channel.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_b_channel.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_cmd_arbiter.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_cmd_fsm.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_cmd_translator.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_fifo.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_incr_cmd.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_r_channel.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_w_channel.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_wr_cmd_fsm.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_wrap_cmd.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_a_upsizer.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_register_slice.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_upsizer.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axic_register_slice.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_carry_and.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_carry_latch_and.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_carry_latch_or.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_carry_or.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_command_fifo.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_comparator.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_comparator_sel.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_comparator_sel_static.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_r_upsizer.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_w_upsizer.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_addr_decode.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_read.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_reg_bank.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_reg.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_top.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_write.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/clocking/ddr4_v2_2_infrastructure.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_xsdb_bram.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_write.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_wr_byte.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_wr_bit.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_sync.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_read.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_rd_en.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_pi.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_mc_odt.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_debug_microblaze.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_cplx_data.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_cplx.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_config_rom.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_addr_decode.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_top.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_xsdb_arbiter.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_chipscope_xsdb_slave.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_dp_AB9.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/ip_top/ddr4_0.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/ip_top/ddr4_0_ddr4.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/ip_top/ddr4_0_ddr4_mem_intfc.sv" \
"../../../../sources_1/ip/ddr4_0/rtl/cal/ddr4_0_ddr4_cal_riu.sv" \
"../../../../sources_1/ip/ddr4_0/tb/microblaze_mcs_0.sv" \

vlog -work xil_defaultlib \
"glbl.v"

