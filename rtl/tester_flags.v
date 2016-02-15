module tester_flags(
			input 	wire		O,
			input 	wire		S,
			input 	wire		C,
			input 	wire		Z,
			input 	wire[2:0]	cond,
			input	wire[2:0]	OP_TF,
			output 	reg			out);

	always @(O or S or C or Z or cond or OP_TF) begin
		case(OP_TF) 								//out = 0, pula; out = 1, não pula
			3'b111: 			out = 1'b1; 		//Não pula
			3'b000: begin
				case(cond)
					3'b000: 	out = 1'b1;			//jf.true 		-> nunca pula
					3'b001: 	out = S;			//jf.neg		-> pula se (S == 0)
					3'b010: 	out = Z;			//jf.zero		-> pula se (Z == 0)
					3'b100: 	out = C;			//jf.carry		-> pula se (C == 0)
					3'b101: 	out = and(S, Z);	//jf.negzero	-> pula se ((S && Z) == 0)
					3'b111: 	out = O;			//jf.overflow	-> pula se (O == 0)
				endcase
			end
			3'b001: begin
				case(cond)
					3'b000: 	out = 1'b0;			//jt.true 		-> sempre pula
					3'b001: 	out = ~S;			//jt.neg		-> pula se (S == 1)
					3'b010: 	out = ~Z;			//jt.zero		-> pula se (Z == 1)
					3'b100: 	out = ~C;			//jt.carry		-> pula se (C == 1)
					3'b101: 	out = nand(S, Z);	//jt.negzero	-> pula se ((S && Z) == 1)
					3'b111: 	out = ~O;			//jt.overflow	-> pula se (O == 1)
				endcase
			end
			3'b010: 			out = 1'b0;			//j L			-> sempre pula
			3'b011: 			out = 1'b0;			//jal b 		-> sempre pula
			3'b100: 			out = 1'b0;			//jr b 			-> sempre pula
		endcase
	end

endmodule