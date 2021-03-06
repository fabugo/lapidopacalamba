module ex_tb();

	reg 		CLK;
	reg	[31:0]	rb_PRA;
	reg	[31:0]	rb_PRB;
	reg	[31:0]	se_out;
	reg 		uc_S_MXSE;
	reg 		tf_RESET;
	reg 		rf_O;
	reg 		rf_S;
	reg 		rf_C;
	reg 		rf_Z;
	reg	[2:0]	tf_cond;
	reg	[2:0]	uc_OP_TF;
	wire 		tf_out;
	reg 		dm_RESET;
	reg 		dm_read_file;
	reg 		dm_write_file;
	reg 		uc_W_DM;
	wire[31:0]	dm_Q;
	reg	[4:0]	uc_OP_ALU;
	wire[31:0]	alu_result;
	wire 		alu_O;
	wire 		alu_S;
	wire 		alu_C;
	wire 		alu_Z;

	EX ex(	.CLK(CLK),
			.rb_PRA(rb_PRA),
			.rb_PRB(rb_PRB),
			.se_out(se_out),
			.uc_S_MXSE(uc_S_MXSE),
			.tf_RESET(tf_RESET),
			.rf_O(rf_O),
			.rf_S(rf_S),
			.rf_C(rf_C),
			.rf_Z(rf_Z),
			.tf_cond(tf_cond),
			.uc_OP_TF(uc_OP_TF),
			.tf_out(tf_out),
			.dm_RESET(dm_RESET),
			.dm_read_file(dm_read_file),
			.dm_write_file(dm_write_file),
			.uc_W_DM(uc_W_DM),
			.dm_Q(dm_Q),
			.uc_OP_ALU(uc_OP_ALU),
			.alu_result(alu_result),
			.alu_O(alu_O),
			.alu_S(alu_S),
			.alu_C(alu_C),
			.alu_Z(alu_Z));

	initial begin
		$display("\n---------------------------");
		$display("Teste de integracao (EX)");
		rb_PRA 		= 32'b1;
		rb_PRB 		= 32'b0;
		se_out		= 2;
		uc_W_DM  		= 1;
		uc_OP_ALU 	= 5'b00000;
		uc_OP_TF	= 3'b111;
		uc_S_MXSE   = 0;
		$display("Total de testes: ");
	end
endmodule
