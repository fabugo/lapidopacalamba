module wb_tb();

	reg 		CLK;
	reg	[31:0]	mxpc_out;
	reg	[31:0]	dm_Q;
	reg	[31:0]	alu_result;
	reg	[1:0]	mxrb_SMXRB;
	wire[31:0]	mxrb_out;
	reg 		alu_O;
	reg 		alu_S;
	reg 		alu_C;
	reg 		alu_Z;
	reg	[2:0]	rf_WRF;
	wire 		rf_O;
	wire 		rf_S;
	wire 		rf_C;
	wire 		rf_Z;

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

	initial begin
		$display("\n---------------------------");
		$display("Teste de integracao (WB)");
		$display("Total de testes: ");
	end
endmodule