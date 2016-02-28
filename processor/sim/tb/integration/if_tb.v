module if_tb();
	reg 		CLK;
	reg[31:0]	alu_result;
	reg 		tf_out;
	wire[31:0]	mxpc_out;
	reg 		im_read_file;
	reg 		im_write_file;
	reg[31:0] 	im_DATA;
	reg 	 	im_WE;
	wire[31:0]	im_instruction;
	reg 		pc_WPC;

	IF id(	.CLK(CLK),
			.alu_result(alu_result),
			.tf_out(tf_out),
			.mxpc_out(mxpc_out),
			.im_read_file(im_read_file),
			.im_write_file(im_write_file),
			.im_DATA(im_DATA),
			.im_WE(im_WE),
			.im_instruction(im_instruction),
			.pc_WPC(pc_WPC));

	always #5 	CLK = ~CLK;
	initial begin
		$display("\n---------------------------");
		$display("Teste de integracao (IF)");
		$display("Total de testes: ");
				CLK=			0;
				tf_out=			0;
				pc_WPC=			0;
				im_read_file=	0;
				im_write_file=	0;
				im_WE=			0;
				alu_result=		0;
				im_DATA=		0;
			#100
			im_read_file = 1;
			#100
			im_read_file = 0;
	end
endmodule
