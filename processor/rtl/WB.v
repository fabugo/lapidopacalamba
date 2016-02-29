module WB(	input 	wire 		CLK,

			input 	wire[31:0]	mxpc_out,	//Saída do mux mxpc
			input 	wire[31:0]	dm_Q,		//Saída da memória de dados
			input 	wire[31:0]	alu_result,	//Saída da ula
			input 	wire[1:0]	uc_S_MXRB,
			output 	wire[31:0]	mxrb_out,

			input 	wire 		alu_O,
			input 	wire 		alu_S,
			input 	wire 		alu_C,
			input 	wire 		alu_Z,
			input 	wire[2:0]	uc_W_RF,
			output 	wire 		rf_O,
			output 	wire 		rf_S,
			output 	wire 		rf_C,
			output 	wire 		rf_Z);

	mx_rb mxrb(	.in_PC(mxpc_out),
				.in_DM(dm_Q),
				.in_ALU(alu_result),
				.S_MXRB(uc_S_MXRB),
				.out(mxrb_out));

	register_flags rf(	.in_O(alu_O),
						.in_S(alu_S),
						.in_C(alu_C),
						.in_Z(alu_Z),
						.W_RF(uc_W_RF),
						.CLK(CLK),
						.out_O(rf_O),
						.out_S(rf_S),
						.out_C(rf_C),
						.out_Z(rf_Z));

endmodule
