onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ibert_sfp_10g_opt

do {wave.do}

view wave
view structure
view signals

do {ibert_sfp_10g.udo}

run -all

quit -force
