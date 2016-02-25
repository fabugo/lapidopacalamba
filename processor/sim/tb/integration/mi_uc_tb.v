module mi_uc_tb();
	reg CLK;
	initial CLK = 0;
	always #5 CLK = ~CLK;

	reg			read_file;
	reg			write_file;
	reg			WE;
	reg [9:0]	ADRESS;
	reg [31:0]	DATA;
	wire [31:0]	Q;
	ram u1(.read_file(readFile), .write_file(write_file), .WE(WE), .clk(CLK), .ADRESS(ADRESS), .DATA(DATA), .Q(Q));

	reg	[4:0]	OP_ALU;
	reg	[2:0]	OP_TF;
	wire		OP_SE, W_PC, W_DM, W_MI, W_RB, W_RF, S_MXPC, S_MXSE;
	reg	[1:0]	S_MXRB;
	unit_control u2(.CLK(CLK), .type(Q[31:29]), .OP(Q[28:24]), .OP_SE(OP_SE), .W_PC(W_PC), .W_DM(W_DM), .W_MI(W_MI), .W_RB(W_RB), .W_RF(W_RF), .S_MXPC(S_MXPC), .S_MXRB(S_MXRB), .S_MXSE(S_MXSE));

	initial begin
		$display("\n---------------------------");
		$display("Teste de integracao (MI - UC)");
		$display("Total de testes: ");
	end
endmodule