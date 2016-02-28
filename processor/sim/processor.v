module processor();

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

	//ID id();

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
