set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

set_property PACKAGE_PIN AK17 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL12 [get_ports sys_clk_p]
create_clock -period 5.000 -name sys_clk_p -waveform {0.000 2.500} [get_ports sys_clk_p]

set_property PACKAGE_PIN AK8 [get_ports rst_n]
set_property IOSTANDARD LVCMOS18 [get_ports rst_n]

set_property PACKAGE_PIN A23 [get_ports e_mdc]
set_property PACKAGE_PIN A22 [get_ports e_mdio]
set_property PACKAGE_PIN H22 [get_ports e_reset]
set_property PACKAGE_PIN D23 [get_ports rgmii_rxc]
set_property PACKAGE_PIN A29 [get_ports rgmii_rxctl]
set_property PACKAGE_PIN B29 [get_ports {rgmii_rxd[0]}]
set_property PACKAGE_PIN A28 [get_ports {rgmii_rxd[1]}]
set_property PACKAGE_PIN A27 [get_ports {rgmii_rxd[2]}]
set_property PACKAGE_PIN C23 [get_ports {rgmii_rxd[3]}]
set_property PACKAGE_PIN B24 [get_ports rgmii_txc]
set_property PACKAGE_PIN A24 [get_ports rgmii_txctl]
set_property PACKAGE_PIN B20 [get_ports {rgmii_txd[0]}]
set_property PACKAGE_PIN A20 [get_ports {rgmii_txd[1]}]
set_property PACKAGE_PIN B21 [get_ports {rgmii_txd[2]}]
set_property PACKAGE_PIN B22 [get_ports {rgmii_txd[3]}]

set_property IOSTANDARD LVCMOS18 [get_ports e_mdc]
set_property IOSTANDARD LVCMOS18 [get_ports e_mdio]
set_property IOSTANDARD LVCMOS18 [get_ports e_reset]
set_property IOSTANDARD LVCMOS18 [get_ports rgmii_rxc]
set_property IOSTANDARD LVCMOS18 [get_ports rgmii_rxctl]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_rxd[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_rxd[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_rxd[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_rxd[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports rgmii_txc]
set_property IOSTANDARD LVCMOS18 [get_ports rgmii_txctl]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_txd[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_txd[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_txd[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_txd[3]}]




create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list rgmii_rxc_IBUF_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {eth1/e_rxd[0]} {eth1/e_rxd[1]} {eth1/e_rxd[2]} {eth1/e_rxd[3]} {eth1/e_rxd[4]} {eth1/e_rxd[5]} {eth1/e_rxd[6]} {eth1/e_rxd[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {eth1/gmii_txd[0]} {eth1/gmii_txd[1]} {eth1/gmii_txd[2]} {eth1/gmii_txd[3]} {eth1/gmii_txd[4]} {eth1/gmii_txd[5]} {eth1/gmii_txd[6]} {eth1/gmii_txd[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {eth1/mac_test0/mac_top0/mac_tx0/udp0/ram_wr_data[0]} {eth1/mac_test0/mac_top0/mac_tx0/udp0/ram_wr_data[1]} {eth1/mac_test0/mac_top0/mac_tx0/udp0/ram_wr_data[2]} {eth1/mac_test0/mac_top0/mac_tx0/udp0/ram_wr_data[3]} {eth1/mac_test0/mac_top0/mac_tx0/udp0/ram_wr_data[4]} {eth1/mac_test0/mac_top0/mac_tx0/udp0/ram_wr_data[5]} {eth1/mac_test0/mac_top0/mac_tx0/udp0/ram_wr_data[6]} {eth1/mac_test0/mac_top0/mac_tx0/udp0/ram_wr_data[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 8 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {eth1/mac_test0/mac_top0/mac_tx0/udp0/ram_rdata[0]} {eth1/mac_test0/mac_top0/mac_tx0/udp0/ram_rdata[1]} {eth1/mac_test0/mac_top0/mac_tx0/udp0/ram_rdata[2]} {eth1/mac_test0/mac_top0/mac_tx0/udp0/ram_rdata[3]} {eth1/mac_test0/mac_top0/mac_tx0/udp0/ram_rdata[4]} {eth1/mac_test0/mac_top0/mac_tx0/udp0/ram_rdata[5]} {eth1/mac_test0/mac_top0/mac_tx0/udp0/ram_rdata[6]} {eth1/mac_test0/mac_top0/mac_tx0/udp0/ram_rdata[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list eth1/e_rx_dv]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list eth1/gmii_tx_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list eth1/mac_test0/mac_top0/mac_tx0/udp0/ram_rd_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list eth1/mac_test0/mac_top0/mac_tx0/udp0/ram_wr_en]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets rgmii_rxc_IBUF_BUFG]
