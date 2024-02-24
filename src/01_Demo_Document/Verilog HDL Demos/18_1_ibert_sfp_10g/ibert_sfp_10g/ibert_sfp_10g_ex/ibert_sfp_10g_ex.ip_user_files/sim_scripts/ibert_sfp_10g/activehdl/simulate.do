onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+ibert_sfp_10g -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.ibert_sfp_10g xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {ibert_sfp_10g.udo}

run -all

endsim

quit -force
