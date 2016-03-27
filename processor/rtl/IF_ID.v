module IF_ID(	input wire CLK,
				//mux
				input 	wire[31:0]	alu_result,
				input 	wire 		tf_out,
				output 	wire[31:0]	mxpc_out,
				//IM
				input	wire 		im_RESET,
				input	wire 		im_read_file,
				input	wire 		im_write_file,
				input	wire[31:0] 	im_DATA,		//Apenas para teste
				input	wire 	 	uc_W_IM,		//Apenas para teste
				output 	wire[31:0]	im_instruction,
				//PC
				input	wire 		pc_RESET,
				input	wire 		uc_W_PC
				//RB
				input 	wire		rb_RESET,
				input	wire[31:0]	rb_WPC,
				
	);

wire 			tf_out;
wire 	[31:0]	mxpc_out;
wire 	[31:0]	add_out;
//IF
mx_pc mxpc(				.in_ALU(alu_result),
						.in_ADD(add_out),
						.S_MXPC(tf_out),
						.out(mxpc_out));

program_counter pc( 	.CLK(CLK),
						.RESET(pc_RESET),
						.in(mxpc_out),
						.W_PC(uc_W_PC),
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
						.WE(uc_W_IM),
						.ADDRESS(pc_out[9:0]),
						.DATA(im_DATA),
						.Q(im_instruction));
//ID
signal_generator sg(

	);
//RF
register_bank rb(

	);
//AC
signal_extender se(

	);
//JC
tester_flags tf(

	);
endmodule
