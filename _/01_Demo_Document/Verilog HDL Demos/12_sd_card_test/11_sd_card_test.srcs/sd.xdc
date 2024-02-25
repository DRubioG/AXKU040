#############SPI Configurate Setting##################
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]

set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pullup [current_design]
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
############## clock define##################
create_clock -period 5.000 [get_ports sys_clk_p]
set_property PACKAGE_PIN AK17 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL12 [get_ports sys_clk_p]
############## key define##################
set_property PACKAGE_PIN AK8 [get_ports rst_n]
set_property IOSTANDARD LVCMOS18 [get_ports rst_n]
############## SD define##################
set_property IOSTANDARD LVCMOS18 [get_ports sd_dclk]
set_property PACKAGE_PIN AN8 [get_ports sd_dclk]

set_property IOSTANDARD LVCMOS18 [get_ports sd_ncs]
set_property PACKAGE_PIN AK10 [get_ports sd_ncs]

set_property IOSTANDARD LVCMOS18 [get_ports sd_mosi]
set_property PACKAGE_PIN AL9 [get_ports sd_mosi]

set_property IOSTANDARD LVCMOS18 [get_ports sd_miso]
set_property PACKAGE_PIN AL8 [get_ports sd_miso]
#############LED Setting##################
set_property PACKAGE_PIN L20 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[0]}]

set_property PACKAGE_PIN M20 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[1]}]

set_property PACKAGE_PIN M21 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[2]}]

set_property PACKAGE_PIN N21 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[3]}]
############## key define KEY2##################
set_property PACKAGE_PIN K21 [get_ports key]
set_property IOSTANDARD LVCMOS18 [get_ports key]
