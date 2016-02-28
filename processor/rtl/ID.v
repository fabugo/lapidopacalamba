module ID(	input	wire		CLK,
	
			input	wire[31:0]	instruction,
			input	wire[31:0]	WPC,
			output	wire[31:0]	PRA,
			output	wire[31:0]	PRB,
			output	wire[31:0]	outSE,
			output	wire[2:0]	cond,
			output	wire[4:0]	OP_ALU,
			output	wire[2:0]	OP_TF,
			output	wire		W_PC,
			output	wire		W_DM,
			output	wire		W_IM,
			output	wire		W_RF,
			output	wire		S_MXPC,
			output  wire[1:0]	S_MXRB,
			output	wire		S_MXSE);

	wire OP_SE;
	wire W_RB;

	unit_control uc(.CLK(CLK),
					.type(instruction[31:29]),
					.op(instruction[28:24]),
					.OP_ALU(OP_ALU),
					.OP_TF(OP_TF),
					.OP_SE(OP_SE),
					.W_PC(W_PC),
					.W_DM(W_DM),
					.W_IM(W_IM),
					.W_RB(W_RB),
					.W_RF(W_RF),
					.S_MXPC(S_MXPC),
					.S_MXRB(S_MXRB),
					.S_MXSE(S_MXSE));

	signal_extender se(	.in(instruction[15:0]),
						.OP_SE(OP_SE),
						.out(outSE));

	register_bank rb(	.CLK(CLK),
						.RA(instruction[19:16]),
						.RB(instruction[15:12]),
						.WC(instruction[23:20]),
						.WPC(WPC),
						.W_RB(W_RB),
						.PRA(PRA),
						.PRB(PRB));

endmodule
