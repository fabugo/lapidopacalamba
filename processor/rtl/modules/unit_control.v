module unit_control(	input 	wire		CLK,
						input	wire		RESET,
						input 	wire[2:0]	type,
						input 	wire[4:0]	op,
						output 	reg	[4:0]	OP_ALU,
						output 	reg	[2:0]	OP_TF,
						output 	reg			OP_SE,
						output 	reg			W_PC,
						output 	reg			W_DM,
						output 	reg			W_IM,
						output 	reg			W_RB,
						output 	reg [2:0]	W_RF,
						output 	reg	[1:0]	S_MXRB,
						output 	reg			S_MXSE);

	reg[1:0] STATE, NEXT;
	parameter 	IF = 2'b00,
				ID = 2'b01,
				EX = 2'b11,
				WB = 2'b10;

	reg	[4:0]	reg_OP_ALU;
	reg	[2:0]	reg_OP_TF;
	reg			reg_W_DM;
	reg			reg_W_RB;
	reg	[2:0]	reg_W_RF;
	reg	[1:0]	reg_S_MXRB;
	reg			reg_S_MXSE;

	always @(posedge RESET) begin
		STATE 		<= 2'bxx;
		NEXT 		<= IF;
		OP_ALU 		<= 5'b00000; 	//nao importa
		OP_TF 		<= 3'b111;		//nao importa
		OP_SE 		<= 1'b0;		//nao importa
		W_PC 		<= 1'b0;		//nao registra a entrada
		W_DM 		<= 1'b0;		//nao escreve nenhum dado
		W_RB 		<= 1'b0;		//nao escreve nenhum dado
		W_RF 		<= 3'b0;		//nao registra nenhuma flag
		W_IM 		<= 1'b0;		//nao importa
		S_MXRB 		<= 2'b0;		//nao importa
		S_MXSE 		<= 1'b0;		//nao importa
		reg_OP_ALU 	<= 0;
		reg_OP_TF 	<= 0;
		reg_W_DM 	<= 0;
		reg_W_RB 	<= 0;
		reg_W_RF 	<= 0;
		reg_S_MXRB 	<= 0;
		reg_S_MXSE 	<= 0;
	end

	always @(STATE) begin
		NEXT = IF;
		case(STATE)
			IF : NEXT = ID;
			ID : NEXT = EX;
			EX : NEXT = WB;
			WB : NEXT = IF;
			default : NEXT = IF;
		endcase
	end

	always @(posedge CLK) STATE <= NEXT;

	always @(*) begin
		case(STATE)
			IF: begin
				OP_SE 	= 1'b0;			//nao importa
				W_PC 	= 1'b0;			//registra a entrada
				W_DM 	= 1'b0;			//nao escreve nenhum dado
				W_RB 	= 1'b0;			//nao escreve nenhum dado
				W_RF 	= 3'b0;			//nao registra nenhuma flag
				W_IM 	= 1'b0;			//nao importa
				S_MXRB 	= 2'b0;			//nao importa
				S_MXSE 	= 1'b0;			//nao importa
			end
			ID: begin
				OP_ALU 	= 5'b00000; 	//nao importa
				OP_TF 	= 3'b111;		//nao importa
				OP_SE 	= 1'b0;			//nao importa
				W_PC 	= 1'b0;			//nao registra a entrada
				W_DM 	= 1'b0;			//nao escreve nenhum dado
				W_RB 	= 1'b0;			//nao escreve nenhum dado
				W_RF 	= 3'b0;			//nao registra nenhuma flag
				W_IM 	= 1'b0;			//nao importa
				S_MXRB 	= 2'b0;			//nao importa
				S_MXSE 	= 1'b0;			//nao importa

				case(type)
					3'b001: begin 					//Operações da ALU
							reg_OP_ALU 	= op;
							reg_OP_TF 	= 3'b111;
							reg_W_RB 	= 1'b1;
							reg_W_DM 	= 1'b0;
							reg_S_MXSE 	= 1'b0;
							reg_S_MXRB 	= 2'b10;

						// Define o sinal que define quais flags serão atualizadas
						if(op == 5'b11111 || op == 5'b10011)			//ones e passb, não atualizam nenhuma
							reg_W_RF 	= 3'b000;
						else if(op == 5'b10000)		//zeros, atualiza Z
							reg_W_RF 	= 3'b001;
						else if(op[4:3] == 2'b01)	//atualiza S C Z
							reg_W_RF 	= 3'b011;
						else if(op[4:3] == 2'b00)	//atualiza O S C Z
							reg_W_RF 	= 3'b100;
						else 						//atualiza S Z
							reg_W_RF 	= 3'b010;
					end
					3'b010: begin 					//Operações de Constante
						OP_SE	= 1'b1;
						reg_OP_ALU 	= op;
						reg_OP_TF 	= 3'b111;
						reg_W_RB 	= 1'b1;
						reg_W_DM 	= 1'b0;
						reg_W_RF 	= 3'b000;
						reg_S_MXSE 	= 1'b1;
						reg_S_MXRB 	= 2'b10;
					end
					3'b100: begin 					//Operações de Memória
						reg_OP_TF 	= 3'b111;
						reg_W_RB 	= ~op[0];
						reg_W_DM 	= op[0];
						reg_W_RF 	= 3'b000;
						reg_S_MXSE 	= 1'b0;
						reg_S_MXRB 	= 2'b01;
					end
					3'b000: begin 					//Operações de Desvio
						OP_SE 	= 1'b0;
						reg_OP_ALU 	= 5'b10011;
						reg_OP_TF 	= {op[2], op[1], op[0]};
						reg_W_RB 	= 1'b0;
						reg_W_DM 	= 1'b0;
						reg_S_MXSE 	= 1'b1;
						reg_W_RF 	= 3'b000;
						reg_S_MXRB 	= 2'b00;
					end
					3'b110: begin 					//jal e jr
						OP_SE 	= 1'b0;
						reg_OP_ALU 	= 5'b10011;
						reg_OP_TF 	= {op[2], op[1], op[0]};
						reg_W_RB 	= (reg_OP_TF == 3'b011) ? 1'b1 : 1'b0;
						reg_W_DM 	= 1'b0;
						reg_S_MXSE 	= 1'b0;
						reg_W_RF 	= 3'b000;
						reg_S_MXRB 	= 2'b00;
					end
				endcase
			end

			EX: begin
				S_MXSE 	= reg_S_MXSE;
				OP_ALU 	= reg_OP_ALU;
				W_DM 	= reg_W_DM;
				OP_TF 	= reg_OP_TF;
			end

			WB: begin
				S_MXRB 	= reg_S_MXRB;
				W_RF 	= reg_W_RF;
				W_RB 	= reg_W_RB;
				W_PC	= 1'b1;
			end
		endcase
	end
endmodule
