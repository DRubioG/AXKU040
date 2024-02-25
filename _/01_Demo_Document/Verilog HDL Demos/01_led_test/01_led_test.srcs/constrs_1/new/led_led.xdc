




#############SPI Configurate Setting##################



set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design] 
set_property BITSTREAM.CONFIG.UNUSEDPIN Pullup [current_design] 
############## clock define##################

create_clock -period 5.000 [get_ports sys_clk_p]

set_property PACKAGE_PIN Ak17 [get_ports sys_clk_p]

set_property IOSTANDARD DIFF_SSTL12 [get_ports sys_clk_p]

############## key define##################

set_property PACKAGE_PIN AK8 [get_ports rst_n]
set_property IOSTANDARD LVCMOS18 [get_ports rst_n]

#################fan define##################

set_property IOSTANDARD LVCMOS18 [get_ports fan_pwm]

set_property PACKAGE_PIN P20 [get_ports fan_pwm]

##############LED define##################

set_property PACKAGE_PIN L20 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[0]}]
set_property PACKAGE_PIN M20 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[1]}]
set_property PACKAGE_PIN M21 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[2]}]
set_property PACKAGE_PIN N21 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[3]}]
