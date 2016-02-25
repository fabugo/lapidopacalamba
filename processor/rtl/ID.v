module ID(
input CLK,
input[31:0] instruction,
input[31:0] WPC,
output [31:0] PRA,
output [31:0] PRB,
output outSE,
output cond,
output OP_ALU,
output OP_TF,
output W_PC,
output W_DM,
output W_MI,
output W_RF,
output S_MXPC,
output S_MXRB,
output S_MXSE
);
wire OP_SE;
wire W_RB;
unit_control uc(
.CLK(),
.type(instruction[31:29]),
.op(instruction[28:24]),
.OP_ALU(),
.OP_TF(),
.OP_SE(OP_SE),
.W_PC(),
.W_DM(),
.W_MI(),
.W_RB(W_RB),
.W_RF(),
.S_MXPC(),
.S_MXRB(),
.S_MXSE()
);
signal_extender se(
.in(instruction[15:0]),
.OP_SE(OP_SE),
.out(outSE)
);
register_bank rb(
.RA(instruction[19:16]),
.RB(instruction[15:12]),
.WC(instruction[23:20]),
.WPC(WPC),
.W_RB(W_RB),
.PRA(PRA),
.PRB(PRB)
);

endmodule
