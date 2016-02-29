module processor();
	reg CLK;
	initial CLK = 0;
	always @(CLK) #5 CLK = ~CLK;

	wire[31:0]	mxpc_out;
	reg 		im_read_file;
	reg 		im_write_file;
	wire[31:0]	im_instruction;

	wire[31:0]	rb_PRA;
	wire[31:0]	rb_PRB;
	wire[31:0]	se_out;
	wire[4:0]	uc_OP_ALU;
	wire[2:0]	uc_OP_TF;
	wire		uc_W_PC;
	wire		uc_W_DM;
	wire		uc_W_IM;
	wire[2:0]	uc_W_RF;
	wire		uc_S_MXPC;
	wire[1:0]	uc_S_MXRB;
	wire		uc_S_MXSE;

	wire 		tf_out;
	wire[31:0]	dm_Q;
	wire[31:0]	alu_result;
	wire 		alu_O;
	wire 		alu_S;
	wire 		alu_C;
	wire 		alu_Z;

	wire[31:0]	mxrb_out;
	wire 		rf_O;
	wire 		rf_S;
	wire 		rf_C;
	wire 		rf_Z;

	IF iff(	.CLK(CLK),
			.alu_result(alu_result),
			.tf_out(tf_out),
			.mxpc_out(mxpc_out),
			.im_read_file(im_read_file),
			.im_write_file(im_write_file),
			.im_DATA(),
			.im_WE(),
			.im_instruction(im_instruction),
			.pc_WPC(uc_W_PC));

	ID id(	.CLK(CLK),
			.im_instruction(im_instruction),
			.rb_WPC(mxrb_out),
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

	EX ex(	.CLK(CLK),
			.rb_PRA(rb_PRA),
			.rb_PRB(rb_PRB),
			.se_out(se_out),
			.uc_S_MXSE(uc_S_MXSE),
			.rf_O(rf_O),
			.rf_S(rf_S),
			.rf_C(rf_C),
			.rf_Z(rf_Z),
			.tf_cond(im_instruction[14:12]),
			.uc_OP_TF(uc_OP_TF),
			.tf_out(tf_out),
			.dm_read_file(dm_read_file),
			.dm_write_file(dm_write_file),
			.uc_WE(uc_WE),
			.dm_Q(dm_Q),
			.uc_OP_ALU(uc_OP_ALU),
			.alu_result(alu_result),
			.alu_O(alu_O),
			.alu_S(alu_S),
			.alu_C(alu_C),
			.alu_Z(alu_Z));

	WB wb(	.CLK(CLK),
			.mxpc_out(mxpc_out),
			.dm_Q(dm_Q),
			.alu_result(alu_result),
			.uc_S_MXRB(uc_S_MXRB),
			.mxrb_out(mxrb_out),
			.alu_O(alu_O),
			.alu_S(alu_S),
			.alu_C(alu_C),
			.alu_Z(alu_Z),
			.uc_W_RF(uc_W_RF),
			.rf_O(rf_O),
			.rf_S(rf_S),
			.rf_C(rf_C),
			.rf_Z(rf_Z));

endmodule
