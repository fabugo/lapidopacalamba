module EX(	input 	wire 		CLK,

			input	wire[31:0]	rb_PRA,
			input	wire[31:0]	rb_PRB,
			input	wire[31:0]	se_out,
			input	wire 		uc_S_MXSE,

			input 	wire 		tf_RESET,
			input 	wire 		rf_O,
			input 	wire 		rf_S,
			input 	wire 		rf_C,
			input 	wire 		rf_Z,
			input 	wire[2:0]	tf_cond,
			input 	wire[2:0]	uc_OP_TF,
			output 	wire 		tf_out,

			input 	wire 		dm_RESET,
			input 	wire 		dm_read_file,
			input 	wire 		dm_write_file,
			input 	wire 		uc_W_DM,
			output 	wire[31:0]	dm_Q,

			input 	wire[4:0]	uc_OP_ALU,
			output 	wire[31:0]	alu_result,
			output 	wire 		alu_O,
			output 	wire 		alu_S,
			output 	wire 		alu_C,
			output 	wire 		alu_Z);

	wire[31:0] mxse_out;

	tester_flags tf(.RESET(tf_RESET),
					.O(rf_O),
					.S(rf_S),
					.C(rf_C),
					.Z(rf_Z),
					.cond(tf_cond),
					.OP_TF(uc_OP_TF),
					.out(tf_out));

	data_memory dm(	.CLK(CLK),
					.RESET(dm_RESET),
					.read_file(dm_read_file),
					.write_file(dm_write_file),
					.WE(uc_W_DM),
					.ADDRESS(rb_PRB[9:0]),
					.DATA(rb_PRA),
					.Q(dm_Q));

	mx_se mxse(	.in_RB(rb_PRB),
				.in_SE(se_out),
				.S_MXSE(uc_S_MXSE),
				.out(mxse_out));

	alu alu(.OP(uc_OP_ALU),
			.A(rb_PRA),
			.B(mxse_out),
			.result(alu_result),
			.O(alu_O),
			.S(alu_S),
			.C(alu_C),
			.Z(alu_Z));

endmodule
