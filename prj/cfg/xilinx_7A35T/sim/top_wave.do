onerror {resume}
radix define DOUT {
    "'b0001" "SLON" -color "#FF0040",
    "'b0101" "S100" -color "#00FF80",
    -default binary
    -defaultcolor #008080
}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /slon5_tb/clk
add wave -noupdate -label rst /slon5_tb/rst
add wave -noupdate -color Red -label sInfo -radix ascii -radixshowbase 0 /slon5_tb/sInfo
add wave -noupdate -color {Dark Orchid} -label sw -radix binary -radixshowbase 0 /slon5_tb/sw
add wave -noupdate -color Coral -label dnum -radix binary -radixshowbase 0 /slon5_tb/dnum
add wave -noupdate -label dout -radix binary -radixshowbase 0 /slon5_tb/dout
add wave -noupdate -label dout -radix DOUT /slon5_tb/dout
add wave -noupdate -color Red -label dout -radix hexadecimal -radixshowbase 0 /slon5_tb/dout
add wave -noupdate /slon5_tb/slon5/clk
add wave -noupdate /slon5_tb/slon5/rst
add wave -noupdate /slon5_tb/slon5/pll_locked
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1038000 ps} 0} {{Cursor 2} {193238 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 270
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 3000
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1470720 ps}
