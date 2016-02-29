`include "rtl\\Defines.vh"

module unit_control_tb;
	reg CLK;
	initial CLK = 0;
	always #5 CLK = ~CLK;

	reg [31:0]	instr;
	wire[4:0]	OP_ALU;
	wire[2:0]	OP_TF;
	wire		OP_SE;
	wire		W_PC;
	wire		W_DM;
	wire		W_IM;
	wire		W_RB;
	wire[2:0]	W_RF;
	wire		S_MXPC;
	wire[1:0]	S_MXRB;
	wire		S_MXSE;


	unit_control uc(.CLK(CLK),
					.type(instr[31:29]),
					.op(instr[28:24]),
					.OP_ALU(OP_ALU),
					.OP_TF(OP_TF),
					.OP_SE(OP_SE),
					.W_PC(W_PC),
					.W_DM(W_DM),
					.W_IM(W_IM),
					.W_RB(W_RB),
					.W_RF(W_RF),
					.S_MXPC(S_MXPC),
					.S_MXRB(S_MXRB),
					.S_MXSE(S_MXSE));

	integer erro;

	initial begin
		$display("\n---------------------------");
		$display("Executando teste da Unidade de Controle");
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
