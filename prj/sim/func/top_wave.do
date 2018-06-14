onerror {resume}

radix define DOUT {
	"'b0001" "SLON" -color "#FF0040",
	"'b0101" "S100" -color "#00FF80",
    -default binary
    -defaultcolor #008080
}


quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /md5_tb/clk
add wave -noupdate -label rst /md5_tb/rst
add wave -noupdate -color Red -label sInfo -radix ascii -radixshowbase 0 /md5_tb/sInfo
add wave -noupdate -color {Dark Orchid} -label sw -radix binary -radixshowbase 0 /md5_tb/sw
add wave -noupdate -color Coral -label dnum -radix binary -radixshowbase 0 /md5_tb/dnum
add wave -noupdate -label idx -radix binary -radixshowbase 0 /md5_tb/md5/idx
add wave -noupdate -label dout -radix binary -radixshowbase 0 /md5_tb/dout
add wave -noupdate -label dout -radix DOUT /md5_tb/dout
add wave -noupdate -color Red -label dout -radix hexadecimal -radixshowbase 0 /md5_tb/dout

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8000 ps} 0}
quietly wave cursor active 1

configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ps} {137814 ps}
