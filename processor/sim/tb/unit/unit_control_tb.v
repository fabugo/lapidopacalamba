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
	
	integer erro, i;
	
	reg [31:0] vecUC [0:loops];
	/*Testes por vetores
	[24:0](6)		tamanho		tipo (estagio)
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
		erro = 0;
		$display("\n---------------------------");
		$display("Executando teste da Unidade de Controle");
		$display("Total de testes: ");

		$readmemb ("data/tests/vecuc.in",vecUC); //Contém todos os tipos de instruções
		RESET = 1;//inicio do IF
		#5
		RESET = 0;
		for(i = 0; i < loops; i = i+1) begin
			@(W_PC) begin
				//-------------------- inicio do ID --------------------
				#10
					instr = {vecUC[i][25:18], 23'b0};
					#1
					if(vecUC[i][16] 	!= OP_SE)
						$display("Erro no Estado ID, sinal OP_SE: Esperado: %1b, Obtido: %1b", vecUC[i][16], OP_SE);
				
				//-------------------- inicio do EX --------------------
				#10
					if(vecUC[i][15:11]	!= OP_ALU) begin
						erro = erro + 1;
						$display("Erro no Estado EX, sinal OP_ALU: Esperado: %5b, Obtido: %5b", vecUC[i][15:11], OP_ALU);
					end
					if(vecUC[i][10:8]	!= OP_TF) begin
						erro = erro + 1;
						$display("Erro no Estado EX, sinal OP_TF: Esperado: %3b, Obtido: %3b", vecUC[i][10:8], OP_TF);
					end
					if(vecUC[i][7]		!= S_MXSE) begin
						erro = erro + 1;
						$display("Erro no Estado EX, sinal S_MXSE: Esperado: %1b, Obtido: %1b", vecUC[i][7], S_MXSE);
					end
					if(vecUC[i][6]		!= W_DM) begin
						erro = erro + 1;
						$display("Erro no Estado EX, sinal W_DM: Esperado: %1b, Obtido: %1b", vecUC[i][6], W_DM);
					end
				
				//-------------------- inicio do WB --------------------
				#10
					if(vecUC[i][5:3]	!= W_RF) begin
						erro = erro + 1;
						$display("Erro no Estado EX, sinal W_RF: Esperado: %3b, Obtido: %3b", vecUC[i][5:3], W_RF);
					end
					if(vecUC[i][2]		!= W_RB) begin
						erro = erro + 1;
						$display("Erro no Estado EX, sinal W_RB: Esperado: %1b, Obtido: %1b", vecUC[i][2], W_RB);
					end
					if(vecUC[i][1:0]	!= S_MXRB) begin
						erro = erro + 1;
						$display("Erro no Estado EX, sinal S_MXRB: Esperado: %2b, Obtido: %2b", vecUC[i][1:0], S_MXRB);
					end
			end
		end
	end
endmodule
