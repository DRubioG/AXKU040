set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

set_property PACKAGE_PIN AK17 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS18 [get_ports sys_clk]

#PL_KEY1
set_property PACKAGE_PIN AK8 [get_ports rst_n]
set_property IOSTANDARD LVCMOS18 [get_ports rst_n]

#power lp873220 
set_property IOSTANDARD LVCMOS18 [get_ports pwr_en]
set_property PACKAGE_PIN L17 [get_ports pwr_en]

set_property IOSTANDARD LVCMOS18 [get_ports pwr_scl]
set_property PACKAGE_PIN P24 [get_ports pwr_scl]

set_property IOSTANDARD LVCMOS18 [get_ports pwr_sda]
set_property PACKAGE_PIN P25 [get_ports pwr_sda]

