module if_tb();

	reg 		CLK;
	reg[31:0]	alu_result;
	reg 		tf_out;
	reg 		uc_W_PC;
	reg			pc_RESET;
	wire[31:0]	mxpc_out;

	reg 		im_read_file;
	reg 		im_write_file;
	reg[31:0] 	im_DATA;
	reg 	 	uc_W_IM;
	reg 	 	im_RESET;
	wire[31:0]	im_instruction;

	IF if_1(.CLK(CLK),
			.alu_result(alu_result),
			.tf_out(tf_out),
			.mxpc_out(mxpc_out),
			.im_RESET(im_RESET),
			.im_read_file(im_read_file),
			.im_write_file(im_write_file),
			.im_DATA(im_DATA),
			.uc_W_IM(uc_W_IM),
			.im_instruction(im_instruction),
			.pc_RESET(pc_RESET),
			.uc_W_PC(uc_W_PC));

	always #5 	CLK = ~CLK;
	initial begin
		CLK				=	0;
		tf_out			=	0;
		uc_W_PC			=	0;
		im_read_file	=	0;
		im_write_file	=	0;
		uc_W_IM			=	0;
		alu_result		=	0;
		im_DATA			=	0;
		$display("\n---------------------------");
		alu_result 	= 32'b0;
		tf_out 		= 0;
		uc_W_PC 	= 1;
		//			add r8, r12, r9
		im_DATA = 32'b00100000100011001001000000000000;
		uc_W_IM = 1;
		#10
		if(im_instruction != 32'b0) $display("ERRO!");
		//$display("Teste de integracao (IF)");
		//$display("Total de testes: ");

	end
endmodule
