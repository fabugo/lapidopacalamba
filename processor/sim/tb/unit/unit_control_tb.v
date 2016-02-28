`include "rtl\\Defines.vh"

module unit_control_tb;
	reg CLK;
	initial CLK = 0;
	always #5 CLK = ~CLK;

	reg [31:0]	instr;
	reg	[4:0]	OP_ALU;
	reg	[2:0]	OP_TF;
	wire		OP_SE, W_PC, W_DM, W_MI, W_RB, W_RF, S_MXPC, S_MXSE;
	reg	[1:0]	S_MXRB;
	unit_control u2(.CLK(CLK), .type(instr[31:29]), .OP(instr[28:24]), .OP_SE(OP_SE), .W_PC(W_PC), .W_DM(W_DM), .W_MI(W_MI), .W_RB(W_RB), .W_RF(W_RF), .S_MXPC(S_MXPC), .S_MXRB(S_MXRB), .S_MXSE(S_MXSE));

	integer erro;

	initial begin
		$display("\n---------------------------");
		$display("Executando teste da Unidade de Controls");
		$display("Total de testes: ");

		// Operacões Artimetica
		instr = {`ADD, {27{1'b0}}};
		#5

		instr = {`ADDINC, {27{1'b0}}};
		#1

		instr = {`INCA, {27{1'b0}}};
		#1

		instr = {`SUBDEC, {27{1'b0}}};
		#1

		instr = {`SUB, {27{1'b0}}};
		#1

		instr = {`DECA, {27{1'b0}}};
		#1


		// Operacões de Deslocamento
		instr = {`LSL, {27{1'b0}}};
		#1

		instr = {`ASR, {27{1'b0}}};
		#1


		// Operacões Lógicas
		instr = {`ZEROS, {27{1'b0}}};
		#1

		instr = {`AND, {27{1'b0}}};
		#1

		instr = {`ANDNOTA, {27{1'b0}}};
		#1

		instr = {`PASSB, {27{1'b0}}};
		#1

		instr = {`ANDNOTB, {27{1'b0}}};
		#1

		instr = {`PASSA, {27{1'b0}}};
		#1

		instr = {`XOR, {27{1'b0}}};
		#1

		instr = {`OR, {27{1'b0}}};
		#1

		instr = {`NAND, {27{1'b0}}};
		#1

		instr = {`XNOR, {27{1'b0}}};
		#1

		instr = {`PASSNOTA, {27{1'b0}}};
		#1

		instr = {`ORNOTA, {27{1'b0}}};
		#1

		instr = {`PASSNOTB, {27{1'b0}}};
		#1

		instr = {`ORNOTB, {27{1'b0}}};
		#1

		instr = {`NOR, {27{1'b0}}};
		#1

		instr = {`ONES, {27{1'b0}}};
		#1


		// Operacões de Desvio
		instr = {`JUMPER, {27{1'b0}}};
		#1

		instr = {`JT, {27{1'b0}}};
		#1

		instr = {`JF, {27{1'b0}}};
		#1

		instr = {`JAL, {27{1'b0}}};
		#1

		instr = {`JR, {27{1'b0}}};
		#1;

	end
endmodule
