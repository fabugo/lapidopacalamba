module EX_MEM(	input 	wire 		CLK,

				input	wire 		dm_RESET,
				input 	wire 		dm_read_file,
				input 	wire 		dm_write_file,

				input	wire		in_mxrb,
				input	wire[3:0]	in_wb_RA,
				input	wire[3:0]	in_wb_RB,

				input	wire[3:0]	in_ex_RA,
				input	wire[3:0]	in_ex_RB,
				input	wire[3:0]	in_WC,
				input	wire[31:0]	in_PC,
				input	wire[31:0]	in_PRA,
				input	wire[31:0]	in_PRB,
				input	wire[31:0]	in_se_out,
				input	wire 		in_S_MXSE,
				input	wire[4:0]	in_OP_ALU,
				input	wire 		in_W_DM,
				input	wire[1:0]	in_S_MXRB,
				input	wire 		in_W_RB,

				output	wire[3:0]	out_RA,
				output	wire[3:0]	out_RB,
				output	wire[3:0]	out_WC,
				output	wire[31:0]	out_PC,
				output	wire[31:0]	out_PR,
				output	wire[31:0]	out_alu_res,
				output	wire[3:0]	out_flags,
				output	wire[1:0]	out_S_MXRB,
				output	wire		out_W_RB);

	wire		fu_a;
	wire[31:0]	mxa_out;
	
	wire 		fu_b;
	wire[31:0]	mxb_out;

	assign out_RA 		= in_ex_RA;
	assign out_RB 		= in_ex_RB;
	assign out_WC 		= in_WC;
	assign out_PC 		= in_PC;
	assign out_S_MXRB 	= in_S_MXRB;
	assign out_W_RB 	= in_W_RB;

	mx_a mxa(		.in_PRA(in_PRA),
					.in_mxrb(in_mxrb),
					.forward(fu_a),
					.out(mxa_out));

	mx_b mxb(		.in_PRB(in_PRB),
					.in_SE(in_se_out), 
					.in_mxrb(in_mxrb), 
					.forward(fu_b), 
					.S_MXSE(in_S_MXSE),
					.out(mxb_out));

	alu alu(		.OP(in_OP_ALU),
					.A(mxa_out),
					.B(mxb_out),
					.result(out_alu_res),
					.O(out_flags[0]),
					.S(out_flags[1]),
					.C(out_flags[2]),
					.Z(out_flags[3]));

	forward_unit fu(.ex_RA(in_ex_RA),
					.ex_RB(in_ex_RB),
					.wb_RA(in_wb_RA),
					.wb_RB(in_wb_RB),
					.out_A(fu_a),
					.out_B(fu_b));

	data_memory dm(	.CLK(CLK),
					.RESET(dm_RESET),
					.read_file(dm_read_file),
					.write_file(dm_write_file),
					.WE(in_W_DM),
					.ADDRESS(in_PRB[9:0]),
					.DATA(in_PRA),
					.Q(out_PR));
	
endmodule
