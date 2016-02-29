module id_tb();
	reg			CLK;
	reg [31:0]	im_instruction;
	reg [31:0]	rb_WPC;
	wire[31:0]	rb_PRA;
	wire[31:0]	rb_PRB;
	wire[31:0]	se_out;
	wire[4:0]	uc_OP_ALU;
	wire[2:0]	uc_OP_TF;
	wire		uc_W_PC;
	wire		uc_W_DM;
	wire		uc_W_IM;
	wire		uc_W_RF;
	wire		uc_S_MXPC;
	wire[1:0]	uc_S_MXRB;
	wire		uc_S_MXSE;

	ID id(	.CLK(CLK),
			.im_instruction(im_instruction),
			.rb_WPC(rb_WPC),
			.rb_PRA(rb_PRA),
			.rb_PRB(rb_PRB),
			.se_out(se_out),
			.uc_OP_ALU(uc_OP_ALU),
			.uc_OP_TF(uc_OP_TF),
			.uc_W_PC(uc_W_PC),
			.uc_W_DM(uc_W_DM),
			.uc_W_IM(uc_W_IM),
			.uc_W_RF(uc_W_RF),
			.uc_S_MXPC(uc_S_MXPC),
			.uc_S_MXRB(uc_S_MXRB),
			.uc_S_MXSE(uc_S_MXSE));

	always #5 	CLK = ~CLK;
	initial begin
		$display("\n---------------------------");
		$display("Teste de integracao (ID)");
		$display("Total de testes: ");
		CLK 		= 0;
		im_instruction = 0;
		rb_WPC 		= 0;
		#100;
	end
endmodule
