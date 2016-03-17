module signal_generator(
	input 	wire[2:0]	type,
	input 	wire[4:0]	op,
	output 	reg	[4:0]	OP_ALU,
	output 	reg	[2:0]	OP_TF,
	output 	reg			OP_SE,
	output 	reg			W_PC,
	output 	reg			W_DM,
	output 	reg			W_IM,
	output 	reg			W_RB,

	output 	reg	[1:0]	S_MXRB,
	output 	reg			S_MXSE);
	always @(*) begin
		case(type)
			3'b001: begin 					//Operações da ALU
					OP_ALU 	= op;
					OP_TF 	= 3'b111;
					W_RB 	= 1'b1;
					W_DM 	= 1'b0;
					S_MXSE 	= 1'b0;
					S_MXRB 	= 2'b10;
			end
			3'b010: begin 					//Operações de Constante
				OP_SE	= 1'b1;
				OP_ALU 	= op;
				OP_TF 	= 3'b111;
				W_RB 	= 1'b1;
				W_DM 	= 1'b0;
				S_MXSE 	= 1'b1;
				S_MXRB 	= 2'b10;
			end
			3'b100: begin 					//Operações de Memória
				OP_TF 	= 3'b111;
				W_RB 	= ~op[0];
				W_DM 	= op[0];
				S_MXSE 	= 1'b0;
				S_MXRB 	= 2'b01;
			end
			3'b000: begin 					//Operações de Desvio
				OP_SE 	= 1'b0;
				OP_ALU 	= 5'b10011;
				OP_TF 	= {op[2], op[1], op[0]};
				W_RB 	= 1'b0;
				W_DM 	= 1'b0;
				S_MXSE 	= 1'b1;
				S_MXRB 	= 2'b00;
			end
			3'b110: begin 					//jal e jr
				OP_SE 	= 1'b0;
				OP_ALU 	= 5'b10011;
				OP_TF 	= {op[2], op[1], op[0]};
				W_RB 	= (OP_TF == 3'b011) ? 1'b1 : 1'b0;
				W_DM 	= 1'b0;
				S_MXSE 	= 1'b0;
				S_MXRB 	= 2'b00;
			end
		endcase
	end
endmodule
