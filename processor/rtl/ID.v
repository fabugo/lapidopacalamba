module ID(	input	wire		CLK,
	
			input	wire[31:0]	im_instruction,

			input	wire[31:0]	rb_WPC,
			output	wire[31:0]	rb_PRA,
			output	wire[31:0]	rb_PRB,

			output	wire[31:0]	se_out,

			input 	wire		uc_RESET,

			output	wire[4:0]	uc_OP_ALU,
			output	wire[2:0]	uc_OP_TF,
			output	wire		uc_W_PC,
			output	wire		uc_W_DM,
			output	wire		uc_W_IM,
			output	wire[2:0]	uc_W_RF,
			output	wire		uc_S_MXPC,
			output  wire[1:0]	uc_S_MXRB,
			output	wire		uc_S_MXSE);

	wire OP_SE;
	wire W_RB;

	unit_control uc(.CLK(CLK),
					.type(im_instruction[31:29]),
					.op(im_instruction[28:24]),
					.RESET(uc_RESET),
					.OP_ALU(uc_OP_ALU),
					.OP_TF(uc_OP_TF),
					.OP_SE(OP_SE),
					.W_PC(uc_W_PC),
					.W_DM(uc_W_DM),
					.W_IM(uc_W_IM),
					.W_RB(uc_W_RB),
					.W_RF(uc_W_RF),
					.S_MXPC(uc_S_MXPC),
					.S_MXRB(uc_S_MXRB),
					.S_MXSE(uc_S_MXSE));

	signal_extender se(	.in(im_instruction[15:0]),
						.OP_SE(OP_SE),
						.out(se_out));

	register_bank rb(	.CLK(CLK),
						.RA(im_instruction[19:16]),
						.RB(im_instruction[15:12]),
						.WC(im_instruction[23:20]),
						.WPC(rb_WPC),
						.W_RB(W_RB),
						.PRA(rb_PRA),
						.PRB(rb_PRB));

endmodule
