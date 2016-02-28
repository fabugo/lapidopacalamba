module processor();
	reg CLK;
	initial CLK = 0;
	always @(CLK) #5 CLK = ~CLK;

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

	IF if(	.CLK(CLK),
			.S_MXPC(S_MXPC),
			.W_PC(W_PC),
			.read_file(read_file),
			.write_file(write_file),
			.WE(WE),
			.dataALU(dataALU),
			.DATA(DATA),
			.nextPCout(nextPCout),
			.instruction(instruction));

	ID id(	.CLK(CLK),
			.instruction(instruction),
			.WPC(WPC),
			.PRA(PRA),
			.PRB(PRB),
			.outSE(outSE),
			.cond(cond),
			.OP_ALU(OP_ALU),
			.OP_TF(OP_TF),
			.W_PC(W_PC),
			.W_DM(W_DM),
			.W_IM(W_IM),
			.W_RF(W_RF),
			.S_MXPC(S_MXPC),
			.S_MXRB(S_MXRB),
			.S_MXSE(S_MXSE));

	EX ex(	.CLK(CLK),
			.rb_PRA(rb_PRA),
			.rb_PRB(rb_PRB),
			.se_out(se_out),
			.mxse_SMXSE(mxse_SMXSE),
			.rf_O(rf_O),
			.rf_S(rf_S),
			.rf_C(rf_C),
			.rf_Z(rf_Z),
			.tf_cond(tf_cond),
			.tf_OPTF(tf_OPTF),
			.tf_out(tf_out),
			.dm_read_file(dm_read_file),
			.dm_write_file(dm_write_file),
			.dm_WDM(dm_WDM),
			.dm_Q(dm_Q),
			.alu_OPALU(alu_OPALU),
			.alu_result(alu_result),
			.alu_O(alu_O),
			.alu_S(alu_S),
			.alu_C(alu_C),
			.alu_Z(alu_Z));

	WB wb(	.CLK(CLK),
			.mxpc_out(mxpc_out),
			.dm_Q(dm_Q),
			.alu_result(alu_result),
			.mxrb_SMXRB(mxrb_SMXRB),
			.mxrb_out(mxrb_out),
			.alu_O(alu_O),
			.alu_S(alu_S),
			.alu_C(alu_C),
			.alu_Z(alu_Z),
			.rf_WRF(rf_WRF),
			.rf_O(rf_O),
			.rf_S(rf_S),
			.rf_C(rf_C),
			.rf_Z(rf_Z));

endmodule
