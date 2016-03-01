onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /processor/CLK
add wave -noupdate -group mx_pc -radix unsigned /processor/if_1/mxpc/in_ALU
add wave -noupdate -group mx_pc -radix unsigned /processor/if_1/mxpc/in_ADD
add wave -noupdate -group mx_pc /processor/if_1/mxpc/S_MXPC
add wave -noupdate -group mx_pc -radix unsigned /processor/if_1/mxpc/out
add wave -noupdate -group add -radix unsigned /processor/if_1/add/A
add wave -noupdate -group add -radix unsigned /processor/if_1/add/B
add wave -noupdate -group add -radix unsigned /processor/if_1/add/result
add wave -noupdate -group pc -radix unsigned /processor/if_1/pc/in
add wave -noupdate -group pc /processor/if_1/pc/RESET
add wave -noupdate -group pc /processor/if_1/pc/W_PC
add wave -noupdate -group pc -radix unsigned /processor/if_1/pc/out
add wave -noupdate -group im /processor/if_1/im/RESET
add wave -noupdate -group im /processor/if_1/im/read_file
add wave -noupdate -group im /processor/if_1/im/write_file
add wave -noupdate -group im /processor/if_1/im/WE
add wave -noupdate -group im -radix unsigned /processor/if_1/im/ADDRESS
add wave -noupdate -group im -radix hexadecimal /processor/if_1/im/DATA
add wave -noupdate -group im -radix hexadecimal /processor/if_1/im/Q
add wave -noupdate -group uc /processor/id/uc/RESET
add wave -noupdate -group uc /processor/id/uc/type
add wave -noupdate -group uc /processor/id/uc/op
add wave -noupdate -group uc /processor/id/uc/OP_ALU
add wave -noupdate -group uc /processor/id/uc/OP_TF
add wave -noupdate -group uc /processor/id/uc/OP_SE
add wave -noupdate -group uc /processor/id/uc/W_PC
add wave -noupdate -group uc /processor/id/uc/W_DM
add wave -noupdate -group uc /processor/id/uc/W_IM
add wave -noupdate -group uc /processor/id/uc/W_RB
add wave -noupdate -group uc /processor/id/uc/W_RF
add wave -noupdate -group uc /processor/id/uc/S_MXRB
add wave -noupdate -group uc /processor/id/uc/S_MXSE
add wave -noupdate -group uc /processor/id/uc/STATE
add wave -noupdate -group uc /processor/id/uc/NEXT
add wave -noupdate -group se -radix decimal /processor/id/se/in
add wave -noupdate -group se /processor/id/se/OP_SE
add wave -noupdate -group se -radix decimal /processor/id/se/out
add wave -noupdate -group rb -radix unsigned /processor/id/rb/RA
add wave -noupdate -group rb -radix unsigned /processor/id/rb/RB
add wave -noupdate -group rb -radix unsigned /processor/id/rb/WC
add wave -noupdate -group rb -radix decimal /processor/id/rb/WPC
add wave -noupdate -group rb /processor/id/rb/RESET
add wave -noupdate -group rb /processor/id/rb/W_RB
add wave -noupdate -group rb -radix decimal /processor/id/rb/PRA
add wave -noupdate -group rb -radix decimal /processor/id/rb/PRB
add wave -noupdate -group tf /processor/ex/tf/RESET
add wave -noupdate -group tf /processor/ex/tf/O
add wave -noupdate -group tf /processor/ex/tf/S
add wave -noupdate -group tf /processor/ex/tf/C
add wave -noupdate -group tf /processor/ex/tf/Z
add wave -noupdate -group tf /processor/ex/tf/cond
add wave -noupdate -group tf /processor/ex/tf/OP_TF
add wave -noupdate -group tf /processor/ex/tf/out
add wave -noupdate -group dm /processor/ex/dm/RESET
add wave -noupdate -group dm /processor/ex/dm/read_file
add wave -noupdate -group dm /processor/ex/dm/write_file
add wave -noupdate -group dm /processor/ex/dm/WE
add wave -noupdate -group dm -radix unsigned /processor/ex/dm/ADDRESS
add wave -noupdate -group dm -radix decimal /processor/ex/dm/DATA
add wave -noupdate -group dm -radix decimal /processor/ex/dm/Q
add wave -noupdate -group mx_se -radix decimal /processor/ex/mxse/in_RB
add wave -noupdate -group mx_se -radix decimal /processor/ex/mxse/in_SE
add wave -noupdate -group mx_se /processor/ex/mxse/S_MXSE
add wave -noupdate -group mx_se -radix decimal /processor/ex/mxse/out
add wave -noupdate -group alu /processor/ex/alu/OP
add wave -noupdate -group alu -radix decimal /processor/ex/alu/A
add wave -noupdate -group alu -radix decimal /processor/ex/alu/B
add wave -noupdate -group alu -radix decimal /processor/ex/alu/result
add wave -noupdate -group alu /processor/ex/alu/O
add wave -noupdate -group alu /processor/ex/alu/S
add wave -noupdate -group alu /processor/ex/alu/C
add wave -noupdate -group alu /processor/ex/alu/Z
add wave -noupdate -group mx_rb -radix unsigned /processor/wb/mxrb/in_PC
add wave -noupdate -group mx_rb -radix decimal /processor/wb/mxrb/in_DM
add wave -noupdate -group mx_rb -radix decimal /processor/wb/mxrb/in_ALU
add wave -noupdate -group mx_rb /processor/wb/mxrb/S_MXRB
add wave -noupdate -group mx_rb -radix decimal /processor/wb/mxrb/out
add wave -noupdate -group rf /processor/wb/rf/RESET
add wave -noupdate -group rf -format Literal /processor/wb/rf/in_O
add wave -noupdate -group rf /processor/wb/rf/in_S
add wave -noupdate -group rf /processor/wb/rf/in_C
add wave -noupdate -group rf /processor/wb/rf/in_Z
add wave -noupdate -group rf /processor/wb/rf/W_RF
add wave -noupdate -group rf /processor/wb/rf/out_O
add wave -noupdate -group rf /processor/wb/rf/out_S
add wave -noupdate -group rf /processor/wb/rf/out_C
add wave -noupdate -group rf /processor/wb/rf/out_Z
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3820 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 232
configure wave -valuecolwidth 71
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {437 ps}
