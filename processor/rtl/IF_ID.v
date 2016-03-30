module IF_ID(	input 	wire 		CLK,

				input 	wire 		pc_RESET,
				input 	wire 		im_RESET,
				input 	wire 		im_read_file,
				input 	wire 		im_write_file,
				input 	wire 		im_WE,
				input 	wire[31:0] 	im_DATA,
				input	wire 		rb_RESET,
				input	wire 		tf_RESET,
				
				input	wire[3:0]	in_flags,
				input	wire[31:0]	in_WPC,
				input	wire 		in_W_RB,

				output	wire[3:0]	out_RA,
				output	wire[3:0]	out_RB,
				output	wire[3:0]	out_WC,
				output	wire[31:0]	out_PC,
				output	wire[31:0]	out_PRA,
				output	wire[31:0]	out_PRB,
				output	wire[31:0]	out_se_out,
				output	wire		out_S_MXSE,
				output	wire[4:0]	out_OP_ALU,
				output	wire		out_W_DM,
				output	wire[1:0]	out_S_MXRB,
				output	wire		out_W_RB);

	wire[31:0]	se_out, PRB, add_out;
	wire[1:0]	tf_out;
	wire[31:0]	mxpc_out;
	wire[31:0]	pc_out;
	wire[31:0]	instruction;

	wire		OP_SE;
	wire[2:0]	OP_TF;

	assign out_PRA = PRB;

	mx_pc mxpc(				.in_SE(se_out),
							.in_RB(PRB),
							.in_ADD(add_out),
							.S_MXPC(tf_out),
							.out(mxpc_out));

	program_counter pc( 	.CLK(CLK),
							.RESET(pc_RESET),
							.in(mxpc_out),
							.out(pc_out));

	adder32 add(			.A(pc_out),
							.B(32'b1),
							.carryIn(1'b0),
							.result(add_out),
							.carryOut(),
							.overflow());

	instruction_memory im(	.CLK(CLK),
							.RESET(im_RESET),
							.read_file(im_read_file),
							.write_file(im_write_file),
							.WE(im_WE),
							.ADDRESS(pc_out[9:0]),
							.DATA(im_DATA),
							.Q(instruction));

	register_bank rb(		.CLK(CLK),
							.RESET(rb_RESET),
							.RA(instruction[19:16]),
							.RB(instruction[15:12]),
							.WC(instruction[23:20]),
							.WPC(in_WPC),
							.W_RB(in_W_RB),
							.PRA(out_PRA),
							.PRB(PRB));

	signal_extender se(		.in(instruction[15:0]),
							.OP_SE(OP_SE),
							.out(se_out));

	signal_generator sg(	.type(instruction[31:29]),
							.op(instruction[28:24]),
							.OP_ALU(out_OP_ALU),
							.OP_TF(OP_TF),
							.OP_SE(OP_SE),
							.W_DM(out_W_DM),
							.W_RB(out_W_RB),
							.S_MXRB(out_S_MXRB),
							.S_MXSE(out_S_MXSE));

	tester_flags tf(		.RESET(tf_RESET),
							.O(in_flags[0]),
							.S(in_flags[1]),
							.C(in_flags[2]),
							.Z(in_flags[3]),
							.cond(instruction[14:12]),
							.OP_TF(OP_TF),
							.out(tf_out));

endmodule
