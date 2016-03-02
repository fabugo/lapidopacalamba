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
	wire		W_RB;
	wire[2:0]	W_RF;
	wire[1:0]	S_MXRB;
	wire		S_MXSE;

	wire		W_IM;
	reg 		RESET;
	unit_control uc(.CLK(CLK),
					.RESET(RESET),
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
					.S_MXRB(S_MXRB),
					.S_MXSE(S_MXSE));
	parameter loops = 5;
	integer erro,i;
	reg [31:0] vecUC [0:loops];
	/*Testes por vetores
	[25:0](6)		tamanho		tipo (estagio)
		[24:22]TYPE		3 		entrada	(ID)
		[21:17]OP		5		entrada	(ID)
		------------------------------------
		[16]OP_SE		1		saida	(ID)
		[15:11]OP_ALU	5		saida	(EX)
		[10:8]OP_TF		3		saida	(EX)
		[7]S_MXSE		1		saida	(EX)
		[6]W_DM			1		saida	(EX)
		[5:3]W_RF		3		saida	(WB)
		[2]W_RB			1		saida	(WB)
		[1:0]S_MXRB		2		saida	(WB)
	*/
	initial begin
		$display("\n---------------------------");
		$display("Executando teste da Unidade de Controle");
		$readmemb ("vecuc.in",vecUC);
		RESET = 1;//inicio do IF
		#5
		RESET = 0;
		for(i=0;i<loops;i=i+1)begin
			@(W_PC)begin
				#10//inicio do ID
				instr = {vecUC[i][25:18],23'b0};
				if(vecUC[i][16]!=OP_TF) $display("to com sono qro dormir");
				#10//inicio do EX
				if( vecUC[i][15:11]	!= OP_ALU 	||
					vecUC[i][10:8]	!= OP_TF 	||
					vecUC[i][7]	 	!= S_MXSE 	||
					vecUC[i][6]	 	!= W_DM 	)
					$display("to com sono qro dormir");
				#10//inicio do WB
				if( vecUC[i][5:3]	!= W_RF 	||
					vecUC[i][2]		!= W_RB 	||
					vecUC[i][1:0]	!= S_MXRB 	)
					$display("to com sono qro dormir");
			end
		end
		$display("Total de testes: ");
	end
endmodule
