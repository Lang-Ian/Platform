onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider flasher1
add wave -noupdate /top_tb/i_top/i_flasher/CLK_0
add wave -noupdate /top_tb/i_top/i_flasher/Q_0
add wave -noupdate -divider flasher2
add wave -noupdate /top_tb/i_top/i_flasher1/CLK_0
add wave -noupdate /top_tb/i_top/i_flasher1/Q_0
add wave -noupdate -divider flasher2
add wave -noupdate /top_tb/i_top/i_flasher2/CLK_0
add wave -noupdate /top_tb/i_top/i_flasher2/Q_0
add wave -noupdate -divider flashe4
add wave -noupdate /top_tb/i_top/i_flasher3/CLK_0
add wave -noupdate /top_tb/i_top/i_flasher3/Q_0
add wave -noupdate -divider MASTER
add wave -noupdate /top_tb/i_top/aurora_0/master_0/init_clk
add wave -noupdate -divider {ADD STUFF HERE}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {184763948 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits fs
update
WaveRestoreZoom {0 fs} {43050 ns}
