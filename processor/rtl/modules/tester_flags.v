//Módulo do testador de flags (combinacional)
module tester_flags(RESET, O, S, C, Z, cond, OP_TF, out);

	input 	wire		RESET, O, S, C, Z;
	input 	wire[2:0]	cond, OP_TF;
	output 	reg	[1:0]	out;

	always @(posedge RESET)
		out <= 2'b10;

	/*	
		A saída out é usada como seleção para o mux MX_PC.
		Quando out = 00, o pulo é executado. (No MX_PC, a entrada do extensor de sinal é selecionada)
		Quando out = 01, o pulo é executado. (No MX_PC, a entrada do banco de registradores é selecionada)
		Quando out = 10, o pulo não é executado. (No MX_PC, a entrada do somador é selecionada)
	*/
	always @(*) begin
		case(OP_TF)
			3'b111: 			out = 2'b10; 					//outras instr.	-> nunca pula
			3'b000: begin
				case(cond)
					3'b000: 	out = 2'b10;					//jf.true 		-> nunca pula
					3'b001: 	out = S ? 2'b10 : 2'b00;		//jf.neg		-> pula se (S == 0)
					3'b010: 	out = Z ? 2'b10 : 2'b00;		//jf.zero		-> pula se (Z == 0)
					3'b100: 	out = C ? 2'b10 : 2'b00;		//jf.carry		-> pula se (C == 0)
					3'b101: 	out = (S | Z) ? 2'b10 : 2'b00;	//jf.negzero	-> pula se ((S || Z) == 0)
					3'b111: 	out = O ? 2'b10 : 2'b00;		//jf.overflow	-> pula se (O == 0)
				endcase
			end
			3'b001: begin
				case(cond)
					3'b000: 	out = 2'b00;					//jt.true 		-> sempre pula
					3'b001: 	out = S ? 2'b00 : 2'b10;		//jt.neg		-> pula se (S == 1)
					3'b010: 	out = Z ? 2'b00 : 2'b10;		//jt.zero		-> pula se (Z == 1)
					3'b100: 	out = C ? 2'b00 : 2'b10;		//jt.carry		-> pula se (C == 1)
					3'b101: 	out = (S | Z) ? 2'b00 : 2'b10;	//jt.negzero	-> pula se ((S || Z) == 1)
					3'b111: 	out = O ? 2'b00 : 2'b10;		//jt.overflow	-> pula se (O == 1)
				endcase
			end
			3'b010: 			out = 2'b00;					//j L			-> sempre pula (SE)
			3'b011: 			out = 2'b01;					//jal b 		-> sempre pula (RB)
			3'b100: 			out = 2'b01;					//jr b 			-> sempre pula (RB)
			default:			out = 2'b10;
		endcase
	end

endmodule
