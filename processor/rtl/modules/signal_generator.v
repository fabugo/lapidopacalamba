module signal_generator(input 	wire[2:0]	type,
						input 	wire[4:0]	op,
						
						output 	reg			OP_SE,
						output 	reg	[2:0]	OP_TF,
						output 	reg	[1:0]	OP_FU,
						output 	reg			S_MXSE,
						output 	reg	[4:0]	OP_ALU,
						output 	reg	[2:0]	W_RF,
						output 	reg			W_DM,
						output 	reg	[1:0]	S_MXRB,
						output 	reg			W_RB);

	always @(*) begin
		case(type)
			3'b001: begin 					//Operações da ALU
				OP_TF 	= 3'b111;
				OP_FU 	= 2'b11;
				S_MXSE 	= 1'b0;
				OP_ALU 	= op;
				W_DM 	= 1'b0;
				S_MXRB 	= 2'b10;
				W_RB 	= 1'b1;

				// Define o sinal que define quais flags serão atualizadas
				//ones e passb, não atualizam nenhuma
				if(op == 5'b11111 || op == 5'b10011)	W_RF = 3'b000;
				//zeros, atualiza Z
				else if(op == 5'b10000)					W_RF = 3'b001;
				//atualiza S C Z
				else if(op[4:3] == 2'b01)				W_RF = 3'b011;
				//atualiza O S C Z
				else if(op[4:3] == 2'b00)				W_RF = 3'b100;
				//atualiza S Z
				else 									W_RF = 3'b010;
			end
			3'b010: begin 					//Operações de Constante
				OP_SE	= 1'b1;
				OP_TF 	= 3'b111;
				OP_FU 	= 2'b10;
				S_MXSE 	= 1'b1;
				OP_ALU 	= op;
				W_RF	= 3'b000;
				W_DM 	= 1'b0;
				S_MXRB 	= 2'b10;
				W_RB 	= 1'b1;
			end
			3'b100: begin 					//Operações de Memória
				OP_TF 	= 3'b111;
				OP_FU 	= 2'b11;
				S_MXSE 	= 1'b0;
				W_RF	= 3'b000;
				W_DM 	= op[0];
				S_MXRB 	= 2'b01;
				W_RB 	= ~op[0];
			end
			3'b000: begin 					//Operações de Desvio
				OP_SE 	= 1'b0;
				OP_TF 	= {op[2], op[1], op[0]};
				OP_FU 	= 2'b00;
				S_MXSE 	= 1'b1;
				OP_ALU 	= 5'b10011;
				W_RF	= 3'b000;
				W_DM 	= 1'b0;
				S_MXRB 	= 2'b00;
				W_RB 	= 1'b0;
			end
			3'b110: begin 					//jal e jr
				OP_SE 	= 1'b0;
				OP_TF 	= {op[2], op[1], op[0]};
				OP_FU 	= 2'b00;
				S_MXSE 	= 1'b0;
				OP_ALU 	= 5'b10011;
				W_RF	= 3'b000;
				W_DM 	= 1'b0;
				S_MXRB 	= 2'b00;
				W_RB 	= (OP_TF == 3'b011) ? 1'b1 : 1'b0;
			end
		endcase
	end
	
endmodule
