module IF(	input 	wire[31:0]	in_PC,
			input 	wire[31:0]	in_DM,
			input 	wire[31:0]	in_ALU,
			input 	wire[1:0]	S_MXRB,
			output 	wire[31:0]	out_mxrb,
			input 	wire 		in_O,
			input 	wire 		in_S,
			input 	wire 		in_C,
			input 	wire 		in_Z,
			input 	wire[2:0]	W_RF,
			input 	wire 		CLK,
			output 	wire 		out_O,
			output 	wire 		out_S,
			output 	wire 		out_C,
			output 	wire 		out_Z);
	
	mx_rb mxpc(	.in_PC(in_PC),
				.in_DM(in_DM),
				.in_ALU(in_ALU),
				.S_MXRB(S_MXRB),
				.out(out_mxrb)
	);

	register_flags rf(	.in_O(in_O),
						.in_S(in_S),
						.in_C(in_C),
						.in_Z(in_Z),
						.W_RF(W_RF),
						.CLK(CLK),
						.out_O(out_O),
						.out_S(out_S),
						.out_C(out_C),
						.out_Z(out_Z)
	);
endmodule
