#############SPI Configurate Setting##################
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]

set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pullup [current_design]
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
############# clock define################################
create_clock -period 5.000 [get_ports sys_clk_p]
set_property PACKAGE_PIN Ak17 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL12 [get_ports sys_clk_p]
############## key define##################
set_property PACKAGE_PIN Ak8 [get_ports rst_n]
set_property IOSTANDARD LVCMOS18 [get_ports rst_n]
############## fan define##################
set_property IOSTANDARD LVCMOS18 [get_ports fan_pwm]
set_property PACKAGE_PIN P20 [get_ports fan_pwm]
##########################################################
set_property PACKAGE_PIN P25 [get_ports sda]
set_property PACKAGE_PIN P24 [get_ports scl]
set_property IOSTANDARD LVCMOS18 [get_ports sda]
set_property IOSTANDARD LVCMOS18 [get_ports scl]
##############uart define###########################
set_property IOSTANDARD LVCMOS18 [get_ports uart_rx]
set_property PACKAGE_PIN N27 [get_ports uart_rx]

set_property IOSTANDARD LVCMOS18 [get_ports uart_tx]
set_property PACKAGE_PIN K22 [get_ports uart_tx]
