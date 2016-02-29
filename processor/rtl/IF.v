module IF(	input 	wire 		CLK,

			input 	wire[31:0]	alu_result,
			input 	wire 		tf_out,
			output 	wire[31:0]	mxpc_out,

			input	wire 		im_read_file,
			input	wire 		im_write_file,
			input	wire[31:0] 	im_DATA,		//Apenas para teste
			input	wire 	 	im_WE,			//Apenas para teste
			output 	wire[31:0]	im_instruction,

			input	wire 		uc_W_PC);

	wire[31:0] add_out; //pc+1
	wire[31:0] pc_out;

	mx_pc mxpc(	.in_ALU(alu_result),
				.in_ADD(add_out),
				.S_MXPC(tf_out),
				.out(mxpc_out));

	adder32 add(.A(pc_out),
				.B(32'b1),
				.carryIn(1'b0),
				.result(add_out),
				.carryOut(),
				.overflow());

	program_counter pc( .in(mxpc_out),
						.W_PC(uc_W_PC),
						.CLK(CLK),
						.out(pc_out));

	instruction_memory im(	.read_file(im_read_file),
							.write_file(im_write_file),
							.WE(im_WE),
							.CLK(CLK),
							.ADDRESS(pc_out[9:0]),
							.DATA(im_DATA),
							.Q(im_instruction));

endmodule
