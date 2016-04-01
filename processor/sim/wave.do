onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /processor_tb/CLK
add wave -noupdate -expand -group ifid -group mx_pc -radix unsigned -childformat {{{/processor_tb/processor/if_id/mx_pc/in_SE[31]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[30]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[29]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[28]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[27]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[26]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[25]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[24]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[23]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[22]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[21]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[20]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[19]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[18]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[17]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[16]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[15]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[14]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[13]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[12]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[11]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[10]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[9]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[8]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[7]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[6]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[5]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[4]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[3]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[2]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[1]} -radix unsigned} {{/processor_tb/processor/if_id/mx_pc/in_SE[0]} -radix unsigned}} -subitemconfig {{/processor_tb/processor/if_id/mx_pc/in_SE[31]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[30]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[29]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[28]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[27]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[26]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[25]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[24]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[23]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[22]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[21]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[20]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[19]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[18]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[17]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[16]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[15]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[14]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[13]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[12]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[11]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[10]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[9]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[8]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[7]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[6]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[5]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[4]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[3]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[2]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[1]} {-height 15 -radix unsigned} {/processor_tb/processor/if_id/mx_pc/in_SE[0]} {-height 15 -radix unsigned}} /processor_tb/processor/if_id/mx_pc/in_SE
add wave -noupdate -expand -group ifid -group mx_pc -radix unsigned /processor_tb/processor/if_id/mx_pc/in_RB
add wave -noupdate -expand -group ifid -group mx_pc -radix unsigned /processor_tb/processor/if_id/mx_pc/in_ADD
add wave -noupdate -expand -group ifid -group mx_pc -radix binary /processor_tb/processor/if_id/mx_pc/S_MXPC
add wave -noupdate -expand -group ifid -group mx_pc -radix unsigned /processor_tb/processor/if_id/mx_pc/out
add wave -noupdate -expand -group ifid -group pc -radix unsigned /processor_tb/processor/if_id/pc/in
add wave -noupdate -expand -group ifid -group pc -radix unsigned /processor_tb/processor/if_id/pc/out
add wave -noupdate -expand -group ifid -expand -group im -radix unsigned /processor_tb/processor/if_id/im/ADDRESS
add wave -noupdate -expand -group ifid -expand -group im /processor_tb/processor/if_id/im/Q
add wave -noupdate -expand -group ifid -group sg /processor_tb/processor/if_id/sg/OP_TF
add wave -noupdate -expand -group ifid -group sg -radix binary /processor_tb/processor/if_id/sg/OP_SE
add wave -noupdate -expand -group ifid -group sg -radix binary /processor_tb/processor/if_id/sg/OP_FU
add wave -noupdate -expand -group ifid -group sg -radix binary /processor_tb/processor/if_id/sg/S_MXSE
add wave -noupdate -expand -group ifid -group sg /processor_tb/processor/if_id/sg/OP_ALU
add wave -noupdate -expand -group ifid -group sg -radix binary /processor_tb/processor/if_id/sg/W_DM
add wave -noupdate -expand -group ifid -group sg -radix binary /processor_tb/processor/if_id/sg/S_MXRB
add wave -noupdate -expand -group ifid -group sg -radix binary /processor_tb/processor/if_id/sg/W_RB
add wave -noupdate -expand -group ifid -group rb -radix unsigned /processor_tb/processor/if_id/rb/RA
add wave -noupdate -expand -group ifid -group rb -radix unsigned /processor_tb/processor/if_id/rb/RB
add wave -noupdate -expand -group ifid -group rb -radix unsigned /processor_tb/processor/if_id/rb/WC
add wave -noupdate -expand -group ifid -group rb -radix decimal /processor_tb/processor/if_id/rb/WPC
add wave -noupdate -expand -group ifid -group rb -radix binary /processor_tb/processor/if_id/rb/W_RB
add wave -noupdate -expand -group ifid -group rb -radix decimal /processor_tb/processor/if_id/rb/PRA
add wave -noupdate -expand -group ifid -group rb -radix decimal /processor_tb/processor/if_id/rb/PRB
add wave -noupdate -expand -group ifid -group se -radix binary /processor_tb/processor/if_id/se/in
add wave -noupdate -expand -group ifid -group se -radix binary /processor_tb/processor/if_id/se/out
add wave -noupdate -expand -group ifid -group tf -radix binary /processor_tb/processor/if_id/tf/cond
add wave -noupdate -expand -group ifid -group tf -radix binary /processor_tb/processor/if_id/tf/OP_TF
add wave -noupdate -expand -group ifid -group tf -radix binary /processor_tb/processor/if_id/tf/O
add wave -noupdate -expand -group ifid -group tf -radix binary /processor_tb/processor/if_id/tf/S
add wave -noupdate -expand -group ifid -group tf -radix binary /processor_tb/processor/if_id/tf/C
add wave -noupdate -expand -group ifid -group tf -radix binary /processor_tb/processor/if_id/tf/Z
add wave -noupdate -expand -group ifid -group tf -radix binary /processor_tb/processor/if_id/tf/out
add wave -noupdate -group reg_idif -group reg_ifid_in -radix unsigned /processor_tb/processor/reg_ifid/in_RA
add wave -noupdate -group reg_idif -group reg_ifid_in -radix unsigned /processor_tb/processor/reg_ifid/in_RB
add wave -noupdate -group reg_idif -group reg_ifid_in -radix unsigned /processor_tb/processor/reg_ifid/in_WC
add wave -noupdate -group reg_idif -group reg_ifid_in -radix unsigned /processor_tb/processor/reg_ifid/in_PC
add wave -noupdate -group reg_idif -group reg_ifid_in -radix decimal /processor_tb/processor/reg_ifid/in_PRA
add wave -noupdate -group reg_idif -group reg_ifid_in -radix decimal /processor_tb/processor/reg_ifid/in_PRB
add wave -noupdate -group reg_idif -group reg_ifid_in -radix decimal /processor_tb/processor/reg_ifid/in_se_out
add wave -noupdate -group reg_idif -group reg_ifid_in -radix binary /processor_tb/processor/reg_ifid/in_OP_FU
add wave -noupdate -group reg_idif -group reg_ifid_in -radix binary /processor_tb/processor/reg_ifid/in_S_MXSE
add wave -noupdate -group reg_idif -group reg_ifid_in -radix binary /processor_tb/processor/reg_ifid/in_OP_ALU
add wave -noupdate -group reg_idif -group reg_ifid_in -radix binary /processor_tb/processor/reg_ifid/in_W_DM
add wave -noupdate -group reg_idif -group reg_ifid_in -radix binary /processor_tb/processor/reg_ifid/in_S_MXRB
add wave -noupdate -group reg_idif -group reg_ifid_in -radix binary /processor_tb/processor/reg_ifid/in_W_RB
add wave -noupdate -group reg_idif -group reg_ifid_out -radix unsigned /processor_tb/processor/reg_ifid/out_RA
add wave -noupdate -group reg_idif -group reg_ifid_out -radix unsigned /processor_tb/processor/reg_ifid/out_RB
add wave -noupdate -group reg_idif -group reg_ifid_out -radix unsigned /processor_tb/processor/reg_ifid/out_WC
add wave -noupdate -group reg_idif -group reg_ifid_out -radix unsigned /processor_tb/processor/reg_ifid/out_PC
add wave -noupdate -group reg_idif -group reg_ifid_out -radix decimal /processor_tb/processor/reg_ifid/out_PRA
add wave -noupdate -group reg_idif -group reg_ifid_out -radix decimal /processor_tb/processor/reg_ifid/out_PRB
add wave -noupdate -group reg_idif -group reg_ifid_out -radix binary /processor_tb/processor/reg_ifid/out_se_out
add wave -noupdate -group reg_idif -group reg_ifid_out -radix binary /processor_tb/processor/reg_ifid/out_OP_FU
add wave -noupdate -group reg_idif -group reg_ifid_out -radix binary /processor_tb/processor/reg_ifid/out_S_MXSE
add wave -noupdate -group reg_idif -group reg_ifid_out -radix binary /processor_tb/processor/reg_ifid/out_OP_ALU
add wave -noupdate -group reg_idif -group reg_ifid_out -radix binary /processor_tb/processor/reg_ifid/out_W_DM
add wave -noupdate -group reg_idif -group reg_ifid_out -radix binary /processor_tb/processor/reg_ifid/out_S_MXRB
add wave -noupdate -group reg_idif -group reg_ifid_out -radix binary /processor_tb/processor/reg_ifid/out_W_RB
add wave -noupdate -group exmem -group fu -radix binary /processor_tb/processor/ex_mem/fu/OP_FU
add wave -noupdate -group exmem -group fu -radix unsigned /processor_tb/processor/ex_mem/fu/RA
add wave -noupdate -group exmem -group fu -radix unsigned /processor_tb/processor/ex_mem/fu/RB
add wave -noupdate -group exmem -group fu -radix unsigned /processor_tb/processor/ex_mem/fu/WC
add wave -noupdate -group exmem -group fu -radix binary /processor_tb/processor/ex_mem/fu/W_RB
add wave -noupdate -group exmem -group fu -radix binary /processor_tb/processor/ex_mem/fu/out_A
add wave -noupdate -group exmem -group fu -radix binary /processor_tb/processor/ex_mem/fu/out_B
add wave -noupdate -group exmem -group mx_a -radix decimal /processor_tb/processor/ex_mem/mx_a/in_PRA
add wave -noupdate -group exmem -group mx_a -radix decimal /processor_tb/processor/ex_mem/mx_a/in_mxrb
add wave -noupdate -group exmem -group mx_a -radix binary /processor_tb/processor/ex_mem/mx_a/forward
add wave -noupdate -group exmem -group mx_a -radix decimal /processor_tb/processor/ex_mem/mx_a/out
add wave -noupdate -group exmem -group mx_b -radix decimal /processor_tb/processor/ex_mem/mx_b/in_PRB
add wave -noupdate -group exmem -group mx_b -radix decimal /processor_tb/processor/ex_mem/mx_b/in_SE
add wave -noupdate -group exmem -group mx_b -radix decimal /processor_tb/processor/ex_mem/mx_b/in_mxrb
add wave -noupdate -group exmem -group mx_b -radix binary /processor_tb/processor/ex_mem/mx_b/S_MXSE
add wave -noupdate -group exmem -group mx_b -radix binary /processor_tb/processor/ex_mem/mx_b/forward
add wave -noupdate -group exmem -group mx_b -radix decimal /processor_tb/processor/ex_mem/mx_b/out
add wave -noupdate -group exmem -group alu -radix decimal /processor_tb/processor/ex_mem/alu/result
add wave -noupdate -group exmem -group alu -radix binary /processor_tb/processor/ex_mem/alu/O
add wave -noupdate -group exmem -group alu -radix binary /processor_tb/processor/ex_mem/alu/S
add wave -noupdate -group exmem -group alu -radix binary /processor_tb/processor/ex_mem/alu/C
add wave -noupdate -group exmem -group alu -radix binary /processor_tb/processor/ex_mem/alu/Z
add wave -noupdate -group exmem -group alu -radix binary /processor_tb/processor/ex_mem/alu/OP
add wave -noupdate -group exmem -group alu -radix decimal /processor_tb/processor/ex_mem/alu/A
add wave -noupdate -group exmem -group alu -radix decimal /processor_tb/processor/ex_mem/alu/B
add wave -noupdate -group exmem -group dm -radix binary /processor_tb/processor/ex_mem/dm/WE
add wave -noupdate -group exmem -group dm -radix unsigned /processor_tb/processor/ex_mem/dm/ADDRESS
add wave -noupdate -group exmem -group dm -radix decimal /processor_tb/processor/ex_mem/dm/DATA
add wave -noupdate -group exmem -group dm -radix decimal /processor_tb/processor/ex_mem/dm/Q
add wave -noupdate -group reg_exmem -expand -group reg_exmem_in -radix unsigned /processor_tb/processor/reg_exmem/in_WC
add wave -noupdate -group reg_exmem -expand -group reg_exmem_in -radix unsigned /processor_tb/processor/reg_exmem/in_PC
add wave -noupdate -group reg_exmem -expand -group reg_exmem_in -radix decimal /processor_tb/processor/reg_exmem/in_PR
add wave -noupdate -group reg_exmem -expand -group reg_exmem_in -radix decimal /processor_tb/processor/reg_exmem/in_alu_res
add wave -noupdate -group reg_exmem -expand -group reg_exmem_in -radix binary /processor_tb/processor/reg_exmem/in_S_MXRB
add wave -noupdate -group reg_exmem -expand -group reg_exmem_in -radix binary /processor_tb/processor/reg_exmem/in_W_RB
add wave -noupdate -group reg_exmem -group reg_exmem_out -radix unsigned /processor_tb/processor/reg_exmem/out_WC
add wave -noupdate -group reg_exmem -group reg_exmem_out -radix unsigned /processor_tb/processor/reg_exmem/out_PC
add wave -noupdate -group reg_exmem -group reg_exmem_out -radix decimal /processor_tb/processor/reg_exmem/out_PR
add wave -noupdate -group reg_exmem -group reg_exmem_out -radix decimal /processor_tb/processor/reg_exmem/out_alu_res
add wave -noupdate -group reg_exmem -group reg_exmem_out -radix decimal /processor_tb/processor/reg_exmem/out_S_MXRB
add wave -noupdate -group reg_exmem -group reg_exmem_out -radix binary /processor_tb/processor/reg_exmem/out_W_RB
add wave -noupdate -group wb -expand -group mx_rb -radix decimal /processor_tb/processor/wb/mx_rb/in_PC
add wave -noupdate -group wb -expand -group mx_rb -radix decimal /processor_tb/processor/wb/mx_rb/in_DM
add wave -noupdate -group wb -expand -group mx_rb -radix decimal /processor_tb/processor/wb/mx_rb/in_ALU
add wave -noupdate -group wb -expand -group mx_rb -radix binary /processor_tb/processor/wb/mx_rb/S_MXRB
add wave -noupdate -group wb -expand -group mx_rb -radix decimal /processor_tb/processor/wb/mx_rb/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {108 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 321
configure wave -valuecolwidth 226
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
WaveRestoreZoom {62 ps} {144 ps}
