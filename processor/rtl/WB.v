module WB(	input	wire[3:0]	in_WC,
			input	wire[31:0]	in_PC,
			input	wire[31:0]	in_PR,
			input	wire[31:0]	in_alu_res,
			input	wire[1:0]	in_S_MXRB,
			input	wire		in_W_RB,

			output	wire[31:0]	out_WPC,
			output	wire		out_W_RB);
	
	wire[31:0] mxrb_out;

	assign out_W_RB = in_W_RB;
	assign out_WPC 	= mxrb_out;

	mx_rb mxrb(	.in_PC(in_PC),
				.in_DM(in_PR),
				.in_ALU(in_alu_res),
				.S_MXRB(in_S_MXRB),
				.out(mxrb_out));

endmodule