//Módulo do testador de flags (combinacional)
module tester_flags(RESET, O, S, C, Z, cond, OP_TF, out);

	input 	wire		RESET, O, S, C, Z;
	input 	wire[2:0]	cond, OP_TF;
	output 	reg			out;

	always @(posedge RESET)
		out <= 1'b1;

	/*	
		A saída out é usada como seleção para o mux MX_PC.
		Quando out = 0, o pulo é executado. (No MX_PC, a entrada da ALU é selecionada)
		Quando out = 1, o pulo não é executado. (No MX_PC, a entrada do somador é selecionada)
	*/
	always @(*) begin
		case(OP_TF)
			3'b111: 			out = 1'b1; 		//outras instr.	-> nunca pula
			3'b000: begin
				case(cond)
					3'b000: 	out = 1'b1;			//jf.true 		-> nunca pula
					3'b001: 	out = S;			//jf.neg		-> pula se (S == 0)
					3'b010: 	out = Z;			//jf.zero		-> pula se (Z == 0)
					3'b100: 	out = C;			//jf.carry		-> pula se (C == 0)
					3'b101: 	out = S & Z;		//jf.negzero	-> pula se ((S && Z) == 0)
					3'b111: 	out = O;			//jf.overflow	-> pula se (O == 0)
				endcase
			end
			3'b001: begin
				case(cond)
					3'b000: 	out = 1'b0;			//jt.true 		-> sempre pula
					3'b001: 	out = ~S;			//jt.neg		-> pula se (S == 1)
					3'b010: 	out = ~Z;			//jt.zero		-> pula se (Z == 1)
					3'b100: 	out = ~C;			//jt.carry		-> pula se (C == 1)
					3'b101: 	out = ~(S & Z);		//jt.negzero	-> pula se ((S && Z) == 1)
					3'b111: 	out = ~O;			//jt.overflow	-> pula se (O == 1)
				endcase
			end
			3'b010: 			out = 1'b0;			//j L			-> sempre pula
			3'b011: 			out = 1'b0;			//jal b 		-> sempre pula
			3'b100: 			out = 1'b0;			//jr b 			-> sempre pula
		endcase
	end

endmodule
