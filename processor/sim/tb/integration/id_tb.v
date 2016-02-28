module id_tb();
reg 			CLK;
reg  [31:0] 	instruction,
 				WPC;
wire [31:0] 	PRA,
 				PRB,
    			outSE;
wire [2:0]		cond,
                OP_TF;
wire [4:0] 		OP_ALU;
wire 			W_PC,
 				W_DM,
 				W_MI,
 				W_RF,
 				S_MXPC,
 				S_MXSE;
wire [1:0] 		S_MXRB;

			ID id(
				.CLK(CLK),
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
				.S_MXSE(S_MXSE)
				);

	always #5 	CLK = ~CLK;
	initial begin
		$display("\n---------------------------");
		$display("Teste de integracao (ID)");
		CLK 		= 0;
		instruction = 0;
		WPC 		= 0;
		#100
		$display("Total de testes: ");
	end
endmodule
