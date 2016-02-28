module ex_tb();

	reg 		CLK;
	reg	[31:0]	rb_PRA;
	reg	[31:0]	rb_PRB;
	reg	[31:0]	se_out;
	reg 		mxse_SMXSE;
	reg 		rf_O;
	reg 		rf_S;
	reg 		rf_C;
	reg 		rf_Z;
	reg	[2:0]	tf_cond;
	reg	[2:0]	tf_OPTF;
	wire 		tf_out;
	reg 		dm_read_file;
	reg 		dm_write_file;
	reg 		dm_WDM;
	wire[31:0]	dm_Q;
	reg	[4:0]	alu_OPALU;
	wire[31:0]	alu_result;
	wire 		alu_O;
	wire 		alu_S;
	wire 		alu_C;
	wire 		alu_Z;

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

	initial begin
		$display("\n---------------------------");
		$display("Teste de integracao (EX)");
		$display("Total de testes: ");
	end
endmodule